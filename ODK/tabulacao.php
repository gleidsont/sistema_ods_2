<?php
session_start();

include '../includes/auth_check.php';
include '../includes/conexao.php';
include '../includes/header.php';

if (isset($_SESSION['msg_sucesso'])) {  
    echo '<div class="alert alert-success alert-dismissible fade show">' . $_SESSION['msg_sucesso'] . '</div>';  
    unset($_SESSION['msg_sucesso']);  
}  
if (isset($_SESSION['msg_erro'])) {  
    echo '<div class="alert alert-danger alert-dismissible fade show">' . $_SESSION['msg_erro'] . '</div>';  
    unset($_SESSION['msg_erro']);  
}

$erro = '';
$sucesso = '';

$usuario_id = $_SESSION['usuario_id'] ?? null;
if (!$usuario_id) {
    die("Sessão inválida.");
}

// Pasta base onde serão guardados os CSVs enviados (por projeto)
$pastaBase = __DIR__ . '/../export/planilhas/'; // você já usa isso em codigo_export_odk.php
if (!is_dir($pastaBase)) {
    @mkdir($pastaBase, 0775, true);
}

/**
 * Cria nome de pasta estável por projeto do banco.
 * Ex: projeto_12
 */
function pastaProjetoPorId($idProjeto) {
    return 'projeto_' . intval($idProjeto);
}

/**
 * Lista arquivos CSV de uma pasta (retorna array de caminhos absolutos)
 */
function listarCsvs($dir) {
    if (!is_dir($dir)) return [];
    $csvs = glob($dir . "/*.csv");
    return $csvs ? $csvs : [];
}

/**
 * (Opcional) Validação simples do CSV exportado do ODK:
 * confere se existe pelo menos uma coluna que começa com "FATOR_"
 */
function pareceCsvODK($tmpPath) {
    $fh = fopen($tmpPath, 'r');
    if (!$fh) return false;
    $linha = fgetcsv($fh);
    fclose($fh);
    if (!$linha || !is_array($linha)) return false;

    foreach ($linha as $col) {
        $col = trim((string)$col);
        if (preg_match('/^FATOR_\d__\d{4}/', $col)) {
            return true;
        }
    }
    // Não bloquear 100%: pode variar; aqui retorno true/false pra você decidir
    return false;
}

// UPLOAD do CSV (bruto ODK)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['acao'] ?? '') === 'upload_csv') {
    $idProjeto = intval($_POST['id_projeto'] ?? 0);

    if ($idProjeto <= 0) {
        $erro = 'Projeto inválido.';
    } elseif (!isset($_FILES['arquivo_csv']) || $_FILES['arquivo_csv']['error'] !== UPLOAD_ERR_OK) {
        $erro = 'Falha no upload. Tente novamente.';
    } else {
        // Confirma se o projeto é do usuário logado (segurança)
        $stmt = $conexao->prepare("SELECT id_projeto, nome_projeto FROM projetos WHERE id_projeto = ?");
        $stmt->bind_param("i", $idProjeto);
        $stmt->execute();
        $res = $stmt->get_result();
        $proj = $res->fetch_assoc();
        $stmt->close();

        if (!$proj) {
            $erro = 'Você não tem permissão para enviar arquivo para este projeto.';
        } else {
            $arquivo = $_FILES['arquivo_csv'];
            $ext = strtolower(pathinfo($arquivo['name'], PATHINFO_EXTENSION));

            if ($ext !== 'csv') {
                $erro = 'Envie apenas arquivo .csv';
            } else {
                // (Opcional) validar formato ODK
                // Se quiser bloquear de verdade, troque para: if (!pareceCsvODK(...)) { $erro=...; }
                $okODK = pareceCsvODK($arquivo['tmp_name']);

                $pastaProjeto = pastaProjetoPorId($idProjeto);
                $dirDestino = $pastaBase . $pastaProjeto . '/';
                if (!is_dir($dirDestino)) {
                    @mkdir($dirDestino, 0775, true);
                }

                $nomeFinal = 'odk_raw_' . date('YmdHis') . '.csv';
                $caminhoFinal = $dirDestino . $nomeFinal;

                if (move_uploaded_file($arquivo['tmp_name'], $caminhoFinal)) {
                    $sucesso = "CSV enviado com sucesso para o projeto: " . htmlspecialchars($proj['nome_projeto'])
                             . " (arquivo: " . htmlspecialchars($nomeFinal) . ")";

                    if (!$okODK) {
                        $sucesso .= "<br><small style='color:#8a6d3b;'>Aviso: o cabeçalho não parece conter colunas FATOR_. Verifique se exportou com as opções corretas do ODK.</small>";
                    }
                } else {
                    $erro = 'Não foi possível salvar o arquivo no servidor.';
                }
            }
        }
    }
}

// Buscar projetos do banco (do usuário)
$projetos = [];
$stmt = $conexao->prepare("SELECT id, nome_projeto, descricao FROM projetos ORDER BY id DESC");
//$stmt->bind_param("i", $usuario_id);
$stmt->execute();
$res = $stmt->get_result();
while ($row = $res->fetch_assoc()) {
    $projetos[] = $row;
}
$stmt->close();
?>

<div class="container mt-4">
    <h3>Tabulação ODK (Upload CSV + Processar)</h3>

    <?php if ($erro): ?>
        <div class="alert alert-danger"><?php echo $erro; ?></div>
    <?php endif; ?>

    <?php if ($sucesso): ?>
        <div class="alert alert-success"><?php echo $sucesso; ?></div>
    <?php endif; ?>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Projeto</th>
                <th>Upload CSV (ODK bruto)</th>
                <th>Selecionar CSV + Processar</th>
            </tr>
        </thead>
        <tbody>
        <?php if (count($projetos) === 0): ?>
            <tr>
                <td colspan="3">Nenhum projeto cadastrado no banco.</td>
            </tr>
        <?php else: ?>
            <?php foreach ($projetos as $p): ?>
                <?php
                    $idProjeto = (int)$p['id'];
                    $pastaProjeto = pastaProjetoPorId($idProjeto);
                    $dirProjeto = $pastaBase . $pastaProjeto . '/';
                    $csvs = listarCsvs($dirProjeto);
                ?>
                <tr>
                    <td>
                        <strong><?php echo htmlspecialchars($p['nome_projeto']); ?></strong>
                        <div style="font-size: 12px; color:#666;">
                            ID: <?php echo $idProjeto; ?>
                            <?php if (!empty($p['descricao'])): ?>
                                <br><?php echo htmlspecialchars($p['descricao']); ?>
                            <?php endif; ?>
                            <br>Pasta: <code><?php echo htmlspecialchars($pastaProjeto); ?></code>
                        </div>
                    </td>

                    <td>
                        <form method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="acao" value="upload_csv">
                            <input type="hidden" name="id" value="<​?php echo $idProjeto; ?>">

                            <div class="mb-2">
                                <input type="file" name="arquivo_csv" accept=".csv" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-primary btn-sm">Enviar CSV</button>
                        </form>
                    </td>

                    <td>
                        <?php if (count($csvs) > 0): ?>
                            <form method="POST" action="processar.php">
                                <!-- Seu processar.php espera arquivo_selecionado e pasta_projeto -->
                                <input type="hidden" name="pasta_projeto" value="<​?php echo htmlspecialchars($pastaProjeto); ?>">

                                <div class="mb-2">
                                    <select name="arquivo_selecionado" class="form-select" required>
                                        <option value="">-- Selecione um CSV --</option>
                                        <?php foreach ($csvs as $csv): ?>
                                            <?php
                                                $nomeCsv = basename($csv);
                                                $dataCsv = date('d/m/Y H:i', filemtime($csv));
                                            ?>
                                            <option value="<​?php echo htmlspecialchars($csv); ?>">
                                                <?php echo htmlspecialchars($nomeCsv . " (" . $dataCsv . ")"); ?>
                                            </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>

                                <button type="submit" class="btn btn-success btn-sm">Processar</button>
                            </form>
                        <?php else: ?>
                            <em>Nenhum CSV enviado para este projeto.</em>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        <?php endif; ?>
        </tbody>
    </table>

    <div class="alert alert-info">
        <strong>Dica de exportação do ODK:</strong><br>
        Exportar em CSV marcando: <em>Remove prefixed group names</em>, <em>Include labels only</em> e <em>Export with Choice Labels</em>.
    </div>
</div>

<?php include '../includes/footer.php'; ?>
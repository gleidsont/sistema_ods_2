<?php
session_start();
include '../includes/auth_check.php';
include '../includes/conexao.php';
include '../includes/header.php';

$usuario_id = $_SESSION['usuario_id'] ?? null;
if (!$usuario_id) die("Sessão inválida.");

$pastaBase = __DIR__ . '/../export/planilhas/';

// Mensagens flash
if (!empty($_SESSION['msg_sucesso'])) {
    echo '<div class="alert alert-success">' . $_SESSION['msg_sucesso'] . '</div>';
    unset($_SESSION['msg_sucesso']);
}
if (!empty($_SESSION['msg_erro'])) {
    echo '<div class="alert alert-danger">' . $_SESSION['msg_erro'] . '</div>';
    unset($_SESSION['msg_erro']);
}

// Buscar projetos do usuário
$projetos = [];
$stmt = $conexao->prepare("SELECT id, nome_projeto, descricao FROM projetos ORDER BY id DESC");
$stmt->execute();
$res = $stmt->get_result();
while ($row = $res->fetch_assoc()) {
    $projetos[] = $row;
}
$stmt->close();
?>

<div class="container mt-4">
    <h3>Tabulação ODK</h3>

    <table class="table table-bordered align-middle">
        <thead class="table-dark">
            <tr>
                <th>Projeto</th>
                <th>1. Upload CSV</th>
                <th>2. Processar</th>
            </tr>
        </thead>
        <tbody>
        <?php if (empty($projetos)): ?>
            <tr><td colspan="3">Nenhum projeto encontrado.</td></tr>
        <?php else: ?>
            <?php foreach ($projetos as $p):
                $pid      = (int) $p['id'];
                $pasta    = 'projeto_' . $pid;
                $dir      = $pastaBase . $pasta . '/';
                $csvs     = is_dir($dir) ? (glob($dir . '*.csv') ?: []) : [];
            ?>
            <tr>
                <td>
                    <strong><?php echo htmlspecialchars($p['nome_projeto']); ?></strong><br>
                    <small class="text-muted">ID: <?php echo $pid; ?> &mdash; <code><?php echo $pasta; ?></code></small>
                </td>

                <td>
                    <?php
                    echo '<form method="POST" action="upload_csv.php" enctype="multipart/form-data">';
                    echo '<input type="hidden" name="id_projeto" value="' . $pid . '">';
                    echo '<input type="file" name="arquivo_csv" accept=".csv" class="form-control mb-2" required>';
                    echo '<button type="submit" class="btn btn-primary btn-sm">Enviar CSV</button>';
                    echo '</form>';
                    ?>
                </td>

                <td>
                    <?php if (!empty($csvs)): ?>
                    <?php
                    echo '<form method="POST" action="processar.php">';
                    echo '<input type="hidden" name="pasta_projeto" value="' . htmlspecialchars($pasta) . '">';
                    echo '<select name="arquivo_selecionado" class="form-select mb-2" required>';
                    echo '<option value="">-- Selecione --</option>';
                    foreach ($csvs as $csv) {
                        $nomeCsv = basename($csv);
                        $dataCsv = date('d/m/Y H:i', filemtime($csv));
                        echo '<option value="' . htmlspecialchars($csv) . '">' . htmlspecialchars($nomeCsv) . ' (' . $dataCsv . ')</option>';
                    }
                    echo '</select>';
                    echo '<button type="submit" class="btn btn-success btn-sm">Processar</button>';
                    echo '</form>';
                    ?>
                    <?php else: ?>
                        <em class="text-muted">Nenhum CSV enviado.</em>
                    <?php endif; ?>
                </td>
            </tr>
            <?php endforeach; ?>
        <?php endif; ?>
        </tbody>
    </table>
</div>

<?php include '../includes/footer.php'; ?>
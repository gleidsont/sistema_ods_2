<?php
session_start();
include '../includes/auth_check.php';
include '../includes/header.php';
include '../includes/conexao.php';
include_once '../includes/logs.php';

$id_usuario = $_SESSION['usuario_id'];
$mensagem = '';

// Carrega os projetos do usuário
$projetos = $conexao->query("SELECT id, nome_projeto FROM projetos WHERE id_usuario = $id_usuario");

// Se foi submetido
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['ods_ids'])) {
    $projeto_id = $_POST['projeto_id'];
    $ods_ids_novos = $_POST['ods_ids'] ?? [];

    // Pega os que já estavam no banco
    $result = $conexao->query("SELECT id_ods FROM projetos_ods WHERE id_projeto = $projeto_id");
    $ods_ids_anteriores = [];
    while ($row = $result->fetch_assoc()) {
        $ods_ids_anteriores[] = $row['id_ods'];
    }

    // Calcula os que foram removidos
    $removidos = array_diff($ods_ids_anteriores, $ods_ids_novos);
    foreach ($removidos as $id_ods) {
        $stmt = $conexao->prepare("DELETE FROM projetos_ods WHERE id_projeto = ? AND id_ods = ?");
        $stmt->bind_param("ii", $projeto_id, $id_ods);
        $stmt->execute();
        registrar_log($conexao, $id_usuario, 'DELETE', 'projetos_ods', $projeto_id, "Desassociou ODS ID $id_ods");
    }

    // Calcula os que foram adicionados
    $adicionados = array_diff($ods_ids_novos, $ods_ids_anteriores);
    foreach ($adicionados as $id_ods) {
        $stmt = $conexao->prepare("INSERT INTO projetos_ods (id_projeto, id_ods) VALUES (?, ?)");
        $stmt->bind_param("ii", $projeto_id, $id_ods);
        $stmt->execute();
        registrar_log($conexao, $id_usuario, 'INSERT', 'projetos_ods', $projeto_id, "Associou ODS ID $id_ods");
    }

    $mensagem = "Associações atualizadas com sucesso!";
}

$projeto_selecionado = $_GET['projeto_id'] ?? $_POST['projeto_id'] ?? null;

$ods_associadas = [];
if ($projeto_selecionado) {
    $result = $conexao->query("SELECT id_ods FROM projetos_ods WHERE id_projeto = $projeto_selecionado");
    while ($row = $result->fetch_assoc()) {
        $ods_associadas[] = $row['id_ods'];
    }
}

// Carrega todas as ODS
$ods = $conexao->query("SELECT * FROM ods ORDER BY CAST(SUBSTRING_INDEX(numero_item, '.', 1) AS UNSIGNED),
    CAST(SUBSTRING_INDEX(numero_item, '.', -1) AS UNSIGNED) ASC");
?>

<div class="container mt-4">
    <h3>Associar Fatores a Projeto</h3>

    <?php if ($mensagem): ?>
        <div class="alert alert-success"><?php echo $mensagem; ?></div>
    <?php endif; ?>

    <form method="POST">
    <div class="form-group mb-3">
        <label>Escolha o Projeto:</label>
        <select name="projeto_id" class="form-control" onchange="window.location.href='?projeto_id=' + this.value;" required>
            <option value="">Selecione...</option>
            <?php
            mysqli_data_seek($projetos, 0);
            while ($proj = $projetos->fetch_assoc()): ?>
                <option value="<?php echo $proj['id']; ?>" <?php echo ($projeto_selecionado == $proj['id']) ? 'selected' : ''; ?>>
                    <?php echo $proj['nome_projeto']; ?>
                </option>
            <?php endwhile; ?>
        </select>
    </div>

    <!-- Campo oculto para manter projeto selecionado no POST -->
    <input type="hidden" name="projeto_id" value="<?php echo $projeto_selecionado; ?>">

    <?php
    $sql = "SELECT DISTINCT imagem, numero_ods, nome_ods FROM ods ORDER BY numero_ods ASC";
    $resultado = $conexao->query($sql);

    function otimizarImagem($caminho_original, $qualidade = 70) {
        $base = "../assets/img/";
        if (!file_exists($base . $caminho_original)) return false;
        $extensao = strtolower(pathinfo($base . $caminho_original, PATHINFO_EXTENSION));
        $nome_webp = str_replace(".$extensao", ".webp", $base . $caminho_original);
        if (file_exists($nome_webp)) {
            return (filesize($nome_webp) < filesize($base . $caminho_original)) ? $nome_webp : $base . $caminho_original;
        }
        $info = getimagesize($base . $caminho_original);
        $largura_desejada = 300;
        list($largura_orig, $altura_orig) = $info;
        $nova_altura = ($altura_orig / $largura_orig) * $largura_desejada;

        if ($extensao == "jpg" || $extensao == "jpeg") {
            $imagem = imagecreatefromjpeg($base . $caminho_original);
        } elseif ($extensao == "png") {
            $imagem = imagecreatefrompng($base . $caminho_original);
        } else {
            return false;
        }

        $imagem_redimensionada = imagescale($imagem, $largura_desejada, $nova_altura);
        imagewebp($imagem_redimensionada, $nome_webp, $qualidade);
        imagedestroy($imagem);
        imagedestroy($imagem_redimensionada);
        return $nome_webp;
    }

    if ($projeto_selecionado && $resultado->num_rows > 0):
        while ($grupo = $resultado->fetch_assoc()):
            $numero_ods = $grupo['numero_ods'];
            $imagem = $grupo['imagem'];
            $nome_ods = $grupo['nome_ods'];

            echo "<div class='group-container mb-2'>";
            echo "<div class='group-header' onclick='toggleGroup(this)'>";
            echo "<div class='group-title'>";
            $otimizada = otimizarImagem($imagem);
            echo "<img src='{$otimizada}' class='img-preview_2' alt='Ícone do Grupo'>";
            echo "<strong>ODS {$numero_ods} - {$nome_ods}</strong>";
            echo "</div><span class='group-arrow'>></span></div>";
            echo "<div class='group-items'>";

            $sql_ods = "SELECT id, numero_item, fatores, imagem_ameaca, imagem_vulnerabilidade, imagem_resiliencia, imagem_sagrado 
                        FROM ods WHERE numero_ods = '$numero_ods'
                        ORDER BY CAST(SUBSTRING_INDEX(numero_item, '.', 1) AS UNSIGNED),
                                 CAST(SUBSTRING_INDEX(numero_item, '.', -1) AS UNSIGNED)";
            $result_ods = $conexao->query($sql_ods);

            while ($row = $result_ods->fetch_assoc()):
                $checked = in_array($row['id'], $ods_associadas) ? 'checked' : '';
                echo "<div class='ods-card'>";
                echo "<label class='form-check-label'>";
                echo "<input class='form-check-input' type='checkbox' name='ods_ids[]' value='{$row['id']}' {$checked}>";
                echo "<strong>{$row['numero_item']}</strong> - {$row['fatores']}";
                echo "</label>";

                echo "<div class='mt-2 d-flex align-items-center flex-wrap'>";
                $tipos = [
                    'A' => ['Ameaça', otimizarImagem($row['imagem_ameaca'])],
                    'V' => ['Vulnerabilidade', otimizarImagem($row['imagem_vulnerabilidade'])],
                    'R' => ['Resiliência', otimizarImagem($row['imagem_resiliencia'])],
                    'S' => ['Sagrado', otimizarImagem($row['imagem_sagrado'])]
                ];
                foreach ($tipos as $tipo => $dados):
                    echo "<div class='me-3 mb-2'>";
                    echo "<img src='{$dados[1]}' class='img-preview' title='{$dados[0]}'>";
                    echo "<span class='tipo-imagem-label'>{$dados[0]}</span>";
                    echo "</div>";
                endforeach;

                echo "</div>";
                echo "</div>";
            endwhile;

            echo "</div></div>";
        endwhile;
    ?>
        <!-- <button type="submit" class="btn btn-primary mt-3">💾 Salvar Associações</button> -->
        <!-- Botão flutuante fixo -->
        <button type="submit" class="btn btn-success btn-lg btn-floating"> 💾 Salvar </button>
    <?php endif; ?>
</form>
</div>

<script>
function toggleGroup(element) {
    const groupContainer = element.closest('.group-container');
    const groupItems = groupContainer.querySelector('.group-items');
    const arrow = groupContainer.querySelector('.group-arrow');

    if (groupItems.style.display === 'block') {
        groupItems.style.display = 'none';
        arrow.classList.remove('rotated');
    } else {
        groupItems.style.display = 'block';
        arrow.classList.add('rotated');
    }
}

document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.group-container').forEach(group => {
        const checkboxes = group.querySelectorAll('input[type="checkbox"]:checked');
        if (checkboxes.length > 0) {
            group.querySelector('.group-items').style.display = 'block';
            group.querySelector('.group-arrow').classList.add('rotated');
        }
    });
});
</script>

<?php include '../includes/footer.php'; ?>
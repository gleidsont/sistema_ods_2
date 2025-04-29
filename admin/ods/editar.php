<?php
session_start();
include '../../includes/auth_check.php';
include '../../includes/header.php';

if ($_SESSION['usuario_perfil'] !== 'admin') {
    header('Location: ../../index.php');
    exit;
}

include '../../includes/conexao.php';

$id = $_GET['id'] ?? null;
if (!$id) {
    header('Location: listar.php');
    exit;
}

$stmt = $conexao->prepare("SELECT * FROM ods WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$dados = $stmt->get_result()->fetch_assoc();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $numero = $_POST['numero_item'];
    $nome = $_POST['nome_ods'];
    $metas = $_POST['metas_ipea'];

    $imagens = ['ameaca', 'vulnerabilidade', 'resiliencia', 'sagrado'];
    $caminhos = [];

    foreach ($imagens as $tipo) {
        $campo = "imagem_$tipo";
        if (!empty($_FILES[$campo]["name"])) {
            $nomeArquivo = 'ODS_' . $numero . '_' . strtoupper(substr($tipo, 0, 1)) . '.' . pathinfo($_FILES[$campo]["name"], PATHINFO_EXTENSION);
            $destino = '../../assets/img/' . $nomeArquivo;
            move_uploaded_file($_FILES[$campo]["tmp_name"], $destino);
            $caminhos[$tipo] = $nomeArquivo;
        } else {
            $caminhos[$tipo] = $dados[$campo]; // mantém a imagem antiga
        }
    }

    $stmt = $conexao->prepare("UPDATE ods SET numero_item=?, nome_ods=?, metas_ipea=?, 
        imagem_ameaca=?, imagem_vulnerabilidade=?, imagem_resiliencia=?, imagem_sagrado=?
        WHERE id=?");
    $stmt->bind_param("issssssi", $numero, $nome, $metas, $caminhos['ameaca'], $caminhos['vulnerabilidade'], $caminhos['resiliencia'], $caminhos['sagrado'], $id);
    $stmt->execute();

    header("Location: listar.php");
    exit;
}
?>

<div class="container mt-4">
    <h3>Editar ODS</h3>
    <form method="POST" enctype="multipart/form-data">
        <div class="form-group mb-3">
            <label>Número do Item:</label>
            <input type="number" name="numero_item" class="form-control" value="<?php echo $dados['numero_item']; ?>" required>
        </div>
        <div class="form-group mb-3">
            <label>Nome da ODS:</label>
            <input type="text" name="nome_ods" class="form-control" value="<?php echo $dados['nome_ods']; ?>" required>
        </div>
        <div class="form-group mb-3">
            <label>Metas IPEA:</label>
            <textarea name="metas_ipea" class="form-control"><?php echo $dados['metas_ipea']; ?></textarea>
        </div>

        <?php
        $labels = ['Ameaça' => 'ameaca', 'Vulnerabilidade' => 'vulnerabilidade', 'Resiliência' => 'resiliencia', 'Sagrado' => 'sagrado'];
        foreach ($labels as $nome => $campo): ?>
            <div class="form-group mb-3">
                <label>Imagem <?php echo $nome; ?>:</label>
                <?php if ($dados["imagem_$campo"]): ?>
                    <div><img src='../../assets/img/<?php echo $dados["imagem_$campo"]; ?>' width='80'></div>
                <?php endif; ?>
                <input type="file" name="imagem_<?php echo $campo; ?>" class="form-control">
            </div>
        <?php endforeach; ?>

        <button type="submit" class="btn btn-primary">Salvar Alterações</button>
    </form>
</div>

<?php include '../../includes/footer.php'; ?>
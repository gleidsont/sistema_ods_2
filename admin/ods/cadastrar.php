<?php
session_start();
include '../../includes/auth_check.php';
include '../../includes/conexao.php';

if ($_SESSION['usuario_perfil'] !== 'admin') {
    header('Location: ../../index.php');
    exit;
}
include '../../includes/header.php';


$mensagem = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $numero = $_POST['numero_item'];
    $nome = $_POST['nome_ods'];
    $metas = $_POST['metas_ipea'];

    // Upload de imagens
    $imagens = ['ameaca', 'vulnerabilidade', 'resiliencia', 'sagrado'];
    $caminhos = [];

    foreach ($imagens as $tipo) {
        if (!empty($_FILES["imagem_$tipo"]["name"])) {
            $nomeArquivo = 'ODS_' . $numero . '_' . strtoupper(substr($tipo, 0, 1)) . '.' . pathinfo($_FILES["imagem_$tipo"]["name"], PATHINFO_EXTENSION);
            $destino = '../../assets/img/' . $nomeArquivo;
            move_uploaded_file($_FILES["imagem_$tipo"]["tmp_name"], $destino);
            $caminhos[$tipo] = $nomeArquivo;
        } else {
            $caminhos[$tipo] = '';
        }
    }

    $stmt = $conexao->prepare("INSERT INTO ods (numero_item, nome_ods, metas_ipea, imagem_ameaca, imagem_vulnerabilidade, imagem_resiliencia, imagem_sagrado)
                               VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("issssss", $numero, $nome, $metas, $caminhos['ameaca'], $caminhos['vulnerabilidade'], $caminhos['resiliencia'], $caminhos['sagrado']);
    $stmt->execute();

    $mensagem = "ODS cadastrada com sucesso!";
}
?>

<div class="container mt-4">
    <h3>Cadastrar Novo Fator de ODS</h3>
    <?php if ($mensagem): ?>
        <div class="alert alert-success"><?php echo $mensagem; ?></div>
    <?php endif; ?>
    <form method="POST" enctype="multipart/form-data">
        <div class="form-group mb-3">
            <label>Número do Item:</label>
            <input type="number" name="numero_item" class="form-control" required>
        </div>
        <div class="form-group mb-3">
            <label>Nome do Fator ODS:</label>
            <input type="text" name="nome_ods" class="form-control" required>
        </div>
        <div class="form-group mb-3">
            <label>Metas IPEA:</label>
            <textarea name="metas_ipea" class="form-control" rows="3"></textarea>
        </div>
        <?php
        $labels = ['Ameaça' => 'ameaca', 'Vulnerabilidade' => 'vulnerabilidade', 'Resiliência' => 'resiliencia', 'Sagrado' => 'sagrado'];
        foreach ($labels as $nome => $campo): ?>
            <div class="form-group mb-3">
                <label>Imagem <?php echo $nome; ?>:</label>
                <input type="file" name="imagem_<?php echo $campo; ?>" class="form-control">
            </div>
        <?php endforeach; ?>
        <button type="submit" class="btn btn-success">Cadastrar</button>
        <button type="reset" class="btn btn-warning">Apagar dados</button>
        <a href="/sistema_ods_2/admin/ods/listar.php" class="btn btn-danger">Cancelar</a>
    </form>
</div>

<?php include '../../includes/footer.php'; ?>
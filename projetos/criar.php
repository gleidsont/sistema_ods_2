<?php
session_start();
include '../includes/auth_check.php';
include '../includes/header.php';
include '../includes/conexao.php';

$mensagem = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = $_POST['nome_projeto'];
    $descricao = $_POST['descricao'];
    $usuario_id = $_SESSION['usuario_id'];

    $stmt = $conexao->prepare("INSERT INTO projetos (id_usuario, nome_projeto, descricao) VALUES (?, ?, ?)");
    $stmt->bind_param("iss", $usuario_id, $nome, $descricao);
    if ($stmt->execute()) {
        header("Location: listar.php");
        exit;
    } else {
        $mensagem = "Erro ao salvar o projeto.";
    }
}
?>

<div class="container mt-4">
    <h3>Criar Novo Projeto</h3>
    <?php if ($mensagem): ?>
        <div class="alert alert-danger"><?php echo $mensagem; ?></div>
    <?php endif; ?>
    <form method="POST">
        <div class="form-group mb-3">
            <label for="nome_projeto">Nome do Projeto:</label>
            <input type="text" name="nome_projeto" class="form-control" required>
        </div>
        <div class="form-group mb-3">
            <label for="descricao">Descrição:</label>
            <textarea name="descricao" class="form-control" rows="3"></textarea>
        </div>
        <button type="submit" class="btn btn-success">Salvar</button>
    </form>
</div>

<?php include '../includes/footer.php'; ?>
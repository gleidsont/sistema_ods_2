<?php
session_start();
include '../includes/auth_check.php';

include '../includes/conexao.php';
include_once '../includes/logs.php';

$id_projeto = $_GET['id'] ?? null;
if (!$id_projeto) {
    header("Location: listar.php");
    exit;
}

$is_admin = $_SESSION['usuario_perfil'] === 'admin';
$id_usuario = $_SESSION['usuario_id'];

// Verifica se o projeto pertence ao usuário ou se é admin
$sql = $is_admin
    ? "SELECT * FROM projetos WHERE id = ?"
    : "SELECT * FROM projetos WHERE id = ? AND id_usuario = ?";

$stmt = $conexao->prepare($sql);
if ($is_admin) {
    $stmt->bind_param("i", $id_projeto);
} else {
    $stmt->bind_param("ii", $id_projeto, $id_usuario);
}
$stmt->execute();
$projeto = $stmt->get_result()->fetch_assoc();

if (!$projeto) {
    echo "<div class='container mt-4 alert alert-danger'>Projeto não encontrado ou acesso negado.</div>";
    include '../includes/footer.php';
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = trim($_POST['nome_projeto']);
    $descricao = trim($_POST['descricao']);

    $stmt = $conexao->prepare("UPDATE projetos SET nome_projeto = ?, descricao = ? WHERE id = ?");
    $stmt->bind_param("ssi", $nome, $descricao, $id_projeto);
    $stmt->execute();

    registrar_log($conexao, $_SESSION['usuario_id'], 'UPDATE', 'projetos', $id_projeto, "Projeto editado: $nome");
    header("Location: listar.php");
    exit;
}
include '../includes/header.php';
?>

<div class="container mt-4">
    <h3>Editar Projeto</h3>

    <form method="POST">
        <div class="mb-3">
            <label for="nome_projeto" class="form-label">Nome do Projeto</label>
            <input type="text" name="nome_projeto" id="nome_projeto" class="form-control" required value="<?= htmlspecialchars($projeto['nome_projeto']); ?>">
        </div>
        <div class="mb-3">
            <label for="descricao" class="form-label">Descrição</label>
            <textarea name="descricao" id="descricao" rows="4" class="form-control"><?= htmlspecialchars($projeto['descricao']); ?></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Salvar Alterações</button>
        <a href="listar.php" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

<?php include '../includes/footer.php'; ?>
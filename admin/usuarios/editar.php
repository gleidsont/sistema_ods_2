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
    header('Location: gerenciar.php');
    exit;
}

$stmt = $conexao->prepare("SELECT nome, email, perfil FROM usuarios WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$usuario = $stmt->get_result()->fetch_assoc();

if (!$usuario) {
    echo "<div class='container mt-4 alert alert-danger'>Usuário não encontrado.</div>";
    include '../../includes/footer.php';
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = $_POST['nome'];
    $email = $_POST['email'];
    $perfil = $_POST['perfil'];

    $stmt = $conexao->prepare("UPDATE usuarios SET nome = ?, email = ?, perfil = ? WHERE id = ?");
    $stmt->bind_param("sssi", $nome, $email, $perfil, $id);
    $stmt->execute();

    header("Location: gerenciar.php");
    exit;
}
?>

<div class="container mt-4">
    <h3>Editar Usuário</h3>
    <form method="POST">
        <div class="form-group mb-3">
            <label>Nome:</label>
            <input type="text" name="nome" class="form-control" value="<?php echo $usuario['nome']; ?>" required>
        </div>
        <div class="form-group mb-3">
            <label>E-mail:</label>
            <input type="email" name="email" class="form-control" value="<?php echo $usuario['email']; ?>" required>
        </div>
        <div class="form-group mb-3">
            <label>Perfil:</label>
            <select name="perfil" class="form-control" required>
                <option value="usuario" <?php if ($usuario['perfil'] === 'usuario') echo 'selected'; ?>>Usuário</option>
                <option value="admin" <?php if ($usuario['perfil'] === 'admin') echo 'selected'; ?>>Admin</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Salvar Alterações</button>
        <a href="gerenciar.php" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

<?php include '../../includes/footer.php'; ?>
<?php
session_start();
include 'includes/conexao.php';

$token = $_GET['token'] ?? '';
$mensagem = '';
$validado = false;

// Verificar se o token é válido e não expirado
if ($token) {
    $stmt = $conexao->prepare("SELECT r.id, r.id_usuario, u.email FROM recuperacao_senhas r 
                               JOIN usuarios u ON r.id_usuario = u.id
                               WHERE r.token = ? AND r.validade > NOW()");
    $stmt->bind_param("s", $token);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows === 1) {
        $dados = $resultado->fetch_assoc();
        $validado = true;

        // Se o formulário foi enviado
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $novaSenha = password_hash($_POST['senha'], PASSWORD_DEFAULT);
            $stmt = $conexao->prepare("UPDATE usuarios SET senha = ? WHERE id = ?");
            $stmt->bind_param("si", $novaSenha, $dados['id_usuario']);
            $stmt->execute();

            // Exclui token após uso
            $stmt = $conexao->prepare("DELETE FROM recuperacao_senhas WHERE id = ?");
            $stmt->bind_param("i", $dados['id']);
            $stmt->execute();

            $mensagem = "Senha redefinida com sucesso. <a href='login.php'>Fazer login</a>";
            $validado = false;
        }
    } else {
        $mensagem = "Token inválido ou expirado.";
    }
} else {
    $mensagem = "Token ausente.";
}
?>

<?php include 'includes/header.php'; ?>
<div class="container mt-5" style="max-width: 500px;">
    <h3 class="text-center">Redefinir Senha</h3>
    <?php if ($mensagem): ?>
        <div class="alert alert-info"><?php echo $mensagem; ?></div>
    <?php endif; ?>

    <?php if ($validado): ?>
    <form method="POST" action="">
        <div class="form-group mb-3">
            <label for="senha">Nova senha:</label>
            <input type="password" name="senha" class="form-control" required />
        </div>
        <button type="submit" class="btn btn-success w-100">Atualizar senha</button>
    </form>
    <?php endif; ?>
</div>
<?php include 'includes/footer.php'; ?>
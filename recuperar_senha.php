<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


require 'autoload.php'; // PHPMailer via Composer
require 'vendor/PHPMailer/PHPMailer.php';
require 'vendor/PHPMailer/SMTP.php';
require 'vendor/PHPMailer/Exception.php';

include 'includes/conexao.php';

$mensagem = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    
    // Verifica se o e-mail está cadastrado
    $stmt = $conexao->prepare("SELECT id FROM usuarios WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $resultado = $stmt->get_result();

    if ($resultado->num_rows === 1) {
        $usuario = $resultado->fetch_assoc();
        $token = bin2hex(random_bytes(16));
        $validade = date("Y-m-d H:i:s", strtotime('+1 hour'));

        // Insere o token no banco
        $stmt = $conexao->prepare("INSERT INTO recuperacao_senhas (id_usuario, token, validade) VALUES (?, ?, ?)");
        $stmt->bind_param("iss", $usuario['id'], $token, $validade);
        $stmt->execute();

        // ENVIA O E-MAIL COM O LINK
        $mail = new PHPMailer(true);
        try {
            $mail->isSMTP();
            $mail->Host = 'smtp.gmail.com';
            $mail->SMTPAuth = true;
            $mail->Username = 'gleidsontavareslima@gmail.com'; // <- Trocar
            $mail->Password = 'yuhz xdur bwdv esnp';        // <- Trocar
            $mail->SMTPSecure = 'tls';
            $mail->Port = 587;

            $mail->setFrom('SEU_EMAIL@gmail.com', 'Sistema ODS');
            $mail->addAddress($email);
            $mail->isHTML(true);
            $mail->Subject = 'Recuperacao de senha';
            $link = "redefinir_senha.php?token=$token";
            $mail->Body = "Clique no link para redefinir sua senha: <a href='$link'>$link</a>
            ";

            $mail->send();
            $mensagem = "Enviamos um link de redefinição para seu e-mail.<br>
            IMPORTANTE: Verifique sua caixa de SPAM, pois o e-mail pode ter ido para esta pasta no seu e-mail! ";
        } catch (Exception $e) {
            $mensagem = "Erro ao enviar e-mail: {$mail->ErrorInfo}";
        }
    } else {
        $mensagem = "E-mail não encontrado em nossa base de dados. Faça o cadastro para utilizar a plataforma";
    }
}
?>

<?php include 'includes/header.php'; ?>
<div class="container mt-5" style="max-width: 500px;">
    <h3 class="text-center">Recuperar Senha</h3>
    <?php if ($mensagem): ?>
        <div class="alert alert-info"><?php echo $mensagem; ?></div>
    <?php endif; ?>
    <form method="POST" action="">
        <div class="form-group mb-3">
            <label for="email">Digite seu e-mail cadastrado:</label>
            <input type="email" name="email" class="form-control" required />
        </div>
        <button type="submit" class="btn btn-warning w-100">Enviar Link</button>
    </form>
</div>
<?php include 'includes/footer.php'; ?>
<?php
session_start();
include '../includes/auth_check.php';
include '../includes/conexao.php';

$mensagem = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = $_POST['nome_projeto'];
    $descricao = $_POST['descricao'];
    $usuario_id = $_SESSION['usuario_id'];

    $stmt = $conexao->prepare("INSERT INTO projetos (id_usuario, nome_projeto, descricao) VALUES (?, ?, ?)");
    $stmt->bind_param("iss", $usuario_id, $nome, $descricao);
    if ($stmt->execute()) {       
        $novo_id = $stmt->insert_id;
        registrar_log($conexao, $_SESSION['usuario_id'], 'INSERT', 'projetos', $novo_id, "Projeto criado: $nome");
        header("Location: listar.php");
        exit;
    } else {
        $mensagem = "Erro ao salvar o projeto.";
    }   
}
include '../includes/header.php';
?>

<?php include '../includes/footer.php'; ?>
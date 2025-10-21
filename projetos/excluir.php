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

// Remove associações antes
$stmt = $conexao->prepare("DELETE FROM projetos_ods WHERE id_projeto = ?");
$stmt->bind_param("i", $id_projeto);
$stmt->execute();
registrar_log($conexao, $_SESSION['usuario_id'], 'DELETE', 'projetos_ods', $id_projeto, "Associações ODS removidas do projeto");

// Remove projeto
$stmt = $conexao->prepare("DELETE FROM projetos WHERE id = ?");
$stmt->bind_param("i", $id_projeto);
$stmt->execute();
registrar_log($conexao, $_SESSION['usuario_id'], 'DELETE', 'projetos', $id_projeto, "Projeto excluído: " . $projeto['nome_projeto']);

header("Location: listar.php");
exit;
include '../includes/header.php';
?>
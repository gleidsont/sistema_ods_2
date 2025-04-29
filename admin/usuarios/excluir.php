<?php
session_start();
include '../../includes/auth_check.php';

if ($_SESSION['usuario_perfil'] !== 'admin') {
    header('Location: ../../index.php');
    exit;
}

include '../../includes/conexao.php';

$id = $_GET['id'] ?? null;
if (!$id) {
    header("Location: gerenciar.php");
    exit;
}

// Segurança extra: não excluir o próprio admin logado
if ($id == $_SESSION['usuario_id']) {
    header("Location: gerenciar.php?erro=selfdelete");
    exit;
}

$stmt = $conexao->prepare("DELETE FROM usuarios WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();

header("Location: gerenciar.php");
exit;
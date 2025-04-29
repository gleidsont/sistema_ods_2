<?php
session_start();
include '../../includes/auth_check.php';

if ($_SESSION['usuario_perfil'] !== 'admin') {
    header('Location: ../../index.php');
    exit;
}

include '../../includes/conexao.php';

$id = $_GET['id'] ?? null;
$acao = $_GET['acao'] ?? null;

if (!$id || !in_array($acao, ['bloquear', 'ativar'])) {
    header("Location: gerenciar.php");
    exit;
}

$novo_status = $acao === 'bloquear' ? 0 : 1;

// Impede auto-bloqueio
if ($id == $_SESSION['usuario_id']) {
    header("Location: gerenciar.php?erro=selfblock");
    exit;
}

$stmt = $conexao->prepare("UPDATE usuarios SET ativo = ? WHERE id = ?");
$stmt->bind_param("ii", $novo_status, $id);
$stmt->execute();

header("Location: gerenciar.php");
exit;
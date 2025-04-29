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
    header('Location: listar.php');
    exit;
}

// Pega os caminhos das imagens para excluir
$stmt = $conexao->prepare("SELECT imagem_ameaca, imagem_vulnerabilidade, imagem_resiliencia, imagem_sagrado FROM ods WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$resultado = $stmt->get_result()->fetch_assoc();

// Remove os arquivos de imagem se existirem
foreach ($resultado as $img) {
    if ($img && file_exists("../../assets/img/$img")) {
        unlink("../../assets/img/$img");
    }
}

// Exclui do banco
$stmt = $conexao->prepare("DELETE FROM ods WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();

header("Location: listar.php");
exit;
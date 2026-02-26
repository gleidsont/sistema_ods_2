<?php
session_start();
include '../includes/auth_check.php';
include '../includes/conexao.php';

header('Content-Type: text/html; charset=utf-8');

$usuario_id = $_SESSION['usuario_id'] ?? null;
if (!$usuario_id) {
    die("Sessão inválida.");
}

$id_projeto = intval($_POST['id_projeto'] ?? 0);

if ($id_projeto <= 0) {
    $_SESSION['msg_erro'] = "Projeto inválido. ID recebido: " . htmlspecialchars($_POST['id_projeto'] ?? 'vazio');
    header("Location: tabulacao.php");
    exit;
}

if (!isset($_FILES['arquivo_csv']) || $_FILES['arquivo_csv']['error'] !== UPLOAD_ERR_OK) {
    $_SESSION['msg_erro'] = "Falha no upload. Código: " . ($_FILES['arquivo_csv']['error'] ?? 'N/A');
    header("Location: tabulacao.php");
    exit;
}

$stmt = $conexao->prepare("SELECT id, nome_projeto FROM projetos WHERE id = ?");
$stmt->bind_param("i", $id_projeto);
$stmt->execute();
$proj = $stmt->get_result()->fetch_assoc();
$stmt->close();

if (!$proj) {
    $_SESSION['msg_erro'] = "Projeto ID $id_projeto não encontrado no banco.";
    header("Location: tabulacao.php");
    exit;
}

$arquivo = $_FILES['arquivo_csv'];
$ext = strtolower(pathinfo($arquivo['name'], PATHINFO_EXTENSION));

if ($ext !== 'csv') {
    $_SESSION['msg_erro'] = "Envie apenas arquivo .csv";
    header("Location: tabulacao.php");
    exit;
}

$pastaBase   = __DIR__ . '/../export/planilhas/';
$pastaProjeto = 'projeto_' . $id_projeto;
$dirDestino  = $pastaBase . $pastaProjeto . '/';

if (!is_dir($dirDestino)) {
    mkdir($dirDestino, 0775, true);
}

$nomeFinal    = 'odk_raw_' . date('YmdHis') . '.csv';
$caminhoFinal = $dirDestino . $nomeFinal;

if (move_uploaded_file($arquivo['tmp_name'], $caminhoFinal)) {
    $_SESSION['msg_sucesso'] = "✅ CSV <strong>$nomeFinal</strong> enviado para o projeto <strong>" . htmlspecialchars($proj['nome_projeto']) . "</strong>.";
} else {
    $_SESSION['msg_erro'] = "Erro ao salvar arquivo em: $dirDestino — verifique permissões.";
}

header("Location: tabulacao.php");
exit;
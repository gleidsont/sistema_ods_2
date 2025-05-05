<?php
session_start();
include '../includes/auth_check.php';
include '../includes/conexao.php';

$id_projeto = $_GET['id'] ?? null;
$id_usuario = $_SESSION['usuario_id'];
$is_admin = $_SESSION['usuario_perfil'] === 'admin';

if (!$id_projeto) {
    die("Projeto não especificado.");
}

// Verifica se o projeto pertence ao usuário (se não for admin)
$sql = $is_admin ?
    "SELECT * FROM projetos WHERE id = ?" :
    "SELECT * FROM projetos WHERE id = ? AND id_usuario = ?";

$stmt = $conexao->prepare($sql);
if ($is_admin) {
    $stmt->bind_param("i", $id_projeto);
} else {
    $stmt->bind_param("ii", $id_projeto, $id_usuario);
}
$stmt->execute();
$projeto = $stmt->get_result()->fetch_assoc();

if (!$projeto) {
    die("Projeto não encontrado ou acesso negado.");
}

// Busca imagens das ODS associadas
$stmt = $conexao->prepare("SELECT o.numero_item, o.numero_ods, o.nome_ods,
    o.imagem_ameaca, o.imagem_vulnerabilidade, o.imagem_resiliencia, o.imagem_sagrado
    FROM projetos_ods po
    JOIN ods o ON po.id_ods = o.id
    WHERE po.id_projeto = ?");
$stmt->bind_param("i", $id_projeto);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    die("Nenhuma ODS associada ao projeto.");
}

$zip = new ZipArchive();
$nome_zip = "projeto_{$id_projeto}_imagens_" . date("Ymd_His") . ".zip";
$caminho_zip = sys_get_temp_dir() . "/" . $nome_zip;

if ($zip->open($caminho_zip, ZipArchive::CREATE) !== TRUE) {
    die("Não foi possível criar o arquivo ZIP.");
}

$base_dir = realpath("../assets/img");

while ($ods = $result->fetch_assoc()) {
    $tipos = [
        'Ameaça'        => $ods['imagem_ameaca'],
        'Vulnerabilidade'=> $ods['imagem_vulnerabilidade'],
        'Resiliência'   => $ods['imagem_resiliencia'],
        'Sagrado'       => $ods['imagem_sagrado']
    ];

    foreach ($tipos as $tipo => $arquivo) {
        if ($arquivo && file_exists("$base_dir/$arquivo")) {
            $caminho_completo = "$base_dir/$arquivo";
            $nome_no_zip = "ODS {$ods['numero_item']} - {$tipo} - " . basename($arquivo);
            $zip->addFile($caminho_completo, $nome_no_zip);
        }
    }
}

$zip->close();

// Força o download
header("Content-Type: application/zip");
header("Content-Disposition: attachment; filename=\"$nome_zip\"");
header("Content-Length: " . filesize($caminho_zip));
readfile($caminho_zip);
unlink($caminho_zip); // apaga temporário
exit;
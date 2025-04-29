<?php
session_start();
include '../includes/auth_check.php';
include '../includes/conexao.php';

$usuario_id = $_SESSION['usuario_id'];
$is_admin = $_SESSION['usuario_perfil'] === 'admin';

// Criar pasta temporária
$dirTemp = __DIR__ . '/temp_export';
if (!is_dir($dirTemp)) mkdir($dirTemp, 0777, true);

// Pegar projetos
$sql = $is_admin ?
    "SELECT p.*, u.nome AS criador FROM projetos p JOIN usuarios u ON p.id_usuario = u.id" :
    "SELECT * FROM projetos WHERE id_usuario = $usuario_id";

$projetos = $conexao->query($sql);

while ($projeto = $projetos->fetch_assoc()) {
    $id_projeto = $projeto['id'];
    $nome_projeto = preg_replace('/[^a-zA-Z0-9_-]/', '_', $projeto['nome_projeto']);
    $arquivo_txt = "$dirTemp/projeto_{$nome_projeto}.txt";

    $conteudo = "Projeto: " . $projeto['nome_projeto'] . PHP_EOL;
    $conteudo .= "Descrição: " . $projeto['descricao'] . PHP_EOL;
    if ($is_admin) $conteudo .= "Criado por: " . $projeto['criador'] . PHP_EOL;
    $conteudo .= PHP_EOL . "ODS Associadas:" . PHP_EOL;

    $stmt = $conexao->prepare("SELECT o.* FROM projetos_ods po JOIN ods o ON po.id_ods = o.id WHERE po.id_projeto = ?");
    $stmt->bind_param("i", $id_projeto);
    $stmt->execute();
    $ods_result = $stmt->get_result();

    while ($ods = $ods_result->fetch_assoc()) {
        $conteudo .= "- ODS {$ods['numero_item']}: {$ods['nome_ods']}" . PHP_EOL;
        $tipos = ['ameaca', 'vulnerabilidade', 'resiliencia', 'sagrado'];
        foreach ($tipos as $tipo) {
            if (!empty($ods["imagem_$tipo"])) {
                $img_path = "../assets/img/" . $ods["imagem_$tipo"];
                $dest_path = "$dirTemp/" . basename($img_path);
                if (file_exists($img_path)) {
                    copy($img_path, $dest_path);
                }
            }
        }
    }

    file_put_contents($arquivo_txt, $conteudo);
}

// Criar ZIP
$zip_nome = "export_ods_" . date('Ymd_His') . ".zip";
$zip_path = "$dirTemp/$zip_nome";
$zip = new ZipArchive();

if ($zip->open($zip_path, ZipArchive::CREATE) === TRUE) {
    $arquivos = scandir($dirTemp);
    foreach ($arquivos as $file) {
        if ($file != '.' && $file != '..' && $file != $zip_nome) {
            $zip->addFile("$dirTemp/$file", $file);
        }
    }
    $zip->close();
}

// Download
header('Content-Type: application/zip');
header("Content-Disposition: attachment; filename=\"$zip_nome\"");
header('Content-Length: ' . filesize($zip_path));
readfile($zip_path');

// Limpeza
foreach (scandir($dirTemp) as $f) {
    if ($f != '.' && $f != '..') unlink("$dirTemp/$f");
}
rmdir($dirTemp);
exit;
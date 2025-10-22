<?php
session_start();
require '../autoload.php';
include '../includes/auth_check.php';
include '../includes/conexao.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$id_projeto = $_GET['id'] ?? null;
$id_usuario = $_SESSION['usuario_id'];
$is_admin = $_SESSION['usuario_perfil'] === 'admin';

if (!$id_projeto) {
    die("Projeto não especificado.");
}

// Valida se o projeto pertence ao usuário ou se é admin
$sql = $is_admin ?
    "SELECT p.nome_projeto, p.descricao, u.nome AS criador FROM projetos p JOIN usuarios u ON p.id_usuario = u.id WHERE p.id = ?" :
    "SELECT nome_projeto, descricao FROM projetos WHERE id = ? AND id_usuario = ?";

$stmt = $conexao->prepare($sql);
if ($is_admin) {
    $stmt->bind_param("i", $id_projeto);
} else {
    $stmt->bind_param("ii", $id_projeto, $id_usuario);
}
$stmt->execute();
$projeto = $stmt->get_result()->fetch_assoc();

if (!$projeto) {
    die("Projeto não encontrado ou acesso não autorizado.");
}

// Busca ODS vinculadas
//$stmt_ods = $conexao->prepare("SELECT o.numero_item, o.fatores FROM projetos_ods po
//                               JOIN ods o ON po.id_ods = o.id
//                               WHERE po.id_projeto = ?");
$stmt_ods = $conexao->prepare(
"SELECT ODS.NUMERO_ODS AS ODS, 
		CAST( SUBSTRING(ODS.NUMERO_ITEM, LOCATE('.', ODS.NUMERO_ITEM) + 1) AS UNSIGNED) AS N_FATOR, 
        CONCAT('ODS ', LPAD(ODS.NUMERO_ODS, 2, '0'), ' – ', ODS.NOME_ODS)  AS ODS_CONDICIONAL,
        ODS.FATORES AS FATOR_A,
        ODS.METAS_IPEA AS FATOR_B
FROM projetos_ods
INNER JOIN ods ON projetos_ods.id_ods = ods.id
WHERE projetos_ods.id_projeto = ?
ORDER BY ODS, N_FATOR");

$stmt_ods->bind_param("i", $id_projeto);
$stmt_ods->execute();
$ods_result = $stmt_ods->get_result();

// Gera planilha
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

$sheet->setCellValue('A1', 'ods');
$sheet->setCellValue('B1', 'n_fator');
$sheet->setCellValue('C1', 'ods_condicional');
$sheet->setCellValue('D1', 'fator_a');
$sheet->setCellValue('E1', 'fator_b');

$row = 2;
if ($ods_result->num_rows > 0) {
    while ($ods = $ods_result->fetch_assoc()) {
        $sheet->setCellValue("A$row", $ods['ODS']);
        $sheet->setCellValue("B$row", $ods['N_FATOR']);
        $sheet->setCellValue("C$row", $ods['ODS_CONDICIONAL']);
        $sheet->setCellValue("D$row", $ods['FATOR_A']);
        $sheet->setCellValue("E$row", $ods['FATOR_B']);        
        $row++;
    }
} else {
    $sheet->setCellValue("A$row", $projeto['nome_projeto']);
    //$sheet->setCellValue("B$row", $projeto['descricao']);
    $sheet->setCellValue("B$row", "Nenhuma ODS associada");
}

$sheet->getStyle("A1:E1")->getFont()->setBold(true);

//$filename = "projeto_{$id_projeto}_" . date('Ymd_His') . ".xlsx";
//$filename = "planilha_base" . ".xlsx";
$filename = "planilha_base_" . date('d-m-Y_H-i-s') . ".xlsx";
$pastaServidor = __DIR__ . '/planilhas/' . $projeto['nome_projeto'];
$caminhoCompleto = __DIR__ . '/planilhas/' . $projeto['nome_projeto'] . '/' . $filename;  
//$caminhoCompleto = $pastaServidor . $filename;
if (!is_dir($pastaServidor)) {  
    mkdir($pastaServidor, 0755, true);  
}

// Salva no servidor
$writer = new Xlsx($spreadsheet);  
$writer->save($caminhoCompleto);

// Envia para download  
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');  
header("Content-Disposition: attachment; filename=\"$filename\"");  
header('Content-Length: ' . filesize($caminhoCompleto));  
readfile($caminhoCompleto);  
exit;

//header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
//header("Content-Disposition: attachment; filename=\"$filename\"");

//$writer = new Xlsx($spreadsheet);
//$writer->save("php://output");
//exit;
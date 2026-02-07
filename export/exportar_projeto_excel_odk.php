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

// Verifica se o usuário tem acesso ao projeto
$sql = "SELECT p.nome_projeto, p.descricao, u.nome AS criador 
        FROM projetos p 
        JOIN usuarios u ON p.id_usuario = u.id 
        WHERE p.id = ? AND (p.id_usuario = ? OR ? = TRUE)";

$stmt = $conexao->prepare($sql);
$stmt->bind_param("iii", $id_projeto, $id_usuario, $is_admin);
$stmt->execute();
$projeto = $stmt->get_result()->fetch_assoc();

if (!$projeto) {
    die("Projeto não encontrado ou acesso não autorizado.");
}

// Consulta ODS - CORRIGIDO: removido o ID fixo
$stmt_ods = $conexao->prepare(
"SELECT ods.numero_ods AS ODS, 
        CAST( SUBSTRING(ods.numero_item, LOCATE('.', ods.numero_item) + 1) AS UNSIGNED) AS N_FATOR, 
        CONCAT('ODS ', LPAD(ods.numero_ods, 2, '0'), ' – ', ods.nome_ods)  AS ODS_CONDICIONAL,
        ods.fatores AS FATOR_A,
        ods.metas_ipea AS FATOR_B
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

// Cabeçalhos
$sheet->setCellValue('A1', 'ods');
$sheet->setCellValue('B1', 'n_fator');
$sheet->setCellValue('C1', 'ods_condicional');
$sheet->setCellValue('D1', 'fator_a');
$sheet->setCellValue('E1', 'fator_b');

// Preenche dados
$row = 2;
while ($ods = $ods_result->fetch_assoc()) {
    $sheet->setCellValue('A' . $row, $ods['ODS']);
    $sheet->setCellValue('B' . $row, $ods['N_FATOR']);
    $sheet->setCellValue('C' . $row, $ods['ODS_CONDICIONAL']);
    $sheet->setCellValue('D' . $row, $ods['FATOR_A']);
    $sheet->setCellValue('E' . $row, $ods['FATOR_B']);
    $row++;
}

// Define diretório para salvar
$diretorio = "../export/planilhas/" . $projeto['nome_projeto'] . "/";
if (!is_dir($diretorio)) {
    mkdir($diretorio, 0755, true);
}

// Define nome do arquivo
$filename = "planilha_base_odk" . date('d-m-Y_H-i-s') . ".xlsx"; //"projeto_" . preg_replace('/[^a-zA-Z0-9_-]/', '_', $projeto['nome_projeto']) . "_ods.xlsx";
$caminhoCompleto = $diretorio . $filename;

// Salva no servidor
$writer = new Xlsx($spreadsheet);
$writer->save($caminhoCompleto);

// Verifica se o arquivo foi salvo
if (!file_exists($caminhoCompleto)) {
    die("Erro ao salvar o arquivo.");
}

// Envia para download  
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');  
header("Content-Disposition: attachment; filename=\"$filename\"");  
header('Content-Length: ' . filesize($caminhoCompleto));  
readfile($caminhoCompleto);  

// Opcional: Remove o arquivo após o download (descomente se quiser)
// unlink($caminhoCompleto);

exit;

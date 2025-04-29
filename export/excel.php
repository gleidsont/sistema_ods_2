<?php
session_start();
require '../vendor/autoload.php';
include '../includes/auth_check.php';
include '../includes/conexao.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$usuario_id = $_SESSION['usuario_id'];
$is_admin = $_SESSION['usuario_perfil'] === 'admin';

$sql = $is_admin ?
    "SELECT p.id, p.nome_projeto, p.descricao, u.nome AS criador
     FROM projetos p JOIN usuarios u ON p.id_usuario = u.id" :
    "SELECT id, nome_projeto, descricao FROM projetos WHERE id_usuario = $usuario_id";

$projetos = $conexao->query($sql);

$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

$sheet->setCellValue('A1', 'Projeto');
$sheet->setCellValue('B1', 'Descrição');
$sheet->setCellValue('C1', 'ODS Vinculadas');

$row = 2;
while ($projeto = $projetos->fetch_assoc()) {
    $ods_stmt = $conexao->prepare("SELECT o.numero_item, o.nome_ods FROM projetos_ods po
                                   JOIN ods o ON po.id_ods = o.id WHERE po.id_projeto = ?");
    $ods_stmt->bind_param("i", $projeto['id']);
    $ods_stmt->execute();
    $ods_result = $ods_stmt->get_result();

    $ods_texto = '';
    while ($ods = $ods_result->fetch_assoc()) {
        $ods_texto .= "ODS " . $ods['numero_item'] . " - " . $ods['nome_ods'] . "; ";
    }

    $sheet->setCellValue("A$row", $projeto['nome_projeto']);
    $sheet->setCellValue("B$row", $projeto['descricao']);
    $sheet->setCellValue("C$row", $ods_texto);

    $row++;
}

// Estilo
$sheet->getStyle("A1:C1")->getFont()->setBold(true);
$sheet->getStyle("A:C")->getFont()->setSize(12);

// Download
$filename = "projetos_ods_" . date('Ymd_His') . ".xlsx";
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header("Content-Disposition: attachment; filename=\"$filename\"");

$writer = new Xlsx($spreadsheet);
$writer->save("php://output");
exit;
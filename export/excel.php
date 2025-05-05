<?php
session_start();
require '../autoload.php';
include '../includes/auth_check.php';
include '../includes/conexao.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$usuario_id = $_SESSION['usuario_id'];
$is_admin = $_SESSION['usuario_perfil'] === 'admin';

$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

$sheet->setCellValue('A1', 'Projeto');
$sheet->setCellValue('B1', 'Descrição');
$sheet->setCellValue('C1', 'Fatores');
$sheet->setCellValue('D1', 'Criado por');

$row = 2;

if ($is_admin) {
    $sql = "SELECT p.id, p.nome_projeto, p.descricao, u.nome AS criador
            FROM projetos p
            JOIN usuarios u ON p.id_usuario = u.id";
} else {
    $sql = "SELECT id, nome_projeto, descricao
            FROM projetos
            WHERE id_usuario = $usuario_id";
}

$projetos = $conexao->query($sql);

while ($projeto = $projetos->fetch_assoc()) {
    $ods_stmt = $conexao->prepare("SELECT o.numero_item, o.fatores FROM projetos_ods po
                                   JOIN ods o ON po.id_ods = o.id
                                   WHERE po.id_projeto = ?");
    $ods_stmt->bind_param("i", $projeto['id']);
    $ods_stmt->execute();
    $ods_result = $ods_stmt->get_result();

    // Se não houver ODS associadas, ainda exporta o projeto
    if ($ods_result->num_rows === 0) {
        $sheet->setCellValue("A$row", $projeto['nome_projeto']);
        $sheet->setCellValue("B$row", $projeto['descricao']);
        $sheet->setCellValue("C$row", "Nenhuma ODS vinculada");
        if ($is_admin) {
            $sheet->setCellValue("D$row", $projeto['criador']);
        }
        $row++;
    } else {
        while ($ods = $ods_result->fetch_assoc()) {
            $sheet->setCellValue("A$row", $projeto['nome_projeto']);
            $sheet->setCellValue("B$row", $projeto['descricao']);
            $sheet->setCellValue("C$row", "ODS " . $ods['numero_item'] . " - " . $ods['fatores']);
            if ($is_admin) {
                $sheet->setCellValue("D$row", $projeto['criador']);
            }
            $row++;
        }
    }
}

// Estilo
$lastColumn = $is_admin ? 'D' : 'C';
$sheet->getStyle("A1:{$lastColumn}1")->getFont()->setBold(true);
$sheet->getStyle("A:{$lastColumn}")->getFont()->setSize(12);

// Download
$filename = "projetos_ods_" . date('Ymd_His') . ".xlsx";
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header("Content-Disposition: attachment; filename=\"$filename\"");

$writer = new Xlsx($spreadsheet);
$writer->save("php://output");
exit;
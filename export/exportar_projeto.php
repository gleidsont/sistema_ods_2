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
$stmt_ods = $conexao->prepare("SELECT o.numero_item, o.fatores FROM projetos_ods po
                               JOIN ods o ON po.id_ods = o.id
                               WHERE po.id_projeto = ?");
$stmt_ods->bind_param("i", $id_projeto);
$stmt_ods->execute();
$ods_result = $stmt_ods->get_result();

// Gera planilha
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

$sheet->setCellValue('A1', 'Projeto');
$sheet->setCellValue('B1', 'Descrição');
$sheet->setCellValue('C1', 'Fatores');
if ($is_admin) {
    $sheet->setCellValue('D1', 'Criador');
}

$row = 2;
if ($ods_result->num_rows > 0) {
    while ($ods = $ods_result->fetch_assoc()) {
        $sheet->setCellValue("A$row", $projeto['nome_projeto']);
        $sheet->setCellValue("B$row", $projeto['descricao']);
        $sheet->setCellValue("C$row", "ODS " . $ods['numero_item'] . " - " . $ods['fatores']);
        if ($is_admin) {
            $sheet->setCellValue("D$row", $projeto['criador']);
        }
        $row++;
    }
} else {
    $sheet->setCellValue("A$row", $projeto['nome_projeto']);
    $sheet->setCellValue("B$row", $projeto['descricao']);
    $sheet->setCellValue("C$row", "Nenhuma ODS associada");
    if ($is_admin) {
        $sheet->setCellValue("D$row", $projeto['criador']);
    }
}

$sheet->getStyle("A1:" . ($is_admin ? "D1" : "C1"))->getFont()->setBold(true);

$filename = "projeto_{$id_projeto}_" . date('Ymd_His') . ".xlsx";
header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header("Content-Disposition: attachment; filename=\"$filename\"");

$writer = new Xlsx($spreadsheet);
$writer->save("php://output");
exit;
<?php
// conexao.php - Arquivo para conex達o com o banco de dados. No Localhost, a senha fica em branco '' e no hostgator fica assim: m[f?6E^@wD*{'
$host = 'localhost';
$user  = 'root';
$pass  = '';
$dbname = 'tech4198_sistema_ods';

try {
    $conexao = new mysqli($host, $user, $pass, $dbname);

    $pdo = $conexao; //new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    // $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // $conexao = $pdo;
} catch (PDOException $e) {
    die("Erro ao conectar: " . $e->getMessage());
}
?>
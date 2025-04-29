<?php
if (!isset($_SESSION['usuario_id'])) {
    header("Location: /sistema_ods/login.php");
    exit;
}
<?php
if (!isset($_SESSION['usuario_id'])) {
    header("Location: /sistema_ods_2/login.php");
    exit;
}
<?php
session_start();
session_unset();
session_destroy();

// Redireciona para a tela de login
header("Location: login.php?logout=1");
exit;
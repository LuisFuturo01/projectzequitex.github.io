<?php

session_start();
if (!isset($_SESSION['usuario'])) {
    $_SESSION['selectedProducts'] = isset($_POST['selectedProducts']) ? $_POST['selectedProducts'] : '';
    header("Location: ../html/login.html");
    exit();
} else {
    $_SESSION['selectedProducts'] = isset($_POST['selectedProducts']) ? $_POST['selectedProducts'] : '';
    header("Location: cart.php");
    exit();
}
?>

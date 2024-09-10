<?php
session_start();

if (!isset($_SESSION['usuario'])) {
    $_SESSION['redirect_context'] = isset($_POST['redirect_context']) ? $_POST['redirect_context'] : '';
    $_SESSION['selectedServices'] = isset($_POST['selectedServices']) ? $_POST['selectedServices'] : '';
    header("Location: ../html/login.html");
    exit();
}
    $_SESSION['selectedServices'] = isset($_POST['selectedServices']) ? $_POST['selectedServices'] : '';
    header("Location: cartServ.php");
    exit();

?>

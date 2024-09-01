<?php
include('session-check.php');

// Verificar si el usuario está logueado
if (!$isLoggedIn) {
    // Redirige al login si no está logueado
    header('Location: ../html/login.html');
    exit();
}
?>
<!DOCTYPE html>
<html lang='es'>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <h1>Tu Carrito</h1>
</body>
</html>

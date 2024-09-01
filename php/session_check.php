<?php
session_start();
include('conect.php');

$loggedIn = false; // Variable para verificar si el usuario está autenticado.

if (isset($_SESSION['user_id'])) {
    // Verificar si el ID del usuario está en la sesión.
    $sessionUserId = $_SESSION['user_id'];
    $query = $conn->prepare("SELECT clienteID FROM clientes WHERE clienteID = ?");
    $query->bind_param("i", $sessionUserId);
    $query->execute();
    $result = $query->get_result();
    if ($result->fetch_assoc()) {
        $loggedIn = true; // Usuario encontrado en la base de datos.
    }
} elseif (isset($_COOKIE['user_id'])) {
    // Verificar si el ID del usuario está en la cookie.
    $cookieUserId = $_COOKIE['user_id'];
    $query = $conn->prepare("SELECT clienteID FROM clientes WHERE clienteID = ?");
    $query->bind_param("i", $cookieUserId);
    $query->execute();
    $result = $query->get_result();
    if ($result->fetch_assoc()) {
        $loggedIn = true; // Usuario encontrado en la base de datos.
    }
}

// Cerrar la consulta y la conexión a la base de datos.
$query->close();
$conn->close();
?>

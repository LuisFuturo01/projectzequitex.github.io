<?php
include('conect.php');
session_start();
$del=$_POST['del'];
$usuario = $_SESSION['usuario'];
$consulta = "DELETE FROM carrito WHERE clienteID = $usuario AND carritoID = $del";
$conn->query($consulta);

$conn->close();

header('Location:cart.php');


?>
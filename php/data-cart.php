<?php
include('conect.php');
session_start();
$usuario = $_SESSION['usuario'];
$consulta = "SELECT c.carritoID, c.productoID, p.nombre_producto, p.descripcion, p.precio, p.stock
FROM carrito c
JOIN productos p ON c.productoID = p.productoID
WHERE c.clienteID = $usuario";
$respuesta=$conn->query($consulta);

$cart = [];

if ($respuesta->num_rows > 0) {
    while ($row = $respuesta->fetch_assoc()) {
        $cart[] = $row;
    }
}

$conn->close();

echo json_encode($cart);


?>
<?php
include('conect.php');

$sql = "SELECT productoID, nombre_producto, descripcion, precio, stock FROM productos";
$result = $conn->query($sql);

$products = [];

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
}

$conn->close();

echo json_encode($products);
?>


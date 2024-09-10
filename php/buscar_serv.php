<?php
include('conect.php');

$term = isset($_GET['term']) ? $conn->real_escape_string($_GET['term']) : '';

$sql = "SELECT servicioID, nombre_servicio, descripcion FROM servicios WHERE nombre_servicio LIKE '%$term%'";
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

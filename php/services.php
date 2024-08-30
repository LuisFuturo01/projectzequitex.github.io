<?php
include('conect.php');

$sql = "SELECT nombre_servicio, descripcion FROM servicios";
$result = $conn->query($sql);

$services = [];

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $services[] = $row;
    }
}

$conn->close();

echo json_encode($services);
?>

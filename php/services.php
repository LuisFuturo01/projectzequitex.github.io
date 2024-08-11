<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "zequitex";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die('Error de conexión: ' . $conn->connect_error);
}

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

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "zequitex";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die('Error de conexión: ' . $conn->connect_error);
}

$selectedProducts = isset($_POST['selectedProducts']) ? $_POST['selectedProducts'] : '';
$productsArray = explode(',', $selectedProducts);


$sql = "SELECT servicioID, nombre_servicio FROM servicios";
$result = $conn->query($sql);
if ($result) {
    echo "<b style='color:red'>Servicios añadidos al carrito: </b>";
    $services = [];
    while ($row = $result->fetch_assoc()) {
        if (in_array($row['servicioID'], $productsArray)) {
            $services[] = '<b style="color:blue">' . htmlspecialchars($row['nombre_servicio']) . '</b>';
        }
    }
    echo implode(', ', $services);
}else{
    echo "error en la consulta";
};

$conn->close();

?>

<?php
include('conect.php');
session_start();


$usuario = $_SESSION['usuario'];

// Obtener 'selectedServices' de la sesión o del POST
if (isset($_SESSION['selectedServices'])) {
    $selectedServices = $_SESSION['selectedServices'];
} else {
    $selectedServices = isset($_POST['selectedServices']) ? $_POST['selectedServices'] : '';
}

// Convertir la cadena de servicios en un array y sanitizar
$servicesArray = explode(',', $selectedServices);
$servicesArray = array_map('intval', $servicesArray);
$servicesArrayString = implode(',', $servicesArray);

// Preparar la consulta SQL para servicios
// $sql = "SELECT servicioID, nombre_servicio FROM servicios WHERE servicioID IN ($servicesArrayString)";
$sql = "SELECT servicioID, nombre_servicio FROM servicios WHERE servicioID IN ($servicesArrayString)";

// Ejecutar la consulta y manejar errores
$result = $conn->query($sql);
if ($result === false) {
    die("Error en la consulta de servicios: " . $conn->error);
}

// Preparar la consulta SQL para datos del cliente
$consulta = "SELECT nombre_completo, correo FROM clientes WHERE clienteID = $usuario;";
$ans = $conn->query($consulta);

$clientData = $ans->fetch_assoc();

$combinedData = [
    'cliente' => $clientData,
    'servicios' => []
];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $combinedData['servicios'][] = $row;
    }
}

$jsonData = json_encode($combinedData);
echo "<script>console.log($jsonData)</script>";
$conn->close();

$url = 'https://script.google.com/macros/s/AKfycbyYhrIc4OCZS9hA7Bh7DL7-ayHGXHN5O697nxpaUF_1o1_v1BUk7E6k78Zl-rn89UgOFg/exec';

// Configurar cURL
$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonData);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    'Content-Type: application/json',
    'Content-Length: ' . strlen($jsonData)
));

// Ejecutar la solicitud
$respuesta = curl_exec($ch);

// Verificar si hubo errores
if ($respuesta === false) {
    echo "<script>alert('Hubo un error al enviar los datos');
    window.location.href = '../html/services.html';
    </script>";
} else {
    echo "<script>alert('Datos enviados a su correo electrónico');
        window.location.href = '../html/services.html';
    </script>";
}


// Cerrar cURL
curl_close($ch);

?>
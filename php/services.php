<?php
include('conect.php'); // Asegúrate de que este archivo se incluya correctamente

$sql = "SELECT servicioID, nombre_servicio, descripcion FROM servicios";
$result = $conn->query($sql);

$services = [];

// Verifica si la consulta se ejecutó correctamente
if ($result) {
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $services[] = $row;
        }
    } else {
        // Si no hay resultados, puedes manejarlo aquí si es necesario
        // echo "No se encontraron servicios.";
    }
} else {
    // Manejo de errores en caso de que la consulta falle
    echo "Error en la consulta: " . $conn->error;
}

$conn->close();

// Devuelve los resultados en formato JSON
header('Content-Type: application/json'); // Asegúrate de establecer el tipo de contenido
echo json_encode($services);
?>
<?php
$servername = "zequitex.cvicmmuaunr1.us-east-2.rds.amazonaws.com"; // Sin el puerto
$username = "root";
$password = "12loco34";
$dbname = "zequitex";
$port = 3306; // Especifica el puerto

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Verificar conexión
if ($conn->connect_error) {
    die("Fallo en la conexión: " . $conn->connect_error);
} else {
    echo "Conexión exitosa";
}
?>

<?php
include('conect.php'); // Asegúrate de que este archivo se incluya correctamente

$sql = "SELECT productoID, nombre_producto, descripcion, precio, stock FROM productos";
$result = $conn->query($sql);

$products = [];

if ($result) { // Verifica si la consulta se ejecutó correctamente
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $products[] = $row;
        }
    } else {
        // Si no hay resultados, puedes manejarlo aquí si es necesario
        // echo "No se encontraron productos.";
    }
} else {
    // Manejo de errores en caso de que la consulta falle
    echo "Error en la consulta: " . $conn->error;
}

$conn->close();

// Devuelve los resultados en formato JSON
header('Content-Type: application/json'); // Asegúrate de establecer el tipo de contenido
echo json_encode($products);
?>

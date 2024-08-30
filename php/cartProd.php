<?php
include('conect.php');

$selectedProducts = isset($_POST['selectedProducts']) ? $_POST['selectedProducts'] : '';
$productsArray = explode(',', $selectedProducts);


$sql = "SELECT productoID, nombre_producto FROM productos";
$result = $conn->query($sql);
if ($result) {
    echo "<b style='color:red'>Servicios añadidos al carrito: </b>";
    $products = [];
    while ($row = $result->fetch_assoc()) {
        if (in_array($row['productoID'], $productsArray)) {
            $products[] = '<b style="color:blue">' . htmlspecialchars($row['nombre_producto']) . '</b>';
        }
    }
    echo implode(', ', $products);
}else{
    echo "error en la consulta";
};

$conn->close();

?>

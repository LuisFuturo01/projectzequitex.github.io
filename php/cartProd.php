<?php

session_start();

$usuario = $_SESSION['usuario'];
if (isset($_SESSION['selectedProducts'])) {
    $selectedServices = $_SESSION['selectedProducts'];
} else {
    $selectedServices = isset($_POST['selectedProducts']) ? $_POST['selectedProducts'] : '';
}


if (!isset($_SESSION['usuario'])) {
    header("Location: ../html/login.html");
    exit();
} else {
    include('conect.php');

    $selectedProducts = isset($_POST['selectedProducts']) ? $_POST['selectedProducts'] : '';
    if(empty($selectedProducts)){
        echo "<script>
            alert('No se ha seleccionado ningún producto');
            window.location.href='../html/products.html';
        </script>";
        exit();
    }
    $productsArray = explode(',', $selectedProducts);
    for($i=0 ; $i < count($productsArray) ; $i++){
        $sql = "INSERT INTO carrito (clienteID, productoID) VALUES ($usuario, $productsArray[$i])";
        $conn->query($sql);
    }
    header("Location: cart.php");
    $conn->close();
    exit();
}

?>

<?php
    $servername = "localhost"; // Sin el puerto
    $username = "root";
    $password = "";
    $dbname = "zequitex";
    
    // Crear conexión
    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        echo "fallo conexion";
    }
?>
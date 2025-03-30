<?php
    $servername = "zequitex.cvicmmuaunr1.us-east-2.rds.amazonaws.com"; // Sin el puerto
    $username = "root";
    $password = "12loco34";
    $dbname = "zequitex";
    $port = 3306; // Especifica el puerto
    
    // Crear conexión
    $conn = new mysqli($servername, $username, $password, $dbname, $port);

    if ($conn->connect_error) {
        echo "fallo conexion";
    }
?>
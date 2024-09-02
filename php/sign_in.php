<?php
include('conect.php');

$usuario = $_POST['UsuarioName'];
$password = $_POST['UsuarioPassword'];

$consulta = "INSERT INTO clientes(usuario, contraseña) WHERE usuario = '$usuario' AND contraseña = '$password'";

$result = $conn->query($consulta);

if ($result->num_rows > 0) {
    header("Location: ../html/cart.html");
} else {
    echo "<script>
            alert('Usuario o Contraseña son incorrectos');
            window.location.href = '../html/login.html';
        </script>";
}
$conn->close();
?>

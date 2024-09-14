<?php
include('conect.php');
$name=$_POST['Usuario'];
$ci=$_POST['CI'];
$mail = $_POST['email'];
$usuario = $_POST['UsuarioName'];
$password = $_POST['UsuarioPassword'];
$phone = $_POST['phone'];
$direc = $_POST['dir'];
$city = $_POST['ciudad'];
$depar = $_POST['dep'];
$genero = $_POST['gen'];
if(empty($name) || empty($ci) || empty($mail) || empty($usuario) || empty($password) || empty($phone) || empty($direc) || empty($city) || empty($depar) || empty($genero)){
    echo "  <script>
            alert('Por favor, completa todos los campos');
            window.location.href = '../html/sign_in.html';
        </script>";
}
$hash = password_hash($password, PASSWORD_DEFAULT);
$verify="SELECT usuario FROM clientes WHERE usuario = '$usuario'";
$ans=$conn->query($verify);
if ($ans->num_rows > 0) {
    echo "  <script>
                alert('Lo Siento, el usuario ya existe');
                window.location.href = '../html/sign_in.html';
            </script>";
}
$consulta = "INSERT INTO clientes(nombre_completo, ci, correo, contraseña, telefono, direccion, ciudad, departamentoID, genero, usuario) VALUES 
('$name', '$ci', '$mail', '$hash', '$phone', '$direc', '$city', $depar, '$genero', '$usuario')";

$result = $conn->query($consulta);

if ($result) {
    echo "  <script>
            alert('Usuario Creado con exito');
            window.location.href = '../html/login.html';
        </script>";
}else{
    echo "  <script>
            alert('error al crear la cuenta');
            window.location.href = '../html/sign_in.html';
        </script>";
}
$conn->close();
?>

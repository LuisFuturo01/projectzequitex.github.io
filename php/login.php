<?php
include('conect.php');

session_start();

$usuario = $_POST['UsuarioName'];
$password = $_POST['UsuarioPassword'];
$remember = isset($_POST['remember']) ? true : false;

$consulta = "SELECT clienteID, usuario, contraseña FROM clientes WHERE usuario = '$usuario'";
$result = $conn->query($consulta);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $hashAlmacenado = $row['contraseña'];

    if (password_verify($password, $hashAlmacenado)) {
        $_SESSION['usuario'] = $row['clienteID'];
        if ($remember) {
            $cookieExpire = time() + (30 * 24 * 60 * 60);
            setcookie(session_name(), session_id(), $cookieExpire, "/");
        } else {
            if (ini_get("session.use_cookies")) {
                $params = session_get_cookie_params();
                setcookie(session_name(), session_id(), 0, $params["path"], $params["domain"], $params["secure"], $params["httponly"]);
            }
        }
        if (isset($_SESSION['redirect_context'])) {
            header("Location: cartServ.php");
            exit();
        }
        header("Location: cart.php");
        exit();
    } else {
        echo "<script>
                alert('Usuario o Contraseña son incorrectos');
                window.location.href = '../html/login.html';
            </script>";
    }
} else {
    echo "<script>
            alert('Usuario o Contraseña son incorrectos');
            window.location.href = '../html/login.html';
        </script>";
}

$conn->close();
?>

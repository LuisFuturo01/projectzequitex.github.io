<?php
session_start();
include('conect-db.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Preparar la consulta para obtener el usuario
    $stmt = $conn->prepare("SELECT clienteID, contraseña FROM clientes WHERE correo = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($row = $result->fetch_assoc()) {
        $userId = $row['clienteID'];
        $hashedPassword = $row['contraseña'];

        // Verificar la contraseña
        if (password_verify($password, $hashedPassword)) {
            // Iniciar sesión
            $_SESSION['user_id'] = $userId;

            // Establecer una cookie si se desea mantener la sesión
            if (isset($_POST['remember'])) {
                setcookie('user_id', $userId, time() + (86400 * 30), '/'); // 30 días
            }

            // Redirigir al usuario al carrito u otra página
            header('Location: ../php/carrito.php');
            exit();
        } else {
            $error = 'Contraseña incorrecta.';
        }
    } else {
        $error = 'Correo electrónico no registrado.';
    }

    $stmt->close();
    $conn->close();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error de Inicio de Sesión</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <h1>Error de Inicio de Sesión</h1>
    <p><?php echo isset($error) ? $error : ''; ?></p>
    <a href="../html/login.html">Volver a intentar</a>
</body>
</html>

<?php
session_start();
include('conect.php');

// Verificar si el usuario está logueado
if (!isset($_SESSION['usuario'])) {
    echo "<script>
            alert('Debes iniciar sesión para actualizar tu cuenta.');
            window.location.href = '../html/login.html';
          </script>";
    exit();
}

$usuario_id = $_SESSION['usuario'];

// Obtener los datos actuales del usuario
$query = "SELECT * FROM clientes WHERE clienteID = '$usuario_id' and activo='1'";
$result = $conn->query($query);

if ($result && $result->num_rows > 0) {
    $usuario_actual = $result->fetch_assoc();
} else {
    echo "<script>
            alert('Error al obtener los datos del usuario.');
            window.location.href = 'account.php';
          </script>";
    exit();
}

// Leer la contraseña actual ingresada por el usuario
// Validar los datos enviados
$campos_a_actualizar = [];

if (!empty($_POST['nombre_completo'])) {
    $campos_a_actualizar['nombre_completo'] = $_POST['nombre_completo'];
}

if (!empty($_POST['ci'])) {
    $campos_a_actualizar['ci'] = $_POST['ci'];
}

if (!empty($_POST['correo'])) {
    $campos_a_actualizar['correo'] = $_POST['correo'];
}

if (!empty($_POST['telefono'])) {
    $campos_a_actualizar['telefono'] = $_POST['telefono'];
}

if (!empty($_POST['direccion'])) {
    $campos_a_actualizar['direccion'] = $_POST['direccion'];
}

if (!empty($_POST['usuario'])) {
    $campos_a_actualizar['usuario'] = $_POST['usuario'];
}

if (!empty($_POST['contraseña_nueva'])) {
    $contraseña_actual = $_POST['contraseña_actual'];
    
    // Verificar si la contraseña actual es correcta
    if (password_verify($contraseña_actual, $usuario_actual['contraseña'])) {
        $campos_a_actualizar['contraseña'] = password_hash($_POST['contraseña_nueva'], PASSWORD_DEFAULT);
    } else {
        // La contraseña es incorrecta
        echo "<script>
                alert('La contraseña actual es incorrecta. Por favor, inténtalo de nuevo.');
                window.location.href = 'account.php';
              </script>";
        exit();
    }
}

// Si no hay campos para actualizar, redirigir sin hacer cambios
if (empty($campos_a_actualizar)) {
    echo "<script>
            alert('No se han realizado cambios en la cuenta.');
            window.location.href = 'account.php';
          </script>";
    exit();
}

// Actualizar la base de datos
if (!empty($campos_a_actualizar)) {
    $set_clause = implode(', ', array_map(function($key, $value) use ($conn) {
        return "$key = '" . $conn->real_escape_string($value) . "'";
    }, array_keys($campos_a_actualizar), $campos_a_actualizar));
    
    $query = "UPDATE clientes SET $set_clause WHERE clienteID = $usuario_id";
    
    if ($conn->query($query) === TRUE) {
        echo "<script>
                alert('Los cambios se han guardado correctamente.');
                window.location.href = 'account.php';
              </script>";
    } else {
        echo "<script>
                alert('Error al actualizar la cuenta: " . $conn->error . "');
                window.location.href = 'account.php';
              </script>";
    }
}
<?php
session_start();
include('conect.php');

// Verificar si existe la sesión 'total' y si tiene un valor válido
if (!isset($_SESSION['total']) || empty($_SESSION['total']) || $_SESSION['total'] <= 0) {
    echo "<script>
        alert('No hay productos en el carrito');
        window.location.href = 'cart.php';
    </script>";
    exit();
}

$total = $_SESSION['total'];
$user = $_SESSION['usuario'];
$detalle = $_POST['mensaje'];
$error_message = '';

if (empty($error_message)) {
    // Buscar los datos del usuario
    $consulta_usuario = "SELECT nombre_completo, direccion, telefono, departamentoID FROM clientes WHERE clienteID = ?";
    $stmt = $conn->prepare($consulta_usuario);
    $stmt->bind_param("s", $user);
    $stmt->execute();
    $resultado_usuario = $stmt->get_result();

    if ($resultado_usuario->num_rows > 0) {
        $datos_usuario = $resultado_usuario->fetch_assoc();
        
        // Insertar en la tabla direcciones_envio
        $consulta_direccion = "INSERT INTO direcciones_envio (clienteID, nombre_destinatario, direccion, departamentoID, referencia) 
                               VALUES (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($consulta_direccion);
        $stmt->bind_param("sssss", $user, $datos_usuario['nombre_completo'], $datos_usuario['direccion'], 
                          $datos_usuario['departamentoID'], $datos_usuario['telefono']);
        $resultado_direccion = $stmt->execute();
        
        if ($resultado_direccion) {
            // Insertar en la tabla pedidos
            $consulta_pedido = "INSERT INTO pedidos (clienteID, total, forma_pagoID, detalle) 
                                VALUES (?, ?, 1, ?)";
            $stmt = $conn->prepare($consulta_pedido);
            $stmt->bind_param("sds", $user, $total, $detalle);
            $resultado_pedido = $stmt->execute();
            
            if ($resultado_pedido) {
                $id_pedido = $conn->insert_id;
                
                // Generar el mensaje de WhatsApp
                $numero_whatsapp = "59171556955";
                $mensaje = "Gracias {$datos_usuario['nombre_completo']} por tu compra. Por favor adjunta el comprobante de pago con la cantidad Bs. " . number_format($total, 2) . ". Tu número de pedido es: $id_pedido. ¡Gracias por tu preferencia!";
                $mensaje_codificado = urlencode($mensaje);
                $enlace_whatsapp = "https://wa.me/{$numero_whatsapp}?text={$mensaje_codificado}";
            
                // Borrar el carrito del usuario
                $consulta_borrar_carrito = "DELETE FROM carrito WHERE clienteID = ?";
                $stmt = $conn->prepare($consulta_borrar_carrito);
                $stmt->bind_param("s", $user);
                $stmt->execute();
                
                // Cerrar la sesión de total
                unset($_SESSION['total']);
                
                // Redirigir a WhatsApp después de mostrar la alerta
                echo "<script>
                    alert('Tu compra fue procesada correctamente y está en preparación. ID de pedido: $id_pedido');
                    window.location.href = '$enlace_whatsapp';
                </script>";
                exit();
            } else {
                $error_message = "Error al registrar el pedido: " . $conn->error;
            }
        } else {
            $error_message = "Error al registrar la dirección de envío: " . $conn->error;
        }
    } else {
        $error_message = "No se encontraron datos del usuario.";
    }
}

if (!empty($error_message)) {
    echo "<script>
        alert('$error_message');
        window.location.href = 'cart.php';
    </script>";
    exit();
}

$conn->close();
?>
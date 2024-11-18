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

// Verificar si existe la lista de productos
if (!isset($_SESSION['productos_lista'])) {
    echo "<script>
        alert('Error: No se encontró la lista de productos');
        window.location.href = 'cart.php';
    </script>";
    exit();
}

$total = $_SESSION['total'];
$user = $_SESSION['usuario'];
$detalle = $_POST['mensaje'];
$productos_lista = $_SESSION['productos_lista'];
$error_message = '';

if (empty($error_message)) {
    $conn->begin_transaction();
    
    try {
        // Actualizar el stock de cada producto
        $productos = explode(',', $productos_lista);
        foreach ($productos as $producto) {
            list($productoID, $cantidad) = explode(':', $producto);
            
            // Verificar y actualizar el stock
            $sql = "UPDATE productos SET stock = stock - ? WHERE productoID = ? AND stock >= ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("iii", $cantidad, $productoID, $cantidad);
            
            if (!$stmt->execute()) {
                throw new Exception("Error al actualizar el stock del producto $productoID");
            }
            
            if ($stmt->affected_rows == 0) {
                throw new Exception("Stock insuficiente para el producto $productoID");
            }
        }

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
            
            if (!$stmt->execute()) {
                throw new Exception("Error al registrar la dirección de envío");
            }
            
            // Insertar en la tabla pedidos
            $consulta_pedido = "INSERT INTO pedidos (clienteID, total, forma_pagoID, detalle) 
                              VALUES (?, ?, 1, ?)";
            $stmt = $conn->prepare($consulta_pedido);
            $stmt->bind_param("sds", $user, $total, $detalle);
            
            if (!$stmt->execute()) {
                throw new Exception("Error al registrar el pedido");
            }
            
            $id_pedido = $conn->insert_id;
            
            // Borrar el carrito del usuario
            $consulta_borrar_carrito = "DELETE FROM carrito WHERE clienteID = ?";
            $stmt = $conn->prepare($consulta_borrar_carrito);
            $stmt->bind_param("s", $user);
            $stmt->execute();
            
            $conn->commit();
            
            // Generar el mensaje de WhatsApp
            $numero_whatsapp = "59171556955";
            $mensaje = "Gracias {$datos_usuario['nombre_completo']} por tu compra. Por favor adjunta el comprobante de pago con la cantidad Bs. " . number_format($total, 2) . ". Tu número de pedido es: $id_pedido. ¡Gracias por tu preferencia!";
            $mensaje_codificado = urlencode($mensaje);
            $enlace_whatsapp = "https://wa.me/{$numero_whatsapp}?text={$mensaje_codificado}";
            
            // Limpiar las sesiones necesarias
            unset($_SESSION['total']);
            unset($_SESSION['productos_lista']);
            
            // Mostrar alerta, abrir enlace de WhatsApp en una nueva pestaña y redirigir a cart.php
            echo "<script>
                alert('Tu compra fue procesada correctamente y está en preparación. ID de pedido: $id_pedido');
                var whatsappWindow = window.open('$enlace_whatsapp', '_blank');
                if(whatsappWindow) {
                    setTimeout(function() {
                        window.location.href = 'cart.php';
                    }, 1000);
                } else {
                    alert('El bloqueador de ventanas emergentes puede estar activado. Por favor, habilítelo para este sitio.');
                    window.location.href = 'cart.php';
                }
            </script>";
            exit();
        } else {
            throw new Exception("No se encontraron datos del usuario.");
        }
    } catch (Exception $e) {
        $conn->rollback();
        $error_message = $e->getMessage();
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
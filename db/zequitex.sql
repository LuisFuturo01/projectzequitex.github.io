SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Base de datos: `zequitex`

-- --------------------------------------------------------

-- Tabla `categorias`
CREATE TABLE `categorias` (
  `categoriaID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`categoriaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla `clientes`
CREATE TABLE `clientes` (
  `clienteID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `ci` varchar(20) NOT NULL UNIQUE,
  `correo` varchar(100) NOT NULL UNIQUE,
  `contraseña` varchar(255) NOT NULL,
  `telefono` varchar(20),
  `direccion` varchar(255),
  `ciudad` varchar(50),
  `departamentoID` int(11),
  `fecha_registro` date DEFAULT curdate(),
  `genero` varchar(15),
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`clienteID`),
  KEY `departamentoID` (`departamentoID`),
  FOREIGN KEY (`departamentoID`) REFERENCES `departamentos` (`departamentoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla `departamentos`
CREATE TABLE `departamentos` (
  `departamentoID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(100) NOT NULL,
  PRIMARY KEY (`departamentoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla `detalle_pedido`
CREATE TABLE `detalle_pedido` (
  `detalle_pedidoID` int(11) NOT NULL AUTO_INCREMENT,
  `pedidoID` int(11),
  `productoID` int(11),
  `cantidad_producto` int(11) NOT NULL,
  `precio_unitario_producto` decimal(10,2) NOT NULL,
  `servicioID` int(11),
  `cantidad_servicio` int(11) NOT NULL,
  `precio_unitario_servicio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`detalle_pedidoID`),
  KEY `pedidoID` (`pedidoID`),
  KEY `productoID` (`productoID`),
  KEY `servicioID` (`servicioID`),
  FOREIGN KEY (`pedidoID`) REFERENCES `pedidos` (`pedidoID`),
  FOREIGN KEY (`productoID`) REFERENCES `productos` (`productoID`),
  FOREIGN KEY (`servicioID`) REFERENCES `servicios` (`servicioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla `direcciones_envio`
CREATE TABLE `direcciones_envio` (
  `direccionID` int(11) NOT NULL AUTO_INCREMENT,
  `clienteID` int(11),
  `nombre_destinatario` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `departamentoID` int(11) NOT NULL,
  `referencia` varchar(255),
  PRIMARY KEY (`direccionID`),
  KEY `clienteID` (`clienteID`),
  KEY `departamentoID` (`departamentoID`),
  FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`),
  FOREIGN KEY (`departamentoID`) REFERENCES `departamentos` (`departamentoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla `empleados`
CREATE TABLE `empleados` (
  `empleadoID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `ci` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `telefono` varchar(20),
  `direccion` varchar(255),
  `ciudad` varchar(50),
  `departamentoID` int(11),
  `fecha_registro` date NOT NULL,
  `genero` varchar(20) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  PRIMARY KEY (`empleadoID`),
  KEY `departamentoID` (`departamentoID`),
  FOREIGN KEY (`departamentoID`) REFERENCES `departamentos` (`departamentoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla `formas_pago`
CREATE TABLE `formas_pago` (
  `forma_pagoID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_forma_pago` varchar(50) NOT NULL,
  PRIMARY KEY (`forma_pagoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla `impuestos`
CREATE TABLE `impuestos` (
  `impuestoID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_impuesto` varchar(100) NOT NULL,
  `porcentaje` decimal(5,2) NOT NULL,
  PRIMARY KEY (`impuestoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla `materiales`
CREATE TABLE `materiales` (
  `materialID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_material` varchar(100) NOT NULL,
  `proveedorID` int(11),
  PRIMARY KEY (`materialID`),
  KEY `proveedorID` (`proveedorID`),
  FOREIGN KEY (`proveedorID`) REFERENCES `proveedores` (`proveedorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla `pedidos`
CREATE TABLE `pedidos` (
  `pedidoID` int(11) NOT NULL AUTO_INCREMENT,
  `clienteID` int(11),
  `fecha_pedido` date NOT NULL,
  `fecha_entrega` date,
  `total` decimal(10,2) NOT NULL,
  `forma_pagoID` int(11),
  PRIMARY KEY (`pedidoID`),
  KEY `clienteID` (`clienteID`),
  KEY `forma_pagoID` (`forma_pagoID`),
  FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`),
  FOREIGN KEY (`forma_pagoID`) REFERENCES `formas_pago` (`forma_pagoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla `productos`
CREATE TABLE `productos` (
  `productoID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoriaID` int(11),
  `impuestoID` int(11),
  `tipo_producto` varchar(50),
  PRIMARY KEY (`productoID`),
  KEY `categoriaID` (`categoriaID`),
  KEY `impuestoID` (`impuestoID`),
  FOREIGN KEY (`categoriaID`) REFERENCES `categorias` (`categoriaID`),
  FOREIGN KEY (`impuestoID`) REFERENCES `impuestos` (`impuestoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla `proveedores`
CREATE TABLE `proveedores` (
  `proveedorID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(100) NOT NULL,
  `contacto` varchar(100),
  `telefono` varchar(20),
  `email` varchar(100),
  `direccion` varchar(255),
  PRIMARY KEY (`proveedorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla `servicios`
CREATE TABLE `servicios` (
  `servicioID` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_servicio` varchar(100) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`servicioID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;

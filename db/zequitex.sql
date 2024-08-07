-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-08-2024 a las 05:46:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `zequitex`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoriaID` int(11) NOT NULL,
  `nombre_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `clienteID` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `ci` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `departamentoID` int(11) DEFAULT NULL,
  `fecha_registro` date DEFAULT curdate(),
  `genero` varchar(15) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `departamentoID` int(11) NOT NULL,
  `nombre_departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `detalle_pedidoID` int(11) NOT NULL,
  `pedidoID` int(11) DEFAULT NULL,
  `productoID` int(11) DEFAULT NULL,
  `cantidad_producto` int(11) NOT NULL,
  `precio_unitario_producto` decimal(10,2) NOT NULL,
  `servicioID` int(11) DEFAULT NULL,
  `cantidad_servicio` int(11) NOT NULL,
  `precio_unitario_servicio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones_envio`
--

CREATE TABLE `direcciones_envio` (
  `direccionID` int(11) NOT NULL,
  `clienteID` int(11) DEFAULT NULL,
  `nombre_destinatario` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `departamentoID` int(11) NOT NULL,
  `referencia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `empleadoID` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `ci` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `departamentoID` int(11) DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `genero` varchar(20) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `cargo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formas_pago`
--

CREATE TABLE `formas_pago` (
  `forma_pagoID` int(11) NOT NULL,
  `nombre_forma_pago` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuestos`
--

CREATE TABLE `impuestos` (
  `impuestoID` int(11) NOT NULL,
  `nombre_impuesto` varchar(100) NOT NULL,
  `porcentaje` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

CREATE TABLE `materiales` (
  `materialID` int(11) NOT NULL,
  `nombre_material` varchar(100) NOT NULL,
  `proveedorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `pedidoID` int(11) NOT NULL,
  `clienteID` int(11) DEFAULT NULL,
  `fecha_pedido` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `forma_pagoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `productoID` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoriaID` int(11) DEFAULT NULL,
  `impuestoID` int(11) DEFAULT NULL,
  `tipo_producto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `proveedorID` int(11) NOT NULL,
  `nombre_proveedor` varchar(100) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `servicioID` int(11) NOT NULL,
  `nombre_servicio` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoriaID`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`clienteID`),
  ADD UNIQUE KEY `ci` (`ci`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `departamentoID` (`departamentoID`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`departamentoID`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`detalle_pedidoID`),
  ADD KEY `pedidoID` (`pedidoID`),
  ADD KEY `productoID` (`productoID`),
  ADD KEY `servicioID` (`servicioID`);

--
-- Indices de la tabla `direcciones_envio`
--
ALTER TABLE `direcciones_envio`
  ADD PRIMARY KEY (`direccionID`),
  ADD KEY `clienteID` (`clienteID`),
  ADD KEY `departamentoID` (`departamentoID`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`empleadoID`),
  ADD KEY `departamentoID` (`departamentoID`);

--
-- Indices de la tabla `formas_pago`
--
ALTER TABLE `formas_pago`
  ADD PRIMARY KEY (`forma_pagoID`);

--
-- Indices de la tabla `impuestos`
--
ALTER TABLE `impuestos`
  ADD PRIMARY KEY (`impuestoID`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`materialID`),
  ADD KEY `proveedorID` (`proveedorID`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedidoID`),
  ADD KEY `clienteID` (`clienteID`),
  ADD KEY `forma_pagoID` (`forma_pagoID`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`productoID`),
  ADD KEY `categoriaID` (`categoriaID`),
  ADD KEY `impuestoID` (`impuestoID`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`proveedorID`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`servicioID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoriaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `clienteID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `departamentoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `detalle_pedidoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direcciones_envio`
--
ALTER TABLE `direcciones_envio`
  MODIFY `direccionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `empleadoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formas_pago`
--
ALTER TABLE `formas_pago`
  MODIFY `forma_pagoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `impuestos`
--
ALTER TABLE `impuestos`
  MODIFY `impuestoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `materialID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedidoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `productoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `proveedorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `servicioID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`departamentoID`) REFERENCES `departamentos` (`departamentoID`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedidoID`) REFERENCES `pedidos` (`pedidoID`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`productoID`) REFERENCES `productos` (`productoID`),
  ADD CONSTRAINT `detalle_pedido_ibfk_3` FOREIGN KEY (`servicioID`) REFERENCES `servicios` (`servicioID`);

--
-- Filtros para la tabla `direcciones_envio`
--
ALTER TABLE `direcciones_envio`
  ADD CONSTRAINT `direcciones_envio_ibfk_1` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`),
  ADD CONSTRAINT `direcciones_envio_ibfk_2` FOREIGN KEY (`departamentoID`) REFERENCES `departamentos` (`departamentoID`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`departamentoID`) REFERENCES `departamentos` (`departamentoID`);

--
-- Filtros para la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD CONSTRAINT `materiales_ibfk_1` FOREIGN KEY (`proveedorID`) REFERENCES `proveedores` (`proveedorID`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`forma_pagoID`) REFERENCES `forma_pago` (`forma_pagoID`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoriaID`) REFERENCES `categorias` (`categoriaID`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`impuestoID`) REFERENCES `impuestos` (`impuestoID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

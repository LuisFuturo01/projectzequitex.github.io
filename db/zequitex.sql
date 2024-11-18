-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2024 at 03:54 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zequitex`
--

-- --------------------------------------------------------

--
-- Table structure for table `carrito`
--

CREATE TABLE `carrito` (
  `CarritoID` int(11) NOT NULL,
  `clienteID` int(11) NOT NULL,
  `productoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carrito`
--

INSERT INTO `carrito` (`CarritoID`, `clienteID`, `productoID`) VALUES
(17, 1, 3),
(20, 6, 1),
(21, 6, 5),
(22, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `categoriaID` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`categoriaID`, `nombre_categoria`) VALUES
(1, 'conjuntos deportivos'),
(2, 'gorras'),
(3, 'pantalones-jeans'),
(4, 'polos'),
(5, 'chalecos'),
(6, 'madera');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
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
  `fecha_registro` date NOT NULL DEFAULT curdate(),
  `genero` varchar(15) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`clienteID`, `nombre_completo`, `ci`, `correo`, `contraseña`, `telefono`, `direccion`, `ciudad`, `departamentoID`, `fecha_registro`, `genero`, `activo`, `usuario`) VALUES
(1, 'Luis Zeballos', '12896709', 'luis.futuro01@gmail.com', '$2y$10$6IYC5WCpofsEnDZZmdWXl.ZwaY.BjnUi/grEcb9mQ//3yyOmNfRry', '71556955', 'Clle. peñaloza', 'La paz', 1, '2024-09-09', 'M', 1, 'LuisFuturo'),
(2, 'Alejandro Quiroz', '891268451', 'luis.az.quiroz@gmail.com', '$2y$10$b8XRIvcRZb20klfzEkKnWO4AShMVO5cSrDM0Q1ES2phl.ndzU4QAO', '71556955', 'la paz', 'la paz', 1, '2024-09-09', 'M', 1, 'Alejandro'),
(3, 'Jose Luis', '3348587', 'zequitex@gmail.com', '$2y$10$PyOy9z.e30HXBqLdSruRWef8URkn/fZ53Bwi2FhXjYVqD3id4dCF.', '72047100', '', 'oruro', 4, '2024-09-09', 'M', 1, 'pepe'),
(4, 'Antonio Rojas', '12345678', 'www.ranulfnidor@gmail.com', '$2y$10$8M0vn/MZDfmOIk7j7856VOtD6ZEiNk9rBy2naGxDepiEOUeqYkRvK', '65533340', 'satelite mi altito', 'El Alto', 1, '2024-09-18', 'O', 1, 'Antonio'),
(5, 'victor', '9101491', 'castrovictorhugo2006@gmail.com', '$2y$10$VLtDEokOKKUruLvuxq1u5OdKQzJTyAwNImf78eKsltkkvltplOh5y', '78839961', 'SOPOCACHI', 'La Paz', 1, '2024-09-27', 'M', 1, 'vico'),
(6, 'Alejandro Morales', '12993402', 'alejandritoms@gmail.com', '$2y$10$7IJoEB2gxvPwwaZJ9ZSht.CDlVWWyVIPvVyeoFxBy9X0F9hpUDhBq', '71556955', '20 de octubre', 'la paz', 1, '2024-10-04', 'M', 1, 'morales');

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE `departamentos` (
  `departamentoID` int(11) NOT NULL,
  `nombre_departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`departamentoID`, `nombre_departamento`) VALUES
(1, 'La Paz'),
(2, 'Santa Cruz'),
(3, 'Cochabamba'),
(4, 'Oruro'),
(5, 'Potosí'),
(6, 'Tarija'),
(7, 'Chuquisaca'),
(8, 'Beni'),
(9, 'Pando');

-- --------------------------------------------------------

--
-- Table structure for table `direcciones_envio`
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

--
-- Dumping data for table `direcciones_envio`
--

INSERT INTO `direcciones_envio` (`direccionID`, `clienteID`, `nombre_destinatario`, `direccion`, `ciudad`, `departamentoID`, `referencia`) VALUES
(1, 1, 'Luis Zeballos', 'Clle. peñaloza', '', 1, '71556955'),
(2, 1, 'Luis Zeballos', 'Clle. peñaloza', '', 1, '71556955'),
(3, 5, 'victor', 'SOPOCACHI', '', 1, '78839961');

-- --------------------------------------------------------

--
-- Table structure for table `formas_pago`
--

CREATE TABLE `formas_pago` (
  `forma_pagoID` int(11) NOT NULL,
  `nombre_forma_pago` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `formas_pago`
--

INSERT INTO `formas_pago` (`forma_pagoID`, `nombre_forma_pago`) VALUES
(1, 'transferencia QR');

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `pedidoID` int(11) NOT NULL,
  `clienteID` int(11) DEFAULT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_entrega` date DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `forma_pagoID` int(11) DEFAULT NULL,
  `detalle` text DEFAULT NULL,
  `servicioID` int(11) DEFAULT NULL,
  `productoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`pedidoID`, `clienteID`, `fecha_pedido`, `fecha_entrega`, `total`, `forma_pagoID`, `detalle`, `servicioID`, `productoID`) VALUES
(1, 1, '2024-09-18 20:12:35', NULL, 50.00, 1, 'dszrrze', NULL, NULL),
(2, 1, '2024-09-18 20:14:34', NULL, 11490.00, 1, 'w3243ewsessytgytgfy', NULL, NULL),
(3, 5, '2024-09-27 18:02:31', NULL, 175.00, 1, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `productoID` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoriaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`productoID`, `nombre_producto`, `descripcion`, `precio`, `stock`, `categoriaID`) VALUES
(1, 'CONJUNTO NEGRO', 'conjunto de deportivo negro con lineas rojas de fergus', 50.00, 100, 1),
(2, 'CONJUNTO ROJO', 'conjunto rojo con plomo de fergus', 50.00, 100, 1),
(3, 'CONJUNTO AMARILLO-AZUL', 'conjunto amarillo con azul de fergus', 50.00, 100, 1),
(4, 'CONJUNTO ROJO-AZUL', 'conjunto rojo con azul de lorem con lineas blancas ', 50.00, 100, 1),
(5, 'CONJUNTO NEGRO-AZUL', 'conjunto negro con azul y blanco, de fergus', 50.00, 100, 1),
(6, 'CONJUNTO ARGENTINO', 'conjunto argentino con el 3 mundial', 50.00, 100, 1),
(7, 'CONJUNTO BLANCO-PLOMO', 'conjunto blanco con plomo de adidas con diseños rojos y negros', 50.00, 100, 1),
(8, 'CONJUNTO BLANCO-NEGRO', 'conjunto blanco con negro de psg con patrocinio de nike', 50.00, 100, 1),
(9, 'GORRA COMPLETA', 'gorra para viaje ploma, de scpta', 25.00, 50, 2),
(10, 'GORRA CREMA NIKE', 'gorra color crema de nike con bordado LA', 25.00, 50, 2),
(11, 'GORRA ROJA NY', 'gorra roja con frente larga de NY', 25.00, 50, 2),
(12, 'GORRA BLANCA', 'gorra blanca bordada con negro ajustable', 25.00, 50, 2),
(13, 'GORRA PLOMA-MALLA', 'gorra Plomma con malla de triumph motorcycles', 25.00, 50, 2),
(14, 'GORRA CAQUI-BOLIVIA', 'Gorra caqui de bolivia color beich, multicolor', 25.00, 50, 2),
(15, 'GORRA NEGRA-ADIDAS', 'gorra negra con malla, de adidas deportiva', 25.00, 50, 2),
(16, 'GORRA BLANCA-ADIDAS', 'gorra simple blanca de adidas', 25.00, 50, 2),
(17, 'GORRA AZUL-BOLIVIA', 'gorra azul de bolivia con bordado y apaches', 25.00, 50, 2),
(18, 'GORRA DEPORTIVA-ADIDAS', 'gorra blanca de adidas bordada con color negro', 25.00, 50, 2),
(19, 'GORRA EXOTICO', 'gorra con diseño exotico bordado y cortes vinil color negro con dorado', 25.00, 50, 2),
(20, 'JEANS-AZULES', 'conjunto de jeans multicolor y de toda talla', 210.00, 80, 3),
(21, 'PANTALON DE TELA PLOMO', 'pantalon de tela plomo y formal', 190.00, 80, 3),
(22, 'PANTALON DE TELA MARENGO', 'pantalon de tela marengo con diseño elastico para niños desde talla 6-s', 250.00, 80, 3),
(23, 'PANTALON DE VESTIR GRIS', 'pantalon de tela gris con diseño elastico para vestir', 210.00, 60, 3),
(24, 'POLO BLANCO-CUELLO CAMISA', 'polo blanco con diseño de botones tipo camisa', 98.00, 20, 4),
(25, 'POLERA SELECCIÓN BOLIVIANA', 'polera de la seleccion boliviana, con vinilo (actualizada)', 210.00, 60, 4),
(26, 'POLERA SELECCIÓN BOLIVIANA ALTERNATIVA', 'polera blanca con diseño de bolivia blanca y de marathon', 210.00, 60, 4),
(27, 'POLO NEGRO', 'Diseño de polo negro con mole de tigre', 210.00, 60, 4),
(28, 'POLO MIXTO-SERIGRAFIADO', 'poloes unitam mixto 2X1', 210.00, 60, 4),
(29, 'POLO ROJO-SERIGRAFIADO', 'Polo rojo con sefigrafiado de La Paz en blanco', 210.00, 60, 4),
(30, 'POLO PLOMO-SERIGRAFIADO', 'Polo plomo serigrafiado con el Mandalorian en blanco y negro', 210.00, 60, 4),
(31, 'CHALECO INDUSTRIAL', 'Chaleco industrial de seguridad con logo de zequitex', 210.00, 60, 5),
(32, 'CHALECO DE VIAJE BLANCO', 'chaleco de viaje blanco para uso en bosque', 210.00, 60, 5),
(33, 'CHALECO DE VIAJE AZUL-MARINO', 'chaleco de viaje azul para uso en excursion', 210.00, 60, 5),
(34, 'CHALECO DE VIAJE PLOMO', 'chaleco de viaje plomo para excursion larga', 210.00, 60, 5),
(35, 'CHALECO DE SEGURIDAD-FLUORESCENTE', 'chaleco industrial para seguridad con diseño fluorescente', 210.00, 60, 5),
(36, 'CAJAS DE MESA', 'cajas pequeñas de recuerdo con corte laser', 100.00, 20, 6),
(37, 'COFRES DE MADERA', 'cofre de madera a medida y corte laser', 100.00, 20, 6),
(38, 'ESTUCHE SERIGRAFIADO', 'estuche del banco fie negro con serigrafia', 100.00, 20, 6),
(39, 'RECUERDO LA PAZ', 'recuerdo de la paz con grabado laser en madera', 100.00, 20, 6),
(40, 'LLAVERO CORAZON', 'llavero de corazon para el dia de la madre', 100.00, 20, 6),
(41, 'LLAVERO DE SAN FRANCISCO', 'Llavero de recuerdo del colegio San Francisco con corte laser', 100.00, 20, 6),
(42, 'LLAVERO UMSA', 'Llavero de la UMSA con corte laser para universidades', 100.00, 20, 6);

-- --------------------------------------------------------

--
-- Table structure for table `servicios`
--

CREATE TABLE `servicios` (
  `servicioID` int(11) NOT NULL,
  `nombre_servicio` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servicios`
--

INSERT INTO `servicios` (`servicioID`, `nombre_servicio`, `descripcion`) VALUES
(1, 'Bordados Computarizados', 'Personalización de prendas y productos con bordados a máquina controlados por computadora'),
(2, 'Desarrollo de Ponchadas', 'Creación de patrones y diseños específicos para bordados'),
(3, 'Serigrafía', 'Técnica de impresión mediante plantillas para aplicar tinta sobre tejidos y otros materiales'),
(4, 'Sublimación Total', 'Impresión digital de alta calidad sobre tejidos de poliéster y productos preparados para sublimación'),
(5, 'DTF (Direct-to-Film)', 'Impresión directa en películas especiales que se transfieren a prendas con calor'),
(6, 'DTG (Direct-to-Garment)', 'Impresión directa sobre prendas de vestir, ideal para diseños complejos y coloridos'),
(7, 'FTS (Film Transfer System)', 'Tecnología de transferencia de imágenes o gráficos mediante una película transferible aplicada a tejidos'),
(8, 'Estampado con Transfer', 'Aplicación de diseños impresos en papel transfer y adheridos a prendas con calor'),
(9, 'Impresión Láser', 'Grabado y corte de precisión en diversos materiales como madera, acrílico, papel, y algunos tejidos'),
(10, 'Corte Plotter', 'Corte de vinilo y otros materiales finos para personalización y señalética'),
(11, 'Corte Láser en Tela', 'Corte de precisión en tejidos para aplicaciones de moda y confección'),
(12, 'Corte Láser en MDF', 'Producción de piezas de madera MDF para decoración y señalética'),
(13, 'Corte Láser en Acrílico', 'Elaboración de piezas de acrílico cortadas con precisión para diversos usos'),
(14, 'Confección de Ropa de Vestir', 'Diseño y fabricación de prendas de moda para uso diario o especial'),
(15, 'Confección de Ropa de Trabajo', 'Producción de uniformes y ropa funcional para el trabajo, diseñada para durabilidad y confort'),
(16, 'Vinilo Textil:', 'Personalización de prendas con vinilos de colores y texturas, ideal para camisetas, sudaderas y ropa deportiva'),
(17, 'Impresión UV:', 'Impresión sobre superficies rígidas como madera con tintas curadas por UV, adecuada para artículos decorativos y personalizados'),
(18, 'Foil Stamping:', 'Aplicación de papel de aluminio para efectos metálicos en prendas, perfecto para detalles llamativos en ropa'),
(19, 'Tampones de Impresión (Pad Printing):', 'Impresión sobre superficies irregulares de madera, utilizada para personalizar objetos y detalles en productos'),
(20, 'Heat Press Printing:', 'Utilización de prensas térmicas para transferencias duraderas y vibrantes en prendas, ideal para camisetas y ropa deportiva'),
(21, 'Impresión en Madera:', 'Técnicas de impresión y grabado sobre madera para crear diseños personalizados y productos decorativos'),
(22, 'Corte Láser en Madera:', 'Corte de precisión en madera para la creación de detalles decorativos y piezas personalizadas'),
(23, 'Grabado en Madera:', 'Técnicas de grabado para personalizar y decorar superficies de madera con diseños complejos');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`CarritoID`),
  ADD KEY `clienteID` (`clienteID`),
  ADD KEY `productoID` (`productoID`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoriaID`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`clienteID`),
  ADD UNIQUE KEY `ci` (`ci`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `departamentoID` (`departamentoID`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`departamentoID`);

--
-- Indexes for table `direcciones_envio`
--
ALTER TABLE `direcciones_envio`
  ADD PRIMARY KEY (`direccionID`),
  ADD KEY `clienteID` (`clienteID`),
  ADD KEY `departamentoID` (`departamentoID`);

--
-- Indexes for table `formas_pago`
--
ALTER TABLE `formas_pago`
  ADD PRIMARY KEY (`forma_pagoID`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedidoID`),
  ADD KEY `clienteID` (`clienteID`),
  ADD KEY `forma_pagoID` (`forma_pagoID`),
  ADD KEY `fk_servicioID` (`servicioID`),
  ADD KEY `fk_productoID` (`productoID`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`productoID`),
  ADD KEY `fk_categoria` (`categoriaID`);

--
-- Indexes for table `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`servicioID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carrito`
--
ALTER TABLE `carrito`
  MODIFY `CarritoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `clienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `departamentoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `direcciones_envio`
--
ALTER TABLE `direcciones_envio`
  MODIFY `direccionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `formas_pago`
--
ALTER TABLE `formas_pago`
  MODIFY `forma_pagoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedidoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `productoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `servicios`
--
ALTER TABLE `servicios`
  MODIFY `servicioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`productoID`) REFERENCES `productos` (`productoID`);

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`departamentoID`) REFERENCES `departamentos` (`departamentoID`);

--
-- Constraints for table `direcciones_envio`
--
ALTER TABLE `direcciones_envio`
  ADD CONSTRAINT `direcciones_envio_ibfk_1` FOREIGN KEY (`departamentoID`) REFERENCES `departamentos` (`departamentoID`);

--
-- Constraints for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_productoID` FOREIGN KEY (`productoID`) REFERENCES `productos` (`productoID`),
  ADD CONSTRAINT `fk_servicioID` FOREIGN KEY (`servicioID`) REFERENCES `servicios` (`servicioID`),
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`forma_pagoID`) REFERENCES `formas_pago` (`forma_pagoID`);

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`categoriaID`) REFERENCES `categorias` (`categoriaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

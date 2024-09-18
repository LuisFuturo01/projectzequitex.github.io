-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2024 a las 06:47:17
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
-- Base de datos: `basededatos`
--
CREATE DATABASE IF NOT EXISTS `basededatos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `basededatos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablaalumnos`
--

CREATE TABLE `tablaalumnos` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `APELLIDOS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tablaalumnos`
--

INSERT INTO `tablaalumnos` (`ID`, `NOMBRE`, `APELLIDOS`) VALUES
(1, 'maria', 'garcia'),
(2, 'jose', 'ramirez'),
(3, 'joaquin', 'torrez'),
(4, 'misael', 'sonco'),
(5, 'fernando', 'diaz'),
(6, 'sonia', 'fernandez'),
(7, 'patricio', 'gomez');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tablaalumnos`
--
ALTER TABLE `tablaalumnos`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tablaalumnos`
--
ALTER TABLE `tablaalumnos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Base de datos: `dbexa`
--
CREATE DATABASE IF NOT EXISTS `dbexa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbexa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talumno`
--

CREATE TABLE `talumno` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `talumno`
--

INSERT INTO `talumno` (`id`, `nombre`, `apellido`) VALUES
(1, 'María', 'Fernández'),
(2, 'Pedro', 'Ortiz'),
(3, 'Ana', 'Suárez'),
(4, 'Carlos', 'Morales'),
(5, 'Lucía', 'Navarro'),
(6, 'Juan', 'Mendoza'),
(7, 'Elena', 'Ramos'),
(8, 'Javier', 'Ruiz'),
(9, 'Marta', 'Silva'),
(10, 'Tomás', 'Díaz'),
(11, 'Ranulfo', 'Rojas'),
(12, 'Victor', 'Castro');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `talumno`
--
ALTER TABLE `talumno`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `talumno`
--
ALTER TABLE `talumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Volcado de datos para la tabla `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'ZEQUITEX', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"categorias\",\"clientes\",\"departamentos\",\"detalle_pedido\",\"direcciones_envio\",\"empleados\",\"formas_pago\",\"impuestos\",\"materiales\",\"pedidos\",\"productos\",\"proveedores\",\"servicios\"],\"table_structure[]\":[\"categorias\",\"clientes\",\"departamentos\",\"detalle_pedido\",\"direcciones_envio\",\"empleados\",\"formas_pago\",\"impuestos\",\"materiales\",\"pedidos\",\"productos\",\"proveedores\",\"servicios\"],\"table_data[]\":[\"categorias\",\"clientes\",\"departamentos\",\"detalle_pedido\",\"direcciones_envio\",\"empleados\",\"formas_pago\",\"impuestos\",\"materiales\",\"pedidos\",\"productos\",\"proveedores\",\"servicios\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"zequitex\",\"table\":\"productos\"},{\"db\":\"zequitex\",\"table\":\"carrito\"},{\"db\":\"zequitex\",\"table\":\"categorias\"},{\"db\":\"zequitex\",\"table\":\"departamentos\"},{\"db\":\"zequitex\",\"table\":\"direcciones_envio\"},{\"db\":\"zequitex\",\"table\":\"formas_pago\"},{\"db\":\"zequitex\",\"table\":\"pedidos\"},{\"db\":\"zequitex\",\"table\":\"empleados\"},{\"db\":\"zequitex\",\"table\":\"clientes\"},{\"db\":\"zequitex\",\"table\":\"detalle_pedido\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'zequitex', 'productos', '{\"sorted_col\":\"`productos`.`productoID` ASC\",\"CREATE_TIME\":\"2024-09-01 18:17:40\",\"col_order\":[0,1,2,3,4,5],\"col_visib\":[1,1,1,1,1,1]}', '2024-09-02 21:16:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2024-09-18 04:47:07', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\",\"ThemeDefault\":\"blueberry\",\"NavigationWidth\":343.18182373046875}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `zequitex`
--
CREATE DATABASE IF NOT EXISTS `zequitex` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `zequitex`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `CarritoID` int(11) NOT NULL,
  `clienteID` int(11) NOT NULL,
  `productoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`CarritoID`, `clienteID`, `productoID`) VALUES
(1, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoriaID` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
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
  `fecha_registro` date NOT NULL DEFAULT curdate(),
  `genero` varchar(15) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`clienteID`, `nombre_completo`, `ci`, `correo`, `contraseña`, `telefono`, `direccion`, `ciudad`, `departamentoID`, `fecha_registro`, `genero`, `activo`, `usuario`) VALUES
(1, 'Luis Zeballos', '12896709', 'luis.futuro01@gmail.com', '$2y$10$6IYC5WCpofsEnDZZmdWXl.ZwaY.BjnUi/grEcb9mQ//3yyOmNfRry', '71556955', 'Clle. peñaloza', 'La paz', 1, '2024-09-09', 'M', 1, 'LuisFuturo'),
(2, 'Alejandro Quiroz', '891268451', 'luis.az.quiroz@gmail.com', '$2y$10$b8XRIvcRZb20klfzEkKnWO4AShMVO5cSrDM0Q1ES2phl.ndzU4QAO', '71556955', 'la paz', 'la paz', 1, '2024-09-09', 'M', 1, 'Alejandro'),
(3, 'Jose Luis', '3348587', 'zequitex@gmail.com', '$2y$10$PyOy9z.e30HXBqLdSruRWef8URkn/fZ53Bwi2FhXjYVqD3id4dCF.', '72047100', '', 'oruro', 4, '2024-09-09', 'M', 1, 'pepe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `departamentoID` int(11) NOT NULL,
  `nombre_departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
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
-- Estructura de tabla para la tabla `formas_pago`
--

CREATE TABLE `formas_pago` (
  `forma_pagoID` int(11) NOT NULL,
  `nombre_forma_pago` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formas_pago`
--

INSERT INTO `formas_pago` (`forma_pagoID`, `nombre_forma_pago`) VALUES
(1, 'transferencia QR');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `pedidoID` int(11) NOT NULL,
  `clienteID` int(11) DEFAULT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_entrega` date DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `forma_pagoID` int(11) DEFAULT NULL,
  `detalle` text DEFAULT NULL
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
  `categoriaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
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
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `servicioID` int(11) NOT NULL,
  `nombre_servicio` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
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
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`CarritoID`),
  ADD KEY `clienteID` (`clienteID`),
  ADD KEY `productoID` (`productoID`);

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
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `departamentoID` (`departamentoID`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`departamentoID`);

--
-- Indices de la tabla `direcciones_envio`
--
ALTER TABLE `direcciones_envio`
  ADD PRIMARY KEY (`direccionID`),
  ADD KEY `clienteID` (`clienteID`),
  ADD KEY `departamentoID` (`departamentoID`);

--
-- Indices de la tabla `formas_pago`
--
ALTER TABLE `formas_pago`
  ADD PRIMARY KEY (`forma_pagoID`);

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
  ADD KEY `fk_categoria` (`categoriaID`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`servicioID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `CarritoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `clienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `departamentoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `direcciones_envio`
--
ALTER TABLE `direcciones_envio`
  MODIFY `direccionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formas_pago`
--
ALTER TABLE `formas_pago`
  MODIFY `forma_pagoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedidoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `productoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `servicioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`clienteID`) REFERENCES `clientes` (`clienteID`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`productoID`) REFERENCES `productos` (`productoID`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`departamentoID`) REFERENCES `departamentos` (`departamentoID`);

--
-- Filtros para la tabla `direcciones_envio`
--
ALTER TABLE `direcciones_envio`
  ADD CONSTRAINT `direcciones_envio_ibfk_1` FOREIGN KEY (`departamentoID`) REFERENCES `departamentos` (`departamentoID`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`forma_pagoID`) REFERENCES `formas_pago` (`forma_pagoID`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`categoriaID`) REFERENCES `categorias` (`categoriaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

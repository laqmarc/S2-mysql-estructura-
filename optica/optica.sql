SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(11) UNSIGNED NOT NULL,
  `nom` varchar(45) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `telefon` int(9) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `data_registre` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_client_recomanat` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `nom`, `adress`, `telefon`, `email`, `data_registre`, `id_client_recomanat`) VALUES
(1, 'Marc Llobera', 'Varrer 22 ', 123456789, 'lala@lolo.com', '2022-05-13 12:49:42', NULL),
(2, 'Marc Llobera', '6786656768', 635359438, 'laqmarc@gmail.com', '2022-05-14 08:46:50', NULL),
(3, 'Marc Llobera', '6786656768', 635359438, 'laqmarc@gmail.com', '2022-05-14 08:46:53', NULL),
(4, 'Marc Llobera', '6786656768', 635359438, 'laqmarc@gmail.com', '2022-05-14 08:46:55', NULL),
(5, 'Marc Llobera', '6786656768', 635359438, 'laqmarc@gmail.com', '2022-05-14 08:46:57', NULL),
(6, 'Marc Llobera', '6786656768', 635359438, 'laqmarc@gmail.com', '2022-05-14 08:46:59', NULL),
(7, 'Marc Llobera', '6786656768', 635359438, 'laqmarc@gmail.com', '2022-05-14 08:47:02', NULL),
(8, 'Marc Llobera', '6786656768', 635359438, 'laqmarc@gmail.com', '2022-05-14 08:47:03', NULL),
(9, 'Marc Llobera', '6786656768', 635359438, 'laqmarc@gmail.com', '2022-05-14 08:47:04', NULL),
(10, 'Marc', 'asfsd sdf', 234234, 'lkrwer@dfd.com', '2022-05-14 08:47:07', NULL),
(139, '', '', 0, '', '2022-05-14 10:14:36', NULL),
(140, 'Samu', 'Bilbao', 2147483647, 'samu@samu.com', '2022-05-14 10:23:01', NULL),
(141, 'Samu', 'Bilbao', 2147483647, 'samu@samu.com', '2022-05-14 10:23:24', NULL),
(142, 'Samu', 'Bilbao', 2147483647, 'samu@samu.com', '2022-05-14 10:25:18', NULL),
(143, 'SS1', 'qweqw', 1231, '423', '2022-05-14 10:25:26', NULL),
(144, 'aaa', 'bbb', 0, 'ddd', '2022-05-14 10:29:27', NULL),
(145, 'Client 1', 'Carrer lala', 123123123, 'laq', '2022-05-14 10:49:45', NULL),
(146, 'Marc Llobera', 'ccc', 635359438, 'laqmarc@gmail.com', '2022-05-16 09:40:42', NULL),
(147, 'PEPE', 'asasd', 123123123, 'lala@fofo.com', '2022-05-16 09:43:11', NULL),
(148, 'Marcsaad da', 'aqsfhkjk', 2423423, 'la@hhf.com', '2022-05-16 10:07:07', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `id` int(11) UNSIGNED NOT NULL,
  `nom` varchar(45) NOT NULL,
  `data_registre` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleats`
--

INSERT INTO `empleats` (`id`, `nom`, `data_registre`) VALUES
(1, 'Marc treballador', '2022-05-13 12:32:11'),
(2, 'Rubén treballador', '2022-05-13 12:32:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidors`
--

CREATE TABLE `proveidors` (
  `id` int(11) UNSIGNED NOT NULL,
  `nom` varchar(45) NOT NULL,
  `carrer` varchar(45) NOT NULL,
  `numero` int(5) NOT NULL,
  `pis` int(5) DEFAULT NULL,
  `porta` varchar(45) DEFAULT NULL,
  `ciutat` varchar(45) NOT NULL,
  `codi_postal` int(5) UNSIGNED ZEROFILL NOT NULL,
  `pais` varchar(45) NOT NULL,
  `telefon` int(9) NOT NULL,
  `fax` int(9) DEFAULT NULL,
  `nif` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidors`
--

INSERT INTO `proveidors` (`id`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES
(1, 'P', 'sdasf', 12, 12, '23', 'BCN', 08023, 'ES', 23232323, 23232323, '2323232n'),
(2, 'P2', '23 ', 23, 12, '23', 'ES', 08000, 'ES', 23092830, 2382893, 'lkwjelkjwe'),
(3, 'P3', '23 ', 23, 12, '23', 'ES', 08000, 'ES', 23092830, 2382893, 'lkwjelkjwe'),
(4, 'maRC', 'ASD', 23, 2, '2', 'bcn', 08024, 'es', 123123123, 0, '123123'),
(5, 'maRC', 'ASD', 23, 2, '2', 'bcn', 08024, 'es', 123123123, 0, '123123'),
(43, '', '', 0, 0, '', '', 00000, '', 0, 0, ''),
(44, '', 'Carrer lolo', 133, 4, 'A', 'BCN', 00000, 'España', 0, 0, '24343'),
(45, '', '', 0, 0, '', '', 00000, '', 0, 0, ''),
(46, '', '', 0, 0, '', '', 00000, '', 0, 0, ''),
(47, '232323', 'mmmm', 23, 23, 'mm', 'mmm', 00000, 'ES', 0, 0, '2323232'),
(48, '', '', 0, 0, '', '', 00000, '', 0, 0, ''),
(49, '23', 'SD ASD', 23, 23, '23', '23', 00000, '23', 0, 0, '32'),
(50, '123123123', 'Carrer proveidor', 234, 4, 'A', 'BCN', 00000, 'ES', 0, 0, '45345345F'),
(51, '123123123', 'Carrer proveidor', 234, 4, 'A', 'BCN', 08025, 'ES', 0, 0, '45345345F'),
(52, '123123123', 'Carrer proveidor', 234, 4, 'A', 'BCN', 08025, 'ES', 0, 0, '45345345F'),
(53, '111', '111', 11, 11, '11', '11', 11111, '111', 111, 111, '1111'),
(54, '111', '111', 11, 11, '11', '11', 11111, '111', 111, 111, '1111'),
(55, 'P1', 'sdasd', 665, 656, '65', '65', 76576, '67576', 76567, 767656, '76575'),
(56, 'aa', 'aa', 22, 2, '2', '2', 00002, '2', 2222, 222, '2222'),
(57, 'aa', 'aa', 2, 2, '2', '2', 00002, '2', 2, 2, '2'),
(58, 'EE', 'EE', 1, 1, 'A', 'EE', 08025, 'EE', 123, 123, '123'),
(59, 'Proveidor test final', 'Carrer dels tests', 55, 2, 'A', 'BCN', 08025, 'ES', 123123123, 123123123, '453453435G'),
(60, 'b', 'b', 1, 1, 'b', 'b', 00111, 'b', 12, 12, '12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id` int(11) UNSIGNED NOT NULL,
  `marca` varchar(45) NOT NULL,
  `graduacio_left` float NOT NULL,
  `graduacio_right` float NOT NULL,
  `muntura` enum('Flotant','Pasta','Metàl.lica') NOT NULL,
  `muntura_color` varchar(45) NOT NULL,
  `vidre_left_color` varchar(45) NOT NULL,
  `vidre_right_color` varchar(45) NOT NULL,
  `preu` float NOT NULL,
  `id_proveidor` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id`, `marca`, `graduacio_left`, `graduacio_right`, `muntura`, `muntura_color`, `vidre_left_color`, `vidre_right_color`, `preu`, `id_proveidor`) VALUES
(1, 'Marca A', 0, 0.4, 'Pasta', 'Verd', 'TR', 'TR', 234, 1),
(2, 'Marca A', 3.44, 2.4, 'Pasta', 'Verd', 'TR', 'TR', 234, 2),
(3, 'M3', 1.3, 1, 'Metàl.lica', 'Verd', 'TR', 'TR', 222, 3),
(4, 'M3', 0.5, 2, 'Flotant', 'Verd', 'TR', 'TR', 222, 3),
(7, 'M4', 3.4, 4, 'Metàl.lica', 'Verrd', 'TR', 'TR', 350, 3),
(8, 'M4', 1, 2, 'Metàl.lica', 'Verrd', 'TR', 'TR', 350.5, 3),
(13, 'Ulleres 66', 4, 4, 'Pasta', 'Rosa', 'Rosa', 'Rosa', 342, 1),
(17, 'Marca Ulleres 33', 2, 4, 'Pasta', 'FF', 'FF', 'FF', 55, 3),
(18, 'Marca Ulleres 33', 2, 4, 'Pasta', 'FF', 'FF', 'FF', 55, 3),
(22, 'Ulleres 44', 4, 4, 'Metàl.lica', 'Red', 'Red', 'Red', 233, 1),
(24, 'Ulleres ultima', 12, 12, 'Pasta', 'red', 'red', 'red', 123, 1),
(25, 'Ulleres ultima', 12, 12, 'Pasta', 'red', 'red', 'red', 123, 1),
(27, 'Provant decimals ', 3.3, 4.3, 'Metàl.lica', 'd', 'd', 'd', 45.67, 3),
(30, '1', 1, 1, 'Flotant', '1', '1', '1', 1, 1),
(31, '2', 2, 2, 'Pasta', '2', '2', '2', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventes`
--

CREATE TABLE `ventes` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_client` int(11) UNSIGNED NOT NULL,
  `id_empleat` int(11) UNSIGNED NOT NULL,
  `data_venta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventes`
--

INSERT INTO `ventes` (`id`, `id_client`, `id_empleat`, `data_venta`) VALUES
(1, 1, 1, '2022-05-13 12:51:35'),
(2, 1, 1, '2022-05-13 12:51:35'),
(3, 4, 2, '2022-05-14 08:56:21'),
(4, 10, 1, '2022-05-14 08:56:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventes_detall`
--

CREATE TABLE `ventes_detall` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_ulleres` int(11) UNSIGNED NOT NULL,
  `cantitat` int(11) UNSIGNED NOT NULL,
  `id_ventes` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventes_detall`
--

INSERT INTO `ventes_detall` (`id`, `id_ulleres`, `cantitat`, `id_ventes`) VALUES
(1, 4, 2, 1),
(2, 1, 1, 2),
(3, 1, 1, 3),
(4, 8, 1, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proveidor` (`id_proveidor`);

--
-- Indices de la tabla `ventes`
--
ALTER TABLE `ventes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Id_client` (`id_client`),
  ADD KEY `id_empleat` (`id_empleat`);

--
-- Indices de la tabla `ventes_detall`
--
ALTER TABLE `ventes_detall`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ulleres` (`id_ulleres`),
  ADD KEY `id_venta` (`id_ventes`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT de la tabla `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `ventes`
--
ALTER TABLE `ventes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventes_detall`
--
ALTER TABLE `ventes_detall`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `id proveidor` FOREIGN KEY (`id_proveidor`) REFERENCES `proveidors` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventes`
--
ALTER TABLE `ventes`
  ADD CONSTRAINT `Id_client` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `id_empleat` FOREIGN KEY (`id_empleat`) REFERENCES `empleats` (`id`);

--
-- Filtros para la tabla `ventes_detall`
--
ALTER TABLE `ventes_detall`
  ADD CONSTRAINT `id_ulleres` FOREIGN KEY (`id_ulleres`) REFERENCES `ulleres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_venta` FOREIGN KEY (`id_ventes`) REFERENCES `ventes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

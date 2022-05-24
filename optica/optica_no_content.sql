
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `adress` varchar(100) NOT NULL,
  `telefon` int(9) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `data_registre` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_client_recomanat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `data_registre` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `proveidors`
--

CREATE TABLE `proveidors` (
  `id` int(11) NOT NULL,
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
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id` int(11) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `graduacio_left` float NOT NULL,
  `graduacio_right` float NOT NULL,
  `muntura` enum('Flotant','Pasta','Metàl.lica') NOT NULL,
  `muntura_color` varchar(45) NOT NULL,
  `vidre_left_color` varchar(45) NOT NULL,
  `vidre_right_color` varchar(45) NOT NULL,
  `preu` float NOT NULL,
  `id_proveidor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `ventes`
--

CREATE TABLE `ventes` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_empleat` int(11) NOT NULL,
  `data_venta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Estructura de tabla para la tabla `ventes_detall`
--

CREATE TABLE `ventes_detall` (
  `id` int(11) NOT NULL,
  `id_ulleres` int(11) NOT NULL,
  `cantitat` int(11) NOT NULL,
  `id_ventes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT de la tabla `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `ventes`
--
ALTER TABLE `ventes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventes_detall`
--
ALTER TABLE `ventes_detall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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

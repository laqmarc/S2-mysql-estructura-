-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2022 a las 12:06:40
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pizzeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname1` varchar(45) NOT NULL,
  `surname2` varchar(45) NOT NULL,
  `adress` varchar(45) NOT NULL,
  `postal_code` int(5) UNSIGNED ZEROFILL NOT NULL,
  `location_id` int(11) NOT NULL,
  `phone` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `customer`
--

INSERT INTO `customer` (`id`, `name`, `surname1`, `surname2`, `adress`, `postal_code`, `location_id`, `phone`) VALUES
(1, 'Barna', 'amb', 'gana', 'Carrer de la gana 1', 08001, 1, 123456789),
(2, 'Madriz', 'con', 'hambre', 'Calle del hambre', 28001, 2, 123456789);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `id_state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `location`
--

INSERT INTO `location` (`id`, `name`, `id_state`) VALUES
(1, 'Barcelona', 1),
(2, 'Madrid', 2),
(3, 'Hospitalet', 1),
(4, 'Getafe', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `order_type` enum('take_away','delivery') NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_dhop` int(11) NOT NULL,
  `id_worker` int(11) NOT NULL,
  `order_time_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_customer_recived` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `order`
--

INSERT INTO `order` (`id`, `order_type`, `id_customer`, `id_dhop`, `id_worker`, `order_time_creation`, `order_customer_recived`) VALUES
(3, 'take_away', 1, 1, 1, '2022-05-16 13:14:46', '2022-05-16 15:13:49'),
(4, 'delivery', 2, 2, 4, '2022-05-16 13:15:14', '2022-05-16 15:14:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `product_id`, `product_quantity`) VALUES
(5, 4, 1, 1),
(6, 4, 4, 1),
(7, 3, 1, 2),
(8, 3, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `url_image` text NOT NULL,
  `price` int(11) NOT NULL,
  `id_cat_products` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `url_image`, `price`, `id_cat_products`) VALUES
(1, 'Beer', 'Lager beer', '/img/beer.png', 3, 1),
(2, 'Chees Burger', '200gr chees burger', '/img/burger.png', 7, 2),
(3, 'Pizza margerita', 'Pizza margerita', '/img/pizza.png', 8, 3),
(4, 'Pizza custom', 'Make your custom pizza', '/img/pizza2.png', 10, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_cat`
--

CREATE TABLE `products_cat` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `products_cat`
--

INSERT INTO `products_cat` (`id`, `name`) VALUES
(1, 'Drinks'),
(2, 'Hamburgers'),
(3, 'Pizza 1'),
(4, 'Pizza 2'),
(5, 'Pizza 3'),
(6, 'Pizza 4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `adress` varchar(45) NOT NULL,
  `postal_code` int(5) UNSIGNED ZEROFILL NOT NULL,
  `id_location` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `shops`
--

INSERT INTO `shops` (`id`, `adress`, `postal_code`, `id_location`) VALUES
(1, 'Carrer Cartagena 12', 08025, 1),
(2, 'Calle Atocha 12', 28012, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`id`, `name`) VALUES
(1, 'Catalunya'),
(2, 'Madrid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `workers`
--

CREATE TABLE `workers` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname1` varchar(45) NOT NULL,
  `surname2` varchar(45) NOT NULL,
  `nif` varchar(10) NOT NULL,
  `phone` int(9) NOT NULL,
  `kind_worker` enum('cooker','delivery') NOT NULL,
  `id_shop` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `workers`
--

INSERT INTO `workers` (`id`, `name`, `surname1`, `surname2`, `nif`, `phone`, `kind_worker`, `id_shop`) VALUES
(1, 'Cuiner', 'bon', 'cuiner', '123456789', 123456789, 'cooker', 1),
(2, 'Cooker', 'good', 'cooker', '123456789', 123456789, 'cooker', 2),
(3, 'Repartidor', 'el', 'repartidor', '123123123N', 123456789, 'delivery', 1),
(4, 'Repartidor', 'de', 'Madriz', '123456789L', 123456789, 'delivery', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_location` (`location_id`);

--
-- Indices de la tabla `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_state` (`id_state`);

--
-- Indices de la tabla `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ccc` (`id_customer`),
  ADD KEY `shoooop` (`id_dhop`),
  ADD KEY `worker` (`id_worker`);

--
-- Indices de la tabla `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderid` (`order_id`),
  ADD KEY `producte` (`product_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cat_products` (`id_cat_products`);

--
-- Indices de la tabla `products_cat`
--
ALTER TABLE `products_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`id_location`);

--
-- Indices de la tabla `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_shop` (`id_shop`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `products_cat`
--
ALTER TABLE `products_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `workers`
--
ALTER TABLE `workers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `id_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`);

--
-- Filtros para la tabla `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `id_state` FOREIGN KEY (`id_state`) REFERENCES `state` (`id`);

--
-- Filtros para la tabla `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `ccc` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `shoooop` FOREIGN KEY (`id_dhop`) REFERENCES `shops` (`id`),
  ADD CONSTRAINT `worker` FOREIGN KEY (`id_worker`) REFERENCES `workers` (`id`);

--
-- Filtros para la tabla `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `orderid` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `producte` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `id_cat_products` FOREIGN KEY (`id_cat_products`) REFERENCES `products_cat` (`id`);

--
-- Filtros para la tabla `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `location_id` FOREIGN KEY (`id_location`) REFERENCES `location` (`id`);

--
-- Filtros para la tabla `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `id_shop` FOREIGN KEY (`id_shop`) REFERENCES `shops` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

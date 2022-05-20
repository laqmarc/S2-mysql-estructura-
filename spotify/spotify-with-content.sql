-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2022 a las 19:35:55
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
-- Base de datos: `spotify`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artist`
--

CREATE TABLE `artist` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL,
  `img_src` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `artist`
--

INSERT INTO `artist` (`id`, `name`, `img_src`) VALUES
(1, 'The coders', '/img/the-coders.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artist_algo`
--

CREATE TABLE `artist_algo` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `artist_algo`
--

INSERT INTO `artist_algo` (`id`, `name`) VALUES
(1, 'Algo 1'),
(2, 'Algo 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artist_algo_asignement`
--

CREATE TABLE `artist_algo_asignement` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_artist` int(11) UNSIGNED NOT NULL,
  `id_artist_algorith` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `artist_algo_asignement`
--

INSERT INTO `artist_algo_asignement` (`id`, `id_artist`, `id_artist_algorith`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE `country` (
  `id` int(11) UNSIGNED NOT NULL,
  `country_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `country`
--

INSERT INTO `country` (`id`, `country_name`) VALUES
(1, 'Spain'),
(2, 'France');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gender`
--

CREATE TABLE `gender` (
  `id` int(11) UNSIGNED NOT NULL,
  `gender_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gender`
--

INSERT INTO `gender` (`id`, `gender_name`) VALUES
(1, 'you don\'t care'),
(2, 'woman'),
(3, 'man');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `location`
--

CREATE TABLE `location` (
  `id` int(11) UNSIGNED NOT NULL,
  `location_name` varchar(45) NOT NULL,
  `id_country` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `location`
--

INSERT INTO `location` (`id`, `location_name`, `id_country`) VALUES
(1, 'Barcelona', 1),
(2, 'Paris', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `payment_date` date NOT NULL,
  `total_price` int(11) UNSIGNED NOT NULL,
  `id_payment_type` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `payment_date`, `total_price`, `id_payment_type`) VALUES
(1, 1, '2022-05-19', 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment-type`
--

CREATE TABLE `payment-type` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_subcription` int(11) UNSIGNED DEFAULT NULL,
  `id_payment_type_card` int(11) UNSIGNED DEFAULT NULL,
  `id_payment_type_paypal` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `payment-type`
--

INSERT INTO `payment-type` (`id`, `id_subcription`, `id_payment_type_card`, `id_payment_type_paypal`) VALUES
(1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment-type-card`
--

CREATE TABLE `payment-type-card` (
  `id` int(11) UNSIGNED NOT NULL,
  `card_number` bigint(16) UNSIGNED NOT NULL,
  `card_year` int(4) UNSIGNED NOT NULL,
  `card_month` int(2) UNSIGNED ZEROFILL NOT NULL,
  `card_code` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `payment-type-card`
--

INSERT INTO `payment-type-card` (`id`, `card_number`, `card_year`, `card_month`, `card_code`) VALUES
(1, 1234567890123456, 2026, 05, 765);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment-type-paypal`
--

CREATE TABLE `payment-type-paypal` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_paypal_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist`
--

CREATE TABLE `playlist` (
  `id` int(11) UNSIGNED NOT NULL,
  `date_create` date NOT NULL,
  `id_playlist_type` int(11) UNSIGNED NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `playlist`
--

INSERT INTO `playlist` (`id`, `date_create`, `id_playlist_type`, `name`) VALUES
(1, '2022-05-19', 1, 'Playlist 1'),
(2, '2022-05-20', 2, 'Playlist 2 del');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist_deleted`
--

CREATE TABLE `playlist_deleted` (
  `id` int(11) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_playlist` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `playlist_deleted`
--

INSERT INTO `playlist_deleted` (`id`, `date`, `id_playlist`) VALUES
(1, '2022-05-19 17:29:59', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist_type`
--

CREATE TABLE `playlist_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `playlist_type`
--

INSERT INTO `playlist_type` (`id`, `type`) VALUES
(1, 'active'),
(2, 'deleted');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postal_code`
--

CREATE TABLE `postal_code` (
  `id` int(11) UNSIGNED NOT NULL,
  `postal_code_number` int(5) UNSIGNED ZEROFILL NOT NULL,
  `id_location` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `postal_code`
--

INSERT INTO `postal_code` (`id`, `postal_code_number`, `id_location`) VALUES
(1, 08015, 1),
(2, 99999, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `record`
--

CREATE TABLE `record` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `img_src` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `record`
--

INSERT INTO `record` (`id`, `title`, `date`, `img_src`) VALUES
(1, 'The record', '2022-05-04', '/img/the-record.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `song`
--

CREATE TABLE `song` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_record` int(11) UNSIGNED NOT NULL,
  `id_artist` int(11) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL,
  `duration` int(11) UNSIGNED NOT NULL,
  `played` int(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `song`
--

INSERT INTO `song` (`id`, `id_record`, `id_artist`, `title`, `duration`, `played`) VALUES
(1, 1, 1, 'The coders song 1', 123, 66796),
(2, 1, 1, 'The coders song 2', 240, 543);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `song_in_playlist_by_user`
--

CREATE TABLE `song_in_playlist_by_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_song` int(11) UNSIGNED NOT NULL,
  `id_playlist` int(11) UNSIGNED NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `song_in_playlist_by_user`
--

INSERT INTO `song_in_playlist_by_user` (`id`, `id_user`, `id_song`, `id_playlist`, `time_created`) VALUES
(1, 1, 1, 1, '2022-05-19 17:30:52'),
(2, 2, 2, 2, '2022-05-19 17:30:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscription`
--

CREATE TABLE `subscription` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `start_subscription_date` date NOT NULL,
  `renovation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `subscription`
--

INSERT INTO `subscription` (`id`, `id_user`, `start_subscription_date`, `renovation_date`) VALUES
(1, 1, '2022-05-19', '2022-06-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `date_of_birth` date NOT NULL,
  `id_gender` int(11) UNSIGNED NOT NULL,
  `id_postal_code` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `user_name`, `date_of_birth`, `id_gender`, `id_postal_code`) VALUES
(1, 'laqmarc@gmail.com', '79811993888e14becdc3948a4aa7b1ddd9f1b9f1', 'marc', '1980-06-18', 1, 1),
(2, 'france@france.fr', '2o811993888e14becdc39as34aa7b1ddd9f1bdj3', 'france', '1986-05-03', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_create_playlist`
--

CREATE TABLE `user_create_playlist` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_playlist` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_create_playlist`
--

INSERT INTO `user_create_playlist` (`id`, `id_user`, `id_playlist`) VALUES
(3, 1, 1),
(4, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_favorite_record`
--

CREATE TABLE `user_favorite_record` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `iid_record` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_favorite_record`
--

INSERT INTO `user_favorite_record` (`id`, `id_user`, `iid_record`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_favorite_song`
--

CREATE TABLE `user_favorite_song` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_song` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_favorite_song`
--

INSERT INTO `user_favorite_song` (`id`, `id_user`, `id_song`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_follow_artist`
--

CREATE TABLE `user_follow_artist` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_artist` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_follow_artist`
--

INSERT INTO `user_follow_artist` (`id`, `id_user`, `id_artist`) VALUES
(1, 1, 1),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_type`
--

INSERT INTO `user_type` (`id`, `type`) VALUES
(1, 'free'),
(2, 'premium');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_type_asigment`
--

CREATE TABLE `user_type_asigment` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_type` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_type_asigment`
--

INSERT INTO `user_type_asigment` (`id`, `id_user`, `id_type`) VALUES
(1, 1, 2),
(2, 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `artist_algo`
--
ALTER TABLE `artist_algo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `artist_algo_asignement`
--
ALTER TABLE `artist_algo_asignement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_algo_asignement_artist` (`id_artist`),
  ADD KEY `artist_algo_asignement_algo` (`id_artist_algorith`);

--
-- Indices de la tabla `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_country_location` (`id_country`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_orders` (`id_user`),
  ADD KEY `payment_type_orders` (`id_payment_type`);

--
-- Indices de la tabla `payment-type`
--
ALTER TABLE `payment-type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_card` (`id_payment_type_card`),
  ADD KEY `payment_paypal` (`id_payment_type_paypal`),
  ADD KEY `subscription_pyment_type` (`id_subcription`);

--
-- Indices de la tabla `payment-type-card`
--
ALTER TABLE `payment-type-card`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `payment-type-paypal`
--
ALTER TABLE `payment-type-paypal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `playlist_id_type` (`id_playlist_type`);

--
-- Indices de la tabla `playlist_deleted`
--
ALTER TABLE `playlist_deleted`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_playlist_deleted` (`id_playlist`);

--
-- Indices de la tabla `playlist_type`
--
ALTER TABLE `playlist_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `postal_code`
--
ALTER TABLE `postal_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_location_postal_code` (`id_location`);

--
-- Indices de la tabla `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `song`
--
ALTER TABLE `song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artist_song` (`id_artist`),
  ADD KEY `record_song` (`id_record`);

--
-- Indices de la tabla `song_in_playlist_by_user`
--
ALTER TABLE `song_in_playlist_by_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `playlist_song_in_playlist_by_user` (`id_playlist`),
  ADD KEY `song_song_in_playlist_by_user` (`id_song`),
  ADD KEY `user_song_in_playlist_by_user` (`id_user`);

--
-- Indices de la tabla `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_subscription` (`id_user`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gender-user` (`id_gender`),
  ADD KEY `postal-user` (`id_postal_code`);

--
-- Indices de la tabla `user_create_playlist`
--
ALTER TABLE `user_create_playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user_playlist` (`id_user`),
  ADD KEY `id_playlist` (`id_playlist`);

--
-- Indices de la tabla `user_favorite_record`
--
ALTER TABLE `user_favorite_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_user_favorite_record` (`id_user`),
  ADD KEY `record_user_favorite_record` (`iid_record`);

--
-- Indices de la tabla `user_favorite_song`
--
ALTER TABLE `user_favorite_song`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_user_favorite_song` (`id_user`),
  ADD KEY `song_user_favorite_song` (`id_song`);

--
-- Indices de la tabla `user_follow_artist`
--
ALTER TABLE `user_follow_artist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user-user_follow_artist` (`id_user`),
  ADD KEY `aritst-user_follow_artist` (`id_artist`);

--
-- Indices de la tabla `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_type_asigment`
--
ALTER TABLE `user_type_asigment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_user_type_asigment` (`id_user`),
  ADD KEY `type_user_type_asigment` (`id_type`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `artist`
--
ALTER TABLE `artist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `artist_algo`
--
ALTER TABLE `artist_algo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `artist_algo_asignement`
--
ALTER TABLE `artist_algo_asignement`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `payment-type`
--
ALTER TABLE `payment-type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `payment-type-card`
--
ALTER TABLE `payment-type-card`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `payment-type-paypal`
--
ALTER TABLE `payment-type-paypal`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `playlist_deleted`
--
ALTER TABLE `playlist_deleted`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `playlist_type`
--
ALTER TABLE `playlist_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `postal_code`
--
ALTER TABLE `postal_code`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `record`
--
ALTER TABLE `record`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `song`
--
ALTER TABLE `song`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `song_in_playlist_by_user`
--
ALTER TABLE `song_in_playlist_by_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user_create_playlist`
--
ALTER TABLE `user_create_playlist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user_favorite_record`
--
ALTER TABLE `user_favorite_record`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user_favorite_song`
--
ALTER TABLE `user_favorite_song`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user_follow_artist`
--
ALTER TABLE `user_follow_artist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user_type_asigment`
--
ALTER TABLE `user_type_asigment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `artist_algo_asignement`
--
ALTER TABLE `artist_algo_asignement`
  ADD CONSTRAINT `artist_algo_asignement_algo` FOREIGN KEY (`id_artist_algorith`) REFERENCES `artist_algo` (`id`),
  ADD CONSTRAINT `artist_algo_asignement_artist` FOREIGN KEY (`id_artist`) REFERENCES `artist` (`id`);

--
-- Filtros para la tabla `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `id_country_location` FOREIGN KEY (`id_country`) REFERENCES `country` (`id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `payment_type_orders` FOREIGN KEY (`id_payment_type`) REFERENCES `payment-type` (`id`),
  ADD CONSTRAINT `user_orders` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `payment-type`
--
ALTER TABLE `payment-type`
  ADD CONSTRAINT `payment_card` FOREIGN KEY (`id_payment_type_card`) REFERENCES `payment-type-card` (`id`),
  ADD CONSTRAINT `payment_paypal` FOREIGN KEY (`id_payment_type_paypal`) REFERENCES `payment-type-paypal` (`id`),
  ADD CONSTRAINT `subscription_pyment_type` FOREIGN KEY (`id_subcription`) REFERENCES `subscription` (`id`);

--
-- Filtros para la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_id_type` FOREIGN KEY (`id_playlist_type`) REFERENCES `playlist_type` (`id`);

--
-- Filtros para la tabla `playlist_deleted`
--
ALTER TABLE `playlist_deleted`
  ADD CONSTRAINT `id_playlist_deleted` FOREIGN KEY (`id_playlist`) REFERENCES `playlist` (`id`);

--
-- Filtros para la tabla `postal_code`
--
ALTER TABLE `postal_code`
  ADD CONSTRAINT `id_location_postal_code` FOREIGN KEY (`id_location`) REFERENCES `location` (`id`);

--
-- Filtros para la tabla `song`
--
ALTER TABLE `song`
  ADD CONSTRAINT `artist_song` FOREIGN KEY (`id_artist`) REFERENCES `artist` (`id`),
  ADD CONSTRAINT `record_song` FOREIGN KEY (`id_record`) REFERENCES `record` (`id`);

--
-- Filtros para la tabla `song_in_playlist_by_user`
--
ALTER TABLE `song_in_playlist_by_user`
  ADD CONSTRAINT `playlist_song_in_playlist_by_user` FOREIGN KEY (`id_playlist`) REFERENCES `playlist` (`id`),
  ADD CONSTRAINT `song_song_in_playlist_by_user` FOREIGN KEY (`id_song`) REFERENCES `song` (`id`),
  ADD CONSTRAINT `user_song_in_playlist_by_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `subscription`
--
ALTER TABLE `subscription`
  ADD CONSTRAINT `user_subscription` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `gender-user` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`id`),
  ADD CONSTRAINT `postal-user` FOREIGN KEY (`id_postal_code`) REFERENCES `postal_code` (`id`);

--
-- Filtros para la tabla `user_create_playlist`
--
ALTER TABLE `user_create_playlist`
  ADD CONSTRAINT `id_playlist` FOREIGN KEY (`id_playlist`) REFERENCES `playlist` (`id`),
  ADD CONSTRAINT `id_user_playlist` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user_favorite_record`
--
ALTER TABLE `user_favorite_record`
  ADD CONSTRAINT `record_user_favorite_record` FOREIGN KEY (`iid_record`) REFERENCES `record` (`id`),
  ADD CONSTRAINT `user_user_favorite_record` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user_favorite_song`
--
ALTER TABLE `user_favorite_song`
  ADD CONSTRAINT `song_user_favorite_song` FOREIGN KEY (`id_song`) REFERENCES `song` (`id`),
  ADD CONSTRAINT `user_user_favorite_song` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user_follow_artist`
--
ALTER TABLE `user_follow_artist`
  ADD CONSTRAINT `aritst-user_follow_artist` FOREIGN KEY (`id_artist`) REFERENCES `artist` (`id`),
  ADD CONSTRAINT `user-user_follow_artist` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user_type_asigment`
--
ALTER TABLE `user_type_asigment`
  ADD CONSTRAINT `type_user_type_asigment` FOREIGN KEY (`id_type`) REFERENCES `user_type` (`id`),
  ADD CONSTRAINT `user_user_type_asigment` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

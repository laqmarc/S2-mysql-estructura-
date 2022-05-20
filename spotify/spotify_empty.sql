-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2022 a las 18:28:42
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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artist_algo`
--

CREATE TABLE `artist_algo` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artist_algo_asignement`
--

CREATE TABLE `artist_algo_asignement` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_artist` int(11) UNSIGNED NOT NULL,
  `id_artist_algorith` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE `country` (
  `id` int(11) UNSIGNED NOT NULL,
  `country_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gender`
--

CREATE TABLE `gender` (
  `id` int(11) UNSIGNED NOT NULL,
  `gender_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `location`
--

CREATE TABLE `location` (
  `id` int(11) UNSIGNED NOT NULL,
  `location_name` varchar(45) NOT NULL,
  `id_country` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment-type`
--

CREATE TABLE `payment-type` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_subcription_type` int(11) UNSIGNED DEFAULT NULL,
  `id_payment_type_card` int(11) UNSIGNED DEFAULT NULL,
  `id_payment_type_paypal` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment-type-card`
--

CREATE TABLE `payment-type-card` (
  `id` int(11) UNSIGNED NOT NULL,
  `card_number` int(16) UNSIGNED NOT NULL,
  `card_year` int(4) UNSIGNED NOT NULL,
  `card_month` int(2) UNSIGNED NOT NULL,
  `card_code` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist_deleted`
--

CREATE TABLE `playlist_deleted` (
  `id` int(11) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_playlist` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist_type`
--

CREATE TABLE `playlist_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postal_code`
--

CREATE TABLE `postal_code` (
  `id` int(11) UNSIGNED NOT NULL,
  `postal_code_number` int(5) UNSIGNED ZEROFILL NOT NULL,
  `id_location` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscription`
--

CREATE TABLE `subscription` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_type_suscriptioin` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscription_type`
--

CREATE TABLE `subscription_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `start_suscription_date` date NOT NULL,
  `renovation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_create_playlist`
--

CREATE TABLE `user_create_playlist` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_playlist` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_favorite_record`
--

CREATE TABLE `user_favorite_record` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `iid_record` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_favorite_song`
--

CREATE TABLE `user_favorite_song` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_song` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_follow_artist`
--

CREATE TABLE `user_follow_artist` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_artist` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_type`
--

CREATE TABLE `user_type` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD KEY `payment_type` (`id_subcription_type`);

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
  ADD KEY `user_subscription` (`id_user`),
  ADD KEY `type_sub_subscription` (`id_type_suscriptioin`);

--
-- Indices de la tabla `subscription_type`
--
ALTER TABLE `subscription_type`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `artist_algo`
--
ALTER TABLE `artist_algo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `artist_algo_asignement`
--
ALTER TABLE `artist_algo_asignement`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment-type`
--
ALTER TABLE `payment-type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment-type-card`
--
ALTER TABLE `payment-type-card`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `payment-type-paypal`
--
ALTER TABLE `payment-type-paypal`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `playlist_deleted`
--
ALTER TABLE `playlist_deleted`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `playlist_type`
--
ALTER TABLE `playlist_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `postal_code`
--
ALTER TABLE `postal_code`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `record`
--
ALTER TABLE `record`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `song`
--
ALTER TABLE `song`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `song_in_playlist_by_user`
--
ALTER TABLE `song_in_playlist_by_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subscription`
--
ALTER TABLE `subscription`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subscription_type`
--
ALTER TABLE `subscription_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_create_playlist`
--
ALTER TABLE `user_create_playlist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_favorite_record`
--
ALTER TABLE `user_favorite_record`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_favorite_song`
--
ALTER TABLE `user_favorite_song`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_follow_artist`
--
ALTER TABLE `user_follow_artist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_type`
--
ALTER TABLE `user_type`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_type_asigment`
--
ALTER TABLE `user_type_asigment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `payment_type` FOREIGN KEY (`id_subcription_type`) REFERENCES `subscription_type` (`id`);

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
  ADD CONSTRAINT `type_sub_subscription` FOREIGN KEY (`id_type_suscriptioin`) REFERENCES `subscription_type` (`id`),
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

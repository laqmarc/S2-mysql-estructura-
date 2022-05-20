-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-05-2022 a las 10:37:33
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
-- Base de datos: `yutup`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `channel`
--

CREATE TABLE `channel` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `time_created_` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `channel`
--

INSERT INTO `channel` (`id`, `name`, `description`, `user_id`, `time_created_`) VALUES
(1, 'laqmarc\'s channel', 'Canal on penjo els videos', 1, '2022-05-16 20:30:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `channel_subcription`
--

CREATE TABLE `channel_subcription` (
  `user_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `channel_subcription`
--

INSERT INTO `channel_subcription` (`user_id`, `channel_id`, `time_created`) VALUES
(1, 1, '2022-05-16 20:32:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist`
--

CREATE TABLE `playlist` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `state_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `playlist`
--

INSERT INTO `playlist` (`id`, `name`, `state_id`, `user_id`, `time_created`) VALUES
(1, 'laqmarc\'s playlist', 1, 1, '2022-05-16 20:32:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist_state`
--

CREATE TABLE `playlist_state` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `playlist_state`
--

INSERT INTO `playlist_state` (`id`, `name`) VALUES
(1, 'public'),
(2, 'private');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'fun'),
(2, 'code'),
(3, 'masterclass'),
(4, 'php'),
(7, 'drones'),
(8, 'dronevideo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` text NOT NULL,
  `username` varchar(45) NOT NULL,
  `birth_date` date NOT NULL,
  `gender_id` int(11) NOT NULL,
  `country` varchar(45) NOT NULL,
  `cp` int(5) UNSIGNED ZEROFILL NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `username`, `birth_date`, `gender_id`, `country`, `cp`, `time_created`) VALUES
(1, 'laqmarc@gmail.com', '177f57a9912f45aa51c12aeb2d74273f6df2e013 ', '01010001', '1980-06-18', 3, 'ES', 08013, '2022-05-16 17:55:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_gender`
--

CREATE TABLE `user_gender` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user_gender`
--

INSERT INTO `user_gender` (`id`, `name`) VALUES
(1, 'you don\'t care'),
(2, 'female'),
(3, 'male');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `size` text NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `duration` int(11) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `reproductions` int(15) DEFAULT NULL,
  `state_id` int(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video`
--

INSERT INTO `video` (`id`, `title`, `description`, `size`, `file_name`, `duration`, `thumbnail`, `reproductions`, `state_id`, `user_id`, `time_created`) VALUES
(2, 'primer video', 'Primer video de yutup', '1920x1080', 'https://quexulo.cat/videodron/videodron', 132, './img/thumbnail.jpg', 152, 1, 1, '2022-05-16 20:27:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_channel`
--

CREATE TABLE `video_channel` (
  `id_video` int(11) NOT NULL,
  `id_channel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video_channel`
--

INSERT INTO `video_channel` (`id_video`, `id_channel`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_comments`
--

CREATE TABLE `video_comments` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `video_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video_comments`
--

INSERT INTO `video_comments` (`id`, `text`, `video_id`, `user_id`, `time_created`) VALUES
(1, 'Primer video... un tostón', 2, 1, '2022-05-16 20:31:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_comments_like`
--

CREATE TABLE `video_comments_like` (
  `id` int(11) NOT NULL,
  `state_id` int(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video_comments_like`
--

INSERT INTO `video_comments_like` (`id`, `state_id`, `user_id`, `comment_id`, `time_created`) VALUES
(1, 2, 1, 1, '2022-05-16 20:31:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_comments_like_state`
--

CREATE TABLE `video_comments_like_state` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video_comments_like_state`
--

INSERT INTO `video_comments_like_state` (`id`, `name`) VALUES
(1, 'like'),
(2, 'dislike');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_like`
--

CREATE TABLE `video_like` (
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video_like`
--

INSERT INTO `video_like` (`user_id`, `video_id`, `state_id`, `time_created`) VALUES
(1, 2, 2, '2022-05-16 20:31:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_like_state`
--

CREATE TABLE `video_like_state` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video_like_state`
--

INSERT INTO `video_like_state` (`id`, `name`) VALUES
(1, 'like'),
(2, 'dislike');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_playlist`
--

CREATE TABLE `video_playlist` (
  `video_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_state`
--

CREATE TABLE `video_state` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video_state`
--

INSERT INTO `video_state` (`id`, `name`) VALUES
(1, 'public'),
(2, 'hidden'),
(3, 'private');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_tag`
--

CREATE TABLE `video_tag` (
  `id_video` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video_tag`
--

INSERT INTO `video_tag` (`id_video`, `id_tag`) VALUES
(2, 4),
(2, 2),
(2, 7),
(2, 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_4` (`user_id`);

--
-- Indices de la tabla `channel_subcription`
--
ALTER TABLE `channel_subcription`
  ADD KEY `user_id_5` (`user_id`),
  ADD KEY `channel_id_5` (`channel_id`);

--
-- Indices de la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_1` (`user_id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indices de la tabla `playlist_state`
--
ALTER TABLE `playlist_state`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_indx` (`email`),
  ADD KEY `sex_id` (`gender_id`);

--
-- Indices de la tabla `user_gender`
--
ALTER TABLE `user_gender`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_2` (`user_id`),
  ADD KEY `state_id_3` (`state_id`);

--
-- Indices de la tabla `video_channel`
--
ALTER TABLE `video_channel`
  ADD KEY `video-channel-1` (`id_channel`),
  ADD KEY `video-channel-2` (`id_video`);

--
-- Indices de la tabla `video_comments`
--
ALTER TABLE `video_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_6` (`user_id`),
  ADD KEY `video_id_6` (`video_id`);

--
-- Indices de la tabla `video_comments_like`
--
ALTER TABLE `video_comments_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_7` (`user_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `state_id_2` (`state_id`);

--
-- Indices de la tabla `video_comments_like_state`
--
ALTER TABLE `video_comments_like_state`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `video_like`
--
ALTER TABLE `video_like`
  ADD KEY `user_id_3` (`user_id`),
  ADD KEY `video_id_3` (`video_id`),
  ADD KEY `state_id_4` (`state_id`);

--
-- Indices de la tabla `video_like_state`
--
ALTER TABLE `video_like_state`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `video_playlist`
--
ALTER TABLE `video_playlist`
  ADD KEY `video_id_1` (`video_id`),
  ADD KEY `playlist_id_1` (`playlist_id`);

--
-- Indices de la tabla `video_state`
--
ALTER TABLE `video_state`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `video_tag`
--
ALTER TABLE `video_tag`
  ADD KEY `video` (`id_video`),
  ADD KEY `tag` (`id_tag`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `channel`
--
ALTER TABLE `channel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `playlist_state`
--
ALTER TABLE `playlist_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `user_gender`
--
ALTER TABLE `user_gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `video_comments`
--
ALTER TABLE `video_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `video_comments_like`
--
ALTER TABLE `video_comments_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `video_comments_like_state`
--
ALTER TABLE `video_comments_like_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `video_like_state`
--
ALTER TABLE `video_like_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `video_state`
--
ALTER TABLE `video_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `channel`
--
ALTER TABLE `channel`
  ADD CONSTRAINT `user_id_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `channel_subcription`
--
ALTER TABLE `channel_subcription`
  ADD CONSTRAINT `channel_id_5` FOREIGN KEY (`channel_id`) REFERENCES `channel` (`id`),
  ADD CONSTRAINT `user_id_5` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `state_id` FOREIGN KEY (`state_id`) REFERENCES `playlist_state` (`id`),
  ADD CONSTRAINT `user_id_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `sex_id` FOREIGN KEY (`gender_id`) REFERENCES `user_gender` (`id`);

--
-- Filtros para la tabla `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `state_id_3` FOREIGN KEY (`state_id`) REFERENCES `video_state` (`id`),
  ADD CONSTRAINT `user_id_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `video_channel`
--
ALTER TABLE `video_channel`
  ADD CONSTRAINT `video-channel-1` FOREIGN KEY (`id_channel`) REFERENCES `channel` (`id`),
  ADD CONSTRAINT `video-channel-2` FOREIGN KEY (`id_video`) REFERENCES `video` (`id`);

--
-- Filtros para la tabla `video_comments`
--
ALTER TABLE `video_comments`
  ADD CONSTRAINT `user_id_6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `video_id_6` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`);

--
-- Filtros para la tabla `video_comments_like`
--
ALTER TABLE `video_comments_like`
  ADD CONSTRAINT `comment_id` FOREIGN KEY (`comment_id`) REFERENCES `video_comments` (`id`),
  ADD CONSTRAINT `state_id_2` FOREIGN KEY (`state_id`) REFERENCES `video_comments_like_state` (`id`),
  ADD CONSTRAINT `user_id_7` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `video_like`
--
ALTER TABLE `video_like`
  ADD CONSTRAINT `state_id_4` FOREIGN KEY (`state_id`) REFERENCES `video_like_state` (`id`),
  ADD CONSTRAINT `user_id_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `video_id_3` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`);

--
-- Filtros para la tabla `video_playlist`
--
ALTER TABLE `video_playlist`
  ADD CONSTRAINT `playlist_id_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`),
  ADD CONSTRAINT `video_id_1` FOREIGN KEY (`video_id`) REFERENCES `video` (`id`);

--
-- Filtros para la tabla `video_tag`
--
ALTER TABLE `video_tag`
  ADD CONSTRAINT `tag` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `video` FOREIGN KEY (`id_video`) REFERENCES `video` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

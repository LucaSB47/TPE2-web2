-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2022 a las 19:45:56
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `juegos_bd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `genero_id` int(11) NOT NULL,
  `calificacion` tinyint(4) NOT NULL,
  `precio` float NOT NULL,
  `imagen` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `games`
--

INSERT INTO `games` (`id`, `nombre`, `descripcion`, `genero_id`, `calificacion`, `precio`, `imagen`) VALUES
(28, 'Apex legend ', 'Apex Legends es un videojuego gratuito perteneciente a los géneros battle royale y hero shooter en primera persona, desarrollado por Respawn Entertainment y publicado por Electronic Arts. Fue lanzado para Microsoft Windows, PlayStation 4 y Xbox One el 4 d', 6, 10, 100, 'img/game/6340636368204.jpg'),
(29, 'Minecraft', 'Minecraft es un videojuego de construcción de tipo «mundo abierto» o sandbox creado originalmente por el sueco Markus Persson, ​ y posteriormente desarrollado por Mojang Studios.​', 2, 10, 26, 'img/game/6340675583dcb.jpg'),
(31, 'Roblox', 'Roblox​ es una plataforma de videojuegos en línea dónde los usuarios pueden crear sus propios mundos virtuales con el sistema de creación de juegos llamado Roblox Studio, desarrollado por Roblox Corporation y disponible en ordenadores, teléfonos móviles y', 1, 4, 100, 'img/game/6340ab92db1d7.jpg'),
(32, 'god of war', 'God of War es una franquicia de videojuegos hack and slash creada por SCE Santa Monica Studio y distribuida por Sony Computer Entertainment.', 5, 10, 100, 'img/game/63473563c240c.jpg'),
(33, 'jack and dexter 3', 'Jak 3 es un videojuego de plataformas de acción-aventura desarrollado por Naughty Dog y distribuido por Sony Computer Entertainment. El título, precedido por Jak II, es el tercer juego de la serie Jak and Daxter. Fue lanzado en Norteamérica el 9 de noviem', 1, 1, 0, 'img/game/6347368f5aa2c.jpg'),
(34, 'lego batman', 'Hay grandes cambios que amenazan a Gotham, pero si Batman busca salvar a la ciudad de la incursión hostil del Guasón, deberá considerar en dejar su lucha solitaria y tratar de trabajar con otros para aligerar la batalla.', 1, 5, 10000, 'img/game/634741fde34d3.jpg'),
(35, 'the last of us', 'The Last of Us es un videojuego de terror y de acción y aventura desarrollado por la compañía estadounidense Naughty Dog y distribuido por Sony Computer Entertainment para la consola PlayStation 3 en 2013.', 5, 10, 1000, 'img/game/63474ea2e56bd.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `genero_id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`genero_id`, `nombre`) VALUES
(1, 'terror'),
(2, 'aventura'),
(5, 'accion'),
(6, 'estrategia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'admin@admin.com', '$2a$12$6UXHPqyfo5IfiGGfy/MADOnlh7lm/CTR/H9Oup58JmfKaZFihzeFm');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genero_id` (`genero_id`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`genero_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `genero_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`genero_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

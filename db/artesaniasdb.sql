-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-06-2025 a las 04:20:49
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
-- Base de datos: `artesaniasdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artesania`
--

CREATE TABLE `artesania` (
  `ID_art` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Categoria` varchar(100) DEFAULT NULL,
  `Caracteristicas` text DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `artesania`
--

INSERT INTO `artesania` (`ID_art`, `Nombre`, `Categoria`, `Caracteristicas`, `Precio`, `imagen`) VALUES
(1, 'Talavera poblana', 'Ceramica', 'Elaboración artesanal a mano, uso de colores como el azul y blanco, y diseños decorativos con la cultura de la región.', 300.00, '/recursosGaleria/gal1.jpg'),
(5, 'Puerco espin', 'Madera', 'Juguete de puerco espin de madera tallada\r\nhecho a mano', 5000.00, '\\recursosGaleria\\gal3.jpg'),
(6, 'Muñeca Artesanal Otomí', 'Textiles', 'Mueñas hechas de telas fabricadas a mano.', 350.00, '\\recursosGaleria\\gal2.jpg'),
(7, 'Juguete Tradicional de Madera', 'Madera', 'Juegos para entretenerse, hechos de madera por la comunidad indígena.', 600.00, '\\recursosGaleria\\gal4.jpg'),
(8, 'Barro Vidriado', 'Cerámica', 'Artículos de cocina con un toque único para presentar tus comidas y bebidas.', 1000.00, '\\recursosGaleria\\gal5.jpg'),
(9, 'Talavera Policromada', 'Cerámica', 'Productos únicos e irrepetibles hechos por comunidad oaxaqueña con bastantes meses de esfuerzo.', 2500.00, '\\recursosGaleria\\gal6.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `ID_cart` int(11) NOT NULL,
  `ID_user` int(11) DEFAULT NULL,
  `ID_art` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_user` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Contrasena` varchar(100) NOT NULL,
  `Rol` varchar(50) DEFAULT NULL,
  `Numero` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_user`, `Nombre`, `Contrasena`, `Rol`, `Numero`, `correo`) VALUES
(1, 'Juan Manuel Torres', '1234', 'Vendedor', '3326002101', 'jonnyma1011@gmail.com'),
(2, 'Alcachofa', '12345', 'comprador', '3322497154', 'a22100177@ceti.mx'),
(3, 'Alcachofaking', '12345', 'comprador', '3322497154', 'coco@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artesania`
--
ALTER TABLE `artesania`
  ADD PRIMARY KEY (`ID_art`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`ID_cart`),
  ADD KEY `ID_user` (`ID_user`),
  ADD KEY `ID_art` (`ID_art`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `artesania`
--
ALTER TABLE `artesania`
  MODIFY `ID_art` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `ID_cart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `usuarios` (`ID_user`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`ID_art`) REFERENCES `artesania` (`ID_art`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

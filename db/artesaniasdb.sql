-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2025 at 08:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `artesaniasdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `artesania`
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
-- Dumping data for table `artesania`
--

INSERT INTO `artesania` (`ID_art`, `Nombre`, `Categoria`, `Caracteristicas`, `Precio`, `imagen`) VALUES
(1, 'Talavera poblana', 'Ceramica', 'Elaboración artesanal a mano, uso de colores como el azul y blanco, y diseños decorativos con la cultura de la región.', 300.00, '/recursosGaleria/gal1.jpg'),
(5, 'Puerco espin', 'Madera', 'Juguete de puerco espin de madera tallada\r\nhecho a mano', 5000.00, '\\recursosGaleria\\gal3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `carrito`
--

CREATE TABLE `carrito` (
  `ID_cart` int(11) NOT NULL,
  `ID_user` int(11) DEFAULT NULL,
  `ID_art` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
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
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`ID_user`, `Nombre`, `Contrasena`, `Rol`, `Numero`, `correo`) VALUES
(1, 'Juan Manuel Torres', '1234', 'Vendedor', '3326002101', 'jonnyma1011@gmail.com'),
(2, 'Alcachofa', '12345', 'comprador', '3322497154', 'a22100177@ceti.mx'),
(3, 'Alcachofaking', '12345', 'comprador', '3322497154', 'coco@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artesania`
--
ALTER TABLE `artesania`
  ADD PRIMARY KEY (`ID_art`);

--
-- Indexes for table `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`ID_cart`),
  ADD KEY `ID_user` (`ID_user`),
  ADD KEY `ID_art` (`ID_art`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artesania`
--
ALTER TABLE `artesania`
  MODIFY `ID_art` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carrito`
--
ALTER TABLE `carrito`
  MODIFY `ID_cart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `usuarios` (`ID_user`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`ID_art`) REFERENCES `artesania` (`ID_art`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

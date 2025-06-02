-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2025 at 03:44 AM
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
  `Precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Juan Manuel Torres', '1234', 'Vendedor', '3326002101', 'jonnyma1011@gmail.com');

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
  MODIFY `ID_art` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carrito`
--
ALTER TABLE `carrito`
  MODIFY `ID_cart` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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

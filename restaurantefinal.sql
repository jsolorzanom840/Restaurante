-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2024 at 02:04 AM
-- Server version: 8.0.39
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurantefinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `platillos`
--

CREATE TABLE `platillos` (
  `id` int NOT NULL,
  `id_usuarios` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `Mesa` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `platillos`
--

INSERT INTO `platillos` (`id`, `id_usuarios`, `nombre`, `descripcion`, `Mesa`) VALUES
(1, 25, 'Pablo', 'Sundae', 1),
(2, 1, 'Carlitos', 'Corn', 1),
(3, 12, 'Jahel', 'Iced Latte', 4);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol` enum('cliente','administrador') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `contraseña`, `rol`) VALUES
(1, 'jose', 'test', 'cliente'),
(3, 'joset', 'test', 'cliente'),
(5, 'josete', '1234', 'cliente'),
(6, 'david', '123', 'cliente'),
(7, 'davi', '123', 'cliente'),
(8, 'da', '123', 'cliente'),
(9, 'joc', '123', 'cliente'),
(10, 'jos', '12', 'cliente'),
(11, 'qwerty', '12345', 'cliente'),
(12, 'qwer', '1234', 'cliente'),
(13, 'qwe', '123', 'cliente'),
(15, 'qwertyu', '123456789', 'cliente'),
(16, 'Martesporlanoche', '123456789', 'cliente'),
(18, 'Pruebita', '12345', 'cliente'),
(19, 'Pruebota', '12345', 'cliente'),
(20, 'Pruebete', '12345', 'cliente'),
(23, 'Pruebeti', '123', 'cliente'),
(24, 'Josese', '12345', 'cliente'),
(25, 'Naty', 'cualquiera', 'cliente');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `platillos`
--
ALTER TABLE `platillos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuarios` (`id_usuarios`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `platillos`
--
ALTER TABLE `platillos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `platillos`
--
ALTER TABLE `platillos`
  ADD CONSTRAINT `platillos_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

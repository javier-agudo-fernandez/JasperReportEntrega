-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.3.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE biblioteca;
-- Volcando estructura de base de datos para biblioteca
CREATE DATABASE IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `biblioteca`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tipo` enum('normal','administrador') DEFAULT NULL,
  `penalizacionHasta` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla biblioteca.usuario: ~10 rows (aproximadamente)
INSERT INTO `usuario` (`id`, `dni`, `nombre`, `email`, `password`, `tipo`, `penalizacionHasta`) VALUES
	(1, '12345678A', 'Juan Perez', 'juan.perez@example.com', 'password123', 'normal', NULL),
	(2, '87654321B', 'Maria Lopez', 'maria.lopez@example.com', 'password456', 'administrador', '2023-12-31'),
	(3, '11223344C', 'Carlos García', 'carlos.garcia@example.com', 'password789', 'normal', NULL),
	(4, '44556677D', 'Laura Martínez', 'laura.martinez@example.com', 'password321', 'normal', '2023-09-30'),
	(5, '99887766E', 'David Fernández', 'david.fernandez@example.com', 'password654', 'administrador', NULL),
	(6, '33445566F', 'Ana Torres', 'ana.torres@example.com', 'password111', 'normal', NULL),
	(7, '55667788G', 'Luis Ruiz', 'luis.ruiz@example.com', 'password222', 'administrador', '2024-01-31'),
	(8, '77889900H', 'Elena Rojas', 'elena.rojas@example.com', 'password333', 'normal', NULL),
	(9, '99001122I', 'Javier Gómez', 'javier.gomez@example.com', 'password444', 'normal', NULL),
	(10, '10111213J', 'Marta Jiménez', 'marta.jimenez@example.com', 'password555', 'administrador', '2024-02-28');

-- Volcando estructura para tabla biblioteca.libro
CREATE TABLE IF NOT EXISTS `libro` (
                                       `isbn` varchar(20) NOT NULL,
    `titulo` varchar(200) DEFAULT NULL,
    `autor` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`isbn`)
    ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla biblioteca.libro: ~11 rows (aproximadamente)
INSERT INTO `libro` (`isbn`, `titulo`, `autor`) VALUES
('978-0-14-044913-6', 'The Odyssey', 'Homer'),
('978-0-261-10236-4', 'The Hobbit', 'J.R.R. Tolkien'),
('978-0-316-76948-8', 'The Girl with the Dragon Tattoo', 'Stieg Larsson'),
('978-0-345-39180-3', 'A Game of Thrones', 'George R. R. Martin'),
('978-0-452-28423-4', '1984', 'George Orwell'),
('978-0-670-82162-4', 'The Catcher in the Rye', 'J.D. Salinger'),
('978-0-7432-7356-5', 'Angels & Demons', 'Dan Brown'),
('978-0-7432-7357-2', 'The Da Vinci Code', 'Dan Brown'),
('978-0-7432-7358-9', 'Deception Point', 'Dan Brown'),
('978-1-56731-340-7', 'To Kill a Mockingbird', 'Harper Lee'),
('978-3-16-148410-0', 'El Quijote', 'Miguel de Cervantes');


-- Volcando estructura para tabla biblioteca.ejemplar
CREATE TABLE IF NOT EXISTS `ejemplar` (
  `id` int(11) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `estado` enum('Disponible','Prestado','Dañado') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `isbn` (`isbn`),
  CONSTRAINT `ejemplar_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `libro` (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla biblioteca.ejemplar: ~31 rows (aproximadamente)
INSERT INTO `ejemplar` (`id`, `isbn`, `estado`) VALUES
	(1, '978-3-16-148410-0', 'Disponible'),
	(2, '978-0-14-044913-6', 'Prestado'),
	(3, '978-0-7432-7356-5', 'Dañado'),
	(4, '978-0-261-10236-4', 'Disponible'),
	(5, '978-0-7432-7357-2', 'Prestado'),
	(6, '978-1-56731-340-7', 'Disponible'),
	(7, '978-0-345-39180-3', 'Disponible'),
	(8, '978-0-452-28423-4', 'Prestado'),
	(9, '978-0-7432-7358-9', 'Disponible'),
	(10, '978-0-670-82162-4', 'Dañado'),
	(11, '978-0-316-76948-8', 'Disponible'),
	(12, '978-3-16-148410-0', 'Disponible'),
	(13, '978-0-14-044913-6', 'Disponible'),
	(14, '978-0-7432-7356-5', 'Prestado'),
	(15, '978-0-261-10236-4', 'Dañado'),
	(16, '978-0-7432-7357-2', 'Disponible'),
	(17, '978-1-56731-340-7', 'Prestado'),
	(18, '978-0-345-39180-3', 'Dañado'),
	(19, '978-0-452-28423-4', 'Disponible'),
	(20, '978-0-7432-7358-9', 'Prestado'),
	(21, '978-3-16-148410-0', 'Prestado'),
	(22, '978-0-14-044913-6', 'Prestado'),
	(23, '978-0-7432-7356-5', 'Prestado'),
	(24, '978-0-261-10236-4', 'Prestado'),
	(25, '978-0-7432-7357-2', 'Prestado'),
	(26, '978-1-56731-340-7', 'Prestado'),
	(27, '978-0-345-39180-3', 'Prestado'),
	(28, '978-0-452-28423-4', 'Prestado'),
	(29, '978-0-7432-7358-9', 'Prestado'),
	(30, '978-0-670-82162-4', 'Prestado'),
	(31, '978-0-316-76948-8', 'Prestado');


-- Volcando estructura para tabla biblioteca.prestamo
CREATE TABLE IF NOT EXISTS `prestamo` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `ejemplar_id` int(11) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaDevolucion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `ejemplar_id` (`ejemplar_id`),
  CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `prestamo_ibfk_2` FOREIGN KEY (`ejemplar_id`) REFERENCES `ejemplar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla biblioteca.prestamo: ~41 rows (aproximadamente)
INSERT INTO `prestamo` (`id`, `usuario_id`, `ejemplar_id`, `fechaInicio`, `fechaDevolucion`) VALUES
	(1, 1, 2, '2023-01-01', '2023-01-15'),
	(2, 1, 3, '2023-02-01', NULL),
	(3, 2, 4, '2023-03-01', '2023-03-15'),
	(4, 3, 1, '2023-04-01', '2023-04-15'),
	(5, 4, 3, '2023-05-01', NULL),
	(6, 5, 6, '2023-06-01', '2023-06-15'),
	(7, 3, 7, '2023-07-01', '2023-07-15'),
	(8, 4, 5, '2023-08-01', NULL),
	(9, 6, 9, '2023-09-01', '2023-09-15'),
	(10, 7, 10, '2023-10-01', '2023-10-15'),
	(11, 8, 11, '2023-11-01', '2023-11-15'),
	(12, 9, 12, '2023-12-01', NULL),
	(13, 10, 13, '2023-12-15', '2023-12-30'),
	(14, 6, 14, '2024-01-01', '2024-01-15'),
	(15, 7, 15, '2024-02-01', NULL),
	(16, 8, 1, '2023-09-01', '2023-09-15'),
	(17, 9, 2, '2023-10-01', '2023-10-15'),
	(18, 10, 3, '2023-11-01', '2023-11-15'),
	(19, 6, 4, '2023-12-01', NULL),
	(20, 7, 5, '2023-12-15', '2023-12-30'),
	(21, 8, 6, '2024-01-01', '2024-01-15'),
	(22, 9, 7, '2024-02-01', NULL),
	(23, 10, 8, '2024-03-01', '2024-03-15'),
	(24, 6, 9, '2024-04-01', '2024-04-15'),
	(25, 7, 10, '2024-05-01', NULL),
	(26, 8, 11, '2024-06-01', '2024-06-15'),
	(27, 9, 12, '2024-07-01', '2024-07-15'),
	(28, 10, 13, '2024-08-01', NULL),
	(29, 6, 14, '2024-09-01', '2024-09-15'),
	(30, 7, 15, '2024-10-01', '2024-10-15'),
	(31, 1, 21, '2024-11-01', NULL),
	(32, 2, 22, '2024-11-05', NULL),
	(33, 3, 23, '2024-11-10', '2024-11-25'),
	(34, 4, 24, '2024-11-15', NULL),
	(35, 5, 25, '2024-11-20', '2024-12-05'),
	(36, 6, 26, '2024-11-25', NULL),
	(37, 7, 27, '2024-12-01', '2024-12-15'),
	(38, 8, 28, '2024-12-05', NULL),
	(39, 9, 29, '2024-12-10', '2024-12-25'),
	(40, 10, 30, '2024-12-15', NULL),
	(41, 1, 31, '2024-12-20', '2025-01-05');

-- Volcando estructura para tabla biblioteca.usuario


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

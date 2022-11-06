-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.14-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para aesanluc_biblioteca
DROP DATABASE IF EXISTS `aesanluc_biblioteca`;
CREATE DATABASE IF NOT EXISTS `aesanluc_biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `aesanluc_biblioteca`;

-- Volcando estructura para tabla aesanluc_biblioteca.autores
DROP TABLE IF EXISTS `autores`;
CREATE TABLE IF NOT EXISTS `autores` (
  `autores_id` int(11) NOT NULL AUTO_INCREMENT,
  `autores_nombre` varchar(200) NOT NULL,
  `autores_descripcion` varchar(500) DEFAULT NULL,
  `autores_imagen` varchar(100) NOT NULL,
  `autores_estado` tinyint(4) NOT NULL DEFAULT 1,
  `autores_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `autores_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`autores_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.autores: ~4 rows (aproximadamente)
DELETE FROM `autores`;
INSERT INTO `autores` (`autores_id`, `autores_nombre`, `autores_descripcion`, `autores_imagen`, `autores_estado`, `autores_fechacreacion`, `autores_fechaupdate`) VALUES
	(1, 'Mario Vargas Llosa', 'Mario Vargas Llosa nació en una familia de clase media en la ciudad de Arequipa, en el sur del Perú en 1936.', 'autor_profile_20221027_075106.jpg', 1, '2022-10-27 12:51:06', '2022-10-27 14:50:15'),
	(3, 'Gabriel José de la Concordia García Márquez', 'Está relacionado de manera inherente con el realismo mágico y su obra más conocida, la novela Cien años de soledad, es considerada una de las más representativas de este movimiento literario, e incluso se considera que por el éxito de la novela es que tal término se aplica a la literatura surgida a partir de los años 1960 en América Latina.', 'sin_foto.png', 1, '2022-10-27 16:07:13', '2022-10-27 16:07:13'),
	(4, 'Evelyn Ayala', '-', 'sin_foto.png', 1, '2022-11-01 15:47:36', '2022-11-01 15:47:36'),
	(5, 'Santiago Gonzales', '-', 'sin_foto.png', 1, '2022-11-01 15:47:43', '2022-11-01 15:47:43');

-- Volcando estructura para tabla aesanluc_biblioteca.bloqueo
DROP TABLE IF EXISTS `bloqueo`;
CREATE TABLE IF NOT EXISTS `bloqueo` (
  `bloqueo_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios_id` int(11) NOT NULL,
  `tipo_bloqueo_id` int(11) NOT NULL,
  `bloqueo_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `bloqueo_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`bloqueo_id`),
  UNIQUE KEY `UQ_usuario_tipo_bloqueo` (`usuarios_id`,`tipo_bloqueo_id`),
  KEY `FK_bloqueo_tipo_bloqueo` (`tipo_bloqueo_id`),
  KEY `FK_bloqueo_usuario` (`usuarios_id`),
  CONSTRAINT `FK_bloqueo_tipo_bloqueo` FOREIGN KEY (`tipo_bloqueo_id`) REFERENCES `tipo_bloqueo` (`tipo_bloqueo_id`),
  CONSTRAINT `FK_bloqueo_usuarios` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`usuarios_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.bloqueo: ~0 rows (aproximadamente)
DELETE FROM `bloqueo`;

-- Volcando estructura para tabla aesanluc_biblioteca.calificaciones_libro
DROP TABLE IF EXISTS `calificaciones_libro`;
CREATE TABLE IF NOT EXISTS `calificaciones_libro` (
  `calificaciones_libro_id` int(11) NOT NULL AUTO_INCREMENT,
  `calificaciones_libro_valoracion` int(11) NOT NULL,
  `calificaciones_libro_comentario` varchar(300) DEFAULT NULL,
  `libro_id` int(11) NOT NULL,
  `calificaciones_libro_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `calificaciones_libro_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`calificaciones_libro_id`),
  KEY `FK_calificaciones_libro_libro` (`libro_id`),
  CONSTRAINT `FK_calificaciones_libro_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.calificaciones_libro: ~0 rows (aproximadamente)
DELETE FROM `calificaciones_libro`;

-- Volcando estructura para tabla aesanluc_biblioteca.categorias
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `categorias_id` int(11) NOT NULL AUTO_INCREMENT,
  `categorias_nombre` varchar(150) NOT NULL,
  `categorias_descripcion` varchar(200) DEFAULT NULL,
  `categorias_estado` tinyint(4) NOT NULL DEFAULT 1,
  `categorias_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `categorias_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`categorias_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.categorias: ~2 rows (aproximadamente)
DELETE FROM `categorias`;
INSERT INTO `categorias` (`categorias_id`, `categorias_nombre`, `categorias_descripcion`, `categorias_estado`, `categorias_fechacreacion`, `categorias_fechaupdate`) VALUES
	(1, 'Enfermería técnica', 'Aca se desarrolla todas clases de anatomía funcional y además se involuvra sus practicas pre profesionales.', 1, '2022-10-22 01:04:54', '2022-10-23 15:46:02'),
	(5, 'Transversales', 'Todo tipo de libro', 1, '2022-11-01 15:47:05', '2022-11-01 15:47:05');

-- Volcando estructura para tabla aesanluc_biblioteca.conocimiento
DROP TABLE IF EXISTS `conocimiento`;
CREATE TABLE IF NOT EXISTS `conocimiento` (
  `conocimiento_id` int(11) NOT NULL AUTO_INCREMENT,
  `conocimiento_descripcion` text NOT NULL,
  `conocimiento_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `conocimiento_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`conocimiento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.conocimiento: ~12 rows (aproximadamente)
DELETE FROM `conocimiento`;
INSERT INTO `conocimiento` (`conocimiento_id`, `conocimiento_descripcion`, `conocimiento_fechacreacion`, `conocimiento_fechaupdate`) VALUES
	(3, 'El Fondo Editorial de la Universidad Inca Garcilaso de la Vega participa como editor y productor de los textos universitarios para los estudiantes de pregrado de la modalidad de educación a distancia. Esta labor exige del personal directivo, académico, profesional y técnico una visión de conjunto de las estrategias metodológicas propias de esta modalidad. El trabajo del Fondo Editorial se desarrolla en el diseño, diagramación y corrección de estilo lingüístico de los textos universitarios. Los contenidos están ubicados en los tres grandes campos del conocimiento: científico, humanístico o artístico.', '2022-11-02 14:25:37', '2022-11-02 14:25:37'),
	(4, 'El esfuerzo compartido con las Facultades, a través de sus docentes-tutores, autores de los referidos libros, conduce, sin duda alguna, a la elaboración de textos de buena calidad, los cuales podrán utilizarse a través de la página web o mediante la presentación física clásica.', '2022-11-02 14:26:42', '2022-11-02 14:26:42'),
	(5, 'En los últimos quince años la modalidad de educación a distancia ha evolucionado, pasando por el e-learning, que privilegia la formación profesional digital; b-learning, que combina lo tradicional y lo nuevo en el proceso de la formación profesional; hasta la aproximación actual al móvil learning, que aparece como la síntesis de todo lo anterior y una proyección al futuro.', '2022-11-02 14:38:22', '2022-11-02 14:38:22'),
	(6, 'Con todo ello, el Fondo Editorial reitera su compromiso de participar en la tarea universitaria de formación académica y profesional, acorde con los tiempos actuales.', '2022-11-02 14:40:09', '2022-11-02 14:40:09'),
	(7, 'wefwefwefw', '2022-11-02 16:49:18', '2022-11-02 16:49:18'),
	(8, 'dwdewedwe wefwef', '2022-11-02 16:52:26', '2022-11-02 16:52:26'),
	(9, 'wfefwefwef', '2022-11-02 16:53:46', '2022-11-02 16:53:46'),
	(10, 'wdqdwed', '2022-11-02 16:53:54', '2022-11-02 16:53:54'),
	(11, 'efwefwefwef', '2022-11-02 16:54:04', '2022-11-02 16:54:04'),
	(12, 'wfwfwf wefwef efef efwef.', '2022-11-02 18:06:37', '2022-11-02 18:06:37'),
	(13, 'pep pepe peppe ppepe wdqwd wdd.', '2022-11-02 18:10:59', '2022-11-02 18:10:59'),
	(14, 'Tomatito', '2022-11-02 18:14:38', '2022-11-02 18:14:38'),
	(15, 'huihiuhiuh', '2022-11-02 23:54:33', '2022-11-02 23:54:33'),
	(16, 'El Fondo Editorial de la Universidad Inca Garcilaso de la Vega participa como editor y productor de los textos universitarios para los estudiantes de pregrado de la modalidad de educación a distancia.', '2022-11-03 00:00:45', '2022-11-03 00:00:45');

-- Volcando estructura para tabla aesanluc_biblioteca.copias
DROP TABLE IF EXISTS `copias`;
CREATE TABLE IF NOT EXISTS `copias` (
  `copias_id` int(11) NOT NULL AUTO_INCREMENT,
  `libro_id` int(11) NOT NULL,
  `copia_codigo` varchar(15) NOT NULL,
  `copia_estado` tinyint(4) NOT NULL DEFAULT 1,
  `copia_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `copia_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`copias_id`),
  UNIQUE KEY `UQ_copias_codigo_libro` (`libro_id`,`copia_codigo`),
  KEY `FK_copias_libro` (`libro_id`),
  CONSTRAINT `FK_copias_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.copias: ~0 rows (aproximadamente)
DELETE FROM `copias`;

-- Volcando estructura para tabla aesanluc_biblioteca.detalle_autor
DROP TABLE IF EXISTS `detalle_autor`;
CREATE TABLE IF NOT EXISTS `detalle_autor` (
  `detalle_autor_id` int(11) NOT NULL AUTO_INCREMENT,
  `autores_id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  `detalle_autor_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `detalle_autor_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`detalle_autor_id`),
  UNIQUE KEY `UQ_autores_libro` (`libro_id`,`autores_id`),
  KEY `FK_detalle_autor_autores` (`autores_id`),
  KEY `FK_detalle_autor_libro` (`libro_id`),
  CONSTRAINT `FK_detalle_autor_autores` FOREIGN KEY (`autores_id`) REFERENCES `autores` (`autores_id`),
  CONSTRAINT `FK_detalle_autor_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.detalle_autor: ~4 rows (aproximadamente)
DELETE FROM `detalle_autor`;
INSERT INTO `detalle_autor` (`detalle_autor_id`, `autores_id`, `libro_id`, `detalle_autor_fechacreacion`, `detalle_autor_fechaupdate`) VALUES
	(9, 3, 1, '2022-10-30 16:25:44', '2022-10-30 16:25:44'),
	(10, 1, 1, '2022-10-30 16:25:45', '2022-10-30 16:25:45'),
	(11, 4, 21, '2022-11-01 15:50:31', '2022-11-01 15:50:31'),
	(12, 5, 21, '2022-11-01 15:50:32', '2022-11-01 15:50:32');

-- Volcando estructura para tabla aesanluc_biblioteca.detalle_conocimiento
DROP TABLE IF EXISTS `detalle_conocimiento`;
CREATE TABLE IF NOT EXISTS `detalle_conocimiento` (
  `detalle_conocimiento_id` int(11) NOT NULL AUTO_INCREMENT,
  `detalle_niveles_id` int(11) NOT NULL,
  `detalle_conocimiento_orden` int(11) NOT NULL,
  `parrafos_id` int(11) NOT NULL,
  `conocimiento_id` int(11) NOT NULL,
  `terminologias_id` int(11) DEFAULT NULL,
  `detalle_conocimiento_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `detalle_conocimiento_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`detalle_conocimiento_id`),
  KEY `FK_detalle_conocimiento_parrafos` (`parrafos_id`),
  KEY `FK_detalle_conocimiento_conocimiento` (`conocimiento_id`),
  KEY `FK_detalle_conocimiento_detalle_niveles` (`detalle_niveles_id`),
  KEY `FK_detalle_conocimiento_terminologias` (`terminologias_id`),
  CONSTRAINT `FK_detalle_conocimiento_conocimiento` FOREIGN KEY (`conocimiento_id`) REFERENCES `conocimiento` (`conocimiento_id`),
  CONSTRAINT `FK_detalle_conocimiento_detalle_niveles` FOREIGN KEY (`detalle_niveles_id`) REFERENCES `detalle_niveles` (`detalle_niveles_id`),
  CONSTRAINT `FK_detalle_conocimiento_parrafos` FOREIGN KEY (`parrafos_id`) REFERENCES `parrafos` (`parrafos_id`),
  CONSTRAINT `FK_detalle_conocimiento_terminologias` FOREIGN KEY (`terminologias_id`) REFERENCES `terminologias` (`terminologias_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.detalle_conocimiento: ~6 rows (aproximadamente)
DELETE FROM `detalle_conocimiento`;
INSERT INTO `detalle_conocimiento` (`detalle_conocimiento_id`, `detalle_niveles_id`, `detalle_conocimiento_orden`, `parrafos_id`, `conocimiento_id`, `terminologias_id`, `detalle_conocimiento_fechacreacion`, `detalle_conocimiento_fechaupdate`) VALUES
	(6, 15, 1, 1, 3, NULL, '2022-11-02 14:42:10', '2022-11-02 14:42:10'),
	(7, 15, 1, 2, 4, NULL, '2022-11-02 14:42:24', '2022-11-02 14:42:24'),
	(8, 15, 1, 3, 5, NULL, '2022-11-02 14:42:37', '2022-11-02 14:42:37'),
	(9, 15, 1, 4, 6, NULL, '2022-11-02 14:42:53', '2022-11-02 14:42:53'),
	(15, 15, 2, 1, 12, NULL, '2022-11-02 18:06:37', '2022-11-02 18:06:37'),
	(16, 15, 3, 1, 13, NULL, '2022-11-02 18:10:59', '2022-11-02 18:10:59'),
	(17, 15, 2, 2, 14, NULL, '2022-11-02 18:14:38', '2022-11-02 18:14:38'),
	(18, 17, 1, 1, 15, NULL, '2022-11-02 23:54:33', '2022-11-02 23:54:33'),
	(19, 15, 4, 1, 16, NULL, '2022-11-03 00:00:45', '2022-11-03 00:00:45');

-- Volcando estructura para tabla aesanluc_biblioteca.detalle_keywords
DROP TABLE IF EXISTS `detalle_keywords`;
CREATE TABLE IF NOT EXISTS `detalle_keywords` (
  `detalle_keywords_id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords_id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  `detalle_keywords_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `detalle_keywords_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`detalle_keywords_id`),
  UNIQUE KEY `UQ_keywords_libro` (`keywords_id`,`libro_id`),
  KEY `FK_detalle_keywords_libro` (`libro_id`),
  KEY `FK_detalle_keywords_keywords` (`keywords_id`),
  CONSTRAINT `FK_detalle_keywords_keywords` FOREIGN KEY (`keywords_id`) REFERENCES `keywords` (`keywords_id`),
  CONSTRAINT `FK_detalle_keywords_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.detalle_keywords: ~6 rows (aproximadamente)
DELETE FROM `detalle_keywords`;
INSERT INTO `detalle_keywords` (`detalle_keywords_id`, `keywords_id`, `libro_id`, `detalle_keywords_fechacreacion`, `detalle_keywords_fechaupdate`) VALUES
	(10, 2, 1, '2022-10-30 16:25:11', '2022-10-30 16:25:11'),
	(11, 1, 1, '2022-10-30 16:25:56', '2022-10-30 16:25:56'),
	(12, 8, 21, '2022-11-01 16:08:21', '2022-11-01 16:08:21'),
	(13, 7, 21, '2022-11-01 16:08:26', '2022-11-01 16:08:26'),
	(14, 6, 21, '2022-11-01 16:08:27', '2022-11-01 16:08:27'),
	(15, 1, 21, '2022-11-01 16:08:34', '2022-11-01 16:08:34');

-- Volcando estructura para tabla aesanluc_biblioteca.detalle_materias
DROP TABLE IF EXISTS `detalle_materias`;
CREATE TABLE IF NOT EXISTS `detalle_materias` (
  `detalle_materias_id` int(11) NOT NULL AUTO_INCREMENT,
  `libro_id` int(11) NOT NULL,
  `materias_id` int(11) NOT NULL,
  `detalle_materias_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `detalle_materias_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`detalle_materias_id`),
  UNIQUE KEY `UQ_libro_materias` (`materias_id`,`libro_id`),
  KEY `FK_detalle_materias_libro` (`libro_id`),
  KEY `FK_detalle_materias_materias` (`materias_id`),
  CONSTRAINT `FK_detalle_materias_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`),
  CONSTRAINT `FK_detalle_materias_materias` FOREIGN KEY (`materias_id`) REFERENCES `materias` (`materias_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.detalle_materias: ~4 rows (aproximadamente)
DELETE FROM `detalle_materias`;
INSERT INTO `detalle_materias` (`detalle_materias_id`, `libro_id`, `materias_id`, `detalle_materias_fechacreacion`, `detalle_materias_fechaupdate`) VALUES
	(5, 1, 2, '2022-10-30 17:29:51', '2022-10-30 17:29:51'),
	(6, 1, 1, '2022-10-30 17:29:54', '2022-10-30 17:29:54'),
	(7, 21, 6, '2022-11-01 16:08:43', '2022-11-01 16:08:43'),
	(8, 21, 7, '2022-11-01 16:08:45', '2022-11-01 16:08:45');

-- Volcando estructura para tabla aesanluc_biblioteca.detalle_niveles
DROP TABLE IF EXISTS `detalle_niveles`;
CREATE TABLE IF NOT EXISTS `detalle_niveles` (
  `detalle_niveles_id` int(11) NOT NULL AUTO_INCREMENT,
  `niveles_id` int(11) NOT NULL,
  `libro_id` int(11) NOT NULL,
  `detalle_niveles_orden` int(11) NOT NULL,
  `detalle_niveles_dependencia` int(11) DEFAULT NULL,
  `detalle_niveles_titulo` text NOT NULL,
  `detalle_niveles_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `detalle_niveles_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`detalle_niveles_id`),
  KEY `FK_detalle_niveles_niveles` (`niveles_id`),
  KEY `FK_detalle_niveles_libro` (`libro_id`),
  CONSTRAINT `FK_detalle_niveles_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`),
  CONSTRAINT `FK_detalle_niveles_niveles` FOREIGN KEY (`niveles_id`) REFERENCES `niveles` (`niveles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.detalle_niveles: ~19 rows (aproximadamente)
DELETE FROM `detalle_niveles`;
INSERT INTO `detalle_niveles` (`detalle_niveles_id`, `niveles_id`, `libro_id`, `detalle_niveles_orden`, `detalle_niveles_dependencia`, `detalle_niveles_titulo`, `detalle_niveles_fechacreacion`, `detalle_niveles_fechaupdate`) VALUES
	(15, 1, 21, 1, NULL, 'Presentación', '2022-11-01 16:10:33', '2022-11-01 16:10:33'),
	(16, 1, 21, 2, NULL, 'Introducción', '2022-11-01 16:10:41', '2022-11-01 21:35:18'),
	(17, 1, 21, 3, NULL, 'Orientaciones metodológicas', '2022-11-01 16:11:37', '2022-11-01 16:11:37'),
	(18, 1, 21, 4, NULL, 'Primera Unidad: Sociedad de la información', '2022-11-01 16:11:58', '2022-11-01 16:11:58'),
	(23, 2, 21, 1, 18, 'Lección 1: Sociedad de la información', '2022-11-01 21:45:22', '2022-11-01 21:45:22'),
	(24, 5, 21, 1, 23, 'Principios fundamentales de la Sociedad de la Información', '2022-11-01 21:47:17', '2022-11-01 21:47:17'),
	(25, 5, 21, 2, 23, 'Definiendo la Sociedad de la Información', '2022-11-01 21:47:33', '2022-11-01 21:47:33'),
	(26, 5, 21, 3, 23, 'Sociedad de la Información y conectividad en el planeta', '2022-11-01 21:47:48', '2022-11-01 21:47:48'),
	(27, 2, 21, 2, 18, 'Lección 2: Tecnologías de la Información y la Comunicación', '2022-11-01 21:49:21', '2022-11-01 21:49:21'),
	(28, 5, 21, 1, 27, 'Fundamentos de las TIC', '2022-11-01 21:49:55', '2022-11-01 21:49:55'),
	(29, 5, 21, 2, 27, 'Evolución de las TIC', '2022-11-01 21:50:10', '2022-11-01 21:50:10'),
	(30, 5, 21, 3, 27, 'Impacto de las TIC', '2022-11-01 21:50:22', '2022-11-01 21:50:22'),
	(31, 2, 21, 3, 18, 'Lección 3: Desarrollo de las Tecnologías de la Información y la Comunicación', '2022-11-01 21:51:24', '2022-11-01 21:51:24'),
	(32, 5, 21, 1, 31, 'Educación', '2022-11-01 21:51:43', '2022-11-01 21:51:43'),
	(33, 5, 21, 2, 31, 'Empresa', '2022-11-01 21:51:59', '2022-11-01 21:51:59'),
	(34, 5, 21, 3, 31, 'Gobierno', '2022-11-01 21:52:23', '2022-11-01 21:52:23'),
	(35, 1, 21, 5, NULL, 'Resumen', '2022-11-01 21:53:14', '2022-11-01 21:53:14'),
	(36, 1, 21, 6, NULL, 'Lectura 1', '2022-11-01 21:53:24', '2022-11-01 21:53:24'),
	(37, 1, 21, 7, NULL, 'Lectura 2', '2022-11-01 21:53:30', '2022-11-01 21:53:30');

-- Volcando estructura para tabla aesanluc_biblioteca.detalle_rol_permiso
DROP TABLE IF EXISTS `detalle_rol_permiso`;
CREATE TABLE IF NOT EXISTS `detalle_rol_permiso` (
  `drp_id` int(11) NOT NULL AUTO_INCREMENT,
  `permiso_id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL,
  `drp_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `drp_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`drp_id`) USING BTREE,
  UNIQUE KEY `UQ_permiso_rol` (`permiso_id`,`roles_id`),
  KEY `FK_detalle_rol_permiso_roles` (`roles_id`),
  KEY `FK_detalle_rol_permiso_permiso` (`permiso_id`),
  CONSTRAINT `FK_detalle_rol_permiso_permiso` FOREIGN KEY (`permiso_id`) REFERENCES `permiso` (`permiso_id`),
  CONSTRAINT `FK_detalle_rol_permiso_roles` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`roles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.detalle_rol_permiso: ~20 rows (aproximadamente)
DELETE FROM `detalle_rol_permiso`;
INSERT INTO `detalle_rol_permiso` (`drp_id`, `permiso_id`, `roles_id`, `drp_fechacreacion`, `drp_fechaupdate`) VALUES
	(498, 21, 10, '2022-11-02 21:27:20', '2022-11-02 21:27:20'),
	(499, 21, 4, '2022-11-02 21:33:33', '2022-11-02 21:33:33'),
	(522, 1, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(523, 2, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(524, 3, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(525, 8, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(526, 9, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(527, 11, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(528, 12, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(529, 13, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(530, 14, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(531, 15, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(532, 16, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(533, 17, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(534, 18, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(535, 4, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(536, 5, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(537, 6, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(538, 7, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(539, 10, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(540, 19, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(541, 20, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(542, 21, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(543, 22, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18'),
	(544, 23, 1, '2022-11-02 21:39:18', '2022-11-02 21:39:18');

-- Volcando estructura para tabla aesanluc_biblioteca.detalle_rol_usuario
DROP TABLE IF EXISTS `detalle_rol_usuario`;
CREATE TABLE IF NOT EXISTS `detalle_rol_usuario` (
  `dru_id` int(11) NOT NULL AUTO_INCREMENT,
  `roles_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `dru_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `dru_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`dru_id`),
  UNIQUE KEY `roles_usuarios` (`roles_id`,`usuarios_id`) USING BTREE,
  KEY `FK_detalle_rol_usuario_roles` (`roles_id`),
  KEY `FK_detalle_rol_usuario_usuario` (`usuarios_id`),
  CONSTRAINT `FK_detalle_rol_usuario_roles` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`roles_id`),
  CONSTRAINT `FK_detalle_rol_usuario_usuarios` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`usuarios_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.detalle_rol_usuario: ~7 rows (aproximadamente)
DELETE FROM `detalle_rol_usuario`;
INSERT INTO `detalle_rol_usuario` (`dru_id`, `roles_id`, `usuarios_id`, `dru_fechacreacion`, `dru_fechaupdate`) VALUES
	(33, 1, 14, '2022-10-03 23:14:41', '2022-10-03 23:14:41'),
	(34, 3, 12, '2022-10-03 23:14:50', '2022-10-03 23:14:50'),
	(36, 10, 15, '2022-10-03 23:15:27', '2022-10-03 23:15:27'),
	(37, 9, 2, '2022-10-04 12:34:59', '2022-10-04 12:34:59'),
	(47, 9, 22, '2022-10-07 16:44:15', '2022-10-07 16:44:15'),
	(49, 1, 1, '2022-10-12 13:25:00', '2022-10-12 13:25:00'),
	(50, 2, 24, '2022-10-31 02:15:16', '2022-10-31 02:15:16');

-- Volcando estructura para tabla aesanluc_biblioteca.detalle_tipolibro
DROP TABLE IF EXISTS `detalle_tipolibro`;
CREATE TABLE IF NOT EXISTS `detalle_tipolibro` (
  `detalle_tipolibro_id` int(11) NOT NULL AUTO_INCREMENT,
  `libro_id` int(11) NOT NULL,
  `tipo_libro_id` int(11) NOT NULL,
  `detalle_tipolibro_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `detalle_tipolibro_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`detalle_tipolibro_id`),
  UNIQUE KEY `UQ_detalle_libro_tipo` (`libro_id`,`tipo_libro_id`),
  KEY `FK_detalle_tipolibro_tipo_libro` (`tipo_libro_id`),
  KEY `FK_detalle_libro_libro` (`libro_id`),
  CONSTRAINT `FK_detalle_tipolibro_libro` FOREIGN KEY (`libro_id`) REFERENCES `libro` (`libro_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_detalle_tipolibro_tipo_libro` FOREIGN KEY (`tipo_libro_id`) REFERENCES `tipo_libro` (`tipo_libro_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.detalle_tipolibro: ~4 rows (aproximadamente)
DELETE FROM `detalle_tipolibro`;
INSERT INTO `detalle_tipolibro` (`detalle_tipolibro_id`, `libro_id`, `tipo_libro_id`, `detalle_tipolibro_fechacreacion`, `detalle_tipolibro_fechaupdate`) VALUES
	(35, 18, 1, '2022-10-28 16:07:53', '2022-10-28 16:07:53'),
	(40, 1, 1, '2022-10-28 21:46:34', '2022-10-28 21:46:34'),
	(41, 1, 2, '2022-10-28 21:46:34', '2022-10-28 21:46:34'),
	(43, 21, 2, '2022-11-01 16:25:17', '2022-11-01 16:25:17');

-- Volcando estructura para tabla aesanluc_biblioteca.det_permiso_usuarios
DROP TABLE IF EXISTS `det_permiso_usuarios`;
CREATE TABLE IF NOT EXISTS `det_permiso_usuarios` (
  `dpu_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios_id` int(11) NOT NULL,
  `permiso_id` int(11) NOT NULL,
  `dpu_estado` tinyint(4) NOT NULL DEFAULT 1,
  `dpu_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `dpu_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`dpu_id`),
  UNIQUE KEY `permiso_id` (`permiso_id`),
  UNIQUE KEY `usuarios_id` (`usuarios_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.det_permiso_usuarios: ~0 rows (aproximadamente)
DELETE FROM `det_permiso_usuarios`;

-- Volcando estructura para tabla aesanluc_biblioteca.editoriales
DROP TABLE IF EXISTS `editoriales`;
CREATE TABLE IF NOT EXISTS `editoriales` (
  `editoriales_id` int(11) NOT NULL AUTO_INCREMENT,
  `editoriales_nombre` varchar(150) NOT NULL,
  `editoriales_descripcion` varchar(500) DEFAULT NULL,
  `editoriales_estado` tinyint(4) NOT NULL DEFAULT 1,
  `editoriales_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `editoriales_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`editoriales_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.editoriales: ~3 rows (aproximadamente)
DELETE FROM `editoriales`;
INSERT INTO `editoriales` (`editoriales_id`, `editoriales_nombre`, `editoriales_descripcion`, `editoriales_estado`, `editoriales_fechacreacion`, `editoriales_fechaupdate`) VALUES
	(1, 'Grupo Editorial Caja Negra', 'El Grupo Editorial Caja Negra es una empresa nacida en suelo peruano en marzo del 2011. Desde sus primeros pasos ha tenido un modelo de trabajo bastante definido: ser mucho más que una editorial. Su propósito es ofrecer una atención personalizada y publicar títulos de calidad superior.', 1, '2022-10-27 14:43:31', '2022-10-27 15:15:16'),
	(3, 'Colmena Editores', 'Ubicada en Lima, Perú, Colmena Editores es una empresa del sector literario fundada en 2012. Nace a partir de la necesidad de enriquecer el mercado editorial del país y, en realidad, de toda Latinoamérica. Conscientes de lo inaccesible que pueden llegar a ser los libros, se han propuesto ofrecer obras originales de calidad a precios solidarios.', 1, '2022-10-27 15:28:45', '2022-10-27 15:30:08'),
	(4, 'Fondo Editorial de la UIGV', '-', 1, '2022-11-01 15:47:59', '2022-11-01 15:47:59');

-- Volcando estructura para tabla aesanluc_biblioteca.grupo_permiso
DROP TABLE IF EXISTS `grupo_permiso`;
CREATE TABLE IF NOT EXISTS `grupo_permiso` (
  `grupo_permiso_id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_permiso_nombre` varchar(50) NOT NULL,
  `grupo_permiso_estado` tinyint(4) NOT NULL DEFAULT 1,
  `grupo_permiso_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `grupo_permiso_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`grupo_permiso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.grupo_permiso: ~3 rows (aproximadamente)
DELETE FROM `grupo_permiso`;
INSERT INTO `grupo_permiso` (`grupo_permiso_id`, `grupo_permiso_nombre`, `grupo_permiso_estado`, `grupo_permiso_fechacreacion`, `grupo_permiso_fechaupdate`) VALUES
	(1, 'Administrador del sistema', 1, '2022-08-25 09:13:38', '2022-09-02 15:52:58'),
	(2, 'Administrador', 1, '2022-08-25 09:13:48', '2022-09-02 15:52:51'),
	(3, 'Bibliotecario', 1, '2022-09-02 15:52:34', '2022-09-29 13:26:07');

-- Volcando estructura para tabla aesanluc_biblioteca.keywords
DROP TABLE IF EXISTS `keywords`;
CREATE TABLE IF NOT EXISTS `keywords` (
  `keywords_id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords_nombre` varchar(150) NOT NULL,
  `keywords_descripcion` varchar(300) NOT NULL,
  `keywords_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `keywords_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`keywords_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.keywords: ~5 rows (aproximadamente)
DELETE FROM `keywords`;
INSERT INTO `keywords` (`keywords_id`, `keywords_nombre`, `keywords_descripcion`, `keywords_fechacreacion`, `keywords_fechaupdate`) VALUES
	(1, 'Inteligencia artificial', 'Se refiere a sistemas o máquinas que imitan la inteligencia humana para realizar tareas y pueden mejorar iterativamente a partir de la información que recopilan.', '2022-10-20 21:33:33', '2022-10-20 22:57:22'),
	(2, 'Materia', 'Es un objeto que ocupa un espacio en el universo.', '2022-10-20 22:18:45', '2022-10-20 22:58:31'),
	(6, 'Tecnologías de la Información', '-', '2022-11-01 16:06:47', '2022-11-01 16:06:47'),
	(7, 'Comunicación', '-', '2022-11-01 16:07:05', '2022-11-01 16:07:05'),
	(8, 'TICs', '-', '2022-11-01 16:07:20', '2022-11-01 16:07:20');

-- Volcando estructura para tabla aesanluc_biblioteca.libro
DROP TABLE IF EXISTS `libro`;
CREATE TABLE IF NOT EXISTS `libro` (
  `libro_id` int(11) NOT NULL AUTO_INCREMENT,
  `libro_titulo` varchar(500) NOT NULL,
  `libro_resumen` varchar(800) DEFAULT NULL,
  `libro_paginas` int(11) NOT NULL,
  `libro_isbn` varchar(50) DEFAULT NULL,
  `libro_edision` varchar(50) DEFAULT NULL,
  `libro_volumen` int(11) NOT NULL DEFAULT 0,
  `libro_peso` int(11) DEFAULT NULL,
  `libro_imagen` varchar(200) NOT NULL,
  `libro_valoracion` int(11) NOT NULL DEFAULT 0,
  `categorias_id` int(11) NOT NULL,
  `editoriales_id` int(11) DEFAULT NULL,
  `libro_estado` tinyint(4) NOT NULL DEFAULT 1,
  `libro_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `libro_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`libro_id`),
  UNIQUE KEY `libro_titulo` (`libro_titulo`),
  KEY `FK_libro_categorias` (`categorias_id`),
  KEY `FK_libro_editoriales` (`editoriales_id`),
  CONSTRAINT `FK_libro_categorias` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`categorias_id`),
  CONSTRAINT `FK_libro_editoriales` FOREIGN KEY (`editoriales_id`) REFERENCES `editoriales` (`editoriales_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.libro: ~3 rows (aproximadamente)
DELETE FROM `libro`;
INSERT INTO `libro` (`libro_id`, `libro_titulo`, `libro_resumen`, `libro_paginas`, `libro_isbn`, `libro_edision`, `libro_volumen`, `libro_peso`, `libro_imagen`, `libro_valoracion`, `categorias_id`, `editoriales_id`, `libro_estado`, `libro_fechacreacion`, `libro_fechaupdate`) VALUES
	(1, 'Cien años de soledad', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Alias facere repellat libero rem dignissimos maxime. Dignissimos reprehenderit error sunt facere, temporibus quidem similique magni sint. Deserunt, blanditiis porro quis soluta nostrum veritatis impedit. Eius atque, quisquam laborum repellendus eaque labore et saepe nisi.', 350, 'NBS-01', '2', 3, 250, 'libro_profile_20221028_154736.jpg', 0, 1, 3, 1, '2022-10-27 16:08:21', '2022-10-30 13:42:55'),
	(18, 'Sangre de Campion', '', 212, NULL, NULL, 0, NULL, 'libro_sinfoto.png', 0, 1, NULL, 1, '2022-10-28 15:48:06', '2022-10-28 16:07:53'),
	(21, 'Tecnologías de la Información y la Comunicación', 'Las TIC son el conjunto de tecnologías que permiten el acceso, producción, tratamiento y comunicación de información presentada en diferentes códigos (texto, imagen, sonido,...). El elemento más representativo de las nuevas tecnologías es sin duda el ordenador y más específicamente, Internet.', 74, '-', 'Fondo Editorial de la UIGV', 0, NULL, 'libro_profile_20221101_105003.jpg', 0, 5, 1, 1, '2022-11-01 15:50:03', '2022-11-02 00:09:20');

-- Volcando estructura para tabla aesanluc_biblioteca.materias
DROP TABLE IF EXISTS `materias`;
CREATE TABLE IF NOT EXISTS `materias` (
  `materias_id` int(11) NOT NULL AUTO_INCREMENT,
  `materias_nombre` varchar(150) NOT NULL,
  `materias_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `materias_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`materias_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.materias: ~4 rows (aproximadamente)
DELETE FROM `materias`;
INSERT INTO `materias` (`materias_id`, `materias_nombre`, `materias_fechacreacion`, `materias_fechaupdate`) VALUES
	(1, 'Matemática', '2022-10-21 04:23:17', '2022-10-21 04:59:08'),
	(2, 'Comunicación', '2022-10-21 04:23:24', '2022-10-22 00:39:29'),
	(6, 'Computación', '2022-11-01 16:07:39', '2022-11-01 16:07:39'),
	(7, 'Desarrollo y mantenimiento de software', '2022-11-01 16:08:02', '2022-11-01 16:09:07');

-- Volcando estructura para tabla aesanluc_biblioteca.niveles
DROP TABLE IF EXISTS `niveles`;
CREATE TABLE IF NOT EXISTS `niveles` (
  `niveles_id` int(11) NOT NULL AUTO_INCREMENT,
  `niveles_descripcion` varchar(100) NOT NULL,
  `niveles_orden` int(11) NOT NULL,
  `niveles_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `niveles_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`niveles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.niveles: ~5 rows (aproximadamente)
DELETE FROM `niveles`;
INSERT INTO `niveles` (`niveles_id`, `niveles_descripcion`, `niveles_orden`, `niveles_fechacreacion`, `niveles_fechaupdate`) VALUES
	(1, 'Nivel 1', 1, '2022-10-23 16:09:35', '2022-10-23 16:09:35'),
	(2, 'Nivel 2', 2, '2022-10-23 16:32:58', '2022-10-23 16:52:54'),
	(5, 'Nivel 3', 3, '2022-11-01 21:46:39', '2022-11-01 21:46:39'),
	(6, 'Nivel 4', 4, '2022-11-01 21:46:47', '2022-11-01 21:46:47'),
	(7, 'Nivel 5', 5, '2022-11-01 21:46:55', '2022-11-01 21:46:55');

-- Volcando estructura para tabla aesanluc_biblioteca.parrafos
DROP TABLE IF EXISTS `parrafos`;
CREATE TABLE IF NOT EXISTS `parrafos` (
  `parrafos_id` int(11) NOT NULL AUTO_INCREMENT,
  `parrafos_descripcion` varchar(100) NOT NULL,
  `parrafos_orden` int(11) NOT NULL,
  `parrafos_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `parrafos_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`parrafos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.parrafos: ~6 rows (aproximadamente)
DELETE FROM `parrafos`;
INSERT INTO `parrafos` (`parrafos_id`, `parrafos_descripcion`, `parrafos_orden`, `parrafos_fechacreacion`, `parrafos_fechaupdate`) VALUES
	(1, 'Párrafo 1', 1, '2022-10-19 23:03:07', '2022-10-19 23:03:07'),
	(2, 'Párrafo 2', 2, '2022-10-19 23:03:18', '2022-10-20 13:54:40'),
	(3, 'Párrafo 3', 3, '2022-10-20 05:27:12', '2022-11-02 14:41:48'),
	(4, 'Párrafo 4', 4, '2022-10-20 06:00:34', '2022-11-02 14:41:50'),
	(5, 'Párrafo 5', 5, '2022-10-20 06:01:14', '2022-11-02 14:41:51'),
	(6, 'Párrafo 6', 6, '2022-10-29 20:13:10', '2022-11-02 14:41:52');

-- Volcando estructura para tabla aesanluc_biblioteca.permiso
DROP TABLE IF EXISTS `permiso`;
CREATE TABLE IF NOT EXISTS `permiso` (
  `permiso_id` int(11) NOT NULL AUTO_INCREMENT,
  `permiso_nombre` varchar(200) NOT NULL,
  `grupo_permiso_id` int(11) NOT NULL,
  `permiso_orden` int(11) DEFAULT NULL,
  `permiso_estado` tinyint(4) NOT NULL DEFAULT 1,
  `permiso_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `permiso_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`permiso_id`),
  KEY `FK_permiso_grupo_permiso` (`grupo_permiso_id`),
  CONSTRAINT `FK_permiso_grupo_permiso` FOREIGN KEY (`grupo_permiso_id`) REFERENCES `grupo_permiso` (`grupo_permiso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.permiso: ~20 rows (aproximadamente)
DELETE FROM `permiso`;
INSERT INTO `permiso` (`permiso_id`, `permiso_nombre`, `grupo_permiso_id`, `permiso_orden`, `permiso_estado`, `permiso_fechacreacion`, `permiso_fechaupdate`) VALUES
	(1, 'Ver roles y agregar', 1, 1, 1, '2022-08-25 09:15:53', '2022-10-17 16:30:44'),
	(2, 'Ver lista de usuarios', 1, 2, 1, '2022-08-25 09:19:43', '2022-10-17 16:31:57'),
	(3, 'Lista de usuarios administradores', 1, 4, 1, '2022-08-25 09:20:40', '2022-10-17 16:38:54'),
	(4, 'Lista de usuarios de intranet', 2, 5, 1, '2022-08-25 09:21:03', '2022-10-17 16:39:04'),
	(5, 'Ver perfil', 2, 6, 1, '2022-08-25 09:21:21', '2022-10-18 22:22:23'),
	(6, 'Agregar libros', 3, 7, 1, '2022-08-25 09:22:19', '2022-10-18 22:33:22'),
	(7, 'Agregar autores', 3, 12, 1, '2022-10-18 22:33:46', '2022-10-18 22:33:51'),
	(8, 'Ver bloqueos', 1, 8, 1, '2022-10-17 15:44:02', '2022-10-17 15:44:06'),
	(9, 'Ver permisos personalizados', 1, 11, 1, '2022-10-17 15:44:32', '2022-10-17 15:44:36'),
	(10, 'Agregar editoriales', 3, 13, 1, '2022-10-18 22:34:25', '2022-10-18 22:34:36'),
	(11, 'Indexación de libros', 1, 14, 1, '2022-10-18 22:53:44', '2022-10-19 22:48:15'),
	(12, 'Agregar párrafos', 1, 15, 1, '2022-10-19 22:37:46', '2022-10-19 22:37:46'),
	(13, 'Agregar palabras claves', 1, 16, 1, '2022-10-20 16:21:20', '2022-10-20 16:21:23'),
	(14, 'Agregar materias', 1, 17, 1, '2022-10-21 04:07:30', '2022-10-21 04:07:39'),
	(15, 'Agregar categorias', 1, 18, 1, '2022-10-22 00:51:32', '2022-10-22 00:51:32'),
	(16, 'Agregar niveles', 1, 19, 1, '2022-10-23 15:49:24', '2022-10-23 15:49:24'),
	(17, 'Agregar terminologías', 1, 20, 1, '2022-10-23 17:17:56', '2022-10-23 17:17:56'),
	(18, 'Ver terminologías vinculadas', 1, 21, 1, '2022-10-24 20:55:42', '2022-10-24 20:55:42'),
	(19, 'Agregar contenido libro', 3, 22, 1, '2022-10-28 16:20:14', '2022-10-28 16:20:14'),
	(20, 'Agregar concepto a los titulos', 3, 23, 1, '2022-11-01 22:53:50', '2022-11-01 22:56:19'),
	(21, 'Motor de busqueda', 3, 24, 1, '2022-11-02 20:39:53', '2022-11-02 20:39:53'),
	(22, 'Reservas de libros', 3, 25, 1, '2022-11-02 21:34:32', '2022-11-02 21:35:27'),
	(23, 'Prestamos de libros', 3, 26, 1, '2022-11-02 21:35:13', '2022-11-02 21:35:31');

-- Volcando estructura para tabla aesanluc_biblioteca.prestamos
DROP TABLE IF EXISTS `prestamos`;
CREATE TABLE IF NOT EXISTS `prestamos` (
  `prestamos_id` int(11) NOT NULL AUTO_INCREMENT,
  `prestamos_fechaprestamos` timestamp NULL DEFAULT NULL,
  `prestamos_fechadevolucion` timestamp NULL DEFAULT NULL,
  `prestamos_observacion_devolucion` varchar(300) NOT NULL,
  `copias_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `prestamos_estado` tinyint(4) NOT NULL DEFAULT 1,
  `prestamos_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `prestamos_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`prestamos_id`),
  UNIQUE KEY `UQ_copias_usuarios` (`copias_id`,`usuarios_id`),
  KEY `FK_prestamos_copia` (`copias_id`),
  CONSTRAINT `FK_prestamos_copias` FOREIGN KEY (`copias_id`) REFERENCES `copias` (`copias_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.prestamos: ~0 rows (aproximadamente)
DELETE FROM `prestamos`;

-- Volcando estructura para tabla aesanluc_biblioteca.reservas
DROP TABLE IF EXISTS `reservas`;
CREATE TABLE IF NOT EXISTS `reservas` (
  `reservas_id` int(11) NOT NULL AUTO_INCREMENT,
  `reservas_fechareserva` timestamp NULL DEFAULT NULL,
  `copias_id` int(11) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `reservas_estado` tinyint(4) NOT NULL DEFAULT 1,
  `reservas_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `reservas_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`reservas_id`),
  UNIQUE KEY `UQ_copias_usuarios_reservas` (`copias_id`,`usuarios_id`),
  KEY `FK_reservas_copias` (`copias_id`),
  CONSTRAINT `FK_reservas_copias` FOREIGN KEY (`copias_id`) REFERENCES `copias` (`copias_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.reservas: ~0 rows (aproximadamente)
DELETE FROM `reservas`;

-- Volcando estructura para tabla aesanluc_biblioteca.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `roles_id` int(11) NOT NULL AUTO_INCREMENT,
  `roles_nombre` varchar(100) NOT NULL,
  `roles_descripcion` varchar(300) NOT NULL,
  `roles_estado` tinyint(4) NOT NULL DEFAULT 1,
  `roles_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `roles_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`roles_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.roles: ~6 rows (aproximadamente)
DELETE FROM `roles`;
INSERT INTO `roles` (`roles_id`, `roles_nombre`, `roles_descripcion`, `roles_estado`, `roles_fechacreacion`, `roles_fechaupdate`) VALUES
	(1, 'Administrador del sistema', 'Encargado del mantenimiento de todo el sistema', 1, '2022-08-24 13:17:28', '2022-09-22 12:24:21'),
	(2, 'Administrador', 'Encargado de manejar toda la gestion', 1, '2022-08-25 09:13:02', '2022-09-02 15:55:52'),
	(3, 'Bibliotecario', 'Encargado de alimentar la biblioteca', 1, '2022-09-02 15:54:41', '2022-09-29 13:25:46'),
	(4, 'Usuarios intranet', 'Rol creado para los usuarios que serán eliminados en algún momento', 1, '2022-10-12 15:47:59', '2022-11-02 21:32:35'),
	(9, 'Invitado', 'Rol creado para los usuarios que serán eliminados en algún momento', 1, '2022-09-29 13:34:24', '2022-09-29 13:38:49'),
	(10, 'Estudiante', 'Rol creado para los usuarios que serán eliminados en algún momento', 1, '2022-09-29 13:39:04', '2022-10-02 16:49:34');

-- Volcando estructura para tabla aesanluc_biblioteca.terminologias
DROP TABLE IF EXISTS `terminologias`;
CREATE TABLE IF NOT EXISTS `terminologias` (
  `terminologias_id` int(11) NOT NULL AUTO_INCREMENT,
  `terminologias_nombre` varchar(300) NOT NULL,
  `terminologias_descripcion` varchar(500) NOT NULL,
  `terminologias_orden` int(11) NOT NULL,
  `terminologias_dependencia` int(11) DEFAULT NULL,
  `terminologias_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `terminologias_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`terminologias_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.terminologias: ~16 rows (aproximadamente)
DELETE FROM `terminologias`;
INSERT INTO `terminologias` (`terminologias_id`, `terminologias_nombre`, `terminologias_descripcion`, `terminologias_orden`, `terminologias_dependencia`, `terminologias_fechacreacion`, `terminologias_fechaupdate`) VALUES
	(1, 'Ciencia y sociedad', 'Se entiende por ciencia a aquella esfera de la actividad de la sociedad, cuyo objeto esencial es la adquisición de conocimientos acerca del mundo circundante.', 1, NULL, '2022-10-25 13:32:53', '2022-10-26 16:07:01'),
	(16, 'comunicación', 'Es la transmisión de información de un emisor a un receptor. Cuando se produce un ACTO DE COMUNICACIÓN intervienen una serie de elementos.', 3, 17, '2022-10-24 22:26:00', '2022-10-25 22:29:24'),
	(17, 'Ciencia', 'Conjunto de conocimientos obtenidos mediante la observación y el razonamiento , sistemáticamente estructurados y de los que se deducen principios y leyes generales con capacidad predictiva y comprobables experimentalmente .', 2, 1, '2022-10-24 22:26:40', '2022-10-24 22:26:40'),
	(22, 'todos', 'njdid oqwdjqwd iqwd', 3, 17, '2022-10-25 16:33:56', '2022-10-25 16:48:43'),
	(23, 'dqwdq', 'dqwdqd', 4, 22, '2022-10-26 12:27:51', '2022-10-26 12:27:51'),
	(24, 'fdfdfd', 'fdfdfdfdfdf', 1, NULL, '2022-10-26 12:28:32', '2022-10-26 12:28:32'),
	(25, 'ewwfewef', 'wefwefw', 2, 24, '2022-10-26 12:28:46', '2022-10-26 12:28:46'),
	(26, 'dwe', 'wefwefwef', 4, 16, '2022-10-26 12:33:56', '2022-10-26 12:33:56'),
	(27, 'vgedsv', 'dfvdfv', 4, 22, '2022-10-26 12:54:05', '2022-10-26 12:54:05'),
	(28, 'qwdqwdqwdqwd', 'qwdqwdqwdqwd', 2, 1, '2022-10-26 13:39:05', '2022-10-26 13:39:05'),
	(29, 'swaqdcq', 'wecwecw', 5, 26, '2022-10-26 14:17:25', '2022-10-26 14:17:25'),
	(30, 'dqwdqwd', 'wqddqwdqwd', 4, 16, '2022-10-26 14:18:12', '2022-10-26 14:18:12'),
	(31, 'dfqwfqfqfqwefq', 'ffqwefqwefqwefqe', 5, 30, '2022-10-26 14:18:54', '2022-10-26 14:18:54'),
	(32, 'dqqwqwq', 'qwqwqw', 5, 27, '2022-10-26 14:20:50', '2022-10-26 14:20:50'),
	(33, 'qwwwwwwwwwwwwwww', 'www', 6, 32, '2022-10-26 14:21:50', '2022-10-26 14:21:50'),
	(34, 'wqdqq', 'ww', 6, 32, '2022-10-26 14:24:16', '2022-10-26 14:24:16');

-- Volcando estructura para tabla aesanluc_biblioteca.tipo_bloqueo
DROP TABLE IF EXISTS `tipo_bloqueo`;
CREATE TABLE IF NOT EXISTS `tipo_bloqueo` (
  `tipo_bloqueo_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_bloqueo_descripcion` varchar(200) NOT NULL,
  `tipo_bloqueo_estado` tinyint(4) NOT NULL DEFAULT 1,
  `tipo_bloqueo_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo_bloqueo_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`tipo_bloqueo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.tipo_bloqueo: ~3 rows (aproximadamente)
DELETE FROM `tipo_bloqueo`;
INSERT INTO `tipo_bloqueo` (`tipo_bloqueo_id`, `tipo_bloqueo_descripcion`, `tipo_bloqueo_estado`, `tipo_bloqueo_fechacreacion`, `tipo_bloqueo_fechaupdate`) VALUES
	(1, 'No labora en esta institución', 1, '2022-10-06 16:20:50', '2022-10-06 16:20:50'),
	(2, 'Prueba 2', 1, '2022-10-06 16:39:50', '2022-10-06 16:39:50'),
	(3, 'Prueba 3', 1, '2022-10-06 16:39:58', '2022-10-06 16:39:58');

-- Volcando estructura para tabla aesanluc_biblioteca.tipo_libro
DROP TABLE IF EXISTS `tipo_libro`;
CREATE TABLE IF NOT EXISTS `tipo_libro` (
  `tipo_libro_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_libro_nombre` varchar(150) NOT NULL,
  `tipo_libro_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `tipo_libro_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`tipo_libro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.tipo_libro: ~2 rows (aproximadamente)
DELETE FROM `tipo_libro`;
INSERT INTO `tipo_libro` (`tipo_libro_id`, `tipo_libro_nombre`, `tipo_libro_fechacreacion`, `tipo_libro_fechaupdate`) VALUES
	(1, 'Fisico', '2022-10-27 15:56:31', '2022-10-27 15:56:31'),
	(2, 'Digital', '2022-10-27 15:56:40', '2022-10-27 15:56:40');

-- Volcando estructura para tabla aesanluc_biblioteca.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuarios_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuarios_login` varchar(20) NOT NULL,
  `usuarios_nombres` varchar(150) NOT NULL,
  `usuarios_paterno` varchar(150) NOT NULL,
  `usuarios_materno` varchar(100) NOT NULL,
  `usuarios_dni` varchar(12) NOT NULL,
  `usuarios_email` varchar(100) NOT NULL,
  `usuarios_password` varchar(100) NOT NULL,
  `usuarios_estado` tinyint(4) NOT NULL DEFAULT 1,
  `usuarios_foto` varchar(100) NOT NULL,
  `usuarios_fechacreacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `usuarios_fechaupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usuarios_updatepassword` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`usuarios_id`),
  UNIQUE KEY `UQ_login_dni` (`usuarios_login`,`usuarios_dni`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla aesanluc_biblioteca.usuarios: ~7 rows (aproximadamente)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`usuarios_id`, `usuarios_login`, `usuarios_nombres`, `usuarios_paterno`, `usuarios_materno`, `usuarios_dni`, `usuarios_email`, `usuarios_password`, `usuarios_estado`, `usuarios_foto`, `usuarios_fechacreacion`, `usuarios_fechaupdate`, `usuarios_updatepassword`) VALUES
	(1, 'admin', 'Samuel', 'VELA', 'LLANOS', '71116734', 'svelallanos@gmail.com', '$2y$10$iOn96RHvDcPG.bMmpQLtue8ltLBv8hHygx0hadmYn2Un7aUe/IIe2', 1, '', '2022-10-12 13:24:04', '2022-10-12 13:24:47', '2022-10-12 13:32:48'),
	(2, 'invitado', 'Invitado', 'paterno', 'materno', '90000000', 's@s.com', '$2y$10$0wLVRt1PE/1SOSNrBBvKZ.bNjAc0z26QG1YY8cTegXqGbym69O47u', 1, 'sin_foto.png', '2022-08-05 21:07:33', '2022-10-18 21:37:40', '2022-10-12 13:32:48'),
	(12, '45120607', 'Alejandria', 'MARLO', 'RODRIGUEZ', '45120607', 'samu@gmail.com', '$2y$10$DdxvkuPuq3sYwP9vB6RtFewkjyPLT8PSqW6Xsr4wLrbZqW13tZyK6', 1, 'sin_foto.png', '2022-09-23 14:52:32', '2022-10-03 21:58:57', '2022-10-12 13:32:48'),
	(14, '71585536', 'Sleyther', 'ADRIANZEN', 'RODRIGUEZ', '71585536', 'samuel@gmail.com', '$2y$10$CPokoXxd37n/bayTQkCgae3Miw2z8tg.A99bVWSX8LKj8iqL0f3ZC', 1, 'sin_foto.png', '2022-09-23 14:55:33', '2022-10-03 21:58:55', '2022-10-12 13:32:48'),
	(15, '71121863', 'Yeyson Daniel', 'MALIMBA', 'CAMPOS', '71121863', 's@s.com', '$2y$10$o.gCjrz7mjmw8QwUM.xgrOJ4R2P2lPnNOaR2e3lkjWavvQTyGBtoS', 1, 'sin_foto.png', '2022-09-23 14:55:36', '2022-10-03 23:15:27', '2022-10-12 13:32:48'),
	(22, '71116732', 'Iliana Aydee', 'RUIZ', 'ALTAMIRANO', '71116732', 'samu@gmail.com', '$2y$10$poR7.BzmsRUQ0OvyOShJUOL.q/i6GCFrtS0IVwbpRbVS8IyM8vjMO', 1, '', '2022-10-05 17:11:09', '2022-10-05 17:11:09', '2022-10-12 13:32:48'),
	(24, '77064230', 'Thalia Veronica', 'TANANTA', 'HUAMAN', '77064230', 'tanantahuamanthaly@gmail.com', '$2y$10$F2EEQWqFkD8Oq2/jID/AleI2lYleKXd3jHW2K7YDWgicKucTbiEbW', 1, 'user_profile_20221030_211534.jpg', '2022-10-31 02:15:16', '2022-10-31 02:15:34', '2022-10-31 02:15:16');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

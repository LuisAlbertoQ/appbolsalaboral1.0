-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 07-07-2023 a las 04:36:57
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bolsa_laboral1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `admin_id` int NOT NULL,
  `admin_ultimo_acceso` date NOT NULL,
  `admin_usu_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `dc_id` int NOT NULL,
  `dc_especialidad` varchar(40) NOT NULL,
  `dc_genero` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1 Masculino 2 Femenino 3 Indefinido',
  `dc_fecha_nacimiento` date NOT NULL,
  `dc_experiencia_labolar` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1 Si 2 No',
  `dc_usu_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`dc_id`, `dc_especialidad`, `dc_genero`, `dc_fecha_nacimiento`, `dc_experiencia_labolar`, `dc_usu_id`) VALUES
(1, 'computo', '1', '1997-10-23', '1', 21),
(2, 'Ing en sistemas', '1', '1984-12-27', '2', 22),
(3, 'base de datos', '1', '1984-06-25', '1', 23),
(4, 'programacion', '1', '1981-06-29', '2', 24),
(5, 'redes', '1', '1980-11-17', '1', 18),
(8, 'Ninguna', '2', '2023-07-08', '2', 77),
(9, 'sdasd', '3', '2023-07-13', '2', 87);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresado`
--

CREATE TABLE `egresado` (
  `eg_id` int NOT NULL,
  `eg_carrera` varchar(50) NOT NULL,
  `eg_anio_egreso` date NOT NULL,
  `eg_genero` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1 Masculino 2 Femenino 3 Indefinido',
  `eg_fecha_nacimiento` date NOT NULL,
  `eg_tercio_superior` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1 Si 2 No',
  `eg_usu_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `egresado`
--

INSERT INTO `egresado` (`eg_id`, `eg_carrera`, `eg_anio_egreso`, `eg_genero`, `eg_fecha_nacimiento`, `eg_tercio_superior`, `eg_usu_id`) VALUES
(1, 'sistemas', '2023-07-28', '1', '2023-07-03', '2', 1),
(2, 'sistemas', '2021-04-12', '1', '1990-10-19', '1', 2),
(3, 'sistemas', '2014-08-23', '2', '1989-07-06', '1', 3),
(4, 'sistemas', '2015-08-27', '1', '1993-06-11', '2', 4),
(5, 'sistemas', '2012-01-03', '1', '1995-11-27', '2', 5),
(6, 'sistemas', '2012-02-08', '2', '1993-10-16', '2', 6),
(7, 'sistemas', '2016-05-11', '1', '1994-05-06', '2', 7),
(8, 'sistemas', '2017-07-27', '1', '1989-05-21', '1', 8),
(9, 'sistemas', '2022-06-20', '1', '1993-06-29', '1', 9),
(10, 'sistemas', '2020-06-21', '2', '1992-08-18', '1', 10),
(11, 'sistemas', '2018-05-05', '1', '1993-11-05', '1', 11),
(12, 'sistemas', '2023-04-01', '1', '1989-09-20', '2', 12),
(13, 'sistemas', '2023-02-24', '1', '1988-10-06', '2', 13),
(14, 'sistemas', '2018-03-18', '1', '1994-03-19', '1', 14),
(15, 'sistemas', '2015-06-07', '1', '1995-01-17', '1', 15),
(16, 'sistemas', '2021-03-02', '1', '1993-12-12', '1', 16),
(17, 'sistemas', '2012-11-07', '1', '1992-08-17', '2', 17),
(18, 'sistemas', '2013-09-24', '1', '1995-06-12', '1', 18),
(19, 'sistemas', '2011-12-07', '1', '1990-08-26', '2', 19),
(20, 'sistemas', '2018-07-09', '1', '1992-05-25', '1', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `em_id` int NOT NULL,
  `em_rubro` varchar(50) NOT NULL,
  `em_fecha_creacion` date NOT NULL,
  `em_nro_sedes` varchar(10) NOT NULL,
  `em_tipo_gestion` varchar(30) NOT NULL,
  `em_pagina_web` varchar(70) NOT NULL,
  `em_nro_trabajadores` varchar(500) NOT NULL,
  `em_usu_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`em_id`, `em_rubro`, `em_fecha_creacion`, `em_nro_sedes`, `em_tipo_gestion`, `em_pagina_web`, `em_nro_trabajadores`, `em_usu_id`) VALUES
(1, 'sistemas', '1975-04-04', '100', 'democrática', 'https://www.microsoft.com/es-pe/', '22', 26),
(2, 'base de datos', '1998-09-04', '100', 'democrática', 'https://www.google.com/intl/es-419/chrome/', '190000', 27),
(3, 'redes', '1976-04-01', '50', 'democrática', 'https://www.apple.com/la/iphone/', '164000', 28),
(4, 'matematica', '1984-02-01', '75', 'democrática', 'https://www.dell.com/es-pe/lp', '133000', 29),
(5, 'civil', '1984-12-10', '25', 'democrática', 'https://www.cisco.com/c/es_pe/index.html', '72900', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `institucion`
--

CREATE TABLE `institucion` (
  `ins_id` int NOT NULL,
  `ins_nro_carrera` varchar(20) NOT NULL,
  `ins_nro_becados` varchar(50) NOT NULL,
  `ins_fecha_creacion` date NOT NULL,
  `ins_usu_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `institucion`
--

INSERT INTO `institucion` (`ins_id`, `ins_nro_carrera`, `ins_nro_becados`, `ins_fecha_creacion`, `ins_usu_id`) VALUES
(1, '8', '300', '2003-12-28', 32),
(2, '13', '500', '1856-07-29', 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monitoreo`
--

CREATE TABLE `monitoreo` (
  `moni_id` int NOT NULL,
  `moni_motivo` varchar(50) NOT NULL,
  `moni_fecha` date NOT NULL,
  `moni_hora` time NOT NULL,
  `moni_duracion` varchar(70) NOT NULL,
  `moni_dc_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `monitoreo`
--

INSERT INTO `monitoreo` (`moni_id`, `moni_motivo`, `moni_fecha`, `moni_hora`, `moni_duracion`, `moni_dc_id`) VALUES
(1, 'Reciente contratacion', '2023-07-26', '09:30:00', 'La duracion sera de 4 horas', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta_laboral`
--

CREATE TABLE `oferta_laboral` (
  `ol_id` int NOT NULL,
  `ol_fecha_inicio_laborales` date NOT NULL,
  `ol_fecha_inicio_convocatoria` date NOT NULL,
  `ol_fecha_fin` date NOT NULL,
  `ol_titulo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ol_descripcion` varchar(300) NOT NULL,
  `ol_horario` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ol_salario` varchar(500) NOT NULL DEFAULT '0',
  `ol_estado` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1 Habilitado 2 Deshabilitado',
  `ol_em_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `oferta_laboral`
--

INSERT INTO `oferta_laboral` (`ol_id`, `ol_fecha_inicio_laborales`, `ol_fecha_inicio_convocatoria`, `ol_fecha_fin`, `ol_titulo`, `ol_descripcion`, `ol_horario`, `ol_salario`, `ol_estado`, `ol_em_id`) VALUES
(1, '2023-05-18', '2023-01-09', '2023-03-15', 'Ingeniero', 'Se requiere un ing', '6:00 – 13:00', '5006', '1', 1),
(2, '2023-12-16', '2023-01-23', '2023-03-18', 'Ingeniero de sistemas', 'Se requiere ing de sistemas', '7:30 – 14:00', '6007', '1', 2),
(3, '2023-08-12', '2023-01-04', '2023-03-19', 'Base de datos', 'Urge persona que tenga experiencia en la base de datos', '8:00 – 13:00', '8007', '1', 3),
(4, '2023-04-15', '2023-01-10', '2023-03-26', 'Redes', 'Personal en redes neuronales', '7:30 – 14:00', '10000', '1', 5),
(5, '2023-04-15', '2023-01-07', '2023-03-06', 'Programador', 'Se requiere programador ', '8:00 – 13:00', '4000', '1', 5),
(6, '2023-04-18', '2023-01-29', '2023-03-05', 'Prof. de matematicas', 'Ing fisico-matematico', '7:30 – 14:00', '6000', '1', 3),
(7, '2023-07-18', '2023-01-06', '2023-03-16', 'personal', 'personal de limpieza', '8:00 – 13:00', '5000', '1', 4),
(8, '2023-07-30', '2023-01-13', '2023-03-05', 'arquitecto', 'se requiere arquitecto', '7:30 – 14:00', '30090', '1', 4),
(9, '2023-10-20', '2023-01-05', '2023-03-20', 'Ingeniero civil', 'civil', '8:00 – 13:00', '9000', '1', 5),
(10, '2023-03-26', '2023-01-12', '2023-03-17', 'investigacion', 'se requiere investigadores', '7:30 – 14:00', '1500', '1', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `postulacion`
--

CREATE TABLE `postulacion` (
  `pc_id` int NOT NULL,
  `pc_ol_id` int NOT NULL,
  `pc_fecha_postulacion` date NOT NULL,
  `pc_eg_id` int NOT NULL,
  `pc_nro_postulacion` varchar(40) NOT NULL,
  `pc_ganador` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'En curso'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `postulacion`
--

INSERT INTO `postulacion` (`pc_id`, `pc_ol_id`, `pc_fecha_postulacion`, `pc_eg_id`, `pc_nro_postulacion`, `pc_ganador`) VALUES
(1, 1, '2023-01-09', 9, '1', 'NO SELECCIONADO'),
(2, 1, '2023-01-23', 3, '2', 'SELECCIONADO'),
(3, 1, '2023-01-26', 2, '3', 'NO SELECCIONADO'),
(4, 1, '2023-02-25', 8, '4', 'NO SELECCIONADO'),
(5, 2, '2023-02-13', 5, '1', 'NO SELECCIONADO'),
(6, 2, '2023-02-14', 3, '2', 'SELECCIONADO'),
(7, 2, '2023-02-24', 2, '3', 'NO SELECCIONADO'),
(8, 2, '2023-03-23', 7, '4', 'NO SELECCIONADO'),
(9, 3, '2023-01-14', 9, '1', 'NO SELECCIONADO'),
(10, 3, '2023-01-18', 11, '2', 'NO SELECCIONADO'),
(11, 3, '2023-02-13', 15, '3', 'SELECCIONADO'),
(12, 3, '2023-03-28', 19, '4', 'NO SELECCIONADO'),
(13, 4, '2023-01-09', 18, '1', 'NO SELECCIONADO'),
(14, 4, '2023-02-14', 5, '2', 'SELECCIONADO'),
(15, 4, '2023-02-17', 6, '3', 'NO SELECCIONADO'),
(16, 4, '2023-02-24', 7, '4', 'NO SELECCIONADO'),
(17, 5, '2023-01-13', 5, '1', 'NO SELECCIONADO'),
(18, 5, '2023-02-09', 8, '2', 'NO SELECCIONADO'),
(19, 5, '2023-03-03', 10, '3', 'SELECCIONADO'),
(20, 5, '2023-03-16', 2, '4', 'NO SELECCIONADO'),
(21, 6, '2023-01-28', 1, '1', 'NO SELECCIONADO'),
(22, 6, '2023-02-16', 9, '2', 'SELECCIONADO'),
(23, 6, '2023-03-11', 8, '3', 'NO SELECCIONADO'),
(24, 6, '2023-03-26', 3, '4', 'NO SELECCIONADO'),
(25, 7, '2023-01-18', 7, '1', 'NO SELECCIONADO'),
(26, 7, '2023-01-29', 5, '2', 'NO SELECCIONADO'),
(27, 7, '2023-02-03', 8, '3', 'NO SELECCIONADO'),
(28, 7, '2023-03-20', 2, '4', 'SELECCIONADO'),
(29, 8, '2023-02-11', 1, '1', 'SELECCIONADO'),
(30, 8, '2023-02-18', 11, '2', 'NO SELECCIONADO'),
(31, 8, '2023-03-03', 17, '3', 'NO SELECCIONADO'),
(32, 8, '2023-03-30', 16, '4', 'NO SELECCIONADO'),
(33, 9, '2023-01-24', 19, '1', 'NO SELECCIONADO'),
(34, 9, '2023-02-02', 17, '2', 'NO SELECCIONADO'),
(35, 9, '2023-03-06', 15, '3', 'SELECCIONADO'),
(36, 9, '2023-03-12', 16, '4', 'NO SELECCIONADO'),
(37, 10, '2023-01-04', 18, '1', 'NO SELECCIONADO'),
(38, 10, '2023-02-06', 6, '2', 'NO SELECCIONADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usu_id` int NOT NULL,
  `usu_nombre_razon_social` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usu_dni_ruc` varchar(11) NOT NULL,
  `usu_correo` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usu_celular` varchar(9) NOT NULL,
  `usu_direccion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usu_rol` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1 egresado 2 empresa 3 docente  4 instituto 5 administrador',
  `usu_usuario` varchar(30) NOT NULL,
  `usu_password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usu_id`, `usu_nombre_razon_social`, `usu_dni_ruc`, `usu_correo`, `usu_celular`, `usu_direccion`, `usu_rol`, `usu_usuario`, `usu_password`) VALUES
(1, 'APAZA QUISPE JHOEL HAIRTON', '85748576', 'jhoel@gmail.com', '867586758', 'Jr. Alan', '1', 'jhoel', '1234'),
(2, 'CABANA SULCA CRISTIAN', '76847563', 'chistian@gmail.com', '867584958', 'Urb. Jazmín', '1', 'cristian', '1234'),
(3, 'CALIZAYA APAZA FRAN FRANKLIN', '51102868', 'fran@gmail.com', '941610227', 'Jr. Los punos', '1', 'fran', '1234'),
(4, 'CAMACHO JAMACHI NEIL JOHAN', '24858151', 'nel@gmail.com', '980204999', ' Jr. Jorge Juárez ', '1', 'neil', '1234'),
(5, 'CCORI CCOARITE GUVER LEON', '74656911', 'guver@gmail.com', '993303593', 'Jr. María Alejandra ', '1', 'guver', '1234'),
(6, 'CCOTO CRUZ HIRAM JEREMY', '88710788', 'hiram@gmail.com', '912652875', 'Jr. Alan Guerre', '1', 'hiram', '1234'),
(7, 'CHURA RODRIGUEZ MARCO STEFANO', '98934546', 'marco@gmail.com', '939440304', 'Jr. los angeles', '1', 'marco', '1234'),
(8, 'PRIETO QUISPE JUAN ENDERS', '67884533', 'juan@gmail.com', '940671455', 'Jr. María ', '1', 'juan', '1234'),
(9, 'QUILLA LOPEZ LUIS ALBERTO', '33627247', 'luis@gmail.com', '917443611', 'Jr. pepito', '1', 'luis', '1234'),
(10, 'SANCHEZ SARAVIA FABRIZIO YERALD ALFONSO', '50147332', 'febrizio@gmail.com', '995425782', 'Jr. Alan', '1', 'fabricio', '1234'),
(11, 'YANA PARI GLADYS ROSAURA', '12004427', 'gladys@gmail.com', '998142266', 'Jr. María ', '1', 'gladis', '1234'),
(12, 'YUCRA MAMANI DAVID ROBERT', '17259370', 'david@gmail.com', '924397809', ' Jr. Jorge Juárez', '1', 'david', '1234'),
(13, 'MAMANI FLORES DENILSON LEEKE', '11398880', 'denilson@gmail.com', '936699160', 'Jr. los pelos', '1', 'denilson', '1234'),
(14, 'MAMANI MAMANI ALESSANDRO PASTOR', '17504381', 'alessandro@gmail.com', '921673505', 'Jr. María Alejandra ', '1', 'alessandro', '1234'),
(15, 'MONTES MAMANI ANDRES LINO', '86214495', ' andres@gmail.com', '969960077', ' Jr. Jorge ', '1', 'andres', '1234'),
(16, 'NINA QUIRITA MICHEL ADRIANO', '43685214', 'michel@gmail.com', '960507835', 'Jr. los ageles', '1', 'michel', '1234'),
(17, 'PAREDES ARACAYO MAYKOL JUNIOR', '18165487', 'maykol@gmail.com', '947847786', 'Jr. los pinos', '1', 'maykol', '1234'),
(18, 'COAQUIRA JUSTO FRANCK ALBERTSON', '27157495', 'franck@gmail.com', '988006389', 'Jr. Alan ', '1', 'franck', '1234'),
(19, 'COAQUIRA PUMA ABIGAIL KANTU', '98401605', 'abigail@gmail.com', '920704166', 'Jr. María ', '1', 'abigail', '1234'),
(20, 'FERNANDEZ SANCHEZ JHERSON JEAN PIERO', '23424766', 'jean@gmail.com', '935524787', 'Jr. Jorge Juárez ', '1', 'jean', '1234'),
(21, 'LUQUE HUARACCALLO CHRISTIAN', '40220344', 'leque@gmail.com', '950739131', 'Jr. ramon', '3', 'leque', '1234'),
(22, 'APAZA TITO LEANDRO JESUS', '84393264', 'leandro@gmail.com', '910722612', 'Jr. tupac', '3', 'leandro', '1234'),
(23, 'AQUINO AMACHI KENNY', '18496211', 'kenny@gmail.com', '925769258', 'Jr. brasesquo', '3', 'kenny', '1234'),
(24, 'ARCE APAZA BISLEYN DE LA FLOR', '75654678', 'bisleyn@gmail.com', '962049106', 'Jr. que', '3', 'flor', '1234'),
(26, 'MICROSOFT', '23086256433', 'microsoft@hotmail.com', '975444887', 'Calleja Dorotea, 08 - Erie, And / 85556', '2', 'Microftra', 'jMy9lAJt0AKawpG'),
(27, 'GOOGLE', '34318916302', 'google@hotmail.com', '962339641', 'Poblado Carlota Ordóñez 83 - Port Orange, Ext / 36497', '2', 'gulugulu', 'vDlwj5rBSxGrxnE'),
(28, 'APPLE', '35382830996', 'apple@hotmail.com', '900889594', 'Vía Pública Mariano 05 - North Little Rock, Cbr / 92802', '2', 'pear', '35eeOzjgvxO7w1K'),
(29, 'DELL TECHNOLOGIES', '66320858492', 'dell@hotmail.com', '956257968', 'Puente Inés Alfaro 6 - San Jacinto, Ast / 61503  ', '2', 'dall', 'VlsLpYKzV3S6Nez'),
(30, 'CISCO', '98169301203', 'cisco@hotmail.com', '908636672', 'Cuesta María 4 - Fishers, Cat / 08289', '2', 'cisco', 'ZJqt3PMIiuRXuVy'),
(31, 'Jose Samuel Turpo Cauna', '73761424', 'dasarupazfesandra@gmail.com', '910835680', 'a', '5', 'Samuel910', '123456'),
(32, 'UPeU', '52147896310', 'upeu_juliaca@upeu.edu.pe', '987321456', 'Villa Chullulquiani-Juliaca', '4', 'upeu_edu', 'adventistas'),
(33, 'UNAP', '78965423100', 'unap_puno@unap.edu.pe', '963852741', 'Av Floral 1153', '4', 'unap_pe', 'catolicos'),
(71, 'asd', 'asdasd', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '3', 'asdasd', 'asdasd'),
(72, 'asd', 'asdasd', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '3', 'asdasd', 'asdas'),
(73, 'asdasd', 'asdasd', 'dasarupazfesandra@gmail.com', 'asdas', 'asdasd', '3', 'asdasd', 'asdasd'),
(74, 'asdasd', 'asdasd', 'dasarupazfesandra@gmail.com', 'asdas', 'asdasd', '3', 'asdasd', 'asdasd'),
(75, 'asdasd', 'asdasd', 'dasarupazfesandra@gmail.com', 'asdas', 'asdasd', '3', 'asdasd', 'asdasd'),
(76, 'asdasd', 'asdasd', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '3', 'asdasd', 'asdasd'),
(77, 'asdasd', 'asdasd', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '3', 'asdasd', 'asda'),
(78, 'asdasd', 'asdasd', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '3', 'asdasd', 'asda'),
(79, 'asdasd', 'asdasd', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '3', 'asdasd', 'asda'),
(80, 'asdasd', 'asdasd', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '3', 'asdasd', 'asda'),
(81, 'asdasd', 'asdas', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '1', 'asdasd', 'asdasd'),
(82, 'asdasdsad', 'asdas', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '2', 'asdasdmamam', 'mamam'),
(83, 'asdasdsad', 'asdas', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '4', 'mamam', 'mama'),
(84, 'asdasdsad', 'asdas', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '1', 'maria', 'asdasd'),
(85, 'prueba 1', 'asdas', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '1', 'prueba 1', 'prueba 1'),
(86, 'prueba 2', 'asdas', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '2', 'prueba 2', 'prueba 2'),
(87, 'prueba 3', 'asdas', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '3', 'prueba 3', 'prueba 3'),
(88, 'prueba 4', 'asdas', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '4', 'prueba 4', 'prueba 4'),
(89, 'prueba 4', 'asdas', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '4', 'prueba 4', 'prueba 4'),
(90, 'prueba 5', 'asdas', 'dasarupazfesandra@gmail.com', 'asdasd', 'asdasd', '4', 'prueba 5', 'prueba 5'),
(91, 'GUTIERREZ ANCO YESENIA ALEJANDRA la poderosa', '22123', 'dasarupazfesandra@gmail.com', '123123', 'asdad', '4', 'asdasdasda', 'asd'),
(92, 'Josefh de Nayder', 'sadad', 'dasarupazfesandra@gmail.com', 'asdas', 'asdasd', '1', 'asdasd', 'asdasd'),
(93, 'Josefh de Nayder', 'sadad', 'JosefhdeNayder@gmail.com', 'asdas', 'asdasd', '1', 'Josefh de Nayder', 'Josefh de Nayder'),
(94, 'asdasd', '111', '1111@gaqw.com', '111', '1111', '1', '1111', '32131');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `usuario_administrador_fk` (`admin_usu_id`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`dc_id`),
  ADD KEY `usuario_docente_fk` (`dc_usu_id`);

--
-- Indices de la tabla `egresado`
--
ALTER TABLE `egresado`
  ADD PRIMARY KEY (`eg_id`),
  ADD KEY `usuario_egresado_fk` (`eg_usu_id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`em_id`),
  ADD KEY `usuario_empresas_fk` (`em_usu_id`);

--
-- Indices de la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD PRIMARY KEY (`ins_id`),
  ADD KEY `usuario_institucion_fk` (`ins_usu_id`);

--
-- Indices de la tabla `monitoreo`
--
ALTER TABLE `monitoreo`
  ADD PRIMARY KEY (`moni_id`),
  ADD KEY `docente_monitoreo_fk` (`moni_dc_id`);

--
-- Indices de la tabla `oferta_laboral`
--
ALTER TABLE `oferta_laboral`
  ADD PRIMARY KEY (`ol_id`),
  ADD KEY `empresas_oferta_laboral_fk` (`ol_em_id`);

--
-- Indices de la tabla `postulacion`
--
ALTER TABLE `postulacion`
  ADD PRIMARY KEY (`pc_id`),
  ADD KEY `oferta_laboral_postulacion_fk` (`pc_ol_id`),
  ADD KEY `egresado_postulacion_fk` (`pc_eg_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `admin_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `dc_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `egresado`
--
ALTER TABLE `egresado`
  MODIFY `eg_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `em_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `institucion`
--
ALTER TABLE `institucion`
  MODIFY `ins_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `monitoreo`
--
ALTER TABLE `monitoreo`
  MODIFY `moni_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `oferta_laboral`
--
ALTER TABLE `oferta_laboral`
  MODIFY `ol_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `postulacion`
--
ALTER TABLE `postulacion`
  MODIFY `pc_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usu_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`

--
USE bolsa_laboral1;

ALTER TABLE `administrador`
  ADD CONSTRAINT `usuario_administrador_fk` FOREIGN KEY (`admin_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE CASCADE; 

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `usuario_docente_fk` FOREIGN KEY (`dc_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `egresado`
--
ALTER TABLE `egresado`
  ADD CONSTRAINT `usuario_egresado_fk` FOREIGN KEY (`eg_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `usuario_empresas_fk` FOREIGN KEY (`em_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `institucion`
--
ALTER TABLE `institucion`
  ADD CONSTRAINT `usuario_institucion_fk` FOREIGN KEY (`ins_usu_id`) REFERENCES `usuario` (`usu_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `monitoreo`
--
ALTER TABLE `monitoreo`
  ADD CONSTRAINT `docente_monitoreo_fk` FOREIGN KEY (`moni_dc_id`) REFERENCES `docente` (`dc_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `oferta_laboral`
--
ALTER TABLE `oferta_laboral`
  ADD CONSTRAINT `empresas_oferta_laboral_fk` FOREIGN KEY (`ol_em_id`) REFERENCES `empresas` (`em_id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `postulacion`
--
ALTER TABLE `postulacion`
  ADD CONSTRAINT `egresado_postulacion_fk` FOREIGN KEY (`pc_eg_id`) REFERENCES `egresado` (`eg_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `oferta_laboral_postulacion_fk` FOREIGN KEY (`pc_ol_id`) REFERENCES `oferta_laboral` (`ol_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

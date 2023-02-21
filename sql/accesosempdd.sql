-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-02-2023 a las 00:01:04
-- Versión del servidor: 10.3.37-MariaDB-0ubuntu0.20.04.1
-- Versión de PHP: 7.4.3-4ubuntu2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `accesosempdd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id_area` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id_area`, `nombre`, `telefono`, `mail`, `fecha_alta`, `estado`) VALUES
(1, 'Vacío', 0, 'Vacío', '2022-08-19 18:20:44', 0),
(2, 'Sistemas', 666, 'sistemas@espaciomemoria.ar', '2022-08-19 18:20:44', 0),
(3, 'Logística', 101, 'logistica@espaciomemoria.ar', '2022-08-19 18:20:44', 0),
(4, 'Protección', 102, 'proteccions@espaciomemoria.ar', '2022-08-19 18:20:44', 0),
(5, 'Relaciones Laborales', 103, 'rlaboraless@espaciomemoria.ar', '2022-08-19 18:20:44', 0),
(6, 'Proyecto', 103, 'proyecto@espaciomemoria.ar', '2022-08-19 18:20:44', 0),
(7, 'Administración', 103, 'administracion@espaciomemoria.ar', '2022-08-19 18:20:44', 0),
(8, 'Compras', 103, 'compras@espaciomemoria.ar', '2022-08-19 18:20:44', 0),
(9, 'Patrimonio', 103, 'patrimonio@espaciomemoria.ar', '2022-08-19 18:20:44', 0),
(10, 'Institucionales', 103, 'institucionales@espaciomemoria.ar', '2022-08-19 18:20:44', 0),
(11, 'Tesorería', 103, 'tesoreria@espaciomemoria.ar', '2022-08-19 18:20:44', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `legajo` int(5) NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `dni` int(11) NOT NULL DEFAULT 0,
  `mail` varchar(30) DEFAULT NULL,
  `id_area` int(11) NOT NULL DEFAULT 1,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `legajo`, `nombres`, `apellido`, `dni`, `mail`, `id_area`, `fecha_alta`, `estado`) VALUES
(1, 1234, 'Agustín', 'Garrido', 39207365, 'agarrido@espaciomemoria.ar', 2, '2023-02-04 00:17:44', 0),
(2, 1245, 'Julian', 'Bueno', 0, 'jbueno@espaciomemoria.ar', 1, '2023-02-04 00:18:09', 0),
(3, 1254, 'Gustavo', 'Ibara', 0, 'gibarra@espaciomemoria.ar', 1, '2023-02-04 00:18:35', 0),
(4, 1117, 'Marco', 'Di Mauro', 0, 'mdimauro@espaciomemoria.ar', 1, '2023-02-04 00:19:03', 0),
(5, 1011, 'Nahuel', 'Baglietto', 22551446, 'nbaglietto@espaciomemoria.ar', 1, '2023-02-04 00:20:50', 0),
(6, 1005, 'Juan José', 'Suasnavar', 18622112, 'jsausnavar@espaciomemoria.ar', 1, '2023-02-04 00:19:47', 0),
(22, 1103, 'Judit ', 'Baglietto', 0, 'jbaglietto@espaciomemoria.ar', 10, '2023-02-04 00:21:55', 0),
(23, 1227, 'Agustina', 'Baglietto', 0, 'abaglietto@espaciomemoria.ar', 4, '2023-02-04 00:22:40', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrobiometrico`
--

CREATE TABLE `registrobiometrico` (
  `Id` int(11) NOT NULL,
  `fechahoy` date NOT NULL,
  `legajo` int(5) NOT NULL,
  `horaentrada` time(6) NOT NULL,
  `salidaprogramada` varchar(20) DEFAULT NULL,
  `horasalida` time(6) DEFAULT NULL,
  `horastrabajadas` time(6) DEFAULT NULL,
  `acompensar` char(25) DEFAULT NULL,
  `afavor` time(6) DEFAULT NULL,
  `diastrabajadossemana` int(10) DEFAULT NULL,
  `diastrabajadosmes` int(10) DEFAULT NULL,
  `horassemanales` int(11) DEFAULT NULL,
  `horasmensuales` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registrobiometrico`
--

INSERT INTO `registrobiometrico` (`Id`, `fechahoy`, `legajo`, `horaentrada`, `salidaprogramada`, `horasalida`, `horastrabajadas`, `acompensar`, `afavor`, `diastrabajadossemana`, `diastrabajadosmes`, `horassemanales`, `horasmensuales`) VALUES
(654, '2023-02-16', 1011, '10:20:00.000000', '17:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(655, '2023-02-16', 1005, '08:02:00.000000', '15:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(656, '2023-02-16', 1234, '06:03:00.000000', '13:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(657, '2023-02-16', 1254, '05:04:00.000000', '12:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(658, '2023-02-16', 1117, '12:05:00.000000', '19:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(659, '2023-02-16', 1245, '16:06:00.000000', '23:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(660, '2023-02-16', 1220, '09:07:00.000000', '16:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(661, '2023-02-18', 1011, '10:20:00.000000', NULL, '15:00:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(662, '2023-02-18', 1005, '08:02:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(663, '2023-02-18', 1234, '06:03:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(664, '2023-02-18', 1254, '05:04:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(665, '2023-02-18', 1117, '12:05:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(666, '2023-02-18', 1245, '16:06:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(667, '2023-02-18', 1220, '09:07:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(668, '2023-02-19', 1011, '10:20:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(669, '2023-02-19', 1005, '08:02:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(670, '2023-02-19', 1234, '06:03:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(671, '2023-02-19', 1254, '05:04:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(672, '2023-02-19', 1117, '12:05:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(673, '2023-02-19', 1245, '16:06:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(674, '2023-02-19', 1220, '09:07:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `Id` int(11) NOT NULL,
  `fechahoy` date NOT NULL,
  `esdia` varchar(20) DEFAULT NULL,
  `esmes` varchar(20) DEFAULT NULL,
  `esano` varchar(20) DEFAULT NULL,
  `legajo` int(5) NOT NULL,
  `horaentrada` time(6) NOT NULL,
  `salidaprogramada` time(6) DEFAULT NULL,
  `horasalida` time(6) DEFAULT NULL,
  `horastrabajadas` time(6) DEFAULT NULL,
  `acompensar` char(25) DEFAULT NULL,
  `saldoHoras` time(6) DEFAULT NULL,
  `diastrabajadossemana` int(10) DEFAULT NULL,
  `diastrabajadosmes` int(10) DEFAULT NULL,
  `horassemanales` int(11) DEFAULT NULL,
  `horasmensuales` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registros`
--

INSERT INTO `registros` (`Id`, `fechahoy`, `esdia`, `esmes`, `esano`, `legajo`, `horaentrada`, `salidaprogramada`, `horasalida`, `horastrabajadas`, `acompensar`, `saldoHoras`, `diastrabajadossemana`, `diastrabajadosmes`, `horassemanales`, `horasmensuales`) VALUES
(67, '2023-01-19', 'Domingo', 'Febrero', '2023', 1011, '10:20:00.000000', '17:20:00.000000', '15:00:00.000000', '04:40:00.000000', NULL, '-02:20:00.000000', NULL, NULL, NULL, NULL),
(68, '2023-02-19', 'Domingo', 'Febrero', '2023', 1005, '08:02:00.000000', '15:02:00.000000', '15:01:00.000000', '06:59:00.000000', NULL, '-00:01:00.000000', NULL, NULL, NULL, NULL),
(69, '2023-02-19', 'Domingo', 'Febrero', '2023', 1234, '06:03:00.000000', '13:03:00.000000', '15:50:00.000000', '09:47:00.000000', NULL, '02:47:00.000000', NULL, NULL, NULL, NULL),
(70, '2023-02-19', 'Domingo', 'Febrero', '2023', 1254, '05:04:00.000000', '12:04:00.000000', '15:03:00.000000', '09:59:00.000000', NULL, '02:59:00.000000', NULL, NULL, NULL, NULL),
(71, '2023-02-19', 'Domingo', 'Febrero', '2023', 1117, '12:05:00.000000', '19:05:00.000000', '15:04:00.000000', '02:59:00.000000', NULL, '-04:01:00.000000', NULL, NULL, NULL, NULL),
(72, '2023-02-19', 'Domingo', 'Febrero', '2023', 1245, '16:06:00.000000', '23:06:00.000000', '15:05:00.000000', '-01:01:00.000000', NULL, '-08:01:00.000000', NULL, NULL, NULL, NULL),
(73, '2023-02-19', 'Domingo', 'Febrero', '2023', 1220, '09:07:00.000000', '16:07:00.000000', '15:06:00.000000', '05:59:00.000000', NULL, '-01:01:00.000000', NULL, NULL, NULL, NULL),
(74, '2023-01-18', NULL, NULL, NULL, 1011, '10:20:00.000000', '17:20:00.000000', '15:00:00.000000', NULL, NULL, '-02:20:00.000000', NULL, NULL, NULL, NULL),
(75, '2023-02-18', NULL, NULL, NULL, 1005, '08:02:00.000000', '15:02:00.000000', '15:01:00.000000', NULL, NULL, '-00:01:00.000000', NULL, NULL, NULL, NULL),
(76, '2023-02-18', NULL, NULL, NULL, 1234, '06:03:00.000000', '13:03:00.000000', '15:50:00.000000', NULL, NULL, '02:47:00.000000', NULL, NULL, NULL, NULL),
(77, '2023-02-18', NULL, NULL, NULL, 1254, '05:04:00.000000', '12:04:00.000000', '15:03:00.000000', NULL, NULL, '02:59:00.000000', NULL, NULL, NULL, NULL),
(78, '2023-02-18', NULL, NULL, NULL, 1117, '12:05:00.000000', '19:05:00.000000', '15:04:00.000000', NULL, NULL, '-04:01:00.000000', NULL, NULL, NULL, NULL),
(79, '2023-02-18', NULL, NULL, NULL, 1245, '16:06:00.000000', '23:06:00.000000', '15:05:00.000000', NULL, NULL, '-08:01:00.000000', NULL, NULL, NULL, NULL),
(80, '2023-02-18', NULL, NULL, NULL, 1220, '09:07:00.000000', '16:07:00.000000', '15:06:00.000000', NULL, NULL, '-01:01:00.000000', NULL, NULL, NULL, NULL),
(88, '2023-01-17', NULL, NULL, NULL, 1011, '10:20:00.000000', '17:20:00.000000', '15:00:00.000000', NULL, NULL, '-02:20:00.000000', NULL, NULL, NULL, NULL),
(89, '2023-02-17', NULL, NULL, NULL, 1005, '08:02:00.000000', '15:02:00.000000', '15:01:00.000000', NULL, NULL, '-00:01:00.000000', NULL, NULL, NULL, NULL),
(90, '2023-02-17', NULL, NULL, NULL, 1234, '06:03:00.000000', '13:03:00.000000', '15:50:00.000000', NULL, NULL, '02:47:00.000000', NULL, NULL, NULL, NULL),
(91, '2023-02-17', NULL, NULL, NULL, 1254, '05:04:00.000000', '12:04:00.000000', '15:03:00.000000', NULL, NULL, '02:59:00.000000', NULL, NULL, NULL, NULL),
(92, '2023-02-17', NULL, NULL, NULL, 1117, '12:05:00.000000', '19:05:00.000000', '15:04:00.000000', NULL, NULL, '-04:01:00.000000', NULL, NULL, NULL, NULL),
(93, '2023-02-17', NULL, NULL, NULL, 1245, '16:06:00.000000', '23:06:00.000000', '15:05:00.000000', NULL, NULL, '-08:01:00.000000', NULL, NULL, NULL, NULL),
(94, '2023-02-17', NULL, NULL, NULL, 1220, '09:07:00.000000', '16:07:00.000000', '15:06:00.000000', NULL, NULL, '-01:01:00.000000', NULL, NULL, NULL, NULL),
(95, '2023-01-16', NULL, NULL, NULL, 1011, '10:20:00.000000', '17:20:00.000000', '15:00:00.000000', NULL, NULL, '-02:20:00.000000', NULL, NULL, NULL, NULL),
(96, '2023-02-16', NULL, NULL, NULL, 1005, '08:02:00.000000', '15:02:00.000000', '15:01:00.000000', NULL, NULL, '-00:01:00.000000', NULL, NULL, NULL, NULL),
(97, '2023-02-16', NULL, NULL, NULL, 1234, '06:03:00.000000', '13:03:00.000000', '15:50:00.000000', NULL, NULL, '02:47:00.000000', NULL, NULL, NULL, NULL),
(98, '2023-02-16', NULL, NULL, NULL, 1254, '05:04:00.000000', '12:04:00.000000', '15:03:00.000000', NULL, NULL, '02:59:00.000000', NULL, NULL, NULL, NULL),
(99, '2023-02-16', NULL, NULL, NULL, 1117, '12:05:00.000000', '19:05:00.000000', '15:04:00.000000', NULL, NULL, '-04:01:00.000000', NULL, NULL, NULL, NULL),
(100, '2023-02-16', NULL, NULL, NULL, 1245, '16:06:00.000000', '23:06:00.000000', '15:05:00.000000', NULL, NULL, '-08:01:00.000000', NULL, NULL, NULL, NULL),
(101, '2023-02-16', NULL, NULL, NULL, 1220, '09:07:00.000000', '16:07:00.000000', '15:06:00.000000', NULL, NULL, '-01:01:00.000000', NULL, NULL, NULL, NULL),
(102, '2023-01-15', NULL, NULL, NULL, 1011, '10:20:00.000000', '17:20:00.000000', '15:00:00.000000', NULL, NULL, '-02:20:00.000000', NULL, NULL, NULL, NULL),
(103, '2023-02-15', NULL, NULL, NULL, 1005, '08:02:00.000000', '15:02:00.000000', '15:01:00.000000', NULL, NULL, '-00:01:00.000000', NULL, NULL, NULL, NULL),
(104, '2023-02-15', NULL, NULL, NULL, 1234, '06:03:00.000000', '13:03:00.000000', '15:50:00.000000', NULL, NULL, '02:47:00.000000', NULL, NULL, NULL, NULL),
(105, '2023-02-15', NULL, NULL, NULL, 1254, '05:04:00.000000', '12:04:00.000000', '15:03:00.000000', NULL, NULL, '02:59:00.000000', NULL, NULL, NULL, NULL),
(106, '2023-02-15', NULL, NULL, NULL, 1117, '12:05:00.000000', '19:05:00.000000', '15:04:00.000000', NULL, NULL, '-04:01:00.000000', NULL, NULL, NULL, NULL),
(107, '2023-02-15', NULL, NULL, NULL, 1245, '16:06:00.000000', '23:06:00.000000', '15:05:00.000000', NULL, NULL, '-08:01:00.000000', NULL, NULL, NULL, NULL),
(108, '2023-02-15', NULL, NULL, NULL, 1220, '09:07:00.000000', '16:07:00.000000', '15:06:00.000000', NULL, NULL, '-01:01:00.000000', NULL, NULL, NULL, NULL),
(109, '2023-02-19', 'Domingo', 'Febrero', '2023', 1011, '10:00:00.000000', '17:00:00.000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temperatura`
--

CREATE TABLE `temperatura` (
  `temp` int(11) NOT NULL,
  `hum` int(11) NOT NULL,
  `hora` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `temperatura`
--

INSERT INTO `temperatura` (`temp`, `hum`, `hora`) VALUES
(24, 55, '2022-12-02 11:26:07'),
(24, 56, '2022-12-02 11:27:07'),
(28, 65, '2022-12-04 07:09:54'),
(28, 65, '2022-12-04 07:14:54'),
(28, 65, '2022-12-04 07:19:54'),
(28, 65, '2022-12-04 07:24:54'),
(22, 44, '2023-02-03 23:44:49'),
(22, 44, '2023-02-03 23:50:09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD KEY `empleados_areas` (`id_area`);

--
-- Indices de la tabla `registrobiometrico`
--
ALTER TABLE `registrobiometrico`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `solouno` (`fechahoy`,`legajo`,`horaentrada`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `solouno` (`fechahoy`,`legajo`,`horaentrada`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `registrobiometrico`
--
ALTER TABLE `registrobiometrico`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=675;

--
-- AUTO_INCREMENT de la tabla `registros`
--
ALTER TABLE `registros`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_areas` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

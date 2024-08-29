-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-06-2024 a las 04:07:46
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
-- Base de datos: `centro_sams`
--
CREATE DATABASE IF NOT EXISTS `centro_sams` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `centro_sams`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administracion_medicamentos`
--

CREATE TABLE `administracion_medicamentos` (
  `id_administracion` int(11) NOT NULL,
  `id_medicamento` int(11) NOT NULL,
  `id_frecuencia` int(11) NOT NULL,
  `id_duracion` int(11) NOT NULL,
  `id_dosis` int(11) NOT NULL,
  `id_cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cantidad`
--

CREATE TABLE `cantidad` (
  `id_cantidad` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cantidad`
--

INSERT INTO `cantidad` (`id_cantidad`, `descripcion`) VALUES
(1, '1 caja'),
(2, '1 blister'),
(3, '1 inhalador'),
(4, '2 inhalador'),
(5, '1 frasco'),
(6, '5 ampollas'),
(7, '3 ampollas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`) VALUES
(1, 'Analgesico,antiflamatorio'),
(2, 'Antibiotico'),
(3, 'Inhibidor'),
(4, 'Antihistaminico'),
(5, 'Antidiabetico'),
(6, 'Estatina'),
(7, 'Antidepresivo'),
(8, 'Broncodilatador'),
(9, 'Antifebril'),
(10, 'Antidiarreico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concentracion`
--

CREATE TABLE `concentracion` (
  `id_concentracion` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `concentracion`
--

INSERT INTO `concentracion` (`id_concentracion`, `descripcion`) VALUES
(1, '400 mg'),
(2, '500 mg'),
(3, '20 mg'),
(4, '1000ml'),
(5, '5 mg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dosis`
--

CREATE TABLE `dosis` (
  `id_dosis` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dosis`
--

INSERT INTO `dosis` (`id_dosis`, `descripcion`) VALUES
(1, '1 tableta'),
(2, '2 tabletas'),
(3, '1 capsula'),
(4, '2 capsulas'),
(5, '1 dosis'),
(6, '2 dosis'),
(7, '2,5 ml'),
(8, '5 ml'),
(9, '10 ml'),
(10, '1 pastilla efervesente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `duracion`
--

CREATE TABLE `duracion` (
  `id_duracion` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `duracion`
--

INSERT INTO `duracion` (`id_duracion`, `descripcion`) VALUES
(1, '5 dias'),
(2, '7 dias'),
(3, '10 dias'),
(4, '3 dias'),
(5, '30 dias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `descripcion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `descripcion`) VALUES
(1, 'pediatra'),
(2, 'medico generalista'),
(3, 'cirujano plastico'),
(4, 'traumatologo'),
(5, 'ginecologo'),
(6, 'gastroenterologo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE `examen` (
  `id_examen` int(11) NOT NULL,
  `examen` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`id_examen`, `examen`) VALUES
(1, 'radiografia'),
(2, 'resonancia'),
(3, 'ecografia'),
(4, 'tomografia'),
(5, 'endoscopia'),
(6, 'mamografia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familia`
--

CREATE TABLE `familia` (
  `id_familia` int(11) NOT NULL,
  `familia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `familia`
--

INSERT INTO `familia` (`id_familia`, `familia`) VALUES
(1, 'Analgesico'),
(2, 'Penincilina'),
(3, 'Antihistaminico no sedante'),
(4, 'Fluoroquinolona'),
(5, 'Agonista beta-2 adrenérgico'),
(6, 'Cumarínicos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_farmacologica`
--

CREATE TABLE `forma_farmacologica` (
  `id_formaFarmacologica` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `forma_farmacologica`
--

INSERT INTO `forma_farmacologica` (`id_formaFarmacologica`, `descripcion`) VALUES
(1, 'Tableta'),
(2, 'Inhalador'),
(3, 'Capsulas blandas'),
(4, 'Inyectable'),
(5, 'Jarabe'),
(6, 'Solucion solida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frecuencia`
--

CREATE TABLE `frecuencia` (
  `id_frecuencia` int(11) NOT NULL,
  `descripcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `frecuencia`
--

INSERT INTO `frecuencia` (`id_frecuencia`, `descripcion`) VALUES
(1, 8),
(2, 6),
(3, 4),
(4, 12),
(5, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lado`
--

CREATE TABLE `lado` (
  `id_lado` int(11) NOT NULL,
  `lado` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lado`
--

INSERT INTO `lado` (`id_lado`, `lado`) VALUES
(1, 'derecho'),
(2, 'izquierdo'),
(3, 'frente'),
(4, 'dorso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `id_medicamento` int(11) NOT NULL,
  `nombre_generico` varchar(200) NOT NULL,
  `nombre_comercial` varchar(200) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_familia` int(11) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`id_medicamento`, `nombre_generico`, `nombre_comercial`, `id_categoria`, `id_familia`, `activo`) VALUES
(7, 'Ibuprofeno', 'Febratil', 1, 1, 1),
(8, 'paracetamol', 'paracetamol', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento_concentracion`
--

CREATE TABLE `medicamento_concentracion` (
  `id_medicamento` int(11) NOT NULL,
  `id_concentracion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento_forma`
--

CREATE TABLE `medicamento_forma` (
  `id_medicamento` int(11) NOT NULL,
  `id_formaFarmacologica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento_presentacion`
--

CREATE TABLE `medicamento_presentacion` (
  `id_medicamento` int(11) NOT NULL,
  `id_presentacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obra_social`
--

CREATE TABLE `obra_social` (
  `id_obra_social` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `id_plan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `obra_social`
--

INSERT INTO `obra_social` (`id_obra_social`, `descripcion`, `id_plan`) VALUES
(1, 'Dosep', 1),
(2, 'Pami', 9),
(3, 'Dosep', 4),
(4, 'Femesa', 6),
(5, 'Dosep', 9),
(6, 'Femesa', 7),
(7, 'Osde', 8),
(8, 'Femesa', 5),
(9, 'Osde', 3),
(10, 'Femesa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `documento` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(30) NOT NULL,
  `id_plan` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `apellido`, `nombre`, `documento`, `fecha_nacimiento`, `sexo`, `id_plan`, `estado`) VALUES
(12, 'Akerman', 'Melanie', 45000345, '2004-02-28', 'Femenino', 8, 1),
(13, 'Gonzalez', 'Mariela', 33000745, '1985-05-13', 'Femenino', 4, 1),
(14, 'Velazquez', 'Kevin', 27317618, '1980-12-24', 'Masculino', 7, 0),
(15, 'Juarez', 'Pedrito', 9834209, '1978-12-10', 'Masculino', 2, 0),
(16, 'Gattas', 'Oriana', 45967023, '2015-01-31', 'Femenino', 1, 0),
(18, 'Luna', 'Santiago', 31812921, '1999-01-08', 'Masculino', 8, 1),
(19, 'Paz', 'Maria Luz', 12738494, '1990-12-25', 'Femenino', 5, 1),
(20, 'Ramallo', 'Cinthia', 26309111, '1997-01-05', 'Femenino', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `id_plan` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`id_plan`, `descripcion`) VALUES
(1, 'Familiar'),
(2, 'Plus'),
(3, 'Preferencial'),
(4, 'Mujer'),
(5, 'Single'),
(6, 'Black'),
(7, 'Platinum'),
(8, 'Estudiantil'),
(9, 'Jubilados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prescripcion`
--

CREATE TABLE `prescripcion` (
  `id_prescripcion` int(20) NOT NULL,
  `id_profesional` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `diagnostico` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prescripcion_medicamento`
--

CREATE TABLE `prescripcion_medicamento` (
  `id_prescripcion` int(30) NOT NULL,
  `id_medicamento` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `id_presentacion` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `presentacion`
--

INSERT INTO `presentacion` (`id_presentacion`, `descripcion`) VALUES
(1, 'frasco 12 capsulas'),
(2, 'caja por 8 comprimidos'),
(3, 'blister 10 comprimidos'),
(4, 'caja 14 capsulas'),
(5, 'inhalador 200 dosis'),
(6, 'inhalador 100 dosis');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestacion`
--

CREATE TABLE `prestacion` (
  `id_prestacion` int(30) NOT NULL,
  `id_prestacion_examen` int(11) NOT NULL,
  `id_prestacion_lado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestacion_examen`
--

CREATE TABLE `prestacion_examen` (
  `id_prestacion_examen` int(11) NOT NULL,
  `id_examen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestacion_lado`
--

CREATE TABLE `prestacion_lado` (
  `id_prestacion_lado` int(11) NOT NULL,
  `id_lado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestacion_prescripcion`
--

CREATE TABLE `prestacion_prescripcion` (
  `id_prescripcion` int(30) NOT NULL,
  `id_prestacion` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion`
--

CREATE TABLE `profesion` (
  `id_profesion` int(11) NOT NULL,
  `descripcion` varchar(180) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesion`
--

INSERT INTO `profesion` (`id_profesion`, `descripcion`) VALUES
(1, 'Medico'),
(2, 'Cirujano'),
(3, 'Odontologo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesional`
--

CREATE TABLE `profesional` (
  `id_profesional` int(11) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `documento` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `id_profesional_profesion` int(11) NOT NULL,
  `id_profesional_especialidad` int(11) NOT NULL,
  `id_refeps` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesional`
--

INSERT INTO `profesional` (`id_profesional`, `apellido`, `nombre`, `documento`, `matricula`, `domicilio`, `id_profesional_profesion`, `id_profesional_especialidad`, `id_refeps`, `estado`) VALUES
(7, 'Akerman', 'Roxana', 20345873, 5501, 'juan de Dios Garro 25', 1, 2, 100, 0),
(8, 'Sandival', 'Ricardo', 1890072, 2980, 'San Martin 900', 1, 1, 101, 1),
(9, 'Moreno', 'Alejandro', 27145612, 4580, 'centenario 1230', 3, 1, 102, 1),
(10, 'Gabutti', 'Franco', 33829435, 1300, 'La Florida 25', 2, 3, 103, 1),
(11, 'Velez', 'Julieta', 29345023, 7899, 'Rivadavia 10', 2, 4, 104, 1),
(12, 'Laferte', 'Martin', 29588157, 4569, 'Los Sauces 239', 1, 6, 105, 1),
(13, 'Mansur', 'Jacinto', 10283456, 9923, 'Chacabuco 1500', 1, 2, 106, 1),
(14, 'whover', 'Jacinto', 10293795, 4311, 'Chile 23', 3, 1, 107, 1),
(15, 'pedrozoo', 'jaime', 8983233, 5900, 'chacabuco 1800', 2, 4, 108, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesional_especialidad`
--

CREATE TABLE `profesional_especialidad` (
  `id_profesionalEspecialidad` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `profesional_especialidad`
--

INSERT INTO `profesional_especialidad` (`id_profesionalEspecialidad`, `id_especialidad`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesional_profesion`
--

CREATE TABLE `profesional_profesion` (
  `id_profesionalProfesional` int(11) NOT NULL,
  `id_profesional` int(11) NOT NULL,
  `id_profesion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `funcion` varchar(30) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `funcion`, `usuario`, `password`) VALUES
(1, 'Marilena', 'Escudero', 'administrador', 'admin24', '$2b$10$QQJw/G7fAZHNT/3Flb9k9e1FWHR0MbaiTe2Fs43O4LBB8syaKmg6e'),
(2, 'Roxana', 'Akerman', 'profesional', 'roxana24', '$2b$10$sDbI1.q0m4z2B5hTve/Oaun.oKCyoBBW8s1VA20o/RXXhCdrd0XRe'),
(3, 'Juan', 'Bordino', 'profesional', 'bordino24', '$2b$10$rYma3g7Go2bS8Jv1JkR/ruWteXsL3ooYEi1NxTeFxEqcM/aTdyhr2'),
(4, 'Rosa', 'Blas', 'profesional', 'rosita24', '$2b$10$BhnS0Q2rae1/UuhUOWaWuO78gzm7KTLmjfjeYleTGacK.JpZuCPoC'),
(5, 'Camilo', 'Sanchez', 'administrador', 'camilo23', '$2b$10$uh.SW6slfA15p9bAnfGhUeIivD2VqbkrTpTyIWnkh8WCJFxaFmJNG'),
(7, 'Sofia', 'Camargo', 'profesional', 'sofi85', '$2b$10$Q/DmjI//gJwedLNsPOoS3Ons/tunY/NCJ.JVe2BVGyDPjsbbtJchW'),
(8, 'Laura', 'Funes', 'profesional', 'laurita24', '$2b$10$EjveCW4xeA3gk95Hivx/yO2W8PPdgfU0PuI6iDLdX/1sHQt1IVrva'),
(9, 'Michell', 'Thum', 'profesional', 'michell24', '$2b$10$m/EJVfTGQv4tr4q8Noxz3.LEYiu2FnYYGasq.FlHkuppitd/UmlLy'),
(10, 'Jacinto', 'Mansur', 'profesional', 'jacinto2024', '$2b$10$ZbsLjAHbwEOTVlXoygSpautyKrc7u5aZmprUBLB2tmCYRLmhHx79W'),
(11, 'pepito', 'picahu', 'profesional', 'pepito20', '$2b$10$Dill8aWf50NGEF0C/cyHvu1ANyMDZ9gZKlw5i2aSZhX5AImd1wgYq'),
(12, 'lila', 'nuñoz', 'administrador', 'lilita23', '$2b$10$YkgGq52gV0C/CW4vA7./XO8hXeIiSeG1x5G/gYKwHWrpjEd2cUSAa'),
(13, 'jaimito', 'pedrozo', 'administrador', 'jaimito23', '$2b$10$mIW/f6qfucwj/.13uJM16.DVoaZuJfFBhI09Pq92ctB94YT.yiDOG');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administracion_medicamentos`
--
ALTER TABLE `administracion_medicamentos`
  ADD PRIMARY KEY (`id_administracion`),
  ADD KEY `id_cantidad` (`id_cantidad`),
  ADD KEY `id_dosis` (`id_dosis`),
  ADD KEY `id_duracion` (`id_duracion`),
  ADD KEY `id_frecuencia` (`id_frecuencia`),
  ADD KEY `id_medicamento` (`id_medicamento`);

--
-- Indices de la tabla `cantidad`
--
ALTER TABLE `cantidad`
  ADD PRIMARY KEY (`id_cantidad`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `concentracion`
--
ALTER TABLE `concentracion`
  ADD PRIMARY KEY (`id_concentracion`);

--
-- Indices de la tabla `dosis`
--
ALTER TABLE `dosis`
  ADD PRIMARY KEY (`id_dosis`);

--
-- Indices de la tabla `duracion`
--
ALTER TABLE `duracion`
  ADD PRIMARY KEY (`id_duracion`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`id_examen`);

--
-- Indices de la tabla `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`id_familia`);

--
-- Indices de la tabla `forma_farmacologica`
--
ALTER TABLE `forma_farmacologica`
  ADD PRIMARY KEY (`id_formaFarmacologica`);

--
-- Indices de la tabla `frecuencia`
--
ALTER TABLE `frecuencia`
  ADD PRIMARY KEY (`id_frecuencia`);

--
-- Indices de la tabla `lado`
--
ALTER TABLE `lado`
  ADD PRIMARY KEY (`id_lado`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`id_medicamento`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_familia` (`id_familia`);

--
-- Indices de la tabla `medicamento_concentracion`
--
ALTER TABLE `medicamento_concentracion`
  ADD KEY `id_concentracion` (`id_concentracion`);

--
-- Indices de la tabla `medicamento_forma`
--
ALTER TABLE `medicamento_forma`
  ADD KEY `id_medicamento` (`id_medicamento`),
  ADD KEY `id_formaFarmacologica` (`id_formaFarmacologica`);

--
-- Indices de la tabla `medicamento_presentacion`
--
ALTER TABLE `medicamento_presentacion`
  ADD KEY `id_presentacion` (`id_presentacion`),
  ADD KEY `id_medicamento` (`id_medicamento`);

--
-- Indices de la tabla `obra_social`
--
ALTER TABLE `obra_social`
  ADD PRIMARY KEY (`id_obra_social`),
  ADD KEY `id_plan` (`id_plan`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD KEY `paciente_ibfk_2` (`id_plan`);

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id_plan`);

--
-- Indices de la tabla `prescripcion`
--
ALTER TABLE `prescripcion`
  ADD KEY `id_prescripcion` (`id_prescripcion`);

--
-- Indices de la tabla `prescripcion_medicamento`
--
ALTER TABLE `prescripcion_medicamento`
  ADD KEY `id_medicamento` (`id_medicamento`),
  ADD KEY `id_prescripcion` (`id_prescripcion`);

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  ADD PRIMARY KEY (`id_presentacion`);

--
-- Indices de la tabla `prestacion`
--
ALTER TABLE `prestacion`
  ADD PRIMARY KEY (`id_prestacion`),
  ADD KEY `id_prestacion_examen` (`id_prestacion_examen`),
  ADD KEY `id_prestacion_lado` (`id_prestacion_lado`);

--
-- Indices de la tabla `prestacion_examen`
--
ALTER TABLE `prestacion_examen`
  ADD PRIMARY KEY (`id_prestacion_examen`),
  ADD KEY `id_examen` (`id_examen`);

--
-- Indices de la tabla `prestacion_lado`
--
ALTER TABLE `prestacion_lado`
  ADD PRIMARY KEY (`id_prestacion_lado`),
  ADD KEY `id_lado` (`id_lado`);

--
-- Indices de la tabla `prestacion_prescripcion`
--
ALTER TABLE `prestacion_prescripcion`
  ADD KEY `id_prescripcion` (`id_prescripcion`),
  ADD KEY `id_prestacion` (`id_prestacion`);

--
-- Indices de la tabla `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`id_profesion`);

--
-- Indices de la tabla `profesional`
--
ALTER TABLE `profesional`
  ADD PRIMARY KEY (`id_profesional`),
  ADD UNIQUE KEY `id_refeps` (`id_refeps`),
  ADD KEY `id_profesional_especialidad` (`id_profesional_especialidad`);

--
-- Indices de la tabla `profesional_especialidad`
--
ALTER TABLE `profesional_especialidad`
  ADD PRIMARY KEY (`id_profesionalEspecialidad`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `profesional_profesion`
--
ALTER TABLE `profesional_profesion`
  ADD PRIMARY KEY (`id_profesionalProfesional`),
  ADD KEY `id_profesion` (`id_profesion`),
  ADD KEY `id_profesional` (`id_profesional`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `usuario_2` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administracion_medicamentos`
--
ALTER TABLE `administracion_medicamentos`
  MODIFY `id_administracion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cantidad`
--
ALTER TABLE `cantidad`
  MODIFY `id_cantidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `concentracion`
--
ALTER TABLE `concentracion`
  MODIFY `id_concentracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `dosis`
--
ALTER TABLE `dosis`
  MODIFY `id_dosis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `duracion`
--
ALTER TABLE `duracion`
  MODIFY `id_duracion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `id_examen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `familia`
--
ALTER TABLE `familia`
  MODIFY `id_familia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `forma_farmacologica`
--
ALTER TABLE `forma_farmacologica`
  MODIFY `id_formaFarmacologica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `frecuencia`
--
ALTER TABLE `frecuencia`
  MODIFY `id_frecuencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `lado`
--
ALTER TABLE `lado`
  MODIFY `id_lado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `obra_social`
--
ALTER TABLE `obra_social`
  MODIFY `id_obra_social` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `plan`
--
ALTER TABLE `plan`
  MODIFY `id_plan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  MODIFY `id_presentacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `prestacion`
--
ALTER TABLE `prestacion`
  MODIFY `id_prestacion` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `prestacion_lado`
--
ALTER TABLE `prestacion_lado`
  MODIFY `id_prestacion_lado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `profesion`
--
ALTER TABLE `profesion`
  MODIFY `id_profesion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `profesional`
--
ALTER TABLE `profesional`
  MODIFY `id_profesional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `profesional_especialidad`
--
ALTER TABLE `profesional_especialidad`
  MODIFY `id_profesionalEspecialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `profesional_profesion`
--
ALTER TABLE `profesional_profesion`
  MODIFY `id_profesionalProfesional` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administracion_medicamentos`
--
ALTER TABLE `administracion_medicamentos`
  ADD CONSTRAINT `administracion_medicamentos_ibfk_1` FOREIGN KEY (`id_cantidad`) REFERENCES `cantidad` (`id_cantidad`),
  ADD CONSTRAINT `administracion_medicamentos_ibfk_2` FOREIGN KEY (`id_dosis`) REFERENCES `dosis` (`id_dosis`),
  ADD CONSTRAINT `administracion_medicamentos_ibfk_3` FOREIGN KEY (`id_duracion`) REFERENCES `duracion` (`id_duracion`),
  ADD CONSTRAINT `administracion_medicamentos_ibfk_4` FOREIGN KEY (`id_frecuencia`) REFERENCES `frecuencia` (`id_frecuencia`),
  ADD CONSTRAINT `administracion_medicamentos_ibfk_5` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id_medicamento`);

--
-- Filtros para la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD CONSTRAINT `medicamento_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `medicamento_ibfk_2` FOREIGN KEY (`id_familia`) REFERENCES `familia` (`id_familia`);

--
-- Filtros para la tabla `medicamento_concentracion`
--
ALTER TABLE `medicamento_concentracion`
  ADD CONSTRAINT `medicamento_concentracion_ibfk_1` FOREIGN KEY (`id_concentracion`) REFERENCES `concentracion` (`id_concentracion`);

--
-- Filtros para la tabla `medicamento_forma`
--
ALTER TABLE `medicamento_forma`
  ADD CONSTRAINT `medicamento_forma_ibfk_1` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id_medicamento`),
  ADD CONSTRAINT `medicamento_forma_ibfk_2` FOREIGN KEY (`id_formaFarmacologica`) REFERENCES `forma_farmacologica` (`id_formaFarmacologica`);

--
-- Filtros para la tabla `medicamento_presentacion`
--
ALTER TABLE `medicamento_presentacion`
  ADD CONSTRAINT `medicamento_presentacion_ibfk_1` FOREIGN KEY (`id_presentacion`) REFERENCES `presentacion` (`id_presentacion`),
  ADD CONSTRAINT `medicamento_presentacion_ibfk_2` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id_medicamento`);

--
-- Filtros para la tabla `obra_social`
--
ALTER TABLE `obra_social`
  ADD CONSTRAINT `obra_social_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`);

--
-- Filtros para la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_2` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`);

--
-- Filtros para la tabla `prescripcion_medicamento`
--
ALTER TABLE `prescripcion_medicamento`
  ADD CONSTRAINT `prescripcion_medicamento_ibfk_1` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamento` (`id_medicamento`),
  ADD CONSTRAINT `prescripcion_medicamento_ibfk_2` FOREIGN KEY (`id_prescripcion`) REFERENCES `prescripcion` (`id_prescripcion`);

--
-- Filtros para la tabla `prestacion`
--
ALTER TABLE `prestacion`
  ADD CONSTRAINT `prestacion_ibfk_1` FOREIGN KEY (`id_prestacion_examen`) REFERENCES `prestacion_examen` (`id_prestacion_examen`),
  ADD CONSTRAINT `prestacion_ibfk_2` FOREIGN KEY (`id_prestacion_lado`) REFERENCES `prestacion_lado` (`id_prestacion_lado`);

--
-- Filtros para la tabla `prestacion_examen`
--
ALTER TABLE `prestacion_examen`
  ADD CONSTRAINT `prestacion_examen_ibfk_1` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`id_examen`);

--
-- Filtros para la tabla `prestacion_lado`
--
ALTER TABLE `prestacion_lado`
  ADD CONSTRAINT `prestacion_lado_ibfk_1` FOREIGN KEY (`id_lado`) REFERENCES `lado` (`id_lado`);

--
-- Filtros para la tabla `prestacion_prescripcion`
--
ALTER TABLE `prestacion_prescripcion`
  ADD CONSTRAINT `prestacion_prescripcion_ibfk_1` FOREIGN KEY (`id_prescripcion`) REFERENCES `prescripcion` (`id_prescripcion`),
  ADD CONSTRAINT `prestacion_prescripcion_ibfk_2` FOREIGN KEY (`id_prestacion`) REFERENCES `prestacion` (`id_prestacion`);

--
-- Filtros para la tabla `profesional`
--
ALTER TABLE `profesional`
  ADD CONSTRAINT `profesional_ibfk_4` FOREIGN KEY (`id_profesional_especialidad`) REFERENCES `profesional_especialidad` (`id_profesionalEspecialidad`);

--
-- Filtros para la tabla `profesional_especialidad`
--
ALTER TABLE `profesional_especialidad`
  ADD CONSTRAINT `profesional_especialidad_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`);

--
-- Filtros para la tabla `profesional_profesion`
--
ALTER TABLE `profesional_profesion`
  ADD CONSTRAINT `profesional_profesion_ibfk_1` FOREIGN KEY (`id_profesion`) REFERENCES `profesion` (`id_profesion`),
  ADD CONSTRAINT `profesional_profesion_ibfk_2` FOREIGN KEY (`id_profesional`) REFERENCES `profesional` (`id_profesional`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

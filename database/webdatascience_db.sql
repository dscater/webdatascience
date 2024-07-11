-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-07-2024 a las 14:45:14
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
-- Base de datos: `webdatascience_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `af_lugares_publicos`
--

CREATE TABLE `af_lugares_publicos` (
  `id` bigint UNSIGNED NOT NULL,
  `hombres` bigint NOT NULL,
  `desconocidos` bigint NOT NULL,
  `mujeres` bigint NOT NULL,
  `conocidos` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `af_lugares_publicos`
--

INSERT INTO `af_lugares_publicos` (`id`, `hombres`, `desconocidos`, `mujeres`, `conocidos`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 5, 12, 8, 1, 1, 1, 1, 1),
(2, 4, 14, 6, 2, 2, 1, 1, 1),
(3, 7, 8, 4, 1, 3, 1, 1, 1),
(4, 3, 12, 6, 2, 4, 1, 1, 1),
(5, 6, 14, 9, 2, 1, 1, 2, 1),
(6, 5, 10, 7, 3, 2, 1, 2, 1),
(7, 8, 9, 5, 2, 3, 1, 2, 1),
(8, 4, 11, 6, 1, 4, 1, 2, 1),
(9, 7, 11, 9, 3, 1, 1, 3, 1),
(10, 6, 13, 6, 2, 2, 1, 3, 1),
(11, 8, 10, 5, 2, 3, 1, 3, 1),
(12, 4, 9, 7, 3, 4, 1, 3, 1),
(13, 4, 10, 7, 1, 1, 1, 4, 1),
(14, 3, 11, 5, 1, 2, 1, 4, 1),
(15, 5, 8, 3, 1, 3, 1, 4, 1),
(16, 2, 10, 5, 1, 4, 1, 4, 1),
(17, 9, 16, 10, 3, 1, 1, 5, 1),
(18, 7, 13, 8, 2, 2, 1, 5, 1),
(19, 9, 9, 5, 3, 3, 1, 5, 1),
(20, 4, 11, 7, 1, 4, 1, 5, 1),
(21, 6, 5, 5, 1, 1, 1, 6, 1),
(22, 4, 9, 4, 2, 2, 1, 6, 1),
(23, 5, 5, 4, 2, 3, 1, 6, 1),
(24, 3, 9, 3, 1, 4, 1, 6, 1),
(25, 11, 14, 10, 2, 1, 1, 7, 1),
(26, 9, 9, 9, 2, 2, 1, 7, 1),
(27, 10, 10, 11, 2, 3, 1, 7, 1),
(28, 9, 14, 9, 2, 4, 1, 7, 1),
(29, 6, 13, 9, 1, 1, 1, 8, 1),
(30, 5, 12, 7, 1, 2, 1, 8, 1),
(31, 6, 9, 5, 1, 3, 1, 8, 1),
(32, 4, 11, 4, 1, 4, 1, 8, 1),
(33, 13, 10, 7, 3, 1, 1, 9, 1),
(34, 14, 9, 5, 2, 2, 1, 9, 1),
(35, 11, 8, 4, 1, 3, 1, 9, 1),
(36, 8, 11, 4, 1, 4, 1, 9, 1),
(37, 8, 7, 4, 1, 1, 1, 10, 1),
(38, 7, 9, 6, 1, 2, 1, 10, 1),
(39, 7, 8, 4, 1, 3, 1, 10, 1),
(40, 5, 10, 6, 1, 4, 1, 10, 1),
(41, 12, 11, 4, 1, 1, 1, 11, 1),
(42, 4, 7, 6, 2, 2, 1, 11, 1),
(43, 9, 8, 8, 1, 3, 1, 11, 1),
(44, 5, 12, 6, 2, 4, 1, 11, 1),
(45, 7, 10, 8, 1, 1, 1, 12, 1),
(46, 4, 14, 9, 2, 2, 1, 12, 1),
(47, 7, 8, 4, 1, 3, 1, 12, 1),
(48, 3, 11, 7, 2, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anios`
--

CREATE TABLE `anios` (
  `id` bigint UNSIGNED NOT NULL,
  `anio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `anios`
--

INSERT INTO `anios` (`id`, `anio`) VALUES
(1, '2023');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atencion_medica_psicologica`
--

CREATE TABLE `atencion_medica_psicologica` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `atencion_medica_psicologica`
--

INSERT INTO `atencion_medica_psicologica` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 2, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1),
(3, 3, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 1, 1, 1, 2, 1),
(6, 0, 2, 1, 2, 1),
(7, 3, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 3, 1, 1, 3, 1),
(10, 1, 2, 1, 3, 1),
(11, 2, 3, 1, 3, 1),
(12, 2, 4, 1, 3, 1),
(13, 1, 1, 1, 4, 1),
(14, 2, 2, 1, 4, 1),
(15, 0, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 3, 1, 1, 5, 1),
(18, 2, 2, 1, 5, 1),
(19, 0, 3, 1, 5, 1),
(20, 1, 4, 1, 5, 1),
(21, 1, 1, 1, 6, 1),
(22, 3, 2, 1, 6, 1),
(23, 3, 3, 1, 6, 1),
(24, 2, 4, 1, 6, 1),
(25, 2, 1, 1, 7, 1),
(26, 2, 2, 1, 7, 1),
(27, 3, 3, 1, 7, 1),
(28, 0, 4, 1, 7, 1),
(29, 1, 1, 1, 8, 1),
(30, 3, 2, 1, 8, 1),
(31, 3, 3, 1, 8, 1),
(32, 2, 4, 1, 8, 1),
(33, 3, 1, 1, 9, 1),
(34, 0, 2, 1, 9, 1),
(35, 2, 3, 1, 9, 1),
(36, 2, 4, 1, 9, 1),
(37, 2, 1, 1, 10, 1),
(38, 0, 2, 1, 10, 1),
(39, 3, 3, 1, 10, 1),
(40, 1, 4, 1, 10, 1),
(41, 2, 1, 1, 11, 1),
(42, 3, 2, 1, 11, 1),
(43, 3, 3, 1, 11, 1),
(44, 2, 4, 1, 11, 1),
(45, 1, 1, 1, 12, 1),
(46, 0, 2, 1, 12, 1),
(47, 1, 3, 1, 12, 1),
(48, 1, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atisc_lugares_publicos`
--

CREATE TABLE `atisc_lugares_publicos` (
  `id` bigint UNSIGNED NOT NULL,
  `hombres` bigint NOT NULL,
  `desconocidos` bigint NOT NULL,
  `mujeres` bigint NOT NULL,
  `conocidos` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `atisc_lugares_publicos`
--

INSERT INTO `atisc_lugares_publicos` (`id`, `hombres`, `desconocidos`, `mujeres`, `conocidos`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 2, 3, 0, 2, 1, 1, 1, 1),
(2, 1, 1, 0, 3, 2, 1, 1, 1),
(3, 1, 3, 1, 1, 3, 1, 1, 1),
(4, 2, 4, 0, 2, 4, 1, 1, 1),
(5, 2, 1, 1, 1, 1, 1, 2, 1),
(6, 3, 3, 0, 3, 2, 1, 2, 1),
(7, 1, 2, 1, 2, 3, 1, 2, 1),
(8, 3, 3, 1, 3, 4, 1, 2, 1),
(9, 3, 2, 0, 4, 1, 1, 3, 1),
(10, 2, 1, 0, 1, 2, 1, 3, 1),
(11, 1, 1, 1, 2, 3, 1, 3, 1),
(12, 3, 2, 1, 3, 4, 1, 3, 1),
(13, 1, 1, 1, 3, 1, 1, 4, 1),
(14, 3, 3, 0, 1, 2, 1, 4, 1),
(15, 1, 3, 1, 1, 3, 1, 4, 1),
(16, 2, 2, 0, 1, 4, 1, 4, 1),
(17, 3, 2, 1, 3, 1, 1, 5, 1),
(18, 1, 3, 1, 1, 2, 1, 5, 1),
(19, 4, 3, 0, 1, 3, 1, 5, 1),
(20, 1, 2, 0, 1, 4, 1, 5, 1),
(21, 1, 1, 1, 2, 1, 1, 6, 1),
(22, 4, 1, 1, 4, 2, 1, 6, 1),
(23, 1, 2, 1, 3, 3, 1, 6, 1),
(24, 2, 3, 0, 2, 4, 1, 6, 1),
(25, 4, 1, 0, 3, 1, 1, 7, 1),
(26, 1, 2, 1, 1, 2, 1, 7, 1),
(27, 4, 4, 3, 2, 3, 1, 7, 1),
(28, 3, 4, 1, 3, 4, 1, 7, 1),
(29, 2, 3, 0, 2, 1, 1, 8, 1),
(30, 1, 2, 1, 4, 2, 1, 8, 1),
(31, 3, 1, 1, 1, 3, 1, 8, 1),
(32, 2, 4, 0, 4, 4, 1, 8, 1),
(33, 3, 4, 0, 1, 1, 1, 9, 1),
(34, 3, 2, 2, 2, 2, 1, 9, 1),
(35, 1, 3, 1, 1, 3, 1, 9, 1),
(36, 3, 1, 1, 2, 4, 1, 9, 1),
(37, 3, 4, 1, 3, 1, 1, 10, 1),
(38, 2, 1, 0, 2, 2, 1, 10, 1),
(39, 2, 1, 1, 2, 3, 1, 10, 1),
(40, 4, 2, 0, 3, 4, 1, 10, 1),
(41, 3, 5, 1, 3, 1, 1, 11, 1),
(42, 3, 2, 1, 3, 2, 1, 11, 1),
(43, 1, 3, 1, 1, 3, 1, 11, 1),
(44, 3, 2, 1, 3, 4, 1, 11, 1),
(45, 4, 3, 0, 2, 1, 1, 12, 1),
(46, 1, 4, 1, 1, 2, 1, 12, 1),
(47, 4, 3, 1, 4, 3, 1, 12, 1),
(48, 2, 4, 0, 2, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avcs_lugares_publicos`
--

CREATE TABLE `avcs_lugares_publicos` (
  `id` bigint UNSIGNED NOT NULL,
  `hombres` bigint NOT NULL,
  `desconocidos` bigint NOT NULL,
  `mujeres` bigint NOT NULL,
  `conocidos` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `avcs_lugares_publicos`
--

INSERT INTO `avcs_lugares_publicos` (`id`, `hombres`, `desconocidos`, `mujeres`, `conocidos`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 2, 8, 1, 6, 1, 1, 1, 1),
(2, 4, 11, 1, 4, 2, 1, 1, 1),
(3, 3, 7, 1, 3, 3, 1, 1, 1),
(4, 2, 12, 1, 5, 4, 1, 1, 1),
(5, 3, 10, 0, 7, 1, 1, 2, 1),
(6, 8, 14, 2, 5, 2, 1, 2, 1),
(7, 4, 5, 2, 4, 3, 1, 2, 1),
(8, 5, 11, 1, 8, 4, 1, 2, 1),
(9, 4, 9, 1, 8, 1, 1, 3, 1),
(10, 3, 11, 1, 7, 2, 1, 3, 1),
(11, 5, 9, 0, 4, 3, 1, 3, 1),
(12, 1, 10, 1, 6, 4, 1, 3, 1),
(13, 7, 14, 2, 5, 1, 1, 4, 1),
(14, 9, 12, 1, 3, 2, 1, 4, 1),
(15, 8, 10, 2, 5, 3, 1, 4, 1),
(16, 5, 7, 1, 7, 4, 1, 4, 1),
(17, 5, 7, 1, 6, 1, 1, 5, 1),
(18, 4, 10, 2, 9, 2, 1, 5, 1),
(19, 4, 11, 2, 3, 3, 1, 5, 1),
(20, 2, 8, 1, 8, 4, 1, 5, 1),
(21, 6, 11, 2, 4, 1, 1, 6, 1),
(22, 9, 14, 1, 9, 2, 1, 6, 1),
(23, 7, 10, 1, 7, 3, 1, 6, 1),
(24, 5, 9, 2, 6, 4, 1, 6, 1),
(25, 7, 10, 1, 6, 1, 1, 7, 1),
(26, 4, 11, 2, 9, 2, 1, 7, 1),
(27, 5, 9, 2, 3, 3, 1, 7, 1),
(28, 2, 12, 1, 9, 4, 1, 7, 1),
(29, 6, 12, 2, 6, 1, 1, 8, 1),
(30, 7, 14, 2, 4, 2, 1, 8, 1),
(31, 4, 10, 2, 5, 3, 1, 8, 1),
(32, 3, 11, 1, 5, 4, 1, 8, 1),
(33, 3, 10, 2, 8, 1, 1, 9, 1),
(34, 9, 10, 2, 7, 2, 1, 9, 1),
(35, 7, 14, 1, 3, 3, 1, 9, 1),
(36, 4, 7, 1, 7, 4, 1, 9, 1),
(37, 5, 8, 1, 8, 1, 1, 10, 1),
(38, 4, 11, 1, 5, 2, 1, 10, 1),
(39, 3, 14, 1, 4, 3, 1, 10, 1),
(40, 2, 13, 2, 7, 4, 1, 10, 1),
(41, 3, 7, 2, 4, 1, 1, 11, 1),
(42, 8, 11, 1, 5, 2, 1, 11, 1),
(43, 3, 14, 1, 3, 3, 1, 11, 1),
(44, 7, 8, 2, 3, 4, 1, 11, 1),
(45, 4, 12, 2, 9, 1, 1, 12, 1),
(46, 8, 10, 1, 8, 2, 1, 12, 1),
(47, 6, 13, 2, 6, 3, 1, 12, 1),
(48, 6, 10, 2, 7, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuda_amiga`
--

CREATE TABLE `ayuda_amiga` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ayuda_amiga`
--

INSERT INTO `ayuda_amiga` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 2, 1, 1, 1),
(3, 0, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 1, 1, 1, 2, 1),
(6, 3, 2, 1, 2, 1),
(7, 1, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 0, 1, 1, 3, 1),
(10, 1, 2, 1, 3, 1),
(11, 1, 3, 1, 3, 1),
(12, 0, 4, 1, 3, 1),
(13, 1, 1, 1, 4, 1),
(14, 1, 2, 1, 4, 1),
(15, 4, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 2, 1, 1, 5, 1),
(18, 2, 2, 1, 5, 1),
(19, 1, 3, 1, 5, 1),
(20, 2, 4, 1, 5, 1),
(21, 2, 1, 1, 6, 1),
(22, 1, 2, 1, 6, 1),
(23, 0, 3, 1, 6, 1),
(24, 4, 4, 1, 6, 1),
(25, 0, 1, 1, 7, 1),
(26, 1, 2, 1, 7, 1),
(27, 2, 3, 1, 7, 1),
(28, 1, 4, 1, 7, 1),
(29, 0, 1, 1, 8, 1),
(30, 1, 2, 1, 8, 1),
(31, 2, 3, 1, 8, 1),
(32, 1, 4, 1, 8, 1),
(33, 4, 1, 1, 9, 1),
(34, 0, 2, 1, 9, 1),
(35, 0, 3, 1, 9, 1),
(36, 1, 4, 1, 9, 1),
(37, 0, 1, 1, 10, 1),
(38, 1, 2, 1, 10, 1),
(39, 0, 3, 1, 10, 1),
(40, 3, 4, 1, 10, 1),
(41, 1, 1, 1, 11, 1),
(42, 3, 2, 1, 11, 1),
(43, 2, 3, 1, 11, 1),
(44, 2, 4, 1, 11, 1),
(45, 3, 1, 1, 12, 1),
(46, 1, 2, 1, 12, 1),
(47, 2, 3, 1, 12, 1),
(48, 3, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuda_amigo`
--

CREATE TABLE `ayuda_amigo` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ayuda_amigo`
--

INSERT INTO `ayuda_amigo` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 2, 1, 1, 1),
(3, 2, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 0, 1, 1, 2, 1),
(6, 1, 2, 1, 2, 1),
(7, 2, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 0, 1, 1, 3, 1),
(10, 1, 2, 1, 3, 1),
(11, 2, 3, 1, 3, 1),
(12, 0, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 2, 2, 1, 4, 1),
(15, 1, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 1, 1, 1, 5, 1),
(18, 1, 2, 1, 5, 1),
(19, 1, 3, 1, 5, 1),
(20, 1, 4, 1, 5, 1),
(21, 0, 1, 1, 6, 1),
(22, 1, 2, 1, 6, 1),
(23, 1, 3, 1, 6, 1),
(24, 2, 4, 1, 6, 1),
(25, 1, 1, 1, 7, 1),
(26, 0, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 1, 4, 1, 7, 1),
(29, 1, 1, 1, 8, 1),
(30, 0, 2, 1, 8, 1),
(31, 0, 3, 1, 8, 1),
(32, 1, 4, 1, 8, 1),
(33, 2, 1, 1, 9, 1),
(34, 1, 2, 1, 9, 1),
(35, 1, 3, 1, 9, 1),
(36, 0, 4, 1, 9, 1),
(37, 0, 1, 1, 10, 1),
(38, 1, 2, 1, 10, 1),
(39, 1, 3, 1, 10, 1),
(40, 0, 4, 1, 10, 1),
(41, 0, 1, 1, 11, 1),
(42, 0, 2, 1, 11, 1),
(43, 1, 3, 1, 11, 1),
(44, 2, 4, 1, 11, 1),
(45, 2, 1, 1, 12, 1),
(46, 1, 2, 1, 12, 1),
(47, 2, 3, 1, 12, 1),
(48, 2, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuda_dna`
--

CREATE TABLE `ayuda_dna` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ayuda_dna`
--

INSERT INTO `ayuda_dna` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 2, 1, 1, 1, 1),
(2, 3, 2, 1, 1, 1),
(3, 1, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 2, 1, 1, 2, 1),
(6, 0, 2, 1, 2, 1),
(7, 1, 3, 1, 2, 1),
(8, 3, 4, 1, 2, 1),
(9, 1, 1, 1, 3, 1),
(10, 2, 2, 1, 3, 1),
(11, 3, 3, 1, 3, 1),
(12, 1, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 2, 2, 1, 4, 1),
(15, 1, 3, 1, 4, 1),
(16, 0, 4, 1, 4, 1),
(17, 1, 1, 1, 5, 1),
(18, 0, 2, 1, 5, 1),
(19, 2, 3, 1, 5, 1),
(20, 3, 4, 1, 5, 1),
(21, 1, 1, 1, 6, 1),
(22, 1, 2, 1, 6, 1),
(23, 2, 3, 1, 6, 1),
(24, 2, 4, 1, 6, 1),
(25, 3, 1, 1, 7, 1),
(26, 1, 2, 1, 7, 1),
(27, 2, 3, 1, 7, 1),
(28, 2, 4, 1, 7, 1),
(29, 0, 1, 1, 8, 1),
(30, 3, 2, 1, 8, 1),
(31, 0, 3, 1, 8, 1),
(32, 1, 4, 1, 8, 1),
(33, 1, 1, 1, 9, 1),
(34, 0, 2, 1, 9, 1),
(35, 0, 3, 1, 9, 1),
(36, 0, 4, 1, 9, 1),
(37, 2, 1, 1, 10, 1),
(38, 3, 2, 1, 10, 1),
(39, 1, 3, 1, 10, 1),
(40, 2, 4, 1, 10, 1),
(41, 1, 1, 1, 11, 1),
(42, 3, 2, 1, 11, 1),
(43, 3, 3, 1, 11, 1),
(44, 2, 4, 1, 11, 1),
(45, 3, 1, 1, 12, 1),
(46, 1, 2, 1, 12, 1),
(47, 2, 3, 1, 12, 1),
(48, 3, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuda_familiar`
--

CREATE TABLE `ayuda_familiar` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ayuda_familiar`
--

INSERT INTO `ayuda_familiar` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 2, 1, 1, 1, 1),
(2, 3, 2, 1, 1, 1),
(3, 2, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 4, 1, 1, 2, 1),
(6, 2, 2, 1, 2, 1),
(7, 3, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 1, 1, 1, 3, 1),
(10, 3, 2, 1, 3, 1),
(11, 4, 3, 1, 3, 1),
(12, 3, 4, 1, 3, 1),
(13, 1, 1, 1, 4, 1),
(14, 3, 2, 1, 4, 1),
(15, 1, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 3, 1, 1, 5, 1),
(18, 4, 2, 1, 5, 1),
(19, 2, 3, 1, 5, 1),
(20, 2, 4, 1, 5, 1),
(21, 3, 1, 1, 6, 1),
(22, 1, 2, 1, 6, 1),
(23, 4, 3, 1, 6, 1),
(24, 2, 4, 1, 6, 1),
(25, 2, 1, 1, 7, 1),
(26, 2, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 3, 4, 1, 7, 1),
(29, 1, 1, 1, 8, 1),
(30, 1, 2, 1, 8, 1),
(31, 1, 3, 1, 8, 1),
(32, 1, 4, 1, 8, 1),
(33, 2, 1, 1, 9, 1),
(34, 3, 2, 1, 9, 1),
(35, 4, 3, 1, 9, 1),
(36, 3, 4, 1, 9, 1),
(37, 2, 1, 1, 10, 1),
(38, 2, 2, 1, 10, 1),
(39, 2, 3, 1, 10, 1),
(40, 4, 4, 1, 10, 1),
(41, 1, 1, 1, 11, 1),
(42, 1, 2, 1, 11, 1),
(43, 4, 3, 1, 11, 1),
(44, 3, 4, 1, 11, 1),
(45, 2, 1, 1, 12, 1),
(46, 4, 2, 1, 12, 1),
(47, 4, 3, 1, 12, 1),
(48, 3, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuda_felcv`
--

CREATE TABLE `ayuda_felcv` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ayuda_felcv`
--

INSERT INTO `ayuda_felcv` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 2, 1, 1, 1, 1),
(2, 3, 2, 1, 1, 1),
(3, 1, 3, 1, 1, 1),
(4, 2, 4, 1, 1, 1),
(5, 1, 1, 1, 2, 1),
(6, 3, 2, 1, 2, 1),
(7, 2, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 2, 1, 1, 3, 1),
(10, 1, 2, 1, 3, 1),
(11, 1, 3, 1, 3, 1),
(12, 2, 4, 1, 3, 1),
(13, 3, 1, 1, 4, 1),
(14, 3, 2, 1, 4, 1),
(15, 1, 3, 1, 4, 1),
(16, 3, 4, 1, 4, 1),
(17, 1, 1, 1, 5, 1),
(18, 2, 2, 1, 5, 1),
(19, 3, 3, 1, 5, 1),
(20, 3, 4, 1, 5, 1),
(21, 3, 1, 1, 6, 1),
(22, 1, 2, 1, 6, 1),
(23, 2, 3, 1, 6, 1),
(24, 2, 4, 1, 6, 1),
(25, 1, 1, 1, 7, 1),
(26, 4, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 2, 4, 1, 7, 1),
(29, 2, 1, 1, 8, 1),
(30, 1, 2, 1, 8, 1),
(31, 3, 3, 1, 8, 1),
(32, 3, 4, 1, 8, 1),
(33, 3, 1, 1, 9, 1),
(34, 2, 2, 1, 9, 1),
(35, 2, 3, 1, 9, 1),
(36, 2, 4, 1, 9, 1),
(37, 1, 1, 1, 10, 1),
(38, 1, 2, 1, 10, 1),
(39, 1, 3, 1, 10, 1),
(40, 1, 4, 1, 10, 1),
(41, 3, 1, 1, 11, 1),
(42, 2, 2, 1, 11, 1),
(43, 3, 3, 1, 11, 1),
(44, 1, 4, 1, 11, 1),
(45, 2, 1, 1, 12, 1),
(46, 1, 2, 1, 12, 1),
(47, 3, 3, 1, 12, 1),
(48, 1, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuda_oi`
--

CREATE TABLE `ayuda_oi` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ayuda_oi`
--

INSERT INTO `ayuda_oi` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 0, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1),
(3, 0, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 1, 1, 1, 2, 1),
(6, 0, 2, 1, 2, 1),
(7, 0, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 1, 1, 1, 3, 1),
(10, 0, 2, 1, 3, 1),
(11, 0, 3, 1, 3, 1),
(12, 0, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 0, 2, 1, 4, 1),
(15, 0, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 0, 1, 1, 5, 1),
(18, 0, 2, 1, 5, 1),
(19, 0, 3, 1, 5, 1),
(20, 1, 4, 1, 5, 1),
(21, 0, 1, 1, 6, 1),
(22, 1, 2, 1, 6, 1),
(23, 1, 3, 1, 6, 1),
(24, 1, 4, 1, 6, 1),
(25, 0, 1, 1, 7, 1),
(26, 0, 2, 1, 7, 1),
(27, 0, 3, 1, 7, 1),
(28, 1, 4, 1, 7, 1),
(29, 1, 1, 1, 8, 1),
(30, 0, 2, 1, 8, 1),
(31, 1, 3, 1, 8, 1),
(32, 0, 4, 1, 8, 1),
(33, 1, 1, 1, 9, 1),
(34, 0, 2, 1, 9, 1),
(35, 0, 3, 1, 9, 1),
(36, 0, 4, 1, 9, 1),
(37, 1, 1, 1, 10, 1),
(38, 0, 2, 1, 10, 1),
(39, 1, 3, 1, 10, 1),
(40, 0, 4, 1, 10, 1),
(41, 0, 1, 1, 11, 1),
(42, 0, 2, 1, 11, 1),
(43, 0, 3, 1, 11, 1),
(44, 0, 4, 1, 11, 1),
(45, 1, 1, 1, 12, 1),
(46, 0, 2, 1, 12, 1),
(47, 0, 3, 1, 12, 1),
(48, 0, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuda_pa`
--

CREATE TABLE `ayuda_pa` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ayuda_pa`
--

INSERT INTO `ayuda_pa` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 0, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1),
(3, 0, 3, 1, 1, 1),
(4, 0, 4, 1, 1, 1),
(5, 0, 1, 1, 2, 1),
(6, 0, 2, 1, 2, 1),
(7, 0, 3, 1, 2, 1),
(8, 0, 4, 1, 2, 1),
(9, 0, 1, 1, 3, 1),
(10, 1, 2, 1, 3, 1),
(11, 1, 3, 1, 3, 1),
(12, 0, 4, 1, 3, 1),
(13, 1, 1, 1, 4, 1),
(14, 0, 2, 1, 4, 1),
(15, 0, 3, 1, 4, 1),
(16, 0, 4, 1, 4, 1),
(17, 0, 1, 1, 5, 1),
(18, 0, 2, 1, 5, 1),
(19, 0, 3, 1, 5, 1),
(20, 1, 4, 1, 5, 1),
(21, 0, 1, 1, 6, 1),
(22, 0, 2, 1, 6, 1),
(23, 0, 3, 1, 6, 1),
(24, 0, 4, 1, 6, 1),
(25, 0, 1, 1, 7, 1),
(26, 0, 2, 1, 7, 1),
(27, 0, 3, 1, 7, 1),
(28, 0, 4, 1, 7, 1),
(29, 0, 1, 1, 8, 1),
(30, 0, 2, 1, 8, 1),
(31, 1, 3, 1, 8, 1),
(32, 0, 4, 1, 8, 1),
(33, 0, 1, 1, 9, 1),
(34, 1, 2, 1, 9, 1),
(35, 0, 3, 1, 9, 1),
(36, 1, 4, 1, 9, 1),
(37, 0, 1, 1, 10, 1),
(38, 1, 2, 1, 10, 1),
(39, 0, 3, 1, 10, 1),
(40, 1, 4, 1, 10, 1),
(41, 0, 1, 1, 11, 1),
(42, 0, 2, 1, 11, 1),
(43, 1, 3, 1, 11, 1),
(44, 0, 4, 1, 11, 1),
(45, 0, 1, 1, 12, 1),
(46, 1, 2, 1, 12, 1),
(47, 0, 3, 1, 12, 1),
(48, 0, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ayuda_slim`
--

CREATE TABLE `ayuda_slim` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ayuda_slim`
--

INSERT INTO `ayuda_slim` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 2, 1, 1, 1),
(3, 1, 3, 1, 1, 1),
(4, 0, 4, 1, 1, 1),
(5, 1, 1, 1, 2, 1),
(6, 0, 2, 1, 2, 1),
(7, 1, 3, 1, 2, 1),
(8, 0, 4, 1, 2, 1),
(9, 2, 1, 1, 3, 1),
(10, 0, 2, 1, 3, 1),
(11, 3, 3, 1, 3, 1),
(12, 1, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 0, 2, 1, 4, 1),
(15, 1, 3, 1, 4, 1),
(16, 0, 4, 1, 4, 1),
(17, 3, 1, 1, 5, 1),
(18, 1, 2, 1, 5, 1),
(19, 1, 3, 1, 5, 1),
(20, 1, 4, 1, 5, 1),
(21, 2, 1, 1, 6, 1),
(22, 0, 2, 1, 6, 1),
(23, 0, 3, 1, 6, 1),
(24, 0, 4, 1, 6, 1),
(25, 3, 1, 1, 7, 1),
(26, 0, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 1, 4, 1, 7, 1),
(29, 1, 1, 1, 8, 1),
(30, 1, 2, 1, 8, 1),
(31, 1, 3, 1, 8, 1),
(32, 1, 4, 1, 8, 1),
(33, 2, 1, 1, 9, 1),
(34, 2, 2, 1, 9, 1),
(35, 0, 3, 1, 9, 1),
(36, 0, 4, 1, 9, 1),
(37, 0, 1, 1, 10, 1),
(38, 2, 2, 1, 10, 1),
(39, 2, 3, 1, 10, 1),
(40, 1, 4, 1, 10, 1),
(41, 3, 1, 1, 11, 1),
(42, 0, 2, 1, 11, 1),
(43, 0, 3, 1, 11, 1),
(44, 0, 4, 1, 11, 1),
(45, 2, 1, 1, 12, 1),
(46, 1, 2, 1, 12, 1),
(47, 0, 3, 1, 12, 1),
(48, 1, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracions`
--

CREATE TABLE `configuracions` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_sistema` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razon_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ciudad` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `web` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actividad` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `configuracions`
--

INSERT INTO `configuracions` (`id`, `nombre_sistema`, `alias`, `razon_social`, `ciudad`, `dir`, `fono`, `correo`, `web`, `actividad`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'WEBDATASCIENCE', 'WDC', 'WEBDATASCIENCE S.A.', 'LA PAZ', 'LOS OLIVOS', '7777777', 'WEBDATASCIENCE@GMAIL.COM', 'WEBDATASCIENCE.COM', 'ACTIVIDAD', 'logo.jpg', NULL, '2024-06-24 17:57:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncia_agresiones`
--

CREATE TABLE `denuncia_agresiones` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `denuncia_agresiones`
--

INSERT INTO `denuncia_agresiones` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 3, 1, 1, 1, 1),
(2, 4, 2, 1, 1, 1),
(3, 1, 3, 1, 1, 1),
(4, 2, 4, 1, 1, 1),
(5, 2, 1, 1, 2, 1),
(6, 1, 2, 1, 2, 1),
(7, 3, 3, 1, 2, 1),
(8, 2, 4, 1, 2, 1),
(9, 3, 1, 1, 3, 1),
(10, 2, 2, 1, 3, 1),
(11, 1, 3, 1, 3, 1),
(12, 4, 4, 1, 3, 1),
(13, 3, 1, 1, 4, 1),
(14, 1, 2, 1, 4, 1),
(15, 2, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 1, 1, 1, 5, 1),
(18, 4, 2, 1, 5, 1),
(19, 3, 3, 1, 5, 1),
(20, 0, 4, 1, 5, 1),
(21, 3, 1, 1, 6, 1),
(22, 0, 2, 1, 6, 1),
(23, 1, 3, 1, 6, 1),
(24, 0, 4, 1, 6, 1),
(25, 4, 1, 1, 7, 1),
(26, 2, 2, 1, 7, 1),
(27, 3, 3, 1, 7, 1),
(28, 1, 4, 1, 7, 1),
(29, 2, 1, 1, 8, 1),
(30, 1, 2, 1, 8, 1),
(31, 3, 3, 1, 8, 1),
(32, 0, 4, 1, 8, 1),
(33, 0, 1, 1, 9, 1),
(34, 2, 2, 1, 9, 1),
(35, 3, 3, 1, 9, 1),
(36, 0, 4, 1, 9, 1),
(37, 1, 1, 1, 10, 1),
(38, 2, 2, 1, 10, 1),
(39, 1, 3, 1, 10, 1),
(40, 3, 4, 1, 10, 1),
(41, 1, 1, 1, 11, 1),
(42, 2, 2, 1, 11, 1),
(43, 1, 3, 1, 11, 1),
(44, 3, 4, 1, 11, 1),
(45, 0, 1, 1, 12, 1),
(46, 5, 2, 1, 12, 1),
(47, 4, 3, 1, 12, 1),
(48, 3, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distritos`
--

CREATE TABLE `distritos` (
  `id` bigint UNSIGNED NOT NULL,
  `distrito` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `distritos`
--

INSERT INTO `distritos` (`id`, `distrito`) VALUES
(1, '3'),
(2, '4'),
(3, '5'),
(4, '6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_accions`
--

CREATE TABLE `historial_accions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `accion` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `datos_original` text COLLATE utf8mb4_unicode_ci,
  `datos_nuevo` text COLLATE utf8mb4_unicode_ci,
  `modulo` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hmp_actores`
--

CREATE TABLE `hmp_actores` (
  `id` bigint UNSIGNED NOT NULL,
  `esposo` bigint NOT NULL,
  `conyugue` bigint NOT NULL,
  `pareja` bigint NOT NULL,
  `desconocidos` bigint NOT NULL,
  `exnovio` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hmp_actores`
--

INSERT INTO `hmp_actores` (`id`, `esposo`, `conyugue`, `pareja`, `desconocidos`, `exnovio`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 5, 2, 1, 1, 1, 1, 1, 1, 1),
(2, 3, 3, 2, 1, 1, 2, 1, 1, 1),
(3, 4, 2, 2, 1, 1, 3, 1, 1, 1),
(4, 6, 1, 1, 1, 1, 4, 1, 1, 1),
(5, 6, 1, 1, 1, 1, 1, 1, 2, 1),
(6, 4, 2, 2, 1, 1, 2, 1, 2, 1),
(7, 5, 2, 1, 1, 1, 3, 1, 2, 1),
(8, 6, 1, 1, 1, 1, 4, 1, 2, 1),
(9, 3, 3, 2, 1, 1, 1, 1, 3, 1),
(10, 6, 1, 1, 1, 1, 2, 1, 3, 1),
(11, 5, 2, 1, 1, 1, 3, 1, 3, 1),
(12, 6, 1, 1, 1, 1, 4, 1, 3, 1),
(13, 5, 1, 2, 1, 1, 1, 1, 4, 1),
(14, 2, 4, 2, 1, 1, 2, 1, 4, 1),
(15, 3, 2, 3, 1, 1, 3, 1, 4, 1),
(16, 4, 2, 2, 1, 1, 4, 1, 4, 1),
(17, 5, 1, 2, 1, 1, 1, 1, 5, 1),
(18, 4, 2, 3, 1, 1, 2, 1, 5, 1),
(19, 5, 2, 3, 1, 1, 3, 1, 5, 1),
(20, 5, 1, 2, 1, 1, 4, 1, 5, 1),
(21, 6, 1, 1, 1, 1, 1, 1, 6, 1),
(22, 3, 3, 2, 1, 1, 2, 1, 6, 1),
(23, 4, 2, 2, 1, 1, 3, 1, 6, 1),
(24, 5, 2, 1, 1, 1, 4, 1, 6, 1),
(25, 4, 2, 2, 1, 1, 1, 1, 7, 1),
(26, 3, 3, 2, 1, 1, 2, 1, 7, 1),
(27, 5, 1, 2, 1, 1, 3, 1, 7, 1),
(28, 6, 1, 1, 1, 1, 4, 1, 7, 1),
(29, 4, 2, 2, 1, 1, 1, 1, 8, 1),
(30, 5, 2, 1, 1, 1, 2, 1, 8, 1),
(31, 4, 2, 2, 1, 1, 3, 1, 8, 1),
(32, 6, 1, 1, 1, 1, 4, 1, 8, 1),
(33, 3, 3, 2, 1, 1, 1, 1, 9, 1),
(34, 2, 5, 1, 1, 1, 2, 1, 9, 1),
(35, 1, 1, 6, 1, 1, 3, 1, 9, 1),
(36, 3, 2, 3, 1, 1, 4, 1, 9, 1),
(37, 6, 1, 1, 1, 1, 1, 1, 10, 1),
(38, 2, 4, 2, 1, 1, 2, 1, 10, 1),
(39, 4, 2, 2, 1, 1, 3, 1, 10, 1),
(40, 5, 1, 2, 1, 1, 4, 1, 10, 1),
(41, 3, 2, 3, 1, 1, 1, 1, 11, 1),
(42, 4, 2, 2, 1, 1, 2, 1, 11, 1),
(43, 1, 4, 3, 1, 1, 3, 1, 11, 1),
(44, 2, 4, 2, 1, 1, 4, 1, 11, 1),
(45, 6, 1, 1, 1, 1, 1, 1, 12, 1),
(46, 3, 2, 3, 1, 1, 2, 1, 12, 1),
(47, 4, 1, 3, 1, 1, 3, 1, 12, 1),
(48, 2, 3, 3, 1, 1, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hmp_poblacion`
--

CREATE TABLE `hmp_poblacion` (
  `id` bigint UNSIGNED NOT NULL,
  `hombres` bigint NOT NULL,
  `conocidos` bigint NOT NULL,
  `desconocidos` bigint NOT NULL,
  `mujeres` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hmp_poblacion`
--

INSERT INTO `hmp_poblacion` (`id`, `hombres`, `conocidos`, `desconocidos`, `mujeres`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 15, 15, 10, 8, 1, 1, 1, 1),
(2, 20, 15, 15, 5, 2, 1, 1, 1),
(3, 12, 10, 5, 5, 3, 1, 1, 1),
(4, 8, 10, 6, 4, 4, 1, 1, 1),
(5, 26, 12, 14, 10, 1, 1, 2, 1),
(6, 24, 12, 15, 8, 2, 1, 2, 1),
(7, 16, 16, 8, 11, 3, 1, 2, 1),
(8, 11, 14, 7, 8, 4, 1, 2, 1),
(9, 14, 12, 11, 9, 1, 1, 3, 1),
(10, 22, 11, 18, 4, 2, 1, 3, 1),
(11, 16, 11, 9, 9, 3, 1, 3, 1),
(12, 12, 14, 8, 7, 4, 1, 3, 1),
(13, 10, 12, 8, 6, 1, 1, 4, 1),
(14, 21, 9, 10, 2, 2, 1, 4, 1),
(15, 14, 12, 8, 6, 3, 1, 4, 1),
(16, 11, 13, 8, 1, 4, 1, 4, 1),
(17, 25, 18, 14, 11, 1, 1, 5, 1),
(18, 28, 12, 17, 9, 2, 1, 5, 1),
(19, 15, 9, 7, 8, 3, 1, 5, 1),
(20, 9, 15, 7, 9, 4, 1, 5, 1),
(21, 32, 25, 17, 15, 1, 1, 6, 1),
(22, 36, 21, 20, 11, 2, 1, 6, 1),
(23, 20, 18, 14, 9, 3, 1, 6, 1),
(24, 18, 19, 16, 12, 4, 1, 6, 1),
(25, 14, 12, 9, 7, 1, 1, 7, 1),
(26, 21, 18, 16, 6, 2, 1, 7, 1),
(27, 11, 9, 7, 9, 3, 1, 7, 1),
(28, 10, 9, 9, 7, 4, 1, 7, 1),
(29, 18, 14, 12, 13, 1, 1, 8, 1),
(30, 22, 12, 14, 9, 2, 1, 8, 1),
(31, 18, 16, 8, 7, 3, 1, 8, 1),
(32, 16, 12, 9, 9, 4, 1, 8, 1),
(33, 32, 25, 15, 14, 1, 1, 9, 1),
(34, 29, 24, 20, 12, 2, 1, 9, 1),
(35, 19, 17, 10, 11, 3, 1, 9, 1),
(36, 15, 13, 14, 10, 4, 1, 9, 1),
(37, 17, 14, 12, 9, 1, 1, 10, 1),
(38, 21, 19, 16, 10, 2, 1, 10, 1),
(39, 14, 14, 9, 4, 3, 1, 10, 1),
(40, 12, 15, 14, 6, 4, 1, 10, 1),
(41, 34, 29, 14, 12, 1, 1, 11, 1),
(42, 28, 24, 22, 9, 2, 1, 11, 1),
(43, 19, 14, 10, 1, 3, 1, 11, 1),
(44, 21, 20, 19, 7, 4, 1, 11, 1),
(45, 16, 16, 11, 10, 1, 1, 12, 1),
(46, 22, 17, 16, 7, 2, 1, 12, 1),
(47, 13, 11, 6, 6, 3, 1, 12, 1),
(48, 9, 11, 7, 5, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `importaciones`
--

CREATE TABLE `importaciones` (
  `id` bigint UNSIGNED NOT NULL,
  `archivo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `importaciones`
--

INSERT INTO `importaciones` (`id`, `archivo`, `fecha`) VALUES
(1, 'D:TrabajosRed	empenviosDATASCIENCE 22-02-2024datascienceBaseDatosViolenciaDeLaMujerFísicaPsicológica.xlsx', '2024-02-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `meses`
--

CREATE TABLE `meses` (
  `id` bigint UNSIGNED NOT NULL,
  `mes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `meses`
--

INSERT INTO `meses` (`id`, `mes`) VALUES
(1, 'ENERO'),
(2, 'FEBRERO'),
(3, 'MARZO'),
(4, 'ABRIL'),
(5, 'MAYO'),
(6, 'JUNIO'),
(7, 'JULIO'),
(8, 'AGOSTO'),
(9, 'SEPTIEMBRE'),
(10, 'OCTUBRE'),
(11, 'NOVIEMBRE'),
(12, 'DICIEMBRE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_01_31_165641_create_configuracions_table', 1),
(4, '2024_02_02_205431_create_historial_accions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `no_ayuda`
--

CREATE TABLE `no_ayuda` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `no_ayuda`
--

INSERT INTO `no_ayuda` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 2, 1, 1, 1),
(3, 1, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 1, 1, 1, 2, 1),
(6, 1, 2, 1, 2, 1),
(7, 0, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 1, 1, 1, 3, 1),
(10, 0, 2, 1, 3, 1),
(11, 0, 3, 1, 3, 1),
(12, 1, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 2, 2, 1, 4, 1),
(15, 0, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 2, 1, 1, 5, 1),
(18, 1, 2, 1, 5, 1),
(19, 2, 3, 1, 5, 1),
(20, 2, 4, 1, 5, 1),
(21, 0, 1, 1, 6, 1),
(22, 2, 2, 1, 6, 1),
(23, 0, 3, 1, 6, 1),
(24, 1, 4, 1, 6, 1),
(25, 2, 1, 1, 7, 1),
(26, 0, 2, 1, 7, 1),
(27, 0, 3, 1, 7, 1),
(28, 0, 4, 1, 7, 1),
(29, 2, 1, 1, 8, 1),
(30, 1, 2, 1, 8, 1),
(31, 2, 3, 1, 8, 1),
(32, 2, 4, 1, 8, 1),
(33, 0, 1, 1, 9, 1),
(34, 1, 2, 1, 9, 1),
(35, 2, 3, 1, 9, 1),
(36, 1, 4, 1, 9, 1),
(37, 0, 1, 1, 10, 1),
(38, 1, 2, 1, 10, 1),
(39, 0, 3, 1, 10, 1),
(40, 2, 4, 1, 10, 1),
(41, 2, 1, 1, 11, 1),
(42, 1, 2, 1, 11, 1),
(43, 2, 3, 1, 11, 1),
(44, 0, 4, 1, 11, 1),
(45, 0, 1, 1, 12, 1),
(46, 1, 2, 1, 12, 1),
(47, 0, 3, 1, 12, 1),
(48, 1, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `no_ayuda_amenaza`
--

CREATE TABLE `no_ayuda_amenaza` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `no_ayuda_amenaza`
--

INSERT INTO `no_ayuda_amenaza` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 3, 1, 1, 1, 1),
(2, 4, 2, 1, 1, 1),
(3, 2, 3, 1, 1, 1),
(4, 2, 4, 1, 1, 1),
(5, 3, 1, 1, 2, 1),
(6, 2, 2, 1, 2, 1),
(7, 1, 3, 1, 2, 1),
(8, 2, 4, 1, 2, 1),
(9, 1, 1, 1, 3, 1),
(10, 2, 2, 1, 3, 1),
(11, 3, 3, 1, 3, 1),
(12, 2, 4, 1, 3, 1),
(13, 4, 1, 1, 4, 1),
(14, 1, 2, 1, 4, 1),
(15, 3, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 4, 1, 1, 5, 1),
(18, 4, 2, 1, 5, 1),
(19, 2, 3, 1, 5, 1),
(20, 1, 4, 1, 5, 1),
(21, 3, 1, 1, 6, 1),
(22, 3, 2, 1, 6, 1),
(23, 1, 3, 1, 6, 1),
(24, 3, 4, 1, 6, 1),
(25, 2, 1, 1, 7, 1),
(26, 2, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 1, 4, 1, 7, 1),
(29, 3, 1, 1, 8, 1),
(30, 3, 2, 1, 8, 1),
(31, 2, 3, 1, 8, 1),
(32, 3, 4, 1, 8, 1),
(33, 1, 1, 1, 9, 1),
(34, 1, 2, 1, 9, 1),
(35, 2, 3, 1, 9, 1),
(36, 3, 4, 1, 9, 1),
(37, 1, 1, 1, 10, 1),
(38, 2, 2, 1, 10, 1),
(39, 4, 3, 1, 10, 1),
(40, 2, 4, 1, 10, 1),
(41, 1, 1, 1, 11, 1),
(42, 4, 2, 1, 11, 1),
(43, 3, 3, 1, 11, 1),
(44, 1, 4, 1, 11, 1),
(45, 2, 1, 1, 12, 1),
(46, 1, 2, 1, 12, 1),
(47, 2, 3, 1, 12, 1),
(48, 0, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `no_ayuda_miedo`
--

CREATE TABLE `no_ayuda_miedo` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `no_ayuda_miedo`
--

INSERT INTO `no_ayuda_miedo` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 3, 2, 1, 1, 1),
(3, 1, 3, 1, 1, 1),
(4, 2, 4, 1, 1, 1),
(5, 1, 1, 1, 2, 1),
(6, 2, 2, 1, 2, 1),
(7, 1, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 1, 1, 1, 3, 1),
(10, 1, 2, 1, 3, 1),
(11, 1, 3, 1, 3, 1),
(12, 1, 4, 1, 3, 1),
(13, 2, 1, 1, 4, 1),
(14, 2, 2, 1, 4, 1),
(15, 2, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 3, 1, 1, 5, 1),
(18, 1, 2, 1, 5, 1),
(19, 2, 3, 1, 5, 1),
(20, 1, 4, 1, 5, 1),
(21, 3, 1, 1, 6, 1),
(22, 2, 2, 1, 6, 1),
(23, 2, 3, 1, 6, 1),
(24, 1, 4, 1, 6, 1),
(25, 3, 1, 1, 7, 1),
(26, 1, 2, 1, 7, 1),
(27, 2, 3, 1, 7, 1),
(28, 1, 4, 1, 7, 1),
(29, 2, 1, 1, 8, 1),
(30, 1, 2, 1, 8, 1),
(31, 3, 3, 1, 8, 1),
(32, 1, 4, 1, 8, 1),
(33, 0, 1, 1, 9, 1),
(34, 1, 2, 1, 9, 1),
(35, 0, 3, 1, 9, 1),
(36, 2, 4, 1, 9, 1),
(37, 3, 1, 1, 10, 1),
(38, 1, 2, 1, 10, 1),
(39, 3, 3, 1, 10, 1),
(40, 2, 4, 1, 10, 1),
(41, 0, 1, 1, 11, 1),
(42, 2, 2, 1, 11, 1),
(43, 3, 3, 1, 11, 1),
(44, 1, 4, 1, 11, 1),
(45, 3, 1, 1, 12, 1),
(46, 1, 2, 1, 12, 1),
(47, 2, 3, 1, 12, 1),
(48, 1, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `no_ayuda_nocreejusticia`
--

CREATE TABLE `no_ayuda_nocreejusticia` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `no_ayuda_nocreejusticia`
--

INSERT INTO `no_ayuda_nocreejusticia` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 6, 1, 1, 1, 1),
(2, 4, 2, 1, 1, 1),
(3, 3, 3, 1, 1, 1),
(4, 5, 4, 1, 1, 1),
(5, 7, 1, 1, 2, 1),
(6, 5, 2, 1, 2, 1),
(7, 5, 3, 1, 2, 1),
(8, 3, 4, 1, 2, 1),
(9, 5, 1, 1, 3, 1),
(10, 7, 2, 1, 3, 1),
(11, 6, 3, 1, 3, 1),
(12, 3, 4, 1, 3, 1),
(13, 5, 1, 1, 4, 1),
(14, 7, 2, 1, 4, 1),
(15, 3, 3, 1, 4, 1),
(16, 6, 4, 1, 4, 1),
(17, 3, 1, 1, 5, 1),
(18, 4, 2, 1, 5, 1),
(19, 5, 3, 1, 5, 1),
(20, 6, 4, 1, 5, 1),
(21, 3, 1, 1, 6, 1),
(22, 7, 2, 1, 6, 1),
(23, 8, 3, 1, 6, 1),
(24, 6, 4, 1, 6, 1),
(25, 7, 1, 1, 7, 1),
(26, 2, 2, 1, 7, 1),
(27, 3, 3, 1, 7, 1),
(28, 6, 4, 1, 7, 1),
(29, 5, 1, 1, 8, 1),
(30, 2, 2, 1, 8, 1),
(31, 4, 3, 1, 8, 1),
(32, 7, 4, 1, 8, 1),
(33, 6, 1, 1, 9, 1),
(34, 5, 2, 1, 9, 1),
(35, 4, 3, 1, 9, 1),
(36, 6, 4, 1, 9, 1),
(37, 4, 1, 1, 10, 1),
(38, 2, 2, 1, 10, 1),
(39, 2, 3, 1, 10, 1),
(40, 1, 4, 1, 10, 1),
(41, 7, 1, 1, 11, 1),
(42, 6, 2, 1, 11, 1),
(43, 3, 3, 1, 11, 1),
(44, 5, 4, 1, 11, 1),
(45, 7, 1, 1, 12, 1),
(46, 6, 2, 1, 12, 1),
(47, 4, 3, 1, 12, 1),
(48, 8, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `no_ayuda_nosabia`
--

CREATE TABLE `no_ayuda_nosabia` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `no_ayuda_nosabia`
--

INSERT INTO `no_ayuda_nosabia` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 3, 1, 1, 1, 1),
(2, 5, 2, 1, 1, 1),
(3, 4, 3, 1, 1, 1),
(4, 2, 4, 1, 1, 1),
(5, 3, 1, 1, 2, 1),
(6, 4, 2, 1, 2, 1),
(7, 2, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 5, 1, 1, 3, 1),
(10, 3, 2, 1, 3, 1),
(11, 2, 3, 1, 3, 1),
(12, 3, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 2, 2, 1, 4, 1),
(15, 1, 3, 1, 4, 1),
(16, 3, 4, 1, 4, 1),
(17, 3, 1, 1, 5, 1),
(18, 4, 2, 1, 5, 1),
(19, 0, 3, 1, 5, 1),
(20, 1, 4, 1, 5, 1),
(21, 1, 1, 1, 6, 1),
(22, 2, 2, 1, 6, 1),
(23, 0, 3, 1, 6, 1),
(24, 4, 4, 1, 6, 1),
(25, 0, 1, 1, 7, 1),
(26, 5, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 2, 4, 1, 7, 1),
(29, 2, 1, 1, 8, 1),
(30, 5, 2, 1, 8, 1),
(31, 2, 3, 1, 8, 1),
(32, 1, 4, 1, 8, 1),
(33, 0, 1, 1, 9, 1),
(34, 0, 2, 1, 9, 1),
(35, 1, 3, 1, 9, 1),
(36, 3, 4, 1, 9, 1),
(37, 5, 1, 1, 10, 1),
(38, 3, 2, 1, 10, 1),
(39, 4, 3, 1, 10, 1),
(40, 2, 4, 1, 10, 1),
(41, 4, 1, 1, 11, 1),
(42, 3, 2, 1, 11, 1),
(43, 3, 3, 1, 11, 1),
(44, 1, 4, 1, 11, 1),
(45, 1, 1, 1, 12, 1),
(46, 3, 2, 1, 12, 1),
(47, 3, 3, 1, 12, 1),
(48, 5, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `no_ayuda_otromotivo`
--

CREATE TABLE `no_ayuda_otromotivo` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `no_ayuda_otromotivo`
--

INSERT INTO `no_ayuda_otromotivo` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 2, 1, 1, 1),
(3, 2, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 2, 1, 1, 2, 1),
(6, 1, 2, 1, 2, 1),
(7, 0, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 2, 1, 1, 3, 1),
(10, 3, 2, 1, 3, 1),
(11, 1, 3, 1, 3, 1),
(12, 2, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 0, 2, 1, 4, 1),
(15, 3, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 3, 1, 1, 5, 1),
(18, 1, 2, 1, 5, 1),
(19, 2, 3, 1, 5, 1),
(20, 2, 4, 1, 5, 1),
(21, 0, 1, 1, 6, 1),
(22, 2, 2, 1, 6, 1),
(23, 0, 3, 1, 6, 1),
(24, 1, 4, 1, 6, 1),
(25, 2, 1, 1, 7, 1),
(26, 1, 2, 1, 7, 1),
(27, 0, 3, 1, 7, 1),
(28, 2, 4, 1, 7, 1),
(29, 0, 1, 1, 8, 1),
(30, 1, 2, 1, 8, 1),
(31, 2, 3, 1, 8, 1),
(32, 1, 4, 1, 8, 1),
(33, 2, 1, 1, 9, 1),
(34, 1, 2, 1, 9, 1),
(35, 1, 3, 1, 9, 1),
(36, 2, 4, 1, 9, 1),
(37, 2, 1, 1, 10, 1),
(38, 0, 2, 1, 10, 1),
(39, 2, 3, 1, 10, 1),
(40, 2, 4, 1, 10, 1),
(41, 2, 1, 1, 11, 1),
(42, 1, 2, 1, 11, 1),
(43, 1, 3, 1, 11, 1),
(44, 2, 4, 1, 11, 1),
(45, 2, 1, 1, 12, 1),
(46, 1, 2, 1, 12, 1),
(47, 2, 3, 1, 12, 1),
(48, 2, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `no_ayuda_porfamilia`
--

CREATE TABLE `no_ayuda_porfamilia` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `no_ayuda_porfamilia`
--

INSERT INTO `no_ayuda_porfamilia` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 0, 2, 1, 1, 1),
(3, 1, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 1, 1, 1, 2, 1),
(6, 1, 2, 1, 2, 1),
(7, 0, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 0, 1, 1, 3, 1),
(10, 0, 2, 1, 3, 1),
(11, 1, 3, 1, 3, 1),
(12, 0, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 0, 2, 1, 4, 1),
(15, 0, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 1, 1, 1, 5, 1),
(18, 0, 2, 1, 5, 1),
(19, 0, 3, 1, 5, 1),
(20, 0, 4, 1, 5, 1),
(21, 1, 1, 1, 6, 1),
(22, 0, 2, 1, 6, 1),
(23, 0, 3, 1, 6, 1),
(24, 0, 4, 1, 6, 1),
(25, 0, 1, 1, 7, 1),
(26, 0, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 0, 4, 1, 7, 1),
(29, 0, 1, 1, 8, 1),
(30, 1, 2, 1, 8, 1),
(31, 1, 3, 1, 8, 1),
(32, 0, 4, 1, 8, 1),
(33, 0, 1, 1, 9, 1),
(34, 0, 2, 1, 9, 1),
(35, 0, 3, 1, 9, 1),
(36, 0, 4, 1, 9, 1),
(37, 1, 1, 1, 10, 1),
(38, 1, 2, 1, 10, 1),
(39, 1, 3, 1, 10, 1),
(40, 1, 4, 1, 10, 1),
(41, 1, 1, 1, 11, 1),
(42, 1, 2, 1, 11, 1),
(43, 0, 3, 1, 11, 1),
(44, 1, 4, 1, 11, 1),
(45, 0, 1, 1, 12, 1),
(46, 0, 2, 1, 12, 1),
(47, 1, 3, 1, 12, 1),
(48, 0, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `no_ayuda_sepa`
--

CREATE TABLE `no_ayuda_sepa` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `no_ayuda_sepa`
--

INSERT INTO `no_ayuda_sepa` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 0, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1),
(3, 0, 3, 1, 1, 1),
(4, 0, 4, 1, 1, 1),
(5, 2, 1, 1, 2, 1),
(6, 1, 2, 1, 2, 1),
(7, 2, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 0, 1, 1, 3, 1),
(10, 2, 2, 1, 3, 1),
(11, 0, 3, 1, 3, 1),
(12, 1, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 0, 2, 1, 4, 1),
(15, 3, 3, 1, 4, 1),
(16, 0, 4, 1, 4, 1),
(17, 1, 1, 1, 5, 1),
(18, 2, 2, 1, 5, 1),
(19, 0, 3, 1, 5, 1),
(20, 1, 4, 1, 5, 1),
(21, 3, 1, 1, 6, 1),
(22, 2, 2, 1, 6, 1),
(23, 1, 3, 1, 6, 1),
(24, 2, 4, 1, 6, 1),
(25, 3, 1, 1, 7, 1),
(26, 2, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 0, 4, 1, 7, 1),
(29, 0, 1, 1, 8, 1),
(30, 2, 2, 1, 8, 1),
(31, 1, 3, 1, 8, 1),
(32, 3, 4, 1, 8, 1),
(33, 2, 1, 1, 9, 1),
(34, 1, 2, 1, 9, 1),
(35, 2, 3, 1, 9, 1),
(36, 2, 4, 1, 9, 1),
(37, 1, 1, 1, 10, 1),
(38, 2, 2, 1, 10, 1),
(39, 1, 3, 1, 10, 1),
(40, 2, 4, 1, 10, 1),
(41, 2, 1, 1, 11, 1),
(42, 1, 2, 1, 11, 1),
(43, 3, 3, 1, 11, 1),
(44, 1, 4, 1, 11, 1),
(45, 2, 1, 1, 12, 1),
(46, 3, 2, 1, 12, 1),
(47, 1, 3, 1, 12, 1),
(48, 2, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `no_ayuda_sinimportancia`
--

CREATE TABLE `no_ayuda_sinimportancia` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `no_ayuda_sinimportancia`
--

INSERT INTO `no_ayuda_sinimportancia` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 2, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1),
(3, 2, 3, 1, 1, 1),
(4, 2, 4, 1, 1, 1),
(5, 3, 1, 1, 2, 1),
(6, 2, 2, 1, 2, 1),
(7, 1, 3, 1, 2, 1),
(8, 3, 4, 1, 2, 1),
(9, 1, 1, 1, 3, 1),
(10, 0, 2, 1, 3, 1),
(11, 0, 3, 1, 3, 1),
(12, 3, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 0, 2, 1, 4, 1),
(15, 1, 3, 1, 4, 1),
(16, 2, 4, 1, 4, 1),
(17, 0, 1, 1, 5, 1),
(18, 3, 2, 1, 5, 1),
(19, 1, 3, 1, 5, 1),
(20, 3, 4, 1, 5, 1),
(21, 1, 1, 1, 6, 1),
(22, 1, 2, 1, 6, 1),
(23, 1, 3, 1, 6, 1),
(24, 1, 4, 1, 6, 1),
(25, 0, 1, 1, 7, 1),
(26, 0, 2, 1, 7, 1),
(27, 2, 3, 1, 7, 1),
(28, 0, 4, 1, 7, 1),
(29, 3, 1, 1, 8, 1),
(30, 2, 2, 1, 8, 1),
(31, 1, 3, 1, 8, 1),
(32, 3, 4, 1, 8, 1),
(33, 1, 1, 1, 9, 1),
(34, 2, 2, 1, 9, 1),
(35, 1, 3, 1, 9, 1),
(36, 1, 4, 1, 9, 1),
(37, 1, 1, 1, 10, 1),
(38, 0, 2, 1, 10, 1),
(39, 0, 3, 1, 10, 1),
(40, 0, 4, 1, 10, 1),
(41, 2, 1, 1, 11, 1),
(42, 3, 2, 1, 11, 1),
(43, 0, 3, 1, 11, 1),
(44, 1, 4, 1, 11, 1),
(45, 2, 1, 1, 12, 1),
(46, 2, 2, 1, 12, 1),
(47, 0, 3, 1, 12, 1),
(48, 3, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `no_ayuda_verguenza`
--

CREATE TABLE `no_ayuda_verguenza` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `no_ayuda_verguenza`
--

INSERT INTO `no_ayuda_verguenza` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 0, 2, 1, 1, 1),
(3, 1, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 1, 1, 1, 2, 1),
(6, 2, 2, 1, 2, 1),
(7, 1, 3, 1, 2, 1),
(8, 3, 4, 1, 2, 1),
(9, 2, 1, 1, 3, 1),
(10, 2, 2, 1, 3, 1),
(11, 1, 3, 1, 3, 1),
(12, 3, 4, 1, 3, 1),
(13, 2, 1, 1, 4, 1),
(14, 0, 2, 1, 4, 1),
(15, 0, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 3, 1, 1, 5, 1),
(18, 0, 2, 1, 5, 1),
(19, 2, 3, 1, 5, 1),
(20, 0, 4, 1, 5, 1),
(21, 3, 1, 1, 6, 1),
(22, 0, 2, 1, 6, 1),
(23, 3, 3, 1, 6, 1),
(24, 1, 4, 1, 6, 1),
(25, 3, 1, 1, 7, 1),
(26, 2, 2, 1, 7, 1),
(27, 0, 3, 1, 7, 1),
(28, 0, 4, 1, 7, 1),
(29, 0, 1, 1, 8, 1),
(30, 3, 2, 1, 8, 1),
(31, 2, 3, 1, 8, 1),
(32, 1, 4, 1, 8, 1),
(33, 3, 1, 1, 9, 1),
(34, 0, 2, 1, 9, 1),
(35, 0, 3, 1, 9, 1),
(36, 2, 4, 1, 9, 1),
(37, 2, 1, 1, 10, 1),
(38, 1, 2, 1, 10, 1),
(39, 0, 3, 1, 10, 1),
(40, 0, 4, 1, 10, 1),
(41, 2, 1, 1, 11, 1),
(42, 1, 2, 1, 11, 1),
(43, 3, 3, 1, 11, 1),
(44, 2, 4, 1, 11, 1),
(45, 0, 1, 1, 12, 1),
(46, 3, 2, 1, 12, 1),
(47, 1, 3, 1, 12, 1),
(48, 2, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npdf_amenaza`
--

CREATE TABLE `npdf_amenaza` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `npdf_amenaza`
--

INSERT INTO `npdf_amenaza` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 2, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1),
(3, 1, 3, 1, 1, 1),
(4, 2, 4, 1, 1, 1),
(5, 3, 1, 1, 2, 1),
(6, 0, 2, 1, 2, 1),
(7, 1, 3, 1, 2, 1),
(8, 2, 4, 1, 2, 1),
(9, 1, 1, 1, 3, 1),
(10, 3, 2, 1, 3, 1),
(11, 2, 3, 1, 3, 1),
(12, 1, 4, 1, 3, 1),
(13, 3, 1, 1, 4, 1),
(14, 1, 2, 1, 4, 1),
(15, 3, 3, 1, 4, 1),
(16, 2, 4, 1, 4, 1),
(17, 1, 1, 1, 5, 1),
(18, 2, 2, 1, 5, 1),
(19, 3, 3, 1, 5, 1),
(20, 0, 4, 1, 5, 1),
(21, 3, 1, 1, 6, 1),
(22, 2, 2, 1, 6, 1),
(23, 0, 3, 1, 6, 1),
(24, 2, 4, 1, 6, 1),
(25, 1, 1, 1, 7, 1),
(26, 2, 2, 1, 7, 1),
(27, 2, 3, 1, 7, 1),
(28, 3, 4, 1, 7, 1),
(29, 1, 1, 1, 8, 1),
(30, 0, 2, 1, 8, 1),
(31, 3, 3, 1, 8, 1),
(32, 2, 4, 1, 8, 1),
(33, 1, 1, 1, 9, 1),
(34, 2, 2, 1, 9, 1),
(35, 1, 3, 1, 9, 1),
(36, 3, 4, 1, 9, 1),
(37, 1, 1, 1, 10, 1),
(38, 2, 2, 1, 10, 1),
(39, 3, 3, 1, 10, 1),
(40, 1, 4, 1, 10, 1),
(41, 2, 1, 1, 11, 1),
(42, 3, 2, 1, 11, 1),
(43, 2, 3, 1, 11, 1),
(44, 1, 4, 1, 11, 1),
(45, 3, 1, 1, 12, 1),
(46, 2, 2, 1, 12, 1),
(47, 2, 3, 1, 12, 1),
(48, 1, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npdf_miedo`
--

CREATE TABLE `npdf_miedo` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `npdf_miedo`
--

INSERT INTO `npdf_miedo` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 3, 1, 1, 1, 1),
(2, 4, 2, 1, 1, 1),
(3, 2, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 6, 1, 1, 2, 1),
(6, 2, 2, 1, 2, 1),
(7, 3, 3, 1, 2, 1),
(8, 4, 4, 1, 2, 1),
(9, 5, 1, 1, 3, 1),
(10, 2, 2, 1, 3, 1),
(11, 6, 3, 1, 3, 1),
(12, 4, 4, 1, 3, 1),
(13, 4, 1, 1, 4, 1),
(14, 2, 2, 1, 4, 1),
(15, 1, 3, 1, 4, 1),
(16, 6, 4, 1, 4, 1),
(17, 5, 1, 1, 5, 1),
(18, 3, 2, 1, 5, 1),
(19, 5, 3, 1, 5, 1),
(20, 6, 4, 1, 5, 1),
(21, 2, 1, 1, 6, 1),
(22, 3, 2, 1, 6, 1),
(23, 4, 3, 1, 6, 1),
(24, 6, 4, 1, 6, 1),
(25, 5, 1, 1, 7, 1),
(26, 1, 2, 1, 7, 1),
(27, 6, 3, 1, 7, 1),
(28, 3, 4, 1, 7, 1),
(29, 1, 1, 1, 8, 1),
(30, 4, 2, 1, 8, 1),
(31, 6, 3, 1, 8, 1),
(32, 3, 4, 1, 8, 1),
(33, 4, 1, 1, 9, 1),
(34, 6, 2, 1, 9, 1),
(35, 4, 3, 1, 9, 1),
(36, 3, 4, 1, 9, 1),
(37, 1, 1, 1, 10, 1),
(38, 2, 2, 1, 10, 1),
(39, 6, 3, 1, 10, 1),
(40, 2, 4, 1, 10, 1),
(41, 2, 1, 1, 11, 1),
(42, 5, 2, 1, 11, 1),
(43, 4, 3, 1, 11, 1),
(44, 2, 4, 1, 11, 1),
(45, 6, 1, 1, 12, 1),
(46, 5, 2, 1, 12, 1),
(47, 4, 3, 1, 12, 1),
(48, 3, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npdf_nocreejusticia`
--

CREATE TABLE `npdf_nocreejusticia` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `npdf_nocreejusticia`
--

INSERT INTO `npdf_nocreejusticia` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 3, 1, 1, 1, 1),
(2, 4, 2, 1, 1, 1),
(3, 6, 3, 1, 1, 1),
(4, 3, 4, 1, 1, 1),
(5, 4, 1, 1, 2, 1),
(6, 3, 2, 1, 2, 1),
(7, 6, 3, 1, 2, 1),
(8, 5, 4, 1, 2, 1),
(9, 5, 1, 1, 3, 1),
(10, 6, 2, 1, 3, 1),
(11, 7, 3, 1, 3, 1),
(12, 4, 4, 1, 3, 1),
(13, 5, 1, 1, 4, 1),
(14, 2, 2, 1, 4, 1),
(15, 1, 3, 1, 4, 1),
(16, 3, 4, 1, 4, 1),
(17, 6, 1, 1, 5, 1),
(18, 4, 2, 1, 5, 1),
(19, 5, 3, 1, 5, 1),
(20, 2, 4, 1, 5, 1),
(21, 1, 1, 1, 6, 1),
(22, 2, 2, 1, 6, 1),
(23, 5, 3, 1, 6, 1),
(24, 3, 4, 1, 6, 1),
(25, 6, 1, 1, 7, 1),
(26, 7, 2, 1, 7, 1),
(27, 3, 3, 1, 7, 1),
(28, 1, 4, 1, 7, 1),
(29, 6, 1, 1, 8, 1),
(30, 4, 2, 1, 8, 1),
(31, 3, 3, 1, 8, 1),
(32, 5, 4, 1, 8, 1),
(33, 6, 1, 1, 9, 1),
(34, 4, 2, 1, 9, 1),
(35, 3, 3, 1, 9, 1),
(36, 6, 4, 1, 9, 1),
(37, 5, 1, 1, 10, 1),
(38, 6, 2, 1, 10, 1),
(39, 4, 3, 1, 10, 1),
(40, 2, 4, 1, 10, 1),
(41, 6, 1, 1, 11, 1),
(42, 5, 2, 1, 11, 1),
(43, 3, 3, 1, 11, 1),
(44, 2, 4, 1, 11, 1),
(45, 1, 1, 1, 12, 1),
(46, 5, 2, 1, 12, 1),
(47, 3, 3, 1, 12, 1),
(48, 4, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npdf_nosabia`
--

CREATE TABLE `npdf_nosabia` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `npdf_nosabia`
--

INSERT INTO `npdf_nosabia` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 2, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1),
(3, 2, 3, 1, 1, 1),
(4, 2, 4, 1, 1, 1),
(5, 3, 1, 1, 2, 1),
(6, 1, 2, 1, 2, 1),
(7, 2, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 2, 1, 1, 3, 1),
(10, 3, 2, 1, 3, 1),
(11, 1, 3, 1, 3, 1),
(12, 0, 4, 1, 3, 1),
(13, 2, 1, 1, 4, 1),
(14, 0, 2, 1, 4, 1),
(15, 1, 3, 1, 4, 1),
(16, 3, 4, 1, 4, 1),
(17, 1, 1, 1, 5, 1),
(18, 2, 2, 1, 5, 1),
(19, 2, 3, 1, 5, 1),
(20, 3, 4, 1, 5, 1),
(21, 1, 1, 1, 6, 1),
(22, 3, 2, 1, 6, 1),
(23, 2, 3, 1, 6, 1),
(24, 1, 4, 1, 6, 1),
(25, 1, 1, 1, 7, 1),
(26, 1, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 1, 4, 1, 7, 1),
(29, 0, 1, 1, 8, 1),
(30, 1, 2, 1, 8, 1),
(31, 0, 3, 1, 8, 1),
(32, 2, 4, 1, 8, 1),
(33, 0, 1, 1, 9, 1),
(34, 2, 2, 1, 9, 1),
(35, 2, 3, 1, 9, 1),
(36, 3, 4, 1, 9, 1),
(37, 2, 1, 1, 10, 1),
(38, 0, 2, 1, 10, 1),
(39, 2, 3, 1, 10, 1),
(40, 0, 4, 1, 10, 1),
(41, 1, 1, 1, 11, 1),
(42, 3, 2, 1, 11, 1),
(43, 1, 3, 1, 11, 1),
(44, 2, 4, 1, 11, 1),
(45, 2, 1, 1, 12, 1),
(46, 0, 2, 1, 12, 1),
(47, 2, 3, 1, 12, 1),
(48, 1, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npdf_otromotivo`
--

CREATE TABLE `npdf_otromotivo` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `npdf_otromotivo`
--

INSERT INTO `npdf_otromotivo` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 2, 1, 1, 1, 1),
(2, 1, 2, 1, 1, 1),
(3, 2, 3, 1, 1, 1),
(4, 2, 4, 1, 1, 1),
(5, 2, 1, 1, 2, 1),
(6, 1, 2, 1, 2, 1),
(7, 1, 3, 1, 2, 1),
(8, 2, 4, 1, 2, 1),
(9, 1, 1, 1, 3, 1),
(10, 1, 2, 1, 3, 1),
(11, 0, 3, 1, 3, 1),
(12, 1, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 2, 2, 1, 4, 1),
(15, 1, 3, 1, 4, 1),
(16, 0, 4, 1, 4, 1),
(17, 1, 1, 1, 5, 1),
(18, 0, 2, 1, 5, 1),
(19, 1, 3, 1, 5, 1),
(20, 0, 4, 1, 5, 1),
(21, 2, 1, 1, 6, 1),
(22, 2, 2, 1, 6, 1),
(23, 1, 3, 1, 6, 1),
(24, 0, 4, 1, 6, 1),
(25, 1, 1, 1, 7, 1),
(26, 2, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 2, 4, 1, 7, 1),
(29, 0, 1, 1, 8, 1),
(30, 2, 2, 1, 8, 1),
(31, 1, 3, 1, 8, 1),
(32, 2, 4, 1, 8, 1),
(33, 1, 1, 1, 9, 1),
(34, 2, 2, 1, 9, 1),
(35, 0, 3, 1, 9, 1),
(36, 1, 4, 1, 9, 1),
(37, 1, 1, 1, 10, 1),
(38, 0, 2, 1, 10, 1),
(39, 1, 3, 1, 10, 1),
(40, 0, 4, 1, 10, 1),
(41, 1, 1, 1, 11, 1),
(42, 2, 2, 1, 11, 1),
(43, 1, 3, 1, 11, 1),
(44, 2, 4, 1, 11, 1),
(45, 1, 1, 1, 12, 1),
(46, 0, 2, 1, 12, 1),
(47, 0, 3, 1, 12, 1),
(48, 1, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npdf_porfamilia`
--

CREATE TABLE `npdf_porfamilia` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `npdf_porfamilia`
--

INSERT INTO `npdf_porfamilia` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 2, 1, 1, 1),
(3, 1, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 2, 1, 1, 2, 1),
(6, 1, 2, 1, 2, 1),
(7, 0, 3, 1, 2, 1),
(8, 2, 4, 1, 2, 1),
(9, 0, 1, 1, 3, 1),
(10, 1, 2, 1, 3, 1),
(11, 0, 3, 1, 3, 1),
(12, 2, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 1, 2, 1, 4, 1),
(15, 0, 3, 1, 4, 1),
(16, 2, 4, 1, 4, 1),
(17, 2, 1, 1, 5, 1),
(18, 2, 2, 1, 5, 1),
(19, 0, 3, 1, 5, 1),
(20, 1, 4, 1, 5, 1),
(21, 0, 1, 1, 6, 1),
(22, 1, 2, 1, 6, 1),
(23, 0, 3, 1, 6, 1),
(24, 1, 4, 1, 6, 1),
(25, 2, 1, 1, 7, 1),
(26, 0, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 2, 4, 1, 7, 1),
(29, 1, 1, 1, 8, 1),
(30, 1, 2, 1, 8, 1),
(31, 0, 3, 1, 8, 1),
(32, 1, 4, 1, 8, 1),
(33, 1, 1, 1, 9, 1),
(34, 2, 2, 1, 9, 1),
(35, 0, 3, 1, 9, 1),
(36, 2, 4, 1, 9, 1),
(37, 3, 1, 1, 10, 1),
(38, 0, 2, 1, 10, 1),
(39, 2, 3, 1, 10, 1),
(40, 1, 4, 1, 10, 1),
(41, 2, 1, 1, 11, 1),
(42, 1, 2, 1, 11, 1),
(43, 0, 3, 1, 11, 1),
(44, 1, 4, 1, 11, 1),
(45, 2, 1, 1, 12, 1),
(46, 1, 2, 1, 12, 1),
(47, 2, 3, 1, 12, 1),
(48, 0, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npdf_sepa`
--

CREATE TABLE `npdf_sepa` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `npdf_sepa`
--

INSERT INTO `npdf_sepa` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 4, 1, 1, 1, 1),
(2, 6, 2, 1, 1, 1),
(3, 3, 3, 1, 1, 1),
(4, 5, 4, 1, 1, 1),
(5, 4, 1, 1, 2, 1),
(6, 2, 2, 1, 2, 1),
(7, 6, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 5, 1, 1, 3, 1),
(10, 1, 2, 1, 3, 1),
(11, 6, 3, 1, 3, 1),
(12, 2, 4, 1, 3, 1),
(13, 6, 1, 1, 4, 1),
(14, 5, 2, 1, 4, 1),
(15, 6, 3, 1, 4, 1),
(16, 4, 4, 1, 4, 1),
(17, 3, 1, 1, 5, 1),
(18, 5, 2, 1, 5, 1),
(19, 4, 3, 1, 5, 1),
(20, 6, 4, 1, 5, 1),
(21, 3, 1, 1, 6, 1),
(22, 4, 2, 1, 6, 1),
(23, 6, 3, 1, 6, 1),
(24, 5, 4, 1, 6, 1),
(25, 2, 1, 1, 7, 1),
(26, 4, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 6, 4, 1, 7, 1),
(29, 2, 1, 1, 8, 1),
(30, 3, 2, 1, 8, 1),
(31, 1, 3, 1, 8, 1),
(32, 4, 4, 1, 8, 1),
(33, 3, 1, 1, 9, 1),
(34, 2, 2, 1, 9, 1),
(35, 5, 3, 1, 9, 1),
(36, 4, 4, 1, 9, 1),
(37, 6, 1, 1, 10, 1),
(38, 7, 2, 1, 10, 1),
(39, 3, 3, 1, 10, 1),
(40, 2, 4, 1, 10, 1),
(41, 1, 1, 1, 11, 1),
(42, 3, 2, 1, 11, 1),
(43, 4, 3, 1, 11, 1),
(44, 1, 4, 1, 11, 1),
(45, 6, 1, 1, 12, 1),
(46, 3, 2, 1, 12, 1),
(47, 2, 3, 1, 12, 1),
(48, 1, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npdf_sinimportancia`
--

CREATE TABLE `npdf_sinimportancia` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `npdf_sinimportancia`
--

INSERT INTO `npdf_sinimportancia` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 0, 2, 1, 1, 1),
(3, 0, 3, 1, 1, 1),
(4, 1, 4, 1, 1, 1),
(5, 0, 1, 1, 2, 1),
(6, 0, 2, 1, 2, 1),
(7, 1, 3, 1, 2, 1),
(8, 1, 4, 1, 2, 1),
(9, 0, 1, 1, 3, 1),
(10, 1, 2, 1, 3, 1),
(11, 0, 3, 1, 3, 1),
(12, 1, 4, 1, 3, 1),
(13, 0, 1, 1, 4, 1),
(14, 1, 2, 1, 4, 1),
(15, 0, 3, 1, 4, 1),
(16, 1, 4, 1, 4, 1),
(17, 1, 1, 1, 5, 1),
(18, 1, 2, 1, 5, 1),
(19, 0, 3, 1, 5, 1),
(20, 1, 4, 1, 5, 1),
(21, 0, 1, 1, 6, 1),
(22, 0, 2, 1, 6, 1),
(23, 0, 3, 1, 6, 1),
(24, 1, 4, 1, 6, 1),
(25, 0, 1, 1, 7, 1),
(26, 0, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 0, 4, 1, 7, 1),
(29, 0, 1, 1, 8, 1),
(30, 1, 2, 1, 8, 1),
(31, 0, 3, 1, 8, 1),
(32, 0, 4, 1, 8, 1),
(33, 1, 1, 1, 9, 1),
(34, 1, 2, 1, 9, 1),
(35, 0, 3, 1, 9, 1),
(36, 1, 4, 1, 9, 1),
(37, 1, 1, 1, 10, 1),
(38, 0, 2, 1, 10, 1),
(39, 1, 3, 1, 10, 1),
(40, 0, 4, 1, 10, 1),
(41, 0, 1, 1, 11, 1),
(42, 1, 2, 1, 11, 1),
(43, 0, 3, 1, 11, 1),
(44, 0, 4, 1, 11, 1),
(45, 0, 1, 1, 12, 1),
(46, 0, 2, 1, 12, 1),
(47, 1, 3, 1, 12, 1),
(48, 0, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npdf_verguenza`
--

CREATE TABLE `npdf_verguenza` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `npdf_verguenza`
--

INSERT INTO `npdf_verguenza` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 3, 1, 1, 1, 1),
(2, 4, 2, 1, 1, 1),
(3, 5, 3, 1, 1, 1),
(4, 3, 4, 1, 1, 1),
(5, 4, 1, 1, 2, 1),
(6, 4, 2, 1, 2, 1),
(7, 2, 3, 1, 2, 1),
(8, 3, 4, 1, 2, 1),
(9, 2, 1, 1, 3, 1),
(10, 3, 2, 1, 3, 1),
(11, 1, 3, 1, 3, 1),
(12, 3, 4, 1, 3, 1),
(13, 1, 1, 1, 4, 1),
(14, 5, 2, 1, 4, 1),
(15, 3, 3, 1, 4, 1),
(16, 4, 4, 1, 4, 1),
(17, 0, 1, 1, 5, 1),
(18, 2, 2, 1, 5, 1),
(19, 3, 3, 1, 5, 1),
(20, 1, 4, 1, 5, 1),
(21, 2, 1, 1, 6, 1),
(22, 2, 2, 1, 6, 1),
(23, 1, 3, 1, 6, 1),
(24, 2, 4, 1, 6, 1),
(25, 3, 1, 1, 7, 1),
(26, 2, 2, 1, 7, 1),
(27, 1, 3, 1, 7, 1),
(28, 2, 4, 1, 7, 1),
(29, 1, 1, 1, 8, 1),
(30, 4, 2, 1, 8, 1),
(31, 3, 3, 1, 8, 1),
(32, 4, 4, 1, 8, 1),
(33, 0, 1, 1, 9, 1),
(34, 2, 2, 1, 9, 1),
(35, 3, 3, 1, 9, 1),
(36, 0, 4, 1, 9, 1),
(37, 5, 1, 1, 10, 1),
(38, 2, 2, 1, 10, 1),
(39, 1, 3, 1, 10, 1),
(40, 3, 4, 1, 10, 1),
(41, 4, 1, 1, 11, 1),
(42, 0, 2, 1, 11, 1),
(43, 4, 3, 1, 11, 1),
(44, 3, 4, 1, 11, 1),
(45, 2, 1, 1, 12, 1),
(46, 1, 2, 1, 12, 1),
(47, 3, 3, 1, 12, 1),
(48, 4, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `otrs_actores`
--

CREATE TABLE `otrs_actores` (
  `id` bigint UNSIGNED NOT NULL,
  `hombres` bigint NOT NULL,
  `desconocidos` bigint NOT NULL,
  `mujeres` bigint NOT NULL,
  `conocidos` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `otrs_actores`
--

INSERT INTO `otrs_actores` (`id`, `hombres`, `desconocidos`, `mujeres`, `conocidos`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 1, 1, 0, 2, 1, 1, 1, 1),
(2, 2, 1, 0, 3, 2, 1, 1, 1),
(3, 1, 2, 1, 1, 3, 1, 1, 1),
(4, 2, 1, 0, 3, 4, 1, 1, 1),
(5, 0, 1, 0, 1, 1, 1, 2, 1),
(6, 2, 1, 0, 2, 2, 1, 2, 1),
(7, 0, 1, 0, 1, 3, 1, 2, 1),
(8, 2, 1, 0, 1, 4, 1, 2, 1),
(9, 0, 1, 0, 2, 1, 1, 3, 1),
(10, 1, 0, 0, 3, 2, 1, 3, 1),
(11, 0, 0, 1, 2, 3, 1, 3, 1),
(12, 1, 2, 0, 1, 4, 1, 3, 1),
(13, 0, 1, 0, 1, 1, 1, 4, 1),
(14, 1, 0, 0, 2, 2, 1, 4, 1),
(15, 1, 2, 0, 0, 3, 1, 4, 1),
(16, 0, 0, 0, 1, 4, 1, 4, 1),
(17, 1, 1, 0, 2, 1, 1, 5, 1),
(18, 1, 2, 1, 1, 2, 1, 5, 1),
(19, 0, 1, 0, 0, 3, 1, 5, 1),
(20, 1, 2, 0, 1, 4, 1, 5, 1),
(21, 0, 1, 0, 0, 1, 1, 6, 1),
(22, 1, 0, 0, 2, 2, 1, 6, 1),
(23, 1, 1, 0, 0, 3, 1, 6, 1),
(24, 0, 0, 0, 2, 4, 1, 6, 1),
(25, 1, 2, 0, 1, 1, 1, 7, 1),
(26, 2, 1, 0, 2, 2, 1, 7, 1),
(27, 0, 1, 1, 1, 3, 1, 7, 1),
(28, 1, 1, 0, 3, 4, 1, 7, 1),
(29, 2, 1, 0, 1, 1, 1, 8, 1),
(30, 1, 1, 0, 1, 2, 1, 8, 1),
(31, 1, 1, 0, 1, 3, 1, 8, 1),
(32, 2, 1, 0, 1, 4, 1, 8, 1),
(33, 2, 1, 0, 0, 1, 1, 9, 1),
(34, 0, 2, 0, 2, 2, 1, 9, 1),
(35, 0, 1, 0, 1, 3, 1, 9, 1),
(36, 1, 2, 0, 1, 4, 1, 9, 1),
(37, 2, 2, 0, 3, 1, 1, 10, 1),
(38, 1, 1, 0, 1, 2, 1, 10, 1),
(39, 2, 2, 0, 1, 3, 1, 10, 1),
(40, 2, 2, 0, 1, 4, 1, 10, 1),
(41, 3, 1, 0, 1, 1, 1, 11, 1),
(42, 2, 1, 0, 0, 2, 1, 11, 1),
(43, 2, 1, 0, 1, 3, 1, 11, 1),
(44, 1, 1, 0, 0, 4, 1, 11, 1),
(45, 0, 2, 1, 0, 1, 1, 12, 1),
(46, 2, 1, 0, 1, 2, 1, 12, 1),
(47, 3, 0, 0, 2, 3, 1, 12, 1),
(48, 2, 1, 0, 1, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poblacion_mujeres`
--

CREATE TABLE `poblacion_mujeres` (
  `id` bigint UNSIGNED NOT NULL,
  `cantidad` bigint NOT NULL,
  `distrito_id` bigint UNSIGNED NOT NULL,
  `importacion_id` bigint UNSIGNED NOT NULL,
  `mes_id` bigint UNSIGNED NOT NULL,
  `anio_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `poblacion_mujeres`
--

INSERT INTO `poblacion_mujeres` (`id`, `cantidad`, `distrito_id`, `importacion_id`, `mes_id`, `anio_id`) VALUES
(1, 78828, 1, 1, 1, 1),
(2, 54147, 2, 1, 1, 1),
(3, 48226, 3, 1, 1, 1),
(4, 45538, 4, 1, 1, 1),
(5, 78828, 1, 1, 2, 1),
(6, 54147, 2, 1, 2, 1),
(7, 48226, 3, 1, 2, 1),
(8, 45538, 4, 1, 2, 1),
(9, 78828, 1, 1, 3, 1),
(10, 54147, 2, 1, 3, 1),
(11, 48226, 3, 1, 3, 1),
(12, 45538, 4, 1, 3, 1),
(13, 78828, 1, 1, 4, 1),
(14, 54147, 2, 1, 4, 1),
(15, 48226, 3, 1, 4, 1),
(16, 45538, 4, 1, 4, 1),
(17, 78828, 1, 1, 5, 1),
(18, 54147, 2, 1, 5, 1),
(19, 48226, 3, 1, 5, 1),
(20, 45538, 4, 1, 5, 1),
(21, 78828, 1, 1, 6, 1),
(22, 54147, 2, 1, 6, 1),
(23, 48226, 3, 1, 6, 1),
(24, 45538, 4, 1, 6, 1),
(25, 78828, 1, 1, 7, 1),
(26, 54147, 2, 1, 7, 1),
(27, 48226, 3, 1, 7, 1),
(28, 45538, 4, 1, 7, 1),
(29, 78828, 1, 1, 8, 1),
(30, 54147, 2, 1, 8, 1),
(31, 48226, 3, 1, 8, 1),
(32, 45538, 4, 1, 8, 1),
(33, 78828, 1, 1, 9, 1),
(34, 54147, 2, 1, 9, 1),
(35, 48226, 3, 1, 9, 1),
(36, 45538, 4, 1, 9, 1),
(37, 78828, 1, 1, 10, 1),
(38, 54147, 2, 1, 10, 1),
(39, 48226, 3, 1, 10, 1),
(40, 45538, 4, 1, 10, 1),
(41, 78828, 1, 1, 11, 1),
(42, 54147, 2, 1, 11, 1),
(43, 48226, 3, 1, 11, 1),
(44, 45538, 4, 1, 11, 1),
(45, 78828, 1, 1, 12, 1),
(46, 54147, 2, 1, 12, 1),
(47, 48226, 3, 1, 12, 1),
(48, 45538, 4, 1, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ci_exp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dir` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `acceso` int NOT NULL DEFAULT '1',
  `fecha_registro` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usuario`, `password`, `nombre`, `paterno`, `materno`, `ci`, `ci_exp`, `dir`, `email`, `fono`, `tipo`, `foto`, `acceso`, `fecha_registro`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$65d4fgZsvBV5Lc/AxNKh4eoUdbGyaczQ4sSco20feSQANshNLuxSC', 'admin', NULL, NULL, '0', '', '', 'admin@gmail.com', '', 'ADMINISTRADOR', NULL, 1, '2024-01-31', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `af_lugares_publicos`
--
ALTER TABLE `af_lugares_publicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `fk_mes_id` (`mes_id`),
  ADD KEY `fk_anio_id` (`anio_id`);

--
-- Indices de la tabla `anios`
--
ALTER TABLE `anios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `atencion_medica_psicologica`
--
ALTER TABLE `atencion_medica_psicologica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `atisc_lugares_publicos`
--
ALTER TABLE `atisc_lugares_publicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `avcs_lugares_publicos`
--
ALTER TABLE `avcs_lugares_publicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `ayuda_amiga`
--
ALTER TABLE `ayuda_amiga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `ayuda_amigo`
--
ALTER TABLE `ayuda_amigo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `ayuda_dna`
--
ALTER TABLE `ayuda_dna`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `ayuda_familiar`
--
ALTER TABLE `ayuda_familiar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `ayuda_felcv`
--
ALTER TABLE `ayuda_felcv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `ayuda_oi`
--
ALTER TABLE `ayuda_oi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `ayuda_pa`
--
ALTER TABLE `ayuda_pa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `ayuda_slim`
--
ALTER TABLE `ayuda_slim`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `denuncia_agresiones`
--
ALTER TABLE `denuncia_agresiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `distritos`
--
ALTER TABLE `distritos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `distrito` (`distrito`);

--
-- Indices de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hmp_actores`
--
ALTER TABLE `hmp_actores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `hmp_poblacion`
--
ALTER TABLE `hmp_poblacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `importaciones`
--
ALTER TABLE `importaciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `archivo` (`archivo`);

--
-- Indices de la tabla `meses`
--
ALTER TABLE `meses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `no_ayuda`
--
ALTER TABLE `no_ayuda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `no_ayuda_amenaza`
--
ALTER TABLE `no_ayuda_amenaza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `no_ayuda_miedo`
--
ALTER TABLE `no_ayuda_miedo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `no_ayuda_nocreejusticia`
--
ALTER TABLE `no_ayuda_nocreejusticia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `no_ayuda_nosabia`
--
ALTER TABLE `no_ayuda_nosabia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `no_ayuda_otromotivo`
--
ALTER TABLE `no_ayuda_otromotivo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `no_ayuda_porfamilia`
--
ALTER TABLE `no_ayuda_porfamilia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `no_ayuda_sepa`
--
ALTER TABLE `no_ayuda_sepa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `no_ayuda_sinimportancia`
--
ALTER TABLE `no_ayuda_sinimportancia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `no_ayuda_verguenza`
--
ALTER TABLE `no_ayuda_verguenza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `npdf_amenaza`
--
ALTER TABLE `npdf_amenaza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `npdf_miedo`
--
ALTER TABLE `npdf_miedo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `npdf_nocreejusticia`
--
ALTER TABLE `npdf_nocreejusticia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `npdf_nosabia`
--
ALTER TABLE `npdf_nosabia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `npdf_otromotivo`
--
ALTER TABLE `npdf_otromotivo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `npdf_porfamilia`
--
ALTER TABLE `npdf_porfamilia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `npdf_sepa`
--
ALTER TABLE `npdf_sepa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `npdf_sinimportancia`
--
ALTER TABLE `npdf_sinimportancia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `npdf_verguenza`
--
ALTER TABLE `npdf_verguenza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `otrs_actores`
--
ALTER TABLE `otrs_actores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `distrito_id` (`distrito_id`),
  ADD KEY `importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `poblacion_mujeres`
--
ALTER TABLE `poblacion_mujeres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_distrito_id` (`distrito_id`),
  ADD KEY `fk_importacion_id` (`importacion_id`),
  ADD KEY `mes_id` (`mes_id`),
  ADD KEY `anio_id` (`anio_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_usuario_unique` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `af_lugares_publicos`
--
ALTER TABLE `af_lugares_publicos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `anios`
--
ALTER TABLE `anios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `atencion_medica_psicologica`
--
ALTER TABLE `atencion_medica_psicologica`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `atisc_lugares_publicos`
--
ALTER TABLE `atisc_lugares_publicos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `avcs_lugares_publicos`
--
ALTER TABLE `avcs_lugares_publicos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ayuda_amiga`
--
ALTER TABLE `ayuda_amiga`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ayuda_amigo`
--
ALTER TABLE `ayuda_amigo`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ayuda_dna`
--
ALTER TABLE `ayuda_dna`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ayuda_familiar`
--
ALTER TABLE `ayuda_familiar`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ayuda_felcv`
--
ALTER TABLE `ayuda_felcv`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ayuda_oi`
--
ALTER TABLE `ayuda_oi`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ayuda_pa`
--
ALTER TABLE `ayuda_pa`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `ayuda_slim`
--
ALTER TABLE `ayuda_slim`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `configuracions`
--
ALTER TABLE `configuracions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `denuncia_agresiones`
--
ALTER TABLE `denuncia_agresiones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `distritos`
--
ALTER TABLE `distritos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `historial_accions`
--
ALTER TABLE `historial_accions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hmp_actores`
--
ALTER TABLE `hmp_actores`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `hmp_poblacion`
--
ALTER TABLE `hmp_poblacion`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `importaciones`
--
ALTER TABLE `importaciones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `meses`
--
ALTER TABLE `meses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `no_ayuda`
--
ALTER TABLE `no_ayuda`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `no_ayuda_amenaza`
--
ALTER TABLE `no_ayuda_amenaza`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `no_ayuda_miedo`
--
ALTER TABLE `no_ayuda_miedo`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `no_ayuda_nocreejusticia`
--
ALTER TABLE `no_ayuda_nocreejusticia`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `no_ayuda_nosabia`
--
ALTER TABLE `no_ayuda_nosabia`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `no_ayuda_otromotivo`
--
ALTER TABLE `no_ayuda_otromotivo`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `no_ayuda_porfamilia`
--
ALTER TABLE `no_ayuda_porfamilia`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `no_ayuda_sepa`
--
ALTER TABLE `no_ayuda_sepa`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `no_ayuda_sinimportancia`
--
ALTER TABLE `no_ayuda_sinimportancia`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `no_ayuda_verguenza`
--
ALTER TABLE `no_ayuda_verguenza`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `npdf_amenaza`
--
ALTER TABLE `npdf_amenaza`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `npdf_miedo`
--
ALTER TABLE `npdf_miedo`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `npdf_nocreejusticia`
--
ALTER TABLE `npdf_nocreejusticia`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `npdf_nosabia`
--
ALTER TABLE `npdf_nosabia`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `npdf_otromotivo`
--
ALTER TABLE `npdf_otromotivo`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `npdf_porfamilia`
--
ALTER TABLE `npdf_porfamilia`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `npdf_sepa`
--
ALTER TABLE `npdf_sepa`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `npdf_sinimportancia`
--
ALTER TABLE `npdf_sinimportancia`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `npdf_verguenza`
--
ALTER TABLE `npdf_verguenza`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `otrs_actores`
--
ALTER TABLE `otrs_actores`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `poblacion_mujeres`
--
ALTER TABLE `poblacion_mujeres`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `af_lugares_publicos`
--
ALTER TABLE `af_lugares_publicos`
  ADD CONSTRAINT `af_lugares_publicos_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `af_lugares_publicos_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `fk_anio_id` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`),
  ADD CONSTRAINT `fk_mes_id` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`);

--
-- Filtros para la tabla `atencion_medica_psicologica`
--
ALTER TABLE `atencion_medica_psicologica`
  ADD CONSTRAINT `atencion_medica_psicologica_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `atencion_medica_psicologica_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `atencion_medica_psicologica_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `atencion_medica_psicologica_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `atisc_lugares_publicos`
--
ALTER TABLE `atisc_lugares_publicos`
  ADD CONSTRAINT `atisc_lugares_publicos_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `atisc_lugares_publicos_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `atisc_lugares_publicos_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `atisc_lugares_publicos_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `avcs_lugares_publicos`
--
ALTER TABLE `avcs_lugares_publicos`
  ADD CONSTRAINT `avcs_lugares_publicos_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `avcs_lugares_publicos_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `avcs_lugares_publicos_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `avcs_lugares_publicos_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `ayuda_amiga`
--
ALTER TABLE `ayuda_amiga`
  ADD CONSTRAINT `ayuda_amiga_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `ayuda_amiga_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `ayuda_amiga_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `ayuda_amiga_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `ayuda_amigo`
--
ALTER TABLE `ayuda_amigo`
  ADD CONSTRAINT `ayuda_amigo_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `ayuda_amigo_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `ayuda_amigo_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `ayuda_amigo_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `ayuda_dna`
--
ALTER TABLE `ayuda_dna`
  ADD CONSTRAINT `ayuda_dna_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `ayuda_dna_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `ayuda_dna_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `ayuda_dna_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `ayuda_familiar`
--
ALTER TABLE `ayuda_familiar`
  ADD CONSTRAINT `ayuda_familiar_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `ayuda_familiar_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `ayuda_familiar_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `ayuda_familiar_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `ayuda_felcv`
--
ALTER TABLE `ayuda_felcv`
  ADD CONSTRAINT `ayuda_felcv_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `ayuda_felcv_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `ayuda_felcv_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `ayuda_felcv_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `ayuda_oi`
--
ALTER TABLE `ayuda_oi`
  ADD CONSTRAINT `ayuda_oi_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `ayuda_oi_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `ayuda_oi_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `ayuda_oi_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `ayuda_pa`
--
ALTER TABLE `ayuda_pa`
  ADD CONSTRAINT `ayuda_pa_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `ayuda_pa_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `ayuda_pa_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `ayuda_pa_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `ayuda_slim`
--
ALTER TABLE `ayuda_slim`
  ADD CONSTRAINT `ayuda_slim_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `ayuda_slim_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `ayuda_slim_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `ayuda_slim_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `denuncia_agresiones`
--
ALTER TABLE `denuncia_agresiones`
  ADD CONSTRAINT `denuncia_agresiones_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `denuncia_agresiones_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `denuncia_agresiones_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `denuncia_agresiones_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `hmp_actores`
--
ALTER TABLE `hmp_actores`
  ADD CONSTRAINT `hmp_actores_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `hmp_actores_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `hmp_actores_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `hmp_actores_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `hmp_poblacion`
--
ALTER TABLE `hmp_poblacion`
  ADD CONSTRAINT `hmp_poblacion_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `hmp_poblacion_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `hmp_poblacion_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `hmp_poblacion_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `no_ayuda`
--
ALTER TABLE `no_ayuda`
  ADD CONSTRAINT `no_ayuda_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `no_ayuda_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `no_ayuda_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `no_ayuda_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `no_ayuda_amenaza`
--
ALTER TABLE `no_ayuda_amenaza`
  ADD CONSTRAINT `no_ayuda_amenaza_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `no_ayuda_amenaza_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `no_ayuda_amenaza_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `no_ayuda_amenaza_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `no_ayuda_miedo`
--
ALTER TABLE `no_ayuda_miedo`
  ADD CONSTRAINT `no_ayuda_miedo_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `no_ayuda_miedo_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `no_ayuda_miedo_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `no_ayuda_miedo_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `no_ayuda_nocreejusticia`
--
ALTER TABLE `no_ayuda_nocreejusticia`
  ADD CONSTRAINT `no_ayuda_nocreejusticia_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `no_ayuda_nocreejusticia_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `no_ayuda_nocreejusticia_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `no_ayuda_nocreejusticia_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `no_ayuda_nosabia`
--
ALTER TABLE `no_ayuda_nosabia`
  ADD CONSTRAINT `no_ayuda_nosabia_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `no_ayuda_nosabia_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `no_ayuda_nosabia_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `no_ayuda_nosabia_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `no_ayuda_otromotivo`
--
ALTER TABLE `no_ayuda_otromotivo`
  ADD CONSTRAINT `no_ayuda_otromotivo_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `no_ayuda_otromotivo_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `no_ayuda_otromotivo_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `no_ayuda_otromotivo_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `no_ayuda_porfamilia`
--
ALTER TABLE `no_ayuda_porfamilia`
  ADD CONSTRAINT `no_ayuda_porfamilia_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `no_ayuda_porfamilia_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `no_ayuda_porfamilia_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `no_ayuda_porfamilia_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `no_ayuda_sepa`
--
ALTER TABLE `no_ayuda_sepa`
  ADD CONSTRAINT `no_ayuda_sepa_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `no_ayuda_sepa_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `no_ayuda_sepa_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `no_ayuda_sepa_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `no_ayuda_sinimportancia`
--
ALTER TABLE `no_ayuda_sinimportancia`
  ADD CONSTRAINT `no_ayuda_sinimportancia_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `no_ayuda_sinimportancia_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `no_ayuda_sinimportancia_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `no_ayuda_sinimportancia_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `no_ayuda_verguenza`
--
ALTER TABLE `no_ayuda_verguenza`
  ADD CONSTRAINT `no_ayuda_verguenza_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `no_ayuda_verguenza_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `no_ayuda_verguenza_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `no_ayuda_verguenza_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `npdf_amenaza`
--
ALTER TABLE `npdf_amenaza`
  ADD CONSTRAINT `npdf_amenaza_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `npdf_amenaza_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `npdf_amenaza_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `npdf_amenaza_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `npdf_miedo`
--
ALTER TABLE `npdf_miedo`
  ADD CONSTRAINT `npdf_miedo_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `npdf_miedo_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `npdf_miedo_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `npdf_miedo_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `npdf_nocreejusticia`
--
ALTER TABLE `npdf_nocreejusticia`
  ADD CONSTRAINT `npdf_nocreejusticia_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `npdf_nocreejusticia_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `npdf_nocreejusticia_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `npdf_nocreejusticia_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `npdf_nosabia`
--
ALTER TABLE `npdf_nosabia`
  ADD CONSTRAINT `npdf_nosabia_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `npdf_nosabia_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `npdf_nosabia_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `npdf_nosabia_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `npdf_otromotivo`
--
ALTER TABLE `npdf_otromotivo`
  ADD CONSTRAINT `npdf_otromotivo_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `npdf_otromotivo_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `npdf_otromotivo_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `npdf_otromotivo_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `npdf_porfamilia`
--
ALTER TABLE `npdf_porfamilia`
  ADD CONSTRAINT `npdf_porfamilia_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `npdf_porfamilia_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `npdf_porfamilia_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `npdf_porfamilia_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `npdf_sepa`
--
ALTER TABLE `npdf_sepa`
  ADD CONSTRAINT `npdf_sepa_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `npdf_sepa_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `npdf_sepa_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `npdf_sepa_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `npdf_sinimportancia`
--
ALTER TABLE `npdf_sinimportancia`
  ADD CONSTRAINT `npdf_sinimportancia_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `npdf_sinimportancia_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `npdf_sinimportancia_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `npdf_sinimportancia_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `npdf_verguenza`
--
ALTER TABLE `npdf_verguenza`
  ADD CONSTRAINT `npdf_verguenza_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `npdf_verguenza_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `npdf_verguenza_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `npdf_verguenza_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `otrs_actores`
--
ALTER TABLE `otrs_actores`
  ADD CONSTRAINT `otrs_actores_ibfk_1` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `otrs_actores_ibfk_2` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `otrs_actores_ibfk_3` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `otrs_actores_ibfk_4` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);

--
-- Filtros para la tabla `poblacion_mujeres`
--
ALTER TABLE `poblacion_mujeres`
  ADD CONSTRAINT `fk_distrito_id` FOREIGN KEY (`distrito_id`) REFERENCES `distritos` (`id`),
  ADD CONSTRAINT `fk_importacion_id` FOREIGN KEY (`importacion_id`) REFERENCES `importaciones` (`id`),
  ADD CONSTRAINT `poblacion_mujeres_ibfk_1` FOREIGN KEY (`mes_id`) REFERENCES `meses` (`id`),
  ADD CONSTRAINT `poblacion_mujeres_ibfk_2` FOREIGN KEY (`anio_id`) REFERENCES `anios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

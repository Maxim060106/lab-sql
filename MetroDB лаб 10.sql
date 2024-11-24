-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.2
-- Время создания: Ноя 24 2024 г., 18:05
-- Версия сервера: 8.2.0
-- Версия PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `MetroDB`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Connections`
--

CREATE TABLE `Connections` (
  `ConnectionID` int NOT NULL,
  `StationID1` int DEFAULT NULL,
  `StationID2` int DEFAULT NULL,
  `ConnectionType` enum('Direct','Transfer','Triple') COLLATE utf8mb4_unicode_ci DEFAULT 'Direct'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Connections`
--

INSERT INTO `Connections` (`ConnectionID`, `StationID1`, `StationID2`, `ConnectionType`) VALUES
(2, 2, 3, 'Transfer'),
(3, 3, 4, 'Direct'),
(7, 1, 2, 'Direct'),
(8, 2, 3, 'Transfer'),
(9, 3, 4, 'Transfer'),
(13, 1, 2, 'Direct'),
(14, 2, 3, 'Transfer'),
(15, 3, 4, 'Triple');

-- --------------------------------------------------------

--
-- Структура таблицы `Lines`
--

CREATE TABLE `Lines` (
  `LineID` int NOT NULL,
  `LineName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LineColor` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Lines`
--

INSERT INTO `Lines` (`LineID`, `LineName`, `LineColor`) VALUES
(1, 'Червона лінія', 'Red'),
(2, 'Синя лінія', 'Blue');

-- --------------------------------------------------------

--
-- Структура таблицы `Stations`
--

CREATE TABLE `Stations` (
  `StationID` int NOT NULL,
  `StationName` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LineID` int DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `Stations`
--

INSERT INTO `Stations` (`StationID`, `StationName`, `LineID`, `IsActive`) VALUES
(1, 'Академмістечко', 1, 1),
(2, 'Житомирська', 1, 1),
(3, 'Театральна', 2, 1),
(4, 'Майдан Незалежності', 2, 1),
(5, 'Станція 1', 1, 1),
(6, 'Станція 2', 1, 1),
(7, 'Станція 3', 2, 1),
(8, 'Станція 4', 2, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Connections`
--
ALTER TABLE `Connections`
  ADD PRIMARY KEY (`ConnectionID`),
  ADD KEY `StationID1` (`StationID1`),
  ADD KEY `StationID2` (`StationID2`);

--
-- Индексы таблицы `Lines`
--
ALTER TABLE `Lines`
  ADD PRIMARY KEY (`LineID`);

--
-- Индексы таблицы `Stations`
--
ALTER TABLE `Stations`
  ADD PRIMARY KEY (`StationID`),
  ADD KEY `LineID` (`LineID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Connections`
--
ALTER TABLE `Connections`
  MODIFY `ConnectionID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `Lines`
--
ALTER TABLE `Lines`
  MODIFY `LineID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Stations`
--
ALTER TABLE `Stations`
  MODIFY `StationID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Connections`
--
ALTER TABLE `Connections`
  ADD CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`StationID1`) REFERENCES `Stations` (`StationID`) ON DELETE CASCADE,
  ADD CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`StationID2`) REFERENCES `Stations` (`StationID`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Stations`
--
ALTER TABLE `Stations`
  ADD CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`LineID`) REFERENCES `Lines` (`LineID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

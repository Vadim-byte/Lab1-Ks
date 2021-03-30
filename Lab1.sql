-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 30 2021 г., 16:02
-- Версия сервера: 5.6.38
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Lab1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Категорія`
--

CREATE TABLE `Категорія` (
  `Код категорії` int(11) NOT NULL,
  `Назва` varchar(34) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Категорія`
--

INSERT INTO `Категорія` (`Код категорії`, `Назва`) VALUES
(1, 'Вища'),
(2, 'Нижча');

-- --------------------------------------------------------

--
-- Структура таблицы `Пацієнт`
--

CREATE TABLE `Пацієнт` (
  `Індифікаційний код пацієнта` int(12) NOT NULL,
  `Прізвище` varchar(100) NOT NULL,
  `Ім'я` varchar(100) NOT NULL,
  `По-батькові` varchar(100) NOT NULL,
  `Вік` int(11) NOT NULL,
  `Стать` set('М','Ж','','') NOT NULL,
  `Номер телефону` int(11) NOT NULL,
  `Адреса (Місто,вулиця, будинок)` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Пацієнт`
--

INSERT INTO `Пацієнт` (`Індифікаційний код пацієнта`, `Прізвище`, `Ім'я`, `По-батькові`, `Вік`, `Стать`, `Номер телефону`, `Адреса (Місто,вулиця, будинок)`) VALUES
(55223, 'Каратуша', 'Ярослав', 'Батькович', 18, 'Ж', 95000012, '-');

-- --------------------------------------------------------

--
-- Структура таблицы `Відділення`
--

CREATE TABLE `Відділення` (
  `Код відділення` int(11) NOT NULL,
  `Назва` varchar(255) NOT NULL,
  `Кількість` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Відділення`
--

INSERT INTO `Відділення` (`Код відділення`, `Назва`, `Кількість`) VALUES
(1, 'Хірургічне', 5),
(2, 'Терапевтичне', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `Лікар`
--

CREATE TABLE `Лікар` (
  `Код лікаря` int(12) NOT NULL,
  `Прізвище` varchar(34) NOT NULL,
  `Ім'я` varchar(34) NOT NULL,
  `По-батькові` varchar(34) NOT NULL,
  `Спеціальність` varchar(34) NOT NULL,
  `Категорія` varchar(34) NOT NULL,
  `Відділення` varchar(34) NOT NULL,
  `Лікарня` varchar(34) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Лікар`
--

INSERT INTO `Лікар` (`Код лікаря`, `Прізвище`, `Ім'я`, `По-батькові`, `Спеціальність`, `Категорія`, `Відділення`, `Лікарня`) VALUES
(111111111, 'Іванов', 'Вадим', 'Віталійович', 'Хірург', 'Хірург', 'Хірургічне', 'Міська дитяча лікарня #2');

-- --------------------------------------------------------

--
-- Структура таблицы `Лікарня`
--

CREATE TABLE `Лікарня` (
  `Номер лікарні` int(9) NOT NULL,
  `Назва` varchar(50) NOT NULL,
  `Місто` varchar(50) NOT NULL,
  `Вулиця` varchar(70) NOT NULL,
  `Номер будинку` int(5) NOT NULL,
  `Номер телефону` int(10) NOT NULL,
  `Email` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Спеціалізація`
--

CREATE TABLE `Спеціалізація` (
  `Код спеціалізації` int(11) NOT NULL,
  `Назва` varchar(252) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Спеціалізація`
--

INSERT INTO `Спеціалізація` (`Код спеціалізації`, `Назва`) VALUES
(2, 'Терапевт'),
(1, 'Хірург');

-- --------------------------------------------------------

--
-- Структура таблицы `Реєстрація`
--

CREATE TABLE `Реєстрація` (
  `Номер реєстрації` int(11) NOT NULL,
  `Пацієнт` varchar(35) NOT NULL,
  `Дата запису` date NOT NULL,
  `Дата виписки` date NOT NULL,
  `Лікар` varchar(35) NOT NULL,
  `Діагноз` text NOT NULL,
  `Номер палати` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Категорія`
--
ALTER TABLE `Категорія`
  ADD PRIMARY KEY (`Код категорії`),
  ADD KEY `Назва` (`Назва`),
  ADD KEY `Назва_2` (`Назва`),
  ADD KEY `Назва_3` (`Назва`);

--
-- Индексы таблицы `Пацієнт`
--
ALTER TABLE `Пацієнт`
  ADD KEY `Прізвище` (`Прізвище`,`Ім'я`,`По-батькові`);

--
-- Индексы таблицы `Відділення`
--
ALTER TABLE `Відділення`
  ADD PRIMARY KEY (`Код відділення`),
  ADD KEY `Назва` (`Назва`),
  ADD KEY `Назва_2` (`Назва`);

--
-- Индексы таблицы `Лікар`
--
ALTER TABLE `Лікар`
  ADD UNIQUE KEY `По-батькові` (`По-батькові`),
  ADD KEY `Прізвище` (`Прізвище`,`Ім'я`,`По-батькові`),
  ADD KEY `лікар_ibfk_1` (`Спеціальність`),
  ADD KEY `1333` (`Відділення`);

--
-- Индексы таблицы `Спеціалізація`
--
ALTER TABLE `Спеціалізація`
  ADD PRIMARY KEY (`Код спеціалізації`),
  ADD KEY `Назва` (`Назва`);

--
-- Индексы таблицы `Реєстрація`
--
ALTER TABLE `Реєстрація`
  ADD PRIMARY KEY (`Номер реєстрації`),
  ADD KEY `Лікар` (`Лікар`),
  ADD KEY `21ппр` (`Пацієнт`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Категорія`
--
ALTER TABLE `Категорія`
  MODIFY `Код категорії` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Відділення`
--
ALTER TABLE `Відділення`
  MODIFY `Код відділення` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Спеціалізація`
--
ALTER TABLE `Спеціалізація`
  MODIFY `Код спеціалізації` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `Реєстрація`
--
ALTER TABLE `Реєстрація`
  MODIFY `Номер реєстрації` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Лікар`
--
ALTER TABLE `Лікар`
  ADD CONSTRAINT `1333` FOREIGN KEY (`Відділення`) REFERENCES `Відділення` (`Назва`),
  ADD CONSTRAINT `лікар_ibfk_1` FOREIGN KEY (`Спеціальність`) REFERENCES `Спеціалізація` (`Назва`);

--
-- Ограничения внешнего ключа таблицы `Реєстрація`
--
ALTER TABLE `Реєстрація`
  ADD CONSTRAINT `21ппр` FOREIGN KEY (`Пацієнт`) REFERENCES `Пацієнт` (`Прізвище`),
  ADD CONSTRAINT `реєстрація_ibfk_1` FOREIGN KEY (`Лікар`) REFERENCES `Лікар` (`Прізвище`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1-1.el7.remi
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Янв 24 2022 г., 18:20
-- Версия сервера: 5.7.35-38
-- Версия PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `booksbd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `author_id` int(10) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`author_id`, `firstname`, `surname`) VALUES
(1, 'Автор', 'Фантаст-1'),
(2, 'Автор', 'Фантаст-2'),
(3, 'Автор', 'Фантаст-3'),
(4, 'Автор', 'Фантаст-4'),
(5, 'Автор', 'Фэнтези-1'),
(6, 'Автор', 'Фэнтези-2'),
(7, 'Автор', 'Фэнтези-3'),
(8, 'Автор', 'Фэнтези-4'),
(9, 'Автор', 'Классик-1'),
(10, 'Автор', 'Классик-2'),
(11, 'Автор', 'Классик-3'),
(12, 'Автор', 'Классик-4');

-- --------------------------------------------------------

--
-- Структура таблицы `author_books`
--

CREATE TABLE `author_books` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `author_books`
--

INSERT INTO `author_books` (`id`, `book_id`, `author_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 1),
(6, 5, 2),
(7, 6, 2),
(8, 6, 3),
(9, 7, 2),
(10, 7, 3),
(11, 8, 3),
(12, 8, 4),
(13, 9, 5),
(14, 10, 6),
(15, 11, 7),
(16, 12, 8),
(17, 13, 5),
(18, 13, 6),
(19, 14, 6),
(20, 14, 7),
(21, 15, 7),
(22, 15, 8),
(23, 16, 5),
(24, 16, 8),
(25, 17, 9),
(26, 18, 10),
(27, 19, 11),
(28, 20, 12),
(29, 21, 9),
(30, 21, 12),
(31, 22, 10),
(32, 22, 12),
(33, 23, 10),
(34, 23, 11),
(35, 24, 11),
(36, 24, 12),
(37, 25, 2),
(38, 26, 3),
(39, 27, 2),
(40, 27, 5),
(41, 28, 2),
(42, 28, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `book_id` int(10) NOT NULL,
  `ISBN` varchar(13) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `pages` int(11) NOT NULL DEFAULT '0',
  `pub_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`book_id`, `ISBN`, `book_name`, `pages`, `pub_date`) VALUES
(1, '9786176390763', 'Книга-1. Фантастика (1 автор)', 137, '1994-03-08'),
(2, '9786176390764', 'Книга-2. Фантастика (1 автор)', 290, '2014-06-18'),
(3, '9786176390765', 'Книга-3. Фантастика (1 автор)', 371, '1997-08-19'),
(4, '9786176390766', 'Книга-4. Фантастика (1 автор)', 296, '2013-03-26'),
(5, '9786176390767', 'Книга-1. Фантастика (соавторы)', 438, '2020-07-15'),
(6, '9786176390768', 'Книга-2. Фантастика (соавторы)', 473, '2006-03-14'),
(7, '9786176390769', 'Книга-3. Фантастика (соавторы)', 195, '2002-11-20'),
(8, '9786176390770', 'Книга-4. Фантастика (соавторы)', 251, '2018-05-17'),
(9, '9786176390771', 'Книга-1. Фэнтези (1 автор)', 170, '2020-01-22'),
(10, '9786176390772', 'Книга-2. Фэнтези (1 автор)', 193, '2014-02-05'),
(11, '9786176390773', 'Книга-3. Фэнтези (1 автор)', 485, '2021-05-24'),
(12, '9786176390774', 'Книга-4. Фэнтези (1 автор)', 249, '1997-06-20'),
(13, '9786176390775', 'Книга-1. Фэнтези (соавторы)', 364, '2014-01-20'),
(14, '9786176390776', 'Книга-2. Фэнтези (соавторы)', 410, '2003-05-03'),
(15, '9786176390777', 'Книга-3. Фэнтези (соавторы)', 101, '2004-11-03'),
(16, '9786176390778', 'Книга-4. Фэнтези (соавторы)', 412, '1995-02-17'),
(17, '9786176390779', 'Книга-1. Классика (1 автор)', 376, '2011-06-17'),
(18, '9786176390780', 'Книга-2. Классика (1 автор)', 430, '2001-09-03'),
(19, '9786176390781', 'Книга-3. Классика (1 автор)', 337, '1997-12-21'),
(20, '9786176390782', 'Книга-4. Классика (1 автор)', 220, '1993-11-09'),
(21, '9786176390783', 'Книга-1. Классика (соавторы)', 208, '2002-04-06'),
(22, '9786176390784', 'Книга-2. Классика (соавторы)', 113, '1991-11-12'),
(23, '9786176390785', 'Книга-3. Классика (соавторы)', 302, '1997-05-02'),
(24, '9786176390786', 'Книга-4. Классика (соавторы)', 220, '2008-04-18'),
(25, '9786176390787', 'Книга-1. Классическая Фантастика (1 автор)', 237, '1988-03-27'),
(26, '9786176390788', 'Книга-2. Классическая Фантастика (1 автор)', 402, '2002-02-11'),
(27, '9786176390789', 'Книга-1. Классическая Фантастика (соавторы)', 365, '2020-02-21'),
(28, '9786176390790', 'Книга-2. Классическая Фантастика (соавторы)', 346, '2016-06-03');

-- --------------------------------------------------------

--
-- Структура таблицы `genres`
--

CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES
(1, 'Фантастика'),
(2, 'Фэнтези'),
(3, 'Классика');

-- --------------------------------------------------------

--
-- Структура таблицы `genres_book`
--

CREATE TABLE `genres_book` (
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `genres_book`
--

INSERT INTO `genres_book` (`book_id`, `genre_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 1),
(25, 3),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Индексы таблицы `author_books`
--
ALTER TABLE `author_books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `ISBN` (`ISBN`);

--
-- Индексы таблицы `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Индексы таблицы `genres_book`
--
ALTER TABLE `genres_book`
  ADD KEY `book_id` (`book_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `author_books`
--
ALTER TABLE `author_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `author_books`
--
ALTER TABLE `author_books`
  ADD CONSTRAINT `author_books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`),
  ADD CONSTRAINT `author_books_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);

--
-- Ограничения внешнего ключа таблицы `genres_book`
--
ALTER TABLE `genres_book`
  ADD CONSTRAINT `genres_book_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `genres_book_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 12 2024 г., 19:34
-- Версия сервера: 8.2.0
-- Версия PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `first_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_name` varchar(45) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`author_id`, `author_name`) VALUES
(1, 'Макаров'),
(2, 'Иванов'),
(3, 'Петров'),
(4, 'Сидоров');

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_name` varchar(100) NOT NULL,
  `book_author` varchar(100) NOT NULL,
  `year_of_publication` smallint UNSIGNED NOT NULL,
  `book_genre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `book_name`, `book_author`, `year_of_publication`, `book_genre`) VALUES
(1, 'Повелитель мух', 'Уильям Голдинг', 1954, 'Роман');

-- --------------------------------------------------------

--
-- Структура таблицы `books_new`
--

DROP TABLE IF EXISTS `books_new`;
CREATE TABLE IF NOT EXISTS `books_new` (
  `book_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_title` varchar(45) NOT NULL,
  `author_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`book_id`),
  KEY `authors_fk_idx` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `books_new`
--

INSERT INTO `books_new` (`book_id`, `book_title`, `author_id`) VALUES
(1, 'Про Собак', 1),
(2, 'Про Собак', 2),
(3, 'Про Собак', 3),
(4, 'Про Кошек', 2),
(5, 'Про Птиц', 1),
(6, 'Про Птиц', 2),
(7, 'Про Лошадей', 3),
(8, 'Про Лошадей', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'cats'),
(2, 'dogs');

-- --------------------------------------------------------

--
-- Структура таблицы `category_post`
--

DROP TABLE IF EXISTS `category_post`;
CREATE TABLE IF NOT EXISTS `category_post` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int UNSIGNED DEFAULT NULL,
  `post_id` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_fk_idx` (`category_id`),
  KEY `post_fk_idx` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `category_post`
--

INSERT INTO `category_post` (`id`, `category_id`, `post_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(4, 2, 2),
(5, 2, 3),
(6, 2, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`) VALUES
(1, 'Рисование'),
(2, 'Пение'),
(4, ''),
(5, 'Хоровод');

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(45) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`) VALUES
(1, 'Маркетинг'),
(2, 'Разработка'),
(3, 'Продажи'),
(4, 'Лаборанты');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(45) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `department_fk_idx` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`employee_id`, `employee_name`, `department_id`) VALUES
(1, 'Роман', 1),
(2, 'Игор', 2),
(3, 'Светлана', 2),
(4, 'ПАвел', 2),
(7, 'Саня', 3),
(8, 'Леха', 3),
(9, 'Катя', 4),
(10, 'Вася', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`group_id`, `group_name`) VALUES
(1, '700'),
(2, '701'),
(3, '702'),
(4, '703');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` varchar(45) NOT NULL,
  `like` bigint UNSIGNED DEFAULT '0',
  `is_published` tinyint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `like`, `is_published`) VALUES
(1, 'first post', 'content', 100, 1),
(2, 'ssecond post', 'content', 11, 1),
(3, 'third post', 'content', 100, 1),
(4, '4th post', 'content', 111, 1),
(5, '5th o post', 'content', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `price` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `price`) VALUES
(1, 'мука', 990),
(2, 'сахар', 1000),
(3, 'картошка', 1100),
(4, 'яблоки', 1200),
(5, 'шпинат', 500),
(6, 'бананы', 2000),
(7, 'лобстер', 5000),
(8, 'орешки', 1300);

-- --------------------------------------------------------

--
-- Структура таблицы `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `students_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_name` varchar(100) NOT NULL,
  `student_surname` varchar(100) NOT NULL,
  `student_birthdate` date NOT NULL,
  `student_gpa` decimal(10,0) UNSIGNED DEFAULT '0',
  `courses_id` int UNSIGNED DEFAULT NULL,
  `group_id` int UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`students_id`),
  KEY `courses_fk_idx` (`courses_id`),
  KEY `group_fk_idx` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `students`
--

INSERT INTO `students` (`students_id`, `student_name`, `student_surname`, `student_birthdate`, `student_gpa`, `courses_id`, `group_id`) VALUES
(1, 'Паша', '', '0000-00-00', 0, 1, 1),
(2, 'Маша', '', '0000-00-00', 0, 1, 1),
(3, 'Саша', '', '0000-00-00', 0, 2, 2),
(4, 'Леша', '', '0000-00-00', 0, 2, 3),
(7, 'Ира', '', '0000-00-00', 0, 4, 4),
(8, 'Ваня', '', '0000-00-00', 0, 5, 4);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `books_new`
--
ALTER TABLE `books_new`
  ADD CONSTRAINT `authors_fk` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`);

--
-- Ограничения внешнего ключа таблицы `category_post`
--
ALTER TABLE `category_post`
  ADD CONSTRAINT `category_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `post_fk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `department_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Ограничения внешнего ключа таблицы `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `courses_fk` FOREIGN KEY (`courses_id`) REFERENCES `courses` (`course_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_fk` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

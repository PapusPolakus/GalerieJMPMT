-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 16 Lis 2021, 21:02
-- Wersja serwera: 10.4.14-MariaDB
-- Wersja PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `strona_galeria_v2`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(24) COLLATE utf8_polish_ci NOT NULL,
  `Password` text COLLATE utf8_polish_ci NOT NULL,
  `E_mail` text COLLATE utf8_polish_ci NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------


--
-- Struktura tabeli dla tabeli `gallery`
--

CREATE TABLE `gallery` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_User` bigint(20) UNSIGNED NOT NULL,
  `Gallery_Name` varchar(24) COLLATE utf8_polish_ci NOT NULL,
  `Gallery_Creation_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Albums_Number` bigint(20) UNSIGNED NOT NULL,
  `Files_Size` bigint(20) UNSIGNED NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `id` (`id`),
	FOREIGN KEY(`id_User`) REFERENCES `user`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `album`
--

CREATE TABLE `album` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_Gallery` bigint(20) UNSIGNED NOT NULL,
  `id_User` bigint(20) UNSIGNED NOT NULL,
  `Album_Name` varchar(24) COLLATE utf8_polish_ci NOT NULL,
  `Album_Creation_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Images_number` bigint(20) UNSIGNED NOT NULL,
  `Files_Size` bigint(20) UNSIGNED NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `id` (`id`),
	FOREIGN KEY(`id_Gallery`) REFERENCES `gallery`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `image`
--

CREATE TABLE `image` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_Album` bigint(20) UNSIGNED NOT NULL,
  `id_User` bigint(20) UNSIGNED NOT NULL,
  `Image_name` varchar(24) COLLATE utf8_polish_ci NOT NULL,
  `Image_Upload_Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Tags_Number` bigint(20) UNSIGNED NOT NULL,
  `Comments_Number` bigint(20) UNSIGNED NOT NULL,
  `File_Size` bigint(20) UNSIGNED NOT NULL,
  `File_Link` text COLLATE utf8_polish_ci NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `id` (`id`),
	FOREIGN KEY(`id_Album`) REFERENCES `album`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_User` bigint(20) UNSIGNED NOT NULL,
  `id_Image` bigint(20) UNSIGNED NOT NULL,
  `Comment_text` text COLLATE utf8_polish_ci NOT NULL,
  `Comment_Creation_Date` timestamp NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`id`),
	UNIQUE KEY `id` (`id`),
	FOREIGN KEY(`id_Image`) REFERENCES `image`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tag`
--

CREATE TABLE `tag` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Tag_Name` varchar(24) COLLATE utf8_polish_ci NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `tag_image`
--

CREATE TABLE `tag_image` (
  `id_Image` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_Tag` bigint(20) UNSIGNED NOT NULL,
	PRIMARY KEY (`id_Image`,`id_Tag`),
	FOREIGN KEY(`id_Image`) REFERENCES `image`(`id`),
	FOREIGN KEY(`id_Tag`) REFERENCES `tag`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

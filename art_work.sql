-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 30, 2020 at 10:31 AM
-- Server version: 8.0.20-0ubuntu0.19.10.1
-- PHP Version: 7.3.11-1+ubuntu19.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `art_work`
--

-- --------------------------------------------------------

--
-- Table structure for table `another_galleries`
--

CREATE TABLE `another_galleries` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `loan_start_date` date NOT NULL,
  `loan_end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `other_information` varchar(200) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `date_of_death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `artist_art`
--

CREATE TABLE `artist_art` (
  `artist_id` int NOT NULL,
  `art_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `arts`
--

CREATE TABLE `arts` (
  `id` int NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `other_information` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `art_presence`
--

CREATE TABLE `art_presence` (
  `id` int NOT NULL,
  `art_presence enum` enum('display_at_the_museum','held_in_storage','traveling_show','loan_to_another_gallery') NOT NULL DEFAULT 'display_at_the_museum',
  `art_id` int NOT NULL,
  `museum_id` int DEFAULT NULL,
  `traveling_show_id` int DEFAULT NULL,
  `another_gallery_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `museums`
--

CREATE TABLE `museums` (
  `id` int NOT NULL,
  `location_in_museum` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `traveling_shows`
--

CREATE TABLE `traveling_shows` (
  `id` int NOT NULL,
  `city` varchar(50) NOT NULL,
  `traveling_show_start_date` date NOT NULL,
  `traveling_show_end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `another_galleries`
--
ALTER TABLE `another_galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artist_art`
--
ALTER TABLE `artist_art`
  ADD PRIMARY KEY (`artist_id`,`art_id`),
  ADD KEY `art_id` (`art_id`);

--
-- Indexes for table `arts`
--
ALTER TABLE `arts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_code` (`item_code`);

--
-- Indexes for table `art_presence`
--
ALTER TABLE `art_presence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `art_id` (`art_id`),
  ADD KEY `museum_id` (`museum_id`),
  ADD KEY `traveling_show_id` (`traveling_show_id`),
  ADD KEY `another_gallery_id` (`another_gallery_id`);

--
-- Indexes for table `museums`
--
ALTER TABLE `museums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `traveling_shows`
--
ALTER TABLE `traveling_shows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `another_galleries`
--
ALTER TABLE `another_galleries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `arts`
--
ALTER TABLE `arts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `art_presence`
--
ALTER TABLE `art_presence`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artist_art`
--
ALTER TABLE `artist_art`
  ADD CONSTRAINT `artist_art_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  ADD CONSTRAINT `artist_art_ibfk_2` FOREIGN KEY (`art_id`) REFERENCES `arts` (`id`);

--
-- Constraints for table `art_presence`
--
ALTER TABLE `art_presence`
  ADD CONSTRAINT `another_gallery_id` FOREIGN KEY (`another_gallery_id`) REFERENCES `another_galleries` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `art_id` FOREIGN KEY (`art_id`) REFERENCES `arts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `museum_id` FOREIGN KEY (`museum_id`) REFERENCES `museums` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `traveling_show_id` FOREIGN KEY (`traveling_show_id`) REFERENCES `traveling_shows` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

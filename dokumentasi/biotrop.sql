-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2017 at 04:16 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biotrop`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id_city` int(11) NOT NULL,
  `name_city` varchar(50) NOT NULL,
  `province_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id_class` int(11) NOT NULL,
  `name_class` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `collector`
--

CREATE TABLE `collector` (
  `id_collector` int(11) NOT NULL,
  `name_collector` varchar(255) NOT NULL,
  `tim_collector` varchar(255) NOT NULL,
  `date_collector` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `familly`
--

CREATE TABLE `familly` (
  `id_family` int(11) NOT NULL,
  `nama_familly` varchar(255) NOT NULL,
  `ordo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `genus`
--

CREATE TABLE `genus` (
  `id_genus` int(11) NOT NULL,
  `name_genus` varchar(255) NOT NULL,
  `familly_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `habitat`
--

CREATE TABLE `habitat` (
  `id_habitat` int(11) NOT NULL,
  `habitat` varchar(255) NOT NULL,
  `forma` varchar(255) NOT NULL,
  `phenology` varchar(255) NOT NULL,
  `ecologi` varchar(255) NOT NULL,
  `biologi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `habitus`
--

CREATE TABLE `habitus` (
  `id_habitus` int(11) NOT NULL,
  `name_habitus` varchar(255) NOT NULL,
  `inflorecence` varchar(255) NOT NULL,
  `leaf` blob NOT NULL,
  `root` blob NOT NULL,
  `steam` blob NOT NULL,
  `fruit` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id_location` int(11) NOT NULL,
  `latitude` geometrycollection NOT NULL,
  `longitude` geometrycollection NOT NULL,
  `atitude` geometrycollection NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordo`
--

CREATE TABLE `ordo` (
  `id_ordo` int(11) NOT NULL,
  `nama_ordo` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `id_province` int(11) NOT NULL,
  `name_province` text NOT NULL,
  `state_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `speciment_herbarium`
--

CREATE TABLE `speciment_herbarium` (
  `id_speciment` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `collector_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `spesies_id` int(11) NOT NULL,
  `status_speciment` tinyint(1) NOT NULL,
  `name_speciment` varchar(255) NOT NULL,
  `number_speciment` int(11) NOT NULL,
  `label_speciment` varchar(30) NOT NULL,
  `type_herbarium` tinyint(1) NOT NULL,
  `status_verifiedData` tinyint(1) NOT NULL,
  `time_verifiedData` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_speciment` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `speciment_ias`
--

CREATE TABLE `speciment_ias` (
  `id_speciment` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `collector_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `spesies_id` int(11) NOT NULL,
  `status_speciment` tinyint(1) NOT NULL,
  `name_speciment` varchar(255) NOT NULL,
  `number_speciment` varchar(30) NOT NULL,
  `label_speciment` tinyint(1) NOT NULL,
  `status_verifiedData` tinyint(1) NOT NULL,
  `time_verifiedData` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_speciment` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `spesies`
--

CREATE TABLE `spesies` (
  `id_species` int(11) NOT NULL,
  `nama_species` varchar(255) NOT NULL,
  `utilization` text NOT NULL,
  `control` text NOT NULL,
  `agricimport` text NOT NULL,
  `habitus_id` int(11) NOT NULL,
  `vernacular_id` int(11) NOT NULL,
  `habitat_id` int(11) NOT NULL,
  `genus_id` int(11) NOT NULL,
  `descripsi_spesies` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id_state` int(11) NOT NULL,
  `name_state` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `type_spesimen`
--

CREATE TABLE `type_spesimen` (
  `id_type_spesimen` int(11) NOT NULL,
  `name_type` varchar(255) NOT NULL,
  `speciment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `remember_token` varchar(100) NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `firstname`, `lastname`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'admin@gmail.com', 'admin', 'Mr', '$2y$10$Q62AXWNku7OUIQEiB0SaMuW01.RnPpcUmOXz7uyS2.kc3FTDgtzIq', 'lMKYeKXUZu0qtm3B11xoCp4cBfk92F3lREKPl3v140J9Hw3tOwU4EpDRxIMB', '2017-07-21 08:24:08', '2017-07-20 23:54:32', '2017-07-20 23:54:32'),
(3, 'admin', 'admin@gmail.com', 'admin', 'Mr', '$2y$10$97vcr0dlK9MgyfB0u5kBrOoETLlzZehr9r9xlObuJfwbtXOTUrBzS', 'Z1Bxrly22Y', '2017-07-21 07:09:51', '2017-07-21 00:09:51', '2017-07-21 00:09:51');

-- --------------------------------------------------------

--
-- Table structure for table `vernacular`
--

CREATE TABLE `vernacular` (
  `id_vernacular` int(11) NOT NULL,
  `vernacular_name` varchar(255) NOT NULL,
  `vernacular_name_indo` varchar(255) NOT NULL,
  `vernacular_name_local` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city`),
  ADD KEY `province_id` (`province_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id_class`);

--
-- Indexes for table `collector`
--
ALTER TABLE `collector`
  ADD PRIMARY KEY (`id_collector`);

--
-- Indexes for table `familly`
--
ALTER TABLE `familly`
  ADD PRIMARY KEY (`id_family`),
  ADD KEY `familly_ibfk_1` (`ordo_id`);

--
-- Indexes for table `genus`
--
ALTER TABLE `genus`
  ADD PRIMARY KEY (`id_genus`),
  ADD KEY `genus_ibfk_1` (`familly_id`);

--
-- Indexes for table `habitat`
--
ALTER TABLE `habitat`
  ADD PRIMARY KEY (`id_habitat`);

--
-- Indexes for table `habitus`
--
ALTER TABLE `habitus`
  ADD PRIMARY KEY (`id_habitus`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`),
  ADD KEY `location_ibfk_1` (`city_id`);

--
-- Indexes for table `ordo`
--
ALTER TABLE `ordo`
  ADD PRIMARY KEY (`id_ordo`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id_province`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `speciment_herbarium`
--
ALTER TABLE `speciment_herbarium`
  ADD PRIMARY KEY (`id_speciment`),
  ADD KEY `collector_id` (`collector_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `spesies_id` (`spesies_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `speciment_ias`
--
ALTER TABLE `speciment_ias`
  ADD PRIMARY KEY (`id_speciment`),
  ADD KEY `collector_id` (`collector_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `speciment_ibfk_3` (`spesies_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `spesies`
--
ALTER TABLE `spesies`
  ADD PRIMARY KEY (`id_species`),
  ADD KEY `spesies_ibfk_1` (`genus_id`),
  ADD KEY `spesies_ibfk_2` (`habitat_id`),
  ADD KEY `spesies_ibfk_3` (`habitus_id`),
  ADD KEY `spesies_ibfk_4` (`vernacular_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id_state`);

--
-- Indexes for table `type_spesimen`
--
ALTER TABLE `type_spesimen`
  ADD PRIMARY KEY (`id_type_spesimen`),
  ADD KEY `speciment_id` (`speciment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vernacular`
--
ALTER TABLE `vernacular`
  ADD PRIMARY KEY (`id_vernacular`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id_province`);

--
-- Constraints for table `familly`
--
ALTER TABLE `familly`
  ADD CONSTRAINT `familly_ibfk_1` FOREIGN KEY (`ordo_id`) REFERENCES `ordo` (`id_ordo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `genus`
--
ALTER TABLE `genus`
  ADD CONSTRAINT `genus_ibfk_1` FOREIGN KEY (`familly_id`) REFERENCES `familly` (`id_family`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id_city`);

--
-- Constraints for table `ordo`
--
ALTER TABLE `ordo`
  ADD CONSTRAINT `ordo_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id_class`);

--
-- Constraints for table `province`
--
ALTER TABLE `province`
  ADD CONSTRAINT `province_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id_state`);

--
-- Constraints for table `speciment_herbarium`
--
ALTER TABLE `speciment_herbarium`
  ADD CONSTRAINT `speciment_herbarium_ibfk_1` FOREIGN KEY (`collector_id`) REFERENCES `collector` (`id_collector`),
  ADD CONSTRAINT `speciment_herbarium_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id_location`),
  ADD CONSTRAINT `speciment_herbarium_ibfk_3` FOREIGN KEY (`spesies_id`) REFERENCES `spesies` (`id_species`),
  ADD CONSTRAINT `speciment_herbarium_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `speciment_ias`
--
ALTER TABLE `speciment_ias`
  ADD CONSTRAINT `speciment_ias_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id_location`),
  ADD CONSTRAINT `speciment_ias_ibfk_2` FOREIGN KEY (`spesies_id`) REFERENCES `spesies` (`id_species`),
  ADD CONSTRAINT `speciment_ias_ibfk_3` FOREIGN KEY (`collector_id`) REFERENCES `collector` (`id_collector`),
  ADD CONSTRAINT `speciment_ias_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `spesies`
--
ALTER TABLE `spesies`
  ADD CONSTRAINT `spesies_ibfk_1` FOREIGN KEY (`genus_id`) REFERENCES `genus` (`id_genus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `spesies_ibfk_2` FOREIGN KEY (`habitat_id`) REFERENCES `habitat` (`id_habitat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `spesies_ibfk_3` FOREIGN KEY (`habitus_id`) REFERENCES `habitus` (`id_habitus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `spesies_ibfk_4` FOREIGN KEY (`vernacular_id`) REFERENCES `vernacular` (`id_vernacular`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `type_spesimen`
--
ALTER TABLE `type_spesimen`
  ADD CONSTRAINT `type_spesimen_ibfk_1` FOREIGN KEY (`speciment_id`) REFERENCES `speciment_herbarium` (`id_speciment`),
  ADD CONSTRAINT `type_spesimen_ibfk_2` FOREIGN KEY (`speciment_id`) REFERENCES `speciment_ias` (`id_speciment`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

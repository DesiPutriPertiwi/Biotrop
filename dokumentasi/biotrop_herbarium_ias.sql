-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2017 at 04:30 AM
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
-- Database: `biotrop_herbarium_ias`
--

-- --------------------------------------------------------

--
-- Table structure for table `author_identification`
--

CREATE TABLE `author_identification` (
  `id_author` int(11) NOT NULL,
  `name_author` varchar(255) NOT NULL,
  `date_identification` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `characteristic_species`
--

CREATE TABLE `characteristic_species` (
  `id_character` int(11) NOT NULL,
  `picture_species` longtext,
  `description_leaf` varchar(255) DEFAULT NULL,
  `description_root` varchar(255) DEFAULT NULL,
  `description_fruit` varchar(255) DEFAULT NULL,
  `description_steam` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id_city` int(11) NOT NULL,
  `name_city` varchar(100) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id_class` int(11) NOT NULL,
  `name_class` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `collector`
--

CREATE TABLE `collector` (
  `id_collector` int(11) NOT NULL,
  `name-collector` varchar(255) NOT NULL,
  `tim_collector` varchar(255) DEFAULT NULL,
  `date_collection` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `number_collector` int(11) NOT NULL,
  `contact` int(11) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `controll`
--

CREATE TABLE `controll` (
  `id_controll` int(11) NOT NULL,
  `chemical_ctrl` text,
  `manual_ctrl` text,
  `biologycal_ctrl` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `id_district` int(11) NOT NULL,
  `name_district` varchar(300) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `familly`
--

CREATE TABLE `familly` (
  `id_familly` int(11) NOT NULL,
  `name_genus` varchar(255) NOT NULL,
  `ordo_id` int(11) DEFAULT NULL,
  `family_synonim` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `genus`
--

CREATE TABLE `genus` (
  `id_genus` int(11) NOT NULL,
  `name_genus` varchar(255) NOT NULL,
  `familly_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `herbarium_label`
--

CREATE TABLE `herbarium_label` (
  `id_label` int(11) NOT NULL,
  `label_gulma` int(11) NOT NULL,
  `label_hutan` int(11) NOT NULL,
  `label_beovita` int(11) NOT NULL,
  `label_liken` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id_location` int(11) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `atitude` varchar(255) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `distribution_specimen` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ordo`
--

CREATE TABLE `ordo` (
  `id_ordo` int(11) NOT NULL,
  `name_ordo` varchar(255) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `id_province` int(11) NOT NULL,
  `name_province` varchar(100) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `species`
--

CREATE TABLE `species` (
  `id_species` int(11) NOT NULL,
  `name_species` varchar(255) NOT NULL,
  `description_species` varchar(255) DEFAULT NULL,
  `agricimport` varchar(255) DEFAULT NULL,
  `genus_id` int(11) NOT NULL,
  `vernacular_id` int(11) DEFAULT NULL,
  `species_synonim` varchar(255) DEFAULT NULL,
  `forma` varchar(255) DEFAULT NULL,
  `subspecies` varchar(255) DEFAULT NULL,
  `habitat` varchar(255) DEFAULT NULL,
  `phenology` varchar(255) DEFAULT NULL,
  `ecology` varchar(255) DEFAULT NULL,
  `biology` varchar(255) DEFAULT NULL,
  `inflorencence` varchar(255) DEFAULT NULL,
  `habitus` varchar(255) DEFAULT NULL,
  `character_id` int(11) NOT NULL,
  `origin_species` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `speciment_herbarium`
--

CREATE TABLE `speciment_herbarium` (
  `id_herbarium` int(11) NOT NULL,
  `statusHerbarium_id` int(11) DEFAULT NULL,
  `name_herbarium` varchar(255) NOT NULL,
  `number_herbarium` int(11) NOT NULL,
  `type_herbarium` int(1) NOT NULL,
  `utilization` text,
  `comment_herbarium` text,
  `collector_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `species_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `verifiedData_id` int(11) NOT NULL,
  `authorIdentification_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `speciment_ias`
--

CREATE TABLE `speciment_ias` (
  `id_ias` int(11) NOT NULL,
  `name_ias` varchar(255) NOT NULL,
  `type_ias` tinyint(1) NOT NULL,
  `impact_ias` text,
  `comment_ias` text,
  `location_id` int(11) NOT NULL,
  `species_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `control_id` int(11) DEFAULT NULL,
  `prevention` text,
  `utilization` text,
  `risk_analisis` text,
  `reference` text,
  `verifiedData_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id_state` int(11) NOT NULL,
  `name_state` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `status_specimen`
--

CREATE TABLE `status_specimen` (
  `id_status` int(11) NOT NULL,
  `type_status` tinyint(1) DEFAULT NULL,
  `destination_duplicate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(191) NOT NULL,
  `firstname` varchar(191) NOT NULL,
  `lastname` varchar(191) NOT NULL,
  `remember_token` varchar(191) NOT NULL,
  `deleted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `firstname`, `lastname`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'admin@gmail.com', '$2y$10$L1cVoN18YGK3FYiUNtR4muLMs0N30Nzj1uChpkJGi4uCzSN.7rEHO', 'admin', 'biotrop', 'yvlwRFY9CcvZVuusGtbneJwTsPNSY4MAjSI5v9HhV7AFHcbLmVwqL4RNhfhc', '2017-07-25 16:36:40', '2017-07-24 00:26:37', '2017-07-25 09:36:40');

-- --------------------------------------------------------

--
-- Table structure for table `venacular`
--

CREATE TABLE `venacular` (
  `id_venacular` int(11) NOT NULL,
  `venacular_name` varchar(255) DEFAULT NULL,
  `venacular_name_indo` varchar(255) DEFAULT NULL,
  `venacular_name_local` varchar(255) DEFAULT NULL,
  `common_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `verified`
--

CREATE TABLE `verified` (
  `id_verified` int(11) NOT NULL,
  `status_verified` tinyint(1) NOT NULL,
  `time_verified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vilage`
--

CREATE TABLE `vilage` (
  `id_vilage` int(11) NOT NULL,
  `name_vilage` varchar(255) DEFAULT NULL,
  `distric_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author_identification`
--
ALTER TABLE `author_identification`
  ADD PRIMARY KEY (`id_author`);

--
-- Indexes for table `characteristic_species`
--
ALTER TABLE `characteristic_species`
  ADD PRIMARY KEY (`id_character`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city`),
  ADD KEY `city_fk0` (`province_id`);

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
-- Indexes for table `controll`
--
ALTER TABLE `controll`
  ADD PRIMARY KEY (`id_controll`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`id_district`),
  ADD KEY `district_fk0` (`city_id`);

--
-- Indexes for table `familly`
--
ALTER TABLE `familly`
  ADD PRIMARY KEY (`id_familly`),
  ADD KEY `familly_fk0` (`ordo_id`);

--
-- Indexes for table `genus`
--
ALTER TABLE `genus`
  ADD PRIMARY KEY (`id_genus`),
  ADD KEY `genus_fk0` (`familly_id`);

--
-- Indexes for table `herbarium_label`
--
ALTER TABLE `herbarium_label`
  ADD PRIMARY KEY (`id_label`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`),
  ADD KEY `location_fk0` (`district_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordo`
--
ALTER TABLE `ordo`
  ADD PRIMARY KEY (`id_ordo`),
  ADD KEY `ordo_fk0` (`class_id`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id_province`),
  ADD KEY `province_fk0` (`state_id`);

--
-- Indexes for table `species`
--
ALTER TABLE `species`
  ADD PRIMARY KEY (`id_species`),
  ADD KEY `species_fk0` (`genus_id`),
  ADD KEY `species_fk1` (`vernacular_id`),
  ADD KEY `character_id` (`character_id`);

--
-- Indexes for table `speciment_herbarium`
--
ALTER TABLE `speciment_herbarium`
  ADD PRIMARY KEY (`id_herbarium`),
  ADD KEY `speciment_herbarium_fk0` (`collector_id`),
  ADD KEY `speciment_herbarium_fk1` (`location_id`),
  ADD KEY `speciment_herbarium_fk2` (`species_id`),
  ADD KEY `speciment_herbarium_fk3` (`user_id`),
  ADD KEY `label_id` (`label_id`),
  ADD KEY `verifiedData_id` (`verifiedData_id`),
  ADD KEY `authorIdentification_id` (`authorIdentification_id`);

--
-- Indexes for table `speciment_ias`
--
ALTER TABLE `speciment_ias`
  ADD PRIMARY KEY (`id_ias`),
  ADD KEY `speciment_ias_fk1` (`location_id`),
  ADD KEY `speciment_ias_fk2` (`species_id`),
  ADD KEY `speciment_ias_fk3` (`user_id`),
  ADD KEY `verifiedData_id` (`verifiedData_id`),
  ADD KEY `control_id` (`control_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id_state`);

--
-- Indexes for table `status_specimen`
--
ALTER TABLE `status_specimen`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venacular`
--
ALTER TABLE `venacular`
  ADD PRIMARY KEY (`id_venacular`);

--
-- Indexes for table `verified`
--
ALTER TABLE `verified`
  ADD PRIMARY KEY (`id_verified`);

--
-- Indexes for table `vilage`
--
ALTER TABLE `vilage`
  ADD PRIMARY KEY (`id_vilage`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author_identification`
--
ALTER TABLE `author_identification`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `characteristic_species`
--
ALTER TABLE `characteristic_species`
  MODIFY `id_character` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id_class` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `collector`
--
ALTER TABLE `collector`
  MODIFY `id_collector` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `controll`
--
ALTER TABLE `controll`
  MODIFY `id_controll` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `id_district` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `familly`
--
ALTER TABLE `familly`
  MODIFY `id_familly` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `genus`
--
ALTER TABLE `genus`
  MODIFY `id_genus` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id_location` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ordo`
--
ALTER TABLE `ordo`
  MODIFY `id_ordo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id_province` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `speciment_herbarium`
--
ALTER TABLE `speciment_herbarium`
  MODIFY `id_herbarium` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `speciment_ias`
--
ALTER TABLE `speciment_ias`
  MODIFY `id_ias` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id_state` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `status_specimen`
--
ALTER TABLE `status_specimen`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `venacular`
--
ALTER TABLE `venacular`
  MODIFY `id_venacular` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `verified`
--
ALTER TABLE `verified`
  MODIFY `id_verified` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `vilage`
--
ALTER TABLE `vilage`
  MODIFY `id_vilage` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_fk0` FOREIGN KEY (`province_id`) REFERENCES `province` (`id_province`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_fk0` FOREIGN KEY (`city_id`) REFERENCES `city` (`id_city`);

--
-- Constraints for table `familly`
--
ALTER TABLE `familly`
  ADD CONSTRAINT `familly_fk0` FOREIGN KEY (`ordo_id`) REFERENCES `ordo` (`id_ordo`);

--
-- Constraints for table `genus`
--
ALTER TABLE `genus`
  ADD CONSTRAINT `genus_fk0` FOREIGN KEY (`familly_id`) REFERENCES `familly` (`id_familly`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_fk0` FOREIGN KEY (`district_id`) REFERENCES `district` (`id_district`);

--
-- Constraints for table `ordo`
--
ALTER TABLE `ordo`
  ADD CONSTRAINT `ordo_fk0` FOREIGN KEY (`class_id`) REFERENCES `class` (`id_class`);

--
-- Constraints for table `province`
--
ALTER TABLE `province`
  ADD CONSTRAINT `province_fk0` FOREIGN KEY (`state_id`) REFERENCES `state` (`id_state`);

--
-- Constraints for table `species`
--
ALTER TABLE `species`
  ADD CONSTRAINT `species_fk0` FOREIGN KEY (`genus_id`) REFERENCES `genus` (`id_genus`),
  ADD CONSTRAINT `species_fk1` FOREIGN KEY (`vernacular_id`) REFERENCES `venacular` (`id_venacular`),
  ADD CONSTRAINT `species_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `characteristic_species` (`id_character`);

--
-- Constraints for table `speciment_herbarium`
--
ALTER TABLE `speciment_herbarium`
  ADD CONSTRAINT `speciment_herbarium_fk0` FOREIGN KEY (`collector_id`) REFERENCES `collector` (`id_collector`),
  ADD CONSTRAINT `speciment_herbarium_fk1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id_location`),
  ADD CONSTRAINT `speciment_herbarium_fk2` FOREIGN KEY (`species_id`) REFERENCES `species` (`id_species`),
  ADD CONSTRAINT `speciment_herbarium_fk3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `speciment_herbarium_ibfk_1` FOREIGN KEY (`label_id`) REFERENCES `herbarium_label` (`id_label`),
  ADD CONSTRAINT `speciment_herbarium_ibfk_2` FOREIGN KEY (`verifiedData_id`) REFERENCES `verified` (`id_verified`),
  ADD CONSTRAINT `speciment_herbarium_ibfk_3` FOREIGN KEY (`authorIdentification_id`) REFERENCES `author_identification` (`id_author`);

--
-- Constraints for table `speciment_ias`
--
ALTER TABLE `speciment_ias`
  ADD CONSTRAINT `speciment_ias_fk1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id_location`),
  ADD CONSTRAINT `speciment_ias_fk2` FOREIGN KEY (`species_id`) REFERENCES `species` (`id_species`),
  ADD CONSTRAINT `speciment_ias_fk3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `speciment_ias_ibfk_2` FOREIGN KEY (`verifiedData_id`) REFERENCES `verified` (`id_verified`),
  ADD CONSTRAINT `speciment_ias_ibfk_4` FOREIGN KEY (`control_id`) REFERENCES `controll` (`id_controll`);

--
-- Constraints for table `vilage`
--
ALTER TABLE `vilage`
  ADD CONSTRAINT `vilage_ibfk_1` FOREIGN KEY (`id_vilage`) REFERENCES `district` (`id_district`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

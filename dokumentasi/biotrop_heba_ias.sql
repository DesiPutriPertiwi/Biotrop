CREATE TABLE `type _spesimen` (
	`id_type` INT NOT NULL AUTO_INCREMENT,
	`name_type` BOOLEAN NOT NULL,
	`speciment_id` INT NOT NULL,
	`hebarium_id` INT NOT NULL,
	`ias_id` INT NOT NULL,
	PRIMARY KEY (`id_type`)
);

CREATE TABLE `users` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`password` varchar(191) NOT NULL,
	`firstname` varchar(191) NOT NULL,
	`lastname` varchar(191) NOT NULL,
	`remember_token` varchar(191) NOT NULL,
	`deleted_at` TIMESTAMP NOT NULL AUTO_INCREMENT,
	`created_at` TIMESTAMP NOT NULL AUTO_INCREMENT,
	`update_at` TIMESTAMP NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `speciment_herbarium` (
	`id_herbarium` INT NOT NULL AUTO_INCREMENT,
	`date` TIMESTAMP NOT NULL AUTO_INCREMENT,
	`status_herbarium` BOOLEAN NOT NULL,
	`name_herbarium` varchar(255) NOT NULL,
	`number_herbarium` INT NOT NULL,
	`label_herbarium` varchar(255) NOT NULL,
	`type_herbarium` BOOLEAN NOT NULL,
	`status_vefiedData` BOOLEAN NOT NULL,
	`time_verifiedData` TIMESTAMP NOT NULL AUTO_INCREMENT,
	`utilization` TEXT(600) NOT NULL AUTO_INCREMENT,
	`comment_herbarium` TEXT(600) NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL AUTO_INCREMENT,
	`species_id` INT NOT NULL AUTO_INCREMENT,
	`collector_id` INT NOT NULL AUTO_INCREMENT,
	`location_id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id_herbarium`)
);

CREATE TABLE `speciment_ias` (
	`id_ias` INT NOT NULL AUTO_INCREMENT,
	`date` DATETIME NOT NULL AUTO_INCREMENT,
	`status_ias` BOOLEAN NOT NULL AUTO_INCREMENT,
	`name_ias` varchar(255) NOT NULL AUTO_INCREMENT,
	`number_ias` INT NOT NULL AUTO_INCREMENT,
	`label_ias` varchar(255) NOT NULL AUTO_INCREMENT,
	`type_ias` BOOLEAN NOT NULL AUTO_INCREMENT,
	`status_vefiedData` BOOLEAN NOT NULL AUTO_INCREMENT,
	`time_verifiedData` TIMESTAMP NOT NULL AUTO_INCREMENT,
	`imapact_ias` TEXT(600) NOT NULL,
	`control_ias` TEXT(600) NOT NULL,
	`comment_ias` TEXT(600) NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL AUTO_INCREMENT,
	`species_id` INT NOT NULL AUTO_INCREMENT,
	`collector_id` INT NOT NULL AUTO_INCREMENT,
	`location_id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id_ias`)
);

CREATE TABLE `species` (
	`id_species` INT NOT NULL,
	`name_species` varchar(255) NOT NULL,
	`description_species` varchar(255) NOT NULL,
	`agricimport` varchar(255) NOT NULL,
	`genus_id` INT NOT NULL,
	`vernacular_id` INT NOT NULL,
	`habitat_id` INT NOT NULL,
	`habitus_id` INT NOT NULL,
	PRIMARY KEY (`id_species`)
);

CREATE TABLE `location` (
	`id_location` INT NOT NULL AUTO_INCREMENT,
	`latitude` varchar(255) NOT NULL,
	`longitude` varchar(255) NOT NULL,
	`atitude` varchar(255) NOT NULL,
	`district_id` INT NOT NULL,
	PRIMARY KEY (`id_location`)
);

CREATE TABLE `district` (
	`id_district` INT NOT NULL AUTO_INCREMENT,
	`name_district` varchar(300) NOT NULL,
	`city_id` INT NOT NULL,
	PRIMARY KEY (`id_district`)
);

CREATE TABLE `city` (
	`id_city` INT NOT NULL AUTO_INCREMENT,
	`name_city` varchar NOT NULL,
	`province_id` INT NOT NULL,
	PRIMARY KEY (`id_city`)
);

CREATE TABLE `province` (
	`id_province` INT NOT NULL AUTO_INCREMENT,
	`name_province` varchar NOT NULL,
	`state_id` INT NOT NULL,
	PRIMARY KEY (`id_province`)
);

CREATE TABLE `state` (
	`id_state` INT NOT NULL AUTO_INCREMENT,
	`name_state` varchar NOT NULL,
	PRIMARY KEY (`id_state`)
);

CREATE TABLE `collector` (
	`id_collector` INT NOT NULL AUTO_INCREMENT,
	`name-collector` varchar(255) NOT NULL,
	`tim_collector` varchar(255) NOT NULL,
	`date_collection` TIMESTAMP NOT NULL,
	PRIMARY KEY (`id_collector`)
);

CREATE TABLE `genus` (
	`id_genus` INT NOT NULL AUTO_INCREMENT,
	`name_genus` varchar(255) NOT NULL,
	`familly_id` INT NOT NULL,
	PRIMARY KEY (`id_genus`)
);

CREATE TABLE `familly` (
	`id_familly` INT NOT NULL AUTO_INCREMENT,
	`name_genus` varchar(255) NOT NULL,
	`ordo_id` INT NOT NULL,
	PRIMARY KEY (`id_familly`)
);

CREATE TABLE `class` (
	`id_class` INT NOT NULL AUTO_INCREMENT,
	`name_genus` varchar(255) NOT NULL,
	PRIMARY KEY (`id_class`)
);

CREATE TABLE `habitat` (
	`id_habita` INT NOT NULL AUTO_INCREMENT,
	`name_habitat` varchar(255) NOT NULL,
	`forma` varchar(255) NOT NULL,
	`phenology` varchar(255) NOT NULL,
	`ecology` varchar(255) NOT NULL,
	`biologi` varchar(255) NOT NULL,
	PRIMARY KEY (`id_habita`)
);

CREATE TABLE `ordo` (
	`id_ordo` INT NOT NULL AUTO_INCREMENT,
	`name_ordo` varchar(255) NOT NULL,
	`class_id` INT NOT NULL,
	PRIMARY KEY (`id_ordo`)
);

CREATE TABLE `habitus` (
	`id_habitus` INT NOT NULL AUTO_INCREMENT,
	`name_habitus` varchar(100) NOT NULL,
	`inflorecence` varchar(100) NOT NULL,
	`leaf` blob NOT NULL,
	`root` blob NOT NULL,
	`steam` blob NOT NULL,
	`fruits` blob NOT NULL,
	PRIMARY KEY (`id_habitus`)
);

CREATE TABLE `venacular` (
	`id_venacular` INT NOT NULL AUTO_INCREMENT,
	`venacular_name` varchar(255) NOT NULL,
	`venacular_name_indo` varchar(255) NOT NULL,
	`venacular_name_local` varchar(255) NOT NULL,
	PRIMARY KEY (`id_venacular`)
);

ALTER TABLE `type _spesimen` ADD CONSTRAINT `type _spesimen_fk0` FOREIGN KEY (`speciment_id`) REFERENCES `speciment_herbarium`(`id_herbarium`);

ALTER TABLE `type _spesimen` ADD CONSTRAINT `type _spesimen_fk1` FOREIGN KEY (`ias_id`) REFERENCES `speciment_ias`(`id_ias`);

ALTER TABLE `speciment_herbarium` ADD CONSTRAINT `speciment_herbarium_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `speciment_herbarium` ADD CONSTRAINT `speciment_herbarium_fk1` FOREIGN KEY (`species_id`) REFERENCES `species`(`id_species`);

ALTER TABLE `speciment_herbarium` ADD CONSTRAINT `speciment_herbarium_fk2` FOREIGN KEY (`collector_id`) REFERENCES `collector`(`id_collector`);

ALTER TABLE `speciment_herbarium` ADD CONSTRAINT `speciment_herbarium_fk3` FOREIGN KEY (`location_id`) REFERENCES `location`(`id_location`);

ALTER TABLE `speciment_ias` ADD CONSTRAINT `speciment_ias_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `speciment_ias` ADD CONSTRAINT `speciment_ias_fk1` FOREIGN KEY (`species_id`) REFERENCES `species`(`id_species`);

ALTER TABLE `speciment_ias` ADD CONSTRAINT `speciment_ias_fk2` FOREIGN KEY (`collector_id`) REFERENCES `collector`(`id_collector`);

ALTER TABLE `speciment_ias` ADD CONSTRAINT `speciment_ias_fk3` FOREIGN KEY (`location_id`) REFERENCES `location`(`id_location`);

ALTER TABLE `species` ADD CONSTRAINT `species_fk0` FOREIGN KEY (`genus_id`) REFERENCES `genus`(`id_genus`);

ALTER TABLE `species` ADD CONSTRAINT `species_fk1` FOREIGN KEY (`vernacular_id`) REFERENCES `venacular`(`id_venacular`);

ALTER TABLE `species` ADD CONSTRAINT `species_fk2` FOREIGN KEY (`habitat_id`) REFERENCES `habitat`(`id_habita`);

ALTER TABLE `species` ADD CONSTRAINT `species_fk3` FOREIGN KEY (`habitus_id`) REFERENCES `habitus`(`id_habitus`);

ALTER TABLE `location` ADD CONSTRAINT `location_fk0` FOREIGN KEY (`district_id`) REFERENCES `district`(`id_district`);

ALTER TABLE `district` ADD CONSTRAINT `district_fk0` FOREIGN KEY (`city_id`) REFERENCES `city`(`id_city`);

ALTER TABLE `city` ADD CONSTRAINT `city_fk0` FOREIGN KEY (`province_id`) REFERENCES `province`(`id_province`);

ALTER TABLE `province` ADD CONSTRAINT `province_fk0` FOREIGN KEY (`state_id`) REFERENCES `state`(`id_state`);

ALTER TABLE `genus` ADD CONSTRAINT `genus_fk0` FOREIGN KEY (`familly_id`) REFERENCES `familly`(`id_familly`);

ALTER TABLE `familly` ADD CONSTRAINT `familly_fk0` FOREIGN KEY (`ordo_id`) REFERENCES `ordo`(`id_ordo`);

ALTER TABLE `ordo` ADD CONSTRAINT `ordo_fk0` FOREIGN KEY (`class_id`) REFERENCES `class`(`id_class`);


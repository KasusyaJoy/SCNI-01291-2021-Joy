/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - movies_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`movies_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `movies_db`;

/*Table structure for table `directors` */

DROP TABLE IF EXISTS `directors`;

CREATE TABLE `directors` (
  `director_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `date_of_birth` datetime NOT NULL,
  `passportphoto` varchar(2000) NOT NULL,
  `nationality` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`director_id`),
  KEY `nationality` (`nationality`),
  KEY `company_id` (`company_id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`nationality`) REFERENCES `nationalities` (`country_id`),
  CONSTRAINT `directors_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `production_companies` (`company_id`),
  CONSTRAINT `directors_ibfk_3` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `directors_ibfk_4` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `directors` */

/*Table structure for table `genres` */

DROP TABLE IF EXISTS `genres`;

CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  PRIMARY KEY (`genre_id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `genres_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `genres_ibfk_2` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `genres` */

/*Table structure for table `languages` */

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_name` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `languages_ibfk_2` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `languages` */

/*Table structure for table `media` */

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `media_name` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  PRIMARY KEY (`media_id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `media` */

/*Table structure for table `movie_cast` */

DROP TABLE IF EXISTS `movie_cast`;

CREATE TABLE `movie_cast` (
  `cast_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `star_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `role_description` varchar(2000) NOT NULL,
  `cast_name` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  PRIMARY KEY (`cast_id`),
  KEY `movie_id` (`movie_id`),
  KEY `star_id` (`star_id`),
  KEY `role_id` (`role_id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`star_id`) REFERENCES `stars` (`star_id`),
  CONSTRAINT `movie_cast_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `movie_cast_ibfk_4` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `movie_cast_ibfk_5` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movie_cast` */

/*Table structure for table `movie_genre` */

DROP TABLE IF EXISTS `movie_genre`;

CREATE TABLE `movie_genre` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `genre_id` (`genre_id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`),
  CONSTRAINT `movie_genre_ibfk_3` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `movie_genre_ibfk_4` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movie_genre` */

/*Table structure for table `movie_languages` */

DROP TABLE IF EXISTS `movie_languages`;

CREATE TABLE `movie_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  KEY `movie_id` (`movie_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `movie_languages_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `movie_languages_ibfk_2` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `movie_languages_ibfk_3` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `movie_languages_ibfk_4` FOREIGN KEY (`language_id`) REFERENCES `languages` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movie_languages` */

/*Table structure for table `movie_media` */

DROP TABLE IF EXISTS `movie_media`;

CREATE TABLE `movie_media` (
  `movie_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`),
  KEY `movie_id` (`movie_id`),
  KEY `deleted_by` (`deleted_by`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `movie_media_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`),
  CONSTRAINT `movie_media_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `movie_media_ibfk_3` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `movie_media_ibfk_4` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movie_media` */

/*Table structure for table `movie_prod_comp` */

DROP TABLE IF EXISTS `movie_prod_comp`;

CREATE TABLE `movie_prod_comp` (
  `movie_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `company_id` (`company_id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `movie_prod_comp_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `movie_prod_comp_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `production_companies` (`company_id`),
  CONSTRAINT `movie_prod_comp_ibfk_3` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `movie_prod_comp_ibfk_4` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movie_prod_comp` */

/*Table structure for table `movie_ratings` */

DROP TABLE IF EXISTS `movie_ratings`;

CREATE TABLE `movie_ratings` (
  `movie_id` int(11) NOT NULL,
  `rating_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `rating_id` (`rating_id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `movie_ratings_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `movie_ratings_ibfk_2` FOREIGN KEY (`rating_id`) REFERENCES `ratings` (`rating_id`),
  CONSTRAINT `movie_ratings_ibfk_3` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `movie_ratings_ibfk_4` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movie_ratings` */

/*Table structure for table `movie_resolution` */

DROP TABLE IF EXISTS `movie_resolution`;

CREATE TABLE `movie_resolution` (
  `movie_id` int(11) NOT NULL,
  `resolution_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `resolution_id` (`resolution_id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `movie_resolution_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  CONSTRAINT `movie_resolution_ibfk_2` FOREIGN KEY (`resolution_id`) REFERENCES `resolution` (`resolution_id`),
  CONSTRAINT `movie_resolution_ibfk_3` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `movie_resolution_ibfk_4` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movie_resolution` */

/*Table structure for table `moviecategories` */

DROP TABLE IF EXISTS `moviecategories`;

CREATE TABLE `moviecategories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryname` varchar(50) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `datedeleted` datetime DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  `categorydescription` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `moviecategories` */

/*Table structure for table `movies` */

DROP TABLE IF EXISTS `movies`;

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `release_date` date NOT NULL,
  `synopsis` varchar(2000) NOT NULL,
  `poster` varchar(1000) NOT NULL,
  `trailer` varchar(50) NOT NULL,
  `duration` time NOT NULL,
  `director_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `date_deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  KEY `deleted_by` (`deleted_by`),
  KEY `movies_ibfk_1` (`added_by`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `movies` */

/*Table structure for table `nationalities` */

DROP TABLE IF EXISTS `nationalities`;

CREATE TABLE `nationalities` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `counry_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `nationalities` */

/*Table structure for table `production_companies` */

DROP TABLE IF EXISTS `production_companies`;

CREATE TABLE `production_companies` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  PRIMARY KEY (`company_id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `production_companies_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `production_companies_ibfk_2` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `production_companies` */

/*Table structure for table `ratings` */

DROP TABLE IF EXISTS `ratings`;

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `ratings` */

/*Table structure for table `resolution` */

DROP TABLE IF EXISTS `resolution`;

CREATE TABLE `resolution` (
  `resolution_id` int(11) NOT NULL AUTO_INCREMENT,
  `resolution_name` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  PRIMARY KEY (`resolution_id`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `resolution_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `resolution_ibfk_2` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `resolution` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `added_by` int(11) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `deleted_by` int(11) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

/*Table structure for table `stars` */

DROP TABLE IF EXISTS `stars`;

CREATE TABLE `stars` (
  `star_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `nationality` int(11) NOT NULL,
  `photo` varchar(1000) NOT NULL,
  `a_list` tinyint(1) NOT NULL DEFAULT 0,
  `added_by` int(11) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `deleted_by` int(11) DEFAULT NULL,
  `referenceno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`star_id`),
  KEY `nationality_id` (`nationality`),
  KEY `added_by` (`added_by`),
  KEY `deleted_by` (`deleted_by`),
  CONSTRAINT `stars_ibfk_1` FOREIGN KEY (`nationality`) REFERENCES `nationalities` (`country_id`),
  CONSTRAINT `stars_ibfk_2` FOREIGN KEY (`added_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `stars_ibfk_3` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `stars` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `sys_admin` tinyint(1) NOT NULL,
  `account_active` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

/* Procedure structure for procedure `sp_checkmoviecategoy` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkmoviecategoy` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkmoviecategoy`($categoryid int, $categoryname varchar(50))
BEGIN
		select *
		from `moviecategories`
		where `categoryid`!=$categoryid and `categoryname`=$categoryname
		and `deleted`=0;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkmoviestar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkmoviestar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkmoviestar`($starid int,$referenceno varchar(50))
BEGIN
		select *
		From `stars`
		where `star_id`!=$staerid and `referenceno`=$referenceno;
		

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletemoviecategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletemoviecategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletemoviecategory`($categoryid int,$userid int)
BEGIN
		update `moviecategories`
		set `deleted`=1,`datedeleted`=now(),`deletedby`=$userid
		where `categoryid`=$categoryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletemoviestar` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletemoviestar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletemoviestar`($starid int,$userid int)
BEGIN 
		update `stars`
		set `deleted`=1,`deleted_by`=$userid
		where `star_id`=$starid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getmoviecategories` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getmoviecategories` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getmoviecategories`()
BEGIN
		select c.*,concat(`first_name`,' ',`last_name`)addedBy
		from `moviecategories` c
		join `users` s on s.`user_id`*c. `added_by`
		where `deleted`=0
		order by `categoryname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getmoviecategorydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getmoviecategorydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getmoviecategorydetails`($categoryid int)
BEGIN
		select *
		from `moviecategories`
		where `categoryid`=$categoryid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getmoviestars` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getmoviestars` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getmoviestars`()
BEGIN
		select s.*, countryname, concat(`first_name`,' ',`last_name`)addedbyname
		from `stars` s
		join `users` u on u.userid=s.addedby
		join `nationalities` n on n.countryid=s.natonality  
		where s.deleted=0
		order by `first_name`,`last_name` ;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getmoviestarsdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getmoviestarsdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getmoviestarsdetails`($starid int)
BEGIN
		select *
		from `stars`
		where `star_id`=$starid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savemovieategory` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savemovieategory` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savemovieategory`($categoryid INT,$categoryname VARCHAR(50),$categorydescription varchar(1000),$userid int)
BEGIN 
		if $categoryid=0 then
			insert into `moviecategories`(`categoryname`,`categorydescription`,`dateadded`,`addedby`)
			values ($categoryname,$categorydescription,now(),$userid);
		else
			update `moviecategories`
			set `categoryname`=$categoryname, `categorydescription`=$categorydecription
			where `categoryid`=$categoryid;
		end if;
	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.34)
# Database: adopt_ireland
# Generation Time: 2018-04-22 19:51:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table Breed
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Breed`;

CREATE TABLE `Breed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `breedSizeID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Breed_BreedSize_FK` (`breedSizeID`),
  CONSTRAINT `Breed_BreedSize_FK` FOREIGN KEY (`breedSizeID`) REFERENCES `BreedSize` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table BreedSize
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BreedSize`;

CREATE TABLE `BreedSize` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `size` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `BreedSize` WRITE;
/*!40000 ALTER TABLE `BreedSize` DISABLE KEYS */;

INSERT INTO `BreedSize` (`id`, `size`)
VALUES
	(1,'SMALL'),
	(2,'MEDIUM'),
	(3,'LARGE'),
	(4,'GIANT');

/*!40000 ALTER TABLE `BreedSize` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table BreedSynonym
# ------------------------------------------------------------

DROP TABLE IF EXISTS `BreedSynonym`;

CREATE TABLE `BreedSynonym` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `synonym` varchar(80) NOT NULL DEFAULT '',
  `breedID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `BreedSynonym_Breed_FK` (`breedID`),
  CONSTRAINT `BreedSynonym_Breed_FK` FOREIGN KEY (`breedID`) REFERENCES `Breed` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Dog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Dog`;

CREATE TABLE `Dog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `breedID` int(11) unsigned NOT NULL,
  `shelterID` int(11) unsigned NOT NULL,
  `entered` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Dog_Breed_FK` (`breedID`),
  KEY `Dog_Shelter_FK` (`shelterID`),
  CONSTRAINT `Dog_Breed_FK` FOREIGN KEY (`breedID`) REFERENCES `Breed` (`id`),
  CONSTRAINT `Dog_Shelter_FK` FOREIGN KEY (`shelterID`) REFERENCES `Shelter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table County
# ------------------------------------------------------------

DROP TABLE IF EXISTS `County`;

CREATE TABLE `County` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `county` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Photo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Photo`;

CREATE TABLE `Photo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `dogID` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Photo_Dog_FK` (`dogID`),
  CONSTRAINT `Photo_Dog_FK` FOREIGN KEY (`dogID`) REFERENCES `Dog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Shelter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Shelter`;

CREATE TABLE `Shelter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `site` varchar(80) DEFAULT NULL,
  `countyID` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Shelter_County_FK` (`countyID`),
  CONSTRAINT `Shelter_County_FK` FOREIGN KEY (`countyID`) REFERENCES `County` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

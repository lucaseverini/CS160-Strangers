# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.1.43)
# Database: car_match
# Generation Time: 2015-05-08 21:23:29 +0000
# ************************************************************

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `car_match`
--

CREATE DATABASE IF NOT EXISTS `car_match` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `car_match`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# Dump of table Access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Access`;

CREATE TABLE `Access` (
  `User` int(11) unsigned NOT NULL,
  `Role` int(11) unsigned NOT NULL,
  `UserName` varchar(256) NOT NULL,
  `Password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Access` WRITE;
/*!40000 ALTER TABLE `Access` DISABLE KEYS */;

INSERT INTO `Access` (`User`, `Role`, `UserName`, `Password`)
VALUES
	(1,1,'luca','luca'),
	(2,2,'mason','mason'),
	(3,2,'robert','robert'),
	(4,2,'harold','harold'),
	(5,3,'john','john'),
	(6,3,'bill','bill'),
	(7,3,'paul','paul'),
	(8,3,'anderson','anderson'),
	(9,3,'magnussen','magnussen'),
	(10,3,'bmw','bmw');

/*!40000 ALTER TABLE `Access` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Bank
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Bank`;

CREATE TABLE `Bank` (
  `Code` int(10) unsigned NOT NULL,
  `Name` varchar(256) NOT NULL,
  `ABA` varchar(9) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Bank` WRITE;
/*!40000 ALTER TABLE `Bank` DISABLE KEYS */;

INSERT INTO `Bank` (`Code`, `Name`, `ABA`, `Description`)
VALUES
	(1,'Citibank','321171184','Citibank Northern California'),
	(2,'Chase','123456789','Chase'),
	(3,'Starone','345678432','Star One Credit Union');

/*!40000 ALTER TABLE `Bank` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Category`;

CREATE TABLE `Category` (
  `Code` int(10) unsigned NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;

INSERT INTO `Category` (`Code`, `Description`)
VALUES
	(1,'Coupe'),
	(2,'Sedan'),
	(3,'Convertible'),
	(4,'Hatchback'),
	(5,'Station Wagon'),
	(6,'SUV'),
	(7,'Mini Van'),
	(8,'Van'),
	(9,'Pickup Regular cab'),
	(10,'Pickup Extended cab'),
	(11,'Pickup Crew cab'),
	(12,'Mini Car');

/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Color
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Color`;

CREATE TABLE `Color` (
  `Code` int(10) unsigned NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Color` WRITE;
/*!40000 ALTER TABLE `Color` DISABLE KEYS */;

INSERT INTO `Color` (`Code`, `Name`, `Description`)
VALUES
	(1,'Black',''),
	(2,'White',''),
	(3,'Silver',''),
	(4,'Red',''),
	(5,'Brown',''),
	(6,'Glacier Blue',''),
	(7,'Graphite',''),
	(8,'Yellow',''),
	(9,'Candy White',''),
	(10,'Iron Gray',''),
	(11,'Light Brown',''),
	(12,'Pepper Gray',''),
	(13,'Electric Blue','');

/*!40000 ALTER TABLE `Color` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Country`;

CREATE TABLE `Country` (
  `Code` int(10) unsigned NOT NULL,
  `Name` varchar(256) NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;

INSERT INTO `Country` (`Code`, `Name`)
VALUES
	(1,'USA'),
	(2,'Japan'),
	(3,'Germany'),
	(4,'Italy'),
	(5,'France'),
	(6,'UK'),
	(7,'South Corea'),
	(8,'China'),
	(9,'Sweden'),
	(10,'Austria');

/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Feature
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Feature`;

CREATE TABLE `Feature` (
  `Code` int(10) unsigned NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Feature` WRITE;
/*!40000 ALTER TABLE `Feature` DISABLE KEYS */;

INSERT INTO `Feature` (`Code`, `Description`)
VALUES
	(1,'Air Conditioning'),
	(2,'Four-wheel Drive'),
	(3,'Sunroof'),
	(4,'Automatic Transmission'),
	(5,'Manual Transmission'),
	(6,'Integrated Navigation System'),
	(7,'Integrated Hi-Fi'),
	(8,'Front Airbag'),
	(9,'Front Lateral Airbag'),
	(10,'Rear Lateral Airbag'),
	(11,'Alloy Rims'),
	(12,'Sequential Transmission'),
	(13,'Gasoline Engine'),
	(14,'Diesel Engine'),
	(15,'Other Engine'),
	(16,'Electric Engine'),
	(17,'Hybrid Engine'),
	(18,'Sport Suspension'),
	(19,'Antilock Brakes'),
	(20,'Leather Seats'),
	(21,'Power Windows'),
	(22,'Cruise Control'),
	(23,'Garage Door Opener'),
	(24,'Heated Seats'),
	(25,'Bluetooth Enabled'),
	(26,'Cloth Seats'),
	(27,'Power Mirrors'),
	(28,'Automated Parking Assist'),
	(29,'Memory Seating Positions'),
	(30,'Automatic Climate Control');

/*!40000 ALTER TABLE `Feature` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Manufacturer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Manufacturer`;

CREATE TABLE `Manufacturer` (
  `Code` int(10) unsigned NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Country` int(10) unsigned NOT NULL,
  `Details` varchar(256) NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Manufacturer` WRITE;
/*!40000 ALTER TABLE `Manufacturer` DISABLE KEYS */;

INSERT INTO `Manufacturer` (`Code`, `Name`, `Country`, `Details`)
VALUES
	(1,'Honda',0,''),
	(2,'Toyota',0,''),
	(3,'BMW',0,''),
	(4,'Audi',0,''),
	(5,'Mercedes',0,''),
	(6,'FIAT',0,''),
	(7,'Ferrari',0,''),
	(8,'Alfa Romeo',0,''),
	(9,'Volkswagen',0,''),
	(10,'Ford',0,''),
	(11,'Corvette',0,''),
	(12,'Saturn',0,''),
	(13,'GMC',0,''),
	(14,'Infiniti',0,''),
	(15,'Lexus',0,''),
	(16,'Chrysler',0,''),
	(17,'Dodge',0,''),
	(18,'Jeep',0,''),
	(19,'Mercury',0,''),
	(20,'Lincoln',0,''),
	(21,'Cadillac',0,''),
	(22,'Hummer',0,''),
	(23,'Chevrolet ',0,''),
	(24,'Buick ',0,''),
	(25,'Ram',0,''),
	(26,'Nissan',0,''),
	(27,'Hyundai',0,'');

/*!40000 ALTER TABLE `Manufacturer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Purchase
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Purchase`;

CREATE TABLE `Purchase` (
  `Code` int(10) unsigned NOT NULL,
  `Vehicle` int(10) unsigned NOT NULL,
  `Price` double NOT NULL,
  `Seller` int(10) unsigned NOT NULL,
  `User` int(10) unsigned NOT NULL,
  `Transaction` int(10) unsigned NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Role`;

CREATE TABLE `Role` (
  `Code` int(11) unsigned NOT NULL,
  `Description` text NOT NULL,
  `Privileges` int(11) unsigned NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;

INSERT INTO `Role` (`Code`, `Description`, `Privileges`)
VALUES
	(1,'Root',31),
	(2,'Admin',15),
	(3,'User',3),
	(4,'Guest',1);

/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Seller-Transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Seller-Transactions`;

CREATE TABLE `Seller-Transactions` (
  `Seller` int(11) NOT NULL,
  `Transaction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Seller-Vehicles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Seller-Vehicles`;

CREATE TABLE `Seller-Vehicles` (
  `Seller` int(11) NOT NULL,
  `Vehicle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Transaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Transaction`;

CREATE TABLE `Transaction` (
  `Code` int(10) unsigned NOT NULL,
  `Status` int(10) unsigned NOT NULL,
  `Description` text NOT NULL,
  `Amount` double NOT NULL,
  `Buyer` int(10) unsigned NOT NULL,
  `Seller` int(10) unsigned NOT NULL,
  `Purchase` int(10) unsigned NOT NULL,
  `Bank` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Transaction-Status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Transaction-Status`;

CREATE TABLE `Transaction-Status` (
  `Code` int(10) unsigned NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `Code` int(11) NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Address` varchar(256) NOT NULL,
  `Zip` varchar(256) NOT NULL,
  `City` varchar(256) NOT NULL,
  `State` varchar(2) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `Phone` varchar(256) NOT NULL,
  `Business` varchar(256) NOT NULL,
  `SSN` varchar(9) NOT NULL,
  `Registration` datetime NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`Code`, `Name`, `Address`, `Zip`, `City`, `State`, `Email`, `Phone`, `Business`, `SSN`, `Registration`)
VALUES
	(1,'Luca Severini','333 Escuela Ave','94040','Mountain View','CA','lucaseverini@gmail.com','650-4175974','Software','645645646','2015-05-08 00:00:00'),
	(2,'Mason Chou','121 Bassett Street','95002','San Jose','CA','masonchou@gmail.com','650-1234567','Real Estate','246574733','2015-05-08 00:00:00'),
	(3,'Robert Kham','456 W Olive Ave','94024','Sunnyvale','CA','robertkham@gmail.com','650-7654321','Car Dealer','645477454','2015-05-08 00:00:00'),
	(4,'Harold Harrigan','221 Branham Lane','95013','San Jose','CA','haroldharrigan@gmail.com','480-1234567','Design','244356546','2015-05-08 00:00:00'),
	(5,'John Red','254 Adam Ave','02465','West Newton','MA','johnred@gmail.com','617-9659565','Banking','806798556','2015-05-08 00:00:00'),
	(6,'Bill H Black','940 E 482nd Rd','65613','Bolivar','MO','billblack@gmail.com','417-7776162','Education','345634535','2015-05-08 00:00:00'),
	(7,'Paul Harvey','20 W Wesson St','94040','El Dorado','AR','paulharvey@gmail.com','650-1200149','Retired','096567443','2015-05-08 00:00:00'),
	(8,'Anderson Honda','1766 Embarcadero Rd','94303','Palo Alto','CA','anderson@gmail.com','650-8566000','Car Dealer','123456789','2015-05-08 00:00:00'),
	(9,'Magnussen\'s Toyota','690 San Antonio Rd','94306','Palo Alto','CA','magnussen@gmail.com','650-4942300','Car Dealer','987654321','2015-05-08 00:00:00'),
	(10,'BMW of Mountain View','150 E El Camino Real','94040','Mountain View','CA','bmw@gmail.com','650-2000149','Car Dealer','246824682','2015-05-08 00:00:00');

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table User-Transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User-Transactions`;

CREATE TABLE `User-Transactions` (
  `User` int(11) NOT NULL,
  `Transaction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table Vehicle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Vehicle`;

CREATE TABLE `Vehicle` (
  `Code` int(11) NOT NULL,
  `Model` varchar(256) NOT NULL,
  `Year` smallint(6) NOT NULL,
  `Manufacturer` int(11) NOT NULL,
  `Mileage` mediumint(9) NOT NULL,
  `Price` mediumint(9) NOT NULL,
  `Color` smallint(6) NOT NULL,
  `Seats` int(11) NOT NULL,
  `Category` smallint(6) NOT NULL,
  `Registration` date NOT NULL,
  `Description` text NOT NULL,
  `Seller` int(11) NOT NULL,
  `Vin` varchar(20) NOT NULL,
  `Verified` tinyint(1) NOT NULL,
  `InsuranceDate` date NOT NULL,
  PRIMARY KEY (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;

INSERT INTO `Vehicle` (`Code`, `Model`, `Year`, `Manufacturer`, `Mileage`, `Price`, `Color`, `Seats`, `Category`, `Registration`, `Description`, `Seller`, `Vin`, `Verified`, `InsuranceDate`)
VALUES
	(1,'Accord LX',2012,1,35000,16894,1,5,2,'0000-00-00','Honda Accord SE',6,'1HGCP2F64CA046544',1,'0000-00-00'),
	(2,'Accord EX-L',2010,1,48500,14000,2,5,2,'0000-00-00','Honda Accord EX-L',7,'1HGCP2F88CA149161',1,'0000-00-00'),
	(3,'Civic LX',2012,1,42000,15550,3,5,2,'0000-00-00','Honda Civic LX',7,'19XFB2F52CE051353',1,'0000-00-00'),
	(4,'Pilot EX',2008,1,120000,12500,7,5,6,'0000-00-00','Honda Pilot EX',9,'5FNYF28418B016421',1,'0000-00-00'),
	(5,'128i Convertible',2013,3,27000,30000,7,4,3,'0000-00-00','BMW 128i Convertible',10,'WBAUN1C5XDVR00684',1,'0000-00-00'),
	(6,'128i Coupe',2012,3,16500,24000,2,4,1,'0000-00-00','BMW 128i Coupe',10,'WBAUP9C50CVS94013',1,'0000-00-00'),
	(7,'Passat GLS',1998,9,100000,4000,4,5,2,'0000-00-00','Volkswagen Passat GLS',9,'WVWMA63B1XE507372',1,'0000-00-00'),
	(8,'Prius Base',2004,2,120000,8200,5,5,2,'0000-00-00','Toyota Prius Base',9,'JTDKB20U940036566',1,'0000-00-00'),
	(9,'Sienna XLE',2004,2,147000,11000,3,8,8,'0000-00-00','Toyota Sienna XLE Limited',8,'5TDBA22CX4S011583',1,'0000-00-00'),
	(10,'Focus ST',2014,10,12000,23500,13,4,4,'0000-00-00','Ford Focus ST',8,'1FADP3L95EL317244',1,'0000-00-00');

/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Vehicle-Features
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Vehicle-Features`;

CREATE TABLE `Vehicle-Features` (
  `Vehicle` int(10) unsigned NOT NULL,
  `Feature` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

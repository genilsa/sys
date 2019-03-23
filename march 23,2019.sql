-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.21 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for sad
CREATE DATABASE IF NOT EXISTS `sad` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sad`;

-- Dumping structure for table sad.docs
CREATE TABLE IF NOT EXISTS `docs` (
  `id` int(10) NOT NULL,
  `status` int(1) NOT NULL,
  `arrive` date NOT NULL,
  `from` int(10) NOT NULL,
  `kind` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `foldercode` varchar(50) NOT NULL,
  `boxno` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.driver
CREATE TABLE IF NOT EXISTS `driver` (
  `d_id` int(10) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `gender` char(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `bday` date NOT NULL,
  `license_no` varchar(50) NOT NULL,
  `cellnumber` char(50) NOT NULL,
  PRIMARY KEY (`d_id`),
  UNIQUE KEY `license_no` (`license_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.instructor
CREATE TABLE IF NOT EXISTS `instructor` (
  `insid` int(10) unsigned zerofill NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `inslevel` varchar(50) DEFAULT NULL,
  `cpno` varchar(50) NOT NULL,
  PRIMARY KEY (`insid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.login
CREATE TABLE IF NOT EXISTS `login` (
  `in_id` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `in_admin` varchar(50) NOT NULL,
  `in_pass` varchar(50) DEFAULT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.masterlist
CREATE TABLE IF NOT EXISTS `masterlist` (
  `id` int(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `office` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.organization
CREATE TABLE IF NOT EXISTS `organization` (
  `ogrid` int(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ogrid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.redoc1
CREATE TABLE IF NOT EXISTS `redoc1` (
  `cntrl` int(10) NOT NULL AUTO_INCREMENT,
  `docfrom` varchar(50) NOT NULL,
  `doctype` varchar(50) NOT NULL,
  `docabot` date NOT NULL,
  `dessi` date DEFAULT NULL,
  `disseto` varchar(50) DEFAULT NULL,
  `subid` char(1) NOT NULL,
  PRIMARY KEY (`cntrl`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.redoc2
CREATE TABLE IF NOT EXISTS `redoc2` (
  `dcntrl` int(10) NOT NULL AUTO_INCREMENT,
  `ddocfrom` varchar(50) NOT NULL,
  `ddoctype` varchar(50) NOT NULL,
  `ddocabot` date NOT NULL,
  PRIMARY KEY (`dcntrl`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `staid` int(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `cpno` varchar(50) NOT NULL,
  PRIMARY KEY (`staid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.student
CREATE TABLE IF NOT EXISTS `student` (
  `stuid` int(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `section` varchar(50) NOT NULL,
  `cpno` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`stuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.stu_position_org
CREATE TABLE IF NOT EXISTS `stu_position_org` (
  `spo_id` int(10) NOT NULL,
  `position` varchar(50) NOT NULL,
  `student_id` int(10) NOT NULL,
  `organization_id` int(10) NOT NULL,
  PRIMARY KEY (`spo_id`),
  KEY `FK_stu_position_org_student` (`student_id`),
  KEY `FK_stu_position_org_organization` (`organization_id`),
  CONSTRAINT `FK_stu_position_org_organization` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`ogrid`),
  CONSTRAINT `FK_stu_position_org_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`stuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.trippass
CREATE TABLE IF NOT EXISTS `trippass` (
  `pass_id` int(10) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `cellnumber` varchar(50) NOT NULL,
  `tirpid` int(10) NOT NULL,
  PRIMARY KEY (`pass_id`),
  KEY `FK_trippass_tripsched` (`tirpid`),
  CONSTRAINT `FK_trippass_tripsched` FOREIGN KEY (`tirpid`) REFERENCES `tripsched` (`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.tripsched
CREATE TABLE IF NOT EXISTS `tripsched` (
  `trip_id` int(10) NOT NULL AUTO_INCREMENT,
  `requestdate` date NOT NULL,
  `tripdate` date NOT NULL,
  `purpose` varchar(500) NOT NULL,
  `destination` varchar(500) NOT NULL,
  `ve_id` int(10) NOT NULL,
  `driver_id` int(10) NOT NULL,
  `teamleader` int(10) NOT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `FK_tripsched_vehicle` (`ve_id`),
  KEY `FK_tripsched_driver` (`driver_id`),
  KEY `FK_tripsched_trippass` (`teamleader`),
  CONSTRAINT `FK_tripsched_driver` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`d_id`),
  CONSTRAINT `FK_tripsched_trippass` FOREIGN KEY (`teamleader`) REFERENCES `trippass` (`pass_id`),
  CONSTRAINT `FK_tripsched_vehicle` FOREIGN KEY (`ve_id`) REFERENCES `vehicle` (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.vehicle
CREATE TABLE IF NOT EXISTS `vehicle` (
  `v_id` int(10) NOT NULL AUTO_INCREMENT,
  `v_type` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `plate_no` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `yearmodel` year(4) NOT NULL,
  PRIMARY KEY (`v_id`),
  UNIQUE KEY `plate_no` (`plate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
-- Dumping structure for table sad.vehiclecolor
CREATE TABLE IF NOT EXISTS `vehiclecolor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `colorname` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

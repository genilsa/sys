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

-- Dumping structure for table sad.course
CREATE TABLE IF NOT EXISTS `course` (
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `department` int(10) NOT NULL,
  `c_program` varchar(50) NOT NULL,
  `c_major` varchar(50) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `FK_course_depatment` (`department`),
  CONSTRAINT `FK_course_depatment` FOREIGN KEY (`department`) REFERENCES `depatment` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sad.course: ~0 rows (approximately)
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;

-- Dumping structure for table sad.depatment
CREATE TABLE IF NOT EXISTS `depatment` (
  `depart_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sad.depatment: ~0 rows (approximately)
/*!40000 ALTER TABLE `depatment` DISABLE KEYS */;
/*!40000 ALTER TABLE `depatment` ENABLE KEYS */;

-- Dumping structure for table sad.dmasterlist
CREATE TABLE IF NOT EXISTS `dmasterlist` (
  `id` int(10) NOT NULL,
  `code` varchar(50) NOT NULL,
  `office` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sad.dmasterlist: ~0 rows (approximately)
/*!40000 ALTER TABLE `dmasterlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `dmasterlist` ENABLE KEYS */;

-- Dumping structure for table sad.docs
CREATE TABLE IF NOT EXISTS `docs` (
  `id` int(10) NOT NULL,
  `arrive` date NOT NULL,
  `from` int(10) NOT NULL,
  `kind` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `foldercode` varchar(50) NOT NULL,
  `boxno` varchar(10) NOT NULL,
  `attachment` tinyblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sad.docs: ~0 rows (approximately)
/*!40000 ALTER TABLE `docs` DISABLE KEYS */;
/*!40000 ALTER TABLE `docs` ENABLE KEYS */;

-- Dumping structure for table sad.d_action
CREATE TABLE IF NOT EXISTS `d_action` (
  `d_action_id` int(10) NOT NULL AUTO_INCREMENT,
  `d_doc_id` int(10) DEFAULT NULL,
  `d_action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`d_action_id`),
  KEY `FK_d_action_docs` (`d_doc_id`),
  CONSTRAINT `FK_d_action_docs` FOREIGN KEY (`d_doc_id`) REFERENCES `docs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='action for the documents';

-- Dumping data for table sad.d_action: ~0 rows (approximately)
/*!40000 ALTER TABLE `d_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `d_action` ENABLE KEYS */;

-- Dumping structure for table sad.instructor
CREATE TABLE IF NOT EXISTS `instructor` (
  `insid` int(10) unsigned zerofill NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `department` int(10) NOT NULL,
  `status` varchar(50) NOT NULL,
  `inslevel` varchar(50) DEFAULT NULL,
  `cpno` varchar(50) NOT NULL,
  PRIMARY KEY (`insid`),
  KEY `FK_instructor_depatment` (`department`),
  CONSTRAINT `FK_instructor_depatment` FOREIGN KEY (`department`) REFERENCES `depatment` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sad.instructor: ~0 rows (approximately)
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;

-- Dumping structure for table sad.login
CREATE TABLE IF NOT EXISTS `login` (
  `in_id` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `in_admin` varchar(50) NOT NULL,
  `in_pass` varchar(50) DEFAULT NULL,
  `type` int(1) NOT NULL,
  PRIMARY KEY (`in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table sad.login: ~2 rows (approximately)
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`in_id`, `in_admin`, `in_pass`, `type`) VALUES
	(00001, 'executive', 'executive', 1),
	(00002, 'secretary', '', 2),
	(00003, 'dean', '', 1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;

-- Dumping structure for table sad.staff
CREATE TABLE IF NOT EXISTS `staff` (
  `staid` int(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `cpno` varchar(50) NOT NULL,
  PRIMARY KEY (`staid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sad.staff: ~0 rows (approximately)
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;

-- Dumping structure for table sad.student
CREATE TABLE IF NOT EXISTS `student` (
  `stuid` int(10) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `course` int(10) NOT NULL,
  `year` varchar(5) NOT NULL,
  `section` varchar(5) NOT NULL,
  `cpno` varchar(15) NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`stuid`),
  KEY `FK_student_course` (`course`),
  CONSTRAINT `FK_student_course` FOREIGN KEY (`course`) REFERENCES `course` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table sad.student: ~0 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table sad.tdriver
CREATE TABLE IF NOT EXISTS `tdriver` (
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='t=trip';

-- Dumping data for table sad.tdriver: ~4 rows (approximately)
/*!40000 ALTER TABLE `tdriver` DISABLE KEYS */;
INSERT INTO `tdriver` (`d_id`, `fname`, `mname`, `lname`, `gender`, `address`, `bday`, `license_no`, `cellnumber`) VALUES
	(5, 'dfghjmk,k', 'grbvdf', 'rtgtrtrgrg', 'm', 'rtgrtgrtgr', '2019-03-04', 'trgrggrgr', '34356789'),
	(6, 'ertyj', 'fdadsfdva', 'wasd', 'f', 'fgvdf', '2019-03-05', 'sadf', 'dasdsf94856230'),
	(7, 'vid', 'dqjbkJ', 'jjjnkkln', 'f', 'saasd', '1999-03-05', 'asaS', '1234567'),
	(8, 'XDAs', 'ghvjbkn', 'b jnkl', 'm', 'saxasxs', '2019-03-20', 'asxasx', 'asdsfghjk');
/*!40000 ALTER TABLE `tdriver` ENABLE KEYS */;

-- Dumping structure for table sad.trequest_by
CREATE TABLE IF NOT EXISTS `trequest_by` (
  `tl_id` int(10) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `mnane` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `cellnumber` varchar(50) NOT NULL,
  PRIMARY KEY (`tl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='t=trip';

-- Dumping data for table sad.trequest_by: ~5 rows (approximately)
/*!40000 ALTER TABLE `trequest_by` DISABLE KEYS */;
INSERT INTO `trequest_by` (`tl_id`, `fname`, `mnane`, `lname`, `cellnumber`) VALUES
	(1, 'fg', 'rt', 'esrfg', 'sdfgh'),
	(2, 'f', 'f', 'f', 'f'),
	(3, 'h', 'h', 'hj', 'j'),
	(4, 'g', 'g', 'g', 'g'),
	(5, 's', 'ss', 's', 's');
/*!40000 ALTER TABLE `trequest_by` ENABLE KEYS */;

-- Dumping structure for table sad.trippass
CREATE TABLE IF NOT EXISTS `trippass` (
  `pass_id` int(10) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `cellnumber` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `purpose` varchar(50) NOT NULL,
  `tirpid` int(10) NOT NULL,
  PRIMARY KEY (`pass_id`),
  KEY `FK_trippass_tripsched` (`tirpid`),
  CONSTRAINT `FK_trippass_tripsched` FOREIGN KEY (`tirpid`) REFERENCES `tripsched` (`trip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table sad.trippass: ~7 rows (approximately)
/*!40000 ALTER TABLE `trippass` DISABLE KEYS */;
INSERT INTO `trippass` (`pass_id`, `fname`, `mname`, `lname`, `cellnumber`, `destination`, `purpose`, `tirpid`) VALUES
	(4, 'dfgh', 'dfg', 'dty', 'dfghj\r\n\r\n', '', '', 6),
	(6, 'dfghj', 'rtty', 'dfg', 'sdfg', '', '', 6),
	(7, 'g', 'g', 'g', 'g', '', '', 8),
	(8, 'f', 'f', 'f', 'f', '', '', 8),
	(9, 's', 's', 's', 's', '', '', 9),
	(10, 's', 's', 's', 's', '', '', 9),
	(11, 's', 's', 's', 's', '', '', 9);
/*!40000 ALTER TABLE `trippass` ENABLE KEYS */;

-- Dumping structure for table sad.tripsched
CREATE TABLE IF NOT EXISTS `tripsched` (
  `trip_id` int(10) NOT NULL AUTO_INCREMENT,
  `requestdate` date NOT NULL,
  `tripdate` date NOT NULL,
  `tripend` date NOT NULL,
  `purpose` varchar(500) NOT NULL,
  `destination` varchar(500) NOT NULL,
  `ve_id` int(10) NOT NULL,
  `driver_id` int(10) NOT NULL,
  `teamleader` int(10) NOT NULL,
  `travelorder` blob NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `FK_tripsched_vehicle` (`ve_id`),
  KEY `FK_tripsched_driver` (`driver_id`),
  KEY `FK_tripsched_teamleader` (`teamleader`),
  CONSTRAINT `FK_tripsched_driver` FOREIGN KEY (`driver_id`) REFERENCES `tdriver` (`d_id`),
  CONSTRAINT `FK_tripsched_teamleader` FOREIGN KEY (`teamleader`) REFERENCES `trequest_by` (`tl_id`),
  CONSTRAINT `FK_tripsched_vehicle` FOREIGN KEY (`ve_id`) REFERENCES `tvehicle` (`v_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table sad.tripsched: ~4 rows (approximately)
/*!40000 ALTER TABLE `tripsched` DISABLE KEYS */;
INSERT INTO `tripsched` (`trip_id`, `requestdate`, `tripdate`, `tripend`, `purpose`, `destination`, `ve_id`, `driver_id`, `teamleader`, `travelorder`, `status`) VALUES
	(6, '2019-03-24', '2019-03-26', '2019-03-30', 'sdfgh', 'sdtfy', 16, 5, 1, _binary '', 0),
	(7, '2019-03-26', '2019-03-01', '2019-04-01', 's', 'gf', 13, 8, 3, _binary '', 0),
	(8, '2019-03-27', '2019-03-01', '2019-03-04', 'q', 'g', 10, 7, 4, _binary '', 0),
	(9, '2019-03-27', '2019-03-01', '2019-03-01', 'a', 's', 9, 6, 5, _binary '', 0);
/*!40000 ALTER TABLE `tripsched` ENABLE KEYS */;

-- Dumping structure for table sad.tvehicle
CREATE TABLE IF NOT EXISTS `tvehicle` (
  `v_id` int(10) NOT NULL AUTO_INCREMENT,
  `v_type` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `plate_no` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `yearmodel` year(4) NOT NULL,
  PRIMARY KEY (`v_id`),
  UNIQUE KEY `plate_no` (`plate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COMMENT='t=trip';

-- Dumping data for table sad.tvehicle: ~11 rows (approximately)
/*!40000 ALTER TABLE `tvehicle` DISABLE KEYS */;
INSERT INTO `tvehicle` (`v_id`, `v_type`, `color`, `plate_no`, `brand`, `model`, `yearmodel`) VALUES
	(8, 'sd', 'fghjfk', 'd', 'd', 'd', '1999'),
	(9, 'Car', 'brown', 'v4', 'htr', 'thrf', '2000'),
	(10, 'Car', 'e', 'wd', 'sad', 'wdw', '2000'),
	(11, 'Car', 'bluew', 'sd', 'sdc', 'dsf', '2000'),
	(13, 'Car', 'blue', 'zxcvbnxcvbn', 'vbnm,', 'asdfghjkl;\'', '2000'),
	(15, 'Car', 'green', 'qs', 'sd', 's', '2000'),
	(16, 'Bus', 'green', 'df', 'wert', 'wqere', '2000'),
	(17, 'Car', 'brown', 'safcas', 'fs', 'sdff', '2000'),
	(18, 'Car', 'dfgh', 'dsfgh', 'ghjk', 'fghj', '2000'),
	(20, 'Car', 'brow', 'dfghjkasdfg', 'df', 'fghj', '2005'),
	(21, 'Bus', 'u', 'u', 'rf', 'rf', '2001');
/*!40000 ALTER TABLE `tvehicle` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

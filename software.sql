-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 12, 2019 at 06:07 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `software`
--

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `LinkID` int(11) NOT NULL AUTO_INCREMENT,
  `PhysicalAddress` varchar(100) NOT NULL,
  `FriendlyName` varchar(100) NOT NULL,
  `UserType_Id` int(11) NOT NULL,
  PRIMARY KEY (`LinkID`),
  KEY `Foreign` (`UserType_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`LinkID`, `PhysicalAddress`, `FriendlyName`, `UserType_Id`) VALUES
(1, 'Patient.php', 'Patient', 2),
(2, 'Doctor.php', 'Doctor', 1),
(3, 'Receptionist.php', 'Receptionist', 3);

-- --------------------------------------------------------

--
-- Table structure for table `typelink`
--

DROP TABLE IF EXISTS `typelink`;
CREATE TABLE IF NOT EXISTS `typelink` (
  `TypeLinkID` int(11) NOT NULL AUTO_INCREMENT,
  `UserType_Id` int(11) NOT NULL,
  `LinkID` int(11) NOT NULL,
  PRIMARY KEY (`TypeLinkID`),
  KEY `Foreign` (`UserType_Id`),
  KEY `ForeignKey` (`LinkID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Gender` char(1) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `BloodType` varchar(100) NOT NULL,
  `Age` int(11) NOT NULL,
  `UserType_Id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Foreign` (`UserType_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `FirstName`, `LastName`, `Email`, `Password`, `Gender`, `PhoneNumber`, `BloodType`, `Age`, `UserType_Id`) VALUES
(4, 'clara', 'kamal', 'clara@gmail.com', '123', 'F', '01232030312', 'O+', 21, 1),
(7, 'veronia', 'emad', 'vero@gmail.com', '1111', 'F', '1442534656', 'O+', 13, 3);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
CREATE TABLE IF NOT EXISTS `usertype` (
  `UserType_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) NOT NULL,
  PRIMARY KEY (`UserType_Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`UserType_Id`, `Type`) VALUES
(1, 'Doctor'),
(2, 'Patient'),
(3, 'Receptionist');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

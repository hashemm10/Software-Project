-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 22, 2019 at 11:14 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `AID` int(11) NOT NULL AUTO_INCREMENT,
  `Address` varchar(300) NOT NULL,
  `SRK` int(11) NOT NULL,
  PRIMARY KEY (`AID`),
  KEY `SRK` (`SRK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `CID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `credithrs` int(11) NOT NULL,
  `semester` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `successrate` decimal(10,0) NOT NULL,
  `parentID` int(11) NOT NULL,
  PRIMARY KEY (`CID`),
  KEY `parentID` (`parentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
CREATE TABLE IF NOT EXISTS `links` (
  `LinkID` int(11) NOT NULL AUTO_INCREMENT,
  `PhysicalAddress` varchar(100) NOT NULL,
  `FriendlyName` varchar(100) NOT NULL,
  PRIMARY KEY (`LinkID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`LinkID`, `PhysicalAddress`, `FriendlyName`) VALUES
(1, 'Patient.php', 'Patient'),
(2, 'Doctor.php', 'Doctor'),
(3, 'Receptionist.php', 'Receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `registration_ID` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `NofStudents` int(40) NOT NULL,
  PRIMARY KEY (`registration_ID`),
  KEY `UID` (`User_ID`),
  KEY `student_id` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registration_details`
--

DROP TABLE IF EXISTS `registration_details`;
CREATE TABLE IF NOT EXISTS `registration_details` (
  `regDetails_ID` int(11) NOT NULL AUTO_INCREMENT,
  `registration_ID` int(11) NOT NULL,
  `registration_date` date NOT NULL,
  `course_ID` int(11) NOT NULL,
  `midterm_grade` decimal(10,0) NOT NULL,
  `final_grade` decimal(10,0) NOT NULL,
  `classwork_grade` decimal(10,0) NOT NULL,
  `course_grade` decimal(10,0) NOT NULL,
  PRIMARY KEY (`regDetails_ID`),
  KEY `course_ID` (`course_ID`),
  KEY `registration_ID` (`registration_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `specializations`
--

DROP TABLE IF EXISTS `specializations`;
CREATE TABLE IF NOT EXISTS `specializations` (
  `specID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`specID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `studinfo`
--

DROP TABLE IF EXISTS `studinfo`;
CREATE TABLE IF NOT EXISTS `studinfo` (
  `Student_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `enroll_yr` date NOT NULL,
  `grad_yr` date NOT NULL,
  `specID` int(11) NOT NULL,
  `semGPA` decimal(10,0) NOT NULL,
  `cumGPA` decimal(10,0) NOT NULL,
  `totalCrHrs` int(11) NOT NULL,
  `remCrHrs` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`Student_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `specID` (`specID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `telephones`
--

DROP TABLE IF EXISTS `telephones`;
CREATE TABLE IF NOT EXISTS `telephones` (
  `Tel_ID` int(11) NOT NULL AUTO_INCREMENT,
  `numbers` varchar(100) NOT NULL,
  `user_ID` int(11) NOT NULL,
  PRIMARY KEY (`Tel_ID`),
  KEY `user_ID` (`user_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Gender` char(1) NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `Address_id` int(11) NOT NULL,
  `TELID` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  `UserType_Id` int(11) NOT NULL,
  PRIMARY KEY (`UID`),
  KEY `Foreign` (`UserType_Id`),
  KEY `Address_id` (`Address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
CREATE TABLE IF NOT EXISTS `usertype` (
  `UserType_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) NOT NULL,
  PRIMARY KEY (`UserType_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`UserType_Id`, `Type`) VALUES
(1, 'Dean'),
(2, 'Professor'),
(3, 'Assistant'),
(4, 'Lecturer'),
(5, 'Administrator'),
(6, 'Accountant'),
(7, 'IT'),
(8, 'Secretary'),
(9, 'Advising'),
(10, 'Control'),
(11, 'Inventory'),
(12, 'Student');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`SRK`) REFERENCES `address` (`AID`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`parentID`) REFERENCES `course` (`CID`);

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`UID`),
  ADD CONSTRAINT `registration_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `users` (`UID`);

--
-- Constraints for table `registration_details`
--
ALTER TABLE `registration_details`
  ADD CONSTRAINT `registration_details_ibfk_1` FOREIGN KEY (`course_ID`) REFERENCES `course` (`CID`),
  ADD CONSTRAINT `registration_details_ibfk_2` FOREIGN KEY (`registration_ID`) REFERENCES `registration` (`registration_ID`);

--
-- Constraints for table `studinfo`
--
ALTER TABLE `studinfo`
  ADD CONSTRAINT `studinfo_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`UID`),
  ADD CONSTRAINT `studinfo_ibfk_2` FOREIGN KEY (`specID`) REFERENCES `specializations` (`specID`);

--
-- Constraints for table `telephones`
--
ALTER TABLE `telephones`
  ADD CONSTRAINT `telephones_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`UID`);

--
-- Constraints for table `typelink`
--
ALTER TABLE `typelink`
  ADD CONSTRAINT `typelink_ibfk_1` FOREIGN KEY (`LinkID`) REFERENCES `links` (`LinkID`),
  ADD CONSTRAINT `typelink_ibfk_2` FOREIGN KEY (`UserType_Id`) REFERENCES `usertype` (`UserType_Id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`UserType_Id`) REFERENCES `usertype` (`UserType_Id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`Address_id`) REFERENCES `address` (`AID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

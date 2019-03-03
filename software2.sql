-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 03, 2019 at 09:12 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`AID`, `Address`, `SRK`) VALUES
(1, 'Egypt', 1),
(2, 'Cairo', 1),
(3, 'Giza', 1),
(4, 'Alexandria', 1),
(5, 'Dakahlia', 1),
(6, 'Red Sea', 1),
(7, 'the lake', 1),
(8, 'Fayoum', 1),
(9, 'Gharbia', 1),
(10, 'Ismaili', 1),
(11, 'Menoufia', 1),
(12, 'Minya', 1),
(13, 'Qaliubiya', 1),
(14, 'El Wadi El-Gedid', 1),
(15, 'Suez', 1),
(16, 'Aswan', 1),
(17, 'Assiut', 1),
(18, 'Beni Suef', 1),
(19, 'Port Said', 1),
(20, 'Damietta', 1),
(21, 'Sharqia', 1),
(22, 'South Sinai', 1),
(23, 'Kafr al-Sheikh', 1),
(24, 'Matrouh', 1),
(25, 'Luxor', 1),
(26, 'Qena', 1),
(27, 'North Sinai', 1),
(28, 'Helwan', 1),
(29, 'Sohag', 1),
(30, '6th of October', 3),
(31, 'Dokki', 2),
(32, 'Ain Shams', 2),
(33, 'El Marg', 2),
(34, '10th of Ramadan', 21),
(35, 'El Matareya', 2),
(36, 'El Rehab', 2),
(37, 'Heliopolis', 2);

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
  `specialization` int(11) NOT NULL,
  `تربوي/تثقيفي` varchar(300) NOT NULL,
  `parentID` int(11) NOT NULL,
  `Availability` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CID`),
  KEY `parentID` (`parentID`),
  KEY `specialization` (`specialization`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Department` varchar(300) NOT NULL,
  PRIMARY KEY (`ID`)
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
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`LinkID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
CREATE TABLE IF NOT EXISTS `options` (
  `optionsID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`optionsID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`optionsID`, `name`, `type`, `created_date`, `last_updated_date`, `is_deleted`) VALUES
(1, 'Previous Job Title', 'Text', '2019-02-28 04:15:00', '2019-02-28 04:15:00', 0),
(2, 'English Level', 'Combo Box', '2019-02-28 04:15:00', '2019-02-28 04:15:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE IF NOT EXISTS `registration` (
  `registration_ID` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `Instructor_ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`registration_ID`),
  KEY `UID` (`Instructor_ID`),
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
  `course_grade` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
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
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
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
  `dep_ID` int(11) NOT NULL,
  `spec_ID` int(11) NOT NULL,
  `semGPA` decimal(10,0) NOT NULL,
  `cumGPA` decimal(10,0) NOT NULL,
  `totalCrHrs` int(11) NOT NULL,
  `remCrHrs` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `specID` (`spec_ID`),
  KEY `Dep_ID` (`dep_ID`)
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
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
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
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
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
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Nationality` varchar(100) NOT NULL,
  `Address_id` int(11) NOT NULL,
  `TELID` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  `UserType_Id` int(11) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `Foreign` (`UserType_Id`),
  KEY `Address_id` (`Address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `FirstName`, `LastName`, `Email`, `Password`, `Gender`, `Nationality`, `Address_id`, `TELID`, `Age`, `UserType_Id`) VALUES
(8, 'Alaa', 'Mohamed', 'alaa@gmail.com', '111', 'F', 'Egyptian', 1, 1, 21, 1),
(9, 'clara', 'Kamal', 'clarakamal247@gmail.com', '111', 'F', 'Egyptian', 1, 1, 21, 2),
(11, 'Hashem', 'Mohamed', 'hashem@gmail.com', '111', 'M', 'Egyptian', 1, 1, 21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_options`
--

DROP TABLE IF EXISTS `users_options`;
CREATE TABLE IF NOT EXISTS `users_options` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `usersID` int(11) NOT NULL,
  `optionsID` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `usersID` (`usersID`),
  KEY `optionsID` (`optionsID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_options`
--

INSERT INTO `users_options` (`ID`, `usersID`, `optionsID`, `created_date`, `last_updated_date`, `is_deleted`) VALUES
(1, 8, 1, '2019-02-28 04:20:00', '2019-02-28 04:20:00', 0),
(2, 9, 2, '2019-02-28 04:20:00', '2019-02-28 04:20:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_options_value`
--

DROP TABLE IF EXISTS `users_options_value`;
CREATE TABLE IF NOT EXISTS `users_options_value` (
  `valueID` int(11) NOT NULL AUTO_INCREMENT,
  `users_optionsID` int(11) NOT NULL,
  `value` varchar(300) NOT NULL,
  `usersID` int(11) NOT NULL,
  PRIMARY KEY (`valueID`),
  KEY `users_optionsID` (`users_optionsID`),
  KEY `usersID` (`usersID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
CREATE TABLE IF NOT EXISTS `usertype` (
  `UserType_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) NOT NULL,
  `created_date` datetime NOT NULL,
  `last_updated_date` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserType_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`UserType_Id`, `Type`, `created_date`, `last_updated_date`, `is_deleted`) VALUES
(1, 'Professor', '2019-02-28 02:20:00', '2019-02-28 02:20:00', 0),
(2, 'IT', '2019-02-28 02:20:00', '2019-02-28 02:20:00', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`SRK`) REFERENCES `address` (`AID`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`parentID`) REFERENCES `course` (`CID`),
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`specialization`) REFERENCES `specializations` (`specID`);

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`Instructor_ID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `registration_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `users` (`userID`);

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
  ADD CONSTRAINT `studinfo_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `studinfo_ibfk_2` FOREIGN KEY (`spec_ID`) REFERENCES `specializations` (`specID`);

--
-- Constraints for table `telephones`
--
ALTER TABLE `telephones`
  ADD CONSTRAINT `telephones_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `typelink`
--
ALTER TABLE `typelink`
  ADD CONSTRAINT `typelink_ibfk_1` FOREIGN KEY (`LinkID`) REFERENCES `links` (`LinkID`),
  ADD CONSTRAINT `typelink_ibfk_2` FOREIGN KEY (`UserType_Id`) REFERENCES `usertype` (`UserType_Id`);

--
-- Constraints for table `users_options`
--
ALTER TABLE `users_options`
  ADD CONSTRAINT `users_options_ibfk_1` FOREIGN KEY (`optionsID`) REFERENCES `options` (`optionsID`),
  ADD CONSTRAINT `users_options_ibfk_2` FOREIGN KEY (`usersID`) REFERENCES `users` (`userID`);

--
-- Constraints for table `users_options_value`
--
ALTER TABLE `users_options_value`
  ADD CONSTRAINT `users_options_value_ibfk_1` FOREIGN KEY (`usersID`) REFERENCES `users` (`userID`),
  ADD CONSTRAINT `users_options_value_ibfk_2` FOREIGN KEY (`users_optionsID`) REFERENCES `users_options` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

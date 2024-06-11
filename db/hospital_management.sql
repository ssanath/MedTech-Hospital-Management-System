-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3310:3310
-- Generation Time: Jan 03, 2024 at 04:44 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `Date` date NOT NULL,
  `PID` int(11) NOT NULL,
  `DID` int(11) NOT NULL,
  `AppID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`Date`, `PID`, `DID`, `AppID`) VALUES
('2023-12-12', 1, 100, 1),
('2023-12-12', 3, 100, 2),
('2002-02-14', 5, 101, 3),
('2023-12-26', 6, 102, 4);

-- --------------------------------------------------------

--
-- Table structure for table `billings`
--

CREATE TABLE `billings` (
  `DID` int(11) NOT NULL,
  `Fees` int(11) NOT NULL,
  `Insurance` varchar(3) NOT NULL,
  `PID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billings`
--

INSERT INTO `billings` (`DID`, `Fees`, `Insurance`, `PID`) VALUES
(100, 800, 'yes', 1),
(100, 600, 'yes', 2),
(100, 750, 'yes', 3),
(101, 1000, 'no', 5),
(102, 750, 'yes', 6);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `DocName` varchar(20) NOT NULL,
  `DocID` int(11) NOT NULL,
  `Cont_No` varchar(20) NOT NULL,
  `Specialization` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`DocName`, `DocID`, `Cont_No`, `Specialization`) VALUES
('Arjun', 100, '9991123567', 'Surgery'),
('Sachin', 101, '8926718902', 'Dermatology'),
('Ajay', 102, '8861567704', 'Cardiology');

-- --------------------------------------------------------

--
-- Table structure for table `medical_record`
--

CREATE TABLE `medical_record` (
  `PID` int(11) NOT NULL,
  `Diagnosis` varchar(50) NOT NULL,
  `RID` int(11) NOT NULL,
  `Medication` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_record`
--

INSERT INTO `medical_record` (`PID`, `Diagnosis`, `RID`, `Medication`) VALUES
(1, 'Acute Flu', 1, 'Syschem'),
(5, 'Rashes', 2, 'Flucort'),
(6, 'Cardio', 3, 'stent');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(20) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Age` int(11) NOT NULL,
  `PID` int(11) NOT NULL,
  `Gender` varchar(7) NOT NULL,
  `Ph_No` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`FirstName`, `LastName`, `Address`, `Age`, `PID`, `Gender`, `Ph_No`) VALUES
('Sanath', 'S', 'Bangalore', 20, 1, 'male', '8861567704'),
('Moulya', 'R', 'Bangalore', 20, 2, 'female', '8861567704'),
('Srujan', 'Kumar', 'Bangalore', 23, 3, 'male', '9023817811'),
('Sid', 'S', 'Bangalore', 20, 4, 'male', '8861567704'),
('Abhay', 'S', 'Bangalore', 21, 5, 'male', '8861567704'),
('Sachin', 'S', 'Bangalore', 20, 6, 'male', '8861567704'),
('Bhavana', 'P', 'Bangalore', 25, 7, 'female', '9927891780');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`AppID`),
  ADD KEY `appointments_ibfk_1` (`DID`),
  ADD KEY `PFK` (`PID`);

--
-- Indexes for table `billings`
--
ALTER TABLE `billings`
  ADD KEY `FPK_billings` (`DID`),
  ADD KEY `FPK_PID` (`PID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`DocID`);

--
-- Indexes for table `medical_record`
--
ALTER TABLE `medical_record`
  ADD KEY `FPK` (`PID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `PFK` FOREIGN KEY (`PID`) REFERENCES `patient` (`PID`),
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`DID`) REFERENCES `doctor` (`DocID`);

--
-- Constraints for table `billings`
--
ALTER TABLE `billings`
  ADD CONSTRAINT `FPK_PID` FOREIGN KEY (`PID`) REFERENCES `patient` (`PID`),
  ADD CONSTRAINT `FPK_billings` FOREIGN KEY (`DID`) REFERENCES `doctor` (`DocID`);

--
-- Constraints for table `medical_record`
--
ALTER TABLE `medical_record`
  ADD CONSTRAINT `FPK` FOREIGN KEY (`PID`) REFERENCES `patient` (`PID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

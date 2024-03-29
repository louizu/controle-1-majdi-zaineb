-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2024 at 04:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jpadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `affectation`
--

CREATE TABLE `affectation` (
  `project_ID` bigint(20) NOT NULL,
  `employees_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companyomuni`
--

CREATE TABLE `companyomuni` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companyomuni`
--

INSERT INTO `companyomuni` (`ID`, `NAME`) VALUES
(-639268872, 'M*Power Internet Services, Inc.');

-- --------------------------------------------------------

--
-- Table structure for table `companyomuni_employeeomuni`
--

CREATE TABLE `companyomuni_employeeomuni` (
  `CompanyOMUni_ID` int(11) NOT NULL,
  `employees_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companyomuni_employeeomuni`
--

INSERT INTO `companyomuni_employeeomuni` (`CompanyOMUni_ID`, `employees_ID`) VALUES
(-639268872, -639256372);

-- --------------------------------------------------------

--
-- Table structure for table `courseuni`
--

CREATE TABLE `courseuni` (
  `ID` int(11) NOT NULL,
  `COURSENAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courseuni`
--

INSERT INTO `courseuni` (`ID`, `COURSENAME`) VALUES
(-1971033864, 'EJB 3.0 101'),
(-1971020764, 'EJB 3.0 202'),
(-1243889748, 'EJB 3.0 101'),
(-1243882348, 'EJB 3.0 202'),
(469923264, 'EJB 3.0 101'),
(469929064, 'EJB 3.0 202'),
(673851088, 'EJB 3.0 101'),
(673863088, 'EJB 3.0 202');

-- --------------------------------------------------------

--
-- Table structure for table `courseuni_studentunit`
--

CREATE TABLE `courseuni_studentunit` (
  `CourseUni_ID` int(11) NOT NULL,
  `students_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courseuni_studentunit`
--

INSERT INTO `courseuni_studentunit` (`CourseUni_ID`, `students_ID`) VALUES
(-1971033864, -1971014264),
(-1971033864, -1970993464),
(-1971020764, -1970993464),
(-1243889748, -1243878648),
(-1243889748, -1243865448),
(-1243882348, -1243865448),
(469923264, 469932364),
(469923264, 469943464),
(469929064, 469943464),
(673851088, 673869988),
(673851088, 673901688),
(673863088, 673901688);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ID` bigint(20) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `POST` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ID`, `EMAIL`, `NAME`, `POST`) VALUES
(1, 'john@example.com', 'John Doe', 'DEV'),
(2, 'jane@example.com', 'Jane Smith', 'MANAGER');

-- --------------------------------------------------------

--
-- Table structure for table `employeeomuni`
--

CREATE TABLE `employeeomuni` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SEXE` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employeeomuni`
--

INSERT INTO `employeeomuni` (`ID`, `NAME`, `SEXE`) VALUES
(-639256372, 'Micah Silverman', 'M');

-- --------------------------------------------------------

--
-- Table structure for table `employee_project`
--

CREATE TABLE `employee_project` (
  `employee_ID` bigint(20) NOT NULL,
  `projects_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_project`
--

INSERT INTO `employee_project` (`employee_ID`, `projects_ID`) VALUES
(1, 1),
(1, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_skills`
--

CREATE TABLE `employee_skills` (
  `employee_ID` bigint(20) DEFAULT NULL,
  `SKILLS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderuni`
--

CREATE TABLE `orderuni` (
  `ID` int(11) NOT NULL,
  `ORDERNAME` varchar(255) DEFAULT NULL,
  `SHIPMENT_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderuni`
--

INSERT INTO `orderuni` (`ID`, `ORDERNAME`, `SHIPMENT_ID`) VALUES
(-707888548, 'Software Order', -707907248),
(672223224, 'Software Order', 672211924);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `ID` bigint(20) NOT NULL,
  `BUDGET` bigint(20) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`ID`, `BUDGET`, `NAME`) VALUES
(1, 10000, 'Project 1'),
(2, 20000, 'Project 2');

-- --------------------------------------------------------

--
-- Table structure for table `sequence`
--

CREATE TABLE `sequence` (
  `SEQ_NAME` varchar(50) NOT NULL,
  `SEQ_COUNT` decimal(38,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sequence`
--

INSERT INTO `sequence` (`SEQ_NAME`, `SEQ_COUNT`) VALUES
('SEQ_GEN', 150);

-- --------------------------------------------------------

--
-- Table structure for table `shipmentbid`
--

CREATE TABLE `shipmentbid` (
  `ID` int(11) NOT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `ZIPCODE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipmentbid`
--

INSERT INTO `shipmentbid` (`ID`, `CITY`, `ZIPCODE`) VALUES
(-707907248, 'Austin', '78727'),
(672211924, 'Austin', '78727');

-- --------------------------------------------------------

--
-- Table structure for table `studentunit`
--

CREATE TABLE `studentunit` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentunit`
--

INSERT INTO `studentunit` (`ID`, `NAME`) VALUES
(-1971014264, 'MAJDI'),
(-1970993464, 'Zaineb'),
(-1243878648, 'MAJDI'),
(-1243865448, 'Zaineb'),
(469932364, 'Zaineb'),
(469943464, NULL),
(673869988, 'MAJDI'),
(673901688, 'Zaineb');

-- --------------------------------------------------------

--
-- Table structure for table `studentuni_courseuni`
--

CREATE TABLE `studentuni_courseuni` (
  `StudentUnit_ID` int(11) NOT NULL,
  `cources_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentuni_courseuni`
--

INSERT INTO `studentuni_courseuni` (`StudentUnit_ID`, `cources_ID`) VALUES
(-1971014264, -1971033864),
(-1970993464, -1971033864),
(-1970993464, -1971020764),
(-1243878648, -1243889748),
(-1243865448, -1243889748),
(-1243865448, -1243882348),
(469932364, 469923264),
(469943464, 469923264),
(469943464, 469929064),
(673869988, 673851088),
(673901688, 673851088),
(673901688, 673863088);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `LOGIN`, `PASSWORD`) VALUES
(1202, 'MAJDI', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affectation`
--
ALTER TABLE `affectation`
  ADD PRIMARY KEY (`project_ID`,`employees_ID`),
  ADD KEY `FK_AFFECTATION_employees_ID` (`employees_ID`);

--
-- Indexes for table `companyomuni`
--
ALTER TABLE `companyomuni`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `companyomuni_employeeomuni`
--
ALTER TABLE `companyomuni_employeeomuni`
  ADD PRIMARY KEY (`CompanyOMUni_ID`,`employees_ID`),
  ADD KEY `FK_COMPANYOMUNI_EMPLOYEEOMUNI_employees_ID` (`employees_ID`);

--
-- Indexes for table `courseuni`
--
ALTER TABLE `courseuni`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `courseuni_studentunit`
--
ALTER TABLE `courseuni_studentunit`
  ADD PRIMARY KEY (`CourseUni_ID`,`students_ID`),
  ADD KEY `FK_COURSEUNI_STUDENTUNIT_students_ID` (`students_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `employeeomuni`
--
ALTER TABLE `employeeomuni`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD PRIMARY KEY (`employee_ID`,`projects_ID`),
  ADD KEY `FK_EMPLOYEE_PROJECT_projects_ID` (`projects_ID`);

--
-- Indexes for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD KEY `FK_employee_SKILLS_employee_ID` (`employee_ID`);

--
-- Indexes for table `orderuni`
--
ALTER TABLE `orderuni`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_ORDERUNI_SHIPMENT_ID` (`SHIPMENT_ID`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sequence`
--
ALTER TABLE `sequence`
  ADD PRIMARY KEY (`SEQ_NAME`);

--
-- Indexes for table `shipmentbid`
--
ALTER TABLE `shipmentbid`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `studentunit`
--
ALTER TABLE `studentunit`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `studentuni_courseuni`
--
ALTER TABLE `studentuni_courseuni`
  ADD PRIMARY KEY (`StudentUnit_ID`,`cources_ID`),
  ADD KEY `FK_STUDENTUNI_COURSEUNI_cources_ID` (`cources_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `affectation`
--
ALTER TABLE `affectation`
  ADD CONSTRAINT `FK_AFFECTATION_employees_ID` FOREIGN KEY (`employees_ID`) REFERENCES `employee` (`ID`),
  ADD CONSTRAINT `FK_AFFECTATION_project_ID` FOREIGN KEY (`project_ID`) REFERENCES `project` (`ID`);

--
-- Constraints for table `companyomuni_employeeomuni`
--
ALTER TABLE `companyomuni_employeeomuni`
  ADD CONSTRAINT `FK_COMPANYOMUNI_EMPLOYEEOMUNI_CompanyOMUni_ID` FOREIGN KEY (`CompanyOMUni_ID`) REFERENCES `companyomuni` (`ID`),
  ADD CONSTRAINT `FK_COMPANYOMUNI_EMPLOYEEOMUNI_employees_ID` FOREIGN KEY (`employees_ID`) REFERENCES `employeeomuni` (`ID`);

--
-- Constraints for table `courseuni_studentunit`
--
ALTER TABLE `courseuni_studentunit`
  ADD CONSTRAINT `FK_COURSEUNI_STUDENTUNIT_CourseUni_ID` FOREIGN KEY (`CourseUni_ID`) REFERENCES `courseuni` (`ID`),
  ADD CONSTRAINT `FK_COURSEUNI_STUDENTUNIT_students_ID` FOREIGN KEY (`students_ID`) REFERENCES `studentunit` (`ID`);

--
-- Constraints for table `employee_project`
--
ALTER TABLE `employee_project`
  ADD CONSTRAINT `FK_EMPLOYEE_PROJECT_employee_ID` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`ID`),
  ADD CONSTRAINT `FK_EMPLOYEE_PROJECT_projects_ID` FOREIGN KEY (`projects_ID`) REFERENCES `project` (`ID`);

--
-- Constraints for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD CONSTRAINT `FK_employee_SKILLS_employee_ID` FOREIGN KEY (`employee_ID`) REFERENCES `employee` (`ID`);

--
-- Constraints for table `orderuni`
--
ALTER TABLE `orderuni`
  ADD CONSTRAINT `FK_ORDERUNI_SHIPMENT_ID` FOREIGN KEY (`SHIPMENT_ID`) REFERENCES `shipmentbid` (`ID`);

--
-- Constraints for table `studentuni_courseuni`
--
ALTER TABLE `studentuni_courseuni`
  ADD CONSTRAINT `FK_STUDENTUNI_COURSEUNI_StudentUnit_ID` FOREIGN KEY (`StudentUnit_ID`) REFERENCES `studentunit` (`ID`),
  ADD CONSTRAINT `FK_STUDENTUNI_COURSEUNI_cources_ID` FOREIGN KEY (`cources_ID`) REFERENCES `courseuni` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

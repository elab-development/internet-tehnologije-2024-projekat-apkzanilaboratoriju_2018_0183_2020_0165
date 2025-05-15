-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2025 at 06:41 PM
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
-- Database: `naucna-laboratorija`
--

-- --------------------------------------------------------

--
-- Table structure for table `autorstvo`
--

CREATE TABLE `autorstvo` (
  `NRID` int(11) NOT NULL,
  `IstrazivacID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `istrazivac`
--

CREATE TABLE `istrazivac` (
  `IstrazivacID` int(11) NOT NULL,
  `Ime` varchar(255) NOT NULL,
  `Prezime` varchar(255) NOT NULL,
  `Biografija` text NOT NULL,
  `EAdresa` varchar(255) NOT NULL,
  `Lozinka` varchar(255) NOT NULL,
  `UlogaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `naucnirad`
--

CREATE TABLE `naucnirad` (
  `NRID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `Verzija` int(11) NOT NULL,
  `Naziv` varchar(255) NOT NULL,
  `Apstrakt` text NOT NULL,
  `DatumObjave` date NOT NULL,
  `PDF` blob NOT NULL,
  `Status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oblast`
--

CREATE TABLE `oblast` (
  `OblastID` int(11) NOT NULL,
  `NazivOblasti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oblastrada`
--

CREATE TABLE `oblastrada` (
  `NRID` int(11) NOT NULL,
  `OblastID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recenzent`
--

CREATE TABLE `recenzent` (
  `RecenzentID` int(11) NOT NULL,
  `Ime` varchar(255) NOT NULL,
  `Prezime` varchar(255) NOT NULL,
  `Biografija` text NOT NULL,
  `EAdresa` varchar(255) NOT NULL,
  `Lozinka` varchar(255) NOT NULL,
  `UlogaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recenzija`
--

CREATE TABLE `recenzija` (
  `NRID` int(11) NOT NULL,
  `RecenzentID` int(11) NOT NULL,
  `Komentar` text NOT NULL,
  `Datum` date NOT NULL,
  `statusID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statusnr`
--

CREATE TABLE `statusnr` (
  `StatusID` int(11) NOT NULL,
  `NazivStatusa` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uloga`
--

CREATE TABLE `uloga` (
  `UlogaID` int(11) NOT NULL,
  `NazivUloge` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autorstvo`
--
ALTER TABLE `autorstvo`
  ADD KEY `autorstvo_ibfk_1` (`IstrazivacID`),
  ADD KEY `autorstvo_ibfk_2` (`NRID`);

--
-- Indexes for table `istrazivac`
--
ALTER TABLE `istrazivac`
  ADD PRIMARY KEY (`IstrazivacID`),
  ADD KEY `Uloga Istrazivaca` (`UlogaID`);

--
-- Indexes for table `naucnirad`
--
ALTER TABLE `naucnirad`
  ADD PRIMARY KEY (`NRID`),
  ADD KEY `naucnirad_ibfk_1` (`Status`);

--
-- Indexes for table `oblast`
--
ALTER TABLE `oblast`
  ADD PRIMARY KEY (`OblastID`);

--
-- Indexes for table `oblastrada`
--
ALTER TABLE `oblastrada`
  ADD KEY `oblastrada_ibfk_1` (`NRID`),
  ADD KEY `oblastrada_ibfk_2` (`OblastID`);

--
-- Indexes for table `recenzent`
--
ALTER TABLE `recenzent`
  ADD PRIMARY KEY (`RecenzentID`),
  ADD KEY `Uloga Recenzenta` (`UlogaID`);

--
-- Indexes for table `recenzija`
--
ALTER TABLE `recenzija`
  ADD KEY `recenzija_ibfk_1` (`NRID`),
  ADD KEY `recenzija_ibfk_2` (`RecenzentID`),
  ADD KEY `recenzija_ibfk_3` (`statusID`);

--
-- Indexes for table `statusnr`
--
ALTER TABLE `statusnr`
  ADD PRIMARY KEY (`StatusID`);

--
-- Indexes for table `uloga`
--
ALTER TABLE `uloga`
  ADD PRIMARY KEY (`UlogaID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `istrazivac`
--
ALTER TABLE `istrazivac`
  MODIFY `IstrazivacID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `naucnirad`
--
ALTER TABLE `naucnirad`
  MODIFY `NRID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oblast`
--
ALTER TABLE `oblast`
  MODIFY `OblastID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recenzent`
--
ALTER TABLE `recenzent`
  MODIFY `RecenzentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statusnr`
--
ALTER TABLE `statusnr`
  MODIFY `StatusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uloga`
--
ALTER TABLE `uloga`
  MODIFY `UlogaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `autorstvo`
--
ALTER TABLE `autorstvo`
  ADD CONSTRAINT `autorstvo_ibfk_1` FOREIGN KEY (`IstrazivacID`) REFERENCES `istrazivac` (`IstrazivacID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `autorstvo_ibfk_2` FOREIGN KEY (`NRID`) REFERENCES `naucnirad` (`NRID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `istrazivac`
--
ALTER TABLE `istrazivac`
  ADD CONSTRAINT `Uloga Istrazivaca` FOREIGN KEY (`UlogaID`) REFERENCES `uloga` (`UlogaID`) ON UPDATE CASCADE;

--
-- Constraints for table `naucnirad`
--
ALTER TABLE `naucnirad`
  ADD CONSTRAINT `naucnirad_ibfk_1` FOREIGN KEY (`Status`) REFERENCES `statusnr` (`StatusID`) ON UPDATE CASCADE;

--
-- Constraints for table `oblastrada`
--
ALTER TABLE `oblastrada`
  ADD CONSTRAINT `oblastrada_ibfk_1` FOREIGN KEY (`NRID`) REFERENCES `naucnirad` (`NRID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `oblastrada_ibfk_2` FOREIGN KEY (`OblastID`) REFERENCES `oblast` (`OblastID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recenzent`
--
ALTER TABLE `recenzent`
  ADD CONSTRAINT `Uloga Recenzenta` FOREIGN KEY (`UlogaID`) REFERENCES `uloga` (`UlogaID`) ON UPDATE CASCADE;

--
-- Constraints for table `recenzija`
--
ALTER TABLE `recenzija`
  ADD CONSTRAINT `recenzija_ibfk_1` FOREIGN KEY (`NRID`) REFERENCES `naucnirad` (`NRID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recenzija_ibfk_2` FOREIGN KEY (`RecenzentID`) REFERENCES `recenzent` (`RecenzentID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `recenzija_ibfk_3` FOREIGN KEY (`statusID`) REFERENCES `statusnr` (`StatusID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

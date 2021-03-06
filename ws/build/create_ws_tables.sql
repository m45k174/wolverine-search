USE ws_db;

-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jul 27, 2017 at 01:36 PM
-- Server version: 5.6.31-77.0-log
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `octpp9or_WolverineSearchLogs`
--

-- --------------------------------------------------------

--
-- Table structure for table `CommandLog`
--

CREATE TABLE IF NOT EXISTS `CommandLog` (
  `Command` varchar(100) NOT NULL COMMENT 'Wolverine Search Registered Command',
  `InitHits` bigint(20) NOT NULL DEFAULT '1' COMMENT 'Number of times command was part of initial query in current period',
  `ResolvedHits` bigint(20) NOT NULL DEFAULT '1' COMMENT 'Number of times command was part of resolved query in current period',
  PRIMARY KEY (`Command`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Counts number of times each registered command was used in the current period.';

-- --------------------------------------------------------

--
-- Table structure for table `FallbackLog`
--

CREATE TABLE IF NOT EXISTS `FallbackLog` (
  `Command` varchar(100) NOT NULL,
  `InitHits` bigint(20) NOT NULL DEFAULT '1' COMMENT 'Number of times command was part of initial query in current period',
  `ResolvedHits` bigint(20) NOT NULL DEFAULT '1' COMMENT 'Number of times command was part of resolved query in current period',
  PRIMARY KEY (`Command`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Counts number of times each fallback command was used in the current period.';

-- --------------------------------------------------------

--
-- Table structure for table `QueryLog`
--

CREATE TABLE IF NOT EXISTS `QueryLog` (
  `Query` varchar(500) NOT NULL COMMENT 'Wolverine Search Query',
  `InitHits` bigint(20) NOT NULL DEFAULT '1' COMMENT 'Number of times command was part of initial query in current period',
  `ResolvedHits` bigint(20) NOT NULL DEFAULT '1' COMMENT 'Number of times command was part of resolved query in current period',
  PRIMARY KEY (`Query`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Counts number of times each unique query was used in the current period.';

-- --------------------------------------------------------

--
-- Table structure for table `UniqueVisitorDevices`
--

CREATE TABLE IF NOT EXISTS `UniqueVisitorDevices` (
  `DeviceID` varchar(500) NOT NULL COMMENT 'Random alphanumeric string unique to a device',
  `LandingPageHits` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Number of times device visited landing page',
  `AboutPageHits` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Number of times device visited about page',
  `ListPageHits` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Number of times device visited list of commands page',
  `SearchHits` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Number of times device used search',
  `DateLastModified` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date when this row was last updated',
  PRIMARY KEY (`DeviceID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Counts number of times each unique query was used in the current period.';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

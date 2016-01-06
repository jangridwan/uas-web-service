-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 06, 2016 at 02:35 PM
-- Server version: 5.5.46
-- PHP Version: 5.3.10-1ubuntu3.21

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `uas-web`
--

-- --------------------------------------------------------

--
-- Table structure for table `laptops`
--

CREATE TABLE IF NOT EXISTS `laptops` (
  `id` int(5) NOT NULL,
  `brand` varchar(10) NOT NULL,
  `model` int(5) NOT NULL,
  `release_year` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laptops`
--

INSERT INTO `laptops` (`id`, `brand`, `model`, `release_year`) VALUES
(1, 'acer', 456, 2016),
(2, 'sony', 123, 2015);

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE IF NOT EXISTS `parts` (
  `id` int(5) NOT NULL,
  `laptop_id` int(5) NOT NULL,
  `part_category` int(5) NOT NULL,
  `part_number` int(5) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`,`laptop_id`,`part_category`),
  KEY `laptop_id` (`laptop_id`),
  KEY `part_category` (`part_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`id`, `laptop_id`, `part_category`, `part_number`, `description`) VALUES
(1, 1, 2, 23, 'seagate'),
(2, 2, 1, 22, 'qwerty');

-- --------------------------------------------------------

--
-- Table structure for table `parts_categories`
--

CREATE TABLE IF NOT EXISTS `parts_categories` (
  `id` int(5) NOT NULL,
  `categories_name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parts_categories`
--

INSERT INTO `parts_categories` (`id`, `categories_name`) VALUES
(1, 'keyboard'),
(2, 'harddisk');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `parts`
--
ALTER TABLE `parts`
  ADD CONSTRAINT `parts_ibfk_2` FOREIGN KEY (`part_category`) REFERENCES `parts_categories` (`id`),
  ADD CONSTRAINT `parts_ibfk_1` FOREIGN KEY (`laptop_id`) REFERENCES `laptops` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

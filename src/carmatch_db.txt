-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Apr 22, 2015 at 01:04 AM
-- Server version: 5.5.38
-- PHP Version: 5.6.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `car_match`
--
CREATE DATABASE IF NOT EXISTS `car_match` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `car_match`;

-- --------------------------------------------------------

--
-- Table structure for table `Access`
--

DROP TABLE IF EXISTS `Access`;
CREATE TABLE `Access` (
  `User` int(11) unsigned NOT NULL,
  `Role` int(11) unsigned NOT NULL,
  `UserName` varchar(256) NOT NULL,
  `Password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Bank`
--

DROP TABLE IF EXISTS `Bank`;
CREATE TABLE `Bank` (
  `Code` int(10) unsigned NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
CREATE TABLE `Category` (
  `Code` int(10) unsigned NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Color`
--

DROP TABLE IF EXISTS `Color`;
CREATE TABLE `Color` (
  `Code` int(10) unsigned NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
CREATE TABLE `Country` (
  `Code` int(10) unsigned NOT NULL,
  `Name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
CREATE TABLE `Customer` (
  `Code` int(11) NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Address` varchar(256) NOT NULL,
  `Zip` varchar(256) NOT NULL,
  `City` varchar(256) NOT NULL,
  `State` varchar(2) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `Phone` varchar(256) NOT NULL,
  `Business` varchar(256) NOT NULL,
  `UserName` varchar(256) NOT NULL,
  `Password` varchar(256) NOT NULL,
  `Registration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Customer-Transactions`
--

DROP TABLE IF EXISTS `Customer-Transactions`;
CREATE TABLE `Customer-Transactions` (
  `Customer` int(11) NOT NULL,
  `Transaction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Feature`
--

DROP TABLE IF EXISTS `Feature`;
CREATE TABLE `Feature` (
  `Code` int(10) unsigned NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Manufacturer`
--

DROP TABLE IF EXISTS `Manufacturer`;
CREATE TABLE `Manufacturer` (
  `Name` varchar(256) NOT NULL,
  `Address` varchar(256) NOT NULL,
  `Country` int(10) unsigned NOT NULL,
  `Details` varchar(256) NOT NULL,
  `Code` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Purchase`
--

DROP TABLE IF EXISTS `Purchase`;
CREATE TABLE `Purchase` (
  `Code` int(10) unsigned NOT NULL,
  `Vehicle` int(10) unsigned NOT NULL,
  `Price` double NOT NULL,
  `Seller` int(10) unsigned NOT NULL,
  `Customer` int(10) unsigned NOT NULL,
  `Transaction` int(10) unsigned NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role` (
  `Code` int(11) unsigned NOT NULL,
  `Description` text NOT NULL,
  `Privileges` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Seller`
--

DROP TABLE IF EXISTS `Seller`;
CREATE TABLE `Seller` (
  `Code` int(10) unsigned NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Address` varchar(256) NOT NULL,
  `Zip` varchar(256) NOT NULL,
  `City` varchar(256) NOT NULL,
  `State` varchar(2) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `Phone` varchar(256) NOT NULL,
  `Business` varchar(256) NOT NULL,
  `UserName` varchar(256) NOT NULL,
  `Password` varchar(256) NOT NULL,
  `Registration` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Seller-Transactions`
--

DROP TABLE IF EXISTS `Seller-Transactions`;
CREATE TABLE `Seller-Transactions` (
  `Seller` int(11) NOT NULL,
  `Transaction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Seller-Vehicles`
--

DROP TABLE IF EXISTS `Seller-Vehicles`;
CREATE TABLE `Seller-Vehicles` (
  `Seller` int(11) NOT NULL,
  `Vehicle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
CREATE TABLE `Transaction` (
  `Code` int(10) unsigned NOT NULL,
  `Status` int(10) unsigned NOT NULL,
  `Description` text NOT NULL,
  `Amount` double NOT NULL,
  `Customer` int(10) unsigned NOT NULL,
  `Seller` int(10) unsigned NOT NULL,
  `Purchase` int(10) unsigned NOT NULL,
  `Bank` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Transaction-Status`
--

DROP TABLE IF EXISTS `Transaction-Status`;
CREATE TABLE `Transaction-Status` (
  `Code` int(10) unsigned NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
CREATE TABLE `Vehicle` (
  `Code` int(11) NOT NULL,
  `Model` varchar(256) NOT NULL,
  `Year` smallint(6) NOT NULL,
  `Manufacturer` int(11) NOT NULL,
  `Mileage` mediumint(9) NOT NULL,
  `Price` mediumint(9) NOT NULL,
  `Color` smallint(6) NOT NULL,
  `Category` smallint(6) NOT NULL,
  `Registration` date NOT NULL,
  `Description` text NOT NULL,
  `Seller` int(11) NOT NULL,
  `Vin` varchar(20) NOT NULL,
  `Verified` tinyint(1) NOT NULL,
  `InsuranceDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle-Features`
--

DROP TABLE IF EXISTS `Vehicle-Features`;
CREATE TABLE `Vehicle-Features` (
  `Vehicle` int(10) unsigned NOT NULL,
  `Feature` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Bank`
--
ALTER TABLE `Bank`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Category`
--
ALTER TABLE `Category`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Color`
--
ALTER TABLE `Color`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Country`
--
ALTER TABLE `Country`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Feature`
--
ALTER TABLE `Feature`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Manufacturer`
--
ALTER TABLE `Manufacturer`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Purchase`
--
ALTER TABLE `Purchase`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Role`
--
ALTER TABLE `Role`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Seller`
--
ALTER TABLE `Seller`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Transaction`
--
ALTER TABLE `Transaction`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Transaction-Status`
--
ALTER TABLE `Transaction-Status`
 ADD PRIMARY KEY (`Code`);

--
-- Indexes for table `Vehicle`
--
ALTER TABLE `Vehicle`
 ADD PRIMARY KEY (`Code`);

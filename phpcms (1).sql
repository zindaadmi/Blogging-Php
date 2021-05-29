-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2019 at 12:03 PM
-- Server version: 10.1.36-MariaDB
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
-- Database: `phpcms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllCategories` ()  BEGIN
SELECT * FROM category ORDER BY datetime DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllProducts` ()  BEGIN
SELECT * FROM category;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_panel`
--

CREATE TABLE `admin_panel` (
  `id` int(10) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `category` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `post` varchar(10000) NOT NULL,
  `post_cat_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_panel`
--

INSERT INTO `admin_panel` (`id`, `datetime`, `title`, `category`, `author`, `image`, `post`, `post_cat_id`) VALUES
(21, 'November-25-2018 13:58:11', 'Who Will win election 2019??', 'Trending', 'prnjlpnd', 'css_epic_file_extension-512.png', 'lorem ipsum', 1),
(22, 'November-26-2018 16:57:29', 'lorem ipsum', 'CSS', 'prnjlpnd', '1_pixFq7k28LKsABpDNRCjJw.png', '<p>P<strong>ranjal Pandey</strong></p>', 9);

-- --------------------------------------------------------

--
-- Table structure for table `bkm`
--

CREATE TABLE `bkm` (
  `postid` int(10) NOT NULL,
  `postname` varchar(100) NOT NULL,
  `bookid` int(10) NOT NULL,
  `username` varchar(10) NOT NULL,
  `author` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bkm`
--

INSERT INTO `bkm` (`postid`, `postname`, `bookid`, `username`, `author`) VALUES
(21, 'Who Will win election 2019??', 7, 'prnjlpnd', 'prnjlpnd'),
(22, 'lorem ipsum', 8, 'prnjlpnd', 'prnjlpnd');

--
-- Triggers `bkm`
--
DELIMITER $$
CREATE TRIGGER `TRGREP9` BEFORE INSERT ON `bkm` FOR EACH ROW BEGIN
IF EXISTS (SELECT * FROM bkm WHERE bkm.postid = NEW.postid AND bkm.author=NEW.author) THEN
       SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'already exists';
       END IF;
       END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `creatorname` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `datetime`, `name`, `creatorname`) VALUES
(1, 'November-08-2018 16:09:36', 'Trending', 'pranjal'),
(2, 'November-08-2018 16:20:50', 'PHP', 'pranjal'),
(4, 'November-08-2018 16:29:32', 'JAVA', 'pranjal'),
(9, 'November-23-2018 17:33:03', 'CSS', 'prnjlpnd');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `approved_by` varchar(100) NOT NULL,
  `status` varchar(5) NOT NULL,
  `admin_panel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `datetime`, `name`, `email`, `comment`, `approved_by`, `status`, `admin_panel_id`) VALUES
(44, 'November-25-2018 13:58:25', 'PRANJAL PANDEY', 'prnjlpnd@gmail.com', 'xcbdh', 'prnjlpnd', 'ON', 21),
(45, 'November-25-2018 13:58:34', 'FB', 'prnjlpnd@gmail.com', 'dfx cdf', 'prnjlpnd', 'ON', 21),
(46, 'November-27-2018 13:25:24', 'PRANJAL PANDEY', 'prnjlpnd@gmail.com', 'fgggf', 'prnjlpnd', 'ON', 21);

--
-- Triggers `comments`
--
DELIMITER $$
CREATE TRIGGER `TRGREP6` BEFORE INSERT ON `comments` FOR EACH ROW SET NEW.name=upper(NEW.name)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(10) NOT NULL,
  `datetime` varchar(50) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `addedby` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `datetime`, `username`, `password`, `addedby`) VALUES
(5, 'December-09-2018 21:47:31', 'ads', '123456', 'prnjlpnd'),
(4, 'November-11-2018 22:33:49', 'Prakhar', '1234', 'prnjlpnd'),
(3, 'November-10-2018 01:10:52', 'prnjlpnd', '1234', 'pranjal'),
(7, 'December-11-2018 20:00:47', 'prnjlpnd123', '1234', 'prnjlpnd'),
(6, 'December-09-2018 21:47:48', 'zuzu', 'zuzu', 'prnjlpnd');

--
-- Triggers `registration`
--
DELIMITER $$
CREATE TRIGGER `TRGREP10` BEFORE INSERT ON `registration` FOR EACH ROW BEGIN
IF EXISTS (SELECT * FROM registration WHERE registration.username = NEW.username) THEN
       SIGNAL SQLSTATE '45059' SET MESSAGE_TEXT = 'already exists';
       END IF;
       END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_panel`
--
ALTER TABLE `admin_panel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`post_cat_id`),
  ADD KEY `fk101` (`author`);

--
-- Indexes for table `bkm`
--
ALTER TABLE `bkm`
  ADD PRIMARY KEY (`bookid`,`username`),
  ADD KEY `FK123` (`postid`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `INDEX` (`admin_panel_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_panel`
--
ALTER TABLE `admin_panel`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `bkm`
--
ALTER TABLE `bkm`
  MODIFY `bookid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_panel`
--
ALTER TABLE `admin_panel`
  ADD CONSTRAINT `fk101` FOREIGN KEY (`author`) REFERENCES `registration` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk2` FOREIGN KEY (`post_cat_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bkm`
--
ALTER TABLE `bkm`
  ADD CONSTRAINT `FK123` FOREIGN KEY (`postid`) REFERENCES `admin_panel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK1` FOREIGN KEY (`admin_panel_id`) REFERENCES `admin_panel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

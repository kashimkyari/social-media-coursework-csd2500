-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2019 at 03:49 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socialapp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `postId` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `createdDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `type` varchar(255) NOT NULL,
  `createdBy` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `postUrl` longblob,
  `createdDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`type`, `createdBy`, `message`, `postUrl`, `createdDate`) VALUES
('post', 'Kashim', 'Hello', 0x2f75706c6f6164732f68746d6c746573742e706e675f546875204d617220323820323031395f676c7a3534795f6f68637332685f2e6a7067, '2019-03-28 02:34:57.820'),
('post', 'Kashim', 'Hellooooooooooooooo', 0x2f75706c6f6164732f4d792050686f6e65203030392e706e675f546875204d617220323820323031395f35747a366a745f306c627571635f2e6a7067, '2019-03-28 02:35:40.022'),
('post', 'Kashim', 'Ayeeeee', 0x2f75706c6f6164732f4d792050686f6e65203030372e6a70675f546875204d617220323820323031395f3833356b7a695f6b717171686f5f2e6a7067, '2019-03-28 02:36:39.612'),
('post', 'Kashim', 'Hellooooo', 0x2f75706c6f6164732f4d792050686f6e65203031332e6a7065675f546875204d617220323820323031395f6a69756730625f7364336f66755f2e6a7067, '2019-03-28 02:39:16.702'),
('post', 'Kashim', 'Does it work?', 0x2f75706c6f6164732f4d792050686f6e65203035362e6a70675f546875204d617220323820323031395f666a656c68385f6e6b333935685f2e6a7067, '2019-03-28 02:41:22.678'),
('post', 'testaccount', 'Hello', 0x2f75706c6f6164732f4d792050686f6e65203030322e706e675f546875204d617220323820323031395f656b696530695f6470306d6a695f2e6a7067, '2019-03-28 02:43:02.400'),
('post', 'testaccount', 'looooooooooool', 0x2f75706c6f6164732f4d792050686f6e65203030382e6a70675f546875204d617220323820323031395f79743767786b5f3566343071745f2e6a7067, '2019-03-28 02:43:19.660'),
('post', 'testaccount', 'mdx', 0x2f75706c6f6164732f4d792050686f6e65203035332e6a70675f546875204d617220323820323031395f3775387a6d685f36746b7574615f2e6a7067, '2019-03-28 02:45:35.443'),
('post', 'testaccount', 'Hiiiiiiiii', 0x2f75706c6f6164732f4d792050686f6e65203031332e6a7065675f546875204d617220323820323031395f64656c666b5f76657474776f5f2e6a7067, '2019-03-28 02:48:46.597');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `loggedInStatus` varchar(255) NOT NULL,
  `registeredDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `country`, `gender`, `loggedInStatus`, `registeredDate`) VALUES
('Kashim', '1234567', 'Naija', 'male', '0', '2019-03-28 02:31:00.437'),
('testaccount', '1234567', 'Mdx', 'male', '0', '2019-03-28 02:42:11.526');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

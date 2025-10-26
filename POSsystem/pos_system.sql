-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 19, 2024 at 07:17 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
CREATE TABLE IF NOT EXISTS `addons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `name`, `price`, `image`) VALUES
(4, 'Box', 9.00, 'uploads/addons/pearl.jpg'),
(3, 'Pearl', 9.00, 'uploads/addons/pearl.jpg'),
(5, 'perlas', 9.00, 'uploads/addons/pearl.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(4, 'Praf'),
(3, 'Hot Coffee'),
(5, 'Specials');

-- --------------------------------------------------------

--
-- Table structure for table `cup_sizes`
--

DROP TABLE IF EXISTS `cup_sizes`;
CREATE TABLE IF NOT EXISTS `cup_sizes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `size_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cup_sizes`
--

INSERT INTO `cup_sizes` (`id`, `category_id`, `size_name`, `price`) VALUES
(1, 4, '12oz', 35.00),
(2, 3, '12oz', 35.00),
(3, 5, '16oz', 49.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `total_price`) VALUES
(1, '2024-05-15 09:03:51', 44.00),
(2, '2024-05-15 09:44:48', 76.00),
(3, '2024-05-15 09:50:21', 88.00),
(4, '2024-05-15 09:55:56', 318.00),
(5, '2024-05-15 09:56:01', 70.00),
(6, '2024-05-15 10:00:00', 212.00),
(7, '2024-05-15 10:16:49', 88.00),
(8, '2024-05-15 10:19:21', 79.00),
(9, '2024-05-15 10:23:23', 226.00),
(10, '2024-05-15 10:23:29', 88.00),
(11, '2024-05-15 10:33:48', 58.00),
(12, '2024-05-15 10:51:10', 44.00),
(13, '2024-05-15 11:26:46', 79.00),
(14, '2024-05-15 11:35:05', 79.00),
(15, '2024-05-15 11:47:23', 9.00),
(16, '2024-05-15 11:47:42', 35.00),
(17, '2024-05-15 11:47:56', 35.00),
(18, '2024-05-15 11:50:17', 35.00),
(19, '2024-05-15 11:50:23', 70.00),
(20, '2024-05-15 11:50:27', 0.00),
(21, '2024-05-15 11:53:04', 35.00),
(22, '2024-05-15 11:53:22', 18.00),
(23, '2024-05-15 11:53:41', 18.00),
(24, '2024-05-15 11:59:07', 9.00),
(25, '2024-05-15 12:01:00', 9.00),
(26, '2024-05-15 12:01:32', 9.00),
(27, '2024-05-15 12:01:37', 9.00),
(28, '2024-05-15 12:05:35', 9.00),
(29, '2024-05-15 12:05:43', 9.00),
(30, '2024-05-15 12:05:52', 0.00),
(31, '2024-05-15 12:05:55', 18.00),
(32, '2024-05-15 12:08:34', 0.00),
(33, '2024-05-15 12:08:47', 0.00),
(34, '2024-05-15 12:12:15', 9.00),
(35, '2024-05-15 12:14:19', 9.00),
(36, '2024-05-15 12:15:37', 44.00),
(37, '2024-05-15 12:16:10', 212.00),
(38, '2024-05-15 12:19:31', 121.00),
(39, '2024-05-15 12:20:36', 53.00),
(40, '2024-05-15 14:16:46', 181.00),
(41, '2024-05-15 14:24:06', 53.00),
(42, '2024-05-15 14:24:19', 97.00),
(43, '2024-05-15 14:25:31', 158.00),
(44, '2024-05-15 14:25:59', 284.00),
(45, '2024-05-15 14:28:12', 79.00),
(46, '2024-05-15 14:28:31', 397.00),
(47, '2024-05-15 14:30:52', 186.00),
(48, '2024-05-15 14:32:59', 190.00),
(49, '2024-05-15 14:35:59', 158.00),
(50, '2024-05-15 14:36:26', 167.00),
(51, '2024-05-15 14:43:49', 706.00),
(52, '2024-05-15 14:44:36', 297.00),
(53, '2024-05-15 14:45:08', 79.00),
(54, '2024-05-16 06:55:20', 216.00),
(55, '2024-05-16 07:15:42', 0.00),
(56, '2024-05-16 07:16:54', 9.00),
(57, '2024-05-16 07:31:45', 67.00),
(58, '2024-05-16 07:35:12', 137.00),
(59, '2024-05-16 07:35:43', 107.00),
(60, '2024-05-16 13:22:57', 0.00),
(61, '2024-05-16 15:52:15', 44.00),
(62, '2024-05-16 15:55:27', 44.00),
(63, '2024-05-16 15:56:53', 44.00),
(64, '2024-05-16 15:59:04', 44.00),
(65, '2024-05-16 16:00:42', 58.00),
(66, '2024-05-17 10:56:25', 115.00),
(67, '2024-05-17 12:18:46', 44.00),
(68, '2024-05-19 04:31:59', 44.00),
(69, '2024-05-19 04:33:38', 9.00),
(70, '2024-05-19 04:39:41', 44.00),
(71, '2024-05-19 04:41:09', 44.00),
(72, '2024-05-19 04:48:04', 44.00),
(73, '2024-05-19 04:51:47', 44.00),
(74, '2024-05-19 04:59:12', 44.00),
(75, '2024-05-19 05:02:56', 9.00),
(76, '2024-05-19 05:09:12', 9.00),
(77, '2024-05-19 05:22:36', 9.00),
(78, '2024-05-19 05:28:32', 44.00),
(79, '2024-05-19 05:30:11', 18.00),
(80, '2024-05-19 05:36:41', 9.00),
(81, '2024-05-19 05:43:46', 9.00),
(82, '2024-05-19 05:47:02', 9.00),
(83, '2024-05-19 05:54:31', 9.00),
(84, '2024-05-19 05:58:44', 9.00),
(85, '2024-05-19 06:02:41', 9.00),
(86, '2024-05-19 06:06:07', 44.00),
(87, '2024-05-19 06:11:12', 9.00),
(88, '2024-05-19 06:11:26', 9.00),
(89, '2024-05-19 06:12:16', 0.00),
(90, '2024-05-19 06:12:56', 9.00),
(91, '2024-05-19 06:13:12', 9.00),
(92, '2024-05-19 06:16:30', 9.00),
(93, '2024-05-19 06:17:43', 9.00),
(94, '2024-05-19 06:18:14', 44.00),
(95, '2024-05-19 06:24:33', 44.00),
(96, '2024-05-19 06:27:07', 44.00),
(97, '2024-05-19 06:28:43', 0.00),
(98, '2024-05-19 06:29:16', 9.00),
(99, '2024-05-19 06:29:29', 9.00),
(100, '2024-05-19 06:30:31', 9.00),
(101, '2024-05-19 06:34:27', 9.00),
(102, '2024-05-19 06:36:19', 9.00),
(103, '2024-05-19 06:40:16', 9.00),
(104, '2024-05-19 06:56:32', 44.00),
(105, '2024-05-19 07:14:41', 44.00),
(106, '2024-05-19 07:15:29', 9.00),
(107, '2024-05-19 07:15:58', 88.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_quantity` int DEFAULT NULL,
  `addon_name` varchar(255) DEFAULT NULL,
  `addon_price` decimal(10,2) DEFAULT NULL,
  `addon_quantity` int DEFAULT NULL,
  `total_item_price` decimal(10,2) DEFAULT NULL,
  `cup_size` varchar(255) DEFAULT NULL,
  `cup_size_price` decimal(10,2) DEFAULT NULL,
  `sugar_level_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`item_id`, `order_id`, `order_date`, `product_name`, `product_quantity`, `addon_name`, `addon_price`, `addon_quantity`, `total_item_price`, `cup_size`, `cup_size_price`, `sugar_level_name`) VALUES
(85, 53, '2024-05-15 14:45:08', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(84, 52, '2024-05-15 14:44:36', 'TeaMilk', 3, 'Pearl', 9.00, 2, 165.00, NULL, 0.00, NULL),
(83, 52, '2024-05-15 14:44:36', 'Hot Brusko', 3, 'Box', 9.00, 3, 132.00, NULL, 0.00, NULL),
(82, 51, '2024-05-15 14:43:49', 'kape barako', 2, 'Pearl', 9.00, 2, 318.00, NULL, 0.00, NULL),
(81, 51, '2024-05-15 14:43:49', 'kape barako', 2, 'Pearl', 9.00, 1, 309.00, NULL, 0.00, NULL),
(80, 51, '2024-05-15 14:43:49', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(79, 50, '2024-05-15 14:36:26', 'Hot Brusko', 2, 'Box', 9.00, 2, 88.00, NULL, 0.00, NULL),
(78, 50, '2024-05-15 14:36:26', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(77, 49, '2024-05-15 14:35:59', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(76, 49, '2024-05-15 14:35:59', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(75, 48, '2024-05-15 14:32:59', 'Hot Brusko', 3, 'Pearl', 9.00, 2, 123.00, NULL, 0.00, NULL),
(74, 48, '2024-05-15 14:32:59', 'TeaMilk', 1, 'Box', 9.00, 2, 67.00, NULL, 0.00, NULL),
(73, 47, '2024-05-15 14:30:52', 'TeaMilk', 2, 'Box', 9.00, 1, 107.00, NULL, 0.00, NULL),
(72, 47, '2024-05-15 14:30:52', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(71, 46, '2024-05-15 14:28:31', 'kape barako', 2, 'Box', 9.00, 2, 318.00, NULL, 0.00, NULL),
(70, 46, '2024-05-15 14:28:31', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(69, 45, '2024-05-15 14:28:12', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(68, 45, '2024-05-15 14:28:12', NULL, 1, NULL, NULL, NULL, 0.00, NULL, 0.00, NULL),
(67, 44, '2024-05-15 14:25:59', 'TeaMilk', 2, 'Box', 9.00, 2, 116.00, NULL, 0.00, NULL),
(66, 44, '2024-05-15 14:25:59', 'kape barako', 1, 'Pearl', 9.00, 2, 168.00, NULL, 0.00, NULL),
(65, 43, '2024-05-15 14:25:31', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(64, 43, '2024-05-15 14:25:31', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(63, 42, '2024-05-15 14:24:19', 'Hot Brusko', 2, 'Box', 9.00, 3, 97.00, NULL, 0.00, NULL),
(62, 41, '2024-05-15 14:24:06', 'Hot Brusko', 1, 'Box', 9.00, 2, 53.00, NULL, 0.00, NULL),
(61, 40, '2024-05-15 14:16:46', 'Hot Brusko', 1, NULL, NULL, NULL, 35.00, NULL, 0.00, NULL),
(60, 40, '2024-05-15 14:16:46', 'TeaMilk', 1, 'Box', 9.00, 2, 67.00, NULL, 0.00, NULL),
(59, 40, '2024-05-15 14:16:46', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(58, 39, '2024-05-15 12:20:36', 'Hot Brusko', 1, 'Pearl', 9.00, 2, 53.00, NULL, 0.00, NULL),
(86, 54, '2024-05-16 06:55:20', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(87, 54, '2024-05-16 06:55:20', 'TeaMilk', 1, 'Box', 9.00, 1, 58.00, NULL, 0.00, NULL),
(88, 54, '2024-05-16 06:55:20', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(89, 55, '2024-05-16 07:15:42', NULL, 1, 'Box', 9.00, 0, 0.00, NULL, 0.00, NULL),
(90, 56, '2024-05-16 07:16:54', NULL, 0, 'Box', 9.00, 1, 9.00, NULL, 0.00, NULL),
(91, 57, '2024-05-16 07:31:45', 'TeaMilk', 1, 'Box', 9.00, 1, 58.00, NULL, 0.00, NULL),
(92, 57, '2024-05-16 07:31:45', NULL, 0, 'Pearl', 9.00, 1, 9.00, NULL, 0.00, NULL),
(93, 58, '2024-05-16 07:35:12', 'TeaMilk', 1, 'Box', 9.00, 1, 58.00, NULL, 0.00, NULL),
(94, 58, '2024-05-16 07:35:12', 'Hot Brusko', 2, 'Box', 9.00, 1, 79.00, NULL, 0.00, NULL),
(95, 59, '2024-05-16 07:35:43', 'TeaMilk', 2, 'Box', 9.00, 1, 107.00, NULL, 0.00, NULL),
(96, 1, '2024-05-15 16:00:00', 'TeaMilk', 1, 'Box', 9.00, 1, 35.00, '12oz', 35.00, NULL),
(97, 1, '2024-05-15 16:00:00', 'TeaMilk', 1, 'Box', 9.00, 1, 35.00, '12oz', 35.00, NULL),
(98, 1, '2024-05-15 16:00:00', 'TeaMilk', 1, 'Box', 9.00, 1, 35.00, '12oz', 35.00, NULL),
(99, 1, '2024-05-15 16:00:00', 'TeaMilk', 1, 'Box', 9.00, 1, 35.00, '12oz', 35.00, NULL),
(100, 1, '2024-05-15 16:00:00', 'Nutella Overload', 1, 'Box', 9.00, 1, 35.00, '12oz', 35.00, NULL),
(101, 1, '2024-05-15 16:00:00', 'TeaMilk', 1, 'Box', 9.00, 1, 9.00, NULL, 0.00, NULL),
(102, 1, '2024-05-15 16:00:00', NULL, 0, '', 0.00, 0, 0.00, NULL, 0.00, NULL),
(103, 1, '2024-05-15 16:00:00', NULL, 0, '', 0.00, 0, 0.00, NULL, 0.00, NULL),
(104, 1, '2024-05-15 16:00:00', NULL, 0, '', 0.00, 0, 0.00, NULL, 0.00, NULL),
(105, 1, '2024-05-15 16:00:00', NULL, 0, '', 0.00, 0, 0.00, NULL, 0.00, NULL),
(106, 1, '2024-05-15 16:00:00', 'TeaMilk', 1, 'Box', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(107, 1, '2024-05-15 16:00:00', NULL, 0, '', 0.00, 0, 0.00, NULL, 0.00, NULL),
(108, 62, '2024-05-16 15:55:27', 'TeaMilk', NULL, 'Box', 9.00, 1, 44.00, '12oz', 0.00, NULL),
(109, 63, '2024-05-16 15:56:53', 'Hot Brusko', NULL, 'Box', 9.00, 1, 44.00, '12oz', 0.00, NULL),
(110, 64, '2024-05-16 15:59:04', 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(111, 65, '2024-05-16 16:00:42', 'Nutella cheese', 1, '0', 9.00, 1, 58.00, '16oz', 49.00, NULL),
(112, 66, '2024-05-17 10:56:25', 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(113, 66, '2024-05-17 10:56:25', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(114, 66, '2024-05-17 10:56:25', 'TeaMilk', 1, '0', 9.00, 2, 53.00, '12oz', 35.00, NULL),
(115, 66, '2024-05-17 10:56:25', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(116, 67, '2024-05-17 12:18:46', 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(117, 1, '2024-05-19 04:25:19', 'Nutella cheese', 1, '0', 9.00, 2, 67.00, '16', 49.00, NULL),
(118, 1, '2024-05-19 04:25:54', 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12', 35.00, NULL),
(119, 1, '2024-05-19 04:28:13', 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12', 35.00, NULL),
(120, 68, '2024-05-19 04:31:59', 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(121, 69, '2024-05-19 04:33:38', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(122, 70, '2024-05-19 04:39:41', 'TeaMilk', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(123, 71, '2024-05-19 04:41:09', 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(124, 72, '2024-05-19 04:48:04', 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(125, 73, '2024-05-19 04:51:47', 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(126, 74, '2024-05-19 04:59:12', 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(127, 75, '2024-05-19 05:02:56', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(128, 76, '2024-05-19 05:09:12', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(129, 77, '2024-05-19 05:22:36', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(130, 78, '2024-05-19 05:28:32', 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(131, 79, '2024-05-19 05:30:11', NULL, 0, '0', 9.00, 2, 18.00, NULL, 0.00, NULL),
(132, 80, '2024-05-19 05:36:41', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(133, 81, '2024-05-19 05:43:46', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(134, 82, '2024-05-19 05:47:02', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(135, 82, '2024-05-19 05:47:02', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(136, 83, '2024-05-19 05:54:31', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(137, 83, '2024-05-19 05:54:31', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(138, 84, '2024-05-19 05:58:44', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(139, 84, '2024-05-19 05:58:44', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(140, 85, '2024-05-19 06:02:41', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(141, 85, '2024-05-19 06:02:41', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(142, 86, '2024-05-19 06:06:07', 'TeaMilk', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(143, 86, '2024-05-19 06:06:07', 'TeaMilk', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(144, 87, '2024-05-19 06:10:01', 'TeaMilk', 1, 'Box', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(145, 87, '2024-05-19 06:11:12', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(146, 87, '2024-05-19 06:11:12', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(147, 88, '2024-05-19 06:11:26', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(148, 88, '2024-05-19 06:11:26', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(149, 89, '2024-05-19 06:12:16', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(150, 90, '2024-05-19 06:12:56', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(151, 91, '2024-05-19 06:13:12', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(152, 92, '2024-05-19 06:16:30', NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(153, 93, '2024-05-19 06:17:43', NULL, 0, 'Box', 9.00, 1, 9.00, NULL, 0.00, NULL),
(154, 94, '2024-05-19 06:18:14', 'Hot Brusko', 1, 'Pearl', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(155, 95, NULL, 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(156, 96, '2024-05-19 06:27:07', 'Hot Brusko', 1, '0', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(157, 98, NULL, NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(158, 99, NULL, NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(159, 100, NULL, 'Hot Brusko', 1, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(160, 101, NULL, NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(161, 102, NULL, NULL, 0, '0', 9.00, 1, 9.00, NULL, 0.00, NULL),
(162, 103, NULL, NULL, 0, 'Box', 9.00, 1, 9.00, NULL, 0.00, NULL),
(163, 104, NULL, 'Hot Brusko', 1, 'Box', 9.00, 1, 44.00, '12oz', 35.00, NULL),
(164, 105, NULL, 'Hot Brusko', 1, 'Box', 9.00, 1, 44.00, '12oz', 35.00, '25%'),
(165, 106, '2024-05-19 07:15:29', NULL, 0, 'Box', 9.00, 1, 9.00, NULL, 0.00, NULL),
(166, 107, '2024-05-19 07:15:58', 'TeaMilk', 2, 'Box', 9.00, 2, 88.00, '12oz', 35.00, '75%');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `category_id`) VALUES
(2, 'Hot Brusko', 'uploads/products/hotcoffee.jpg', 3),
(3, 'TeaMilk', 'uploads/products/pearl.jpg', 4),
(4, 'kape barako', 'uploads/products/hotcoffee.jpg', 3),
(5, 'Nutella Overload', 'uploads/products/nover.jpg', 4),
(6, 'Kape Milo', 'uploads/products/kapemilo.jpg', 3),
(7, 'Nutella cheese', 'uploads/products/kapemilo.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `sugar_level`
--

DROP TABLE IF EXISTS `sugar_level`;
CREATE TABLE IF NOT EXISTS `sugar_level` (
  `level_id` int NOT NULL AUTO_INCREMENT,
  `level_name` varchar(50) NOT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sugar_level`
--

INSERT INTO `sugar_level` (`level_id`, `level_name`) VALUES
(1, '0%'),
(2, '25%'),
(3, '50%'),
(4, '75%'),
(5, '100%');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

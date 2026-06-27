-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2026 at 04:52 PM
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
-- Database: `courier`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `city` varchar(50) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`id`, `name`, `username`, `password`, `city`, `role_id`) VALUES
(6, 'Bisma', 'BismaRider', '123', 'Karachi', 3),
(10, 'Wowwww', 'Wow', '123', 'Karachi', 3);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_phone`, `customer_address`) VALUES
(1, 'Sana', '03031234562', 'Karsaz'),
(2, 'Alia', '03123456786', 'DHA');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--
-- Error reading structure for table courier.roles: #1932 - Table &#039;courier.roles&#039; doesn&#039;t exist in engine
-- Error reading data for table courier.roles: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `courier`.`roles`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `roless`
--

CREATE TABLE `roless` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roless`
--

INSERT INTO `roless` (`role_id`, `role_name`) VALUES
(1, 'user'),
(2, 'admin'),
(3, 'agent');

-- --------------------------------------------------------

--
-- Table structure for table `shipment`
--

CREATE TABLE `shipment` (
  `id` int(11) NOT NULL,
  `tracking_no` varchar(50) NOT NULL,
  `sender_name` varchar(100) NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `from_city` varchar(50) NOT NULL,
  `to_city` varchar(50) NOT NULL,
  `courier_type` varchar(50) NOT NULL,
  `delivery_date` date NOT NULL,
  `status` enum('Pending','In Progress','Delivered') DEFAULT 'Pending',
  `created_by` enum('Admin','Agent','User') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipment`
--

INSERT INTO `shipment` (`id`, `tracking_no`, `sender_name`, `receiver_name`, `from_city`, `to_city`, `courier_type`, `delivery_date`, `status`, `created_by`) VALUES
(3, '1', 'Spiderman', 'Ironman', 'Los Angeles', 'Washington', 'Fragile Item', '2026-07-01', 'In Progress', 'Agent'),
(4, '2', 'Ronaldo', 'Bruno', 'Portu', 'Funchal', 'Other', '2026-06-28', 'Pending', 'Admin'),
(5, '3', 'Batman', 'Diogo', 'Toronto', 'Lapaz', 'Electronics', '2026-07-11', 'Delivered', 'User'),
(6, '4', 'Bisma', 'Iftikhar', 'Karachi', 'Islamabad', 'Parcel', '2026-07-06', 'Delivered', 'Agent'),
(8, '5', 'Riya', 'Mendes', 'Portu', 'Karachi', 'Document', '2026-07-11', 'Pending', 'Agent');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `role_id`) VALUES
(1, 'Bisma', 'bisma@gmail.com', '$2y$10$yI0xPyAhk0wZ4I6pYlmys.UbA6QGli52tpUuNymXcYuXzEwEBMIUS', 2),
(2, 'Ali', 'ali@gmail.com', '$2y$10$.wCMVRDTgi9Fqts2gbd2MOQxGxg7ca9vUnPRU3vEW6Iwt0FejZAse', 1),
(3, 'minhaj', 'minhaj@gmail.com', '$2y$10$SO6Sm1D84tDrY5./A3ORh.vt2vx9H9Rhi58fjCfWPbAxm/df4ogvi', 3),
(4, 'Rio', 'rio@gmail.com', '$2y$10$AvVYj.93Nxh.K2G.9JGr1u8SWrhHNAuPCbqZj06PVBJzn9SY/GZJW', 2),
(5, 'Noor', 'noor@gmail.com', '$2y$10$t2gg.oOPN1WPKmaPE3RmleLwPHPyBYn1qSpVA/V.lx3mMYFcUB6ae', 3),
(6, 'Wow', 'wow@gmail.com', '$2y$10$aS8TEWPjrZPb.MOojdZWvOzoY5bZNVYyOjoenQcNGRICGiyuAKW8S', 3),
(7, 'Rihaana', 'Ri@gmail.com', '$2y$10$5mf6WCJs.E0sbLgklLEVw.fXU/ZnjDs4taLefmdfyE.0WpnOYe7Da', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `roless`
--
ALTER TABLE `roless`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `shipment`
--
ALTER TABLE `shipment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tracking_no` (`tracking_no`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shipment`
--
ALTER TABLE `shipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roless` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

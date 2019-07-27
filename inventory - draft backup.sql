-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 27, 2019 at 05:54 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `type`, `description`) VALUES
(1, 'Shampoo', 'Hair Product'),
(2, 'Gel', 'Hair styling'),
(3, 'Cosmetics', 'Grooming products'),
(4, 'Color', 'Hair colour and dyes');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `type` enum('admin','employee') NOT NULL DEFAULT 'employee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `firstname`, `lastname`, `username`, `password`, `phone`, `address`, `type`) VALUES
(1, 'administrator', 'administrator', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', '0099887766', 'New York, USA', 'admin'),
(2, 'useronly', 'userJones', 'user', '12dea96fec20593566ab75692c9949596833adc9', '123456789', 'Seattle', 'employee'),
(3, 'Karl Joseph', 'Saycon', 'kjsaycon', '97ba606bce005c296a1f6f3560748189c166b12b', '09757808802', 'Davao', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` varchar(13) NOT NULL,
  `employeeId` int(11) NOT NULL,
  `total` double NOT NULL,
  `vat` double NOT NULL,
  `discount` double NOT NULL,
  `payable` double NOT NULL,
  `paid` double NOT NULL,
  `returned` double NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `employeeId`, `total`, `vat`, `discount`, `payable`, `paid`, `returned`, `datetime`) VALUES
('1491729973342', 2, 760, 19, 5, 774, 800, 26, '2017-01-09 15:26:13'),
('1491730560516', 2, 370, 9.25, 5, 374.25, 375, 0.75, '2017-01-09 15:36:00'),
('1492165305284', 2, 270, 6.75, 5, 271.75, 280, 8.25, '2017-01-14 16:21:45'),
('1492189349464', 2, 490, 12.25, 5, 497.25, 500, 2.75, '2017-02-14 23:02:29'),
('1492189946488', 2, 190, 4.75, 5, 189.75, 200, 10.25, '2017-02-14 23:12:26'),
('1492190099626', 2, 120, 3, 5, 118, 120, 2, '2017-04-14 23:14:59'),
('1492190341116', 2, 65, 1.625, 5, 61.625, 62, 0.375, '2017-04-14 23:19:01'),
('1492191099328', 2, 190, 4.75, 5, 189.75, 190, 0.25, '2017-04-14 23:31:39'),
('1492192975710', 2, 770, 19.25, 5, 784.25, 1000, 215.75, '2017-04-15 00:02:55'),
('1492193361407', 2, 865, 21.625, 5, 881.625, 900, 18.375, '2017-03-15 00:09:21'),
('1492313070538', 2, 275, 6.875, 5, 276.875, 300, 23.125, '2017-03-16 09:24:30'),
('1493699328760', 2, 70, 1.75, 5, 66.75, 70, 3.25, '2017-05-02 10:28:48'),
('1493699482352', 2, 190, 4.75, 5, 189.75, 190, 0.25, '2017-05-02 10:31:22'),
('1545956359587', 2, 240, 6, 5, 241, 500, 259, '2018-12-28 08:19:19'),
('1545956406350', 2, 1680, 42, 5, 1717, 3000, 1283, '2018-12-28 08:20:06'),
('1545956454113', 2, 2550, 63.75, 5, 2608.75, 5000, 2391.25, '2018-12-28 08:20:54'),
('1547044070355', 2, 4950, 123.75, 5, 5068.75, 5068.75, 0, '2019-01-09 22:27:50'),
('1547286524941', 2, 18000, 450, 5, 18445, 20000, 1555, '2019-01-12 17:48:44'),
('1547349678036', 2, 12000, 300, 5, 12295, 20000, 7705, '2019-01-13 11:21:18'),
('1547349796480', 2, 1600, 40, 5, 1635, 20000, 18365, '2019-01-13 11:23:16'),
('1547371603582', 2, 6300, 157.5, 5, 6452.5, 10000, 3547.5, '2019-01-13 17:26:43'),
('1547374111370', 2, 210, 5.25, 5, 210.25, 500, 289.75, '2019-01-13 18:08:31'),
('1547375898945', 2, 2150, 53.75, 5, 2198.75, 3000, 801.25, '2019-01-13 18:38:18'),
('1547875500765', 2, 3550, 88.75, 0, 3633.75, 4000, 366.25, '2019-01-19 13:25:00'),
('1547877663653', 2, 3100, 77.5, 0, 3172.5, 4000, 827.5, '2019-01-19 14:01:03'),
('1548406701653', 2, 1205, 30.125, 0, 1230.125, 3000, 1769.875, '2019-01-25 16:58:21');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `supplierId` int(11) NOT NULL,
  `itemcode` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `whprice` double NOT NULL,
  `price` double NOT NULL,
  `60Days` double NOT NULL,
  `120Days` double NOT NULL,
  `quantity` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `categoryId`, `supplierId`, `itemcode`, `name`, `description`, `whprice`, `price`, `60Days`, `120Days`, `quantity`) VALUES
(1, 1, 1, 'RAI 1234', 'Xen Shamp Pro', 'Anti-dandruff shampoo', 300, 190, 300, 400, 50),
(2, 1, 1, 'RAI 4500-345', 'Selsun Blue Pro X', 'General shampoo', 120, 400, 900, 1500, 118),
(3, 4, 2, 'HI-345A6', 'HiColor', 'Red Color 50g box', 190, 500, 30, 40, 100),
(5, 3, 3, 'PL-04677354A', 'Power Light', 'Freshness Cream', 70, 400, 90, 100, 50),
(7, 3, 6, 'BR-900576B', 'Brylcreem (Red)', 'Light glossy hold', 300, 900, 80, 90, 128),
(8, 3, 1, 'BR-990888342', 'Brylcreem (Green)', 'Anti-dandruff', 105, 400, 200, 600, 100),
(9, 3, 3, 'C-900X12', 'Cotton Balls', 'For Clinical Use', 900, 500, 300, 200, 10);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `supplierId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  `datetime` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `productId`, `supplierId`, `quantity`, `price`, `total`, `datetime`) VALUES
(1, 1, 1, 5, 165, 825, '2017-03-14 00:00:00'),
(2, 2, 2, 6, 120, 720, '2017-03-09 00:00:00'),
(3, 1, 1, 1, 24, 24, '2017-05-02 10:02:47'),
(4, 1, 1, 2, 20, 40, '2017-05-02 10:10:37');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `invoiceId` varchar(13) NOT NULL,
  `productId` int(11) NOT NULL,
  `quantity` double NOT NULL,
  `price` int(11) NOT NULL,
  `total` double NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `invoiceId`, `productId`, `quantity`, `price`, `total`, `datetime`) VALUES
(1, '1491729973342', 7, 2, 300, 600, '2017-04-09 15:26:13'),
(3, '1491730560516', 2, 2, 120, 240, '2017-04-09 15:36:00'),
(5, '1492165305284', 5, 2, 70, 140, '2017-04-14 16:21:45'),
(7, '1492189349464', 1, 2, 165, 330, '2017-01-14 23:02:29'),
(9, '1492189946488', 3, 1, 190, 190, '2017-04-14 23:12:26'),
(10, '1492190099626', 2, 1, 120, 120, '2017-04-14 23:14:59'),
(12, '1492191099328', 3, 1, 190, 190, '2017-04-14 23:31:39'),
(14, '1492192975710', 2, 1, 120, 120, '2017-04-15 00:02:55'),
(15, '1492192975710', 1, 2, 165, 330, '2017-02-15 00:02:55'),
(16, '1492193361407', 3, 2, 190, 380, '2017-04-15 00:09:21'),
(17, '1492193361407', 1, 1, 165, 165, '2017-03-15 00:09:21'),
(19, '1492313070538', 5, 3, 70, 210, '2017-04-16 09:24:30'),
(21, '1493699482352', 3, 1, 190, 190, '2017-05-02 10:31:22'),
(22, '1545956359587', 2, 2, 120, 240, '2018-12-28 08:19:19'),
(23, '1545956406350', 2, 14, 120, 1680, '2018-12-28 08:20:06'),
(24, '1545956454113', 3, 10, 190, 1900, '2018-12-28 08:20:54'),
(26, '1547044070355', 1, 30, 165, 4950, '2019-01-09 22:27:50'),
(27, '1547286524941', 9, 20, 900, 18000, '2019-01-12 17:48:44'),
(28, '1547349678036', 9, 30, 400, 12000, '2019-01-13 11:21:18'),
(29, '1547349796480', 9, 10, 160, 1600, '2019-01-13 11:23:16'),
(30, '1547371603582', 5, 90, 70, 6300, '2019-01-13 17:26:43'),
(31, '1547374111370', 5, 3, 70, 210, '2019-01-13 18:08:31'),
(34, '1547875500765', 3, 10, 190, 1900, '2019-01-19 13:25:00'),
(35, '1547875500765', 1, 10, 165, 1650, '2019-01-19 13:25:00'),
(36, '1547877663653', 3, 10, 190, 1900, '2019-01-19 14:01:03'),
(37, '1547877663653', 2, 10, 120, 1200, '2019-01-19 14:01:03'),
(38, '1548406701653', 3, 2, 190, 380, '2019-01-25 16:58:21'),
(39, '1548406701653', 1, 5, 165, 825, '2019-01-25 16:58:21');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `phone`, `address`) VALUES
(1, 'Head & Shoulder', '00000000', 'USA'),
(2, 'Loreal', '1111111', 'France'),
(3, 'Garnier', '22222222', 'France'),
(4, 'Set Wet', '444444', 'India'),
(5, 'Layer', '555555', 'India'),
(6, 'Brylcreem', '777777', 'UK'),
(7, 'Gatsby', '8888888', 'Canada');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryId` (`categoryId`),
  ADD KEY `supplierId` (`supplierId`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`),
  ADD KEY `supplierId` (`supplierId`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productId` (`productId`),
  ADD KEY `invoiceId` (`invoiceId`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`invoiceId`) REFERENCES `invoices` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

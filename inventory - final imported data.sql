-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2019 at 02:58 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.28

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
(1, 'PAINT/THINNER', 'PAINTS OR THINNERS CATEGORY'),
(2, 'EPOXY', 'EPOXY CATEGORY'),
(3, 'BANYERA', 'BANYERA CATEGORY'),
(4, 'NYLON', 'NYLON CATEGORY'),
(5, 'STAINLESS STEEL WIRE', 'STAINLESS STEEL WIRE CATEGORY'),
(6, 'HOOK', 'HOOK CATEGORY'),
(7, 'FAN BELT', 'FAN BELT CATEGORY'),
(8, 'CHEMICALS', 'CHEMICALS CATEGORY'),
(9, 'LIFE JACKET', 'LIFE JACKET CATEGORY'),
(10, 'LIFE RING', 'LIFE RING CATEGORY'),
(11, 'WELDING ELECTROD', 'WELDING ELECTROD CATEGORY'),
(12, 'G.I SCREEN', 'G.I SCREEN CATEGORY'),
(13, 'PLASTIC SCREEN', 'PLASTIC SCREEN CATEGORY'),
(14, 'G.I WIRE', 'G.I WIRE CATEGORY'),
(15, 'RIGGING SUPPLIES', 'RIGGING SUPPLIES CATEGORY'),
(16, 'ELECTRICAL', 'ELECTRICAL CATEGORY'),
(17, 'HARDWARE CLOTH', 'HARDWARE CLOTH CATEGORY'),
(18, 'PLUMBING SUPPLIES', 'PLUMBING SUPPLIES CATEGORY'),
(19, 'AGRICULTURAL SUPPLY', 'AGRICULTURAL SUPPLY CATEGORY'),
(20, 'INDUSTRIAL SUPPLY', 'INDUSTRIAL SUPPLY CATEGORY'),
(21, 'HARDWARE SUPPLY', 'HARDWARE SUPPLY CATEGORY'),
(22, 'CONSTRUCTION SUPPLY', 'CONSTRUCTION SUPPLY CATEGORY'),
(23, 'AUTO SUPPLY', 'AUTO SUPPLY CATEGORY');

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
(1, 'Karl Joseph', 'Saycon', 'user', '12dea96fec20593566ab75692c9949596833adc9', '09757808802', 'Developer - No Address', 'employee'),
(2, 'Ellen Rouela', 'Abjelina', 'ellen', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'N/A', 'N/A', 'employee'),
(3, 'Juliet', 'Albeca', 'juliet', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'N/A', 'N/A', 'employee'),
(4, 'John', 'Bas', 'john', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'N/A', 'N/A', 'employee'),
(5, 'System', 'Admin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'N/A', 'Master Admin - Do Not Delete', 'admin');

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
(1, 1, 71, 'GATI/EN 4/1', 'WHITE 4L', 'ISLAND EPOXY ENAMEL WHITE 4L', 960, 980, 960, 1240, 0),
(2, 1, 71, 'EOUR 12/1', 'WHITE 1L', 'ISLAND EPOXY ENAMEL WHITE 1L', 265, 250, 0, 300, 50),
(3, 1, 71, 'GUAU/IN 4/1', 'ORANGE 4L', 'ISLAND EPOXY ENAMEL ORANGE 4L', 960, 980, 0, 1240, 0),
(4, 1, 71, 'ETRO/IU 12/1', 'ORANGE 1L', 'ISLAND EPOXY ENAMEL ORANGE 1L', 250, 265, 0, 300, 0),
(5, 1, 71, 'GLOG/AN 4/1', 'ULTRA MARINE BLUE 4L', 'ISLAND EPOXY ENAMEL ULTRA MARINE BLUE 4L', 920, 940, 0, 1180, 0),
(6, 1, 71, 'ETLU/TA 12/1', 'ULTRA MARINE BLUE 1L', 'ISLAND EPOXY ENAMEL ULTRA MARINE BLUE 1L', 250, 265, 0, 300, 0),
(7, 1, 71, 'GUEA/JP 4/1', 'MARINE BLUE 4L', 'ISLAND EPOXY ENAMEL MARINE BLUE 4L', 920, 940, 0, 1180, 0),
(8, 1, 71, 'EAOA/LA 12/1', 'MARINE BLUE 1L', 'ISLAND EPOXY ENAMEL MARINE BLUE 1L', 250, 250, 0, 300, 0),
(9, 1, 71, 'GGUI/UN 4/1', 'CLEAR BLUE 4L', 'ISLAND EPOXY ENAMEL CLEAR BLUE 4L', 920, 940, 0, 1180, 0),
(10, 1, 71, 'EAGI/GA 12/1', 'CLEAR BLUE 1L', 'ISLAND EPOXY ENAMEL CLEAR BLUE 1L', 250, 250, 0, 300, 0),
(11, 1, 71, 'GGUI/UN 4/1', 'BABY BLUE 4L', 'ISLAND EPOXY ENAMEL BABY BLUE 4L', 920, 940, 0, 1180, 0),
(12, 1, 71, 'EAGI/GA 12/1', 'BABY BLUE 1L', 'ISLAND EPOXY ENAMEL BABY BLUE 1L', 250, 250, 0, 300, 0),
(13, 1, 71, 'GANJ/LN 4/1', 'CAT. YELLOW 4L', 'ISLAND EPOXY ENAMEL CAT. YELLOW 4L', 960, 980, 0, 1240, 0),
(14, 1, 71, 'EIEU/AN 12/1', 'CAT. YELLOW 1L', 'ISLAND EPOXY ENAMEL CAT. YELLOW 1L', 250, 250, 0, 300, 0),
(15, 1, 71, 'GATI/EN 4/1', 'LEMON YELLOW 4L', 'ISLAND EPOXY ENAMEL LEMON YELLOW 4L', 960, 980, 0, 1240, 0),
(16, 1, 71, 'EOUR 12/1', 'LEMON YELLOW 1L', 'ISLAND EPOXY ENAMEL LEMON YELLOW 1L', 250, 265, 0, 300, 0),
(17, 1, 71, 'GATI/EN 4/1', 'YELLOW 4L', 'ISLAND EPOXY ENAMEL YELLOW 4L', 960, 980, 0, 1240, 0),
(18, 1, 71, 'EOUR 12/1', 'YELLOW 1L', 'ISLAND EPOXY ENAMEL YELLOW 1L', 250, 265, 0, 300, 0),
(19, 1, 71, 'GGUI/UN 4/1', 'JADE GREEN 4L', 'ISLAND EPOXY ENAMEL JADE GREEN 4L', 920, 940, 0, 1180, 0),
(20, 1, 71, 'EAGI/GA 12/1', 'JADE GREEN 1L', 'ISLAND EPOXY ENAMEL JADE GREEN 1L', 250, 250, 0, 300, 0),
(21, 1, 71, 'GGUI/UN 4/1', 'NILE GREEN 4L', 'ISLAND EPOXY ENAMEL NILE GREEN 4L', 920, 940, 0, 1180, 0),
(22, 1, 71, 'EAGI/GA 12/1', 'NILE GREEN 1L', 'ISLAND EPOXY ENAMEL NILE GREEN 1L', 250, 250, 0, 300, 0),
(23, 1, 71, 'GGUI/UN 4/1', 'MINT GREEN 4L', 'ISLAND EPOXY ENAMEL MINT GREEN 4L', 920, 265, 0, 1180, 0),
(24, 1, 71, 'EAGI/GA 12/1', 'MINT GREEN 1L', 'ISLAND EPOXY ENAMEL MINT GREEN 1L', 250, 250, 0, 300, 0),
(25, 1, 71, 'GGUI/UN 4/1', 'ISLAND GREEN 4L', 'ISLAND EPOXY ENAMEL ISLAND GREEN 4L', 920, 940, 0, 1180, 0),
(26, 1, 71, 'EAGI/GA 12/1', 'ISLAND GREEN 1L', 'ISLAND EPOXY ENAMEL ISLAND GREEN 1L', 250, 250, 0, 300, 0),
(27, 1, 71, 'GLNG/AN 4L', 'IVORY 4L', 'ISLAND EPOXY ENAMEL IVORY 4L', 920, 940, 0, 1180, 0),
(28, 1, 71, 'ETLU/TA 12/1', 'IVORY 1L', 'ISLAND EPOXY ENAMEL IVORY 1L', 250, 250, 0, 300, 0),
(29, 1, 71, 'GGUI/UN 4/1', 'SIGNAL RED 4L', 'ISLAND EPOXY ENAMEL SIGNAL RED 4L', 920, 940, 0, 1180, 0),
(30, 1, 71, 'EAGI/GA 12/1', 'SIGNAL RED 1L', 'ISLAND EPOXY ENAMEL SIGNAL RED 1L', 250, 250, 0, 300, 0),
(31, 1, 71, 'GGUI/UN 4/1', 'INTL RED 4L', 'ISLAND EPOXY ENAMEL INTL RED 4L', 920, 940, 0, 1180, 0),
(32, 1, 71, 'EAGI/GA 12/1', 'INTL RED 1L', 'ISLAND EPOXY ENAMEL INTL RED 1L', 250, 250, 0, 300, 0),
(33, 1, 71, 'GGUI/UN 4/1', 'SILVER GRAY 4L', 'ISLAND EPOXY ENAMEL SILVER GRAY 4L', 920, 940, 0, 1180, 0),
(34, 1, 71, 'EAGI/GA 12/1', 'SILVER GRAY 1L', 'ISLAND EPOXY ENAMEL SILVER GRAY 1L', 250, 250, 0, 300, 0),
(35, 1, 71, 'GERE/AN 4/1', 'DARK GRAY 4L', 'ISLAND EPOXY ENAMEL DARK GRAY 4L', 920, 940, 0, 1180, 0),
(36, 1, 71, 'ELGG/AN 12/1', 'DARK GRAY 1L', 'ISLAND EPOXY ENAMEL DARK GRAY 1L', 250, 250, 0, 300, 0),
(37, 1, 71, 'GELR/UN 4/1', 'BLACK 4L', 'ISLAND EPOXY ENAMEL BLACK 4L', 920, 940, 0, 1180, 0),
(38, 1, 71, 'ELAI/LE 12/1', 'BLACK 1L', 'ISLAND EPOXY ENAMEL BLACK 1L', 250, 250, 0, 300, 0),
(39, 1, 71, 'EALN 4/1', 'WHITE 4L', 'ISLAND EPOXY PRIMER WHITE 4L', 755, 830, 0, 920, 0),
(40, 1, 71, 'ERRU/LA 12/1', 'WHITE 1L', 'ISLAND EPOXY PRIMER WHITE 1L', 200, 220, 0, 250, 0),
(41, 1, 71, 'EARR/EN 4/1', 'GRAY 4L', 'ISLAND EPOXY PRIMER GRAY 4L', 740, 220, 0, 900, 0),
(42, 1, 71, 'ENTO/AU 12/1', 'GRAY 1L', 'ISLAND EPOXY PRIMER GRAY 1L', 198, 220, 0, 240, 0),
(43, 1, 71, 'EUTL/UN 4/1', 'BLACK 4L', 'ISLAND EPOXY PRIMER BLACK 4L', 730, 800, 0, 880, 0),
(44, 1, 71, 'ROIA/LE 12/1', 'BLACK 1L', 'ISLAND EPOXY PRIMER BLACK 1L', 195, 215, 0, 235, 0),
(45, 1, 71, 'EUUU/GA 4/1', 'RED OXIDE 4L', 'ISLAND EPOXY PRIMER RED OXIDE 4L', 760, 780, 0, 950, 0),
(46, 1, 71, 'ROAG/AU 12/1', 'RED OXIDE 1L', 'ISLAND EPOXY PRIMER RED OXIDE 1L', 250, 230, 0, 280, 0),
(47, 1, 71, 'ETUT/IN 4/1', 'ETUT/IN 4L', 'ISLAND ANTI FOULING RED 4L', 780, 760, 0, 950, 0),
(48, 1, 71, 'EERI/UN 12/1', 'EERIE UN/ 1L', 'ISLAND ANTI FOULING RED 1L', 230, 250, 0, 280, 0),
(49, 1, 71, 'EUUA/GN 6/1', 'EUUA/GN 4L', 'ISLAND EPOXY REDUCER 4L', 515, 450, 0, 570, 0);

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
(1, '2 in 1 Hardware', '0915-568-2988', 'N/A (Please Update Address)'),
(2, '2003 Metal Product', 'N/A Please update', 'N/A (Please Update Address)'),
(3, 'Artcats Trading Phil', '(082) 330-4226', 'Door #3 Paredes Bldg. Fatima Ave., Matina, Davao City'),
(4, 'Bearing Station', '0917-323-1981', 'N/A (Please Update Address)'),
(5, 'Biz 4 Me', 'N/A Please update', 'N/A (Please Update Address)'),
(6, 'BE JRN Corporation', 'N/A Please update', 'Lot 6 Block 32 Espina Subdivision, Labangal, General Santos City'),
(7, 'Bright Summit', '(083) 302-7379', 'Cagampang St. Cor. Mansanitas St. General Santos City'),
(8, 'Cebu Halleys Industrial Supply Inc.', '(032) 340-9356', 'Lapu-lapu City'),
(9, 'D Lucky Motors', '0917-630-3398', 'Cebu City'),
(10, 'Dovv Sales', '(082) 234-7989', 'GRI Bldg. B1 & B2 Mintrade Drive, R. Castillo Ave., Davao City'),
(11, 'Drysdale', 'N/A Please update', 'N/A (Please Update Address)'),
(12, 'Dynamic Resource', '(02) 668-8859', 'Unit 25-27 Century Commercial, Brgy Salawag, Paliparan-Molino Road Dasmarinas, Cavite'),
(13, 'Ecco Hardware', '(083) 552-2732', 'General Santos City'),
(14, 'Elemont Marketing', '742-7492', 'N/A (Please Update Address)'),
(15, 'Envireau Pacific Inc.', '(082) 300-2994', 'GF Babista Bldg., CM Recto Corner Palma Gil St. Davao City'),
(16, 'Euros Enterprises', '(02) 288-5149', '#44 Celia St. Tinajeros, Malabon City'),
(17, 'Finemates', '(02) 2853- 458', 'N/A (Please Update Address)'),
(18, 'Florsons Marketing', '(083) 552-5179', 'De Dios St., Dadiangas South, General Santos City'),
(19, 'Franksons Pazific Corporation', '0917-327-4833', 'N/A (Please Update Address)'),
(20, 'GCR Stainum Manufacturing Corp.', '(02) 546-4923', '#0334 Parang Catmon, Sta. Maria, Bulacan'),
(21, 'Gelco', 'N/A Please update', 'N/A (Please Update Address)'),
(22, 'Global Synergy Trade & Distribution Corp.', '(083) 552-2801', 'NCCC Compound National Highway General Santos City'),
(23, 'Golden Portals', '(033) 320-7106', 'N/A (Please Update Address)'),
(24, 'Golden View Auto Supply', '(032) 414-0235', 'Hernan Cortes St., Subangdaku, Mandaue City'),
(25, 'Granite Industrial Corporation', '(032) 346-9963', 'FUMI Bldg., Hernan Cortes St., Subangdaku, Mandaue City'),
(26, 'Great Master', '0917-540-8976', 'N/A (Please Update Address)'),
(27, 'Guanco General Merchandising Co., Inc', '(02) 924-1602', '#40 Samar Ave., Diliman, Quezon City'),
(28, 'Henwill', '0932-285-1393', 'N/A (Please Update Address)'),
(29, 'Herco Trading', '(02) 818-7736', '8th Floor Herco Center #114 Benavides St. Legaspi Village Makati City'),
(30, 'Karlsruhe', 'N/A Please update', 'Manila'),
(31, 'Kean Nel Marketing', '0949-157-7929', 'Lot 11 & 12 Purok 10 New Pearly Shell, Mabuhay, GSC'),
(32, 'Keylargo', '0917-320-8835', 'N/A (Please Update Address)'),
(33, 'Kingtop Enterprise, Inc.', '(02) 441-8043', 'Quezon City'),
(34, 'Kupler DCMC Phil. Corp.', '(083) 553-5339', 'National Highway, Calumpang, General Santos City'),
(35, 'Leunam Marketing', '0916-589-1160', 'N/A (Please Update Address)'),
(36, 'Lem Hio Ying', '(02) 713-6287', 'N/A (Please Update Address)'),
(37, 'LIS', '0917-323-1981', 'N/A (Please Update Address)'),
(38, 'Long Life', 'N/A Please update', 'N/A (Please Update Address)'),
(39, 'M&W Distributing Company Inc.', '(02) 371-1936', '#14 Panay Avenue, Quezon City'),
(40, 'MA Marine Engine Parts Supply', '(083) 552-0336', 'Purok Maguindanao, Labangal, GSC'),
(41, 'MAB Logistics & Distribution Specialist, Inc.', '(082) 226-2873', '#096 Dove St., Mafron Heights II, Davao City'),
(42, 'Mandaue Foam Industries, Inc.', '(083) 554-5088', 'National Highway Sinawal, General Santos City'),
(43, 'MC Megawatt', 'N/A Please update', 'N/A (Please Update Address)'),
(44, 'MFM Hardware & Auto Supply', 'N/A Please update', 'N/A (Please Update Address)'),
(45, 'New CTL Marketing Inc.', '(02) 256-2897', '#1416 F. Yuseco St., Corner Kusang Loob St., Sta. Cruz, Manila'),
(46, 'New Royal Plumbing', '733-5969', 'N/A (Please Update Address)'),
(47, 'New Viva Parts Sales Inc.', '(02) 742-3812', '#14 A Kabignayan, Dona Josefa, Quezon City'),
(48, 'Novelty Commercial Corp.', '(365) 1429-32', '#157 9th St. 9th Ave. Brgy 103 Zone 9 Dist.11, Caloocan City'),
(49, 'O&O Marketing Corp.', '(02) 807-3531', '#22 Crosley Lane Liberty Homes, Alabang, Muntinlupa City'),
(50, 'Ong Ta Lead Factory', '(02) 242-2969', 'GF Ong Ta Bldg. 471 Elcano St. Brgy 281 Zone 26 San Nicolas, Manila'),
(51, 'Orion Wire & Cable Inc.', '(02) 636-3367', '#88 (67) Kalingin Road, A Samson I, Quezon City'),
(52, 'Oro Ink Supply System Corp.', '(082) 305-3694', 'Yacapin St. Cogon Cagayan De Oro'),
(53, 'P.I Bearing Industrial Corp.', '(02) 244-7883', '#1148 CM Recto Ave., Manila'),
(54, 'Pamo Corporation', '(02) 872-0060', '319 Km 18 Real St. Barangay Pamplona, Las Pinas City'),
(55, 'Paramount', 'N/A Please update', 'N/A (Please Update Address)'),
(56, 'PBR Enterprises', '0932-470-9869', 'N/A (Please Update Address)'),
(57, 'Power Alliance Corp.', '(082) 234-2005', 'Door 1 A Girl Bldg. Mintrade Drive R. Castillo St. Agdao, Davao City'),
(58, 'PR Sia Manufacturing', '(032) 265-3978', '819- Q Ganciang St.Mambaling, Cebu City'),
(59, 'Pure Metal Inc.', '443-7036', '#17 LB/CA Compound, Lawang Bato, Valenzuela City'),
(60, 'Roadventures', '(083) 877-1673', 'Mabuhay Road Brgy. City Heights, General Santos City'),
(61, 'S&K Industrial Sales & Services Inc.', '(083) 301-8088', 'GF Falgui Bldg., National Highway City Heights, GSC'),
(62, 'Sarangani Power Trade', '(083) 301-0001', 'Pedro Acharon Boulevard, Dadiangas South, General Santos City'),
(63, 'Seaking Commercial', '(02) 871-2003', '#10 Niog Road, Brgy. Niog 3, Bacoor City, Cavite'),
(64, 'Solanda Enterprises, Inc.', '(02) 301-0530', 'Anda Cor., Solana St. Intramuros Manila'),
(65, 'Solden Marine', '(032) 346-8262', 'Cebu City'),
(66, 'Te Kean Lam Hong', '0922-637-0580', 'Cebu City'),
(67, 'Timberland General Merchandising', '(088) 856-9044', 'Julio Pacana St., Puntod Cagayan De Oro'),
(68, 'To-Mi Industrial Supply', 'N/A Please update', 'Poblacion, Kabacan, Cotabato'),
(69, 'Tooltop Commercial Inc.', '419-1075', 'N/A (Please Update Address)'),
(70, 'Topwinner Hardware', '(02) 251-7378', '#1570-1572 Jose Abad Santos Ave., Tondo, Manila'),
(71, 'Treasure Island Industrial Corp.', '(083) 554-3346', 'San Pedro Ext., Lagao, General Santos City'),
(72, 'Twin Aces Industies Inc.', '(02) 371-0793', '#107 Judge J. Luna St., SFDM Quezon City'),
(73, 'Uni-Criston', 'N/A Please update', 'N/A (Please Update Address)'),
(74, 'United Atlantic Industrial Supply', '(02) 563-6539', '#1449 San GregorioSt., Paco, Manila'),
(75, 'United Bearing & Sales Supply ', '(083) 553-2705', 'Peraloza Realty Bldg., National Highway GSC'),
(76, 'United Vinyl Corp.', 'N/A Please update', '70 Escoda Sr. V. Navotas City'),
(77, 'Uni-Up Trading Corporation', '0948-974-4284', 'R. Castillo St., Agdao, Davao City'),
(78, 'Una Intertionale Trading Corporation', '0922-282-6124', 'Cebu City'),
(79, 'V.A Agri Industrial Trading Corporation', '(083) 553-6234', 'VA Agri Bldg. National Highway, City Heights, General Santos City'),
(80, 'V.A & Sons Chemical Inc.', '(033) 337-8831', '#1558 A. Manano Bagbaguin, Valenzuela City'),
(81, 'Vanity Hardware', '0917-854-1969', 'Gedisco Complex 137 Unit 3B M.H. Del Pilar St., Cor. 4th Ave., Caloocan City'),
(82, 'Visco Motor Supply', '(02) 365-0837', '#19 Binmana St. Manresa, Quezon City, Metro Manila'),
(83, 'Welcome Commercial', '0917-844-3263', 'N/A (Please Update Address)'),
(84, 'Wespac Mercantile Co. Inc.', '(02) 241-7595', '#291 Lara St., 284 Zone 026, San Nicolas, Manila, Philippines'),
(85, 'World Lion', '0917-800-9118', 'N/A (Please Update Address)'),
(86, 'Xtrapack Enterprises', '(083) 878-0984', 'Blk.5 Lot 19 Salvani St., Agan Grandville, City Heights, GSC');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

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

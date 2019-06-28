-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2019 at 06:27 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tubespwl`
--

-- --------------------------------------------------------

--
-- Table structure for table `goods`
--

CREATE TABLE `goods` (
  `id_stck` int(11) NOT NULL,
  `name_stck` varchar(120) NOT NULL,
  `brand` varchar(225) NOT NULL,
  `type` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(10) NOT NULL,
  `pict` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `goods`
--

INSERT INTO `goods` (`id_stck`, `name_stck`, `brand`, `type`, `price`, `stock`, `pict`) VALUES
(1, 'Supra Mk4', 'Toyota', 'Sport Car', 718000000, 1, 'tsupra.jpg'),
(2, 'Xpander', 'Mitsubishi', 'MPV', 230000000, 13, 'mxpander.jpg'),
(3, 'Hilux D Cab', 'Toyota', 'SUV', 418000000, 9, 'thilux.jpg'),
(4, '320i', 'BMW', 'Sport Car', 619000000, 4, 'bmw320i.jpg'),
(5, 'CX-5', 'Mazda', 'SUV', 530000000, 10, 'mcx5.jpg'),
(6, 'Mobilio', 'Honda', 'MPV', 236000000, 15, 'hmobilio.jpg'),
(7, 'A-Class', 'Mercedes Benz', 'Sport Car', 609000000, 5, 'maclass.jpg'),
(10, 'Grand Livina', 'Nissan', 'MPV', 249900000, 15, 'nlivina1.jpg'),
(11, 'Santa Fe Sport', 'Hyundai', 'SUV', 417500000, 10, 'hsantafe.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int(11) NOT NULL,
  `name` varchar(56) NOT NULL,
  `address` varchar(225) NOT NULL,
  `order_date` datetime NOT NULL,
  `payment_due` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `name`, `address`, `order_date`, `payment_due`) VALUES
(10, 'Felix Glenaldi', 'Medan, Sumatera Utara', '2019-06-16 17:24:17', '2019-06-17 17:24:17'),
(11, '', '', '2019-06-24 14:31:14', '2019-06-25 14:31:14'),
(12, 'Valthalla', 'Medan', '2019-06-24 14:32:02', '2019-06-25 14:32:02'),
(13, '', '', '2019-06-25 15:19:11', '2019-06-26 15:19:11'),
(14, '', '', '2019-06-25 15:39:19', '2019-06-26 15:39:19'),
(15, '', '', '2019-06-27 11:01:33', '2019-06-28 11:01:33'),
(16, 'Wikel', 'Medan', '2019-06-27 15:22:07', '2019-06-28 15:22:07');

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL,
  `id_inv` int(11) NOT NULL,
  `id_stck` int(11) NOT NULL,
  `name_stck` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `price` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`id`, `id_inv`, `id_stck`, `name_stck`, `jumlah`, `price`, `pilihan`) VALUES
(10, 10, 1, 'Supra Mk5', 1, 718000000, ''),
(11, 11, 2, 'Xpander', 1, 230000000, ''),
(12, 12, 1, 'Supra Mk5', 1, 718000000, ''),
(13, 13, 1, 'Supra Mk5', 1, 718000000, ''),
(14, 14, 1, 'Supra Mk5', 1, 718000000, ''),
(15, 15, 2, 'Xpander', 1, 230000000, ''),
(16, 16, 3, 'Hilux D Cab', 1, 418000000, ''),
(17, 16, 4, '320i', 1, 619000000, '');

--
-- Triggers `tb_order`
--
DELIMITER $$
CREATE TRIGGER `unit` AFTER INSERT ON `tb_order` FOR EACH ROW BEGIN
	UPDATE goods SET stock = stock-NEW.jumlah
    WHERE id_stck = NEW.id_stck;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(2, 'admin', 'admin', 'qwerty', 1),
(3, 'Felix ', 'felix', '121212', 2),
(4, 'James', 'Jamesbond', 'zxcv', 2),
(5, 'Valthalla', 'Valthalla', 'hehe123', 2),
(6, 'nigga', 'nigga', 'black', 2),
(7, 'lix', 'gendu', '123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id_stck`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `goods`
--
ALTER TABLE `goods`
  MODIFY `id_stck` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

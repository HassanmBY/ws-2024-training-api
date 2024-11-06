-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2024 at 05:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_project`
--
CREATE DATABASE IF NOT EXISTS `chat_project` DEFAULT CHARACTER
SET
  utf8mb4 COLLATE utf8mb4_general_ci;

USE `chat_project`;

-- --------------------------------------------------------
--
-- Table structure for table `messages`
--
DROP TABLE IF EXISTS `messages`;

CREATE TABLE
  `messages` (
    `sender` varchar(36) NOT NULL,
    `message` varchar(255) NOT NULL,
    `_state` tinyint (1) NOT NULL DEFAULT 1,
    `_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    `_created` timestamp NOT NULL DEFAULT current_timestamp(),
    `_id` char(36) NOT NULL DEFAULT uuid ()
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--
INSERT INTO
  `messages` (
    `sender`,
    `message`,
    `_state`,
    `_modified`,
    `_created`,
    `_id`
  )
VALUES
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'Message 2 from Insomnia',
    1,
    '2024-11-05 21:47:10',
    '2024-11-05 21:47:10',
    '0a4fe565-9bbf-11ef-abf9-00d8618796a7'
  ),
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'Message 3 from Insomnia',
    1,
    '2024-11-05 21:47:17',
    '2024-11-05 21:47:17',
    '0eababdc-9bbf-11ef-abf9-00d8618796a7'
  ),
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'Message 4 from Insomnia',
    1,
    '2024-11-05 21:47:25',
    '2024-11-05 21:47:25',
    '13c162e5-9bbf-11ef-abf9-00d8618796a7'
  ),
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'Message 4 from Insomnia',
    1,
    '2024-11-05 21:54:50',
    '2024-11-05 21:54:50',
    '1c8485bc-9bc0-11ef-abf9-00d8618796a7'
  ),
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'Message 5 from Insomnia',
    1,
    '2024-11-05 21:55:56',
    '2024-11-05 21:55:56',
    '43d51887-9bc0-11ef-abf9-00d8618796a7'
  ),
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'Message 5 from Insomnia',
    1,
    '2024-11-05 21:56:01',
    '2024-11-05 21:56:01',
    '4738d944-9bc0-11ef-abf9-00d8618796a7'
  ),
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'Message 5 from Insomnia',
    1,
    '2024-11-05 21:57:37',
    '2024-11-05 21:57:37',
    '800a6096-9bc0-11ef-abf9-00d8618796a7'
  ),
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'Message 5 from Insomnia',
    1,
    '2024-11-05 21:57:37',
    '2024-11-05 21:57:37',
    '80481bd8-9bc0-11ef-abf9-00d8618796a7'
  ),
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'contenu du message 2',
    1,
    '2024-11-05 21:43:55',
    '2024-11-05 21:43:55',
    '9625499a-9bbe-11ef-abf9-00d8618796a7'
  ),
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'Message from Insomnia',
    1,
    '2024-11-05 21:45:00',
    '2024-11-05 21:45:00',
    'bd0e95a6-9bbe-11ef-abf9-00d8618796a7'
  ),
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'Message 4 from Insomnia',
    1,
    '2024-11-05 21:52:34',
    '2024-11-05 21:52:34',
    'cbf74dfe-9bbf-11ef-abf9-00d8618796a7'
  ),
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'Message 4 from Insomnia',
    1,
    '2024-11-05 21:53:15',
    '2024-11-05 21:53:15',
    'e3f0c7b1-9bbf-11ef-abf9-00d8618796a7'
  ),
  (
    '436d18e9-9bbd-11ef-abf9-00d8618796a7',
    'Message 4 from Insomnia',
    1,
    '2024-11-05 21:53:36',
    '2024-11-05 21:53:36',
    'f073d33d-9bbf-11ef-abf9-00d8618796a7'
  );

-- --------------------------------------------------------
--
-- Table structure for table `senders`
--
DROP TABLE IF EXISTS `senders`;

CREATE TABLE
  `senders` (
    `sender` varchar(48) NOT NULL UNIQUE,
    `_state` tinyint (1) NOT NULL DEFAULT 1,
    `_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    `_created` timestamp NOT NULL DEFAULT current_timestamp(),
    `_id` char(36) NOT NULL DEFAULT uuid ()
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `senders`
--
INSERT INTO
  `senders` (
    `sender`,
    `_state`,
    `_modified`,
    `_created`,
    `_id`
  )
VALUES
  (
    'Hassan3',
    1,
    '2024-11-05 21:34:13',
    '2024-11-05 21:34:13',
    '3b8d1ce3-9bbd-11ef-abf9-00d8618796a7'
  ),
  (
    'Hassan2',
    1,
    '2024-11-05 21:34:26',
    '2024-11-05 21:34:26',
    '436d18e9-9bbd-11ef-abf9-00d8618796a7'
  ),
  (
    'Hassan1',
    1,
    '2024-11-05 21:30:38',
    '2024-11-05 21:30:38',
    'bb3d2b07-9bbc-11ef-abf9-00d8618796a7'
  );

--
-- Indexes for dumped tables
--
--
-- Indexes for table `messages`
--
ALTER TABLE `messages` ADD PRIMARY KEY (`_id`),
ADD KEY `sender_message` (`sender`);

--
-- Indexes for table `senders`
--
ALTER TABLE `senders` ADD PRIMARY KEY (`_id`);

--
-- Constraints for dumped tables
--
--
-- Constraints for table `messages`
--
ALTER TABLE `messages` ADD CONSTRAINT `sender_message` FOREIGN KEY (`sender`) REFERENCES `senders` (`_id`) ON DELETE CASCADE ON UPDATE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
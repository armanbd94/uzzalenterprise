-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2022 at 12:51 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zahidautoricemill`
--

-- --------------------------------------------------------

--
-- Table structure for table `allowance_deductions`
--

CREATE TABLE `allowance_deductions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Alowance, 2=Deduction, 3=Others',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `allowance_deductions`
--

INSERT INTO `allowance_deductions` (`id`, `name`, `short_name`, `type`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'হোম রেন্ট', 'রেন্ট', '1', '1', '1', 'Super Admin', 'Super Admin', '2022-02-24 02:32:26', '2022-03-02 21:55:52'),
(2, 'ইনকাম ট্যাক্স', 'ট্যাক্স', '2', '1', '1', 'Super Admin', 'Super Admin', '2022-03-02 03:53:50', '2022-03-02 21:55:19'),
(3, 'মেডিকেল খরচ', 'মেডিকেল', '1', '1', '1', 'Super Admin', NULL, '2022-03-02 21:53:35', '2022-03-02 21:53:35'),
(4, 'প্রভিডেন্ট ফান্ড', 'প্রভিডেন্ট', '2', '1', '1', 'Super Admin', NULL, '2022-03-02 21:54:50', '2022-03-02 21:54:50'),
(5, 'কার রেন্ট', 'কার', '1', '1', '1', 'Super Admin', NULL, '2022-03-02 22:36:58', '2022-03-02 22:36:58'),
(6, 'মোবাইল বিল', 'মোবাইল', '1', '1', '1', 'Super Admin', NULL, '2022-03-02 22:39:51', '2022-03-02 22:39:51');

-- --------------------------------------------------------

--
-- Table structure for table `allowance_deduction_manages`
--

CREATE TABLE `allowance_deduction_manages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `allowance_deduction_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1=Alowance, 2=Deduction, 3=Others',
  `basic_salary` double NOT NULL,
  `percentage` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive, 3=Cancel',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `allowance_deduction_manages`
--

INSERT INTO `allowance_deduction_manages` (`id`, `allowance_deduction_id`, `employee_id`, `type`, `basic_salary`, `percentage`, `amount`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(5, 1, 2, 1, 35000, 15, 5250, '1', '2', 'Super Admin', 'Super Admin', '2022-03-21 02:25:29', '2022-03-21 04:04:57'),
(6, 3, 2, 1, 35000, 10, 3500, '1', '2', 'Super Admin', 'Super Admin', '2022-03-21 02:25:29', '2022-03-21 04:04:57'),
(7, 6, 2, 1, 35000, 2, 700, '1', '2', 'Super Admin', 'Super Admin', '2022-03-21 02:25:29', '2022-03-21 04:04:57'),
(8, 2, 2, 2, 35000, 2, 700, '1', '2', 'Super Admin', 'Super Admin', '2022-03-21 02:25:29', '2022-03-21 04:04:57'),
(9, 4, 2, 2, 35000, 5, 1750, '1', '2', 'Super Admin', 'Super Admin', '2022-03-21 02:25:29', '2022-03-21 04:04:57'),
(10, 5, 2, 1, 35000, 5, 1750, '1', '2', 'Super Admin', 'Super Admin', '2022-03-21 04:04:57', '2022-03-21 04:04:57'),
(11, 1, 1, 1, 15000, 15, 2250, '1', '2', 'Super Admin', 'Super Admin', '2022-03-21 04:11:40', '2022-03-21 04:11:40'),
(12, 3, 1, 1, 15000, 10, 1500, '1', '2', 'Super Admin', 'Super Admin', '2022-03-21 04:11:40', '2022-03-21 04:11:40'),
(13, 4, 1, 2, 15000, 2, 300, '1', '2', 'Super Admin', 'Super Admin', '2022-03-21 04:11:40', '2022-03-21 04:11:40');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `warranty` double(8,2) DEFAULT NULL,
  `user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` double NOT NULL,
  `asset_status` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_types`
--

CREATE TABLE `asset_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_types`
--

INSERT INTO `asset_types` (`id`, `name`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'rijwan chowdhury', '1', 'Super Admin', NULL, '2022-02-24 05:43:34', '2022-02-24 05:43:34');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `date_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `am_pm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_str` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_str_am_pm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive, 3=Cancel',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bags`
--

CREATE TABLE `bags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `weight` double(8,2) NOT NULL,
  `unit_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bags`
--

INSERT INTO `bags` (`id`, `weight`, `unit_name`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(2, 50.00, 'kg', '1', 'Admin', NULL, '2021-04-22 05:19:35', '2021-04-22 05:19:35'),
(3, 25.00, 'kg', '1', 'Admin', NULL, '2021-04-22 05:19:50', '2021-04-22 05:19:50');

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `bank_name`, `account_name`, `account_number`, `branch`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'AB', 'company account', '5478512', 'gulshan', '1', 'Super Admin', 'Super Admin', '2022-02-24 04:37:01', '2022-03-20 06:10:09'),
(2, 'city bank', 'company account', '6754398656', 'banani', '1', 'Super Admin', NULL, '2022-03-20 06:10:43', '2022-03-20 06:10:43'),
(3, 'dutch bangla bank', 'company account', '654367', 'motijhill', '1', 'Super Admin', NULL, '2022-03-20 06:50:32', '2022-03-20 06:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('mesars_jahid_oto_raic_mil_cache_active_bags', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:4:{i:0;O:8:\"stdClass\":4:{s:2:\"id\";i:1;s:6:\"weight\";d:75;s:9:\"unit_name\";s:2:\"kg\";s:6:\"status\";s:1:\"1\";}i:1;O:8:\"stdClass\":4:{s:2:\"id\";i:2;s:6:\"weight\";d:50;s:9:\"unit_name\";s:2:\"kg\";s:6:\"status\";s:1:\"1\";}i:2;O:8:\"stdClass\":4:{s:2:\"id\";i:3;s:6:\"weight\";d:25;s:9:\"unit_name\";s:2:\"kg\";s:6:\"status\";s:1:\"1\";}i:3;O:8:\"stdClass\":4:{s:2:\"id\";i:4;s:6:\"weight\";d:72;s:9:\"unit_name\";s:2:\"kg\";s:6:\"status\";s:1:\"1\";}}}', 1962431544),
('mesars_jahid_oto_raic_mil_cache_active_customers', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":1:{s:8:\"\0*\0items\";a:1:{i:0;O:34:\"Modules\\Customer\\Entities\\Customer\":39:{s:11:\"\0*\0fillable\";a:11:{i:0;s:4:\"name\";i:1;s:12:\"company_name\";i:2;s:6:\"mobile\";i:3;s:5:\"email\";i:4;s:17:\"customer_group_id\";i:5;s:4:\"city\";i:6;s:7:\"zipcode\";i:7;s:7:\"address\";i:8;s:6:\"status\";i:9;s:10:\"created_by\";i:10;s:11:\"modified_by\";}s:8:\"\0*\0_name\";N;s:16:\"\0*\0_company_name\";N;s:10:\"\0*\0_mobile\";N;s:9:\"\0*\0_email\";N;s:21:\"\0*\0_customer_group_id\";N;s:10:\"\0*\0_status\";N;s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"customers\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:14:{s:2:\"id\";i:1;s:4:\"name\";s:16:\"rijwan chowdhury\";s:12:\"company_name\";s:8:\"b2g soft\";s:6:\"mobile\";s:11:\"01986348224\";s:5:\"email\";s:20:\"rijwanc007@gmail.com\";s:17:\"customer_group_id\";i:1;s:4:\"city\";s:16:\"dhaka-cantonment\";s:7:\"zipcode\";s:4:\"1206\";s:7:\"address\";s:14:\"135/1 matikata\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-02-21 05:28:18\";s:10:\"updated_at\";s:19:\"2022-02-21 05:28:18\";}s:11:\"\0*\0original\";a:14:{s:2:\"id\";i:1;s:4:\"name\";s:16:\"rijwan chowdhury\";s:12:\"company_name\";s:8:\"b2g soft\";s:6:\"mobile\";s:11:\"01986348224\";s:5:\"email\";s:20:\"rijwanc007@gmail.com\";s:17:\"customer_group_id\";i:1;s:4:\"city\";s:16:\"dhaka-cantonment\";s:7:\"zipcode\";s:4:\"1206\";s:7:\"address\";s:14:\"135/1 matikata\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-02-21 05:28:18\";s:10:\"updated_at\";s:19:\"2022-02-21 05:28:18\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}', 1963137622),
('mesars_jahid_oto_raic_mil_cache_active_departments', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{i:0;O:8:\"stdClass\":8:{s:2:\"id\";i:1;s:4:\"name\";s:13:\"IT Department\";s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";s:11:\"Super Admin\";s:10:\"created_at\";s:19:\"2022-02-24 03:58:05\";s:10:\"updated_at\";s:19:\"2022-03-21 07:14:39\";}}}', 1963206882),
('mesars_jahid_oto_raic_mil_cache_active_designations', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{i:0;O:8:\"stdClass\":8:{s:2:\"id\";i:1;s:4:\"name\";s:17:\"Software Engineer\";s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";s:11:\"Super Admin\";s:10:\"created_at\";s:19:\"2022-02-24 04:20:58\";s:10:\"updated_at\";s:19:\"2022-03-21 07:15:26\";}}}', 1963207445),
('mesars_jahid_oto_raic_mil_cache_active_divisions', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{i:0;O:8:\"stdClass\":9:{s:2:\"id\";i:1;s:4:\"name\";s:5:\"Dhaka\";s:13:\"department_id\";i:1;s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";s:11:\"Super Admin\";s:10:\"created_at\";s:19:\"2022-02-24 04:09:22\";s:10:\"updated_at\";s:19:\"2022-03-21 07:15:04\";}}}', 1963207445),
('mesars_jahid_oto_raic_mil_cache_active_leaves', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{i:0;O:8:\"stdClass\":11:{s:2:\"id\";i:1;s:4:\"name\";s:10:\"rijwan one\";s:10:\"short_name\";s:10:\"department\";s:6:\"number\";i:10;s:10:\"leave_type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"2\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-02-24 07:59:36\";s:10:\"updated_at\";s:19:\"2022-02-24 07:59:36\";}}}', 1963070929),
('mesars_jahid_oto_raic_mil_cache_active_machine_suppliers', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":1:{s:8:\"\0*\0items\";a:3:{i:0;O:34:\"Modules\\Supplier\\Entities\\Supplier\":38:{s:11:\"\0*\0fillable\";a:12:{i:0;s:4:\"name\";i:1;s:12:\"company_name\";i:2;s:6:\"mobile\";i:3;s:5:\"email\";i:4;s:5:\"phone\";i:5;s:4:\"city\";i:6;s:7:\"zipcode\";i:7;s:7:\"address\";i:8;s:4:\"type\";i:9;s:6:\"status\";i:10;s:10:\"created_by\";i:11;s:11:\"modified_by\";}s:8:\"\0*\0_name\";N;s:10:\"\0*\0_mobile\";N;s:9:\"\0*\0_email\";N;s:8:\"\0*\0_type\";N;s:10:\"\0*\0_status\";N;s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"suppliers\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:14:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"rijwan\";s:12:\"company_name\";s:7:\"B2gsoft\";s:6:\"mobile\";s:11:\"01986348224\";s:5:\"email\";s:20:\"rijwanc007@gmail.com\";s:4:\"city\";s:5:\"dhaka\";s:7:\"zipcode\";s:4:\"1206\";s:7:\"address\";s:12:\"1/a matikata\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-02-17 03:45:47\";s:10:\"updated_at\";s:19:\"2022-02-17 03:45:47\";}s:11:\"\0*\0original\";a:14:{s:2:\"id\";i:1;s:4:\"name\";s:6:\"rijwan\";s:12:\"company_name\";s:7:\"B2gsoft\";s:6:\"mobile\";s:11:\"01986348224\";s:5:\"email\";s:20:\"rijwanc007@gmail.com\";s:4:\"city\";s:5:\"dhaka\";s:7:\"zipcode\";s:4:\"1206\";s:7:\"address\";s:12:\"1/a matikata\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-02-17 03:45:47\";s:10:\"updated_at\";s:19:\"2022-02-17 03:45:47\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:1;O:34:\"Modules\\Supplier\\Entities\\Supplier\":38:{s:11:\"\0*\0fillable\";a:12:{i:0;s:4:\"name\";i:1;s:12:\"company_name\";i:2;s:6:\"mobile\";i:3;s:5:\"email\";i:4;s:5:\"phone\";i:5;s:4:\"city\";i:6;s:7:\"zipcode\";i:7;s:7:\"address\";i:8;s:4:\"type\";i:9;s:6:\"status\";i:10;s:10:\"created_by\";i:11;s:11:\"modified_by\";}s:8:\"\0*\0_name\";N;s:10:\"\0*\0_mobile\";N;s:9:\"\0*\0_email\";N;s:8:\"\0*\0_type\";N;s:10:\"\0*\0_status\";N;s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"suppliers\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:14:{s:2:\"id\";i:3;s:4:\"name\";s:31:\"আরামন রহমান\";s:12:\"company_name\";s:27:\"বি আর টি সি\";s:6:\"mobile\";s:11:\"01521225987\";s:5:\"email\";s:41:\"আরামন@জিমেইল.কম\";s:4:\"city\";s:12:\"ঢাকা\";s:7:\"zipcode\";s:4:\"1206\";s:7:\"address\";s:52:\"ঢাকা ক্যান্টনমেন্ট\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-03-01 05:37:09\";s:10:\"updated_at\";s:19:\"2022-03-01 05:37:09\";}s:11:\"\0*\0original\";a:14:{s:2:\"id\";i:3;s:4:\"name\";s:31:\"আরামন রহমান\";s:12:\"company_name\";s:27:\"বি আর টি সি\";s:6:\"mobile\";s:11:\"01521225987\";s:5:\"email\";s:41:\"আরামন@জিমেইল.কম\";s:4:\"city\";s:12:\"ঢাকা\";s:7:\"zipcode\";s:4:\"1206\";s:7:\"address\";s:52:\"ঢাকা ক্যান্টনমেন্ট\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-03-01 05:37:09\";s:10:\"updated_at\";s:19:\"2022-03-01 05:37:09\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:2;O:34:\"Modules\\Supplier\\Entities\\Supplier\":38:{s:11:\"\0*\0fillable\";a:12:{i:0;s:4:\"name\";i:1;s:12:\"company_name\";i:2;s:6:\"mobile\";i:3;s:5:\"email\";i:4;s:5:\"phone\";i:5;s:4:\"city\";i:6;s:7:\"zipcode\";i:7;s:7:\"address\";i:8;s:4:\"type\";i:9;s:6:\"status\";i:10;s:10:\"created_by\";i:11;s:11:\"modified_by\";}s:8:\"\0*\0_name\";N;s:10:\"\0*\0_mobile\";N;s:9:\"\0*\0_email\";N;s:8:\"\0*\0_type\";N;s:10:\"\0*\0_status\";N;s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:9:\"suppliers\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:14:{s:2:\"id\";i:2;s:4:\"name\";s:21:\"রিজওয়ান\";s:12:\"company_name\";s:15:\"বি 2 জি\";s:6:\"mobile\";s:12:\"019863488224\";s:5:\"email\";s:56:\"রিজওয়ানসি007@জিমেইল.কম\";s:4:\"city\";s:12:\"ঢাকা\";s:7:\"zipcode\";s:4:\"1206\";s:7:\"address\";s:24:\"মাটিকাটা\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";s:11:\"Super Admin\";s:10:\"created_at\";s:19:\"2022-02-28 08:26:49\";s:10:\"updated_at\";s:19:\"2022-03-06 06:20:59\";}s:11:\"\0*\0original\";a:14:{s:2:\"id\";i:2;s:4:\"name\";s:21:\"রিজওয়ান\";s:12:\"company_name\";s:15:\"বি 2 জি\";s:6:\"mobile\";s:12:\"019863488224\";s:5:\"email\";s:56:\"রিজওয়ানসি007@জিমেইল.কম\";s:4:\"city\";s:12:\"ঢাকা\";s:7:\"zipcode\";s:4:\"1206\";s:7:\"address\";s:24:\"মাটিকাটা\";s:4:\"type\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";s:11:\"Super Admin\";s:10:\"created_at\";s:19:\"2022-02-28 08:26:49\";s:10:\"updated_at\";s:19:\"2022-03-06 06:20:59\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}', 1962273361),
('mesars_jahid_oto_raic_mil_cache_active_shifts', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:1:{i:0;O:8:\"stdClass\":11:{s:2:\"id\";i:1;s:4:\"name\";s:3:\"Day\";s:10:\"start_time\";s:8:\"09:15:00\";s:8:\"end_time\";s:8:\"18:45:00\";s:12:\"night_status\";s:1:\"1\";s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"2\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";s:11:\"Super Admin\";s:10:\"created_at\";s:19:\"2022-02-24 05:48:17\";s:10:\"updated_at\";s:19:\"2022-03-21 07:16:29\";}}}', 1963206999),
('mesars_jahid_oto_raic_mil_cache_active_taxes', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:0:{}}', 1962272726),
('mesars_jahid_oto_raic_mil_cache_active_warehouses', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:3:{i:0;O:8:\"stdClass\":11:{s:2:\"id\";i:1;s:4:\"name\";s:20:\"Warehouse 1 [ Rice ]\";s:5:\"phone\";N;s:5:\"email\";N;s:7:\"address\";N;s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";s:5:\"Admin\";s:10:\"created_at\";s:19:\"2021-04-11 17:18:33\";s:10:\"updated_at\";s:19:\"2021-04-11 17:27:20\";}i:1;O:8:\"stdClass\":11:{s:2:\"id\";i:2;s:4:\"name\";s:26:\"Warehouse 2 [ By product ]\";s:5:\"phone\";N;s:5:\"email\";N;s:7:\"address\";N;s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";s:5:\"Admin\";s:10:\"created_at\";s:19:\"2021-04-11 17:20:15\";s:10:\"updated_at\";s:19:\"2021-04-11 17:26:59\";}i:2;O:8:\"stdClass\":11:{s:2:\"id\";i:10;s:4:\"name\";s:40:\"কুষ্টিয়া গুদাম\";s:5:\"phone\";s:11:\"01986348224\";s:5:\"email\";s:50:\"কুষ্টিয়া@জিমেইল.কম\";s:7:\"address\";s:24:\"কুষ্টিয়া\";s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-03-01 05:30:58\";s:10:\"updated_at\";s:19:\"2022-03-01 05:30:58\";}}}', 1962272726),
('mesars_jahid_oto_raic_mil_cache_product_categories', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":1:{s:8:\"\0*\0items\";a:3:{i:0;O:19:\"App\\Models\\Category\":35:{s:11:\"\0*\0fillable\";a:4:{i:0;s:4:\"name\";i:1;s:6:\"status\";i:2;s:10:\"created_by\";i:3;s:11:\"modified_by\";}s:7:\"\0*\0name\";N;s:9:\"\0*\0status\";N;s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:2;s:4:\"name\";s:10:\"By product\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2021-04-15 12:47:14\";s:10:\"updated_at\";s:19:\"2021-04-15 12:47:14\";}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:2;s:4:\"name\";s:10:\"By product\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2021-04-15 12:47:14\";s:10:\"updated_at\";s:19:\"2021-04-15 12:47:14\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:1;O:19:\"App\\Models\\Category\":35:{s:11:\"\0*\0fillable\";a:4:{i:0;s:4:\"name\";i:1;s:6:\"status\";i:2;s:10:\"created_by\";i:3;s:11:\"modified_by\";}s:7:\"\0*\0name\";N;s:9:\"\0*\0status\";N;s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:1;s:4:\"name\";s:12:\"চাউল\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";s:11:\"Super Admin\";s:10:\"created_at\";s:19:\"2021-04-15 12:46:17\";s:10:\"updated_at\";s:19:\"2022-03-14 06:15:15\";}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:1;s:4:\"name\";s:12:\"চাউল\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";s:11:\"Super Admin\";s:10:\"created_at\";s:19:\"2021-04-15 12:46:17\";s:10:\"updated_at\";s:19:\"2022-03-14 06:15:15\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}i:2;O:19:\"App\\Models\\Category\":35:{s:11:\"\0*\0fillable\";a:4:{i:0;s:4:\"name\";i:1;s:6:\"status\";i:2;s:10:\"created_by\";i:3;s:11:\"modified_by\";}s:7:\"\0*\0name\";N;s:9:\"\0*\0status\";N;s:8:\"\0*\0order\";a:1:{s:2:\"id\";s:4:\"desc\";}s:15:\"\0*\0column_order\";N;s:13:\"\0*\0orderValue\";N;s:11:\"\0*\0dirValue\";N;s:13:\"\0*\0startVlaue\";N;s:14:\"\0*\0lengthVlaue\";N;s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:10:\"categories\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:13:\"\0*\0attributes\";a:7:{s:2:\"id\";i:4;s:4:\"name\";s:21:\"মিনিকেট\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-03-01 06:35:22\";s:10:\"updated_at\";s:19:\"2022-03-01 06:35:22\";}s:11:\"\0*\0original\";a:7:{s:2:\"id\";i:4;s:4:\"name\";s:21:\"মিনিকেট\";s:6:\"status\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-03-01 06:35:22\";s:10:\"updated_at\";s:19:\"2022-03-01 06:35:22\";}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:8:\"\0*\0dates\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:1;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:1:\"*\";}}}}', 1962598522);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'চাউল', '1', 'Admin', 'Super Admin', '2021-04-15 06:46:17', '2022-03-14 00:15:15'),
(2, 'By product', '1', 'Admin', NULL, '2021-04-15 06:47:14', '2021-04-15 06:47:14'),
(4, 'মিনিকেট', '1', 'Super Admin', NULL, '2022-03-01 00:35:22', '2022-03-01 00:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `type` enum('A','L','I','E') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A=Asset, L=Liabilty, I=income, E=Expense',
  `transaction` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `general_ledger` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `labor_head_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `budget` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `depreciation` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Yes, 2=No',
  `depreciation_rate` double NOT NULL DEFAULT 0,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `code`, `name`, `parent_name`, `level`, `type`, `transaction`, `general_ledger`, `customer_id`, `supplier_id`, `labor_head_id`, `tenant_id`, `budget`, `depreciation`, `depreciation_rate`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, '1', 'Assets', 'COA', 0, 'A', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(2, '2', 'Equity', 'COA', 0, 'L', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(3, '3', 'Income', 'COA', 0, 'I', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(4, '4', 'Expense', 'COA', 0, 'E', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(5, '5', 'Liabilities', 'COA', 0, 'L', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(6, '101', 'Non Current Asset', 'Assets', 1, 'A', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(7, '102', 'Current Asset', 'Assets', 1, 'A', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(8, '301', 'Product Sale', 'Income', 1, 'I', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(9, '302', 'Service Income', 'Income', 1, 'I', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(10, '401', 'Default Expense', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, '1', '1', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(11, '402', 'Material Purchase', 'Expense', 1, 'E', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(12, '403', 'Employee Salary', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(13, '404', 'Machine Purchase', 'Expense', 1, 'E', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(14, '405', 'Maintenance Service', 'Expense', 1, 'E', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(15, '501', 'Non Current Liabilities', 'Liabilities', 1, 'L', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(16, '502', 'Current Liabilities', 'Liabilities', 1, 'L', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(17, '10101', 'Inventory', 'Non Current Asset', 2, 'A', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(18, '10201', 'Cash & Cash Equivalent', 'Current Asset', 2, 'A', '2', '1', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(19, '10202', 'Account Receivable', 'Current Asset', 2, 'A', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(20, '50201', 'Account Payable', 'Current Liabilities', 2, 'L', '2', '1', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(21, '50202', 'Employee Ledger', 'Current Liabilities', 2, 'L', '2', '1', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(22, '50203', 'Tax', 'Current Liabilities', 2, 'L', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(23, '1020101', 'Cash In Hand', 'Cash & Cash Equivalent', 3, 'A', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(24, '1020102', 'Cash At Bank', 'Cash & Cash Equivalent', 3, 'A', '2', '1', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(25, '1020103', 'Cash At Mobile Bank', 'Cash & Cash Equivalent', 3, 'A', '2', '1', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(26, '1020201', 'Customer Receivable', 'Account Receivable', 3, 'A', '2', '1', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(27, '1020202', 'Loan Receivable', 'Account Receivable', 3, 'A', '2', '1', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(28, '10202010001', '1-Walking Customer', 'Customer Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59'),
(116, '5020101', '1-rijwan', 'Account Payable', 3, 'L', '1', '2', NULL, 1, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-02-16 21:45:47', '2022-02-16 21:45:47'),
(117, '10202010002', '1-rijwan chowdhury', 'Customer Receivable', 4, 'A', '1', '2', 1, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-02-20 23:28:18', '2022-02-20 23:28:18'),
(118, '502020001', '1-Kh Nishad', 'Employee Ledger', 3, 'L', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-02-23 23:50:24', '2022-02-23 23:50:24'),
(119, '4000001', 'Office Rent', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', 'Super Admin', '2022-02-24 03:50:22', '2022-03-01 05:10:18'),
(120, '102010202', 'city bank', 'Cash At Bank', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', 'Super Admin', '2022-02-24 04:37:01', '2022-03-20 06:10:43'),
(121, '102010301', 'AB', 'Cash At Mobile Bank', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-02-24 04:57:17', '2022-02-24 04:57:17'),
(122, '5010101', '1-rijwan', 'Take Loan Person Ledger', 2, 'L', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-02-26 23:50:31', '2022-02-26 23:50:31'),
(123, '5020102', '2-রিজওয়ান', 'Account Payable', 3, 'L', '1', '2', NULL, 2, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-02-28 02:26:49', '2022-02-28 02:26:49'),
(124, '5020103', '3-আরামন রহমান', 'Account Payable', 3, 'L', '1', '2', NULL, 3, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-02-28 23:37:09', '2022-02-28 23:37:09'),
(126, '5020104', '12_arman', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 12, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-05 22:46:33', '2022-03-05 22:46:33'),
(127, '5020105', '13_rijwan', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 13, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-05 23:20:21', '2022-03-05 23:20:21'),
(128, '5020106', '14_rijwan', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 14, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-06 02:06:19', '2022-03-06 02:06:19'),
(129, '5020107', '15_rijwan', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 15, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-06 02:06:57', '2022-03-06 02:06:57'),
(130, '5020108', '16_rijwan', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 16, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-06 02:09:55', '2022-03-06 02:09:55'),
(131, '5020109', '17_arman', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 17, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-06 02:10:18', '2022-03-06 02:10:18'),
(132, '5020110', '18_rijwan', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 18, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-06 02:13:48', '2022-03-06 02:13:48'),
(133, '5020111', '19_arman', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 19, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-06 02:28:38', '2022-03-06 02:28:38'),
(134, '406', 'Labor Bill', 'Expense', 1, 'E', '2', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-07 02:43:21', '2022-03-07 02:43:21'),
(135, '5020112', '20_younusur rahman', 'Account Payable', 3, 'L', '1', '2', NULL, NULL, 20, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-08 03:22:12', '2022-03-08 03:22:12'),
(141, '10202010003', '8_rijwan chowdhury', 'Tenant Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, 8, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-08 03:54:12', '2022-03-08 03:54:12'),
(142, '10202010004', '9_rijwan', 'Tenant Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, 9, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-08 04:49:42', '2022-03-08 04:49:42'),
(143, '10202010005', '10_rijwan chowdhury', 'Tenant Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, 10, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-08 04:50:12', '2022-03-08 04:50:44'),
(144, '10202010006', '11_younusur rahman', 'Tenant Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, 11, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-08 04:51:09', '2022-03-08 04:51:24'),
(145, '10202010007', '12_supol chowdhury', 'Tenant Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, 12, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-11 13:48:08', '2022-03-11 13:48:08'),
(146, '10202010008', '13_nadim', 'Tenant Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, 13, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-12 07:57:42', '2022-03-12 07:57:42'),
(147, '10202010009', '14_ismail', 'Tenant Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, 14, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-13 06:25:42', '2022-03-13 06:25:42'),
(148, '10202010010', '15_arif', 'Tenant Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, 15, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-15 05:01:38', '2022-03-15 05:01:38'),
(149, '10202010011', '16_arif', 'Tenant Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, 16, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-15 05:03:45', '2022-03-15 05:04:08'),
(150, '10202010012', '17_sifat', 'Tenant Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, 17, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-15 22:42:14', '2022-03-15 22:42:14'),
(151, '10202010013', '18_moinul ismal omi', 'Tenant Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, 18, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-19 11:19:39', '2022-03-19 11:19:39'),
(152, '102010203', 'dutch bangla bank', 'Cash At Bank', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-20 06:50:32', '2022-03-20 06:50:32'),
(153, '502020002', '2-Md.Younusur Rahman', 'Employee Ledger', 3, 'L', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'Super Admin', NULL, '2022-03-21 01:24:04', '2022-03-21 01:24:04'),
(154, '4000002', '2-বিদ্যুৎ বিল', 'Expense', 1, 'E', '1', '2', NULL, NULL, NULL, NULL, '1', '1', 1, '1', 'Super Admin', NULL, '2022-03-21 04:45:20', '2022-03-21 04:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` bigint(20) UNSIGNED NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `company_name`, `mobile`, `email`, `customer_group_id`, `city`, `zipcode`, `address`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'rijwan chowdhury', 'b2g soft', '01986348224', 'rijwanc007@gmail.com', 1, 'dhaka-cantonment', '1206', '135/1 matikata', '1', 'Super Admin', NULL, '2022-02-20 23:28:18', '2022-02-20 23:28:18');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `percentage` double(8,2) DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `group_name`, `percentage`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Gazi Mahbub ( CEO )', 0.00, '1', 'Admin', NULL, '2021-04-17 04:49:03', '2021-04-17 04:51:49'),
(2, 'Md. Asrafuzzaman', 0.00, '1', 'Admin', NULL, '2021-04-17 04:51:30', '2021-04-17 04:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `daily_closings`
--

CREATE TABLE `daily_closings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `last_day_closing` double DEFAULT NULL,
  `cash_in` double DEFAULT NULL,
  `cash_out` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `adjustment` double DEFAULT NULL,
  `date` date NOT NULL,
  `thousands` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `five_hundred` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `hundred` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `fifty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `twenty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `five` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `two` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `one` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daily_closings`
--

INSERT INTO `daily_closings` (`id`, `last_day_closing`, `cash_in`, `cash_out`, `amount`, `adjustment`, `date`, `thousands`, `five_hundred`, `hundred`, `fifty`, `twenty`, `ten`, `five`, `two`, `one`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 0, 0, NULL, '2022-02-25', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Super Admin', '0', '2022-02-25 12:09:26', '2022-02-25 12:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'IT Department', '1', '1', 'Super Admin', 'Super Admin', '2022-02-23 21:58:05', '2022-03-21 01:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Software Engineer', '1', '1', 'Super Admin', 'Super Admin', '2022-02-23 22:20:58', '2022-03-21 01:15:26');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`id`, `name`, `department_id`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 1, '1', '1', 'Super Admin', 'Super Admin', '2022-02-23 22:09:22', '2022-03-21 01:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `licence_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `mobile`, `nid_no`, `licence_no`, `address`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'rijwan chowdhury', '01986348224', '852147896325', '78741259632', '135/1 matikata', '1', 'Super Admin', NULL, '2022-02-21 05:24:59', '2022-02-21 05:24:59');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photograph` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holiday` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance_type` int(11) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finger_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `job_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Permanent,2=Probation,3=Resigned,4=Suspended',
  `duty_type` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Full Time,2=Part Time,3=Contractual,4=Other',
  `joining_designation_id` bigint(20) UNSIGNED NOT NULL,
  `current_designation_id` bigint(20) UNSIGNED NOT NULL,
  `joining_date` date DEFAULT NULL,
  `probation_start` date DEFAULT NULL,
  `probation_end` date DEFAULT NULL,
  `contract_start` date DEFAULT NULL,
  `contract_end` date DEFAULT NULL,
  `confirmation_date` date DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `termination_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Hourly,2=Salary',
  `rate` double NOT NULL,
  `joining_rate` double DEFAULT NULL,
  `overtime` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Allowed,2=Not Allowed',
  `pay_freequency` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Weekly,2=Biweekly,3=Monthly,4=Annual',
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supervisor_id` int(10) UNSIGNED DEFAULT NULL,
  `is_supervisor` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Yes,2=No',
  `father_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Male,2=Female,3=Other',
  `marital_status` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Single,2=Married,3=Divorced,4=Widowed,5=Other',
  `blood_group` enum('1','2','3','4','5','6','7','8') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=A+,2=B+,3=A-,4=B-,5=AB+,6=AB-,7=O+,8=O-',
  `religion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residential_status` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Resident,2=Non-Resident',
  `emergency_contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emergency_contact_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_emergency_contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_emergency_contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_emergency_contact_relation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternative_emergency_contact_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone`, `photograph`, `alternative_phone`, `city`, `zipcode`, `holiday`, `attendance_type`, `address`, `employee_id`, `finger_id`, `shift_id`, `department_id`, `division_id`, `job_status`, `duty_type`, `joining_designation_id`, `current_designation_id`, `joining_date`, `probation_start`, `probation_end`, `contract_start`, `contract_end`, `confirmation_date`, `termination_date`, `termination_reason`, `rate_type`, `rate`, `joining_rate`, `overtime`, `pay_freequency`, `bank_name`, `account_no`, `supervisor_id`, `is_supervisor`, `father_name`, `mother_name`, `dob`, `gender`, `marital_status`, `blood_group`, `religion`, `nid_no`, `nid_photo`, `residential_status`, `emergency_contact_name`, `emergency_contact_phone`, `emergency_contact_relation`, `emergency_contact_address`, `alternative_emergency_contact_name`, `alternative_emergency_contact_phone`, `alternative_emergency_contact_relation`, `alternative_emergency_contact_address`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Kh Nishad', 'abdussattar.b2gsoft@gmail.com', '01559237416', 'undraw_server_cluster_jwwq-334040.png', '01838974263', 'Dhaka', '1234', NULL, NULL, '99', 'E-1001', '65465454', 1, 1, 1, '1', '1', 1, 1, '2022-02-24', '2022-02-24', '2022-02-24', '2022-02-24', '2022-02-24', '2022-02-24', '2022-02-24', 'dfasdfsad', '1', 15000, 12000, '1', '1', 'AB', '1120011212', 0, '1', 'ab', 'Momita Begum', '2022-02-24', '1', '1', '1', 'Islam', '852147896325', 'undraw_fast_car_p-4-cu-547933.png', '1', 'dasdasd', '01838974266', 'sadasd', '01838974266', 'Nisha', '0410124524242', 'sdfasd', 'asdasd', '1', 'Super Admin', NULL, '2022-02-23 23:50:24', '2022-02-23 23:50:24'),
(2, 'Md.Younusur Rahman', 'rijwanc007@gmail.com', '01986348224', 'undraw_server_cluster_jwwq-212461.jpg', '01401157055', 'dhaka', '1206', NULL, NULL, '135/1 matikata', 'E-007', '007', 1, 1, 1, '1', '1', 1, 1, '2022-03-21', '2022-03-21', '2022-09-21', '2022-03-21', '2024-03-21', '2022-03-21', '2022-03-21', NULL, '2', 35000, 2022, '1', '1', 'dutch bangla bank', '785412589', 0, '1', 'Md.Liakot Chowdhury', 'Rashida Chowdhury', '1993-07-11', '1', '1', '1', 'Islam', '854654852147', 'undraw_server_cluster_jwwq-188020.jpg', '1', 'Rana Chowdhury', '01401157060', 'Brother', '135/1 matikata', 'Rajiv Chowdhury', '01401157065', 'Brother', '135/1 matikata', '1', 'Super Admin', 'Super Admin', '2022-03-21 01:24:03', '2022-03-21 02:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `employee_education`
--

CREATE TABLE `employee_education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `major` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institute` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passing_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_education`
--

INSERT INTO `employee_education` (`id`, `employee_id`, `degree`, `major`, `institute`, `passing_year`, `result`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'sdasfda', 'asdfasfas', 'fasdasd', '2018', '2.78', 'Super Admin', NULL, '2022-02-23 23:50:24', NULL),
(3, 2, 'Bsc', 'software', 'UODA', '2018', '2.78', 'Super Admin', NULL, '2022-03-21 02:14:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_professional_information`
--

CREATE TABLE `employee_professional_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `responsibility` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_professional_information`
--

INSERT INTO `employee_professional_information` (`id`, `employee_id`, `designation`, `company`, `from_date`, `to_date`, `responsibility`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'dsfasd', 'asdasdas', '2022-02-24', '2022-02-24', 'adasdasd', 'Super Admin', NULL, '2022-02-23 23:50:24', NULL),
(3, 2, 'software engineer', 'setcolbd', '2022-03-21', '2022-03-21', 'software engineer', 'Super Admin', NULL, '2022-03-21 02:14:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_item_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `payment_type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Bank,3=Mobile',
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Approved,2=Canceled,3=Pending',
  `status_change_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expense_item_id`, `voucher_no`, `amount`, `date`, `payment_type`, `account_id`, `remarks`, `status`, `status_change_by`, `status_change_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(2, 2, 'EXP-2022032110401', 500, '2022-03-21', '1', 23, 'এই ইনপুট টেস্ট পারপাস এ ব্যবহার করা হইসে', '3', NULL, NULL, 'Super Admin', NULL, '2022-03-21 04:46:45', '2022-03-21 04:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `expense_items`
--

CREATE TABLE `expense_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_items`
--

INSERT INTO `expense_items` (`id`, `name`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(2, 'বিদ্যুৎ বিল', '1', 'Super Admin', NULL, '2022-03-21 04:45:20', '2022-03-21 04:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `holiday_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Weekly, 2=Public',
  `holiday_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Holiday, 2=General, 3=Others',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `holidays`
--

INSERT INTO `holidays` (`id`, `name`, `short_name`, `start_date`, `end_date`, `holiday_type`, `holiday_status`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Kh Nishad', 'HR', NULL, NULL, '1', '1', '1', '1', 'Super Admin', NULL, '2022-02-24 00:58:00', '2022-02-24 00:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `labor_bills`
--

CREATE TABLE `labor_bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labor_bills`
--

INSERT INTO `labor_bills` (`id`, `name`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Paddy Unlod', '1', 'Admin', NULL, '2021-04-12 05:52:10', '2021-04-12 05:52:10'),
(2, 'Paddy Lod', '1', 'Admin', NULL, '2021-04-12 05:53:06', '2021-04-12 05:53:06'),
(3, 'Paddy  Overlad', '1', 'Admin', NULL, '2021-04-12 05:53:39', '2021-04-12 05:53:39'),
(4, 'Paddy Unlod  Warehouse 7', '1', 'Admin', NULL, '2021-04-12 05:56:58', '2021-04-12 05:56:58'),
(5, 'Paddy Unlod to paddy house', '1', 'Admin', NULL, '2021-04-12 05:58:19', '2021-04-12 05:58:19'),
(6, 'Paddy  Overlad warehouse 7', '1', 'Admin', NULL, '2021-04-12 05:59:40', '2021-04-12 05:59:40'),
(7, 'Paddy Netting', '1', 'Admin', NULL, '2021-04-12 06:00:27', '2021-04-12 06:00:27'),
(8, 'Paddy Netting from warehouse 7 $ Set', '1', 'Admin', NULL, '2021-04-12 06:05:01', '2021-04-12 06:05:01'),
(9, 'Bandil of bag', '1', 'Admin', NULL, '2021-04-12 06:06:18', '2021-04-12 06:06:18'),
(10, 'Bandil of bag Lod $ Unlod', '1', 'Admin', NULL, '2021-04-12 06:07:39', '2021-04-12 06:07:39'),
(11, 'Bandil of bag to warehouse', '1', 'Admin', NULL, '2021-04-12 06:08:46', '2021-04-12 06:08:46'),
(12, 'Dry paddy weight [ 6 $ 7 ]', '1', 'Admin', NULL, '2021-04-12 06:12:04', '2021-04-12 06:12:04'),
(13, 'Rice weight $ Lad', '1', 'Admin', NULL, '2021-04-12 06:18:27', '2021-04-12 06:18:27'),
(14, 'Rice Netting', '1', 'Admin', NULL, '2021-04-12 06:20:28', '2021-04-12 06:20:28'),
(15, 'Rice Lod', '1', 'Admin', NULL, '2021-04-12 06:24:07', '2021-04-12 06:24:07'),
(16, 'Rice Unlod', '1', 'Admin', NULL, '2021-04-12 06:24:28', '2021-04-12 06:24:28'),
(17, 'Rice Overlad', '1', 'Admin', NULL, '2021-04-12 06:25:06', '2021-04-12 06:25:06'),
(18, 'Bran  weight $ Lad', '1', 'Admin', NULL, '2021-04-12 06:27:44', '2021-04-12 06:27:44'),
(19, 'Haks Lod', '1', 'Admin', NULL, '2021-04-12 06:28:44', '2021-04-12 06:28:44'),
(20, 'Haks  Unlod', '1', 'Admin', NULL, '2021-04-12 06:32:25', '2021-04-12 06:32:25'),
(21, 'Bran  Lod', '1', 'Admin', NULL, '2021-04-12 06:34:22', '2021-04-12 06:34:22'),
(22, 'Broken ,  Red rice weight $ Lad', '1', 'Admin', NULL, '2021-04-12 06:41:15', '2021-04-12 06:41:15'),
(23, 'Broken ,  Red rice lod', '1', 'Admin', NULL, '2021-04-12 06:42:03', '2021-04-12 06:42:03'),
(24, 'Haks Lod to boylar', '1', 'Admin', NULL, '2021-04-12 06:43:35', '2021-04-12 06:43:35'),
(25, 'Haks Overlad', '1', 'Admin', NULL, '2021-04-12 06:46:45', '2021-04-12 06:46:45'),
(26, 'Haks weight $ lad', '1', 'Admin', NULL, '2021-04-12 06:47:32', '2021-04-12 06:47:32'),
(27, 'Diston weight $ lad', '1', 'Admin', NULL, '2021-04-12 06:51:13', '2021-04-12 06:51:13'),
(28, 'Rice bag cheang', '1', 'Admin', 'Admin', '2021-04-12 06:57:04', '2021-04-12 08:08:48'),
(29, 'Paddy  weight', '1', 'Admin', NULL, '2021-04-12 06:58:10', '2021-04-12 06:58:10'),
(30, 'Kon weight $ lad', '1', 'Admin', NULL, '2021-04-12 07:01:35', '2021-04-12 07:01:35'),
(31, 'Rice , Broken $ Red rice mikture ,weight $ lad', '1', 'Admin', NULL, '2021-04-12 07:05:45', '2021-04-12 07:05:45'),
(32, 'Chita ,Dhula $ kon lod', '1', 'Admin', NULL, '2021-04-12 07:07:27', '2021-04-12 07:07:27'),
(33, 'Paddy dayer to chatal', '1', 'Admin', NULL, '2021-04-12 07:08:29', '2021-04-12 07:08:29'),
(34, 'Chita out', '1', 'Admin', NULL, '2021-04-12 07:09:15', '2021-04-12 07:09:15'),
(35, 'Paddy  bag lad cheang', '1', 'Admin', NULL, '2021-04-12 07:10:27', '2021-04-12 07:10:27'),
(36, 'Rice, Broken $ other lad cheang', '1', 'Admin', NULL, '2021-04-12 07:11:26', '2021-04-12 07:11:26'),
(37, 'Paddy  Overlad for miling', '1', 'Admin', NULL, '2021-04-12 07:13:21', '2021-04-12 07:13:21');

-- --------------------------------------------------------

--
-- Table structure for table `labor_bill_rates`
--

CREATE TABLE `labor_bill_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `labor_bill_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `rate` double(8,2) NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labor_bill_rates`
--

INSERT INTO `labor_bill_rates` (`id`, `labor_bill_id`, `unit_id`, `rate`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 1, 12, 4.00, '1', 'Admin', NULL, '2021-04-12 07:16:04', '2021-04-12 07:16:04'),
(2, 2, 12, 4.00, '1', 'Admin', NULL, '2021-04-12 07:16:38', '2021-04-12 07:16:38'),
(3, 3, 12, 6.00, '1', 'Admin', NULL, '2021-04-12 07:17:14', '2021-04-12 07:17:14'),
(4, 7, 12, 3.25, '1', 'Admin', NULL, '2021-04-12 07:17:58', '2021-04-12 07:17:58'),
(5, 5, 12, 5.00, '1', 'Admin', 'Admin', '2021-04-12 07:18:54', '2021-04-18 05:03:36'),
(6, 11, 13, 5.00, '1', 'Admin', NULL, '2021-04-12 07:21:04', '2021-04-12 07:21:04'),
(7, 10, 13, 5.00, '1', 'Admin', NULL, '2021-04-12 07:21:36', '2021-04-12 07:21:36'),
(8, 4, 12, 5.00, '1', 'Admin', NULL, '2021-04-12 07:22:11', '2021-04-12 07:22:11'),
(9, 8, 12, 4.50, '1', 'Admin', NULL, '2021-04-12 07:22:53', '2021-04-12 07:22:53'),
(10, 12, 12, 4.50, '1', 'Admin', NULL, '2021-04-12 07:23:44', '2021-04-12 07:23:44'),
(11, 13, 9, 4.50, '1', 'Admin', 'Admin', '2021-04-12 07:24:27', '2021-04-12 08:15:50'),
(12, 13, 7, 2.85, '1', 'Admin', 'Admin', '2021-04-12 07:24:51', '2021-04-12 08:15:24'),
(13, 13, 8, 2.00, '1', 'Admin', NULL, '2021-04-12 07:25:30', '2021-04-12 07:25:30'),
(14, 14, 9, 2.50, '1', 'Admin', NULL, '2021-04-12 07:26:20', '2021-04-12 07:26:20'),
(15, 15, 9, 2.50, '1', 'Admin', NULL, '2021-04-12 07:27:43', '2021-04-12 07:27:43'),
(16, 15, 7, 1.25, '1', 'Admin', NULL, '2021-04-12 07:31:51', '2021-04-12 07:31:51'),
(17, 15, 8, 1.50, '1', 'Admin', NULL, '2021-04-12 07:32:13', '2021-04-12 07:32:13'),
(18, 17, 8, 0.75, '1', 'Admin', NULL, '2021-04-12 07:33:22', '2021-04-12 07:33:22'),
(19, 17, 9, 1.50, '1', 'Admin', NULL, '2021-04-12 07:33:44', '2021-04-12 07:33:44'),
(20, 16, 10, 2.50, '1', 'Admin', 'Admin', '2021-04-12 07:34:25', '2021-04-12 07:35:45'),
(21, 16, 9, 2.50, '1', 'Admin', NULL, '2021-04-12 07:35:09', '2021-04-12 07:35:09'),
(22, 18, 9, 5.00, '1', 'Admin', NULL, '2021-04-12 07:36:25', '2021-04-12 07:36:25'),
(23, 21, 9, 4.00, '1', 'Admin', NULL, '2021-04-12 07:37:15', '2021-04-12 07:37:15'),
(24, 19, 13, 2.75, '1', 'Admin', 'Admin', '2021-04-12 07:37:50', '2021-04-12 07:38:54'),
(25, 20, 13, 2.75, '1', 'Admin', NULL, '2021-04-12 07:38:39', '2021-04-12 07:38:39'),
(26, 24, 13, 3.00, '1', 'Admin', NULL, '2021-04-12 07:39:29', '2021-04-12 07:39:29'),
(27, 25, 13, 5.50, '1', 'Admin', NULL, '2021-04-12 07:40:23', '2021-04-12 07:40:23'),
(28, 26, 13, 4.00, '1', 'Admin', NULL, '2021-04-12 07:41:13', '2021-04-12 07:41:13'),
(29, 22, 9, 4.00, '1', 'Admin', NULL, '2021-04-12 07:42:32', '2021-04-12 07:42:32'),
(30, 23, 9, 2.50, '1', 'Admin', NULL, '2021-04-12 07:43:08', '2021-04-12 07:43:08'),
(31, 27, 13, 3.50, '1', 'Admin', NULL, '2021-04-12 08:02:24', '2021-04-12 08:02:24'),
(32, 28, 9, 2.00, '1', 'Admin', NULL, '2021-04-12 08:03:19', '2021-04-12 08:03:19'),
(33, 36, 9, 3.00, '1', 'Admin', NULL, '2021-04-12 08:06:27', '2021-04-12 08:06:27'),
(34, 35, 12, 4.00, '1', 'Admin', NULL, '2021-04-12 08:07:51', '2021-04-12 08:07:51'),
(35, 29, 13, 4.00, '1', 'Admin', NULL, '2021-04-12 08:09:43', '2021-04-12 08:09:43'),
(36, 31, 9, 4.00, '1', 'Admin', NULL, '2021-04-12 08:10:12', '2021-04-12 08:10:12'),
(37, 30, 13, 3.50, '1', 'Admin', NULL, '2021-04-12 08:10:45', '2021-04-12 08:10:45'),
(38, 37, 13, 3.00, '1', 'Admin', NULL, '2021-04-12 08:11:25', '2021-04-12 08:11:25'),
(39, 32, 13, 5.00, '1', 'Admin', NULL, '2021-04-12 08:12:00', '2021-04-12 08:12:00'),
(40, 33, 13, 3.00, '1', 'Admin', NULL, '2021-04-12 08:13:22', '2021-04-12 08:13:22'),
(41, 34, 13, 5.00, '1', 'Admin', NULL, '2021-04-12 08:13:59', '2021-04-12 08:13:59'),
(42, 9, 9, 7.00, '1', 'Admin', NULL, '2021-04-12 08:18:44', '2021-04-12 08:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `labor_heads`
--

CREATE TABLE `labor_heads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labor_heads`
--

INSERT INTO `labor_heads` (`id`, `name`, `mobile`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(18, 'rijwan', '01986348224', '1', 'Super Admin', 'Super Admin', '2022-03-06 02:13:48', '2022-03-08 04:18:06'),
(19, 'arman', '01716756578', '1', 'Super Admin', 'Super Admin', '2022-03-06 02:28:38', '2022-03-08 04:17:48'),
(20, 'younusur rahman', '01401157055', '1', 'Super Admin', 'Super Admin', '2022-03-08 03:22:12', '2022-03-08 04:12:44');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) DEFAULT NULL,
  `leave_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Unpaid, 2=Paid',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `name`, `short_name`, `number`, `leave_type`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'rijwan one', 'department', 10, '1', '1', '2', 'Super Admin', NULL, '2022-02-24 01:59:36', '2022-02-24 01:59:36');

-- --------------------------------------------------------

--
-- Table structure for table `leave_application_manages`
--

CREATE TABLE `leave_application_manages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `leave_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `alternative_employee` int(11) DEFAULT NULL,
  `number_leave` int(11) DEFAULT NULL,
  `leave_type` int(11) DEFAULT NULL,
  `employee_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submission` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pre, 2=Post',
  `leave_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pending, 2=Accepted, 3=Cancel',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leave_application_manages`
--

INSERT INTO `leave_application_manages` (`id`, `leave_id`, `employee_id`, `start_date`, `end_date`, `alternative_employee`, `number_leave`, `leave_type`, `employee_location`, `purpose`, `comments`, `submission`, `leave_status`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2022-02-24', '2022-03-04', 1, 8, 1, 'ctg', 'this is for the test', NULL, '1', '1', '1', '1', 'Super Admin', NULL, '2022-02-24 02:16:58', '2022-02-24 02:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `adjust_amount` double DEFAULT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_adjusted_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_changed_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjusted_date` date DEFAULT NULL,
  `loan_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Personal,2=Official',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Cash,2=Cheque,3=Mobile',
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `loan_status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Complete,2=Pending',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Active,2=InActive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `voucher_no`, `employee_id`, `person_id`, `amount`, `adjust_amount`, `purpose`, `total_adjusted_amount`, `month_year`, `status_changed_by`, `adjusted_date`, `loan_type`, `payment_method`, `account_id`, `loan_status`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'PL-20220321366', NULL, 1, 5000, 1000, 'these out is going for test purpose', NULL, 'March-2022', NULL, '2022-03-21', '1', '1', 23, '2', '1', '2', 'Super Admin', NULL, '2022-03-21 04:26:37', '2022-03-21 04:26:37');

-- --------------------------------------------------------

--
-- Table structure for table `loan_installments`
--

CREATE TABLE `loan_installments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED DEFAULT NULL,
  `person_id` bigint(20) UNSIGNED DEFAULT NULL,
  `installment_amount` double DEFAULT NULL,
  `purpose` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_changed_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `installment_date` date DEFAULT NULL,
  `month_year` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Personal,2=Official',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Cash,2=Cheque,3=Mobile',
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Active,2=InActive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_people`
--

CREATE TABLE `loan_people` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Active,2=InActive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_people`
--

INSERT INTO `loan_people` (`id`, `name`, `phone`, `address`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'rijwan', '01986348224', '135/1 matikata', '1', '2', 'Super Admin', NULL, '2022-02-26 23:50:31', '2022-02-26 23:50:31');

-- --------------------------------------------------------

--
-- Table structure for table `machine_purchases`
--

CREATE TABLE `machine_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `machine_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `received` double NOT NULL,
  `purchase_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `purchase_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machine_purchases`
--

INSERT INTO `machine_purchases` (`id`, `purchase_id`, `machine_id`, `qty`, `received`, `purchase_category_id`, `purchase_unit_id`, `net_unit_cost`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, NULL, 1, 500000, 0, 0, 0, 500000, '2022-02-22 22:44:57', '2022-02-22 22:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `machine_services`
--

CREATE TABLE `machine_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `machine_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `received` double NOT NULL,
  `service_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machine_services`
--

INSERT INTO `machine_services` (`id`, `service_id`, `machine_id`, `qty`, `received`, `service_category_id`, `service_unit_id`, `net_unit_cost`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, 5, NULL, 1, 500000, 0, 0, 0, 2500000, '2022-02-23 00:28:48', '2022-02-23 00:28:48');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_categories`
--

CREATE TABLE `maintenance_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_categories`
--

INSERT INTO `maintenance_categories` (`id`, `name`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Test', '1', 'Super Admin', NULL, '2022-02-22 05:29:43', '2022-02-22 05:29:43'),
(2, 'Test two', '1', 'Super Admin', NULL, '2022-02-22 05:30:47', '2022-02-22 05:30:47');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_machines`
--

CREATE TABLE `maintenance_machines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `machine_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `machine_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `cost` double NOT NULL,
  `qty` double(8,2) DEFAULT NULL,
  `alert_qty` double(8,2) DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_method` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Exclusive,2=Inclusive',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_machines`
--

INSERT INTO `maintenance_machines` (`id`, `machine_name`, `machine_code`, `category_id`, `unit_id`, `cost`, `qty`, `alert_qty`, `tax_id`, `tax_method`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'ak 47', '99329170', 1, 1, 500000, 15.00, 2.00, NULL, '1', '1', 'Super Admin', NULL, '2022-02-22 21:54:26', '2022-02-22 21:54:26');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_purchases`
--

CREATE TABLE `maintenance_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `item` double(8,2) NOT NULL,
  `total_qty` double(8,2) NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `accessories_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `purchase_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Received,2=Partial,3=Pending,4=Ordered',
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Paid,2=Partial,3=Due',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Cheque,3=Mobile',
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Approved,2=Canceled,3=Pending',
  `status_change_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_purchases`
--

INSERT INTO `maintenance_purchases` (`id`, `memo_no`, `supplier_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `accessories_cost`, `grand_total`, `paid_amount`, `purchase_status`, `payment_status`, `payment_method`, `status`, `status_change_by`, `status_change_date`, `document`, `note`, `purchase_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, '852147859', 1, 1.00, 1.00, 0, 0, 500000, 0, 0, 5, 20, 20, 500035, 500035, '1', '2', '1', '3', NULL, NULL, 'undraw_software_engineer_re_fyew-723165.png', 'these input is going for test purpose', '2022-02-23', 'Super Admin', NULL, '2022-02-22 22:44:57', '2022-02-22 22:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_purchase_payments`
--

CREATE TABLE `maintenance_purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_transaction_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Cheque,3=Mobile',
  `cheque_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_purchase_payments`
--

INSERT INTO `maintenance_purchase_payments` (`id`, `purchase_id`, `account_id`, `transaction_id`, `supplier_transaction_id`, `amount`, `payment_method`, `cheque_no`, `payment_note`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 1, 23, 31, 30, 500035, '1', '', NULL, 'Super Admin', NULL, '2022-02-22 22:44:58', '2022-02-22 22:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_services`
--

CREATE TABLE `maintenance_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_man` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` double(8,2) NOT NULL,
  `total_qty` double(8,2) NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `accessories_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `purchase_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Received,2=Partial,3=Pending,4=Ordered',
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Paid,2=Partial,3=Due',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Cheque,3=Mobile',
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Approved,2=Canceled,3=Pending',
  `status_change_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_services`
--

INSERT INTO `maintenance_services` (`id`, `memo_no`, `service_man`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `accessories_cost`, `grand_total`, `paid_amount`, `purchase_status`, `payment_status`, `payment_method`, `status`, `status_change_by`, `status_change_date`, `document`, `note`, `service_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, '7412589645', 'service oriented', 1.00, 5.00, 0, 0, 2500000, NULL, 0, NULL, NULL, NULL, 0, 0, '1', '1', '1', '3', NULL, NULL, NULL, NULL, '2022-02-23', 'Super Admin', NULL, '2022-02-23 00:28:48', '2022-02-23 00:28:48');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_service_payments`
--

CREATE TABLE `maintenance_service_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Cheque,3=Mobile',
  `cheque_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_service_payments`
--

INSERT INTO `maintenance_service_payments` (`id`, `service_id`, `account_id`, `transaction_id`, `amount`, `payment_method`, `cheque_no`, `payment_note`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 1, 23, 33, 0, '1', '', NULL, 'Super Admin', NULL, '2022-02-23 00:28:48', '2022-02-23 00:28:48');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_units`
--

CREATE TABLE `maintenance_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintenance_units`
--

INSERT INTO `maintenance_units` (`id`, `name`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Test', '1', 'Super Admin', NULL, '2022-02-22 06:03:59', '2022-02-22 06:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `material_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `material_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_unit_id` bigint(20) UNSIGNED NOT NULL,
  `cost` double NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_qty` double DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_method` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Exclusive,2=Inclusive',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `has_opening_stock` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Yes, 2=No',
  `opening_stock_qty` double DEFAULT NULL,
  `opening_warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `material_name`, `material_code`, `unit_id`, `purchase_unit_id`, `cost`, `qty`, `alert_qty`, `tax_id`, `tax_method`, `status`, `has_opening_stock`, `opening_stock_qty`, `opening_warehouse_id`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(2, 'Paddy BR 28', '84313026', 1, 1, 0, 0, 24000, NULL, '1', '1', '2', NULL, NULL, 'Admin', 'Admin', '2021-04-15 06:31:25', '2021-06-13 03:29:03'),
(3, 'Paddy BR 29', '03695422', 1, 1, 110, 6500, 24000, NULL, '1', '1', '2', NULL, NULL, 'Admin', 'Admin', '2021-04-15 06:32:16', '2022-03-21 04:40:01'),
(4, 'Paddy Hybid', '50372499', 1, 1, 0, 0, 24000, NULL, '1', '1', '2', NULL, NULL, 'Admin', 'Admin', '2021-04-15 06:33:24', '2021-04-21 07:42:50'),
(5, 'Paddy Sorna 5', '09261764', 1, 1, 0, 0, 24000, NULL, '1', '1', '2', NULL, NULL, 'Admin', 'Admin', '2021-04-15 06:37:48', '2021-04-21 07:42:29'),
(6, 'Paddy Sorna', '10691421', 1, 1, 0, 0, 24000, NULL, '1', '1', '2', NULL, NULL, 'Admin', 'Admin', '2021-04-15 06:39:31', '2021-04-21 07:42:06'),
(7, 'Paddy Bag 75kg', '16499827', 13, 13, 0, 0, 1000, NULL, '1', '1', '2', NULL, NULL, 'Admin', 'Admin', '2021-04-17 05:52:23', '2021-05-05 12:18:14'),
(8, 'Rice Bag 25kg', '94263002', 7, 7, 0, 0, 1000, NULL, '1', '1', '2', NULL, NULL, 'Admin', 'Admin', '2021-04-17 06:00:36', '2021-04-21 07:40:56'),
(9, 'Rice Bag 50kg', '18785127', 9, 9, 0, 0, 1000, NULL, '1', '1', '2', NULL, NULL, 'Admin', 'Admin', '2021-04-17 06:02:37', '2021-06-13 03:28:04'),
(10, 'Paddy MIniket  Jannat', '01293087', 1, 1, 0, 0, 24000, NULL, '1', '1', '2', NULL, NULL, 'Admin', 'Admin', '2021-05-04 04:33:49', '2021-05-05 04:07:59'),
(12, 'Paddy Basmati', '00908259', 1, 1, 0, 0, 0, NULL, '1', '1', '2', NULL, NULL, 'Admin', NULL, '2021-06-07 04:35:05', '2021-06-13 03:28:55'),
(13, 'Basmati Rice 001', '123456789', 1, 1, 0, NULL, 100, NULL, '1', '1', '2', NULL, NULL, 'Admin', NULL, '2021-06-07 08:05:28', '2021-06-07 08:05:28'),
(14, 'Nahid-Dhan', '101', 12, 12, 0, 0, 10, NULL, '2', '1', '2', NULL, NULL, 'Admin', NULL, '2021-06-13 07:36:32', '2021-08-19 06:02:09'),
(15, 'atash', '10121', 7, 1, 0, 0, 2, NULL, '2', '1', '2', NULL, NULL, 'Admin', NULL, '2021-06-22 09:27:09', '2021-08-18 11:19:56'),
(16, 'B12', '120', 9, 9, 0, 0, 2, NULL, '1', '1', '2', NULL, NULL, 'Admin', NULL, '2021-08-18 11:03:17', '2021-08-19 05:47:55'),
(17, 'Atash dhan', '1250', 1, 1, 0, NULL, 25, NULL, '1', '1', '2', NULL, NULL, 'Admin', NULL, '2021-08-19 03:46:57', '2021-08-19 03:46:57'),
(18, 'Mota', '125', 1, 1, 40, 10255, 0, NULL, '1', '2', '2', NULL, NULL, 'Admin', 'Super Admin', '2021-08-19 05:45:49', '2022-03-01 23:13:36'),
(19, 'ধান', '65012307', 14, 14, 30, 5, 10, NULL, '1', '1', '2', NULL, NULL, 'Super Admin', 'Super Admin', '2022-02-28 02:19:39', '2022-03-01 23:13:17'),
(20, 'চিনিগুঁড়া', '91554102', 14, 14, 44.85, 92000, 10, NULL, '1', '1', '2', NULL, NULL, 'Super Admin', 'Super Admin', '2022-02-28 23:21:36', '2022-03-01 03:19:02');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_name`, `deletable`, `created_at`, `updated_at`) VALUES
(1, 'Backend', '1', '2021-03-26 23:49:24', '2021-03-26 23:49:24');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2022_03_03_075918_create_labor_heads_table', 1),
(2, '2022_03_08_080532_create_tenants_table', 2),
(8, '2022_03_09_155438_create_tenant_productions_table', 3),
(9, '2022_03_10_042801_create_tenant_production_materials_table', 3),
(10, '2022_03_10_183314_create_tenant_production_products_table', 4),
(14, '2022_03_13_055012_add_columns_tenant_production_materials_table', 5),
(15, '2022_03_10_184213_create_tenant_production_product_purchases_table', 6),
(16, '2022_03_12_081522_create_tenant_production_product_deliveries_table', 6),
(17, '2022_03_13_053713_add_columns_tenant_productions_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `mobile_banks`
--

CREATE TABLE `mobile_banks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mobile_banks`
--

INSERT INTO `mobile_banks` (`id`, `bank_name`, `account_name`, `account_number`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'AB', 'fgsfsdf', '85674545454', '1', 'Super Admin', NULL, '2022-02-24 04:57:17', '2022-02-24 04:57:17');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=divider,2=module',
  `module_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `divider_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `target` enum('_self','_blank') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `menu_id`, `type`, `module_name`, `divider_title`, `icon_class`, `url`, `order`, `parent_id`, `target`, `created_at`, `updated_at`) VALUES
(1, 1, '2', 'Dashboard', NULL, 'fas fa-tachometer-alt', '/', 1, NULL, NULL, NULL, '2022-03-08 05:54:58'),
(2, 1, '1', NULL, 'Menus', NULL, NULL, 2, NULL, NULL, NULL, '2022-03-08 05:54:58'),
(3, 1, '1', NULL, 'Access Control', NULL, NULL, 29, NULL, NULL, NULL, '2022-03-08 05:54:13'),
(4, 1, '2', 'User', NULL, 'fas fa-users', 'user', 30, NULL, NULL, NULL, '2022-03-08 05:54:13'),
(5, 1, '2', 'Role', NULL, 'fas fa-user-tag', 'role', 31, NULL, NULL, NULL, '2022-03-08 05:54:13'),
(6, 1, '1', NULL, 'System', NULL, NULL, 32, NULL, NULL, NULL, '2022-03-08 05:54:13'),
(7, 1, '2', 'Setting', NULL, 'fas fa-cogs', NULL, 33, NULL, NULL, NULL, '2022-03-08 05:54:13'),
(8, 1, '2', 'Menu', NULL, 'fas fa-th-list', 'menu', 34, NULL, NULL, NULL, '2022-03-08 05:54:13'),
(9, 1, '2', 'Permission', NULL, 'fas fa-tasks', 'menu/module/permission', 35, NULL, NULL, NULL, '2022-03-08 05:54:13'),
(10, 1, '2', 'General Setting', NULL, NULL, 'setting', 1, 7, NULL, '2021-03-27 00:01:48', '2021-03-27 00:06:29'),
(11, 1, '2', 'Warehouse', NULL, NULL, 'warehouse', 2, 7, NULL, '2021-03-27 00:07:10', '2021-03-27 00:08:10'),
(12, 1, '2', 'Customer Group', NULL, NULL, 'customer-group', 3, 7, NULL, '2021-03-27 00:07:41', '2021-03-27 00:08:14'),
(13, 1, '2', 'Unit', NULL, NULL, 'unit', 7, 7, NULL, '2021-03-27 00:07:54', '2021-04-04 02:39:18'),
(14, 1, '2', 'Tax', NULL, NULL, 'tax', 8, 7, NULL, '2021-03-27 00:08:03', '2021-04-04 02:39:18'),
(15, 1, '2', 'Material', NULL, 'fas fa-toolbox', 'material', 3, NULL, NULL, '2021-03-27 00:14:56', '2022-03-08 05:54:58'),
(16, 1, '2', 'Purchase', NULL, 'fas fa-cart-arrow-down', NULL, 4, NULL, NULL, '2021-03-27 00:15:31', '2022-03-08 05:54:58'),
(17, 1, '2', 'Add Purchase', NULL, NULL, 'purchase/add', 1, 16, NULL, '2021-03-27 00:16:04', '2021-04-24 09:15:53'),
(18, 1, '2', 'Manage Purchase', NULL, NULL, 'purchase', 2, 16, NULL, '2021-03-27 00:16:22', '2021-03-27 00:16:27'),
(19, 1, '2', 'Product', NULL, 'fab fa-product-hunt', NULL, 7, NULL, NULL, '2021-03-27 00:23:19', '2022-03-08 05:54:58'),
(20, 1, '2', 'Add Finished Goods', NULL, NULL, 'product/add', 2, 19, NULL, '2021-03-27 00:23:35', '2021-03-27 00:24:15'),
(21, 1, '2', 'Manage Product', NULL, NULL, 'product', 3, 19, NULL, '2021-03-27 00:23:52', '2021-03-27 00:38:38'),
(22, 1, '2', 'Category', NULL, NULL, 'category', 1, 19, NULL, '2021-03-27 00:24:12', '2021-03-27 00:24:15'),
(23, 1, '2', 'Production', NULL, 'fas fa-industry', NULL, 8, NULL, NULL, '2021-03-27 00:26:25', '2022-03-08 05:54:58'),
(24, 1, '2', 'Work Order', NULL, NULL, 'production/add', 1, 23, NULL, '2021-03-27 00:26:46', '2021-04-17 00:08:41'),
(25, 1, '2', 'Manage Production', NULL, NULL, 'production', 2, 23, NULL, '2021-03-27 00:27:08', '2021-03-27 00:27:11'),
(26, 1, '2', 'Finished Products', NULL, NULL, 'finished-products', 3, 23, NULL, '2021-03-27 00:29:46', '2021-04-07 22:28:50'),
(27, 1, '2', 'Material Stock', NULL, 'fas fa-boxes', 'material-stock', 5, NULL, NULL, '2021-03-27 00:35:28', '2022-03-08 05:54:58'),
(28, 1, '2', 'Finished Goods Stock', NULL, 'fas fa-boxes', 'product-stock', 9, NULL, NULL, '2021-03-27 00:37:24', '2022-03-08 05:54:58'),
(29, 1, '2', 'Sale', NULL, 'fab fa-opencart', NULL, 11, NULL, NULL, '2021-03-27 00:43:50', '2022-03-08 05:54:58'),
(30, 1, '2', 'Add Sale', NULL, NULL, 'sale/add', 1, 29, NULL, '2021-03-27 00:44:02', '2021-03-27 00:44:18'),
(31, 1, '2', 'Manage Sale', NULL, NULL, 'sale', 2, 29, NULL, '2021-03-27 00:44:15', '2021-03-27 00:44:24'),
(32, 1, '2', 'Customer', NULL, 'far fa-handshake', NULL, 13, NULL, NULL, '2021-03-27 00:45:39', '2022-03-08 05:54:58'),
(33, 1, '2', 'Manage Customer', NULL, NULL, 'customer', 1, 32, NULL, '2021-03-27 00:46:34', '2021-03-27 00:48:18'),
(34, 1, '2', 'Customer Ledger', NULL, NULL, 'customer-ledger', 2, 32, NULL, '2021-03-27 00:47:04', '2021-03-27 00:48:20'),
(35, 1, '2', 'Credit Customer', NULL, NULL, 'credit-customer', 3, 32, NULL, '2021-03-27 00:47:31', '2021-03-27 00:48:21'),
(36, 1, '2', 'Paid Customer', NULL, NULL, 'paid-customer', 4, 32, NULL, '2021-03-27 00:47:47', '2021-03-27 00:48:26'),
(37, 1, '2', 'Customer Advance', NULL, NULL, 'customer-advance', 5, 32, NULL, '2021-03-27 00:48:14', '2021-03-27 00:48:27'),
(38, 1, '2', 'Supplier', NULL, 'fas fa-user-tie', NULL, 14, NULL, NULL, '2021-03-27 00:49:11', '2022-03-08 05:54:58'),
(39, 1, '2', 'Manage Supplier', NULL, NULL, 'supplier', 1, 38, NULL, '2021-03-27 00:49:44', '2021-03-27 00:50:30'),
(40, 1, '2', 'Supplier Ledger', NULL, NULL, 'supplier-ledger', 2, 38, NULL, '2021-03-27 00:50:09', '2021-03-27 00:50:33'),
(41, 1, '2', 'Supplier Advance', NULL, NULL, 'supplier-advance', 3, 38, NULL, '2021-03-27 00:50:27', '2021-03-27 00:50:38'),
(42, 1, '2', 'Accounts', NULL, 'far fa-money-bill-alt', NULL, 21, NULL, NULL, '2021-03-27 00:52:27', '2022-03-08 05:54:13'),
(43, 1, '2', 'Chart of Account', NULL, NULL, 'coa', 1, 42, NULL, '2021-03-27 00:52:53', '2021-05-11 12:10:34'),
(44, 1, '2', 'Opening Balance', NULL, NULL, 'opening-balance', 2, 42, NULL, '2021-03-27 00:53:20', '2021-05-11 12:10:34'),
(45, 1, '2', 'Supplier Payment', NULL, NULL, 'supplier-payment', 3, 42, NULL, '2021-03-27 00:53:43', '2021-05-11 12:10:34'),
(46, 1, '2', 'Customer Receive', NULL, NULL, 'customer-receive', 4, 42, NULL, '2021-03-27 00:54:01', '2021-05-11 12:10:34'),
(47, 1, '2', 'Cash Adjustment', NULL, NULL, 'cash-adjustment', 5, 42, NULL, '2021-03-27 00:54:30', '2021-05-11 12:10:34'),
(48, 1, '2', 'Debit Voucher', NULL, NULL, 'debit-voucher', 6, 42, NULL, '2021-03-27 00:54:52', '2021-05-11 12:10:34'),
(49, 1, '2', 'Credit Voucher', NULL, NULL, 'credit-voucher', 7, 42, NULL, '2021-03-27 00:55:10', '2021-05-11 12:10:34'),
(50, 1, '2', 'Contra Voucher', NULL, NULL, 'contra-voucher', 8, 42, NULL, '2021-03-27 00:55:31', '2021-05-11 12:10:35'),
(51, 1, '2', 'Journal Voucher', NULL, NULL, 'journal-voucher', 9, 42, NULL, '2021-03-27 00:55:50', '2021-05-11 12:10:35'),
(52, 1, '2', 'Voucher Approval', NULL, NULL, 'voucher-approval', 10, 42, NULL, '2021-03-27 00:56:21', '2021-05-11 12:10:35'),
(53, 1, '2', 'Report', NULL, 'fas fa-file-signature', NULL, 11, 42, NULL, '2021-03-27 00:58:02', '2021-05-11 12:10:35'),
(54, 1, '2', 'Cash Book', NULL, NULL, 'cash-book', 1, 53, NULL, '2021-03-27 00:58:53', '2022-03-20 02:57:46'),
(55, 1, '2', 'Inventory Ledger', NULL, NULL, 'inventory-ledger', 2, 53, NULL, '2021-03-27 00:59:21', '2022-03-20 02:57:46'),
(56, 1, '2', 'Bank Book', NULL, NULL, 'bank-book', 3, 53, NULL, '2021-03-27 00:59:42', '2022-03-20 02:57:46'),
(57, 1, '2', 'Mobile Bank Book', NULL, NULL, 'mobile-bank-book', 4, 53, NULL, '2021-03-27 01:00:00', '2022-03-20 02:57:46'),
(58, 1, '2', 'General Ledger', NULL, NULL, 'general-ledger', 5, 53, NULL, '2021-03-27 01:00:23', '2022-03-20 02:57:46'),
(59, 1, '2', 'Trial Balance', NULL, NULL, 'trial-balance', 6, 53, NULL, '2021-03-27 01:00:42', '2022-03-20 02:57:46'),
(60, 1, '2', 'Profit Loss', NULL, NULL, 'profit-loss', 7, 53, NULL, '2021-03-27 01:01:03', '2022-03-20 02:57:46'),
(61, 1, '2', 'Cash Flow', NULL, NULL, 'cash-flow', 8, 53, NULL, '2021-03-27 01:01:21', '2022-03-20 02:57:46'),
(62, 1, '2', 'Bank', NULL, 'fas fa-university', NULL, 25, NULL, NULL, '2021-03-27 01:04:11', '2022-03-08 05:54:13'),
(63, 1, '2', 'Manage Bank', NULL, NULL, 'bank', 1, 62, NULL, '2021-03-27 01:04:36', '2021-03-27 01:05:19'),
(64, 1, '2', 'Bank Transaction', NULL, NULL, 'bank-transaction', 2, 62, NULL, '2021-03-27 01:05:03', '2021-03-27 01:05:23'),
(65, 1, '2', 'Bank Ledger', NULL, NULL, 'bank-ledger', 3, 62, NULL, '2021-03-27 01:05:17', '2021-03-27 01:05:25'),
(66, 1, '2', 'Mobile Bank', NULL, 'fas fa-mobile-alt', NULL, 26, NULL, NULL, '2021-03-27 01:05:51', '2022-03-08 05:54:13'),
(67, 1, '2', 'Manage Mobile Bank', NULL, NULL, 'mobile-bank', 1, 66, NULL, '2021-03-27 01:06:09', '2021-03-27 01:07:00'),
(68, 1, '2', 'Mobile Bank Transaction', NULL, NULL, 'mobile-bank-transaction', 2, 66, NULL, '2021-03-27 01:06:30', '2021-03-27 01:07:02'),
(69, 1, '2', 'Mobile Bank Ledger', NULL, NULL, 'mobile-bank-ledger', 3, 66, NULL, '2021-03-27 01:06:51', '2021-03-27 01:07:05'),
(70, 1, '2', 'Report', NULL, 'fas fa-file-signature', NULL, 28, NULL, NULL, '2021-03-27 01:08:11', '2022-03-08 05:54:13'),
(71, 1, '2', 'Closing', NULL, NULL, 'closing', 2, 70, NULL, '2021-03-27 01:08:46', '2022-03-20 02:57:46'),
(72, 1, '2', 'Todays Sales Report', NULL, NULL, 'todays-sales-report', 6, 70, NULL, '2021-03-27 01:09:13', '2022-03-20 02:57:47'),
(73, 1, '2', 'Todays Customer Receipt', NULL, NULL, 'todays-customer-receipt', 8, 70, NULL, '2021-03-27 01:09:40', '2022-03-20 02:57:47'),
(74, 1, '2', 'Due Report', NULL, NULL, 'due-report', 9, 70, NULL, '2021-03-27 01:10:07', '2022-03-20 02:57:47'),
(75, 1, '2', 'Summary Report', NULL, NULL, 'summary-report', 10, 70, NULL, '2021-03-27 01:10:42', '2022-03-20 02:57:47'),
(76, 1, '2', 'Product Wise Sales Report', NULL, NULL, 'product-wise-sales-report', 11, 70, NULL, '2021-03-27 01:11:17', '2022-03-20 02:57:47'),
(77, 1, '2', 'Labor Bill Report', NULL, NULL, 'labor-bill-report', 15, 70, NULL, '2021-03-27 01:13:27', '2022-03-20 02:57:47'),
(78, 1, '2', 'Parts and Service', NULL, 'fas fa-tools', NULL, 19, NULL, NULL, '2021-03-27 01:16:19', '2022-03-08 05:54:13'),
(79, 1, '2', 'Maintenance Category', NULL, NULL, 'maintenance-category', 1, 78, NULL, '2021-03-27 01:17:00', '2021-03-27 01:20:06'),
(80, 1, '2', 'Manage Machine', NULL, NULL, 'maintenance-machine', 3, 78, NULL, '2021-03-27 01:18:23', '2021-03-29 07:28:04'),
(81, 1, '2', 'Add Maintenance Service', NULL, NULL, 'maintenance-service/add', 6, 78, NULL, '2021-03-27 01:18:39', '2021-03-30 04:23:14'),
(82, 1, '2', 'Manage Maintenance  Service', NULL, NULL, 'maintenance-service', 7, 78, NULL, '2021-03-27 01:19:16', '2021-03-28 08:31:38'),
(83, 1, '2', 'Transport', NULL, 'fas fa-truck-moving', NULL, 18, NULL, NULL, '2021-03-27 01:21:48', '2022-03-08 05:54:13'),
(84, 1, '2', 'Add Transport', NULL, NULL, 'transport/add', 4, 83, NULL, '2021-03-27 01:22:34', '2021-04-18 23:16:13'),
(85, 1, '2', 'Manage Transport', NULL, NULL, 'transport', 5, 83, NULL, '2021-03-27 01:22:53', '2021-04-18 23:16:13'),
(86, 1, '2', 'Machine Purchase Add', NULL, NULL, 'machine-purchase/add', 4, 78, NULL, '2021-03-27 01:24:29', '2021-03-28 08:31:38'),
(87, 1, '2', 'Manage Machine Purchase', NULL, NULL, 'machine-purchase', 5, 78, NULL, '2021-03-27 01:26:13', '2021-03-28 08:31:38'),
(88, 1, '2', 'Closing Report', NULL, NULL, 'closing-report', 3, 70, NULL, '2021-03-27 03:04:52', '2022-03-20 02:57:46'),
(89, 1, '2', 'Labor Bill', NULL, NULL, 'labor-bill', 4, 7, NULL, '2021-03-27 03:08:31', '2021-03-27 03:08:49'),
(90, 1, '2', 'Labor Bill Rate', NULL, NULL, 'labor-bill-rate', 5, 7, NULL, '2021-03-27 03:45:27', '2021-03-27 23:40:38'),
(91, 1, '2', 'Maintenance Unit', NULL, NULL, 'maintenance-unit', 2, 78, NULL, '2021-03-28 08:31:17', '2021-03-28 08:31:38'),
(92, 1, '2', 'Todays Purchase Report', NULL, NULL, 'todays-purchase-report', 4, 70, NULL, '2021-04-03 03:53:58', '2022-03-20 02:57:46'),
(93, 1, '2', 'Purchase Report', NULL, NULL, 'purchase-report', 5, 70, NULL, '2021-04-03 03:55:08', '2022-03-20 02:57:47'),
(94, 1, '2', 'Sales Report', NULL, NULL, 'sales-report', 7, 70, NULL, '2021-04-03 03:56:00', '2022-03-20 02:57:47'),
(95, 1, '2', 'Machine Purchase Report', NULL, NULL, 'machine-purchase-report', 12, 70, NULL, '2021-04-03 05:56:28', '2022-03-20 02:57:47'),
(96, 1, '2', 'Maintenance Service Report', NULL, NULL, 'maintenance-service-report', 13, 70, NULL, '2021-04-03 05:57:04', '2022-03-20 02:57:47'),
(97, 1, '2', 'Transport Report', NULL, NULL, 'transport-report', 14, 70, NULL, '2021-04-03 05:57:27', '2022-03-20 02:57:47'),
(98, 1, '2', 'Expense', NULL, 'fas fa-money-check-alt', NULL, 24, NULL, NULL, '2021-04-03 06:03:39', '2022-03-08 05:54:13'),
(99, 1, '2', 'Manage Expense Item', NULL, NULL, 'expense-item', 1, 98, NULL, '2021-04-03 06:04:22', '2021-04-03 06:04:26'),
(100, 1, '2', 'Manage Expense', NULL, NULL, 'expense', 2, 98, NULL, '2021-04-03 06:04:44', '2021-04-03 06:04:50'),
(101, 1, '2', 'Expense Statement', NULL, NULL, 'expense-statement', 3, 98, NULL, '2021-04-03 06:05:22', '2021-04-03 06:05:28'),
(123, 1, '2', 'Bag', NULL, NULL, 'bag', 6, 7, NULL, '2021-04-04 02:38:53', '2021-04-04 03:23:06'),
(124, 1, '2', 'Pre Order Sale', NULL, 'fas fa-shopping-cart', NULL, 12, NULL, NULL, '2021-04-06 12:11:34', '2022-03-08 05:54:58'),
(125, 1, '2', 'Add Pre Order Sale', NULL, NULL, 'pre-order-sale/add', 1, 124, NULL, '2021-04-06 12:12:13', '2021-04-06 12:12:19'),
(126, 1, '2', 'Manage Pre Order Sale', NULL, NULL, 'pre-order-sale', 2, 124, NULL, '2021-04-06 12:12:41', '2021-04-06 12:12:47'),
(127, 1, '2', 'FInished By Products', NULL, NULL, 'finished-by-products', 4, 23, NULL, '2021-04-07 21:30:07', '2021-04-07 22:29:05'),
(128, 1, '2', 'Truck', NULL, NULL, 'truck', 1, 83, NULL, '2021-04-18 23:13:20', '2021-04-18 23:15:32'),
(129, 1, '2', 'Driver', NULL, NULL, 'driver', 2, 83, NULL, '2021-04-18 23:13:46', '2021-04-18 23:15:56'),
(130, 1, '2', 'Expense Category', NULL, NULL, 'expense-category', 3, 83, NULL, '2021-04-18 23:14:17', '2021-04-18 23:16:13'),
(131, 1, '2', 'Truck Ledger', NULL, NULL, 'truck-ledger', 6, 83, NULL, '2021-04-18 23:14:58', '2021-04-18 23:16:36'),
(132, 1, '2', 'Create Labor Bill', NULL, 'far fa-file-alt', 'others-labor-bill', 20, NULL, NULL, '2021-04-24 09:14:48', '2022-03-08 05:54:13'),
(133, 1, '2', 'Balance Sheet', NULL, NULL, 'balance-sheet', 9, 53, NULL, '2021-04-24 09:15:51', '2022-03-20 02:57:46'),
(134, 1, '2', 'Human Resource', NULL, 'fas fa-users', NULL, 23, NULL, NULL, '2021-04-03 16:54:02', '2022-03-08 05:54:13'),
(135, 1, '2', 'HRM', NULL, NULL, NULL, 1, 134, NULL, '2021-04-03 16:54:49', '2021-04-26 05:02:56'),
(136, 1, '2', 'Manage Department', NULL, NULL, 'department', 1, 135, NULL, '2021-04-03 16:55:36', '2021-04-26 04:59:58'),
(137, 1, '2', 'Manage Division', NULL, NULL, 'division', 2, 135, NULL, '2021-04-03 16:55:58', '2021-04-26 05:00:21'),
(138, 1, '2', 'Manage Designation', NULL, NULL, 'designation', 3, 135, NULL, '2021-04-03 16:56:21', '2021-04-26 05:01:09'),
(139, 1, '2', 'Add Employee', NULL, NULL, 'employee/add', 4, 135, NULL, '2021-04-03 16:57:01', '2021-04-26 05:02:24'),
(140, 1, '2', 'Manage Employee', NULL, NULL, 'employee', 5, 135, NULL, '2021-04-03 16:59:55', '2021-04-26 23:16:32'),
(141, 1, '2', 'Attendance', NULL, NULL, NULL, 2, 134, NULL, '2021-04-03 17:00:34', '2021-04-26 05:06:51'),
(142, 1, '2', 'Manage Attendance', NULL, NULL, 'attendance', 1, 141, NULL, '2021-04-03 17:01:28', '2021-04-26 05:04:12'),
(143, 1, '2', 'Attendance Report', NULL, NULL, 'attendance-report', 2, 141, NULL, '2021-04-03 17:01:53', '2021-04-26 05:04:16'),
(144, 1, '2', 'Payroll', NULL, NULL, NULL, 4, 134, NULL, '2021-04-03 17:08:19', '2021-04-26 05:09:25'),
(145, 1, '2', 'Manage Benifits', NULL, NULL, 'benifits', 1, 144, NULL, '2021-04-03 17:09:11', '2021-04-26 05:08:33'),
(146, 1, '2', 'Add Salary Setup', NULL, NULL, 'salary-setup/add', 2, 144, NULL, '2021-04-03 17:09:53', '2021-05-09 04:34:40'),
(147, 1, '2', 'Manage Salary Setup', NULL, NULL, 'salary-setup', 3, 144, NULL, '2021-04-03 17:10:19', '2021-04-26 05:08:57'),
(148, 1, '2', 'Manage Salary Generate', NULL, NULL, 'salary-generate', 4, 144, NULL, '2021-04-03 17:14:01', '2021-04-26 05:08:57'),
(150, 1, '2', 'Leave', NULL, NULL, NULL, 3, 134, NULL, '2021-04-03 18:02:43', '2021-04-26 05:06:51'),
(151, 1, '2', 'Weekly Holiday', NULL, NULL, 'weekly-holiday', 1, 150, NULL, '2021-04-03 18:03:11', '2021-04-26 05:05:09'),
(152, 1, '2', 'Holiday', NULL, NULL, 'holiday', 2, 150, NULL, '2021-04-03 18:03:29', '2021-04-26 07:11:00'),
(153, 1, '2', 'Manage Leave Type', NULL, NULL, 'leave-type', 3, 150, NULL, '2021-04-03 18:03:56', '2021-04-26 07:11:00'),
(154, 1, '2', 'Manage Leave Application', NULL, NULL, 'leave-application', 4, 150, NULL, '2021-04-03 18:04:31', '2021-04-26 07:11:00'),
(155, 1, '2', 'Shift', NULL, NULL, 'shift', 6, 135, NULL, '2021-04-26 07:09:53', '2021-04-26 07:20:08'),
(156, 1, '2', 'Asset', NULL, 'fas fa-desktop', NULL, 27, NULL, NULL, '2021-05-02 22:26:42', '2022-03-08 05:54:13'),
(157, 1, '2', 'Asset Type', NULL, NULL, 'asset-type', 1, 156, NULL, '2021-05-02 22:27:07', '2021-05-02 22:27:37'),
(158, 1, '2', 'Manage Asset', NULL, NULL, 'asset', 2, 156, NULL, '2021-05-02 22:27:30', '2021-05-02 22:27:56'),
(159, 1, '2', 'Material Stock Ledger', NULL, 'fas fa-file', 'material-stock-ledger', 6, NULL, NULL, '2021-05-11 12:09:23', '2022-03-08 05:54:58'),
(160, 1, '2', 'Finished Goods Stock Ledger', NULL, 'fas fa-file', 'finished-goods-stock-ledger', 10, NULL, NULL, '2021-05-11 12:10:11', '2022-03-08 05:54:58'),
(161, 1, '2', 'Loan', NULL, 'far fa-money-bill-alt', NULL, 22, NULL, NULL, '2021-07-24 06:00:12', '2022-03-08 05:54:13'),
(162, 1, '2', 'Personal Loan', NULL, NULL, NULL, 1, 161, NULL, '2021-07-24 06:00:48', '2021-07-24 06:04:17'),
(163, 1, '2', 'Mangage Person', NULL, NULL, 'personal-loan-person', 1, 162, NULL, '2021-07-24 06:01:33', '2021-07-24 06:02:04'),
(164, 1, '2', 'Loan Manage', NULL, NULL, 'personal-loan', 2, 162, NULL, '2021-07-24 06:01:59', '2021-07-24 06:02:08'),
(165, 1, '2', 'Loan Installment Manage', NULL, NULL, 'personal-loan-installment', 3, 162, NULL, '2021-07-24 06:02:35', '2021-07-24 06:02:43'),
(166, 1, '2', 'Official Loan', NULL, NULL, NULL, 2, 161, NULL, '2021-07-24 06:03:26', '2021-07-24 06:06:25'),
(167, 1, '2', 'Loan manage', NULL, NULL, 'official-loan', 1, 166, NULL, '2021-07-24 06:04:04', '2021-07-24 06:04:13'),
(168, 1, '2', 'Loan Installment Manage', NULL, NULL, 'official-loan-installment', 2, 166, NULL, '2021-07-24 06:04:48', '2021-07-24 06:04:56'),
(169, 1, '2', 'Loan Report', NULL, NULL, NULL, 3, 161, NULL, '2021-07-24 06:05:20', '2021-07-24 06:06:34'),
(170, 1, '2', 'Report', NULL, NULL, 'loan-report', 1, 169, NULL, '2021-07-24 06:05:48', '2021-07-24 06:05:52'),
(171, 1, '2', 'Labor Head', NULL, 'fas fa-user', NULL, 15, NULL, NULL, '2022-03-03 00:46:27', '2022-03-08 05:54:58'),
(172, 1, '2', 'Manage Labor Head', NULL, NULL, 'labor-head', 1, 171, '_self', '2022-03-03 00:47:47', '2022-03-03 00:48:55'),
(173, 1, '2', 'Labor Head Ledger', NULL, NULL, 'labor-head-ledger', 2, 171, '_self', '2022-03-03 00:48:50', '2022-03-03 00:49:04'),
(174, 1, '2', 'Tenant', NULL, 'fas fa-user', NULL, 16, NULL, '_self', '2022-03-08 01:48:17', '2022-03-08 05:54:58'),
(175, 1, '2', 'Manage Tenant', NULL, NULL, 'tenant', 1, 174, '_self', '2022-03-08 01:49:05', '2022-03-08 02:45:25'),
(176, 1, '2', 'Tenant Ledger', NULL, NULL, 'tenant-ledger', 2, 174, '_self', '2022-03-08 01:51:08', '2022-03-08 02:45:25'),
(177, 1, '2', 'Tenant Production', NULL, 'fas fa-industry', NULL, 17, NULL, '_self', '2022-03-08 05:47:07', '2022-03-08 05:54:58'),
(179, 1, '2', 'Tenant Production Manage', NULL, NULL, 'tenant-production-manage', 1, 177, '_self', '2022-03-08 05:51:35', '2022-03-20 02:46:33'),
(183, 1, '2', 'Income Statement Report', NULL, NULL, 'income-statement-report', 1, 70, '_self', '2022-03-20 02:46:05', '2022-03-20 02:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `module_role`
--

CREATE TABLE `module_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_role`
--

INSERT INTO `module_role` (`id`, `module_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(2, 2, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(3, 15, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(4, 16, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(5, 17, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(6, 18, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(7, 27, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(8, 19, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(9, 22, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(10, 20, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(11, 21, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(12, 23, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(13, 24, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(14, 25, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(15, 26, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(16, 28, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(17, 29, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(18, 30, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(19, 31, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(20, 32, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(21, 33, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(22, 34, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(23, 35, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(24, 36, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(25, 37, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(26, 38, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(27, 39, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(28, 40, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(29, 41, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(30, 83, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(31, 84, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(32, 85, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(33, 78, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(34, 79, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(35, 91, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(36, 80, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(37, 86, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(38, 87, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(39, 81, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(40, 82, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(41, 42, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(42, 43, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(43, 44, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(44, 45, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(45, 46, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(46, 47, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(47, 48, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(48, 49, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(49, 50, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(50, 51, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(51, 52, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(52, 53, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(53, 54, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(54, 55, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(55, 56, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(56, 57, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(57, 58, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(58, 59, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(59, 60, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(60, 61, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(61, 98, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(62, 99, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(63, 100, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(64, 101, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(65, 62, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(66, 63, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(67, 64, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(68, 65, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(69, 66, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(70, 67, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(71, 68, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(72, 69, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(73, 70, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(74, 71, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(75, 88, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(76, 92, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(77, 93, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(78, 72, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(79, 94, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(80, 73, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(81, 74, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(82, 75, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(83, 76, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(84, 95, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(85, 96, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(86, 97, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(87, 77, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(88, 3, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(89, 4, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(90, 5, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(91, 6, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(92, 7, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(93, 10, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(94, 11, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(95, 12, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(96, 89, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(97, 90, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(98, 13, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(99, 14, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(100, 127, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(101, 124, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(102, 125, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(103, 126, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(104, 123, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(105, 15, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(106, 16, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(107, 17, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(108, 18, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(109, 27, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(110, 38, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(111, 39, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(112, 40, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(113, 41, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(114, 128, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(115, 129, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(116, 130, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(117, 131, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(118, 1, 3, '2021-04-19 02:02:02', '2021-04-19 02:02:02'),
(119, 2, 3, '2021-04-19 02:02:02', '2021-04-19 02:02:02'),
(120, 132, 2, '2021-04-24 09:18:52', '2021-04-24 09:18:52'),
(121, 133, 2, '2021-04-24 09:18:52', '2021-04-24 09:18:52'),
(122, 156, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(123, 157, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(124, 158, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(125, 134, 2, '2021-05-04 13:08:17', '2021-05-04 13:08:17'),
(126, 135, 2, '2021-05-04 13:08:17', '2021-05-04 13:08:17'),
(127, 136, 2, '2021-05-04 13:08:17', '2021-05-04 13:08:17'),
(128, 137, 2, '2021-05-04 13:08:17', '2021-05-04 13:08:17'),
(129, 138, 2, '2021-05-04 13:08:17', '2021-05-04 13:08:17'),
(130, 139, 2, '2021-05-04 13:08:17', '2021-05-04 13:08:17'),
(131, 140, 2, '2021-05-04 13:08:17', '2021-05-04 13:08:17'),
(132, 155, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(133, 141, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(134, 142, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(135, 143, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(136, 150, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(137, 151, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(138, 152, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(139, 153, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(140, 154, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(141, 144, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(142, 145, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(143, 146, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(144, 147, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(145, 148, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(146, 1, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(147, 15, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(148, 16, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(149, 17, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(150, 18, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(151, 27, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(152, 19, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(153, 22, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(154, 20, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(155, 21, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(156, 23, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(157, 24, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(158, 25, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(159, 26, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(160, 127, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(161, 28, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(162, 29, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(163, 30, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(164, 31, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(165, 124, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(166, 125, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(167, 126, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(168, 32, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(169, 33, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(170, 38, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(171, 39, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(172, 40, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(173, 41, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(174, 83, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(175, 128, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(176, 129, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(177, 130, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(178, 85, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(179, 131, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(180, 78, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(181, 79, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(182, 91, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(183, 80, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(184, 86, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(185, 87, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(186, 81, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(187, 82, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(188, 132, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(189, 42, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(190, 43, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(191, 44, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(192, 45, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(193, 46, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(194, 47, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(195, 48, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(196, 49, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(197, 50, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(198, 51, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(199, 52, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(200, 53, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(201, 54, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(202, 55, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(203, 56, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(204, 57, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(205, 58, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(206, 59, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(207, 60, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(208, 61, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(209, 133, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(210, 134, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(211, 135, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(212, 136, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(213, 137, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(214, 138, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(215, 139, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(216, 140, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(217, 155, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(218, 141, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(219, 142, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(220, 143, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(221, 150, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(222, 151, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(223, 152, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(224, 153, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(225, 154, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(226, 144, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(227, 145, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(228, 146, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(229, 147, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(230, 148, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(231, 98, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(232, 99, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(233, 100, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(234, 101, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(235, 62, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(236, 63, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(237, 64, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(238, 65, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(239, 66, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(240, 67, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(241, 68, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(242, 69, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(243, 156, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(244, 157, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(245, 158, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(246, 70, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(247, 71, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(248, 88, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(249, 92, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(250, 93, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(251, 72, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(252, 94, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(253, 73, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(254, 74, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(255, 75, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(256, 76, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(257, 95, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(258, 96, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(259, 97, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(260, 77, 4, '2021-05-04 14:20:37', '2021-05-04 14:20:37'),
(261, 4, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(262, 5, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(263, 7, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(264, 10, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(265, 11, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(266, 12, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(267, 89, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(268, 90, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(269, 123, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(270, 13, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(271, 14, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(272, 34, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(273, 35, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(274, 36, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(275, 37, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(276, 159, 2, '2021-05-11 13:21:31', '2021-05-11 13:21:31'),
(277, 160, 2, '2021-05-11 14:32:05', '2021-05-11 14:32:05'),
(278, 161, 2, '2021-07-31 16:43:38', '2021-07-31 16:43:38'),
(279, 162, 2, '2021-07-31 16:43:38', '2021-07-31 16:43:38'),
(280, 163, 2, '2021-07-31 16:43:38', '2021-07-31 16:43:38'),
(281, 164, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(282, 165, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(283, 166, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(284, 167, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(285, 168, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(286, 169, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(287, 170, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(288, 8, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(289, 9, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('01a7a6be-66f9-45a5-9fcb-f9eb5a8ca4ae', 'App\\Notifications\\PreOrderSale', 'App\\Models\\User', 2, '{\"message\":\"New product pre order sale invoice 7854125 generated.\"}', NULL, '2022-03-01 04:50:03', '2022-03-01 04:50:03'),
('060cfbfa-dfcc-42da-bfc8-f147dfbc857a', 'App\\Notifications\\MaterialPurchased', 'App\\Models\\User', 2, '{\"message\":\"New material purchase invoice 00012 generated.\"}', NULL, '2022-02-16 21:47:36', '2022-02-16 21:47:36'),
('1ced8873-6b9f-4969-804d-06a3499074c8', 'App\\Notifications\\MaterialPurchased', 'App\\Models\\User', 2, '{\"message\":\"New material purchase invoice 85214785 generated.\"}', NULL, '2022-02-21 00:25:06', '2022-02-21 00:25:06'),
('27f98a30-7703-4c95-a147-3cea1767dde8', 'App\\Notifications\\MaterialPurchased', 'App\\Models\\User', 2, '{\"message\":\"New material purchase invoice \\u09ae\\u09c7\\u09ae 123456789 generated.\"}', NULL, '2022-02-28 01:53:38', '2022-02-28 01:53:38'),
('320f9ff6-3188-476d-9aec-cac19f7f9a44', 'App\\Notifications\\MaterialPurchased', 'App\\Models\\User', 2, '{\"message\":\"New material purchase invoice 78954123658 generated.\"}', NULL, '2022-02-28 23:55:15', '2022-02-28 23:55:15'),
('46979e13-d08f-410f-8182-99b872159905', 'App\\Notifications\\PreOrderSale', 'App\\Models\\User', 2, '{\"message\":\"New product pre order sale invoice 7895564 generated.\"}', NULL, '2022-03-20 22:58:51', '2022-03-20 22:58:51'),
('4dc3bb18-e64e-45bd-8037-b61adf020381', 'App\\Notifications\\MaterialPurchased', 'App\\Models\\User', 2, '{\"message\":\"New material purchase invoice 874521459 generated.\"}', NULL, '2022-03-01 00:30:08', '2022-03-01 00:30:08'),
('53f7bfac-d2eb-4774-83ec-c898df318986', 'App\\Notifications\\NewProduction', 'App\\Models\\User', 2, '{\"message\":\"New production work oder 2022032166 generated\"}', NULL, '2022-03-21 04:39:39', '2022-03-21 04:39:39'),
('6fc6b448-dc9b-43ac-af7f-ccb270373c74', 'App\\Notifications\\MaterialPurchased', 'App\\Models\\User', 2, '{\"message\":\"New material purchase invoice 541236589 generated.\"}', NULL, '2022-03-20 22:56:32', '2022-03-20 22:56:32'),
('8370c454-ef42-4229-a3be-6691e216e188', 'App\\Notifications\\MaterialPurchased', 'App\\Models\\User', 2, '{\"message\":\"New material purchase invoice 874596 generated.\"}', NULL, '2022-02-17 03:30:32', '2022-02-17 03:30:32'),
('8baf5288-c471-4212-a50e-52fd07817119', 'App\\Notifications\\MaterialPurchased', 'App\\Models\\User', 2, '{\"message\":\"New material purchase invoice 7895426 generated.\"}', NULL, '2022-02-28 02:21:38', '2022-02-28 02:21:38'),
('90085547-37c0-4c4e-8b7b-7abc9cb27637', 'App\\Notifications\\TransportService', 'App\\Models\\User', 2, '{\"message\":\"New transport voucher TRANS-2022022111175 generated.\"}', NULL, '2022-02-21 06:01:37', '2022-02-21 06:01:37'),
('c9cf1903-be96-4dde-a9d4-8e2e3cecb013', 'App\\Notifications\\MaterialPurchased', 'App\\Models\\User', 2, '{\"message\":\"New material purchase invoice 0085 generated.\"}', NULL, '2022-02-16 22:54:52', '2022-02-16 22:54:52'),
('ccc58707-fbbe-4515-a6d3-40b4a7ff0d93', 'App\\Notifications\\MaterialPurchased', 'App\\Models\\User', 2, '{\"message\":\"New material purchase invoice 465765 generated.\"}', NULL, '2022-03-20 04:22:18', '2022-03-20 04:22:18'),
('d2176b4e-9bcc-4d5d-b531-04fcc60870c6', 'App\\Notifications\\NewProduction', 'App\\Models\\User', 2, '{\"message\":\"New production work oder 20220302645 generated\"}', NULL, '2022-03-01 22:56:01', '2022-03-01 22:56:01'),
('e72dcb69-3f71-4971-8e27-8892ca2cc42c', 'App\\Notifications\\MaterialPurchased', 'App\\Models\\User', 2, '{\"message\":\"New material purchase invoice 874596325 generated.\"}', NULL, '2022-02-28 02:33:32', '2022-02-28 02:33:32'),
('eb4fa36a-1b33-4b3e-8ca2-77a5bb362191', 'App\\Notifications\\NewProduction', 'App\\Models\\User', 2, '{\"message\":\"New production work oder 20220217105 generated\"}', NULL, '2022-02-17 03:32:54', '2022-02-17 03:32:54'),
('ec2c6a1a-a9c8-48eb-8ad3-b15abbc01a98', 'App\\Notifications\\MaterialPurchased', 'App\\Models\\User', 2, '{\"message\":\"New material purchase invoice 676543 generated.\"}', NULL, '2022-03-20 03:23:33', '2022-03-20 03:23:33'),
('f03440f2-b5eb-4a39-b6ba-a09b8c1f9db9', 'App\\Notifications\\NewProduction', 'App\\Models\\User', 2, '{\"message\":\"New production work oder 20220301408 generated\"}', NULL, '2022-03-01 03:05:21', '2022-03-01 03:05:21'),
('f42c959f-ca18-4129-a8c7-5bc77a9e8c93', 'App\\Notifications\\MachinePurchased', 'App\\Models\\User', 2, '{\"message\":\"New machine tools purchase invoice 852147859 generated.\"}', NULL, '2022-02-22 22:44:58', '2022-02-22 22:44:58'),
('f8932301-4393-4a00-a234-03c11e81c270', 'App\\Notifications\\PreOrderSale', 'App\\Models\\User', 2, '{\"message\":\"New product pre order sale invoice 85424 generated.\"}', NULL, '2022-02-21 00:43:20', '2022-02-21 00:43:20'),
('f9175384-b4c0-431f-8e2a-a38ea8ad857c', 'App\\Notifications\\MaintenanceServiceNotification', 'App\\Models\\User', 2, '{\"message\":\"New maintenance service invoice 7412589645 generated.\"}', NULL, '2022-02-23 00:28:48', '2022-02-23 00:28:48');

-- --------------------------------------------------------

--
-- Table structure for table `other_labor_bills`
--

CREATE TABLE `other_labor_bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `labor_head_id` bigint(20) DEFAULT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_date` date NOT NULL,
  `total_labor_cost` double NOT NULL,
  `payment_status` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_due` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_total` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_amount` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due_amount` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Approved,2=Rejected,3=Pending',
  `status_change_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `other_labor_bills`
--

INSERT INTO `other_labor_bills` (`id`, `labor_head_id`, `voucher_no`, `voucher_date`, `total_labor_cost`, `payment_status`, `payment_method`, `account_id`, `previous_due`, `net_total`, `paid_amount`, `due_amount`, `status`, `status_change_by`, `status_change_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, NULL, '20220223074825', '2022-02-23', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'Super Admin', '2022-03-02 00:00:00', 'Super Admin', NULL, '2022-02-23 01:48:36', '2022-03-02 00:39:32'),
(5, 18, '20220307090306', '2022-03-07', 158.75, '1', '1', '23', '5000', '5158.75', NULL, '5158.75', '1', 'Super Admin', '2022-03-10 00:00:00', 'Super Admin', 'Super Admin', '2022-03-07 03:03:32', '2022-03-10 12:27:04'),
(6, 19, '20220307090409', '2022-03-07', 142.5, '1', '1', '23', '8000', '8142.5', '50', '8092.5', '1', 'Super Admin', '2022-03-10 00:00:00', 'Super Admin', 'Super Admin', '2022-03-07 03:05:12', '2022-03-10 12:26:51'),
(7, 19, '20220321105322', '2022-03-21', 950, '1', '1', '23', '9907.5', '10857.5', '10000', '857.5', '1', 'Super Admin', '2022-03-21 00:00:00', 'Super Admin', NULL, '2022-03-21 04:54:10', '2022-03-21 04:54:55');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `module_id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dashboard Access', 'dashboard-access', '2021-03-26 23:49:24', NULL),
(2, 4, 'User Access', 'user-access', '2021-03-26 23:49:24', NULL),
(3, 4, 'User Add', 'user-add', '2021-03-26 23:49:24', NULL),
(4, 4, 'User Edit', 'user-edit', '2021-03-26 23:49:24', NULL),
(5, 4, 'User View', 'user-view', '2021-03-26 23:49:24', NULL),
(6, 4, 'User Delete', 'user-delete', '2021-03-26 23:49:24', NULL),
(7, 4, 'User Bulk Delete', 'user-bulk-delete', '2021-03-26 23:49:24', NULL),
(8, 4, 'User Report', 'user-report', '2021-03-26 23:49:24', NULL),
(9, 5, 'Role Access', 'role-access', '2021-03-26 23:49:24', NULL),
(10, 5, 'Role Add', 'role-add', '2021-03-26 23:49:24', NULL),
(11, 5, 'Role Edit', 'role-edit', '2021-03-26 23:49:24', NULL),
(12, 5, 'Role View', 'role-view', '2021-03-26 23:49:24', NULL),
(13, 5, 'Role Delete', 'role-delete', '2021-03-26 23:49:24', NULL),
(14, 5, 'Role Bulk Delete', 'role-bulk-delete', '2021-03-26 23:49:24', NULL),
(15, 5, 'Role Report', 'role-report', '2021-03-26 23:49:24', NULL),
(17, 8, 'Menu Access', 'menu-access', '2021-03-26 23:49:24', NULL),
(18, 8, 'Menu Add', 'menu-add', '2021-03-26 23:49:24', NULL),
(19, 8, 'Menu Edit', 'menu-edit', '2021-03-26 23:49:24', NULL),
(20, 8, 'Menu Delete', 'menu-delete', '2021-03-26 23:49:24', NULL),
(21, 8, 'Menu Bulk Delete', 'menu-bulk-delete', '2021-03-26 23:49:24', NULL),
(22, 8, 'Menu Report', 'menu-report', '2021-03-26 23:49:24', NULL),
(23, 8, 'Menu Builder Access', 'menu-builder-access', '2021-03-26 23:49:24', NULL),
(24, 8, 'Menu Module Add', 'menu-module-add', '2021-03-26 23:49:24', NULL),
(25, 8, 'Menu Module Edit', 'menu-module-edit', '2021-03-26 23:49:24', NULL),
(26, 8, 'Menu Module Delete', 'menu-module-delete', '2021-03-26 23:49:24', NULL),
(27, 9, 'Permission Access', 'permission-access', '2021-03-26 23:49:24', NULL),
(28, 9, 'Permission Add', 'permission-add', '2021-03-26 23:49:24', NULL),
(29, 9, 'Permission Edit', 'permission-edit', '2021-03-26 23:49:24', NULL),
(30, 9, 'Permission Delete', 'permission-delete', '2021-03-26 23:49:24', NULL),
(31, 9, 'Permission Bulk Delete', 'permission-bulk-delete', '2021-03-26 23:49:24', NULL),
(32, 9, 'Permission Report', 'permission-report', '2021-03-26 23:49:24', NULL),
(33, 11, 'Warehouse Access', 'warehouse-access', '2021-03-27 02:06:16', NULL),
(34, 11, 'Warehouse Add', 'warehouse-add', '2021-03-27 02:06:16', NULL),
(35, 11, 'Warehouse Edit', 'warehouse-edit', '2021-03-27 02:06:16', NULL),
(36, 11, 'Warehouse Delete', 'warehouse-delete', '2021-03-27 02:06:16', NULL),
(37, 11, 'Warehouse Bulk Delete', 'warehouse-bulk-delete', '2021-03-27 02:06:16', NULL),
(38, 11, 'Warehouse Report', 'warehouse-report', '2021-03-27 02:06:16', NULL),
(39, 10, 'General Setting Access', 'general-setting-access', '2021-03-27 02:07:15', NULL),
(40, 12, 'Customer Group Access', 'customer-group-access', '2021-03-27 02:08:50', NULL),
(41, 12, 'Customer Group Add', 'customer-group-add', '2021-03-27 02:08:50', NULL),
(42, 12, 'Customer Group Edit', 'customer-group-edit', '2021-03-27 02:08:50', NULL),
(43, 12, 'Customer Group Delete', 'customer-group-delete', '2021-03-27 02:08:50', NULL),
(44, 12, 'Customer Group Bulk Delete', 'customer-group-bulk-delete', '2021-03-27 02:08:50', NULL),
(45, 12, 'Customer Group Report', 'customer-group-report', '2021-03-27 02:08:50', NULL),
(46, 13, 'Unit Access', 'unit-access', '2021-03-27 02:10:02', NULL),
(47, 13, 'Unit Add', 'unit-add', '2021-03-27 02:10:02', NULL),
(48, 13, 'Unit Edit', 'unit-edit', '2021-03-27 02:10:02', NULL),
(49, 13, 'Unit Delete', 'unit-delete', '2021-03-27 02:10:02', NULL),
(50, 13, 'Unit Bulk Delete', 'unit-bulk-delete', '2021-03-27 02:10:02', NULL),
(51, 13, 'Unit Report', 'unit-report', '2021-03-27 02:10:02', NULL),
(52, 14, 'Tax Access', 'tax-access', '2021-03-27 02:10:46', NULL),
(53, 14, 'Tax Add', 'tax-add', '2021-03-27 02:10:46', NULL),
(54, 14, 'Tax Edit', 'tax-edit', '2021-03-27 02:10:46', NULL),
(55, 14, 'Tax Delete', 'tax-delete', '2021-03-27 02:10:46', NULL),
(56, 14, 'Tax Bulk Delete', 'tax-bulk-delete', '2021-03-27 02:10:46', NULL),
(57, 14, 'Tax Report', 'tax-report', '2021-03-27 02:10:46', NULL),
(58, 15, 'Material Access', 'material-access', '2021-03-27 02:21:22', NULL),
(59, 15, 'Material Add', 'material-add', '2021-03-27 02:21:22', NULL),
(60, 15, 'Material Edit', 'material-edit', '2021-03-27 02:21:22', NULL),
(61, 15, 'Material View', 'material-view', '2021-03-27 02:21:22', NULL),
(62, 15, 'Material Delete', 'material-delete', '2021-03-27 02:21:22', NULL),
(63, 15, 'Material Bulk Delete', 'material-bulk-delete', '2021-03-27 02:21:22', NULL),
(64, 15, 'Material Report', 'material-report', '2021-03-27 02:21:22', NULL),
(65, 18, 'Purchase Access', 'purchase-access', '2021-03-27 02:22:49', NULL),
(66, 18, 'Purchase Add', 'purchase-add', '2021-03-27 02:22:49', NULL),
(67, 18, 'Purchase Edit', 'purchase-edit', '2021-03-27 02:22:49', NULL),
(68, 18, 'Purchase View', 'purchase-view', '2021-03-27 02:22:49', NULL),
(69, 18, 'Purchase Delete', 'purchase-delete', '2021-03-27 02:22:49', NULL),
(70, 18, 'Purchase Bulk Delete', 'purchase-bulk-delete', '2021-03-27 02:22:49', NULL),
(71, 18, 'Purchase Report', 'purchase-report', '2021-03-27 02:22:49', NULL),
(72, 27, 'Material Stock Access', 'material-stock-access', '2021-03-27 02:23:30', NULL),
(73, 21, 'Product Access', 'product-access', '2021-03-27 02:24:44', NULL),
(74, 21, 'Product Add', 'product-add', '2021-03-27 02:24:44', NULL),
(75, 21, 'Product Edit', 'product-edit', '2021-03-27 02:24:44', NULL),
(76, 21, 'Product View', 'product-view', '2021-03-27 02:24:44', NULL),
(77, 21, 'Product Delete', 'product-delete', '2021-03-27 02:24:44', NULL),
(78, 21, 'Product Bulk Delete', 'product-bulk-delete', '2021-03-27 02:24:44', NULL),
(79, 21, 'Product Report', 'product-report', '2021-03-27 02:24:44', NULL),
(80, 25, 'Production Access', 'production-access', '2021-03-27 02:26:29', NULL),
(81, 25, 'Production Add', 'production-add', '2021-03-27 02:26:29', NULL),
(82, 25, 'Production Edit', 'production-edit', '2021-03-27 02:26:29', NULL),
(83, 25, 'Production View', 'production-view', '2021-03-27 02:26:29', NULL),
(84, 25, 'Production Delete', 'production-delete', '2021-03-27 02:26:29', NULL),
(85, 25, 'Production Bulk Delete', 'production-bulk-delete', '2021-03-27 02:26:29', NULL),
(86, 25, 'Production Report', 'production-report', '2021-03-27 02:26:29', NULL),
(87, 26, 'Finished Products Access', 'finished-products-access', '2021-03-27 02:27:05', '2021-04-07 22:29:54'),
(88, 28, 'Finished Goods Stock Access', 'finished-goods-stock-access', '2021-03-27 02:28:06', NULL),
(89, 31, 'Sale Access', 'sale-access', '2021-03-27 02:30:26', NULL),
(90, 31, 'Sale Add', 'sale-add', '2021-03-27 02:30:26', NULL),
(91, 31, 'Sale Edit', 'sale-edit', '2021-03-27 02:30:26', NULL),
(92, 31, 'Sale View', 'sale-view', '2021-03-27 02:30:26', NULL),
(93, 31, 'Sale Delete', 'sale-delete', '2021-03-27 02:30:26', NULL),
(94, 31, 'Sale Bulk Delete', 'sale-bulk-delete', '2021-03-27 02:30:26', NULL),
(95, 31, 'Sale Report', 'sale-report', '2021-03-27 02:30:26', NULL),
(96, 33, 'Customer Access', 'customer-access', '2021-03-27 02:32:51', NULL),
(97, 33, 'Customer Add', 'customer-add', '2021-03-27 02:32:51', NULL),
(98, 33, 'Customer Edit', 'customer-edit', '2021-03-27 02:32:51', NULL),
(99, 33, 'Customer VIew', 'customer-view', '2021-03-27 02:32:51', NULL),
(100, 33, 'Customer Delete', 'customer-delete', '2021-03-27 02:32:51', NULL),
(101, 33, 'Customer Bulk Delete', 'customer-bulk-delete', '2021-03-27 02:32:51', NULL),
(102, 33, 'Customer Report', 'customer-report', '2021-03-27 02:32:51', NULL),
(103, 34, 'Customer Ledger Access', 'customer-ledger-access', '2021-03-27 02:33:07', NULL),
(104, 35, 'Credit Customer Access', 'credit-customer-access', '2021-03-27 02:33:22', NULL),
(105, 36, 'Paid Customer Access', 'paid-customer-access', '2021-03-27 02:33:35', NULL),
(106, 37, 'Customer Advance Access', 'customer-advance-access', '2021-03-27 02:34:13', NULL),
(107, 37, 'Customer Advance Add', 'customer-advance-add', '2021-03-27 02:34:13', NULL),
(108, 37, 'Customer Advance Edit', 'customer-advance-edit', '2021-03-27 02:34:13', NULL),
(109, 37, 'Customer Advance Delete', 'customer-advance-delete', '2021-03-27 02:34:13', NULL),
(110, 37, 'Customer Advance Bulk Delete', 'customer-advance-bulk-delete', '2021-03-27 02:34:13', NULL),
(111, 37, 'Customer Advance Access Report', 'customer-advance-access-report', '2021-03-27 02:34:13', NULL),
(112, 39, 'Supplier Access', 'supplier-access', '2021-03-27 02:38:19', NULL),
(113, 39, 'Supplier Add', 'supplier-add', '2021-03-27 02:38:19', NULL),
(114, 39, 'Supplier Edit', 'supplier-edit', '2021-03-27 02:38:19', NULL),
(115, 39, 'Supplier Delete', 'supplier-delete', '2021-03-27 02:38:19', NULL),
(116, 39, 'Supplier Bulk Delete', 'supplier-bulk-delete', '2021-03-27 02:38:19', NULL),
(117, 39, 'Supplier Report', 'supplier-report', '2021-03-27 02:38:19', NULL),
(118, 40, 'Supplier Ledger Access', 'supplier-ledger-access', '2021-03-27 02:38:35', NULL),
(119, 41, 'Supplier Advance Access', 'supplier-advance-access', '2021-03-27 02:39:22', NULL),
(120, 41, 'Supplier Advance Add', 'supplier-advance-add', '2021-03-27 02:39:22', NULL),
(121, 41, 'Supplier Advance Edit', 'supplier-advance-edit', '2021-03-27 02:39:22', NULL),
(122, 41, 'Supplier Advance Delete', 'supplier-advance-delete', '2021-03-27 02:39:22', NULL),
(123, 41, 'Supplier Advance Bulk Delete', 'supplier-advance-bulk-delete', '2021-03-27 02:39:22', NULL),
(124, 41, 'Supplier Advance Report', 'supplier-advance-report', '2021-03-27 02:39:22', NULL),
(125, 85, 'Transport Access', 'transport-access', '2021-03-27 02:40:37', NULL),
(126, 85, 'Transport Add', 'transport-add', '2021-03-27 02:40:37', NULL),
(127, 85, 'Transport Edit', 'transport-edit', '2021-03-27 02:40:37', NULL),
(128, 85, 'Transport View', 'transport-view', '2021-03-27 02:40:37', NULL),
(129, 85, 'Transport Delete', 'transport-delete', '2021-03-27 02:40:37', NULL),
(130, 85, 'Transport Bulk Delete', 'transport-bulk-delete', '2021-03-27 02:40:37', NULL),
(131, 85, 'Transport Report', 'transport-report', '2021-03-27 02:40:37', NULL),
(132, 79, 'Maintenance Category Access', 'maintenance-category-access', '2021-03-27 02:42:37', '2021-03-29 07:19:11'),
(133, 79, 'Maintenance Category Add', 'maintenance-category-add', '2021-03-27 02:42:37', '2021-03-29 07:19:18'),
(134, 79, 'Maintenance Category Edit', 'maintenance-category-edit', '2021-03-27 02:42:37', '2021-03-29 07:19:24'),
(135, 79, 'Maintenance Category Delete', 'maintenance-category-delete', '2021-03-27 02:42:37', '2021-03-29 07:19:31'),
(136, 79, 'Maintenance Category Bulk Delete', 'maintenance-category-bulk-delete', '2021-03-27 02:42:37', '2021-03-29 07:19:38'),
(137, 79, 'Maintenance Category Report', 'maintenance-category-report', '2021-03-27 02:42:37', '2021-03-29 07:19:44'),
(138, 80, 'Machine Access', 'machine-access', '2021-03-27 02:43:33', NULL),
(139, 80, 'Machine Add', 'machine-add', '2021-03-27 02:43:33', NULL),
(140, 80, 'Machine Edit', 'machine-edit', '2021-03-27 02:43:33', NULL),
(141, 80, 'Machine View', 'machine-view', '2021-03-27 02:43:33', NULL),
(142, 80, 'Machine Delete', 'machine-delete', '2021-03-27 02:43:33', NULL),
(143, 80, 'Machine Bulk Delete', 'machine-bulk-delete', '2021-03-27 02:43:33', NULL),
(144, 80, 'Machine Access Report', 'machine-access-report', '2021-03-27 02:43:33', NULL),
(145, 87, 'Machine Purchase Access', 'machine-purchase-access', '2021-03-27 02:44:24', NULL),
(146, 87, 'Machine Purchase Add', 'machine-purchase-add', '2021-03-27 02:44:24', NULL),
(147, 87, 'Machine Purchase Edit', 'machine-purchase-edit', '2021-03-27 02:44:24', NULL),
(148, 87, 'Machine Purchase View', 'machine-purchase-view', '2021-03-27 02:44:24', NULL),
(149, 87, 'Machine Purchase Delete', 'machine-purchase-delete', '2021-03-27 02:44:24', NULL),
(150, 87, 'Machine Purchase Bulk Delete', 'machine-purchase-bulk-delete', '2021-03-27 02:44:24', NULL),
(151, 87, 'Machine Purchase Report', 'machine-purchase-report', '2021-03-27 02:44:24', NULL),
(152, 82, 'Maintenance Service Access', 'maintenance-service-access', '2021-03-27 02:45:28', NULL),
(153, 82, 'Maintenance Service Add', 'maintenance-service-add', '2021-03-27 02:45:28', NULL),
(154, 82, 'Maintenance Service Edit', 'maintenance-service-edit', '2021-03-27 02:45:28', NULL),
(155, 82, 'Maintenance Service View', 'maintenance-service-view', '2021-03-27 02:45:28', NULL),
(156, 82, 'Maintenance Service Delete', 'maintenance-service-delete', '2021-03-27 02:45:28', NULL),
(157, 82, 'Maintenance Service Bulk Delete', 'maintenance-service-bulk-delete', '2021-03-27 02:45:28', NULL),
(158, 82, 'Maintenance Service Report', 'maintenance-service-report', '2021-03-27 02:45:28', NULL),
(159, 43, 'COA Access', 'coa-access', '2021-03-27 02:47:36', NULL),
(160, 44, 'Opening Balance Access', 'opening-balance-access', '2021-03-27 02:48:01', NULL),
(161, 45, 'Supplier Payment Access', 'supplier-payment-access', '2021-03-27 02:48:22', NULL),
(162, 46, 'Customer Receive Access', 'customer-receive-access', '2021-03-27 02:48:40', NULL),
(163, 47, 'Cash Adjustment Access', 'cash-adjustment-access', '2021-03-27 02:48:57', NULL),
(164, 48, 'Debit Voucher Access', 'debit-voucher-access', '2021-03-27 02:49:20', NULL),
(165, 49, 'Credit Voucher Access', 'credit-voucher-access', '2021-03-27 02:49:35', NULL),
(166, 50, 'Contra Voucher Access', 'contra-voucher-access', '2021-03-27 02:49:57', NULL),
(167, 51, 'Journal Voucher Access', 'journal-voucher-access', '2021-03-27 02:50:30', NULL),
(168, 52, 'Voucher Approval Access', 'voucher-approval-access', '2021-03-27 02:51:36', NULL),
(169, 52, 'Approve Voucher', 'approve-voucher', '2021-03-27 02:51:36', NULL),
(170, 52, 'Edit Voucher', 'edit-voucher', '2021-03-27 02:51:36', NULL),
(171, 52, 'Delete Voucher', 'delete-voucher', '2021-03-27 02:51:36', NULL),
(172, 52, 'Voucher Approval Report', 'voucher-approval-report', '2021-03-27 02:51:36', NULL),
(173, 54, 'Cash Book Access', 'cash-book-access', '2021-03-27 02:51:52', NULL),
(174, 55, 'Inventory Ledger Access', 'inventory-ledger-access', '2021-03-27 02:52:12', NULL),
(175, 56, 'Bank Book Access', 'bank-book-access', '2021-03-27 02:52:30', NULL),
(176, 57, 'Mobile Bank Book Access', 'mobile-bank-book-access', '2021-03-27 02:52:46', NULL),
(177, 58, 'General Ledger Access', 'general-ledger-access', '2021-03-27 02:53:03', NULL),
(178, 59, 'Trial Balance Access', 'trial-balance-access', '2021-03-27 02:53:20', NULL),
(179, 60, 'Profit Loss Access', 'profit-loss-access', '2021-03-27 02:53:38', NULL),
(180, 61, 'Cash Flow Access', 'cash-flow-access', '2021-03-27 02:53:56', NULL),
(181, 63, 'Bank Access', 'bank-access', '2021-03-27 02:54:57', NULL),
(182, 63, 'Bank Add', 'bank-add', '2021-03-27 02:54:57', NULL),
(183, 63, 'Bank Edit', 'bank-edit', '2021-03-27 02:54:57', NULL),
(184, 63, 'Bank Delete', 'bank-delete', '2021-03-27 02:54:57', NULL),
(185, 63, 'Bank Report', 'bank-report', '2021-03-27 02:54:57', NULL),
(186, 64, 'Bank Transaction Access', 'bank-transaction-access', '2021-03-27 02:55:04', NULL),
(187, 65, 'Bank Ledger Access', 'bank-ledger-access', '2021-03-27 02:55:22', NULL),
(188, 67, 'Mobile Bank Access', 'mobile-bank-access', '2021-03-27 03:02:36', NULL),
(189, 67, 'Mobile Bank Add', 'mobile-bank-add', '2021-03-27 03:02:36', NULL),
(190, 67, 'Mobile Bank Edit', 'mobile-bank-edit', '2021-03-27 03:02:36', NULL),
(191, 67, 'Mobile Bank Delete', 'mobile-bank-delete', '2021-03-27 03:02:36', NULL),
(192, 67, 'Mobile Bank Bulk Delete', 'mobile-bank-bulk-delete', '2021-03-27 03:02:36', NULL),
(193, 67, 'Mobile Bank Report', 'mobile-bank-report', '2021-03-27 03:02:36', NULL),
(194, 68, 'Mobile Bank Transaction Access', 'mobile-bank-transaction-access', '2021-03-27 03:03:03', NULL),
(195, 69, 'Mobile Bank Ledger Access', 'mobile-bank-ledger-access', '2021-03-27 03:03:25', NULL),
(196, 71, 'Closing Access', 'closing-access', '2021-03-27 03:04:01', NULL),
(197, 88, 'Closing Report Access', 'closing-report-access', '2021-03-27 03:05:24', NULL),
(198, 72, 'Todays Sales Report Access', 'todays-sales-report-access', '2021-03-27 03:06:01', '2021-04-02 06:46:41'),
(199, 73, 'Todays Customer Receipt Access', 'todays-customer-receipt-access', '2021-03-27 03:06:22', '2021-04-02 06:46:55'),
(200, 74, 'Due Report Access', 'due-report-access', '2021-03-27 03:06:41', NULL),
(201, 75, 'Summary Report Access', 'summary-report-access', '2021-03-27 03:07:00', '2021-04-08 02:03:25'),
(202, 76, 'Product Wise Sales Report Access', 'product-wise-sales-report-access', '2021-03-27 03:07:29', NULL),
(203, 77, 'Labor Bill Report Access', 'labor-bill-report-access', '2021-03-27 03:07:55', '2021-03-27 03:08:02'),
(204, 89, 'Labor Bill Access', 'labor-bill-access', '2021-03-27 03:17:07', NULL),
(205, 89, 'Labor Bill Add', 'labor-bill-add', '2021-03-27 03:17:07', NULL),
(206, 89, 'Labor Bill Edit', 'labor-bill-edit', '2021-03-27 03:17:07', NULL),
(207, 89, 'Labor Bill Delete', 'labor-bill-delete', '2021-03-27 03:17:07', NULL),
(208, 89, 'Labor Bill Bulk Delete', 'labor-bill-bulk-delete', '2021-03-27 03:17:07', NULL),
(209, 89, 'Labor Bill Report', 'labor-bill-report', '2021-03-27 03:17:07', NULL),
(210, 90, 'Labor Bill Rate Access', 'labor-bill-rate-access', '2021-03-27 03:46:35', NULL),
(211, 90, 'Labor Bill Rate Add', 'labor-bill-rate-add', '2021-03-27 03:46:35', NULL),
(212, 90, 'Labor Bill Rate Edit', 'labor-bill-rate-edit', '2021-03-27 03:46:35', NULL),
(213, 90, 'Labor Bill Rate Delete', 'labor-bill-rate-delete', '2021-03-27 03:46:35', NULL),
(214, 90, 'Labor Bill Rate Bulk Delete', 'labor-bill-rate-bulk-delete', '2021-03-27 03:46:35', NULL),
(215, 90, 'Labor Bill Rate Report', 'labor-bill-rate-report', '2021-03-27 03:46:35', NULL),
(216, 18, 'Purchase Payment Add', 'purchase-payment-add', '2021-03-28 00:28:57', NULL),
(217, 18, 'Purchase Payment Edit', 'purchase-payment-edit', '2021-03-28 00:28:57', NULL),
(218, 18, 'Purchase Payment View', 'purchase-payment-view', '2021-03-28 00:28:57', NULL),
(219, 18, 'Purchase Payment Delete', 'purchase-payment-delete', '2021-03-28 00:28:57', NULL),
(220, 18, 'Purchase Approve', 'purchase-approve', '2021-03-28 08:24:45', NULL),
(221, 25, 'Production Approve', 'production-approve', '2021-03-28 08:25:02', NULL),
(222, 31, 'Sale Approve', 'sale-approve', '2021-03-28 08:25:17', NULL),
(223, 85, 'Transport Approve', 'transport-approve', '2021-03-28 08:25:54', NULL),
(224, 87, 'Machine Purchase Approve', 'machine-purchase-approve', '2021-03-28 08:26:15', NULL),
(225, 82, 'Maintenance Service Approve', 'maintenance-service-approve', '2021-03-28 08:26:56', NULL),
(226, 91, 'Maintenance Unit Access', 'maintenance-unit-access', '2021-03-28 08:35:33', NULL),
(227, 91, 'Maintenance Unit Add', 'maintenance-unit-add', '2021-03-28 08:35:33', NULL),
(228, 91, 'Maintenance Unit Edit', 'maintenance-unit-edit', '2021-03-28 08:35:33', NULL),
(229, 91, 'Maintenance Unit Delete', 'maintenance-unit-delete', '2021-03-28 08:35:33', NULL),
(230, 91, 'Maintenance Unit Bulk Delete', 'maintenance-unit-bulk-delete', '2021-03-28 08:35:33', NULL),
(231, 91, 'Maintenance Unit Report', 'maintenance-unit-report', '2021-03-28 08:35:33', NULL),
(232, 22, 'Category Access', 'category-access', '2021-03-29 03:03:24', NULL),
(233, 22, 'Category Add', 'category-add', '2021-03-29 03:03:24', NULL),
(234, 22, 'Category Edit', 'category-edit', '2021-03-29 03:03:24', NULL),
(235, 22, 'Category Delete', 'category-delete', '2021-03-29 03:03:24', NULL),
(236, 22, 'Category Bulk Delete', 'category-bulk-delete', '2021-03-29 03:03:24', NULL),
(237, 22, 'Category Report', 'category-report', '2021-03-29 03:03:24', NULL),
(238, 87, 'Machine Purchase Payment Add', 'machine-purchase-payment-add', '2021-03-29 07:26:40', NULL),
(239, 87, 'Machine Purchase Payment Edit', 'machine-purchase-payment-edit', '2021-03-29 07:26:40', NULL),
(240, 87, 'Machine Purchase Payment View', 'machine-purchase-payment-view', '2021-03-29 07:26:40', NULL),
(241, 87, 'Machine Purchase Payment Delete', 'machine-purchase-payment-delete', '2021-03-29 07:26:40', NULL),
(242, 82, 'Maintenance Service Payment Add', 'maintenance-service-payment-add', '2021-03-30 03:07:33', NULL),
(243, 82, 'Maintenance Service Payment Edit', 'maintenance-service-payment-edit', '2021-03-30 03:07:33', NULL),
(244, 82, 'Maintenance Service Payment View', 'maintenance-service-payment-view', '2021-03-30 03:07:33', NULL),
(245, 82, 'Maintenance Service Payment Delete', 'maintenance-service-payment-delete', '2021-03-30 03:07:33', NULL),
(246, 92, 'todays-purchase-report-access', 'todays-purchase-report-access', '2021-04-03 03:58:09', '2021-04-03 03:58:20'),
(247, 93, 'Purchase Report Access', 'purchase-report-access', '2021-04-03 03:58:42', NULL),
(248, 94, 'Sales Report Access', 'sales-report-access', '2021-04-03 03:59:05', NULL),
(249, 95, 'Machine Purchase Report Access', 'machine-purchase-report-access', '2021-04-03 05:59:41', NULL),
(250, 96, 'Maintenance Service Report Access', 'maintenance-service-report-access', '2021-04-03 06:00:05', NULL),
(251, 97, 'Transport Report Access', 'transport-report-access', '2021-04-03 06:00:27', NULL),
(252, 99, 'Expense Item Access', 'expense-item-access', '2021-04-03 06:07:26', NULL),
(253, 99, 'Expense Item Add', 'expense-item-add', '2021-04-03 06:07:26', NULL),
(254, 99, 'Expense Item Edit', 'expense-item-edit', '2021-04-03 06:07:26', NULL),
(255, 99, 'Expense Item Delete', 'expense-item-delete', '2021-04-03 06:07:26', NULL),
(256, 99, 'Expense Item Bulk Delete', 'expense-item-bulk-delete', '2021-04-03 06:07:26', NULL),
(257, 99, 'Expense Item Report', 'expense-item-report', '2021-04-03 06:07:26', NULL),
(258, 100, 'Expense Access', 'expense-access', '2021-04-03 06:08:10', NULL),
(259, 100, 'Expense Add', 'expense-add', '2021-04-03 06:08:10', NULL),
(260, 100, 'Expense Edit', 'expense-edit', '2021-04-03 06:08:10', NULL),
(261, 100, 'Expense Delete', 'expense-delete', '2021-04-03 06:08:10', NULL),
(262, 100, 'Expense Bulk Delete', 'expense-bulk-delete', '2021-04-03 06:08:10', NULL),
(263, 100, 'Expense Report', 'expense-report', '2021-04-03 06:08:10', NULL),
(264, 101, 'Expense Statement Access', 'expense-statement-access', '2021-04-03 06:08:25', NULL),
(343, 123, 'Bag Access', 'bag-access', '2021-04-04 03:43:54', NULL),
(344, 123, 'Bag Add', 'bag-add', '2021-04-04 03:43:54', NULL),
(345, 123, 'Bag Edit', 'bag-edit', '2021-04-04 03:43:54', NULL),
(346, 123, 'Bag Delete', 'bag-delete', '2021-04-04 03:43:54', NULL),
(347, 123, 'Bag Bulk Delete', 'bag-bulk-delete', '2021-04-04 03:43:54', NULL),
(348, 123, 'Bag Report', 'bag-report', '2021-04-04 03:43:54', NULL),
(349, 126, 'Pre Order Sale Access', 'pre-order-sale-access', '2021-04-06 12:14:41', NULL),
(350, 126, 'Pre Order Sale Add', 'pre-order-sale-add', '2021-04-06 12:14:41', NULL),
(351, 126, 'Pre Order Sale Edit', 'pre-order-sale-edit', '2021-04-06 12:14:41', NULL),
(352, 126, 'Pre Order Sale View', 'pre-order-sale-view', '2021-04-06 12:14:41', NULL),
(353, 126, 'Pre Order Sale Delete', 'pre-order-sale-delete', '2021-04-06 12:14:41', NULL),
(354, 126, 'Pre Order Sale Bulk Delete', 'pre-order-sale-bulk-delete', '2021-04-06 12:14:41', NULL),
(355, 126, 'Pre Order Sale Report', 'pre-order-sale-report', '2021-04-06 12:14:41', NULL),
(356, 126, 'Pre Order Sale Approve', 'pre-order-sale-approve', '2021-04-06 12:14:41', NULL),
(357, 127, 'Finished By Products Access', 'finished-by-products-access', '2021-04-07 22:30:34', NULL),
(358, 37, 'Customer Advance Approve', 'customer-advance-approve', '2021-04-17 22:39:03', NULL),
(359, 41, 'Supplier Advance Approve', 'supplier-advance-approve', '2021-04-17 22:39:43', NULL),
(360, 128, 'Truck Access', 'truck-access', '2021-04-18 23:18:02', NULL),
(361, 128, 'Truck Add', 'truck-add', '2021-04-18 23:18:02', NULL),
(362, 128, 'Truck Edit', 'truck-edit', '2021-04-18 23:18:02', NULL),
(363, 128, 'Truck Delete', 'truck-delete', '2021-04-18 23:18:02', NULL),
(364, 128, 'Truck Bulk Delete', 'truck-bulk-delete', '2021-04-18 23:18:02', NULL),
(365, 128, 'Truck Report', 'truck-report', '2021-04-18 23:18:02', NULL),
(366, 129, 'Driver Access', 'driver-access', '2021-04-18 23:18:47', NULL),
(367, 129, 'Driver Add', 'driver-add', '2021-04-18 23:18:47', NULL),
(368, 129, 'Driver Edit', 'driver-edit', '2021-04-18 23:18:47', NULL),
(369, 129, 'Driver Delete', 'driver-delete', '2021-04-18 23:18:47', NULL),
(370, 129, 'Driver Bulk Delete', 'driver-bulk-delete', '2021-04-18 23:18:47', NULL),
(371, 129, 'Driver Report', 'driver-report', '2021-04-18 23:18:47', NULL),
(372, 130, 'Expense Category Access', 'expense-category-access', '2021-04-18 23:19:44', NULL),
(373, 130, 'Expense Category Add', 'expense-category-add', '2021-04-18 23:19:44', NULL),
(374, 130, 'Expense Category Edit', 'expense-category-edit', '2021-04-18 23:19:44', NULL),
(375, 130, 'Expense Category Delete', 'expense-category-delete', '2021-04-18 23:19:44', NULL),
(376, 130, 'Expense Category Bulk Delete', 'expense-category-bulk-delete', '2021-04-18 23:19:44', NULL),
(377, 130, 'Expense Category Report', 'expense-category-report', '2021-04-18 23:19:44', NULL),
(378, 131, 'Truck Ledger Access', 'truck-ledger-access', '2021-04-18 23:20:02', NULL),
(379, 100, 'Expense Approve', 'expense-approve', '2021-04-22 11:11:09', NULL),
(380, 133, 'Balance Sheet Access', 'balance-sheet-access', '2021-04-24 09:17:07', NULL),
(381, 132, 'Others Labor Bill Access', 'others-labor-bill-access', '2021-04-24 09:18:03', NULL),
(382, 132, 'Others Labor Bill Add', 'others-labor-bill-add', '2021-04-24 09:18:03', NULL),
(383, 132, 'Others Labor Bill Edit', 'others-labor-bill-edit', '2021-04-24 09:18:03', NULL),
(384, 132, 'Others Labor Bill View', 'others-labor-bill-view', '2021-04-24 09:18:03', NULL),
(385, 132, 'Others Labor Bill Delete', 'others-labor-bill-delete', '2021-04-24 09:18:03', NULL),
(386, 132, 'Others Labor Bill Bulk Delete', 'others-labor-bill-bulk-delete', '2021-04-24 09:18:03', NULL),
(387, 132, 'Others Labor Bill Report', 'others-labor-bill-report', '2021-04-24 09:18:03', NULL),
(388, 132, 'Others Labor Bill Approve', 'others-labor-bill-approve', '2021-04-24 09:18:03', NULL),
(389, 136, 'Department Access', 'department-access', '2021-04-04 00:20:33', NULL),
(390, 136, 'Department Add', 'department-add', '2021-04-04 00:20:33', NULL),
(391, 136, 'Department Edit', 'department-edit', '2021-04-04 00:20:33', NULL),
(392, 136, 'Department Delete', 'department-delete', '2021-04-04 00:20:33', NULL),
(393, 136, 'Department Bulk Delete', 'department-bulk-delete', '2021-04-04 00:20:33', NULL),
(394, 136, 'Department Report', 'department-report', '2021-04-04 00:20:33', NULL),
(395, 137, 'Division Access', 'division-access', '2021-04-04 00:21:27', NULL),
(396, 137, 'Division Add', 'division-add', '2021-04-04 00:21:27', NULL),
(397, 137, 'Division Edit', 'division-edit', '2021-04-04 00:21:27', NULL),
(398, 137, 'Division Delete', 'division-delete', '2021-04-04 00:21:27', NULL),
(399, 137, 'Division Bulk Delete', 'division-bulk-delete', '2021-04-04 00:21:27', NULL),
(400, 137, 'Division Report', 'division-report', '2021-04-04 00:21:27', NULL),
(401, 138, 'Designation Access', 'designation-access', '2021-04-04 00:22:20', NULL),
(402, 138, 'Designation Add', 'designation-add', '2021-04-04 00:22:20', NULL),
(403, 138, 'Designation Edit', 'designation-edit', '2021-04-04 00:22:20', NULL),
(404, 138, 'Designation Delete', 'designation-delete', '2021-04-04 00:22:20', NULL),
(405, 138, 'Designation Bulk Delete', 'designation-bulk-delete', '2021-04-04 00:22:20', NULL),
(406, 138, 'Designation Report', 'designation-report', '2021-04-04 00:22:20', NULL),
(407, 140, 'Employee Access', 'employee-access', '2021-04-04 00:23:18', NULL),
(408, 140, 'Employee Add', 'employee-add', '2021-04-04 00:23:18', NULL),
(409, 140, 'Employee Edit', 'employee-edit', '2021-04-04 00:23:18', NULL),
(410, 140, 'Employee View', 'employee-view', '2021-04-04 00:23:18', NULL),
(411, 140, 'Employee Delete', 'employee-delete', '2021-04-04 00:23:18', NULL),
(412, 140, 'Employee Bulk Delete', 'employee-bulk-delete', '2021-04-04 00:23:18', NULL),
(413, 140, 'Employee Report', 'employee-report', '2021-04-04 00:23:18', NULL),
(414, 142, 'Attendance Access', 'attendance-access', '2021-04-04 00:24:19', NULL),
(415, 142, 'Attendance Add', 'attendance-add', '2021-04-04 00:24:19', NULL),
(416, 142, 'Attendance Edit', 'attendance-edit', '2021-04-04 00:24:19', NULL),
(417, 142, 'Attendance Delete', 'attendance-delete', '2021-04-04 00:24:19', NULL),
(418, 142, 'Attendance Bulk Delete', 'attendance-bulk-delete', '2021-04-04 00:24:19', NULL),
(419, 142, 'Attendance Report', 'attendance-report', '2021-04-04 00:24:19', NULL),
(420, 143, 'Attendance Report Access', 'attendance-report-access', '2021-04-04 00:24:43', NULL),
(421, 151, 'Weekly Holiday Access', 'weekly-holiday-access', '2021-04-04 00:26:00', NULL),
(422, 151, 'Weekly Holiday Add', 'weekly-holiday-add', '2021-04-04 00:26:00', NULL),
(423, 151, 'Weekly Holiday Edit', 'weekly-holiday-edit', '2021-04-04 00:26:00', NULL),
(424, 151, 'Weekly Holiday Delete', 'weekly-holiday-delete', '2021-04-04 00:26:00', NULL),
(425, 151, 'Weekly Holiday Bulk Delete', 'weekly-holiday-bulk-delete', '2021-04-04 00:26:00', NULL),
(426, 151, 'Weekly Holiday Report', 'weekly-holiday-report', '2021-04-04 00:26:00', NULL),
(427, 152, 'Holiday Access', 'holiday-access', '2021-04-04 00:26:54', NULL),
(428, 152, 'Holiday Add', 'holiday-add', '2021-04-04 00:26:54', NULL),
(429, 152, 'Holiday Edit', 'holiday-edit', '2021-04-04 00:26:54', NULL),
(430, 152, 'Holiday Delete', 'holiday-delete', '2021-04-04 00:26:54', NULL),
(431, 152, 'Holiday Bulk Delete', 'holiday-bulk-delete', '2021-04-04 00:26:54', NULL),
(432, 152, 'Holiday Report', 'holiday-report', '2021-04-04 00:26:54', NULL),
(433, 153, 'Leave Type Access', 'leave-type-access', '2021-04-04 00:27:42', NULL),
(434, 153, 'Leave Type Add', 'leave-type-add', '2021-04-04 00:27:42', NULL),
(435, 153, 'Leave Type Edit', 'leave-type-edit', '2021-04-04 00:27:42', NULL),
(436, 153, 'Leave Type Delete', 'leave-type-delete', '2021-04-04 00:27:42', NULL),
(437, 153, 'Leave Type Bulk Delete', 'leave-type-bulk-delete', '2021-04-04 00:27:42', NULL),
(438, 153, 'Leave Type Report', 'leave-type-report', '2021-04-04 00:27:42', NULL),
(439, 154, 'Leave Application Access', 'leave-application-access', '2021-04-04 00:29:45', NULL),
(440, 154, 'Leave Application Add', 'leave-application-add', '2021-04-04 00:29:45', NULL),
(441, 154, 'Leave Application Edit', 'leave-application-edit', '2021-04-04 00:29:45', NULL),
(442, 154, 'Leave Application Delete', 'leave-application-delete', '2021-04-04 00:29:45', NULL),
(443, 154, 'Leave Application Bulk Delete', 'leave-application-bulk-delete', '2021-04-04 00:29:45', NULL),
(444, 154, 'Leave Application Report', 'leave-application-report', '2021-04-04 00:29:45', NULL),
(445, 154, 'Leave Application Approve', 'leave-application-approve', '2021-04-04 00:29:45', NULL),
(446, 145, 'Benifits Access', 'benifits-access', '2021-04-04 00:30:33', NULL),
(447, 145, 'Benifits Add', 'benifits-add', '2021-04-04 00:30:33', NULL),
(448, 145, 'Benifits Edit', 'benifits-edit', '2021-04-04 00:30:33', NULL),
(449, 145, 'Benifits Delete', 'benifits-delete', '2021-04-04 00:30:33', NULL),
(450, 145, 'Benifits Bulk Delete', 'benifits-bulk-delete', '2021-04-04 00:30:33', NULL),
(451, 145, 'Benifits Report', 'benifits-report', '2021-04-04 00:30:33', NULL),
(452, 147, 'Salary Setup Access', 'salary-setup-access', '2021-04-04 00:31:37', NULL),
(453, 147, 'Salary Setup Add', 'salary-setup-add', '2021-04-04 00:31:37', NULL),
(454, 147, 'Salary Setup Edit', 'salary-setup-edit', '2021-04-04 00:31:37', NULL),
(455, 147, 'Salary Setup View', 'salary-setup-view', '2021-04-04 00:31:37', NULL),
(456, 147, 'Salary Setup Delete', 'salary-setup-delete', '2021-04-04 00:31:37', NULL),
(457, 147, 'Salary Setup Bulk Delete', 'salary-setup-bulk-delete', '2021-04-04 00:31:37', NULL),
(458, 147, 'Salary Setup Report', 'salary-setup-report', '2021-04-04 00:31:37', NULL),
(459, 148, 'Salary Generate Access', 'salary-generate-access', '2021-04-04 00:35:39', NULL),
(460, 148, 'Salary Generate Add', 'salary-generate-add', '2021-04-04 00:35:39', NULL),
(461, 148, 'Salary Generate Delete', 'salary-generate-delete', '2021-04-04 00:35:39', NULL),
(462, 148, 'Salary Generate Bulk Delete', 'salary-generate-bulk-delete', '2021-04-04 00:35:39', NULL),
(463, 148, 'Salary Generate Report', 'salary-generate-report', '2021-04-04 00:35:39', NULL),
(467, 155, 'Shift Access', 'shift-access', '2021-04-26 07:14:07', NULL),
(468, 155, 'Shift Add', 'shift-add', '2021-04-26 07:14:07', NULL),
(469, 155, 'Shift Edit', 'shift-edit', '2021-04-26 07:14:07', NULL),
(470, 155, 'Shift Delete', 'shift-delete', '2021-04-26 07:14:07', NULL),
(471, 155, 'Shift Bulk Delete', 'shift-bulk-delete', '2021-04-26 07:14:07', NULL),
(472, 155, 'Shift Report', 'shift-report', '2021-04-26 07:14:07', NULL),
(473, 155, 'Shift Manage Access', 'shift-manage-access', '2021-04-26 07:14:07', NULL),
(474, 155, 'Shift Manage Add', 'shift-manage-add', '2021-04-26 07:14:07', NULL),
(475, 155, 'Shift Manage Edit', 'shift-manage-edit', '2021-04-26 07:14:07', NULL),
(476, 155, 'Shift Manage Delete', 'shift-manage-delete', '2021-04-26 07:14:07', NULL),
(477, 155, 'Shift Manage Bulk Delete', 'shift-manage-bulk-delete', '2021-04-26 07:14:07', NULL),
(478, 155, 'Shift Manage Report', 'shift-manage-report', '2021-04-26 07:14:07', NULL),
(479, 155, 'Employee Shift Change', 'employee-shift-change', '2021-04-26 23:24:58', NULL),
(480, 157, 'Asset Type Access', 'asset-type-access', '2021-05-02 22:29:52', NULL),
(481, 157, 'Asset Type Add', 'asset-type-add', '2021-05-02 22:29:52', NULL),
(482, 157, 'Asset Type Edit', 'asset-type-edit', '2021-05-02 22:29:52', NULL),
(483, 157, 'Asset Type Delete', 'asset-type-delete', '2021-05-02 22:29:52', NULL),
(484, 157, 'Asset Type Bulk Delete', 'asset-type-bulk-delete', '2021-05-02 22:29:52', NULL),
(485, 157, 'Asset Type Report', 'asset-type-report', '2021-05-02 22:29:52', NULL),
(486, 158, 'Asset Access', 'asset-access', '2021-05-02 22:31:06', NULL),
(487, 158, 'Asset Add', 'asset-add', '2021-05-02 22:31:06', NULL),
(488, 158, 'Asset Edit', 'asset-edit', '2021-05-02 22:31:06', NULL),
(489, 158, 'Asset View', 'asset-view', '2021-05-02 22:31:06', NULL),
(490, 158, 'Asset Delete', 'asset-delete', '2021-05-02 22:31:06', NULL),
(491, 158, 'Asset Bulk Delete', 'asset-bulk-delete', '2021-05-02 22:31:06', NULL),
(492, 158, 'Asset Report', 'asset-report', '2021-05-02 22:31:06', NULL),
(493, 159, 'Material Stock Ledger Access', 'material-stock-ledger-access', '2021-05-11 12:11:25', NULL),
(494, 160, 'Finished Goods Stock Ledger Access', 'finished-goods-stock-ledger-access', '2021-05-11 12:12:37', '2021-05-11 14:07:33'),
(495, 43, 'COA Add', 'coa-add', '2021-05-19 09:43:48', NULL),
(496, 43, 'COA Edit', 'coa-edit', '2021-05-19 09:43:48', NULL),
(497, 43, 'COA Delete', 'coa-delete', '2021-05-19 09:43:48', NULL),
(498, 163, 'Personal Loan Person Access', 'personal-loan-person-access', '2021-07-24 06:10:59', NULL),
(499, 163, 'Personal Loan Person Add', 'personal-loan-person-add', '2021-07-24 06:10:59', NULL),
(500, 163, 'Personal Loan Person Edit', 'personal-loan-person-edit', '2021-07-24 06:10:59', NULL),
(501, 163, 'Personal Loan Person Delete', 'personal-loan-person-delete', '2021-07-24 06:10:59', NULL),
(502, 163, 'Personal Loan Person Bulk Delete', 'personal-loan-person-bulk-delete', '2021-07-24 06:10:59', NULL),
(503, 164, 'Personal Loan Access', 'personal-loan-access', '2021-07-24 06:11:27', NULL),
(504, 164, 'Personal Loan Add', 'personal-loan-add', '2021-07-24 06:11:27', NULL),
(505, 164, 'Personal Loan Edit', 'personal-loan-edit', '2021-07-24 06:11:27', NULL),
(506, 164, 'Personal Loan Delete', 'personal-loan-delete', '2021-07-24 06:11:27', NULL),
(507, 164, 'Personal Loan Bulk Delete', 'personal-loan-bulk-delete', '2021-07-24 06:11:27', NULL),
(508, 165, 'Personal Loan Installment Access', 'personal-loan-installment-access', '2021-07-24 06:12:55', NULL),
(509, 165, 'Personal Loan Installment Add', 'personal-loan-installment-add', '2021-07-24 06:12:55', NULL),
(510, 165, 'Personal Loan Installment Edit', 'personal-loan-installment-edit', '2021-07-24 06:12:55', NULL),
(511, 165, 'Personal Loan Installment Delete', 'personal-loan-installment-delete', '2021-07-24 06:12:55', NULL),
(512, 165, 'Personal Loan Installment Bulk Delete', 'personal-loan-installment-bulk-delete', '2021-07-24 06:12:55', NULL),
(513, 167, 'Official Loan Access', 'official-loan-access', '2021-07-24 06:13:31', NULL),
(514, 167, 'Official Loan Add', 'official-loan-add', '2021-07-24 06:13:31', NULL),
(515, 167, 'Official Loan Edit', 'official-loan-edit', '2021-07-24 06:13:31', NULL),
(516, 167, 'Official Loan Delete', 'official-loan-delete', '2021-07-24 06:13:31', NULL),
(517, 167, 'Official Loan Bulk Delete', 'official-loan-bulk-delete', '2021-07-24 06:13:31', NULL),
(518, 168, 'Official Loan Installment Access', 'official-loan-installment-access', '2021-07-24 06:13:58', NULL),
(519, 168, 'Official Loan Installment Add', 'official-loan-installment-add', '2021-07-24 06:13:58', NULL),
(520, 168, 'Official Loan Installment Edit', 'official-loan-installment-edit', '2021-07-24 06:13:58', NULL),
(521, 168, 'Official Loan Installment Delete', 'official-loan-installment-delete', '2021-07-24 06:13:58', NULL),
(522, 168, 'Official Loan Installment Bulk Delete', 'official-loan-installment-bulk-delete', '2021-07-24 06:13:58', NULL),
(523, 170, 'Loan Report Access', 'loan-report-access', '2021-07-24 06:14:16', NULL),
(524, 172, 'Labor Head Access', 'labor-head-access', '2022-03-03 00:50:47', NULL),
(525, 172, 'Labor Head Add', 'labor-head-add', '2022-03-03 00:50:47', NULL),
(526, 172, 'Labor Head Edit', 'labor-head-edit', '2022-03-03 00:50:47', NULL),
(527, 172, 'Labor Head Delete', 'labor-head-delete', '2022-03-03 00:50:47', NULL),
(528, 172, 'Labor Head Bulk Delete', 'labor-head-bulk-delete', '2022-03-03 00:50:47', NULL),
(529, 173, 'Labor Head Ledger Access', 'labor-head-ledger-access', '2022-03-03 00:51:09', NULL),
(530, 174, 'Tenant Access', 'tenant-access', '2022-03-08 02:45:15', NULL),
(531, 174, 'Tenant Add', 'tenant-add', '2022-03-08 02:45:15', NULL),
(532, 174, 'Tenant Edit', 'tenant-edit', '2022-03-08 02:45:15', NULL),
(533, 174, 'Tenant Delete', 'tenant-delete', '2022-03-08 02:45:15', NULL),
(534, 174, 'Tenant Bulk Delete', 'tenant-bulk-delete', '2022-03-08 02:45:15', NULL),
(535, 176, 'Tenant Ledger Access', 'tenant-ledger-access', '2022-03-08 05:35:45', NULL),
(542, 177, 'Tenant Production Access', 'tenant-production-access', '2022-03-09 23:28:18', NULL),
(543, 177, 'Tenant Production Add', 'tenant-production-add', '2022-03-09 23:28:18', NULL),
(544, 177, 'Tenant Production Edit', 'tenant-production-edit', '2022-03-09 23:28:18', NULL),
(545, 177, 'Tenant Production Delete', 'tenant-production-delete', '2022-03-09 23:28:18', NULL),
(546, 177, 'Tenant Production Bulk Delete', 'tenant-production-bulk-delete', '2022-03-09 23:28:18', NULL),
(547, 177, 'Tenant Production View', 'tenant-production-view', '2022-03-09 23:28:18', NULL),
(553, 179, 'Tenant Production Product Delivery', 'tenant-production-product-delivery', '2022-03-12 02:19:53', NULL),
(554, 179, 'Tenant Production Product Delivery Details', 'tenant-production-product-delivery-details', '2022-03-13 22:13:36', NULL),
(555, 183, 'Income Statement Report', 'income-statement-report-access', '2022-03-20 02:47:23', '2022-03-20 05:22:26');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(2, 58, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(3, 59, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(4, 60, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(5, 61, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(6, 62, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(7, 63, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(8, 64, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(9, 65, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(10, 66, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(11, 67, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(12, 68, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(13, 69, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(14, 70, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(15, 71, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(16, 216, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(17, 217, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(18, 218, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(19, 219, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(20, 220, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(21, 72, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(22, 232, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(23, 233, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(24, 234, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(25, 235, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(26, 236, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(27, 237, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(28, 73, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(29, 74, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(30, 75, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(31, 76, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(32, 77, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(33, 78, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(34, 79, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(35, 80, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(36, 81, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(37, 82, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(38, 83, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(39, 84, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(40, 85, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(41, 86, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(42, 221, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(43, 87, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(44, 88, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(45, 89, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(46, 90, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(47, 91, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(48, 92, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(49, 93, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(50, 94, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(51, 95, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(52, 222, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(53, 96, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(54, 97, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(55, 98, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(56, 99, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(57, 100, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(58, 101, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(59, 102, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(60, 103, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(61, 104, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(62, 105, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(63, 106, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(64, 107, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(65, 108, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(66, 109, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(67, 110, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(68, 111, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(69, 112, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(70, 113, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(71, 114, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(72, 115, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(73, 116, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(74, 117, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(75, 118, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(76, 119, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(77, 120, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(78, 121, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(79, 122, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(80, 123, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(81, 124, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(82, 125, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(83, 126, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(84, 127, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(85, 128, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(86, 129, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(87, 130, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(88, 131, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(89, 223, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(90, 132, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(91, 133, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(92, 134, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(93, 135, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(94, 136, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(95, 137, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(96, 226, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(97, 227, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(98, 228, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(99, 229, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(100, 230, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(101, 231, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(102, 138, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(103, 139, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(104, 140, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(105, 141, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(106, 142, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(107, 143, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(108, 144, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(109, 145, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(110, 146, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(111, 147, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(112, 148, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(113, 149, 2, '2021-04-03 20:57:49', '2021-04-03 20:57:49'),
(114, 150, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(115, 151, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(116, 224, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(117, 238, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(118, 239, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(119, 240, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(120, 241, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(121, 152, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(122, 153, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(123, 154, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(124, 155, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(125, 156, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(126, 157, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(127, 158, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(128, 225, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(129, 242, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(130, 243, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(131, 244, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(132, 245, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(133, 159, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(134, 160, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(135, 161, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(136, 162, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(137, 163, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(138, 164, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(139, 165, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(140, 166, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(141, 167, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(142, 168, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(143, 169, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(144, 170, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(145, 171, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(146, 172, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(147, 173, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(148, 174, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(149, 175, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(150, 176, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(151, 177, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(152, 178, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(153, 179, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(154, 180, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(155, 252, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(156, 253, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(157, 254, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(158, 255, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(159, 256, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(160, 257, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(161, 258, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(162, 259, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(163, 260, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(164, 261, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(165, 262, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(166, 263, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(167, 264, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(168, 181, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(169, 182, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(170, 183, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(171, 184, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(172, 185, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(173, 186, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(174, 187, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(175, 188, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(176, 189, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(177, 190, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(178, 191, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(179, 192, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(180, 193, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(181, 194, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(182, 195, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(183, 196, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(184, 197, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(185, 246, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(186, 247, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(187, 198, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(188, 248, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(189, 199, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(190, 200, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(191, 201, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(192, 202, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(193, 249, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(194, 250, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(195, 251, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(196, 203, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(197, 2, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(198, 3, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(199, 4, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(200, 5, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(201, 6, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(202, 7, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(203, 8, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(204, 9, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(205, 10, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(206, 11, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(207, 12, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(208, 13, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(209, 14, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(210, 15, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(211, 39, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(212, 33, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(213, 34, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(214, 35, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(215, 36, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(216, 37, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(217, 38, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(218, 40, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(219, 41, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(220, 42, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(221, 43, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(222, 44, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(223, 45, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(224, 204, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(225, 205, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(226, 206, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(227, 207, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(228, 208, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(229, 209, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(230, 210, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(231, 211, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(232, 212, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(233, 213, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(234, 214, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(235, 215, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(236, 46, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(237, 47, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(238, 48, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(239, 49, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(240, 50, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(241, 51, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(242, 52, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(243, 53, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(244, 54, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(245, 55, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(246, 56, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(247, 57, 2, '2021-04-03 20:57:50', '2021-04-03 20:57:50'),
(248, 357, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(249, 349, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(250, 350, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(251, 351, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(252, 352, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(253, 353, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(254, 354, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(255, 355, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(256, 356, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(257, 343, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(258, 344, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(259, 345, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(260, 346, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(261, 347, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(262, 348, 2, '2021-04-08 18:35:36', '2021-04-08 18:35:36'),
(263, 58, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(264, 59, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(265, 60, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(266, 61, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(267, 62, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(268, 63, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(269, 64, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(270, 65, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(271, 66, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(272, 67, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(273, 68, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(274, 69, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(275, 70, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(276, 71, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(277, 216, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(278, 217, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(279, 218, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(280, 219, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(281, 220, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(282, 72, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(283, 112, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(284, 113, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(285, 114, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(286, 115, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(287, 116, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(288, 117, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(289, 118, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(290, 119, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(291, 120, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(292, 121, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(293, 122, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(294, 123, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(295, 124, 3, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(296, 358, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(297, 359, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(298, 360, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(299, 361, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(300, 362, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(301, 363, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(302, 364, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(303, 365, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(304, 366, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(305, 367, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(306, 368, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(307, 369, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(308, 370, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(309, 371, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(310, 372, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(311, 373, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(312, 374, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(313, 375, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(314, 376, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(315, 377, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(316, 378, 2, '2021-04-19 02:00:16', '2021-04-19 02:00:16'),
(317, 1, 3, '2021-04-19 02:02:02', '2021-04-19 02:02:02'),
(318, 381, 2, '2021-04-24 09:18:52', '2021-04-24 09:18:52'),
(319, 382, 2, '2021-04-24 09:18:52', '2021-04-24 09:18:52'),
(320, 383, 2, '2021-04-24 09:18:52', '2021-04-24 09:18:52'),
(321, 384, 2, '2021-04-24 09:18:52', '2021-04-24 09:18:52'),
(322, 385, 2, '2021-04-24 09:18:52', '2021-04-24 09:18:52'),
(323, 386, 2, '2021-04-24 09:18:52', '2021-04-24 09:18:52'),
(324, 387, 2, '2021-04-24 09:18:52', '2021-04-24 09:18:52'),
(325, 388, 2, '2021-04-24 09:18:52', '2021-04-24 09:18:52'),
(326, 380, 2, '2021-04-24 09:18:52', '2021-04-24 09:18:52'),
(327, 379, 2, '2021-04-24 09:18:52', '2021-04-24 09:18:52'),
(328, 480, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(329, 481, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(330, 482, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(331, 483, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(332, 484, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(333, 485, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(334, 486, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(335, 487, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(336, 488, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(337, 489, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(338, 490, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(339, 491, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(340, 492, 2, '2021-05-03 09:27:12', '2021-05-03 09:27:12'),
(341, 389, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(342, 390, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(343, 391, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(344, 392, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(345, 393, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(346, 394, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(347, 395, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(348, 396, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(349, 397, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(350, 398, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(351, 399, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(352, 400, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(353, 401, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(354, 402, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(355, 403, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(356, 404, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(357, 405, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(358, 406, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(359, 407, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(360, 408, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(361, 409, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(362, 410, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(363, 411, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(364, 412, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(365, 413, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(366, 467, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(367, 468, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(368, 469, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(369, 470, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(370, 471, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(371, 472, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(372, 473, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(373, 474, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(374, 475, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(375, 476, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(376, 477, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(377, 478, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(378, 479, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(379, 414, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(380, 415, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(381, 416, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(382, 417, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(383, 418, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(384, 419, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(385, 420, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(386, 421, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(387, 422, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(388, 423, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(389, 424, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(390, 425, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(391, 426, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(392, 427, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(393, 428, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(394, 429, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(395, 430, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(396, 431, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(397, 432, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(398, 433, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(399, 434, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(400, 435, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(401, 436, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(402, 437, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(403, 438, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(404, 439, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(405, 440, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(406, 441, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(407, 442, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(408, 443, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(409, 444, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(410, 445, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(411, 446, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(412, 447, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(413, 448, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(414, 449, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(415, 450, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(416, 451, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(417, 452, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(418, 453, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(419, 454, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(420, 455, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(421, 456, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(422, 457, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(423, 458, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(424, 459, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(425, 460, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(426, 461, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(427, 462, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(428, 463, 2, '2021-05-04 13:08:18', '2021-05-04 13:08:18'),
(429, 1, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(430, 58, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(431, 59, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(432, 60, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(433, 61, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(434, 64, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(435, 65, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(436, 66, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(437, 67, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(438, 68, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(439, 71, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(440, 216, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(441, 217, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(442, 218, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(443, 72, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(444, 232, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(445, 233, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(446, 234, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(447, 237, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(448, 73, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(449, 74, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(450, 75, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(451, 76, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(452, 79, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(453, 80, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(454, 81, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(455, 82, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(456, 83, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(457, 86, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(458, 87, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(459, 357, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(460, 88, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(461, 89, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(462, 90, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(463, 92, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(464, 95, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(465, 349, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(466, 350, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(467, 352, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(468, 355, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(469, 96, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(470, 97, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(471, 99, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(472, 102, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(473, 112, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(474, 113, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(475, 116, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(476, 117, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(477, 118, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(478, 119, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(479, 120, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(480, 124, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(481, 360, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(482, 361, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(483, 365, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(484, 366, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(485, 367, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(486, 371, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(487, 372, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(488, 373, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(489, 377, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(490, 125, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(491, 126, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(492, 128, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(493, 131, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(494, 378, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(495, 132, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(496, 133, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(497, 134, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(498, 137, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(499, 226, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(500, 227, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(501, 228, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(502, 231, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(503, 138, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(504, 139, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(505, 140, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(506, 141, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(507, 144, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(508, 145, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(509, 146, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(510, 147, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(511, 148, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(512, 151, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(513, 238, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(514, 239, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(515, 240, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(516, 152, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(517, 153, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(518, 154, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(519, 155, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(520, 158, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(521, 225, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(522, 242, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(523, 243, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(524, 244, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(525, 381, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(526, 382, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(527, 383, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(528, 384, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(529, 387, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(530, 388, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(531, 159, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(532, 160, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(533, 161, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(534, 162, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(535, 163, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(536, 164, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(537, 165, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(538, 166, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(539, 167, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(540, 168, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(541, 169, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(542, 170, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(543, 171, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(544, 172, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(545, 173, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(546, 174, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(547, 175, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(548, 176, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(549, 177, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(550, 178, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(551, 179, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(552, 180, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(553, 380, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(554, 389, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(555, 390, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(556, 391, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(557, 394, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(558, 395, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(559, 396, 4, '2021-05-04 14:20:38', '2021-05-04 14:20:38'),
(560, 397, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(561, 398, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(562, 399, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(563, 400, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(564, 401, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(565, 402, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(566, 403, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(567, 404, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(568, 405, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(569, 406, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(570, 407, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(571, 408, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(572, 409, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(573, 410, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(574, 411, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(575, 412, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(576, 413, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(577, 467, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(578, 468, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(579, 469, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(580, 470, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(581, 471, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(582, 472, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(583, 473, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(584, 474, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(585, 475, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(586, 476, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(587, 477, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(588, 478, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(589, 479, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(590, 414, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(591, 415, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(592, 416, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(593, 419, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(594, 420, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(595, 421, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(596, 422, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(597, 423, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(598, 426, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(599, 427, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(600, 428, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(601, 429, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(602, 430, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(603, 431, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(604, 432, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(605, 433, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(606, 434, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(607, 435, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(608, 436, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(609, 437, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(610, 438, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(611, 439, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(612, 440, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(613, 441, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(614, 442, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(615, 443, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(616, 444, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(617, 445, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(618, 446, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(619, 447, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(620, 448, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(621, 451, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(622, 452, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(623, 453, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(624, 454, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(625, 455, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(626, 458, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(627, 459, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(628, 460, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(629, 463, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(630, 252, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(631, 253, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(632, 254, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(633, 257, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(634, 258, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(635, 259, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(636, 260, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(637, 263, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(638, 379, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(639, 264, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(640, 181, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(641, 182, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(642, 183, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(643, 185, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(644, 186, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(645, 187, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(646, 188, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(647, 189, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(648, 190, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(649, 193, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(650, 194, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(651, 195, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(652, 480, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(653, 481, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(654, 482, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(655, 485, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(656, 486, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(657, 487, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(658, 488, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(659, 489, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(660, 492, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(661, 196, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(662, 197, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(663, 246, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(664, 247, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(665, 198, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(666, 248, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(667, 199, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(668, 200, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(669, 201, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(670, 202, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(671, 249, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(672, 250, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(673, 251, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(674, 203, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(675, 2, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(676, 3, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(677, 4, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(678, 5, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(679, 8, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(680, 9, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(681, 10, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(682, 11, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(683, 12, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(684, 15, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(685, 39, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(686, 33, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(687, 34, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(688, 35, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(689, 36, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(690, 37, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(691, 38, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(692, 40, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(693, 41, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(694, 42, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(695, 43, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(696, 44, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(697, 45, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(698, 204, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(699, 205, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(700, 206, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(701, 207, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(702, 208, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(703, 209, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(704, 210, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(705, 211, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(706, 212, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(707, 213, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(708, 214, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(709, 215, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(710, 343, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(711, 344, 4, '2021-05-04 14:20:39', '2021-05-04 14:20:39'),
(712, 345, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(713, 346, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(714, 347, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(715, 348, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(716, 46, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(717, 47, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(718, 48, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(719, 49, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(720, 50, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(721, 51, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(722, 52, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(723, 53, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(724, 54, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(725, 55, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(726, 56, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(727, 57, 4, '2021-05-04 14:20:40', '2021-05-04 14:20:40'),
(728, 98, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(729, 103, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(730, 104, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(731, 105, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(732, 106, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(733, 107, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(734, 108, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(735, 111, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(736, 358, 4, '2021-05-04 14:39:35', '2021-05-04 14:39:35'),
(737, 493, 2, '2021-05-11 13:21:31', '2021-05-11 13:21:31'),
(738, 494, 2, '2021-05-11 14:32:05', '2021-05-11 14:32:05'),
(739, 495, 2, '2021-05-19 09:46:24', '2021-05-19 09:46:24'),
(740, 496, 2, '2021-05-19 09:46:24', '2021-05-19 09:46:24'),
(741, 497, 2, '2021-05-19 09:46:24', '2021-05-19 09:46:24'),
(742, 498, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(743, 499, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(744, 500, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(745, 501, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(746, 502, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(747, 503, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(748, 504, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(749, 505, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(750, 506, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(751, 507, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(752, 508, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(753, 509, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(754, 510, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(755, 511, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(756, 512, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(757, 513, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(758, 514, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(759, 515, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(760, 516, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(761, 517, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(762, 518, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(763, 519, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(764, 520, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(765, 521, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(766, 522, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(767, 523, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(768, 17, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(769, 18, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(770, 19, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(771, 20, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(772, 21, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(773, 22, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(774, 23, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(775, 24, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(776, 25, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(777, 26, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(778, 27, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(779, 28, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(780, 29, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(781, 30, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(782, 31, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39'),
(783, 32, 2, '2021-07-31 16:43:39', '2021-07-31 16:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `productions`
--

CREATE TABLE `productions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `serial_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `drier_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `weight` double DEFAULT NULL,
  `cost` double DEFAULT NULL,
  `total_cost` double DEFAULT NULL,
  `total_labor_cost` double DEFAULT NULL,
  `total_by_product_cost` double DEFAULT NULL,
  `net_production_cost` double DEFAULT NULL,
  `total_rice` double DEFAULT NULL,
  `cost_per_unit` double(8,2) DEFAULT NULL,
  `ratio` double(8,2) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `steam_mechanic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drier_mechanic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `milling_mechanic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weightlifter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Approved,2=Canceled,3=Pending',
  `status_change_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `production_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pending, 2=Processing,3=Packaging,4=Finished',
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `productions`
--

INSERT INTO `productions` (`id`, `serial_no`, `drier_no`, `warehouse_id`, `start_date`, `end_date`, `product_id`, `weight`, `cost`, `total_cost`, `total_labor_cost`, `total_by_product_cost`, `net_production_cost`, `total_rice`, `cost_per_unit`, `ratio`, `note`, `steam_mechanic`, `drier_mechanic`, `milling_mechanic`, `weightlifter`, `status`, `status_change_by`, `status_change_date`, `production_status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, '20220217105', '20220217106', 1, '2022-02-17', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'these input is going for test purpose', 'arman vai', 'arman vai', 'arman vai', 'arman vai', '1', 'Super Admin', '2022-03-02 00:00:00', '1', 'Super Admin', NULL, '2022-02-17 03:32:54', '2022-03-01 22:44:47'),
(2, '20220301408', '7854125', 10, '2022-03-01', NULL, 2, 50, 651240, 658740, NULL, 2500, 656240, 50, 13124.80, 1.25, 'এই উৎপাদন ইউনিট পরীক্ষার উদ্দেশ্যে যাচ্ছে', 'arman vai', 'arman vai', 'arman vai', 'arman vai', '1', 'Super Admin', '2022-03-01 00:00:00', '2', 'Super Admin', 'Super Admin', '2022-03-01 03:05:21', '2022-03-01 22:41:07'),
(3, '20220302645', '5', 1, '2022-03-02', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'যক্স', 'আস', 'গ', 'হগ', '1', 'Super Admin', '2022-03-02 00:00:00', '1', 'Super Admin', NULL, '2022-03-01 22:56:01', '2022-03-01 22:56:12'),
(4, '2022032166', '2', 10, '2022-03-21', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'এই ইনপুট গুলো টেস্ট এর জন্য ব্যবহার করা হইসে', 'শাকিল', 'শাকিল', 'শাকিল', 'শাকিল', '1', 'Super Admin', '2022-03-21 00:00:00', '1', 'Super Admin', NULL, '2022-03-21 04:39:39', '2022-03-21 04:40:01');

-- --------------------------------------------------------

--
-- Table structure for table `production_bag_costs`
--

CREATE TABLE `production_bag_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `production_id` bigint(20) UNSIGNED NOT NULL,
  `bag_id` bigint(20) UNSIGNED NOT NULL,
  `weight` double(8,2) NOT NULL COMMENT 'total piece',
  `rate` double(8,2) NOT NULL,
  `cost` double(8,2) NOT NULL,
  `labor_bill_rate_id` int(11) DEFAULT NULL,
  `labor_bill_rate` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_materials`
--

CREATE TABLE `production_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `production_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `bag_id` bigint(20) UNSIGNED NOT NULL,
  `total_bag` double(8,2) NOT NULL,
  `total_qty` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_materials`
--

INSERT INTO `production_materials` (`id`, `production_id`, `material_id`, `warehouse_id`, `unit_id`, `bag_id`, `total_bag`, `total_qty`, `created_at`, `updated_at`) VALUES
(1, 1, 18, 1, 1, 3, 50.00, 1250.00, '2022-02-17 03:32:54', '2022-02-17 03:32:54'),
(3, 2, 18, 1, 1, 2, 20.00, 1000.00, '2022-03-01 03:05:21', '2022-03-01 03:16:05'),
(4, 3, 18, 1, 1, 2, 10.00, 500.00, '2022-03-01 22:56:01', '2022-03-01 22:56:01'),
(5, 4, 3, 10, 1, 2, 70.00, 3500.00, '2022-03-21 04:39:39', '2022-03-21 04:39:39');

-- --------------------------------------------------------

--
-- Table structure for table `production_milling_costs`
--

CREATE TABLE `production_milling_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `production_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` double(8,2) NOT NULL,
  `rate` double(8,2) NOT NULL,
  `cost` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_milling_costs`
--

INSERT INTO `production_milling_costs` (`id`, `production_id`, `name`, `weight`, `rate`, `cost`, `created_at`, `updated_at`) VALUES
(1, 2, '4000', 100.00, 50.00, 5000.00, '2022-03-01 04:19:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `production_other_products`
--

CREATE TABLE `production_other_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `production_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `weight` double(8,2) NOT NULL,
  `rate` double(8,2) NOT NULL,
  `cost` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `production_other_products`
--

INSERT INTO `production_other_products` (`id`, `production_id`, `product_id`, `warehouse_id`, `weight`, `rate`, `cost`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 10, 50.00, 50.00, 2500.00, '2022-03-01 04:19:22', '2022-03-01 04:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `sale_unit_id` bigint(20) UNSIGNED NOT NULL,
  `cost` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` double DEFAULT NULL,
  `alert_quantity` double DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_method` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Exclusive, 2=Inclusive',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `has_opening_stock` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Yes, 2=No',
  `opening_stock_qty` double DEFAULT NULL,
  `opening_warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `code`, `unit_id`, `sale_unit_id`, `cost`, `price`, `qty`, `alert_quantity`, `image`, `tax_id`, `tax_method`, `status`, `has_opening_stock`, `opening_stock_qty`, `opening_warehouse_id`, `description`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'ইরি', 1, '90018282', 7, 7, '0', '1500', NULL, 5, NULL, NULL, '1', '1', '2', NULL, NULL, 'these input is going for test purpose', 'Super Admin', 'Super Admin', '2022-02-17 02:30:14', '2022-03-14 00:14:28'),
(2, 'মিনিকেট', 4, '15330163', 9, 9, '6587.4', '55', 100, 10, NULL, NULL, '1', '1', '2', NULL, NULL, 'এই ইনপুট পরীক্ষার উদ্দেশ্যে যাচ্ছে', 'Super Admin', 'Super Admin', '2022-03-01 00:59:10', '2022-03-14 00:13:47'),
(3, 'আউশ  চাউল', 1, '61237292', 7, 7, '0', '1200', NULL, 10, NULL, NULL, '1', '1', '2', NULL, NULL, NULL, 'Super Admin', 'Super Admin', '2022-03-14 00:12:45', '2022-03-14 00:48:18'),
(4, 'পালিশ ছিট', 2, '97606154', 7, 7, '0', '1500', NULL, 0, NULL, NULL, '1', '1', '2', NULL, NULL, NULL, 'Super Admin', NULL, '2022-03-14 01:56:46', '2022-03-14 01:56:46'),
(5, 'পালিশ', 2, '09097656', 7, 7, '0', '1500', NULL, 0, NULL, NULL, '1', '1', '2', NULL, NULL, NULL, 'Super Admin', NULL, '2022-03-14 01:57:07', '2022-03-14 01:57:07'),
(6, 'পালিশ খুদ', 2, '67079068', 7, 7, '0', '1500', NULL, 0, NULL, NULL, '1', '1', '2', NULL, NULL, NULL, 'Super Admin', NULL, '2022-03-14 01:57:25', '2022-03-14 01:57:25'),
(7, 'চৌকি ছিট', 2, '04835691', 7, 7, '0', '1500', NULL, 0, NULL, NULL, '1', '1', '2', NULL, NULL, NULL, 'Super Admin', NULL, '2022-03-14 01:57:42', '2022-03-14 01:57:42'),
(8, 'চৌকি', 2, '59313832', 7, 7, '0', '1500', NULL, 0, NULL, NULL, '1', '1', '2', NULL, NULL, NULL, 'Super Admin', NULL, '2022-03-14 01:57:58', '2022-03-14 01:57:58'),
(9, 'মাছি ছিট', 2, '06073112', 7, 7, '0', '1500', NULL, 0, NULL, NULL, '1', '1', '2', NULL, NULL, NULL, 'Super Admin', NULL, '2022-03-14 01:58:12', '2022-03-14 01:58:12'),
(10, 'মাছি', 2, '41502478', 7, 7, '0', '1500', NULL, 0, NULL, NULL, '1', '1', '2', NULL, NULL, NULL, 'Super Admin', NULL, '2022-03-14 01:58:29', '2022-03-14 01:58:29'),
(11, 'মোটা খুদ ছিট', 2, '70353740', 7, 7, '0', '1500', NULL, 0, NULL, NULL, '1', '1', '2', NULL, NULL, NULL, 'Super Admin', NULL, '2022-03-14 01:58:46', '2022-03-14 01:58:46'),
(12, 'মোটা খুদ', 2, '26879012', 7, 7, '0', '1500', NULL, 0, NULL, NULL, '1', '1', '2', NULL, NULL, NULL, 'Super Admin', NULL, '2022-03-14 01:59:00', '2022-03-14 01:59:00'),
(13, 'চাউল ছিট', 2, '10132494', 7, 7, '0', '1500', NULL, 0, NULL, NULL, '1', '1', '2', NULL, NULL, NULL, 'Super Admin', NULL, '2022-03-14 01:59:15', '2022-03-14 01:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `memo_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `item` double(8,2) NOT NULL,
  `total_qty` double(8,2) NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_labor_cost` double NOT NULL,
  `total_cost` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double NOT NULL,
  `purchase_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Received,2=Partial,3=Pending,4=Ordered',
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Paid,2=Partial,3=Due',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Cheque,3=Mobile',
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Approved,2=Canceled,3=Pending',
  `status_change_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date NOT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `memo_no`, `warehouse_id`, `supplier_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_labor_cost`, `total_cost`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `paid_amount`, `purchase_status`, `payment_status`, `payment_method`, `status`, `status_change_by`, `status_change_date`, `document`, `note`, `purchase_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, '00012', 1, 1, 1.00, 5.00, 0, 0, 0, 2500, 0, 0, 5, 100, 2595, 2595, '2', '1', '1', '1', 'Super Admin', '2022-02-17 00:00:00', 'png_red__1_-removebg-preview-(1)-303208.png', 'something', '2022-02-17', 'Super Admin', NULL, '2022-02-16 21:47:36', '2022-02-17 03:26:57'),
(2, '0085', 1, 1, 1.00, 1.00, 0, 0, 0, 500, 0, 0, NULL, NULL, 500, 0, '3', '3', '1', '1', 'Super Admin', '2022-02-17 00:00:00', 'png_red__1_-removebg-preview-(1)-802225.png', NULL, '2022-02-17', 'Super Admin', NULL, '2022-02-16 22:54:52', '2022-02-17 03:26:36'),
(3, '874596', 1, 1, 1.00, 5000.00, 0, 0, 0, 2583350, 0, 0, 50, 100, 2583400, 2583400, '1', '1', '1', '1', 'Super Admin', '2022-02-17 00:00:00', 'png_red__1_-removebg-preview-(1)-717294.png', 'these input is going for test purpose', '2022-02-17', 'Super Admin', NULL, '2022-02-17 03:30:32', '2022-02-17 03:30:44'),
(4, '85214785', 1, 1, 1.00, 8000.00, 0, 0, 0, 4133520, 0, 0, NULL, NULL, 4133520, 4133520, '1', '1', '1', '1', 'Super Admin', '2022-02-21 00:00:00', 'png_red__1_-removebg-preview-(1)-463770.png', NULL, '2022-02-21', 'Super Admin', NULL, '2022-02-21 00:25:06', '2022-02-21 00:25:22'),
(5, 'মেম 123456789', 1, 1, 1.00, 5.00, 0, 0, 0, 2583.45, 0, NULL, 5, 50, 2583.45, 2583.45, '1', '1', '1', '3', NULL, NULL, 'undraw_software_engineer_re_fyew-519452.png', 'ইসামিল', '2022-02-28', 'Super Admin', NULL, '2022-02-28 01:53:38', '2022-02-28 01:53:38'),
(6, '7895426', 1, 1, 1.00, 5.00, 0, 0, 0, 2500, 0, NULL, 5, 50, 2545, 2545, '1', '1', '1', '3', NULL, NULL, 'png_red__1_-removebg-preview-(1)-479241.png', 'ডেমো পারপাস তৈরি করা হইসে', '2022-02-28', 'Super Admin', NULL, '2022-02-28 02:21:38', '2022-02-28 02:21:38'),
(7, '874596325', 1, 2, 1.00, 5.00, 0, 0, 0, 2500, 0, NULL, 5, 100, 2595, 2595, '1', '1', '1', '1', 'Super Admin', '2022-03-01 00:00:00', 'png_red__1_-removebg-preview-(1)-565156.png', 'ডেমো পারপাস তৈরী করা হইসে', '2022-02-28', 'Super Admin', NULL, '2022-02-28 02:33:32', '2022-03-01 00:27:41'),
(8, '78954123658', 10, 3, 1.00, 5000.00, 0, 0, 0, 225000, 0, NULL, 50, 8452, 225795, 225795, '1', '1', '1', '1', 'Super Admin', '2022-03-01 00:00:00', 'undraw_software_engineer_re_fyew-586385.png', 'এই ইনপুট পরীক্ষার উদ্দেশ্যে যাচ্ছে এবং সফ্টওয়্যার সম্ভাব্যতা পরীক্ষা করে দেখুন', '2022-03-01', 'Super Admin', NULL, '2022-02-28 23:55:14', '2022-03-01 00:01:19'),
(9, '874521459', 10, 3, 1.00, 90000.00, 180000, 0, 0, 4022100, 0, NULL, 20, 5000, 4022580, 4022580, '1', '1', '1', '1', 'Super Admin', '2022-03-01 00:00:00', 'png_red__1_-removebg-preview-(1)-774703.png', 'এই ইনপুট পরীক্ষার উদ্দেশ্যে যাচ্ছে', '2022-03-01', 'Super Admin', NULL, '2022-03-01 00:30:08', '2022-03-01 00:30:26'),
(10, '676543', 10, 3, 1.00, 5000.00, 0, 0, 0, 100000, 0, NULL, 5000, NULL, 95000, 95000, '1', '1', '1', '1', 'Super Admin', '2022-03-20 00:00:00', '270041746_648841822913559_2883071397217442397_n-782272.jpg', NULL, '2022-03-20', 'Super Admin', NULL, '2022-03-20 03:23:32', '2022-03-20 06:01:57'),
(11, '465765', 10, 2, 1.00, 5000.00, 0, 0, 0, 1000000, 0, NULL, NULL, NULL, 1000000, 1000000, '1', '1', '1', '1', 'Super Admin', '2022-03-20 00:00:00', '270041746_648841822913559_2883071397217442397_n-431375.jpg', NULL, '2022-03-20', 'Super Admin', NULL, '2022-03-20 04:22:18', '2022-03-20 06:02:05'),
(12, '541236589', 10, 2, 1.00, 50000.00, 0, 0, 0, 1000000, 0, NULL, NULL, NULL, 1000000, 1000000, '1', '1', '1', '3', NULL, NULL, 'undraw_connected_world_wuay-278829.jpg', NULL, '2022-03-21', 'Super Admin', NULL, '2022-03-20 22:56:31', '2022-03-20 22:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_materials`
--

CREATE TABLE `purchase_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `received` double NOT NULL,
  `purchase_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `net_unit_cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_materials`
--

INSERT INTO `purchase_materials` (`id`, `purchase_id`, `material_id`, `qty`, `received`, `purchase_unit_id`, `net_unit_cost`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 18, 5, 5, 1, 500, 0, 0, 0, 2500, '2022-02-16 21:47:36', '2022-02-16 21:47:36'),
(2, 2, 18, 1, 0, 1, 500, 0, 0, 0, 500, '2022-02-16 22:54:52', '2022-02-16 22:54:52'),
(3, 3, 18, 5000, 5000, 1, 516.67, 0, 0, 0, 2583350, '2022-02-17 03:30:32', '2022-02-17 03:30:32'),
(4, 4, 18, 8000, 8000, 1, 516.69, 0, 0, 0, 4133520, '2022-02-21 00:25:06', '2022-02-21 00:25:06'),
(5, 5, 18, 5, 5, 1, 516.69, 0, 0, 0, 2583.45, '2022-02-28 01:53:38', '2022-02-28 01:53:38'),
(6, 6, 19, 5, 5, 14, 500, 0, 0, 0, 2500, '2022-02-28 02:21:38', '2022-02-28 02:21:38'),
(7, 7, 19, 5, 5, 14, 500, 0, 0, 0, 2500, '2022-02-28 02:33:32', '2022-02-28 02:33:32'),
(8, 8, 20, 5000, 5000, 14, 45, 0, 0, 0, 225000, '2022-02-28 23:55:15', '2022-02-28 23:55:15'),
(9, 9, 20, 90000, 90000, 14, 44.69, 180000, 0, 0, 4022100, '2022-03-01 00:30:08', '2022-03-01 00:30:08'),
(10, 10, 3, 5000, 5000, 1, 20, 0, 0, 0, 100000, '2022-03-20 03:23:32', '2022-03-20 03:23:32'),
(11, 11, 3, 5000, 5000, 1, 200, 0, 0, 0, 1000000, '2022-03-20 04:22:18', '2022-03-20 04:22:18'),
(12, 12, 2, 50000, 50000, 1, 20, 0, 0, 0, 1000000, '2022-03-20 22:56:31', '2022-03-20 22:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_debit_transaction_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Cheque,3=Mobile',
  `cheque_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_payments`
--

INSERT INTO `purchase_payments` (`id`, `purchase_id`, `account_id`, `transaction_id`, `supplier_debit_transaction_id`, `amount`, `payment_method`, `cheque_no`, `payment_note`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 1, 23, 7, 6, 2595, '1', '', NULL, 'Super Admin', NULL, '2022-02-16 21:47:36', '2022-02-16 21:47:36'),
(2, 3, 23, 15, 14, 2583400, '1', '', NULL, 'Super Admin', NULL, '2022-02-17 03:30:32', '2022-02-17 03:30:32'),
(3, 4, 23, 22, 21, 4133520, '1', '', NULL, 'Super Admin', NULL, '2022-02-21 00:25:06', '2022-02-21 00:25:06'),
(4, 5, 23, 46, 45, 2583.45, '1', '', NULL, 'Super Admin', NULL, '2022-02-28 01:53:38', '2022-02-28 01:53:38'),
(5, 6, 23, 51, 50, 2545, '1', '', NULL, 'Super Admin', NULL, '2022-02-28 02:21:38', '2022-02-28 02:21:38'),
(6, 7, 23, 58, 57, 2595, '1', '', NULL, 'Super Admin', NULL, '2022-02-28 02:33:32', '2022-02-28 02:33:32'),
(7, 8, 23, 63, 62, 225795, '1', '', NULL, 'Super Admin', NULL, '2022-02-28 23:55:15', '2022-02-28 23:55:15'),
(8, 9, 23, 68, 67, 4022580, '1', '', NULL, 'Super Admin', NULL, '2022-03-01 00:30:08', '2022-03-01 00:30:08'),
(9, 10, 23, 161, 160, 95000, '1', '', NULL, 'Super Admin', NULL, '2022-03-20 03:23:32', '2022-03-20 03:23:32'),
(10, 11, 121, 166, 165, 1000000, '3', '', NULL, 'Super Admin', NULL, '2022-03-20 04:22:18', '2022-03-20 04:22:18'),
(11, 12, 23, 171, 170, 1000000, '1', '', NULL, 'Super Admin', NULL, '2022-03-20 22:56:31', '2022-03-20 22:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `rateables`
--

CREATE TABLE `rateables` (
  `id` bigint(20) NOT NULL,
  `labor_bill_id` bigint(20) NOT NULL,
  `labor_bill_rate_id` bigint(20) NOT NULL,
  `rateable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rateable_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double(8,2) NOT NULL COMMENT 'Total Labor',
  `rate` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rateables`
--

INSERT INTO `rateables` (`id`, `labor_bill_id`, `labor_bill_rate_id`, `rateable_type`, `rateable_id`, `qty`, `rate`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 1, 5.00, 4.00, 20.00, '2022-02-23 01:48:36', '2022-02-23 01:48:36'),
(11, 1, 1, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 5, 5.00, 4.00, 20.00, '2022-03-07 03:03:32', '2022-03-07 06:33:39'),
(12, 2, 2, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 5, 5.00, 4.00, 20.00, '2022-03-07 03:03:32', '2022-03-07 06:33:39'),
(13, 3, 3, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 5, 5.00, 6.00, 30.00, '2022-03-07 03:03:32', '2022-03-07 06:33:39'),
(14, 4, 8, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 5, 5.00, 5.00, 25.00, '2022-03-07 03:03:32', '2022-03-07 06:33:39'),
(15, 5, 5, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 5, 5.00, 5.00, 25.00, '2022-03-07 03:03:32', '2022-03-07 06:33:39'),
(16, 7, 4, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 5, 5.00, 3.25, 16.25, '2022-03-07 03:03:32', '2022-03-07 06:33:39'),
(17, 8, 9, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 5, 5.00, 4.50, 22.50, '2022-03-07 03:03:32', '2022-03-07 06:33:39'),
(18, 1, 1, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 6, 5.00, 4.00, 20.00, '2022-03-07 03:05:12', '2022-03-07 22:04:18'),
(19, 2, 2, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 6, 5.00, 4.00, 20.00, '2022-03-07 03:05:12', '2022-03-07 22:04:18'),
(20, 3, 3, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 6, 5.00, 6.00, 30.00, '2022-03-07 03:05:12', '2022-03-07 22:04:18'),
(21, 4, 8, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 6, 5.00, 5.00, 25.00, '2022-03-07 03:05:12', '2022-03-07 22:04:18'),
(22, 5, 5, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 6, 5.00, 5.00, 25.00, '2022-03-07 03:05:12', '2022-03-07 22:04:18'),
(54, 8, 9, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 6, 5.00, 4.50, 22.50, '2022-03-07 22:04:18', '2022-03-07 22:04:18'),
(55, 1, 1, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 7, 50.00, 4.00, 200.00, '2022-03-21 04:54:10', '2022-03-21 04:54:10'),
(56, 2, 2, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 7, 50.00, 4.00, 200.00, '2022-03-21 04:54:10', '2022-03-21 04:54:10'),
(57, 13, 11, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 7, 50.00, 4.50, 225.00, '2022-03-21 04:54:10', '2022-03-21 04:54:10'),
(58, 23, 30, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 7, 50.00, 2.50, 125.00, '2022-03-21 04:54:10', '2022-03-21 04:54:10'),
(59, 35, 34, 'Modules\\OthersLaborBill\\Entities\\OtherLaborBill', 7, 50.00, 4.00, 200.00, '2022-03-21 04:54:10', '2022-03-21 04:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '1', NULL, NULL, NULL, NULL),
(2, 'Admin', '1', NULL, NULL, NULL, NULL),
(3, 'Manager', '2', NULL, NULL, '2021-04-10 02:13:52', '2021-04-10 02:13:52'),
(4, 'Asst. Manager', '2', NULL, NULL, '2021-05-04 14:20:37', '2021-05-04 14:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `salary_generates`
--

CREATE TABLE `salary_generates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `designation_id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `salary_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `basic_salary` double DEFAULT NULL,
  `allowance_amount` double DEFAULT NULL,
  `deduction_amount` double DEFAULT NULL,
  `absent` double DEFAULT NULL,
  `absent_amount` double DEFAULT NULL,
  `late_count` double DEFAULT NULL,
  `leave` double DEFAULT NULL,
  `leave_amount` double DEFAULT NULL,
  `ot_hour` double DEFAULT NULL,
  `ot_day` double DEFAULT NULL,
  `ot_amount` double DEFAULT NULL,
  `gross_salary` double DEFAULT NULL,
  `add_deduct_amount` double DEFAULT NULL,
  `adjusted_advance_amount` double DEFAULT NULL,
  `adjusted_loan_amount` double DEFAULT NULL,
  `net_salary` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `salary_status` enum('1','2','3','4') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Received,2=Partial,3=Pending,4=Ordered',
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Paid,2=Partial,3=Due',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Cash,2=Cheque,3=Mobile',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_generate_payments`
--

CREATE TABLE `salary_generate_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `salary_generated_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `employee_transaction_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Cash,2=Cheque,3=Mobile',
  `cheque_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_incements`
--

CREATE TABLE `salary_incements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `date` date DEFAULT NULL,
  `inc_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percent` int(11) DEFAULT NULL,
  `amount` double NOT NULL,
  `previous_basic` double NOT NULL,
  `current_basic` double NOT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive, 3=Cancel',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `item` double(8,2) NOT NULL,
  `total_qty` double(8,2) NOT NULL,
  `total_discount` double NOT NULL,
  `total_tax` double NOT NULL,
  `total_labor_cost` double NOT NULL,
  `total_price` double NOT NULL,
  `order_tax_rate` double DEFAULT NULL,
  `order_tax` double DEFAULT NULL,
  `order_discount` double DEFAULT NULL,
  `shipping_cost` double DEFAULT NULL,
  `grand_total` double NOT NULL,
  `paid_amount` double DEFAULT NULL,
  `due_amount` double DEFAULT NULL,
  `previous_due` double DEFAULT NULL,
  `payment_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Paid,2=Partial,3=Due',
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Cash,2=Bank Deposit,3=Mobile',
  `account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Regular,2=Pre Order',
  `sale_date` date NOT NULL,
  `delivery_status` enum('1','2','3') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '1=Packaging,2=Delivering,3=Delivered',
  `delivery_date` date DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Approved,2=Canceled,3=Pending',
  `status_change_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_change_date` datetime DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `invoice_no`, `warehouse_id`, `customer_id`, `item`, `total_qty`, `total_discount`, `total_tax`, `total_labor_cost`, `total_price`, `order_tax_rate`, `order_tax`, `order_discount`, `shipping_cost`, `grand_total`, `paid_amount`, `due_amount`, `previous_due`, `payment_status`, `payment_method`, `account_id`, `document`, `note`, `type`, `sale_date`, `delivery_status`, `delivery_date`, `status`, `status_change_by`, `status_change_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, '85424', NULL, 1, 1.00, 85520.00, 0, 0, 0, 128280000, 0, 0, 0, 0, 128280000, 128280000, 0, 0, '1', '1', 23, 'png_red__1_-removebg-preview-(1)-631917.png', NULL, '2', '2022-02-21', '1', '2022-02-21', '3', NULL, NULL, 'Super Admin', NULL, '2022-02-21 00:43:20', '2022-02-21 00:43:20'),
(3, '7895564', NULL, 1, 1.00, 50000.00, 0, 0, 0, 2750000, 0, 0, 0, 0, 2750000, 2749850, 0, -150, '1', '1', 23, 'undraw_fast_car_p-4-cu-568468.png', NULL, '2', '2022-03-21', '1', '2022-03-24', '3', NULL, NULL, 'Super Admin', NULL, '2022-03-20 22:58:51', '2022-03-20 22:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `sale_products`
--

CREATE TABLE `sale_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `delivered` double DEFAULT NULL,
  `delivered_warehouse_id` int(11) DEFAULT NULL,
  `sale_unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `net_unit_price` double NOT NULL,
  `discount` double NOT NULL,
  `tax_rate` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sale_products`
--

INSERT INTO `sale_products` (`id`, `sale_id`, `product_id`, `qty`, `delivered`, `delivered_warehouse_id`, `sale_unit_id`, `net_unit_price`, `discount`, `tax_rate`, `tax`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 85520, NULL, NULL, 7, 1500, 0, 0, 0, 128280000, '2022-02-21 00:43:20', '2022-02-21 00:43:20'),
(3, 3, 2, 50000, NULL, NULL, 9, 55, 0, 0, 0, 2750000, '2022-03-20 22:58:51', '2022-03-20 22:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('L0BSkpJG0QoO6sXw9YibVaahaNpmLCnTrbqSnKIA', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '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AHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTI6e3M6MjoiaWQiO2k6MTYwO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoyNzoiRmluaXNoZWQgR29vZHMgU3RvY2sgTGVkZ2VyIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MTE6ImZhcyBmYS1maWxlIjtzOjM6InVybCI7czoyNzoiZmluaXNoZWQtZ29vZHMtc3RvY2stbGVkZ2VyIjtzOjU6Im9yZGVyIjtpOjEwO3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDUtMTEgMTg6MTA6MTEiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjItMDMtMDggMTE6NTQ6NTgiO31zOjExOiIAKgBvcmlnaW5hbCI7YToxMjp7czoyOiJpZCI7aToxNjA7czo3OiJtZW51X2lkIjtpOjE7czo0OiJ0eXBlIjtzOjE6IjIiO3M6MTE6Im1vZHVsZV9uYW1lIjtzOjI3OiJGaW5pc2hlZCBHb29kcyBTdG9jayBMZWRnZXIiO3M6MTM6ImRpdmlkZXJfdGl0bGUiO047czoxMDoiaWNvbl9jbGFzcyI7czoxMToiZmFzIGZhLWZpbGUiO3M6MzoidXJsIjtzOjI3OiJmaW5pc2hlZC1nb29kcy1zdG9jay1sZWRnZXIiO3M6NToib3JkZXIiO2k6MTA7czo5OiJwYXJlbnRfaWQiO047czo2OiJ0YXJnZXQiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyMS0wNS0xMSAxODoxMDoxMSI7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b3J0LWFjY2VzcyI7aToyMTtzOjEwOiJiYWctYWNjZXNzIjtpOjIyO3M6NzoiYmFnLWFkZCI7aToyMztzOjE1OiJiYWctYnVsay1kZWxldGUiO2k6MjQ7czoxMDoiYmFnLWRlbGV0ZSI7aToyNTtzOjg6ImJhZy1lZGl0IjtpOjI2O3M6MTA6ImJhZy1yZXBvcnQiO2k6Mjc7czoyMDoiYmFsYW5jZS1zaGVldC1hY2Nlc3MiO2k6Mjg7czoxMToiYmFuay1hY2Nlc3MiO2k6Mjk7czo4OiJiYW5rLWFkZCI7aTozMDtzOjE2OiJiYW5rLWJvb2stYWNjZXNzIjtpOjMxO3M6MTE6ImJhbmstZGVsZXRlIjtpOjMyO3M6OToiYmFuay1lZGl0IjtpOjMzO3M6MTg6ImJhbmstbGVkZ2VyLWFjY2VzcyI7aTozNDtzOjExOiJiYW5rLXJlcG9ydCI7aTozNTtzOjIzOiJiYW5rLXRyYW5zYWN0aW9uLWFjY2VzcyI7aTozNjtzOjE1OiJiZW5pZml0cy1hY2Nlc3MiO2k6Mzc7czoxMjoiYmVuaWZpdHMtYWRkIjtpOjM4O3M6MjA6ImJlbmlmaXRzLWJ1bGstZGVsZXRlIjtpOjM5O3M6MTU6ImJlbmlmaXRzLWRlbGV0ZSI7aTo0MDtzOjEzOiJiZW5pZml0cy1lZGl0IjtpOjQxO3M6MTU6ImJlbmlmaXRzLXJlcG9ydCI7aTo0MjtzOjIyOiJjYXNoLWFkanVzdG1lbnQtYWNjZXNzIjtpOjQzO3M6MTY6ImNhc2gtYm9vay1hY2Nlc3MiO2k6NDQ7czoxNjoiY2FzaC1mbG93LWFjY2VzcyI7aTo0NTtzOjE1OiJjYXRlZ29yeS1hY2Nlc3MiO2k6NDY7czoxMjoiY2F0ZWdvcnktYWRkIjtpOjQ3O3M6MjA6ImNhdGVnb3J5LWJ1bGstZGVsZXRlIjtpOjQ4O3M6MTU6ImNhdGVnb3J5LWRlbGV0ZSI7aTo0OTtzOjEzOiJjYXRlZ29yeS1lZGl0IjtpOjUwO3M6MTU6ImNhdGVnb3J5LXJlcG9ydCI7aTo1MTtzOjE0OiJjbG9zaW5nLWFjY2VzcyI7aTo1MjtzOjIxOiJjbG9zaW5nLXJlcG9ydC1hY2Nlc3MiO2k6NTM7czoxMDoiY29hLWFjY2VzcyI7aTo1NDtzOjc6ImNvYS1hZGQiO2k6NTU7czoxMDoiY29hLWRlbGV0ZSI7aTo1NjtzOjg6ImNvYS1lZGl0IjtpOjU3O3M6MjE6ImNvbnRyYS12b3VjaGVyLWFjY2VzcyI7aTo1ODtzOjIyOiJjcmVkaXQtY3VzdG9tZXItYWNjZXNzIjtpOjU5O3M6MjE6ImNyZWRpdC12b3VjaGVyLWFjY2VzcyI7aTo2MDtzOjE1OiJjdXN0b21lci1hY2Nlc3MiO2k6NjE7czoxMjoiY3VzdG9tZXItYWRkIjtpOjYyO3M6MjM6ImN1c3RvbWVyLWFkdmFuY2UtYWNjZXNzIjtpOjYzO3M6MzA6ImN1c3RvbWVyLWFkdmFuY2UtYWNjZXNzLXJlcG9ydCI7aTo2NDtzOjIwOiJjdXN0b21lci1hZHZhbmNlLWFkZCI7aTo2NTtzOjI0OiJjdXN0b21lci1hZHZhbmNlLWFwcHJvdmUiO2k6NjY7czoyODoiY3VzdG9tZXItYWR2YW5jZS1idWxrLWRlbGV0ZSI7aTo2NztzOjIzOiJjdXN0b21lci1hZHZhbmNlLWRlbGV0ZSI7aTo2ODtzOjIxOiJjdXN0b21lci1hZHZhbmNlLWVkaXQiO2k6Njk7czoyMDoiY3VzdG9tZXItYnVsay1kZWxldGUiO2k6NzA7czoxNToiY3VzdG9tZXItZGVsZXRlIjtpOjcxO3M6MTM6ImN1c3RvbWVyLWVkaXQiO2k6NzI7czoyMToiY3VzdG9tZXItZ3JvdXAtYWNjZXNzIjtpOjczO3M6MTg6ImN1c3RvbWVyLWdyb3VwLWFkZCI7aTo3NDtzOjI2OiJjdXN0b21lci1ncm91cC1idWxrLWRlbGV0ZSI7aTo3NTtzOjIxOiJjdXN0b21lci1ncm91cC1kZWxldGUiO2k6NzY7czoxOToiY3VzdG9tZXItZ3JvdXAtZWRpdCI7aTo3NztzOjIxOiJjdXN0b21lci1ncm91cC1yZXBvcnQiO2k6Nzg7czoyMjoiY3VzdG9tZXItbGVkZ2VyLWFjY2VzcyI7aTo3OTtzOjIzOiJjdXN0b21lci1yZWNlaXZlLWFjY2VzcyI7aTo4MDtzOjE1OiJjdXN0b21lci1yZXBvcnQiO2k6ODE7czoxMzoiY3VzdG9tZXItdmlldyI7aTo4MjtzOjE2OiJkYXNoYm9hcmQtYWNjZXNzIjtpOjgzO3M6MjA6ImRlYml0LXZvdWNoZXItYWNjZXNzIjtpOjg0O3M6MTQ6ImRlbGV0ZS12b3VjaGVyIjtpOjg1O3M6MTc6ImRlcGFydG1lbnQtYWNjZXNzIjtpOjg2O3M6MTQ6ImRlcGFydG1lbnQtYWRkIjtpOjg3O3M6MjI6ImRlcGFydG1lbnQtYnVsay1kZWxldGUiO2k6ODg7czoxNzoiZGVwYXJ0bWVudC1kZWxldGUiO2k6ODk7czoxNToiZGVwYXJ0bWVudC1lZGl0IjtpOjkwO3M6MTc6ImRlcGFydG1lbnQtcmVwb3J0IjtpOjkxO3M6MTg6ImRlc2lnbmF0aW9uLWFjY2VzcyI7aTo5MjtzOjE1OiJkZXNpZ25hdGlvbi1hZGQiO2k6OTM7czoyMzoiZGVzaWduYXRpb24tYnVsay1kZWxldGUiO2k6OTQ7czoxODoiZGVzaWduYXRpb24tZGVsZXRlIjtpOjk1O3M6MTY6ImRlc2lnbmF0aW9uLWVkaXQiO2k6OTY7czoxODoiZGVzaWduYXRpb24tcmVwb3J0IjtpOjk3O3M6MTU6ImRpdmlzaW9uLWFjY2VzcyI7aTo5ODtzOjEyOiJkaXZpc2lvbi1hZGQiO2k6OTk7czoyMDoiZGl2aXNpb24tYnVsay1kZWxldGUiO2k6MTAwO3M6MTU6ImRpdmlzaW9uLWRlbGV0ZSI7aToxMDE7czoxMzoiZGl2aXNpb24tZWRpdCI7aToxMDI7czoxNToiZGl2aXNpb24tcmVwb3J0IjtpOjEwMztzOjEzOiJkcml2ZXItYWNjZXNzIjtpOjEwNDtzOjEwOiJkcml2ZXItYWRkIjtpOjEwNTtzOjE4OiJkcml2ZXItYnVsay1kZWxldGUiO2k6MTA2O3M6MTM6ImRyaXZlci1kZWxldGUiO2k6MTA3O3M6MTE6ImRyaXZlci1lZGl0IjtpOjEwODtzOjEzOiJkcml2ZXItcmVwb3J0IjtpOjEwOTtzOjE3OiJkdWUtcmVwb3J0LWFjY2VzcyI7aToxMTA7czoxMjoiZWRpdC12b3VjaGVyIjtpOjExMTtzOjE1OiJlbXBsb3llZS1hY2Nlc3MiO2k6MTEyO3M6MTI6ImVtcGxveWVlLWFkZCI7aToxMTM7czoyMDoiZW1wbG95ZWUtYnVsay1kZWxldGUiO2k6MTE0O3M6MTU6ImVtcGxveWVlLWRlbGV0ZSI7aToxMTU7czoxMzoiZW1wbG95ZWUtZWRpdCI7aToxMTY7czoxNToiZW1wbG95ZWUtcmVwb3J0IjtpOjExNztzOjIxOiJlbXBsb3llZS1zaGlmdC1jaGFuZ2UiO2k6MTE4O3M6MTM6ImVtcGxveWVlLXZpZXciO2k6MTE5O3M6MTQ6ImV4cGVuc2UtYWNjZXNzIjtpOjEyMDtzOjExOiJleHBlbnNlLWFkZCI7aToxMjE7czoxNToiZXhwZW5zZS1hcHByb3ZlIjtpOjEyMjtzOjE5OiJleHBlbnNlLWJ1bGstZGVsZXRlIjtpOjEyMztzOjIzOiJleHBlbnNlLWNhdGVnb3J5LWFjY2VzcyI7aToxMjQ7czoyMDoiZXhwZW5zZS1jYXRlZ29yeS1hZGQiO2k6MTI1O3M6Mjg6ImV4cGVuc2UtY2F0ZWdvcnktYnVsay1kZWxldGUiO2k6MTI2O3M6MjM6ImV4cGVuc2UtY2F0ZWdvcnktZGVsZXRlIjtpOjEyNztzOjIxOiJleHBlbnNlLWNhdGVnb3J5LWVkaXQiO2k6MTI4O3M6MjM6ImV4cGVuc2UtY2F0ZWdvcnktcmVwb3J0IjtpOjEyOTtzOjE0OiJleHBlbnNlLWRlbGV0ZSI7aToxMzA7czoxMjoiZXhwZW5zZS1lZGl0IjtpOjEzMTtzOjE5OiJleHBlbnNlLWl0ZW0tYWNjZXNzIjtpOjEzMjtzOjE2OiJleHBlbnNlLWl0ZW0tYWRkIjtpOjEzMztzOjI0OiJleHBlbnNlLWl0ZW0tYnVsay1kZWxldGUiO2k6MTM0O3M6MTk6ImV4cGVuc2UtaXRlbS1kZWxldGUiO2k6MTM1O3M6MTc6ImV4cGVuc2UtaXRlbS1lZGl0IjtpOjEzNjtzOjE5OiJleHBlbnNlLWl0ZW0tcmVwb3J0IjtpOjEzNztzOjE0OiJleHBlbnNlLXJlcG9ydCI7aToxMzg7czoyNDoiZXhwZW5zZS1zdGF0ZW1lbnQtYWNjZXNzIjtpOjEzOTtzOjI3OiJmaW5pc2hlZC1ieS1wcm9kdWN0cy1hY2Nlc3MiO2k6MTQwO3M6Mjc6ImZpbmlzaGVkLWdvb2RzLXN0b2NrLWFjY2VzcyI7aToxNDE7czozNDoiZmluaXNoZWQtZ29vZHMtc3RvY2stbGVkZ2VyLWFjY2VzcyI7aToxNDI7czoyNDoiZmluaXNoZWQtcHJvZHVjdHMtYWNjZXNzIjtpOjE0MztzOjIxOiJnZW5lcmFsLWxlZGdlci1hY2Nlc3MiO2k6MTQ0O3M6MjI6ImdlbmVyYWwtc2V0dGluZy1hY2Nlc3MiO2k6MTQ1O3M6MTQ6ImhvbGlkYXktYWNjZXNzIjtpOjE0NjtzOjExOiJob2xpZGF5LWFkZCI7aToxNDc7czoxOToiaG9saWRheS1idWxrLWRlbGV0ZSI7aToxNDg7czoxNDoiaG9saWRheS1kZWxldGUiO2k6MTQ5O3M6MTI6ImhvbGlkYXktZWRpdCI7aToxNTA7czoxNDoiaG9saWRheS1yZXBvcnQiO2k6MTUxO3M6MzA6ImluY29tZS1zdGF0ZW1lbnQtcmVwb3J0LWFjY2VzcyI7aToxNTI7czoyMzoiaW52ZW50b3J5LWxlZGdlci1hY2Nlc3MiO2k6MTUzO3M6MjI6ImpvdXJuYWwtdm91Y2hlci1hY2Nlc3MiO2k6MTU0O3M6MTc6ImxhYm9yLWJpbGwtYWNjZXNzIjtpOjE1NTtzOjE0OiJsYWJvci1iaWxsLWFkZCI7aToxNTY7czoyMjoibGFib3ItYmlsbC1idWxrLWRlbGV0ZSI7aToxNTc7czoxNzoibGFib3ItYmlsbC1kZWxldGUiO2k6MTU4O3M6MTU6ImxhYm9yLWJpbGwtZWRpdCI7aToxNTk7czoyMjoibGFib3ItYmlsbC1yYXRlLWFjY2VzcyI7aToxNjA7czoxOToibGFib3ItYmlsbC1yYXRlLWFkZCI7aToxNjE7czoyNzoibGFib3ItYmlsbC1yYXRlLWJ1bGstZGVsZXRlIjtpOjE2MjtzOjIyOiJsYWJvci1iaWxsLXJhdGUtZGVsZXRlIjtpOjE2MztzOjIwOiJsYWJvci1iaWxsLXJhdGUtZWRpdCI7aToxNjQ7czoyMjoibGFib3ItYmlsbC1yYXRlLXJlcG9ydCI7aToxNjU7czoxNzoibGFib3ItYmlsbC1yZXBvcnQiO2k6MTY2O3M6MjQ6ImxhYm9yLWJpbGwtcmVwb3J0LWFjY2VzcyI7aToxNjc7czoxNzoibGFib3ItaGVhZC1hY2Nlc3MiO2k6MTY4O3M6MTQ6ImxhYm9yLWhlYWQtYWRkIjtpOjE2OTtzOjIyOiJsYWJvci1oZWFkLWJ1bGstZGVsZXRlIjtpOjE3MDtzOjE3OiJsYWJvci1oZWFkLWRlbGV0ZSI7aToxNzE7czoxNToibGFib3ItaGVhZC1lZGl0IjtpOjE3MjtzOjI0OiJsYWJvci1oZWFkLWxlZGdlci1hY2Nlc3MiO2k6MTczO3M6MjQ6ImxlYXZlLWFwcGxpY2F0aW9uLWFjY2VzcyI7aToxNzQ7czoyMToibGVhdmUtYXBwbGljYXRpb24tYWRkIjtpOjE3NTtzOjI1OiJsZWF2ZS1hcHBsaWNhdGlvbi1hcHByb3ZlIjtpOjE3NjtzOjI5OiJsZWF2ZS1hcHBsaWNhdGlvbi1idWxrLWRlbGV0ZSI7aToxNzc7czoyNDoibGVhdmUtYXBwbGljYXRpb24tZGVsZXRlIjtpOjE3ODtzOjIyOiJsZWF2ZS1hcHBsaWNhdGlvbi1lZGl0IjtpOjE3OTtzOjI0OiJsZWF2ZS1hcHBsaWNhdGlvbi1yZXBvcnQiO2k6MTgwO3M6MTc6ImxlYXZlLXR5cGUtYWNjZXNzIjtpOjE4MTtzOjE0OiJsZWF2ZS10eXBlLWFkZCI7aToxODI7czoyMjoibGVhdmUtdHlwZS1idWxrLWRlbGV0ZSI7aToxODM7czoxNzoibGVhdmUtdHlwZS1kZWxldGUiO2k6MTg0O3M6MTU6ImxlYXZlLXR5cGUtZWRpdCI7aToxODU7czoxNzoibGVhdmUtdHlwZS1yZXBvcnQiO2k6MTg2O3M6MTg6ImxvYW4tcmVwb3J0LWFjY2VzcyI7aToxODc7czoxNDoibWFjaGluZS1hY2Nlc3MiO2k6MTg4O3M6MjE6Im1hY2hpbmUtYWNjZXNzLXJlcG9ydCI7aToxODk7czoxMToibWFjaGluZS1hZGQiO2k6MTkwO3M6MTk6Im1hY2hpbmUtYnVsay1kZWxldGUiO2k6MTkxO3M6MTQ6Im1hY2hpbmUtZGVsZXRlIjtpOjE5MjtzOjEyOiJtYWNoaW5lLWVkaXQiO2k6MTkzO3M6MjM6Im1hY2hpbmUtcHVyY2hhc2UtYWNjZXNzIjtpOjE5NDtzOjIwOiJtYWNoaW5lLXB1cmNoYXNlLWFkZCI7aToxOTU7czoyNDoibWFjaGluZS1wdXJjaGFzZS1hcHByb3ZlIjtpOjE5NjtzOjI4OiJtYWNoaW5lLXB1cmNoYXNlLWJ1bGstZGVsZXRlIjtpOjE5NztzOjIzOiJtYWNoaW5lLXB1cmNoYXNlLWRlbGV0ZSI7aToxOTg7czoyMToibWFjaGluZS1wdXJjaGFzZS1lZGl0IjtpOjE5OTtzOjI4OiJtYWNoaW5lLXB1cmNoYXNlLXBheW1lbnQtYWRkIjtpOjIwMDtzOjMxOiJtYWNoaW5lLXB1cmNoYXNlLXBheW1lbnQtZGVsZXRlIjtpOjIwMTtzOjI5OiJtYWNoaW5lLXB1cmNoYXNlLXBheW1lbnQtZWRpdCI7aToyMDI7czoyOToibWFjaGluZS1wdXJjaGFzZS1wYXltZW50LXZpZXciO2k6MjAzO3M6MjM6Im1hY2hpbmUtcHVyY2hhc2UtcmVwb3J0IjtpOjIwNDtzOjMwOiJtYWNoaW5lLXB1cmNoYXNlLXJlcG9ydC1hY2Nlc3MiO2k6MjA1O3M6MjE6Im1hY2hpbmUtcHVyY2hhc2UtdmlldyI7aToyMDY7czoxMjoibWFjaGluZS12aWV3IjtpOjIwNztzOjI3OiJtYWludGVuYW5jZS1jYXRlZ29yeS1hY2Nlc3MiO2k6MjA4O3M6MjQ6Im1haW50ZW5hbmNlLWNhdGVnb3J5LWFkZCI7aToyMDk7czozMjoibWFpbnRlbmFuY2UtY2F0ZWdvcnktYnVsay1kZWxldGUiO2k6MjEwO3M6Mjc6Im1haW50ZW5hbmNlLWNhdGVnb3J5LWRlbGV0ZSI7aToyMTE7czoyNToibWFpbnRlbmFuY2UtY2F0ZWdvcnktZWRpdCI7aToyMTI7czoyNzoibWFpbnRlbmFuY2UtY2F0ZWdvcnktcmVwb3J0IjtpOjIxMztzOjI2OiJtYWludGVuYW5jZS1zZXJ2aWNlLWFjY2VzcyI7aToyMTQ7czoyMzoibWFpbnRlbmFuY2Utc2VydmljZS1hZGQiO2k6MjE1O3M6Mjc6Im1haW50ZW5hbmNlLXNlcnZpY2UtYXBwcm92ZSI7aToyMTY7czozMToibWFpbnRlbmFuY2Utc2VydmljZS1idWxrLWRlbGV0ZSI7aToyMTc7czoyNjoibWFpbnRlbmFuY2Utc2VydmljZS1kZWxldGUiO2k6MjE4O3M6MjQ6Im1haW50ZW5hbmNlLXNlcnZpY2UtZWRpdCI7aToyMTk7czozMToibWFpbnRlbmFuY2Utc2VydmljZS1wYXltZW50LWFkZCI7aToyMjA7czozNDoibWFpbnRlbmFuY2Utc2VydmljZS1wYXltZW50LWRlbGV0ZSI7aToyMjE7czozMjoibWFpbnRlbmFuY2Utc2VydmljZS1wYXltZW50LWVkaXQiO2k6MjIyO3M6MzI6Im1haW50ZW5hbmNlLXNlcnZpY2UtcGF5bWVudC12aWV3IjtpOjIyMztzOjI2OiJtYWludGVuYW5jZS1zZXJ2aWNlLXJlcG9ydCI7aToyMjQ7czozMzoibWFpbnRlbmFuY2Utc2VydmljZS1yZXBvcnQtYWNjZXNzIjtpOjIyNTtzOjI0OiJtYWludGVuYW5jZS1zZXJ2aWNlLXZpZXciO2k6MjI2O3M6MjM6Im1haW50ZW5hbmNlLXVuaXQtYWNjZXNzIjtpOjIyNztzOjIwOiJtYWludGVuYW5jZS11bml0LWFkZCI7aToyMjg7czoyODoibWFpbnRlbmFuY2UtdW5pdC1idWxrLWRlbGV0ZSI7aToyMjk7czoyMzoibWFpbnRlbmFuY2UtdW5pdC1kZWxldGUiO2k6MjMwO3M6MjE6Im1haW50ZW5hbmNlLXVuaXQtZWRpdCI7aToyMzE7czoyMzoibWFpbnRlbmFuY2UtdW5pdC1yZXBvcnQiO2k6MjMyO3M6MTU6Im1hdGVyaWFsLWFjY2VzcyI7aToyMzM7czoxMjoibWF0ZXJpYWwtYWRkIjtpOjIzNDtzOjIwOiJtYXRlcmlhbC1idWxrLWRlbGV0ZSI7aToyMzU7czoxNToibWF0ZXJpYWwtZGVsZXRlIjtpOjIzNjtzOjEzOiJtYXRlcmlhbC1lZGl0IjtpOjIzNztzOjE1OiJtYXRlcmlhbC1yZXBvcnQiO2k6MjM4O3M6MjE6Im1hdGVyaWFsLXN0b2NrLWFjY2VzcyI7aToyMzk7czoyODoibWF0ZXJpYWwtc3RvY2stbGVkZ2VyLWFjY2VzcyI7aToyNDA7czoxMzoibWF0ZXJpYWwtdmlldyI7aToyNDE7czoxMToibWVudS1hY2Nlc3MiO2k6MjQyO3M6ODoibWVudS1hZGQiO2k6MjQzO3M6MTk6Im1lbnUtYnVpbGRlci1hY2Nlc3MiO2k6MjQ0O3M6MTY6Im1lbnUtYnVsay1kZWxldGUiO2k6MjQ1O3M6MTE6Im1lbnUtZGVsZXRlIjtpOjI0NjtzOjk6Im1lbnUtZWRpdCI7aToyNDc7czoxNToibWVudS1tb2R1bGUtYWRkIjtpOjI0ODtzOjE4OiJtZW51LW1vZHVsZS1kZWxldGUiO2k6MjQ5O3M6MTY6Im1lbnUtbW9kdWxlLWVkaXQiO2k6MjUwO3M6MTE6Im1lbnUtcmVwb3J0IjtpOjI1MTtzOjE4OiJtb2JpbGUtYmFuay1hY2Nlc3MiO2k6MjUyO3M6MTU6Im1vYmlsZS1iYW5rLWFkZCI7aToyNTM7czoyMzoibW9iaWxlLWJhbmstYm9vay1hY2Nlc3MiO2k6MjU0O3M6MjM6Im1vYmlsZS1iYW5rLWJ1bGstZGVsZXRlIjtpOjI1NTtzOjE4OiJtb2JpbGUtYmFuay1kZWxldGUiO2k6MjU2O3M6MTY6Im1vYmlsZS1iYW5rLWVkaXQiO2k6MjU3O3M6MjU6Im1vYmlsZS1iYW5rLWxlZGdlci1hY2Nlc3MiO2k6MjU4O3M6MTg6Im1vYmlsZS1iYW5rLXJlcG9ydCI7aToyNTk7czozMDoibW9iaWxlLWJhbmstdHJhbnNhY3Rpb24tYWNjZXNzIjtpOjI2MDtzOjIwOiJvZmZpY2lhbC1sb2FuLWFjY2VzcyI7aToyNjE7czoxNzoib2ZmaWNpYWwtbG9hbi1hZGQiO2k6MjYyO3M6MjU6Im9mZmljaWFsLWxvYW4tYnVsay1kZWxldGUiO2k6MjYzO3M6MjA6Im9mZmljaWFsLWxvYW4tZGVsZXRlIjtpOjI2NDtzOjE4OiJvZmZpY2lhbC1sb2FuLWVkaXQiO2k6MjY1O3M6MzI6Im9mZmljaWFsLWxvYW4taW5zdGFsbG1lbnQtYWNjZXNzIjtpOjI2NjtzOjI5OiJvZmZpY2lhbC1sb2FuLWluc3RhbGxtZW50LWFkZCI7aToyNjc7czozNzoib2ZmaWNpYWwtbG9hbi1pbnN0YWxsbWVudC1idWxrLWRlbGV0ZSI7aToyNjg7czozMjoib2ZmaWNpYWwtbG9hbi1pbnN0YWxsbWVudC1kZWxldGUiO2k6MjY5O3M6MzA6Im9mZmljaWFsLWxvYW4taW5zdGFsbG1lbnQtZWRpdCI7aToyNzA7czoyMjoib3BlbmluZy1iYWxhbmNlLWFjY2VzcyI7aToyNzE7czoyNDoib3RoZXJzLWxhYm9yLWJpbGwtYWNjZXNzIjtpOjI3MjtzOjIxOiJvdGhlcnMtbGFib3ItYmlsbC1hZGQiO2k6MjczO3M6MjU6Im90aGVycy1sYWJvci1iaWxsLWFwcHJvdmUiO2k6Mjc0O3M6Mjk6Im90aGVycy1sYWJvci1iaWxsLWJ1bGstZGVsZXRlIjtpOjI3NTtzOjI0OiJvdGhlcnMtbGFib3ItYmlsbC1kZWxldGUiO2k6Mjc2O3M6MjI6Im90aGVycy1sYWJvci1iaWxsLWVkaXQiO2k6Mjc3O3M6MjQ6Im90aGVycy1sYWJvci1iaWxsLXJlcG9ydCI7aToyNzg7czoyMjoib3RoZXJzLWxhYm9yLWJpbGwtdmlldyI7aToyNzk7czoyMDoicGFpZC1jdXN0b21lci1hY2Nlc3MiO2k6MjgwO3M6MTc6InBlcm1pc3Npb24tYWNjZXNzIjtpOjI4MTtzOjE0OiJwZXJtaXNzaW9uLWFkZCI7aToyODI7czoyMjoicGVybWlzc2lvbi1idWxrLWRlbGV0ZSI7aToyODM7czoxNzoicGVybWlzc2lvbi1kZWxldGUiO2k6Mjg0O3M6MTU6InBlcm1pc3Npb24tZWRpdCI7aToyODU7czoxNzoicGVybWlzc2lvbi1yZXBvcnQiO2k6Mjg2O3M6MjA6InBlcnNvbmFsLWxvYW4tYWNjZXNzIjtpOjI4NztzOjE3OiJwZXJzb25hbC1sb2FuLWFkZCI7aToyODg7czoyNToicGVyc29uYWwtbG9hbi1idWxrLWRlbGV0ZSI7aToyODk7czoyMDoicGVyc29uYWwtbG9hbi1kZWxldGUiO2k6MjkwO3M6MTg6InBlcnNvbmFsLWxvYW4tZWRpdCI7aToyOTE7czozMjoicGVyc29uYWwtbG9hbi1pbnN0YWxsbWVudC1hY2Nlc3MiO2k6MjkyO3M6Mjk6InBlcnNvbmFsLWxvYW4taW5zdGFsbG1lbnQtYWRkIjtpOjI5MztzOjM3OiJwZXJzb25hbC1sb2FuLWluc3RhbGxtZW50LWJ1bGstZGVsZXRlIjtpOjI5NDtzOjMyOiJwZXJzb25hbC1sb2FuLWluc3RhbGxtZW50LWRlbGV0ZSI7aToyOTU7czozMDoicGVyc29uYWwtbG9hbi1pbnN0YWxsbWVudC1lZGl0IjtpOjI5NjtzOjI3OiJwZXJzb25hbC1sb2FuLXBlcnNvbi1hY2Nlc3MiO2k6Mjk3O3M6MjQ6InBlcnNvbmFsLWxvYW4tcGVyc29uLWFkZCI7aToyOTg7czozMjoicGVyc29uYWwtbG9hbi1wZXJzb24tYnVsay1kZWxldGUiO2k6Mjk5O3M6Mjc6InBlcnNvbmFsLWxvYW4tcGVyc29uLWRlbGV0ZSI7aTozMDA7czoyNToicGVyc29uYWwtbG9hbi1wZXJzb24tZWRpdCI7aTozMDE7czoyMToicHJlLW9yZGVyLXNhbGUtYWNjZXNzIjtpOjMwMjtzOjE4OiJwcmUtb3JkZXItc2FsZS1hZGQiO2k6MzAzO3M6MjI6InByZS1vcmRlci1zYWxlLWFwcHJvdmUiO2k6MzA0O3M6MjY6InByZS1vcmRlci1zYWxlLWJ1bGstZGVsZXRlIjtpOjMwNTtzOjIxOiJwcmUtb3JkZXItc2FsZS1kZWxldGUiO2k6MzA2O3M6MTk6InByZS1vcmRlci1zYWxlLWVkaXQiO2k6MzA3O3M6MjE6InByZS1vcmRlci1zYWxlLXJlcG9ydCI7aTozMDg7czoxOToicHJlLW9yZGVyLXNhbGUtdmlldyI7aTozMDk7czoxNDoicHJvZHVjdC1hY2Nlc3MiO2k6MzEwO3M6MTE6InByb2R1Y3QtYWRkIjtpOjMxMTtzOjE5OiJwcm9kdWN0LWJ1bGstZGVsZXRlIjtpOjMxMjtzOjE0OiJwcm9kdWN0LWRlbGV0ZSI7aTozMTM7czoxMjoicHJvZHVjdC1lZGl0IjtpOjMxNDtzOjE0OiJwcm9kdWN0LXJlcG9ydCI7aTozMTU7czoxMjoicHJvZHVjdC12aWV3IjtpOjMxNjtzOjMyOiJwcm9kdWN0LXdpc2Utc2FsZXMtcmVwb3J0LWFjY2VzcyI7aTozMTc7czoxNzoicHJvZHVjdGlvbi1hY2Nlc3MiO2k6MzE4O3M6MTQ6InByb2R1Y3Rpb24tYWRkIjtpOjMxOTtzOjE4OiJwcm9kdWN0aW9uLWFwcHJvdmUiO2k6MzIwO3M6MjI6InByb2R1Y3Rpb24tYnVsay1kZWxldGUiO2k6MzIxO3M6MTc6InByb2R1Y3Rpb24tZGVsZXRlIjtpOjMyMjtzOjE1OiJwcm9kdWN0aW9uLWVkaXQiO2k6MzIzO3M6MTc6InByb2R1Y3Rpb24tcmVwb3J0IjtpOjMyNDtzOjE1OiJwcm9kdWN0aW9uLXZpZXciO2k6MzI1O3M6MTg6InByb2ZpdC1sb3NzLWFjY2VzcyI7aTozMjY7czoxNToicHVyY2hhc2UtYWNjZXNzIjtpOjMyNztzOjEyOiJwdXJjaGFzZS1hZGQiO2k6MzI4O3M6MTY6InB1cmNoYXNlLWFwcHJvdmUiO2k6MzI5O3M6MjA6InB1cmNoYXNlLWJ1bGstZGVsZXRlIjtpOjMzMDtzOjE1OiJwdXJjaGFzZS1kZWxldGUiO2k6MzMxO3M6MTM6InB1cmNoYXNlLWVkaXQiO2k6MzMyO3M6MjA6InB1cmNoYXNlLXBheW1lbnQtYWRkIjtpOjMzMztzOjIzOiJwdXJjaGFzZS1wYXltZW50LWRlbGV0ZSI7aTozMzQ7czoyMToicHVyY2hhc2UtcGF5bWVudC1lZGl0IjtpOjMzNTtzOjIxOiJwdXJjaGFzZS1wYXltZW50LXZpZXciO2k6MzM2O3M6MTU6InB1cmNoYXNlLXJlcG9ydCI7aTozMzc7czoyMjoicHVyY2hhc2UtcmVwb3J0LWFjY2VzcyI7aTozMzg7czoxMzoicHVyY2hhc2UtdmlldyI7aTozMzk7czoxMToicm9sZS1hY2Nlc3MiO2k6MzQwO3M6ODoicm9sZS1hZGQiO2k6MzQxO3M6MTY6InJvbGUtYnVsay1kZWxldGUiO2k6MzQyO3M6MTE6InJvbGUtZGVsZXRlIjtpOjM0MztzOjk6InJvbGUtZWRpdCI7aTozNDQ7czoxMToicm9sZS1yZXBvcnQiO2k6MzQ1O3M6OToicm9sZS12aWV3IjtpOjM0NjtzOjIyOiJzYWxhcnktZ2VuZXJhdGUtYWNjZXNzIjtpOjM0NztzOjE5OiJzYWxhcnktZ2VuZXJhdGUtYWRkIjtpOjM0ODtzOjI3OiJzYWxhcnktZ2VuZXJhdGUtYnVsay1kZWxldGUiO2k6MzQ5O3M6MjI6InNhbGFyeS1nZW5lcmF0ZS1kZWxldGUiO2k6MzUwO3M6MjI6InNhbGFyeS1nZW5lcmF0ZS1yZXBvcnQiO2k6MzUxO3M6MTk6InNhbGFyeS1zZXR1cC1hY2Nlc3MiO2k6MzUyO3M6MTY6InNhbGFyeS1zZXR1cC1hZGQiO2k6MzUzO3M6MjQ6InNhbGFyeS1zZXR1cC1idWxrLWRlbGV0ZSI7aTozNTQ7czoxOToic2FsYXJ5LXNldHVwLWRlbGV0ZSI7aTozNTU7czoxNzoic2FsYXJ5LXNldHVwLWVkaXQiO2k6MzU2O3M6MTk6InNhbGFyeS1zZXR1cC1yZXBvcnQiO2k6MzU3O3M6MTc6InNhbGFyeS1zZXR1cC12aWV3IjtpOjM1ODtzOjExOiJzYWxlLWFjY2VzcyI7aTozNTk7czo4OiJzYWxlLWFkZCI7aTozNjA7czoxMjoic2FsZS1hcHByb3ZlIjtpOjM2MTtzOjE2OiJzYWxlLWJ1bGstZGVsZXRlIjtpOjM2MjtzOjExOiJzYWxlLWRlbGV0ZSI7aTozNjM7czo5OiJzYWxlLWVkaXQiO2k6MzY0O3M6MTE6InNhbGUtcmVwb3J0IjtpOjM2NTtzOjk6InNhbGUtdmlldyI7aTozNjY7czoxOToic2FsZXMtcmVwb3J0LWFjY2VzcyI7aTozNjc7czoxMjoic2hpZnQtYWNjZXNzIjtpOjM2ODtzOjk6InNoaWZ0LWFkZCI7aTozNjk7czoxNzoic2hpZnQtYnVsay1kZWxldGUiO2k6MzcwO3M6MTI6InNoaWZ0LWRlbGV0ZSI7aTozNzE7czoxMDoic2hpZnQtZWRpdCI7aTozNzI7czoxOToic2hpZnQtbWFuYWdlLWFjY2VzcyI7aTozNzM7czoxNjoic2hpZnQtbWFuYWdlLWFkZCI7aTozNzQ7czoyNDoic2hpZnQtbWFuYWdlLWJ1bGstZGVsZXRlIjtpOjM3NTtzOjE5OiJzaGlmdC1tYW5hZ2UtZGVsZXRlIjtpOjM3NjtzOjE3OiJzaGlmdC1tYW5hZ2UtZWRpdCI7aTozNzc7czoxOToic2hpZnQtbWFuYWdlLXJlcG9ydCI7aTozNzg7czoxMjoic2hpZnQtcmVwb3J0IjtpOjM3OTtzOjIxOiJzdW1tYXJ5LXJlcG9ydC1hY2Nlc3MiO2k6MzgwO3M6MTU6InN1cHBsaWVyLWFjY2VzcyI7aTozODE7czoxMjoic3VwcGxpZXItYWRkIjtpOjM4MjtzOjIzOiJzdXBwbGllci1hZHZhbmNlLWFjY2VzcyI7aTozODM7czoyMDoic3VwcGxpZXItYWR2YW5jZS1hZGQiO2k6Mzg0O3M6MjQ6InN1cHBsaWVyLWFkdmFuY2UtYXBwcm92ZSI7aTozODU7czoyODoic3VwcGxpZXItYWR2YW5jZS1idWxrLWRlbGV0ZSI7aTozODY7czoyMzoic3VwcGxpZXItYWR2YW5jZS1kZWxldGUiO2k6Mzg3O3M6MjE6InN1cHBsaWVyLWFkdmFuY2UtZWRpdCI7aTozODg7czoyMzoic3VwcGxpZXItYWR2YW5jZS1yZXBvcnQiO2k6Mzg5O3M6MjA6InN1cHBsaWVyLWJ1bGstZGVsZXRlIjtpOjM5MDtzOjE1OiJzdXBwbGllci1kZWxldGUiO2k6MzkxO3M6MTM6InN1cHBsaWVyLWVkaXQiO2k6MzkyO3M6MjI6InN1cHBsaWVyLWxlZGdlci1hY2Nlc3MiO2k6MzkzO3M6MjM6InN1cHBsaWVyLXBheW1lbnQtYWNjZXNzIjtpOjM5NDtzOjE1OiJzdXBwbGllci1yZXBvcnQiO2k6Mzk1O3M6MTA6InRheC1hY2Nlc3MiO2k6Mzk2O3M6NzoidGF4LWFkZCI7aTozOTc7czoxNToidGF4LWJ1bGstZGVsZXRlIjtpOjM5ODtzOjEwOiJ0YXgtZGVsZXRlIjtpOjM5OTtzOjg6InRheC1lZGl0IjtpOjQwMDtzOjEwOiJ0YXgtcmVwb3J0IjtpOjQwMTtzOjEzOiJ0ZW5hbnQtYWNjZXNzIjtpOjQwMjtzOjEwOiJ0ZW5hbnQtYWRkIjtpOjQwMztzOjE4OiJ0ZW5hbnQtYnVsay1kZWxldGUiO2k6NDA0O3M6MTM6InRlbmFudC1kZWxldGUiO2k6NDA1O3M6MTE6InRlbmFudC1lZGl0IjtpOjQwNjtzOjIwOiJ0ZW5hbnQtbGVkZ2VyLWFjY2VzcyI7aTo0MDc7czoyNDoidGVuYW50LXByb2R1Y3Rpb24tYWNjZXNzIjtpOjQwODtzOjIxOiJ0ZW5hbnQtcHJvZHVjdGlvbi1hZGQiO2k6NDA5O3M6Mjk6InRlbmFudC1wcm9kdWN0aW9uLWJ1bGstZGVsZXRlIjtpOjQxMDtzOjI0OiJ0ZW5hbnQtcHJvZHVjdGlvbi1kZWxldGUiO2k6NDExO3M6MjI6InRlbmFudC1wcm9kdWN0aW9uLWVkaXQiO2k6NDEyO3M6MzQ6InRlbmFudC1wcm9kdWN0aW9uLXByb2R1Y3QtZGVsaXZlcnkiO2k6NDEzO3M6NDI6InRlbmFudC1wcm9kdWN0aW9uLXByb2R1Y3QtZGVsaXZlcnktZGV0YWlscyI7aTo0MTQ7czoyMjoidGVuYW50LXByb2R1Y3Rpb24tdmlldyI7aTo0MTU7czozMDoidG9kYXlzLWN1c3RvbWVyLXJlY2VpcHQtYWNjZXNzIjtpOjQxNjtzOjI5OiJ0b2RheXMtcHVyY2hhc2UtcmVwb3J0LWFjY2VzcyI7aTo0MTc7czoyNjoidG9kYXlzLXNhbGVzLXJlcG9ydC1hY2Nlc3MiO2k6NDE4O3M6MTY6InRyYW5zcG9ydC1hY2Nlc3MiO2k6NDE5O3M6MTM6InRyYW5zcG9ydC1hZGQiO2k6NDIwO3M6MTc6InRyYW5zcG9ydC1hcHByb3ZlIjtpOjQyMTtzOjIxOiJ0cmFuc3BvcnQtYnVsay1kZWxldGUiO2k6NDIyO3M6MTY6InRyYW5zcG9ydC1kZWxldGUiO2k6NDIzO3M6MTQ6InRyYW5zcG9ydC1lZGl0IjtpOjQyNDtzOjE2OiJ0cmFuc3BvcnQtcmVwb3J0IjtpOjQyNTtzOjIzOiJ0cmFuc3BvcnQtcmVwb3J0LWFjY2VzcyI7aTo0MjY7czoxNDoidHJhbnNwb3J0LXZpZXciO2k6NDI3O3M6MjA6InRyaWFsLWJhbGFuY2UtYWNjZXNzIjtpOjQyODtzOjEyOiJ0cnVjay1hY2Nlc3MiO2k6NDI5O3M6OToidHJ1Y2stYWRkIjtpOjQzMDtzOjE3OiJ0cnVjay1idWxrLWRlbGV0ZSI7aTo0MzE7czoxMjoidHJ1Y2stZGVsZXRlIjtpOjQzMjtzOjEwOiJ0cnVjay1lZGl0IjtpOjQzMztzOjE5OiJ0cnVjay1sZWRnZXItYWNjZXNzIjtpOjQzNDtzOjEyOiJ0cnVjay1yZXBvcnQiO2k6NDM1O3M6MTE6InVuaXQtYWNjZXNzIjtpOjQzNjtzOjg6InVuaXQtYWRkIjtpOjQzNztzOjE2OiJ1bml0LWJ1bGstZGVsZXRlIjtpOjQzODtzOjExOiJ1bml0LWRlbGV0ZSI7aTo0Mzk7czo5OiJ1bml0LWVkaXQiO2k6NDQwO3M6MTE6InVuaXQtcmVwb3J0IjtpOjQ0MTtzOjExOiJ1c2VyLWFjY2VzcyI7aTo0NDI7czo4OiJ1c2VyLWFkZCI7aTo0NDM7czoxNjoidXNlci1idWxrLWRlbGV0ZSI7aTo0NDQ7czoxMToidXNlci1kZWxldGUiO2k6NDQ1O3M6OToidXNlci1lZGl0IjtpOjQ0NjtzOjExOiJ1c2VyLXJlcG9ydCI7aTo0NDc7czo5OiJ1c2VyLXZpZXciO2k6NDQ4O3M6MjM6InZvdWNoZXItYXBwcm92YWwtYWNjZXNzIjtpOjQ0OTtzOjIzOiJ2b3VjaGVyLWFwcHJvdmFsLXJlcG9ydCI7aTo0NTA7czoxNjoid2FyZWhvdXNlLWFjY2VzcyI7aTo0NTE7czoxMzoid2FyZWhvdXNlLWFkZCI7aTo0NTI7czoyMToid2FyZWhvdXNlLWJ1bGstZGVsZXRlIjtpOjQ1MztzOjE2OiJ3YXJlaG91c2UtZGVsZXRlIjtpOjQ1NDtzOjE0OiJ3YXJlaG91c2UtZWRpdCI7aTo0NTU7czoxNjoid2FyZWhvdXNlLXJlcG9ydCI7aTo0NTY7czoyMToid2Vla2x5LWhvbGlkYXktYWNjZXNzIjtpOjQ1NztzOjE4OiJ3ZWVrbHktaG9saWRheS1hZGQiO2k6NDU4O3M6MjY6IndlZWtseS1ob2xpZGF5LWJ1bGstZGVsZXRlIjtpOjQ1OTtzOjIxOiJ3ZWVrbHktaG9saWRheS1kZWxldGUiO2k6NDYwO3M6MTk6IndlZWtseS1ob2xpZGF5LWVkaXQiO2k6NDYxO3M6MjE6IndlZWtseS1ob2xpZGF5LXJlcG9ydCI7fXM6OToiYXBwbG9jYWxlIjtzOjI6ImJuIjt9', 1647863247);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'title', 'মেসার্স জাহিদ অটো রাইচ মিল', NULL, NULL),
(2, 'email', 'জাহিদ@জিমেইল.কম', NULL, NULL),
(3, 'contact_no', '+8801711903710', NULL, NULL),
(4, 'address', 'খাজানগর , বিসিক  , কুষ্টিয়া', NULL, NULL),
(5, 'logo', NULL, NULL, NULL),
(6, 'favicon', '', NULL, NULL),
(7, 'currency_code', 'BDT', NULL, NULL),
(8, 'currency_symbol', 'Tk', NULL, NULL),
(9, 'currency_position', '2', NULL, NULL),
(10, 'invoice_prefix', 'INV-', NULL, NULL),
(11, 'invoice_number', '1001', NULL, NULL),
(12, 'timezone', 'Asia/Dhaka', NULL, NULL),
(13, 'date_format', 'd-M-Y', NULL, NULL),
(14, 'mail_mailer', 'smtp', NULL, NULL),
(15, 'mail_host', '', NULL, NULL),
(16, 'mail_port', '', NULL, NULL),
(17, 'mail_username', '', NULL, NULL),
(18, 'mail_password', '', NULL, NULL),
(19, 'mail_encryption', '', NULL, NULL),
(20, 'mail_from_name', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shifts`
--

CREATE TABLE `shifts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `night_status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Day, 2=Night',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shifts`
--

INSERT INTO `shifts` (`id`, `name`, `start_time`, `end_time`, `night_status`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Day', '09:15:00', '18:45:00', '1', '1', '2', 'Super Admin', 'Super Admin', '2022-02-23 23:48:17', '2022-03-21 01:16:29');

-- --------------------------------------------------------

--
-- Table structure for table `shift_manages`
--

CREATE TABLE `shift_manages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shift_id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `presentstatus` int(11) DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Pending, 2=Accepted, 3=Cancel',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Material,2=Machine',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `company_name`, `mobile`, `email`, `city`, `zipcode`, `address`, `type`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'rijwan', 'B2gsoft', '01986348224', 'rijwanc007@gmail.com', 'dhaka', '1206', '1/a matikata', '1', '1', 'Super Admin', NULL, '2022-02-16 21:45:47', '2022-02-16 21:45:47'),
(2, 'রিজওয়ান', 'বি 2 জি', '019863488224', 'রিজওয়ানসি007@জিমেইল.কম', 'ঢাকা', '1206', 'মাটিকাটা', '1', '1', 'Super Admin', 'Super Admin', '2022-02-28 02:26:49', '2022-03-06 00:20:59'),
(3, 'আরামন রহমান', 'বি আর টি সি', '01521225987', 'আরামন@জিমেইল.কম', 'ঢাকা', '1206', 'ঢাকা ক্যান্টনমেন্ট', '1', '1', 'Super Admin', NULL, '2022-02-28 23:37:09', '2022-02-28 23:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`id`, `name`, `mobile`, `address`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(10, 'rijwan chowdhury', '01986348224', NULL, '1', 'Super Admin', 'Super Admin', '2022-03-08 04:50:12', '2022-03-08 04:50:44'),
(11, 'younusur rahman', '01401157055', NULL, '1', 'Super Admin', 'Super Admin', '2022-03-08 04:51:09', '2022-03-08 04:51:34'),
(12, 'supol chowdhury', '01716756578', NULL, '1', 'Super Admin', NULL, '2022-03-11 13:48:08', '2022-03-11 13:48:08'),
(13, 'nadim', '01401157060', NULL, '1', 'Super Admin', NULL, '2022-03-12 07:57:42', '2022-03-12 07:57:42'),
(14, 'ismail', '01753001195', NULL, '1', 'Super Admin', NULL, '2022-03-13 06:25:42', '2022-03-13 06:25:42'),
(16, 'arif', '01515666297', 'matikata 135/1', '1', 'Super Admin', 'Super Admin', '2022-03-15 05:03:45', '2022-03-15 05:04:08'),
(17, 'sifat', '01765361846', 'matikata 135/1', '1', 'Super Admin', NULL, '2022-03-15 22:42:14', '2022-03-15 22:42:14'),
(18, 'moinul ismal omi', '01672317671', 'matikta bazar', '1', 'Super Admin', NULL, '2022-03-19 11:19:39', '2022-03-19 11:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_productions`
--

CREATE TABLE `tenant_productions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenant_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drier_no_mil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drier_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receipt_date` date DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `d_o_p_p_i_p` date DEFAULT NULL,
  `production_date` date DEFAULT NULL,
  `s_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_l_h_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `r_t_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `s_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_m_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_m_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_m_o_r_p_p_m_p` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `previous_due` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_purchase` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production_expense` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poly_full` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mil_rent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paddy_unload` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_goods_load` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_goods_lat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `machi_full_bag_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `palish_full_bag_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rice_full_bag_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_expense` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receive_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `due` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenant_productions`
--

INSERT INTO `tenant_productions` (`id`, `tenant_id`, `drier_no_mil`, `drier_no`, `receipt_no`, `receipt_date`, `product_id`, `d_o_p_p_i_p`, `production_date`, `s_name`, `p_name`, `p_l_h_name`, `r_t_no`, `s_no`, `p_m_name`, `m_m_name`, `p_time`, `m_time`, `t_m_o_r_p_p_m_p`, `previous_due`, `product_purchase`, `production_expense`, `poly_full`, `mil_rent`, `paddy_unload`, `other_goods_load`, `other_goods_lat`, `machi_full_bag_price`, `palish_full_bag_price`, `rice_full_bag_price`, `other_expense`, `total`, `receive_amount`, `due`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(33, '16', '1', '1', '202203210500302', '2022-03-21', '2', '2022-03-21', '2022-03-21', 'রিজওয়ান ট্রেডার্স', 'মিনিকেট', 'আরমান', '8547', '98745', 'মোঃ আরমান', 'মোঃ আরমান', '2022-03-21', '2022-03-21', '10', '0.00', '6000', '95185', '69', '50', '50', '50', '50', '50', '50', '50', '50', '89654', '50000', '39654', '1', 'Super Admin', NULL, '2022-03-20 23:01:06', '2022-03-20 23:03:57'),
(34, '14', '2', '2', '202203210506441', '2022-03-21', '2', '2022-03-21', '2022-03-21', 'রিজওয়ান ট্রেডার্স', 'মিনিকেট', 'আরমান', '8547', '98745', 'মোঃ আরমান', 'মোঃ আরমান', '2022-03-21', '2022-03-21', '10', '0.00', '2000', '100192.5', '126', '50', '50', '50', '50', '50', '50', '50', '50', '98718.5', '90000', '8718.5', '1', 'Super Admin', NULL, '2022-03-20 23:07:20', '2022-03-21 04:53:03');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_production_materials`
--

CREATE TABLE `tenant_production_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenant_production_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `received_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mana` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kilogram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenant_production_materials`
--

INSERT INTO `tenant_production_materials` (`id`, `tenant_production_id`, `material_id`, `unit_id`, `received_quantity`, `used_quantity`, `mana`, `kilogram`, `rate`, `total`, `created_at`, `updated_at`) VALUES
(220, '33', '2', '9', '200', NULL, '612', '20', '90', '55125', '2022-03-20 23:01:06', '2022-03-20 23:03:57'),
(221, '33', '3', '9', '300', NULL, '500', '30', '80', '40060', '2022-03-20 23:01:06', '2022-03-20 23:03:57'),
(222, '34', '2', '9', '100', NULL, '612', '20', '90', '55125', '2022-03-20 23:07:20', '2022-03-21 04:53:03'),
(223, '34', '3', '9', '100', NULL, '500', '30', '90', '45067.5', '2022-03-20 23:07:20', '2022-03-21 04:53:03');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_production_products`
--

CREATE TABLE `tenant_production_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenant_production_products`
--

INSERT INTO `tenant_production_products` (`id`, `name`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(6, 'পালিশ ছিট', '1', 'Super Admin', NULL, '2022-03-12 01:47:36', '2022-03-12 01:47:36'),
(7, 'পালিশ', '1', 'Super Admin', NULL, '2022-03-12 01:47:52', '2022-03-12 01:47:52'),
(8, 'পালিশ খুদ', '1', 'Super Admin', NULL, '2022-03-12 01:48:31', '2022-03-12 01:48:31'),
(9, 'চৌকি ছিট', '1', 'Super Admin', NULL, '2022-03-12 01:49:04', '2022-03-12 01:49:04'),
(10, 'চৌকি', '1', 'Super Admin', NULL, '2022-03-12 01:49:17', '2022-03-12 01:49:17'),
(11, 'মাছি ছিট', '1', 'Super Admin', NULL, '2022-03-12 01:49:42', '2022-03-12 01:49:42'),
(12, 'মাছি', '1', 'Super Admin', NULL, '2022-03-12 01:49:56', '2022-03-12 01:49:56'),
(13, 'মোটা খুদ ছিট', '1', 'Super Admin', NULL, '2022-03-12 01:50:20', '2022-03-12 01:50:20'),
(14, 'মোটা খুদ', '1', 'Super Admin', NULL, '2022-03-12 01:50:32', '2022-03-12 01:50:32'),
(15, 'চাউল ছিট', '1', 'Super Admin', NULL, '2022-03-12 01:50:53', '2022-03-12 01:50:53'),
(16, 'চাউল -25kg', '1', 'Super Admin', NULL, '2022-03-12 01:51:01', '2022-03-12 01:51:01'),
(17, 'চাউল -50kg', '1', 'Super Admin', NULL, '2022-03-12 01:51:07', '2022-03-12 01:51:07');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_production_product_deliveries`
--

CREATE TABLE `tenant_production_product_deliveries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenant_production_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bag_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bag_weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenant_production_product_deliveries`
--

INSERT INTO `tenant_production_product_deliveries` (`id`, `tenant_production_id`, `product_id`, `bag_quantity`, `bag_weight`, `rate`, `total_amount`, `created_at`, `updated_at`) VALUES
(11, '28', '3', NULL, '75', NULL, NULL, '2022-03-14 04:05:45', '2022-03-14 04:05:45'),
(12, '14', '2', '50', '75', '84', '4200', '2022-03-14 04:09:25', '2022-03-14 04:09:25'),
(13, '18', '2', '50', '75', '50', '2500', '2022-03-14 04:20:29', '2022-03-14 04:20:29'),
(14, '29', '2', '50', '72', '50', '2500', NULL, NULL),
(15, '29', '2', '50', '25', '50', '2500', NULL, NULL),
(16, '29', '2', '50', '50', '50', '2500', NULL, NULL),
(17, '29', '2', '50', '75', '50', '2500', NULL, NULL),
(18, '24', '2', NULL, '72', NULL, NULL, NULL, NULL),
(19, '24', '2', NULL, '25', NULL, NULL, NULL, NULL),
(20, '24', '2', NULL, '50', NULL, NULL, NULL, NULL),
(21, '24', '2', NULL, '75', NULL, NULL, NULL, NULL),
(22, '30', '2', NULL, '72', NULL, NULL, NULL, NULL),
(23, '30', '2', '233', '25', '.30', '69.89999999999999', NULL, NULL),
(24, '30', '2', '187', '50', '.30', '56.1', NULL, NULL),
(25, '30', '2', NULL, '75', NULL, NULL, NULL, NULL),
(26, '30', '12', '3', '49', NULL, '0', NULL, NULL),
(27, '30', '11', NULL, '44', NULL, NULL, NULL, NULL),
(28, '30', '10', '7', '49', NULL, '0', NULL, NULL),
(29, '30', '9', NULL, '51', NULL, NULL, NULL, NULL),
(30, '30', '8', '2', '49', NULL, '0', NULL, NULL),
(31, '30', '7', NULL, '20', NULL, NULL, NULL, NULL),
(32, '30', '6', '4', '30', NULL, '0', NULL, NULL),
(33, '30', '5', '31', '49', NULL, '0', NULL, NULL),
(34, '30', '4', NULL, '51', NULL, NULL, NULL, NULL),
(36, '31', '2', '233', '25', '.30', '69.89999999999999', NULL, NULL),
(37, '31', '2', '187', '50', '.30', '56.1', NULL, NULL),
(39, '31', '12', '3', '49', NULL, '0', NULL, NULL),
(40, '31', '11', NULL, '44', NULL, NULL, NULL, NULL),
(41, '31', '10', '7', '49', NULL, '0', NULL, NULL),
(42, '31', '9', NULL, '51', NULL, NULL, NULL, NULL),
(43, '31', '8', '2', '49', NULL, '0', NULL, NULL),
(44, '31', '7', NULL, '20', NULL, NULL, NULL, NULL),
(45, '31', '6', '4', '30', NULL, '0', NULL, NULL),
(46, '31', '5', '31', '49', NULL, '0', NULL, NULL),
(47, '31', '4', NULL, '51', NULL, NULL, NULL, NULL),
(48, '32', '1', '900', '50', '.30', '270', NULL, NULL),
(49, '32', '13', '50', '50', NULL, '0', NULL, NULL),
(50, '32', '12', '69', '50', NULL, '0', NULL, NULL),
(51, '33', '2', '230', '50', '.30', '69', NULL, NULL),
(52, '33', '10', '50', '50', NULL, '0', NULL, NULL),
(53, '33', '9', '70', '50', NULL, '0', NULL, NULL),
(54, '33', '8', '80', '50', NULL, '0', NULL, NULL),
(55, '34', '2', '187', '25', '.30', '56.1', NULL, NULL),
(56, '34', '2', '233', '50', '.30', '69.89999999999999', NULL, NULL),
(57, '34', '12', '3', '49', NULL, '0', NULL, NULL),
(58, '34', '11', NULL, '44', NULL, NULL, NULL, NULL),
(59, '34', '10', '7', '49', NULL, '0', NULL, NULL),
(60, '34', '9', NULL, '51', NULL, NULL, NULL, NULL),
(61, '34', '8', '2', '49', NULL, '0', NULL, NULL),
(62, '34', '7', NULL, '20', NULL, NULL, NULL, NULL),
(63, '34', '6', '4', '30', NULL, '0', NULL, NULL),
(64, '34', '5', '31', '49', NULL, '0', NULL, NULL),
(65, '34', '4', NULL, '51', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tenant_production_product_purchases`
--

CREATE TABLE `tenant_production_product_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tenant_production_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bag_quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bag_weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tenant_production_product_purchases`
--

INSERT INTO `tenant_production_product_purchases` (`id`, `tenant_production_id`, `warehouse_id`, `product_id`, `bag_quantity`, `bag_weight`, `rate`, `total_amount`, `created_at`, `updated_at`) VALUES
(1, '28', '10', '5', '30', '50', '1551', '46530', '2022-03-14 04:05:45', '2022-03-14 04:05:45'),
(2, '14', '10', '2', '30', '25', '52', '1560', '2022-03-14 04:09:25', '2022-03-14 04:09:25'),
(3, '18', '10', '2', '10', '75', '10', '100', '2022-03-14 04:20:29', '2022-03-14 04:20:29'),
(4, '29', '10', '2', '50', '72', '50', '2500', NULL, NULL),
(5, '29', '10', '2', '50', '25', '50', '2500', NULL, NULL),
(6, '29', '10', '2', '50', '50', '50', '2500', NULL, NULL),
(7, '29', '10', '2', '50', '75', '50', '2500', NULL, NULL),
(8, '30', '10', '5', '30', '50', '1551', '46530', NULL, NULL),
(9, '31', '10', '5', '30', '50', '1551', '46530', NULL, NULL),
(10, '32', '10', '5', '300', '50', '120', '36000', NULL, NULL),
(11, '33', '10', '5', '200', '50', '30', '6000', NULL, NULL),
(12, '34', '10', '5', '200', '50', '10', '2000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chart_of_account_id` bigint(20) UNSIGNED DEFAULT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `is_opening` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=Yes, 2=No',
  `posted` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Yes, 2=No',
  `approve` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Approve, 2=Reject,3=Pending',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `chart_of_account_id`, `voucher_no`, `voucher_type`, `voucher_date`, `description`, `debit`, `credit`, `is_opening`, `posted`, `approve`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 116, '85CJ6ZHFNV', 'PR Balance', '2022-02-17', 'Supplier debit For rijwan', 500, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-16 21:45:47', NULL),
(2, 17, '85CJ6ZHFNV', 'PR Balance', '2022-02-17', 'Inventory credit For Old sale For rijwan', 0, 500, '2', '1', '1', 'Super Admin', NULL, '2022-02-16 21:45:47', NULL),
(3, 116, '00012', 'Purchase', '2022-02-17', 'Supplier rijwan', 0, 2595, '2', '1', '1', 'Super Admin', NULL, '2022-02-16 21:47:36', '2022-02-17 03:26:57'),
(4, 17, '00012', 'Purchase', '2022-02-17', 'Inventory Debit For Supplier rijwan', 2595, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-16 21:47:36', '2022-02-17 03:26:57'),
(5, 11, '00012', 'Purchase', '2022-02-17', 'Company Credit For Supplier rijwan', 2595, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-16 21:47:36', '2022-02-17 03:26:57'),
(6, 116, '00012', 'Purchase', '2022-02-17', 'Supplier .rijwan', 2595, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-16 21:47:36', '2022-02-17 03:26:57'),
(7, 23, '00012', 'Purchase', '2022-02-17', 'Cash in Hand For Supplier rijwan', 0, 2595, '2', '1', '1', 'Super Admin', NULL, '2022-02-16 21:47:36', '2022-02-17 03:26:57'),
(8, 116, '0085', 'Purchase', '2022-02-17', 'Supplier rijwan', 0, 500, '2', '1', '1', 'Super Admin', NULL, '2022-02-16 22:54:52', '2022-02-17 03:26:36'),
(9, 17, '0085', 'Purchase', '2022-02-17', 'Inventory Debit For Supplier rijwan', 500, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-16 22:54:52', '2022-02-17 03:26:36'),
(10, 11, '0085', 'Purchase', '2022-02-17', 'Company Credit For Supplier rijwan', 500, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-16 22:54:52', '2022-02-17 03:26:36'),
(11, 116, '874596', 'Purchase', '2022-02-17', 'Supplier rijwan', 0, 2583400, '2', '1', '1', 'Super Admin', NULL, '2022-02-17 03:30:32', '2022-02-17 03:30:44'),
(12, 17, '874596', 'Purchase', '2022-02-17', 'Inventory Debit For Supplier rijwan', 2583400, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-17 03:30:32', '2022-02-17 03:30:44'),
(13, 11, '874596', 'Purchase', '2022-02-17', 'Company Credit For Supplier rijwan', 2583400, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-17 03:30:32', '2022-02-17 03:30:44'),
(14, 116, '874596', 'Purchase', '2022-02-17', 'Supplier .rijwan', 2583400, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-17 03:30:32', '2022-02-17 03:30:44'),
(15, 23, '874596', 'Purchase', '2022-02-17', 'Cash in Hand For Supplier rijwan', 0, 2583400, '2', '1', '1', 'Super Admin', NULL, '2022-02-17 03:30:32', '2022-02-17 03:30:44'),
(16, 117, 'U73NPSAMB8', 'Advance', '2022-02-21', 'Customer Advance For rijwan chowdhury', 0, 150, '2', '1', '3', 'Super Admin', NULL, '2022-02-21 00:08:28', NULL),
(17, 23, 'U73NPSAMB8', 'Advance', '2022-02-21', 'Cash in Hand For rijwan chowdhury Advance', 0, 150, '2', '1', '3', 'Super Admin', NULL, '2022-02-21 00:08:28', NULL),
(18, 116, '85214785', 'Purchase', '2022-02-21', 'Supplier rijwan', 0, 4133520, '2', '1', '1', 'Super Admin', NULL, '2022-02-21 00:25:06', '2022-02-21 00:25:22'),
(19, 17, '85214785', 'Purchase', '2022-02-21', 'Inventory Debit For Supplier rijwan', 4133520, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-21 00:25:06', '2022-02-21 00:25:22'),
(20, 11, '85214785', 'Purchase', '2022-02-21', 'Company Credit For Supplier rijwan', 4133520, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-21 00:25:06', '2022-02-21 00:25:22'),
(21, 116, '85214785', 'Purchase', '2022-02-21', 'Supplier .rijwan', 4133520, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-21 00:25:06', '2022-02-21 00:25:22'),
(22, 23, '85214785', 'Purchase', '2022-02-21', 'Cash in Hand For Supplier rijwan', 0, 4133520, '2', '1', '1', 'Super Admin', NULL, '2022-02-21 00:25:06', '2022-02-21 00:25:22'),
(23, 117, '85424', 'INVOICE', '2022-02-21', 'Customer debit For Invoice No -  85424 Customer rijwan chowdhury', 128280000, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-21 00:43:20', NULL),
(24, 8, '85424', 'INVOICE', '2022-02-21', 'Sale Income For Invoice NO - 85424 Customer rijwan chowdhury', 0, 128280000, '2', '1', '2', 'Super Admin', NULL, '2022-02-21 00:43:20', NULL),
(25, 117, '85424', 'INVOICE', '2022-02-21', 'Customer credit for Paid Amount For Customer Invoice NO- 85424 Customer- rijwan chowdhury', 0, 128280000, '2', '1', '2', 'Super Admin', NULL, '2022-02-21 00:43:20', NULL),
(26, 23, '85424', 'INVOICE', '2022-02-21', 'Cash in Hand in Sale for Invoice No - 85424 customer- rijwan chowdhury', 128280000, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-21 00:43:20', NULL),
(27, 116, '852147859', 'Machine Purchase', '2022-02-23', 'Supplier rijwan', 0, 500035, '2', '1', '2', 'Super Admin', NULL, '2022-02-22 22:44:57', NULL),
(28, 17, '852147859', 'Machine Purchase', '2022-02-23', 'Inventory Debit For Supplier rijwan', 500035, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-22 22:44:58', NULL),
(29, 13, '852147859', 'Machine Purchase', '2022-02-23', 'Company Credit For Supplier rijwan', 500035, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-22 22:44:58', NULL),
(30, 116, '852147859', 'Machine Purchase', '2022-02-23', 'Supplier .rijwan', 500035, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-22 22:44:58', '2022-02-22 22:44:58'),
(31, 23, '852147859', 'Machine Purchase', '2022-02-23', 'Cash in Hand For Supplier rijwan', 0, 500035, '2', '1', '2', 'Super Admin', NULL, '2022-02-22 22:44:58', '2022-02-22 22:44:58'),
(32, 14, '7412589645', 'Maintenance Service', '2022-02-23', 'Company Credit For Maintenance Cost ', 0, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-23 00:28:48', NULL),
(33, 23, '7412589645', 'Maintenance Service', '2022-02-23', 'Cash in Hand For Maintenance Cost ', 0, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-23 00:28:48', '2022-02-23 00:28:48'),
(34, 117, 'CR-20220223192', 'CR', '2022-02-23', 'these input is going for test purpose', 0, 150, '2', '1', '1', 'Super Admin', NULL, '2022-02-23 02:28:19', '2022-02-23 02:28:19'),
(35, 23, 'CR-20220223192', 'CR', '2022-02-23', 'Cash In Hand For rijwan chowdhury', 150, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-23 02:28:19', '2022-02-23 02:28:19'),
(38, 120, '5000', 'Bank Transaction', '2022-02-24', 'fasdasdasd', 120000, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-24 04:41:07', '2022-02-24 04:41:07'),
(39, 23, '5000', 'Bank Transaction', '2022-02-24', 'fasdasdasd', 0, 120000, '2', '1', '1', 'Super Admin', NULL, '2022-02-24 04:41:07', '2022-02-24 04:41:07'),
(40, 120, '5000', 'Mobile Bank Transaction', '2022-02-24', 'dfsdfsd', 8633.33, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-24 05:03:46', '2022-02-24 05:03:46'),
(41, 23, '5000', 'Mobile Bank Transaction', '2022-02-24', 'dfsdfsd', 0, 8633.33, '2', '1', '1', 'Super Admin', NULL, '2022-02-24 05:03:46', '2022-02-24 05:03:46'),
(42, 116, 'মেম 123456789', 'Purchase', '2022-02-28', 'Supplier rijwan', 0, 2583.45, '2', '1', '2', 'Super Admin', NULL, '2022-02-28 01:53:38', NULL),
(43, 17, 'মেম 123456789', 'Purchase', '2022-02-28', 'Inventory Debit For Supplier rijwan', 2583.45, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-28 01:53:38', NULL),
(44, 11, 'মেম 123456789', 'Purchase', '2022-02-28', 'Company Credit For Supplier rijwan', 2583.45, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-28 01:53:38', NULL),
(45, 116, 'মেম 123456789', 'Purchase', '2022-02-28', 'Supplier .rijwan', 2583.45, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-28 01:53:38', '2022-02-28 01:53:38'),
(46, 23, 'মেম 123456789', 'Purchase', '2022-02-28', 'Cash in Hand For Supplier rijwan', 0, 2583.45, '2', '1', '2', 'Super Admin', NULL, '2022-02-28 01:53:38', '2022-02-28 01:53:38'),
(47, 116, '7895426', 'Purchase', '2022-02-28', 'Supplier rijwan', 0, 2545, '2', '1', '2', 'Super Admin', NULL, '2022-02-28 02:21:38', NULL),
(48, 17, '7895426', 'Purchase', '2022-02-28', 'Inventory Debit For Supplier rijwan', 2545, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-28 02:21:38', NULL),
(49, 11, '7895426', 'Purchase', '2022-02-28', 'Company Credit For Supplier rijwan', 2545, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-28 02:21:38', NULL),
(50, 116, '7895426', 'Purchase', '2022-02-28', 'Supplier .rijwan', 2545, 0, '2', '1', '2', 'Super Admin', NULL, '2022-02-28 02:21:38', '2022-02-28 02:21:38'),
(51, 23, '7895426', 'Purchase', '2022-02-28', 'Cash in Hand For Supplier rijwan', 0, 2545, '2', '1', '2', 'Super Admin', NULL, '2022-02-28 02:21:38', '2022-02-28 02:21:38'),
(52, 123, '426HASP3V7', 'PR Balance', '2022-02-28', 'Supplier debit For রিজওয়ান', 400, 0, '2', '1', '1', 'Super Admin', 'Super Admin', '2022-02-28 02:26:49', '2022-03-06 00:20:59'),
(53, 17, '426HASP3V7', 'PR Balance', '2022-02-28', 'Inventory credit For Old sale For রিজওয়ান', 0, 400, '2', '1', '1', 'Super Admin', 'Super Admin', '2022-02-28 02:26:49', '2022-03-06 00:20:59'),
(54, 123, '874596325', 'Purchase', '2022-02-28', 'Supplier রিজওয়ান', 0, 2595, '2', '1', '1', 'Super Admin', NULL, '2022-02-28 02:33:32', '2022-03-01 00:27:41'),
(55, 17, '874596325', 'Purchase', '2022-02-28', 'Inventory Debit For Supplier রিজওয়ান', 2595, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-28 02:33:32', '2022-03-01 00:27:41'),
(56, 11, '874596325', 'Purchase', '2022-02-28', 'Company Credit For Supplier রিজওয়ান', 2595, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-28 02:33:32', '2022-03-01 00:27:41'),
(57, 123, '874596325', 'Purchase', '2022-02-28', 'Supplier .রিজওয়ান', 2595, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-28 02:33:32', '2022-03-01 00:27:41'),
(58, 23, '874596325', 'Purchase', '2022-02-28', 'Cash in Hand For Supplier রিজওয়ান', 0, 2595, '2', '1', '1', 'Super Admin', NULL, '2022-02-28 02:33:32', '2022-03-01 00:27:41'),
(59, 124, '78954123658', 'Purchase', '2022-03-01', 'Supplier আরামন রহমান', 0, 225795, '2', '1', '1', 'Super Admin', NULL, '2022-02-28 23:55:15', '2022-03-01 00:01:19'),
(60, 17, '78954123658', 'Purchase', '2022-03-01', 'Inventory Debit For Supplier আরামন রহমান', 225795, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-28 23:55:15', '2022-03-01 00:01:19'),
(61, 11, '78954123658', 'Purchase', '2022-03-01', 'Company Credit For Supplier আরামন রহমান', 225795, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-28 23:55:15', '2022-03-01 00:01:19'),
(62, 124, '78954123658', 'Purchase', '2022-03-01', 'Supplier .আরামন রহমান', 225795, 0, '2', '1', '1', 'Super Admin', NULL, '2022-02-28 23:55:15', '2022-03-01 00:01:19'),
(63, 23, '78954123658', 'Purchase', '2022-03-01', 'Cash in Hand For Supplier আরামন রহমান', 0, 225795, '2', '1', '1', 'Super Admin', NULL, '2022-02-28 23:55:15', '2022-03-01 00:01:19'),
(64, 124, '874521459', 'Purchase', '2022-03-01', 'Supplier আরামন রহমান', 0, 4022580, '2', '1', '1', 'Super Admin', NULL, '2022-03-01 00:30:08', '2022-03-01 00:30:26'),
(65, 17, '874521459', 'Purchase', '2022-03-01', 'Inventory Debit For Supplier আরামন রহমান', 4022580, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-01 00:30:08', '2022-03-01 00:30:26'),
(66, 11, '874521459', 'Purchase', '2022-03-01', 'Company Credit For Supplier আরামন রহমান', 4022580, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-01 00:30:08', '2022-03-01 00:30:26'),
(67, 124, '874521459', 'Purchase', '2022-03-01', 'Supplier .আরামন রহমান', 4022580, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-01 00:30:08', '2022-03-01 00:30:26'),
(68, 23, '874521459', 'Purchase', '2022-03-01', 'Cash in Hand For Supplier আরামন রহমান', 0, 4022580, '2', '1', '1', 'Super Admin', NULL, '2022-03-01 00:30:08', '2022-03-01 00:30:26'),
(77, 127, '7IAXXCFSRT', 'PR Balance', '2022-03-06', 'Labor Head debit For rijwan', 500, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-05 23:20:21', NULL),
(78, 17, '7IAXXCFSRT', 'PR Balance', '2022-03-06', 'Inventory credit For Old sale For rijwan', 0, 500, '2', '1', '1', 'Super Admin', NULL, '2022-03-05 23:20:21', NULL),
(79, 127, 'H44UK8BKJX', 'PR Balance', '2022-03-06', 'Labor Head debit For rijwan', 500, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-06 00:28:47', NULL),
(80, 17, 'H44UK8BKJX', 'PR Balance', '2022-03-06', 'Inventory credit For Old sale For rijwan', 0, 500, '2', '1', '1', 'Super Admin', NULL, '2022-03-06 00:28:47', NULL),
(81, 126, 'DL8EHOW4X6', 'PR Balance', '2022-03-06', 'Labor Head debit For arman', 600, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-06 00:36:35', NULL),
(82, 17, 'DL8EHOW4X6', 'PR Balance', '2022-03-06', 'Inventory credit For Old sale For arman', 0, 600, '2', '1', '1', 'Super Admin', NULL, '2022-03-06 00:36:35', NULL),
(83, 128, '8LO99VTIR6', 'PR Balance', '2022-03-06', 'Labor Head debit For rijwan', 500, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-06 02:06:19', NULL),
(84, 17, '8LO99VTIR6', 'PR Balance', '2022-03-06', 'Inventory credit For Old sale For rijwan', 0, 500, '2', '1', '1', 'Super Admin', NULL, '2022-03-06 02:06:19', NULL),
(85, 129, 'DJHCLWYTZP', 'PR Balance', '2022-03-06', 'Labor Head debit For rijwan', 500, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-06 02:06:57', NULL),
(86, 17, 'DJHCLWYTZP', 'PR Balance', '2022-03-06', 'Inventory credit For Old sale For rijwan', 0, 500, '2', '1', '1', 'Super Admin', NULL, '2022-03-06 02:06:57', NULL),
(87, 130, 'HYLPRS656B', 'PR Balance', '2022-03-06', 'Labor Head debit For rijwan', 5000, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-06 02:09:55', NULL),
(88, 17, 'HYLPRS656B', 'PR Balance', '2022-03-06', 'Inventory credit For Old sale For rijwan', 0, 5000, '2', '1', '1', 'Super Admin', NULL, '2022-03-06 02:09:55', NULL),
(89, 131, '7WZNY1AFEP', 'PR Balance', '2022-03-06', 'Labor Head debit For arman', 5000, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-06 02:10:18', NULL),
(90, 17, '7WZNY1AFEP', 'PR Balance', '2022-03-06', 'Inventory credit For Old sale For arman', 0, 5000, '2', '1', '1', 'Super Admin', NULL, '2022-03-06 02:10:18', NULL),
(91, 132, 'LQVBU43VLU', 'PR Balance', '2022-03-06', 'Labor Head debit For rijwan', 6000, 0, '2', '1', '1', 'Super Admin', 'Super Admin', '2022-03-06 02:13:48', '2022-03-08 04:18:06'),
(92, 17, 'LQVBU43VLU', 'PR Balance', '2022-03-06', 'Inventory credit For Old sale For rijwan', 0, 6000, '2', '1', '1', 'Super Admin', 'Super Admin', '2022-03-06 02:13:48', '2022-03-08 04:18:06'),
(93, 133, '1CJ3DZ7GBI', 'PR Balance', '2022-03-06', 'Labor Head debit For arman', 10000, 0, '2', '1', '1', 'Super Admin', 'Super Admin', '2022-03-06 02:28:38', '2022-03-08 04:17:48'),
(94, 17, '1CJ3DZ7GBI', 'PR Balance', '2022-03-06', 'Inventory credit For Old sale For arman', 0, 10000, '2', '1', '1', 'Super Admin', 'Super Admin', '2022-03-06 02:28:38', '2022-03-08 04:17:48'),
(105, 132, '20220307090306', 'Labor Bill', '2022-03-07', 'Labor Bill158.75tk', 0, 158.75, '2', '1', '1', 'Super Admin', NULL, '2022-03-07 06:33:39', NULL),
(106, 134, '20220307090306', 'Labor Bill', '2022-03-07', 'Labor Bill158.75tk', 158.75, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-07 06:33:39', NULL),
(111, 133, '20220307090409', 'Labor Bill', '2022-03-07', 'Labor Bill142.5tk', 0, 142.5, '2', '1', '1', 'Super Admin', NULL, '2022-03-07 22:04:18', NULL),
(112, 134, '20220307090409', 'Labor Bill', '2022-03-07', 'Labor Bill142.5tk', 142.5, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-07 22:04:18', NULL),
(113, 133, '20220307090409', 'Labor Bill', '2022-03-07', 'Labor Bill142.5tk', 50, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-07 22:04:18', '2022-03-07 22:04:18'),
(114, 23, '20220307090409', 'Labor Bill', '2022-03-07', 'Labor Bill142.5tk', 0, 50, '2', '1', '1', 'Super Admin', NULL, '2022-03-07 22:04:18', '2022-03-07 22:04:18'),
(115, 135, 'GV8UIWQ8V4', 'PR Balance', '2022-03-08', 'Labor Head debit For younusur rahman', 10000, 0, '2', '1', '1', 'Super Admin', 'Super Admin', '2022-03-08 03:22:12', '2022-03-08 04:16:32'),
(116, 17, 'GV8UIWQ8V4', 'PR Balance', '2022-03-08', 'Inventory credit For Old sale For younusur rahman', 0, 10000, '2', '1', '1', 'Super Admin', 'Super Admin', '2022-03-08 03:22:12', '2022-03-08 04:16:32'),
(157, 124, '676543', 'Purchase', '2022-03-20', 'Supplier আরামন রহমান', 0, 95000, '2', '1', '1', 'Super Admin', NULL, '2022-03-20 03:23:32', '2022-03-20 06:01:57'),
(158, 17, '676543', 'Purchase', '2022-03-20', 'Inventory Debit For Supplier আরামন রহমান', 95000, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-20 03:23:32', '2022-03-20 06:01:57'),
(159, 11, '676543', 'Purchase', '2022-03-20', 'Company Credit For Supplier আরামন রহমান', 95000, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-20 03:23:32', '2022-03-20 06:01:57'),
(160, 124, '676543', 'Purchase', '2022-03-20', 'Supplier .আরামন রহমান', 95000, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-20 03:23:32', '2022-03-20 06:01:57'),
(161, 23, '676543', 'Purchase', '2022-03-20', 'Cash in Hand For Supplier আরামন রহমান', 0, 95000, '2', '1', '1', 'Super Admin', NULL, '2022-03-20 03:23:32', '2022-03-20 06:01:57'),
(162, 123, '465765', 'Purchase', '2022-03-20', 'Supplier রিজওয়ান', 0, 1000000, '2', '1', '1', 'Super Admin', NULL, '2022-03-20 04:22:18', '2022-03-20 06:02:05'),
(163, 17, '465765', 'Purchase', '2022-03-20', 'Inventory Debit For Supplier রিজওয়ান', 1000000, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-20 04:22:18', '2022-03-20 06:02:05'),
(164, 11, '465765', 'Purchase', '2022-03-20', 'Company Credit For Supplier রিজওয়ান', 1000000, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-20 04:22:18', '2022-03-20 06:02:05'),
(165, 123, '465765', 'Purchase', '2022-03-20', 'Supplier .রিজওয়ান', 1000000, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-20 04:22:18', '2022-03-20 06:02:05'),
(166, 121, '465765', 'Purchase', '2022-03-20', 'Paid amount for Supplier  রিজওয়ান', 0, 1000000, '2', '1', '1', 'Super Admin', NULL, '2022-03-20 04:22:18', '2022-03-20 06:02:05'),
(167, 123, '541236589', 'Purchase', '2022-03-21', 'Supplier রিজওয়ান', 0, 1000000, '2', '1', '2', 'Super Admin', NULL, '2022-03-20 22:56:31', NULL),
(168, 17, '541236589', 'Purchase', '2022-03-21', 'Inventory Debit For Supplier রিজওয়ান', 1000000, 0, '2', '1', '2', 'Super Admin', NULL, '2022-03-20 22:56:31', NULL),
(169, 11, '541236589', 'Purchase', '2022-03-21', 'Company Credit For Supplier রিজওয়ান', 1000000, 0, '2', '1', '2', 'Super Admin', NULL, '2022-03-20 22:56:31', NULL),
(170, 123, '541236589', 'Purchase', '2022-03-21', 'Supplier .রিজওয়ান', 1000000, 0, '2', '1', '2', 'Super Admin', NULL, '2022-03-20 22:56:31', '2022-03-20 22:56:31'),
(171, 23, '541236589', 'Purchase', '2022-03-21', 'Cash in Hand For Supplier রিজওয়ান', 0, 1000000, '2', '1', '2', 'Super Admin', NULL, '2022-03-20 22:56:31', '2022-03-20 22:56:31'),
(172, 117, '7895564', 'INVOICE', '2022-03-21', 'Customer debit For Invoice No -  7895564 Customer rijwan chowdhury', 2750000, 0, '2', '1', '2', 'Super Admin', NULL, '2022-03-20 22:58:51', NULL),
(173, 8, '7895564', 'INVOICE', '2022-03-21', 'Sale Income For Invoice NO - 7895564 Customer rijwan chowdhury', 0, 2750000, '2', '1', '2', 'Super Admin', NULL, '2022-03-20 22:58:51', NULL),
(174, 117, '7895564', 'INVOICE', '2022-03-21', 'Customer credit for Paid Amount For Customer Invoice NO- 7895564 Customer- rijwan chowdhury', 0, 2749850, '2', '1', '2', 'Super Admin', NULL, '2022-03-20 22:58:51', NULL),
(175, 23, '7895564', 'INVOICE', '2022-03-21', 'Cash in Hand in Sale for Invoice No - 7895564 customer- rijwan chowdhury', 2749850, 0, '2', '1', '2', 'Super Admin', NULL, '2022-03-20 22:58:51', NULL),
(176, 149, '202203210500302', 'Tenant Receivable', '2022-03-21', 'Tenant debit For Receipt No -  202203210500302 Tenant arif', 39654, 0, '2', '1', '2', 'Super Admin', NULL, '2022-03-20 23:03:57', NULL),
(177, 149, '202203210500302', 'Tenant Receivable', '2022-03-21', 'Tenant Credit For Paid Amount For Tenant Receipt NO- 202203210500302 Tenant- arif', 0, 50000, '2', '1', '2', 'Super Admin', NULL, '2022-03-20 23:03:57', NULL),
(178, 23, '202203210500302', 'Tenant Receivable', '2022-03-21', 'Cash in Hand in Service for Invoice No - 202203210500302 Tenant- arif', 50000, 0, '2', '1', '2', 'Super Admin', NULL, '2022-03-20 23:03:57', NULL),
(179, 116, 'PL-20220321366', 'PL', '2022-03-21', 'these out is going for test purpose', 5000, 0, '2', '1', '2', 'Super Admin', NULL, '2022-03-21 04:26:37', NULL),
(180, 23, 'PL-20220321366', 'PL', '2022-03-21', 'Credit Loan Voucher From Cash In Hand', 0, 5000, '2', '1', '2', 'Super Admin', NULL, '2022-03-21 04:26:37', NULL),
(181, 154, 'EXP-2022032110401', 'Expense', '2022-03-21', 'বিদ্যুৎ বিল Expense EXP-2022032110401', 500, 0, '2', '1', '3', 'Super Admin', NULL, '2022-03-21 04:46:46', NULL),
(182, 23, 'EXP-2022032110401', 'Expense', '2022-03-21', 'বিদ্যুৎ বিল Expense EXP-2022032110401', 0, 500, '2', '1', '3', 'Super Admin', NULL, '2022-03-21 04:46:46', NULL),
(183, 147, '202203210506441', 'Tenant Receivable', '2022-03-21', 'Tenant debit For Receipt No -  202203210506441 Tenant ismail', 8718.5, 0, '2', '1', '2', 'Super Admin', NULL, '2022-03-21 04:53:03', NULL),
(184, 147, '202203210506441', 'Tenant Receivable', '2022-03-21', 'Tenant Credit For Paid Amount For Tenant Receipt NO- 202203210506441 Tenant- ismail', 0, 90000, '2', '1', '2', 'Super Admin', NULL, '2022-03-21 04:53:03', NULL),
(185, 23, '202203210506441', 'Tenant Receivable', '2022-03-21', 'Cash in Hand in Service for Invoice No - 202203210506441 Tenant- ismail', 90000, 0, '2', '1', '2', 'Super Admin', NULL, '2022-03-21 04:53:03', NULL),
(186, 133, '20220321105322', 'Labor Bill', '2022-03-21', 'Labor Bill950tk', 0, 950, '2', '1', '1', 'Super Admin', NULL, '2022-03-21 04:54:10', NULL),
(187, 134, '20220321105322', 'Labor Bill', '2022-03-21', 'Labor Bill950tk', 950, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-21 04:54:10', NULL),
(188, 133, '20220321105322', 'Labor Bill', '2022-03-21', 'Labor Bill950tk', 10000, 0, '2', '1', '1', 'Super Admin', NULL, '2022-03-21 04:54:10', '2022-03-21 04:54:10'),
(189, 23, '20220321105322', 'Labor Bill', '2022-03-21', 'Labor Bill950tk', 0, 10000, '2', '1', '1', 'Super Admin', NULL, '2022-03-21 04:54:10', '2022-03-21 04:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `transports`
--

CREATE TABLE `transports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `voucher_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `voucher_date` date NOT NULL,
  `truck_id` bigint(20) UNSIGNED NOT NULL,
  `driver_id` bigint(20) UNSIGNED NOT NULL,
  `starting_point_meter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `return_point_meter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `per_kilo_oil_cost` double DEFAULT NULL,
  `starting_date_time` datetime DEFAULT NULL,
  `return_date_time` datetime DEFAULT NULL,
  `total_income` double DEFAULT NULL,
  `total_expense` double DEFAULT NULL,
  `net_profit` double DEFAULT NULL,
  `net_income` double DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3' COMMENT '1=Approved,2=Rejected,3=Pending',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transports`
--

INSERT INTO `transports` (`id`, `voucher_no`, `voucher_date`, `truck_id`, `driver_id`, `starting_point_meter`, `return_point_meter`, `per_kilo_oil_cost`, `starting_date_time`, `return_date_time`, `total_income`, `total_expense`, `net_profit`, `net_income`, `note`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'TRANS-2022022111175', '2022-02-21', 1, 1, NULL, '20', 250, '2022-02-21 11:59:35', '2022-02-21 11:59:35', 1200, 200, 1000, NULL, NULL, '3', 'Super Admin', NULL, '2022-02-21 06:01:37', '2022-02-21 06:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `transport_details`
--

CREATE TABLE `transport_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transport_id` bigint(20) UNSIGNED NOT NULL,
  `income_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `income_value` double NOT NULL,
  `expense_category_id` bigint(20) UNSIGNED NOT NULL,
  `expense_value` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transport_details`
--

INSERT INTO `transport_details` (`id`, `transport_id`, `income_name`, `income_value`, `expense_category_id`, `expense_value`, `created_at`, `updated_at`) VALUES
(1, 1, 'T1', 200, 0, 200, '2022-02-21 06:01:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transport_expense_category`
--

CREATE TABLE `transport_expense_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transport_expense_category`
--

INSERT INTO `transport_expense_category` (`id`, `name`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'salary', '1', 'Super Admin', NULL, '2022-02-21 05:38:22', '2022-02-21 05:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `trucks`
--

CREATE TABLE `trucks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `truck_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trucks`
--

INSERT INTO `trucks` (`id`, `truck_no`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, '5632365', '1', 'Super Admin', NULL, '2022-02-21 04:59:42', '2022-02-21 04:59:42');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unit_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `base_unit` int(10) UNSIGNED DEFAULT NULL,
  `operator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '*',
  `operation_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_code`, `unit_name`, `base_unit`, `operator`, `operation_value`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Kg', 'Kilogram', NULL, '*', '1', '1', 'Super Admin', NULL, '2021-03-27 03:27:57', '2021-03-27 03:27:57'),
(7, '25Kg', '25Kg', NULL, '*', '1', '1', 'Super Admin', 'Super Admin', '2021-03-27 03:41:37', '2021-03-27 03:42:15'),
(8, '30Kg', '30Kg', NULL, '*', '1', '1', 'Super Admin', NULL, '2021-03-27 03:41:51', '2021-03-27 03:41:51'),
(9, '50Kg', '50Kg', NULL, '*', '1', '1', 'Super Admin', NULL, '2021-03-27 03:42:33', '2021-03-27 03:42:33'),
(10, '60Kg', '60Kg', NULL, '*', '1', '1', 'Super Admin', NULL, '2021-03-27 03:42:48', '2021-03-27 03:42:48'),
(11, '71Kg', '71Kg', NULL, '*', '1', '1', 'Super Admin', 'Super Admin', '2021-03-27 03:43:12', '2021-04-04 02:35:19'),
(12, '75Kg', '75Kg', NULL, '*', '1', '1', 'Super Admin', 'Super Admin', '2021-03-27 03:43:38', '2021-04-04 02:35:09'),
(13, 'N/A', 'N/A', NULL, '*', '1', '1', 'Super Admin', NULL, '2021-04-04 02:31:08', '2021-04-04 02:31:08'),
(14, 'কেজি', 'কিলোগ্রাম', NULL, '*', '1', '1', 'Super Admin', NULL, '2022-02-28 02:18:49', '2022-02-28 02:18:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1=Male,2=Female,3=Other',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `username`, `email`, `phone`, `avatar`, `gender`, `password`, `status`, `deletable`, `created_by`, `modified_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super Admin', 'SuperAdmin', 'superadmin@mail.com', '01521225987', NULL, '1', '$2y$10$oyBQnkvC8WZEQffhpEEsyeZPPqXEHmpaErfi62fsfyAw.UMwIzS/m', '1', '1', NULL, NULL, 'XcB5yzF7nLG5nSLb1GqvrqcRtr6LFZe7NaO342c7xFEr46AT5C3YMOAePWVk', '2021-03-26 23:49:24', '2021-03-26 23:49:24'),
(2, 2, 'Admin', 'Admin', 'admin@mail.com', '01711154960', 'B041BD6A-9488-4A61-B7BF-FDBF1B12613B-672700-543843.jpeg', '1', '$2y$10$KF7BIkSLDeOwTMgh6KtAVOrUOGfKQjWxDqXOO7UmR2Lpdrh1C9IKC', '1', '1', 'Admin', NULL, 'zCHzFg9B2YAfI95sHl2UIx3Wrq5nFt3HkOAddlpQ7Ed4Eg8GtaDriO0KcZLH', '2021-03-26 23:49:24', '2021-06-13 04:21:19');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modified_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `phone`, `email`, `address`, `status`, `deletable`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Warehouse 1 [ Rice ]', NULL, NULL, NULL, '1', '1', 'Admin', 'Admin', '2021-04-11 11:18:33', '2021-04-11 11:27:20'),
(2, 'Warehouse 2 [ By product ]', NULL, NULL, NULL, '1', '1', 'Admin', 'Admin', '2021-04-11 11:20:15', '2021-04-11 11:26:59'),
(10, 'কুষ্টিয়া গুদাম', '01986348224', 'কুষ্টিয়া@জিমেইল.কম', 'কুষ্টিয়া', '1', '1', 'Super Admin', NULL, '2022-02-28 23:30:58', '2022-02-28 23:30:58');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_material`
--

CREATE TABLE `warehouse_material` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_material`
--

INSERT INTO `warehouse_material` (`id`, `warehouse_id`, `material_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 1, 18, 10255.00, '2022-02-17 03:26:36', '2022-03-01 22:56:12'),
(2, 10, 20, 92000.00, '2022-03-01 00:01:19', '2022-03-01 03:19:02'),
(3, 1, 19, 5.00, '2022-03-01 00:27:41', '2022-03-01 00:27:41'),
(4, 10, 3, 6500.00, '2022-03-20 06:01:57', '2022-03-21 04:40:01');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_product`
--

CREATE TABLE `warehouse_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_product`
--

INSERT INTO `warehouse_product` (`id`, `warehouse_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(1, 10, 2, 15610, '2022-03-01 04:19:22', '2022-03-14 04:40:42'),
(2, 10, 3, 1500, '2022-03-14 04:05:45', '2022-03-14 04:05:45'),
(3, 10, 2, 1500, '2022-03-15 22:37:40', '2022-03-15 22:37:40'),
(4, 10, 2, 1500, '2022-03-15 22:54:10', '2022-03-15 22:54:10'),
(5, 10, 1, 15000, '2022-03-19 11:24:56', '2022-03-19 11:24:56'),
(6, 10, 2, 10000, '2022-03-20 23:03:57', '2022-03-20 23:03:57'),
(7, 10, 2, 10000, '2022-03-21 04:53:03', '2022-03-21 04:53:03');

-- --------------------------------------------------------

--
-- Table structure for table `weekly_holiday_assigns`
--

CREATE TABLE `weekly_holiday_assigns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `weekly_holiday_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1=Active, 2=Inactive, 3=Cancel',
  `deletable` enum('1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2' COMMENT '1=No, 2=Yes',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allowance_deductions`
--
ALTER TABLE `allowance_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allowance_deduction_manages`
--
ALTER TABLE `allowance_deduction_manages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `allowance_deduction_manages_allowance_deduction_id_foreign` (`allowance_deduction_id`),
  ADD KEY `allowance_deduction_manages_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assets_tag_unique` (`tag`),
  ADD KEY `assets_asset_type_id_foreign` (`asset_type_id`);

--
-- Indexes for table `asset_types`
--
ALTER TABLE `asset_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_types_name_unique` (`name`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `bags`
--
ALTER TABLE `bags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banks_account_number_unique` (`account_number`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chart_of_accounts_code_unique` (`code`),
  ADD KEY `chart_of_accounts_customer_id_foreign` (`customer_id`),
  ADD KEY `chart_of_accounts_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_groups_group_name_unique` (`group_name`);

--
-- Indexes for table `daily_closings`
--
ALTER TABLE `daily_closings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departments_name_unique` (`name`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `designations_name_unique` (`name`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `divisions_name_unique` (`name`),
  ADD KEY `divisions_department_id_foreign` (`department_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `drivers_mobile_unique` (`mobile`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_phone_unique` (`phone`),
  ADD UNIQUE KEY `employees_employee_id_unique` (`employee_id`),
  ADD UNIQUE KEY `employees_finger_id_unique` (`finger_id`),
  ADD KEY `employees_shift_id_foreign` (`shift_id`),
  ADD KEY `employees_department_id_foreign` (`department_id`),
  ADD KEY `employees_division_id_foreign` (`division_id`),
  ADD KEY `employees_joining_designation_id_foreign` (`joining_designation_id`),
  ADD KEY `employees_current_designation_id_foreign` (`current_designation_id`);

--
-- Indexes for table `employee_education`
--
ALTER TABLE `employee_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_education_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `employee_professional_information`
--
ALTER TABLE `employee_professional_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_professional_information_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expenses_voucher_no_unique` (`voucher_no`),
  ADD KEY `expenses_expense_item_id_foreign` (`expense_item_id`),
  ADD KEY `expenses_account_id_foreign` (`account_id`);

--
-- Indexes for table `expense_items`
--
ALTER TABLE `expense_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `expense_items_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labor_bills`
--
ALTER TABLE `labor_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `labor_bills_name_unique` (`name`);

--
-- Indexes for table `labor_bill_rates`
--
ALTER TABLE `labor_bill_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `labor_bill_rates_labor_bill_id_foreign` (`labor_bill_id`),
  ADD KEY `labor_bill_rates_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `labor_heads`
--
ALTER TABLE `labor_heads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `labor_heads_mobile_unique` (`mobile`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_application_manages`
--
ALTER TABLE `leave_application_manages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_application_manages_leave_id_foreign` (`leave_id`),
  ADD KEY `leave_application_manages_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loans_employee_id_foreign` (`employee_id`),
  ADD KEY `loans_person_id_foreign` (`person_id`),
  ADD KEY `loans_account_id_foreign` (`account_id`);

--
-- Indexes for table `loan_installments`
--
ALTER TABLE `loan_installments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_installments_loan_id_foreign` (`loan_id`),
  ADD KEY `loan_installments_employee_id_foreign` (`employee_id`),
  ADD KEY `loan_installments_person_id_foreign` (`person_id`),
  ADD KEY `loan_installments_account_id_foreign` (`account_id`);

--
-- Indexes for table `loan_people`
--
ALTER TABLE `loan_people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loan_people_name_unique` (`name`);

--
-- Indexes for table `machine_purchases`
--
ALTER TABLE `machine_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `machine_purchases_purchase_id_foreign` (`purchase_id`),
  ADD KEY `machine_purchases_machine_id_foreign` (`machine_id`),
  ADD KEY `machine_purchases_purchase_category_id_foreign` (`purchase_category_id`),
  ADD KEY `machine_purchases_purchase_unit_id_foreign` (`purchase_unit_id`);

--
-- Indexes for table `machine_services`
--
ALTER TABLE `machine_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `machine_services_service_id_foreign` (`service_id`),
  ADD KEY `machine_services_machine_id_foreign` (`machine_id`),
  ADD KEY `machine_services_service_category_id_foreign` (`service_category_id`),
  ADD KEY `machine_services_service_unit_id_foreign` (`service_unit_id`);

--
-- Indexes for table `maintenance_categories`
--
ALTER TABLE `maintenance_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maintenance_machines`
--
ALTER TABLE `maintenance_machines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `maintenance_machines_machine_code_unique` (`machine_code`),
  ADD KEY `maintenance_machines_category_id_foreign` (`category_id`),
  ADD KEY `maintenance_machines_unit_id_foreign` (`unit_id`),
  ADD KEY `maintenance_machines_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `maintenance_purchases`
--
ALTER TABLE `maintenance_purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `maintenance_purchases_memo_no_unique` (`memo_no`),
  ADD KEY `maintenance_purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `maintenance_purchase_payments`
--
ALTER TABLE `maintenance_purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `maintenance_purchase_payments_purchase_id_foreign` (`purchase_id`),
  ADD KEY `maintenance_purchase_payments_account_id_foreign` (`account_id`),
  ADD KEY `maintenance_purchase_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `maintenance_purchase_payments_supplier_transaction_id_foreign` (`supplier_transaction_id`);

--
-- Indexes for table `maintenance_services`
--
ALTER TABLE `maintenance_services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `maintenance_services_memo_no_unique` (`memo_no`);

--
-- Indexes for table `maintenance_service_payments`
--
ALTER TABLE `maintenance_service_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `maintenance_service_payments_service_id_foreign` (`service_id`),
  ADD KEY `maintenance_service_payments_account_id_foreign` (`account_id`),
  ADD KEY `maintenance_service_payments_transaction_id_foreign` (`transaction_id`);

--
-- Indexes for table `maintenance_units`
--
ALTER TABLE `maintenance_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `materials_material_code_unique` (`material_code`),
  ADD KEY `materials_unit_id_foreign` (`unit_id`),
  ADD KEY `materials_purchase_unit_id_foreign` (`purchase_unit_id`),
  ADD KEY `materials_tax_id_foreign` (`tax_id`),
  ADD KEY `materials_opening_warehouse_id_foreign` (`opening_warehouse_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_menu_name_unique` (`menu_name`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mobile_banks`
--
ALTER TABLE `mobile_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modules_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `module_role`
--
ALTER TABLE `module_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_role_module_id_foreign` (`module_id`),
  ADD KEY `module_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `other_labor_bills`
--
ALTER TABLE `other_labor_bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `other_labor_bills_voucher_no_unique` (`voucher_no`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `productions`
--
ALTER TABLE `productions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `productions_serial_no_unique` (`serial_no`),
  ADD KEY `productions_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `productions_product_id_foreign` (`product_id`);

--
-- Indexes for table `production_bag_costs`
--
ALTER TABLE `production_bag_costs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_bag_costs_production_id_foreign` (`production_id`),
  ADD KEY `production_bag_costs_bag_id_foreign` (`bag_id`);

--
-- Indexes for table `production_materials`
--
ALTER TABLE `production_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_materials_production_id_foreign` (`production_id`),
  ADD KEY `production_materials_material_id_foreign` (`material_id`),
  ADD KEY `production_materials_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `production_materials_unit_id_foreign` (`unit_id`),
  ADD KEY `production_materials_bag_id_foreign` (`bag_id`);

--
-- Indexes for table `production_milling_costs`
--
ALTER TABLE `production_milling_costs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_milling_costs_production_id_foreign` (`production_id`);

--
-- Indexes for table `production_other_products`
--
ALTER TABLE `production_other_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_other_products_production_id_foreign` (`production_id`),
  ADD KEY `production_other_products_product_id_foreign` (`product_id`),
  ADD KEY `production_other_products_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_unit_id_foreign` (`unit_id`),
  ADD KEY `products_sale_unit_id_foreign` (`sale_unit_id`),
  ADD KEY `products_tax_id_foreign` (`tax_id`),
  ADD KEY `products_opening_warehouse_id_foreign` (`opening_warehouse_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchases_memo_no_unique` (`memo_no`),
  ADD KEY `purchases_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_materials`
--
ALTER TABLE `purchase_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_materials_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_materials_material_id_foreign` (`material_id`),
  ADD KEY `purchase_materials_purchase_unit_id_foreign` (`purchase_unit_id`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_payments_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_payments_account_id_foreign` (`account_id`),
  ADD KEY `purchase_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_payments_supplier_debit_transaction_id_foreign` (`supplier_debit_transaction_id`);

--
-- Indexes for table `rateables`
--
ALTER TABLE `rateables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rateables_rateable_type_rateable_id_index` (`rateable_type`,`rateable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_role_name_unique` (`role_name`);

--
-- Indexes for table `salary_generates`
--
ALTER TABLE `salary_generates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `salary_generates_voucher_no_unique` (`voucher_no`),
  ADD KEY `salary_generates_employee_id_foreign` (`employee_id`),
  ADD KEY `salary_generates_designation_id_foreign` (`designation_id`),
  ADD KEY `salary_generates_department_id_foreign` (`department_id`),
  ADD KEY `salary_generates_division_id_foreign` (`division_id`);

--
-- Indexes for table `salary_generate_payments`
--
ALTER TABLE `salary_generate_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_generate_payments_salary_generated_id_foreign` (`salary_generated_id`),
  ADD KEY `salary_generate_payments_account_id_foreign` (`account_id`),
  ADD KEY `salary_generate_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `salary_generate_payments_employee_transaction_id_foreign` (`employee_transaction_id`);

--
-- Indexes for table `salary_incements`
--
ALTER TABLE `salary_incements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_incements_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_invoice_no_unique` (`invoice_no`),
  ADD KEY `sales_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `sales_customer_id_foreign` (`customer_id`),
  ADD KEY `sales_account_id_foreign` (`account_id`);

--
-- Indexes for table `sale_products`
--
ALTER TABLE `sale_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_products_sale_id_foreign` (`sale_id`),
  ADD KEY `sale_products_product_id_foreign` (`product_id`),
  ADD KEY `sale_products_sale_unit_id_foreign` (`sale_unit_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_unique` (`name`);

--
-- Indexes for table `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shift_manages`
--
ALTER TABLE `shift_manages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shift_manages_shift_id_foreign` (`shift_id`),
  ADD KEY `shift_manages_employee_id_foreign` (`employee_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taxes_name_unique` (`name`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tenants_mobile_unique` (`mobile`);

--
-- Indexes for table `tenant_productions`
--
ALTER TABLE `tenant_productions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tenant_productions_receipt_no_unique` (`receipt_no`);

--
-- Indexes for table `tenant_production_materials`
--
ALTER TABLE `tenant_production_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenant_production_products`
--
ALTER TABLE `tenant_production_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenant_production_product_deliveries`
--
ALTER TABLE `tenant_production_product_deliveries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tenant_production_product_purchases`
--
ALTER TABLE `tenant_production_product_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_chart_of_account_id_foreign` (`chart_of_account_id`);

--
-- Indexes for table `transports`
--
ALTER TABLE `transports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transports_voucher_no_unique` (`voucher_no`),
  ADD KEY `transports_truck_id_foreign` (`truck_id`),
  ADD KEY `transports_driver_id_foreign` (`driver_id`);

--
-- Indexes for table `transport_details`
--
ALTER TABLE `transport_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transport_details_transport_id_foreign` (`transport_id`),
  ADD KEY `transport_details_expense_category_id_foreign` (`expense_category_id`);

--
-- Indexes for table `transport_expense_category`
--
ALTER TABLE `transport_expense_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transport_expense_category_name_unique` (`name`);

--
-- Indexes for table `trucks`
--
ALTER TABLE `trucks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trucks_truck_no_unique` (`truck_no`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouses_name_unique` (`name`);

--
-- Indexes for table `warehouse_material`
--
ALTER TABLE `warehouse_material`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_material_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `warehouse_material_material_id_foreign` (`material_id`);

--
-- Indexes for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouse_product_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `warehouse_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `weekly_holiday_assigns`
--
ALTER TABLE `weekly_holiday_assigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weekly_holiday_assigns_employee_id_foreign` (`employee_id`),
  ADD KEY `weekly_holiday_assigns_weekly_holiday_id_foreign` (`weekly_holiday_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allowance_deductions`
--
ALTER TABLE `allowance_deductions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `allowance_deduction_manages`
--
ALTER TABLE `allowance_deduction_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_types`
--
ALTER TABLE `asset_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bags`
--
ALTER TABLE `bags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `daily_closings`
--
ALTER TABLE `daily_closings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee_education`
--
ALTER TABLE `employee_education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_professional_information`
--
ALTER TABLE `employee_professional_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_items`
--
ALTER TABLE `expense_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `labor_bills`
--
ALTER TABLE `labor_bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `labor_bill_rates`
--
ALTER TABLE `labor_bill_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `labor_heads`
--
ALTER TABLE `labor_heads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `leave_application_manages`
--
ALTER TABLE `leave_application_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loan_installments`
--
ALTER TABLE `loan_installments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_people`
--
ALTER TABLE `loan_people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `machine_purchases`
--
ALTER TABLE `machine_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `machine_services`
--
ALTER TABLE `machine_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maintenance_categories`
--
ALTER TABLE `maintenance_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `maintenance_machines`
--
ALTER TABLE `maintenance_machines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maintenance_purchases`
--
ALTER TABLE `maintenance_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maintenance_purchase_payments`
--
ALTER TABLE `maintenance_purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maintenance_services`
--
ALTER TABLE `maintenance_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maintenance_service_payments`
--
ALTER TABLE `maintenance_service_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `maintenance_units`
--
ALTER TABLE `maintenance_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `mobile_banks`
--
ALTER TABLE `mobile_banks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `module_role`
--
ALTER TABLE `module_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=290;

--
-- AUTO_INCREMENT for table `other_labor_bills`
--
ALTER TABLE `other_labor_bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=556;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=784;

--
-- AUTO_INCREMENT for table `productions`
--
ALTER TABLE `productions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `production_bag_costs`
--
ALTER TABLE `production_bag_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `production_materials`
--
ALTER TABLE `production_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `production_milling_costs`
--
ALTER TABLE `production_milling_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `production_other_products`
--
ALTER TABLE `production_other_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `purchase_materials`
--
ALTER TABLE `purchase_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `rateables`
--
ALTER TABLE `rateables`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salary_generates`
--
ALTER TABLE `salary_generates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salary_generate_payments`
--
ALTER TABLE `salary_generate_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salary_incements`
--
ALTER TABLE `salary_incements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sale_products`
--
ALTER TABLE `sale_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shift_manages`
--
ALTER TABLE `shift_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tenant_productions`
--
ALTER TABLE `tenant_productions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tenant_production_materials`
--
ALTER TABLE `tenant_production_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `tenant_production_products`
--
ALTER TABLE `tenant_production_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tenant_production_product_deliveries`
--
ALTER TABLE `tenant_production_product_deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `tenant_production_product_purchases`
--
ALTER TABLE `tenant_production_product_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;

--
-- AUTO_INCREMENT for table `transports`
--
ALTER TABLE `transports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transport_details`
--
ALTER TABLE `transport_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transport_expense_category`
--
ALTER TABLE `transport_expense_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trucks`
--
ALTER TABLE `trucks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `warehouse_material`
--
ALTER TABLE `warehouse_material`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `weekly_holiday_assigns`
--
ALTER TABLE `weekly_holiday_assigns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allowance_deduction_manages`
--
ALTER TABLE `allowance_deduction_manages`
  ADD CONSTRAINT `allowance_deduction_manages_allowance_deduction_id_foreign` FOREIGN KEY (`allowance_deduction_id`) REFERENCES `allowance_deductions` (`id`),
  ADD CONSTRAINT `allowance_deduction_manages_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `assets_asset_type_id_foreign` FOREIGN KEY (`asset_type_id`) REFERENCES `asset_types` (`id`);

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD CONSTRAINT `chart_of_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `chart_of_accounts_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`);

--
-- Constraints for table `divisions`
--
ALTER TABLE `divisions`
  ADD CONSTRAINT `divisions_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_current_designation_id_foreign` FOREIGN KEY (`current_designation_id`) REFERENCES `designations` (`id`),
  ADD CONSTRAINT `employees_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `employees_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`id`),
  ADD CONSTRAINT `employees_joining_designation_id_foreign` FOREIGN KEY (`joining_designation_id`) REFERENCES `designations` (`id`),
  ADD CONSTRAINT `employees_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`);

--
-- Constraints for table `employee_education`
--
ALTER TABLE `employee_education`
  ADD CONSTRAINT `employee_education_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `employee_professional_information`
--
ALTER TABLE `employee_professional_information`
  ADD CONSTRAINT `employee_professional_information_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `expenses_expense_item_id_foreign` FOREIGN KEY (`expense_item_id`) REFERENCES `expense_items` (`id`);

--
-- Constraints for table `labor_bill_rates`
--
ALTER TABLE `labor_bill_rates`
  ADD CONSTRAINT `labor_bill_rates_labor_bill_id_foreign` FOREIGN KEY (`labor_bill_id`) REFERENCES `labor_bills` (`id`),
  ADD CONSTRAINT `labor_bill_rates_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `leave_application_manages`
--
ALTER TABLE `leave_application_manages`
  ADD CONSTRAINT `leave_application_manages_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `leave_application_manages_leave_id_foreign` FOREIGN KEY (`leave_id`) REFERENCES `leaves` (`id`);

--
-- Constraints for table `machine_purchases`
--
ALTER TABLE `machine_purchases`
  ADD CONSTRAINT `machine_purchases_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `maintenance_machines` (`id`),
  ADD CONSTRAINT `machine_purchases_purchase_category_id_foreign` FOREIGN KEY (`purchase_category_id`) REFERENCES `maintenance_categories` (`id`),
  ADD CONSTRAINT `machine_purchases_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `maintenance_purchases` (`id`),
  ADD CONSTRAINT `machine_purchases_purchase_unit_id_foreign` FOREIGN KEY (`purchase_unit_id`) REFERENCES `maintenance_units` (`id`);

--
-- Constraints for table `machine_services`
--
ALTER TABLE `machine_services`
  ADD CONSTRAINT `machine_services_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `maintenance_machines` (`id`),
  ADD CONSTRAINT `machine_services_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `maintenance_categories` (`id`),
  ADD CONSTRAINT `machine_services_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `maintenance_services` (`id`),
  ADD CONSTRAINT `machine_services_service_unit_id_foreign` FOREIGN KEY (`service_unit_id`) REFERENCES `maintenance_units` (`id`);

--
-- Constraints for table `maintenance_machines`
--
ALTER TABLE `maintenance_machines`
  ADD CONSTRAINT `maintenance_machines_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `maintenance_categories` (`id`),
  ADD CONSTRAINT `maintenance_machines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`),
  ADD CONSTRAINT `maintenance_machines_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `maintenance_units` (`id`);

--
-- Constraints for table `maintenance_purchases`
--
ALTER TABLE `maintenance_purchases`
  ADD CONSTRAINT `maintenance_purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `maintenance_purchase_payments`
--
ALTER TABLE `maintenance_purchase_payments`
  ADD CONSTRAINT `maintenance_purchase_payments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `maintenance_purchase_payments_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `maintenance_purchases` (`id`),
  ADD CONSTRAINT `maintenance_purchase_payments_supplier_transaction_id_foreign` FOREIGN KEY (`supplier_transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `maintenance_purchase_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`);

--
-- Constraints for table `maintenance_service_payments`
--
ALTER TABLE `maintenance_service_payments`
  ADD CONSTRAINT `maintenance_service_payments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `maintenance_service_payments_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `maintenance_services` (`id`),
  ADD CONSTRAINT `maintenance_service_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`);

--
-- Constraints for table `materials`
--
ALTER TABLE `materials`
  ADD CONSTRAINT `materials_opening_warehouse_id_foreign` FOREIGN KEY (`opening_warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `materials_purchase_unit_id_foreign` FOREIGN KEY (`purchase_unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `materials_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`),
  ADD CONSTRAINT `materials_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `modules`
--
ALTER TABLE `modules`
  ADD CONSTRAINT `modules_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Constraints for table `module_role`
--
ALTER TABLE `module_role`
  ADD CONSTRAINT `module_role_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`),
  ADD CONSTRAINT `module_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`);

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `productions`
--
ALTER TABLE `productions`
  ADD CONSTRAINT `productions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `productions_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `production_bag_costs`
--
ALTER TABLE `production_bag_costs`
  ADD CONSTRAINT `production_bag_costs_bag_id_foreign` FOREIGN KEY (`bag_id`) REFERENCES `bags` (`id`),
  ADD CONSTRAINT `production_bag_costs_production_id_foreign` FOREIGN KEY (`production_id`) REFERENCES `productions` (`id`);

--
-- Constraints for table `production_materials`
--
ALTER TABLE `production_materials`
  ADD CONSTRAINT `production_materials_bag_id_foreign` FOREIGN KEY (`bag_id`) REFERENCES `bags` (`id`),
  ADD CONSTRAINT `production_materials_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `production_materials_production_id_foreign` FOREIGN KEY (`production_id`) REFERENCES `productions` (`id`),
  ADD CONSTRAINT `production_materials_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `production_materials_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `production_milling_costs`
--
ALTER TABLE `production_milling_costs`
  ADD CONSTRAINT `production_milling_costs_production_id_foreign` FOREIGN KEY (`production_id`) REFERENCES `productions` (`id`);

--
-- Constraints for table `production_other_products`
--
ALTER TABLE `production_other_products`
  ADD CONSTRAINT `production_other_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `production_other_products_production_id_foreign` FOREIGN KEY (`production_id`) REFERENCES `productions` (`id`),
  ADD CONSTRAINT `production_other_products_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_opening_warehouse_id_foreign` FOREIGN KEY (`opening_warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `products_sale_unit_id_foreign` FOREIGN KEY (`sale_unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `products_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  ADD CONSTRAINT `purchases_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `purchase_materials`
--
ALTER TABLE `purchase_materials`
  ADD CONSTRAINT `purchase_materials_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `purchase_materials_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`),
  ADD CONSTRAINT `purchase_materials_purchase_unit_id_foreign` FOREIGN KEY (`purchase_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD CONSTRAINT `purchase_payments_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `purchase_payments_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`),
  ADD CONSTRAINT `purchase_payments_supplier_debit_transaction_id_foreign` FOREIGN KEY (`supplier_debit_transaction_id`) REFERENCES `transactions` (`id`),
  ADD CONSTRAINT `purchase_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`);

--
-- Constraints for table `salary_incements`
--
ALTER TABLE `salary_incements`
  ADD CONSTRAINT `salary_incements_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`),
  ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `sales_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `sale_products`
--
ALTER TABLE `sale_products`
  ADD CONSTRAINT `sale_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sale_products_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  ADD CONSTRAINT `sale_products_sale_unit_id_foreign` FOREIGN KEY (`sale_unit_id`) REFERENCES `units` (`id`);

--
-- Constraints for table `shift_manages`
--
ALTER TABLE `shift_manages`
  ADD CONSTRAINT `shift_manages_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `shift_manages_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `warehouse_material`
--
ALTER TABLE `warehouse_material`
  ADD CONSTRAINT `warehouse_material_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`),
  ADD CONSTRAINT `warehouse_material_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  ADD CONSTRAINT `warehouse_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `warehouse_product_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `weekly_holiday_assigns`
--
ALTER TABLE `weekly_holiday_assigns`
  ADD CONSTRAINT `weekly_holiday_assigns_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `weekly_holiday_assigns_weekly_holiday_id_foreign` FOREIGN KEY (`weekly_holiday_id`) REFERENCES `holidays` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

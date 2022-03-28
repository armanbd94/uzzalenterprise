-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2022 at 04:54 AM
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
('mesars_jahid_oto_raic_mil_cache_active_machine_suppliers', 'O:39:\"Illuminate\\Database\\Eloquent\\Collection\":1:{s:8:\"\0*\0items\";a:0:{}}', 1963280949),
('mesars_jahid_oto_raic_mil_cache_active_taxes', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:0:{}}', 1963280956),
('mesars_jahid_oto_raic_mil_cache_active_warehouses', 'O:29:\"Illuminate\\Support\\Collection\":1:{s:8:\"\0*\0items\";a:3:{i:0;O:8:\"stdClass\":11:{s:2:\"id\";i:1;s:4:\"name\";s:20:\"Warehouse 1 [ Rice ]\";s:5:\"phone\";N;s:5:\"email\";N;s:7:\"address\";N;s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";s:5:\"Admin\";s:10:\"created_at\";s:19:\"2021-04-11 17:18:33\";s:10:\"updated_at\";s:19:\"2021-04-11 17:27:20\";}i:1;O:8:\"stdClass\":11:{s:2:\"id\";i:2;s:4:\"name\";s:26:\"Warehouse 2 [ By product ]\";s:5:\"phone\";N;s:5:\"email\";N;s:7:\"address\";N;s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:5:\"Admin\";s:11:\"modified_by\";s:5:\"Admin\";s:10:\"created_at\";s:19:\"2021-04-11 17:20:15\";s:10:\"updated_at\";s:19:\"2021-04-11 17:26:59\";}i:2;O:8:\"stdClass\":11:{s:2:\"id\";i:10;s:4:\"name\";s:40:\"কুষ্টিয়া গুদাম\";s:5:\"phone\";s:11:\"01986348224\";s:5:\"email\";s:50:\"কুষ্টিয়া@জিমেইল.কম\";s:7:\"address\";s:24:\"কুষ্টিয়া\";s:6:\"status\";s:1:\"1\";s:9:\"deletable\";s:1:\"1\";s:10:\"created_by\";s:11:\"Super Admin\";s:11:\"modified_by\";N;s:10:\"created_at\";s:19:\"2022-03-01 05:30:58\";s:10:\"updated_at\";s:19:\"2022-03-01 05:30:58\";}}}', 1963280949);

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
(2, 'বাই পণ্য', '1', 'Admin', 'Super Admin', '2021-04-15 06:47:14', '2022-03-21 21:47:24'),
(4, 'ধান', '1', 'Super Admin', 'Super Admin', '2022-03-01 00:35:22', '2022-03-21 21:47:14');

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
(28, '10202010001', '1-Walking Customer', 'Customer Receivable', 4, 'A', '1', '2', NULL, NULL, NULL, NULL, '2', '2', 0, '1', 'SuperAdmin', NULL, '2021-04-03 05:14:59', '2021-04-03 05:14:59');

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
('76xy3in7dU80LmhB6CRhW1BwVvVDvwCq7Ee09nys', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.82 Safari/537.36', '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S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjEyOntzOjI6ImlkIjtpOjE2MDtzOjc6Im1lbnVfaWQiO2k6MTtzOjQ6InR5cGUiO3M6MToiMiI7czoxMToibW9kdWxlX25hbWUiO3M6Mjc6IkZpbmlzaGVkIEdvb2RzIFN0b2NrIExlZGdlciI7czoxMzoiZGl2aWRlcl90aXRsZSI7TjtzOjEwOiJpY29uX2NsYXNzIjtzOjExOiJmYXMgZmEtZmlsZSI7czozOiJ1cmwiO3M6Mjc6ImZpbmlzaGVkLWdvb2RzLXN0b2NrLWxlZGdlciI7czo1OiJvcmRlciI7aToxMDtzOjk6InBhcmVudF9pZCI7TjtzOjY6InRhcmdldCI7TjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDIxLTA1LTExIDE4OjEwOjExIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDIyLTAzLTA4IDExOjU0OjU4Ijt9czoxMToiACoAb3JpZ2luYWwiO2E6MTI6e3M6MjoiaWQiO2k6MTYwO3M6NzoibWVudV9pZCI7aToxO3M6NDoidHlwZSI7czoxOiIyIjtzOjExOiJtb2R1bGVfbmFtZSI7czoyNzoiRmluaXNoZWQgR29vZHMgU3RvY2sgTGVkZ2VyIjtzOjEzOiJkaXZpZGVyX3RpdGxlIjtOO3M6MTA6Imljb25fY2xhc3MiO3M6MTE6ImZhcyBmYS1maWxlIjtzOjM6InVybCI7czoyNzoiZmluaXNoZWQtZ29vZHMtc3RvY2stbGVkZ2VyIjtzOjU6Im9yZGVyIjtpOjEwO3M6OToicGFyZW50X2lkIjtOO3M6NjoidGFyZ2V0IjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjEtMDUtMTEgMTg6MTA6MTEiO3M6MTA6InVw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c3MiO2k6MjE7czoxMDoiYmFnLWFjY2VzcyI7aToyMjtzOjc6ImJhZy1hZGQiO2k6MjM7czoxNToiYmFnLWJ1bGstZGVsZXRlIjtpOjI0O3M6MTA6ImJhZy1kZWxldGUiO2k6MjU7czo4OiJiYWctZWRpdCI7aToyNjtzOjEwOiJiYWctcmVwb3J0IjtpOjI3O3M6MjA6ImJhbGFuY2Utc2hlZXQtYWNjZXNzIjtpOjI4O3M6MTE6ImJhbmstYWNjZXNzIjtpOjI5O3M6ODoiYmFuay1hZGQiO2k6MzA7czoxNjoiYmFuay1ib29rLWFjY2VzcyI7aTozMTtzOjExOiJiYW5rLWRlbGV0ZSI7aTozMjtzOjk6ImJhbmstZWRpdCI7aTozMztzOjE4OiJiYW5rLWxlZGdlci1hY2Nlc3MiO2k6MzQ7czoxMToiYmFuay1yZXBvcnQiO2k6MzU7czoyMzoiYmFuay10cmFuc2FjdGlvbi1hY2Nlc3MiO2k6MzY7czoxNToiYmVuaWZpdHMtYWNjZXNzIjtpOjM3O3M6MTI6ImJlbmlmaXRzLWFkZCI7aTozODtzOjIwOiJiZW5pZml0cy1idWxrLWRlbGV0ZSI7aTozOTtzOjE1OiJiZW5pZml0cy1kZWxldGUiO2k6NDA7czoxMzoiYmVuaWZpdHMtZWRpdCI7aTo0MTtzOjE1OiJiZW5pZml0cy1yZXBvcnQiO2k6NDI7czoyMjoiY2FzaC1hZGp1c3RtZW50LWFjY2VzcyI7aTo0MztzOjE2OiJjYXNoLWJvb2stYWNjZXNzIjtpOjQ0O3M6MTY6ImNhc2gtZmxvdy1hY2Nlc3MiO2k6NDU7czoxNToiY2F0ZWdvcnktYWNjZXNzIjtpOjQ2O3M6MTI6ImNhdGVnb3J5LWFkZCI7aTo0NztzOjIwOiJjYXRlZ29yeS1idWxrLWRlbGV0ZSI7aTo0ODtzOjE1OiJjYXRlZ29yeS1kZWxldGUiO2k6NDk7czoxMzoiY2F0ZWdvcnktZWRpdCI7aTo1MDtzOjE1OiJjYXRlZ29yeS1yZXBvcnQiO2k6NTE7czoxNDoiY2xvc2luZy1hY2Nlc3MiO2k6NTI7czoyMToiY2xvc2luZy1yZXBvcnQtYWNjZXNzIjtpOjUzO3M6MTA6ImNvYS1hY2Nlc3MiO2k6NTQ7czo3OiJjb2EtYWRkIjtpOjU1O3M6MTA6ImNvYS1kZWxldGUiO2k6NTY7czo4OiJjb2EtZWRpdCI7aTo1NztzOjIxOiJjb250cmEtdm91Y2hlci1hY2Nlc3MiO2k6NTg7czoyMjoiY3JlZGl0LWN1c3RvbWVyLWFjY2VzcyI7aTo1OTtzOjIxOiJjcmVkaXQtdm91Y2hlci1hY2Nlc3MiO2k6NjA7czoxNToiY3VzdG9tZXItYWNjZXNzIjtpOjYxO3M6MTI6ImN1c3RvbWVyLWFkZCI7aTo2MjtzOjIzOiJjdXN0b21lci1hZHZhbmNlLWFjY2VzcyI7aTo2MztzOjMwOiJjdXN0b21lci1hZHZhbmNlLWFjY2Vzcy1yZXBvcnQiO2k6NjQ7czoyMDoiY3VzdG9tZXItYWR2YW5jZS1hZGQiO2k6NjU7czoyNDoiY3VzdG9tZXItYWR2YW5jZS1hcHByb3ZlIjtpOjY2O3M6Mjg6ImN1c3RvbWVyLWFkdmFuY2UtYnVsay1kZWxldGUiO2k6Njc7czoyMzoiY3VzdG9tZXItYWR2YW5jZS1kZWxldGUiO2k6Njg7czoyMToiY3VzdG9tZXItYWR2YW5jZS1lZGl0IjtpOjY5O3M6MjA6ImN1c3RvbWVyLWJ1bGstZGVsZXRlIjtpOjcwO3M6MTU6ImN1c3RvbWVyLWRlbGV0ZSI7aTo3MTtzOjEzOiJjdXN0b21lci1lZGl0IjtpOjcyO3M6MjE6ImN1c3RvbWVyLWdyb3VwLWFjY2VzcyI7aTo3MztzOjE4OiJjdXN0b21lci1ncm91cC1hZGQiO2k6NzQ7czoyNjoiY3VzdG9tZXItZ3JvdXAtYnVsay1kZWxldGUiO2k6NzU7czoyMToiY3VzdG9tZXItZ3JvdXAtZGVsZXRlIjtpOjc2O3M6MTk6ImN1c3RvbWVyLWdyb3VwLWVkaXQiO2k6Nzc7czoyMToiY3VzdG9tZXItZ3JvdXAtcmVwb3J0IjtpOjc4O3M6MjI6ImN1c3RvbWVyLWxlZGdlci1hY2Nlc3MiO2k6Nzk7czoyMzoiY3VzdG9tZXItcmVjZWl2ZS1hY2Nlc3MiO2k6ODA7czoxNToiY3VzdG9tZXItcmVwb3J0IjtpOjgxO3M6MTM6ImN1c3RvbWVyLXZpZXciO2k6ODI7czoxNjoiZGFzaGJvYXJkLWFjY2VzcyI7aTo4MztzOjIwOiJkZWJpdC12b3VjaGVyLWFjY2VzcyI7aTo4NDtzOjE0OiJkZWxldGUtdm91Y2hlciI7aTo4NTtzOjE3OiJkZXBhcnRtZW50LWFjY2VzcyI7aTo4NjtzOjE0OiJkZXBhcnRtZW50LWFkZCI7aTo4NztzOjIyOiJkZXBhcnRtZW50LWJ1bGstZGVsZXRlIjtpOjg4O3M6MTc6ImRlcGFydG1lbnQtZGVsZXRlIjtpOjg5O3M6MTU6ImRlcGFydG1lbnQtZWRpdCI7aTo5MDtzOjE3OiJkZXBhcnRtZW50LXJlcG9ydCI7aTo5MTtzOjE4OiJkZXNpZ25hdGlvbi1hY2Nlc3MiO2k6OTI7czoxNToiZGVzaWduYXRpb24tYWRkIjtpOjkzO3M6MjM6ImRlc2lnbmF0aW9uLWJ1bGstZGVsZXRlIjtpOjk0O3M6MTg6ImRlc2lnbmF0aW9uLWRlbGV0ZSI7aTo5NTtzOjE2OiJkZXNpZ25hdGlvbi1lZGl0IjtpOjk2O3M6MTg6ImRlc2lnbmF0aW9uLXJlcG9ydCI7aTo5NztzOjE1OiJkaXZpc2lvbi1hY2Nlc3MiO2k6OTg7czoxMjoiZGl2aXNpb24tYWRkIjtpOjk5O3M6MjA6ImRpdmlzaW9uLWJ1bGstZGVsZXRlIjtpOjEwMDtzOjE1OiJkaXZpc2lvbi1kZWxldGUiO2k6MTAxO3M6MTM6ImRpdmlzaW9uLWVkaXQiO2k6MTAyO3M6MTU6ImRpdmlzaW9uLXJlcG9ydCI7aToxMDM7czoxMzoiZHJpdmVyLWFjY2VzcyI7aToxMDQ7czoxMDoiZHJpdmVyLWFkZCI7aToxMDU7czoxODoiZHJpdmVyLWJ1bGstZGVsZXRlIjtpOjEwNjtzOjEzOiJkcml2ZXItZGVsZXRlIjtpOjEwNztzOjExOiJkcml2ZXItZWRpdCI7aToxMDg7czoxMzoiZHJpdmVyLXJlcG9ydCI7aToxMDk7czoxNzoiZHVlLXJlcG9ydC1hY2Nlc3MiO2k6MTEwO3M6MTI6ImVkaXQtdm91Y2hlciI7aToxMTE7czoxNToiZW1wbG95ZWUtYWNjZXNzIjtpOjExMjtzOjEyOiJlbXBsb3llZS1hZGQiO2k6MTEzO3M6MjA6ImVtcGxveWVlLWJ1bGstZGVsZXRlIjtpOjExNDtzOjE1OiJlbXBsb3llZS1kZWxldGUiO2k6MTE1O3M6MTM6ImVtcGxveWVlLWVkaXQiO2k6MTE2O3M6MTU6ImVtcGxveWVlLXJlcG9ydCI7aToxMTc7czoyMToiZW1wbG95ZWUtc2hpZnQtY2hhbmdlIjtpOjExODtzOjEzOiJlbXBsb3llZS12aWV3IjtpOjExOTtzOjE0OiJleHBlbnNlLWFjY2VzcyI7aToxMjA7czoxMToiZXhwZW5zZS1hZGQiO2k6MTIxO3M6MTU6ImV4cGVuc2UtYXBwcm92ZSI7aToxMjI7czoxOToiZXhwZW5zZS1idWxrLWRlbGV0ZSI7aToxMjM7czoyMzoiZXhwZW5zZS1jYXRlZ29yeS1hY2Nlc3MiO2k6MTI0O3M6MjA6ImV4cGVuc2UtY2F0ZWdvcnktYWRkIjtpOjEyNTtzOjI4OiJleHBlbnNlLWNhdGVnb3J5LWJ1bGstZGVsZXRlIjtpOjEyNjtzOjIzOiJleHBlbnNlLWNhdGVnb3J5LWRlbGV0ZSI7aToxMjc7czoyMToiZXhwZW5zZS1jYXRlZ29yeS1lZGl0IjtpOjEyODtzOjIzOiJleHBlbnNlLWNhdGVnb3J5LXJlcG9ydCI7aToxMjk7czoxNDoiZXhwZW5zZS1kZWxldGUiO2k6MTMwO3M6MTI6ImV4cGVuc2UtZWRpdCI7aToxMzE7czoxOToiZXhwZW5zZS1pdGVtLWFjY2VzcyI7aToxMzI7czoxNjoiZXhwZW5zZS1pdGVtLWFkZCI7aToxMzM7czoyNDoiZXhwZW5zZS1pdGVtLWJ1bGstZGVsZXRlIjtpOjEzNDtzOjE5OiJleHBlbnNlLWl0ZW0tZGVsZXRlIjtpOjEzNTtzOjE3OiJleHBlbnNlLWl0ZW0tZWRpdCI7aToxMzY7czoxOToiZXhwZW5zZS1pdGVtLXJlcG9ydCI7aToxMzc7czoxNDoiZXhwZW5zZS1yZXBvcnQiO2k6MTM4O3M6MjQ6ImV4cGVuc2Utc3RhdGVtZW50LWFjY2VzcyI7aToxMzk7czoyNzoiZmluaXNoZWQtYnktcHJvZHVjdHMtYWNjZXNzIjtpOjE0MDtzOjI3OiJmaW5pc2hlZC1nb29kcy1zdG9jay1hY2Nlc3MiO2k6MTQxO3M6MzQ6ImZpbmlzaGVkLWdvb2RzLXN0b2NrLWxlZGdlci1hY2Nlc3MiO2k6MTQyO3M6MjQ6ImZpbmlzaGVkLXByb2R1Y3RzLWFjY2VzcyI7aToxNDM7czoyMToiZ2VuZXJhbC1sZWRnZXItYWNjZXNzIjtpOjE0NDtzOjIyOiJnZW5lcmFsLXNldHRpbmctYWNjZXNzIjtpOjE0NTtzOjE0OiJob2xpZGF5LWFjY2VzcyI7aToxNDY7czoxMToiaG9saWRheS1hZGQiO2k6MTQ3O3M6MTk6ImhvbGlkYXktYnVsay1kZWxldGUiO2k6MTQ4O3M6MTQ6ImhvbGlkYXktZGVsZXRlIjtpOjE0OTtzOjEyOiJob2xpZGF5LWVkaXQiO2k6MTUwO3M6MTQ6ImhvbGlkYXktcmVwb3J0IjtpOjE1MTtzOjMwOiJpbmNvbWUtc3RhdGVtZW50LXJlcG9ydC1hY2Nlc3MiO2k6MTUyO3M6MjM6ImludmVudG9yeS1sZWRnZXItYWNjZXNzIjtpOjE1MztzOjIyOiJqb3VybmFsLXZvdWNoZXItYWNjZXNzIjtpOjE1NDtzOjE3OiJsYWJvci1iaWxsLWFjY2VzcyI7aToxNTU7czoxNDoibGFib3ItYmlsbC1hZGQiO2k6MTU2O3M6MjI6ImxhYm9yLWJpbGwtYnVsay1kZWxldGUiO2k6MTU3O3M6MTc6ImxhYm9yLWJpbGwtZGVsZXRlIjtpOjE1ODtzOjE1OiJsYWJvci1iaWxsLWVkaXQiO2k6MTU5O3M6MjI6ImxhYm9yLWJpbGwtcmF0ZS1hY2Nlc3MiO2k6MTYwO3M6MTk6ImxhYm9yLWJpbGwtcmF0ZS1hZGQiO2k6MTYxO3M6Mjc6ImxhYm9yLWJpbGwtcmF0ZS1idWxrLWRlbGV0ZSI7aToxNjI7czoyMjoibGFib3ItYmlsbC1yYXRlLWRlbGV0ZSI7aToxNjM7czoyMDoibGFib3ItYmlsbC1yYXRlLWVkaXQiO2k6MTY0O3M6MjI6ImxhYm9yLWJpbGwtcmF0ZS1yZXBvcnQiO2k6MTY1O3M6MTc6ImxhYm9yLWJpbGwtcmVwb3J0IjtpOjE2NjtzOjI0OiJsYWJvci1iaWxsLXJlcG9ydC1hY2Nlc3MiO2k6MTY3O3M6MTc6ImxhYm9yLWhlYWQtYWNjZXNzIjtpOjE2ODtzOjE0OiJsYWJvci1oZWFkLWFkZCI7aToxNjk7czoyMjoibGFib3ItaGVhZC1idWxrLWRlbGV0ZSI7aToxNzA7czoxNzoibGFib3ItaGVhZC1kZWxldGUiO2k6MTcxO3M6MTU6ImxhYm9yLWhlYWQtZWRpdCI7aToxNzI7czoyNDoibGFib3ItaGVhZC1sZWRnZXItYWNjZXNzIjtpOjE3MztzOjI0OiJsZWF2ZS1hcHBsaWNhdGlvbi1hY2Nlc3MiO2k6MTc0O3M6MjE6ImxlYXZlLWFwcGxpY2F0aW9uLWFkZCI7aToxNzU7czoyNToibGVhdmUtYXBwbGljYXRpb24tYXBwcm92ZSI7aToxNzY7czoyOToibGVhdmUtYXBwbGljYXRpb24tYnVsay1kZWxldGUiO2k6MTc3O3M6MjQ6ImxlYXZlLWFwcGxpY2F0aW9uLWRlbGV0ZSI7aToxNzg7czoyMjoibGVhdmUtYXBwbGljYXRpb24tZWRpdCI7aToxNzk7czoyNDoibGVhdmUtYXBwbGljYXRpb24tcmVwb3J0IjtpOjE4MDtzOjE3OiJsZWF2ZS10eXBlLWFjY2VzcyI7aToxODE7czoxNDoibGVhdmUtdHlwZS1hZGQiO2k6MTgyO3M6MjI6ImxlYXZlLXR5cGUtYnVsay1kZWxldGUiO2k6MTgzO3M6MTc6ImxlYXZlLXR5cGUtZGVsZXRlIjtpOjE4NDtzOjE1OiJsZWF2ZS10eXBlLWVkaXQiO2k6MTg1O3M6MTc6ImxlYXZlLXR5cGUtcmVwb3J0IjtpOjE4NjtzOjE4OiJsb2FuLXJlcG9ydC1hY2Nlc3MiO2k6MTg3O3M6MTQ6Im1hY2hpbmUtYWNjZXNzIjtpOjE4ODtzOjIxOiJtYWNoaW5lLWFjY2Vzcy1yZXBvcnQiO2k6MTg5O3M6MTE6Im1hY2hpbmUtYWRkIjtpOjE5MDtzOjE5OiJtYWNoaW5lLWJ1bGstZGVsZXRlIjtpOjE5MTtzOjE0OiJtYWNoaW5lLWRlbGV0ZSI7aToxOTI7czoxMjoibWFjaGluZS1lZGl0IjtpOjE5MztzOjIzOiJtYWNoaW5lLXB1cmNoYXNlLWFjY2VzcyI7aToxOTQ7czoyMDoibWFjaGluZS1wdXJjaGFzZS1hZGQiO2k6MTk1O3M6MjQ6Im1hY2hpbmUtcHVyY2hhc2UtYXBwcm92ZSI7aToxOTY7czoyODoibWFjaGluZS1wdXJjaGFzZS1idWxrLWRlbGV0ZSI7aToxOTc7czoyMzoibWFjaGluZS1wdXJjaGFzZS1kZWxldGUiO2k6MTk4O3M6MjE6Im1hY2hpbmUtcHVyY2hhc2UtZWRpdCI7aToxOTk7czoyODoibWFjaGluZS1wdXJjaGFzZS1wYXltZW50LWFkZCI7aToyMDA7czozMToibWFjaGluZS1wdXJjaGFzZS1wYXltZW50LWRlbGV0ZSI7aToyMDE7czoyOToibWFjaGluZS1wdXJjaGFzZS1wYXltZW50LWVkaXQiO2k6MjAyO3M6Mjk6Im1hY2hpbmUtcHVyY2hhc2UtcGF5bWVudC12aWV3IjtpOjIwMztzOjIzOiJtYWNoaW5lLXB1cmNoYXNlLXJlcG9ydCI7aToyMDQ7czozMDoibWFjaGluZS1wdXJjaGFzZS1yZXBvcnQtYWNjZXNzIjtpOjIwNTtzOjIxOiJtYWNoaW5lLXB1cmNoYXNlLXZpZXciO2k6MjA2O3M6MTI6Im1hY2hpbmUtdmlldyI7aToyMDc7czoyNzoibWFpbnRlbmFuY2UtY2F0ZWdvcnktYWNjZXNzIjtpOjIwODtzOjI0OiJtYWludGVuYW5jZS1jYXRlZ29yeS1hZGQiO2k6MjA5O3M6MzI6Im1haW50ZW5hbmNlLWNhdGVnb3J5LWJ1bGstZGVsZXRlIjtpOjIxMDtzOjI3OiJtYWludGVuYW5jZS1jYXRlZ29yeS1kZWxldGUiO2k6MjExO3M6MjU6Im1haW50ZW5hbmNlLWNhdGVnb3J5LWVkaXQiO2k6MjEyO3M6Mjc6Im1haW50ZW5hbmNlLWNhdGVnb3J5LXJlcG9ydCI7aToyMTM7czoyNjoibWFpbnRlbmFuY2Utc2VydmljZS1hY2Nlc3MiO2k6MjE0O3M6MjM6Im1haW50ZW5hbmNlLXNlcnZpY2UtYWRkIjtpOjIxNTtzOjI3OiJtYWludGVuYW5jZS1zZXJ2aWNlLWFwcHJvdmUiO2k6MjE2O3M6MzE6Im1haW50ZW5hbmNlLXNlcnZpY2UtYnVsay1kZWxldGUiO2k6MjE3O3M6MjY6Im1haW50ZW5hbmNlLXNlcnZpY2UtZGVsZXRlIjtpOjIxODtzOjI0OiJtYWludGVuYW5jZS1zZXJ2aWNlLWVkaXQiO2k6MjE5O3M6MzE6Im1haW50ZW5hbmNlLXNlcnZpY2UtcGF5bWVudC1hZGQiO2k6MjIwO3M6MzQ6Im1haW50ZW5hbmNlLXNlcnZpY2UtcGF5bWVudC1kZWxldGUiO2k6MjIxO3M6MzI6Im1haW50ZW5hbmNlLXNlcnZpY2UtcGF5bWVudC1lZGl0IjtpOjIyMjtzOjMyOiJtYWludGVuYW5jZS1zZXJ2aWNlLXBheW1lbnQtdmlldyI7aToyMjM7czoyNjoibWFpbnRlbmFuY2Utc2VydmljZS1yZXBvcnQiO2k6MjI0O3M6MzM6Im1haW50ZW5hbmNlLXNlcnZpY2UtcmVwb3J0LWFjY2VzcyI7aToyMjU7czoyNDoibWFpbnRlbmFuY2Utc2VydmljZS12aWV3IjtpOjIyNjtzOjIzOiJtYWludGVuYW5jZS11bml0LWFjY2VzcyI7aToyMjc7czoyMDoibWFpbnRlbmFuY2UtdW5pdC1hZGQiO2k6MjI4O3M6Mjg6Im1haW50ZW5hbmNlLXVuaXQtYnVsay1kZWxldGUiO2k6MjI5O3M6MjM6Im1haW50ZW5hbmNlLXVuaXQtZGVsZXRlIjtpOjIzMDtzOjIxOiJtYWludGVuYW5jZS11bml0LWVkaXQiO2k6MjMxO3M6MjM6Im1haW50ZW5hbmNlLXVuaXQtcmVwb3J0IjtpOjIzMjtzOjE1OiJtYXRlcmlhbC1hY2Nlc3MiO2k6MjMzO3M6MTI6Im1hdGVyaWFsLWFkZCI7aToyMzQ7czoyMDoibWF0ZXJpYWwtYnVsay1kZWxldGUiO2k6MjM1O3M6MTU6Im1hdGVyaWFsLWRlbGV0ZSI7aToyMzY7czoxMzoibWF0ZXJpYWwtZWRpdCI7aToyMzc7czoxNToibWF0ZXJpYWwtcmVwb3J0IjtpOjIzODtzOjIxOiJtYXRlcmlhbC1zdG9jay1hY2Nlc3MiO2k6MjM5O3M6Mjg6Im1hdGVyaWFsLXN0b2NrLWxlZGdlci1hY2Nlc3MiO2k6MjQwO3M6MTM6Im1hdGVyaWFsLXZpZXciO2k6MjQxO3M6MTE6Im1lbnUtYWNjZXNzIjtpOjI0MjtzOjg6Im1lbnUtYWRkIjtpOjI0MztzOjE5OiJtZW51LWJ1aWxkZXItYWNjZXNzIjtpOjI0NDtzOjE2OiJtZW51LWJ1bGstZGVsZXRlIjtpOjI0NTtzOjExOiJtZW51LWRlbGV0ZSI7aToyNDY7czo5OiJtZW51LWVkaXQiO2k6MjQ3O3M6MTU6Im1lbnUtbW9kdWxlLWFkZCI7aToyNDg7czoxODoibWVudS1tb2R1bGUtZGVsZXRlIjtpOjI0OTtzOjE2OiJtZW51LW1vZHVsZS1lZGl0IjtpOjI1MDtzOjExOiJtZW51LXJlcG9ydCI7aToyNTE7czoxODoibW9iaWxlLWJhbmstYWNjZXNzIjtpOjI1MjtzOjE1OiJtb2JpbGUtYmFuay1hZGQiO2k6MjUzO3M6MjM6Im1vYmlsZS1iYW5rLWJvb2stYWNjZXNzIjtpOjI1NDtzOjIzOiJtb2JpbGUtYmFuay1idWxrLWRlbGV0ZSI7aToyNTU7czoxODoibW9iaWxlLWJhbmstZGVsZXRlIjtpOjI1NjtzOjE2OiJtb2JpbGUtYmFuay1lZGl0IjtpOjI1NztzOjI1OiJtb2JpbGUtYmFuay1sZWRnZXItYWNjZXNzIjtpOjI1ODtzOjE4OiJtb2JpbGUtYmFuay1yZXBvcnQiO2k6MjU5O3M6MzA6Im1vYmlsZS1iYW5rLXRyYW5zYWN0aW9uLWFjY2VzcyI7aToyNjA7czoyMDoib2ZmaWNpYWwtbG9hbi1hY2Nlc3MiO2k6MjYxO3M6MTc6Im9mZmljaWFsLWxvYW4tYWRkIjtpOjI2MjtzOjI1OiJvZmZpY2lhbC1sb2FuLWJ1bGstZGVsZXRlIjtpOjI2MztzOjIwOiJvZmZpY2lhbC1sb2FuLWRlbGV0ZSI7aToyNjQ7czoxODoib2ZmaWNpYWwtbG9hbi1lZGl0IjtpOjI2NTtzOjMyOiJvZmZpY2lhbC1sb2FuLWluc3RhbGxtZW50LWFjY2VzcyI7aToyNjY7czoyOToib2ZmaWNpYWwtbG9hbi1pbnN0YWxsbWVudC1hZGQiO2k6MjY3O3M6Mzc6Im9mZmljaWFsLWxvYW4taW5zdGFsbG1lbnQtYnVsay1kZWxldGUiO2k6MjY4O3M6MzI6Im9mZmljaWFsLWxvYW4taW5zdGFsbG1lbnQtZGVsZXRlIjtpOjI2OTtzOjMwOiJvZmZpY2lhbC1sb2FuLWluc3RhbGxtZW50LWVkaXQiO2k6MjcwO3M6MjI6Im9wZW5pbmctYmFsYW5jZS1hY2Nlc3MiO2k6MjcxO3M6MjQ6Im90aGVycy1sYWJvci1iaWxsLWFjY2VzcyI7aToyNzI7czoyMToib3RoZXJzLWxhYm9yLWJpbGwtYWRkIjtpOjI3MztzOjI1OiJvdGhlcnMtbGFib3ItYmlsbC1hcHByb3ZlIjtpOjI3NDtzOjI5OiJvdGhlcnMtbGFib3ItYmlsbC1idWxrLWRlbGV0ZSI7aToyNzU7czoyNDoib3RoZXJzLWxhYm9yLWJpbGwtZGVsZXRlIjtpOjI3NjtzOjIyOiJvdGhlcnMtbGFib3ItYmlsbC1lZGl0IjtpOjI3NztzOjI0OiJvdGhlcnMtbGFib3ItYmlsbC1yZXBvcnQiO2k6Mjc4O3M6MjI6Im90aGVycy1sYWJvci1iaWxsLXZpZXciO2k6Mjc5O3M6MjA6InBhaWQtY3VzdG9tZXItYWNjZXNzIjtpOjI4MDtzOjE3OiJwZXJtaXNzaW9uLWFjY2VzcyI7aToyODE7czoxNDoicGVybWlzc2lvbi1hZGQiO2k6MjgyO3M6MjI6InBlcm1pc3Npb24tYnVsay1kZWxldGUiO2k6MjgzO3M6MTc6InBlcm1pc3Npb24tZGVsZXRlIjtpOjI4NDtzOjE1OiJwZXJtaXNzaW9uLWVkaXQiO2k6Mjg1O3M6MTc6InBlcm1pc3Npb24tcmVwb3J0IjtpOjI4NjtzOjIwOiJwZXJzb25hbC1sb2FuLWFjY2VzcyI7aToyODc7czoxNzoicGVyc29uYWwtbG9hbi1hZGQiO2k6Mjg4O3M6MjU6InBlcnNvbmFsLWxvYW4tYnVsay1kZWxldGUiO2k6Mjg5O3M6MjA6InBlcnNvbmFsLWxvYW4tZGVsZXRlIjtpOjI5MDtzOjE4OiJwZXJzb25hbC1sb2FuLWVkaXQiO2k6MjkxO3M6MzI6InBlcnNvbmFsLWxvYW4taW5zdGFsbG1lbnQtYWNjZXNzIjtpOjI5MjtzOjI5OiJwZXJzb25hbC1sb2FuLWluc3RhbGxtZW50LWFkZCI7aToyOTM7czozNzoicGVyc29uYWwtbG9hbi1pbnN0YWxsbWVudC1idWxrLWRlbGV0ZSI7aToyOTQ7czozMjoicGVyc29uYWwtbG9hbi1pbnN0YWxsbWVudC1kZWxldGUiO2k6Mjk1O3M6MzA6InBlcnNvbmFsLWxvYW4taW5zdGFsbG1lbnQtZWRpdCI7aToyOTY7czoyNzoicGVyc29uYWwtbG9hbi1wZXJzb24tYWNjZXNzIjtpOjI5NztzOjI0OiJwZXJzb25hbC1sb2FuLXBlcnNvbi1hZGQiO2k6Mjk4O3M6MzI6InBlcnNvbmFsLWxvYW4tcGVyc29uLWJ1bGstZGVsZXRlIjtpOjI5OTtzOjI3OiJwZXJzb25hbC1sb2FuLXBlcnNvbi1kZWxldGUiO2k6MzAwO3M6MjU6InBlcnNvbmFsLWxvYW4tcGVyc29uLWVkaXQiO2k6MzAxO3M6MjE6InByZS1vcmRlci1zYWxlLWFjY2VzcyI7aTozMDI7czoxODoicHJlLW9yZGVyLXNhbGUtYWRkIjtpOjMwMztzOjIyOiJwcmUtb3JkZXItc2FsZS1hcHByb3ZlIjtpOjMwNDtzOjI2OiJwcmUtb3JkZXItc2FsZS1idWxrLWRlbGV0ZSI7aTozMDU7czoyMToicHJlLW9yZGVyLXNhbGUtZGVsZXRlIjtpOjMwNjtzOjE5OiJwcmUtb3JkZXItc2FsZS1lZGl0IjtpOjMwNztzOjIxOiJwcmUtb3JkZXItc2FsZS1yZXBvcnQiO2k6MzA4O3M6MTk6InByZS1vcmRlci1zYWxlLXZpZXciO2k6MzA5O3M6MTQ6InByb2R1Y3QtYWNjZXNzIjtpOjMxMDtzOjExOiJwcm9kdWN0LWFkZCI7aTozMTE7czoxOToicHJvZHVjdC1idWxrLWRlbGV0ZSI7aTozMTI7czoxNDoicHJvZHVjdC1kZWxldGUiO2k6MzEzO3M6MTI6InByb2R1Y3QtZWRpdCI7aTozMTQ7czoxNDoicHJvZHVjdC1yZXBvcnQiO2k6MzE1O3M6MTI6InByb2R1Y3QtdmlldyI7aTozMTY7czozMjoicHJvZHVjdC13aXNlLXNhbGVzLXJlcG9ydC1hY2Nlc3MiO2k6MzE3O3M6MTc6InByb2R1Y3Rpb24tYWNjZXNzIjtpOjMxODtzOjE0OiJwcm9kdWN0aW9uLWFkZCI7aTozMTk7czoxODoicHJvZHVjdGlvbi1hcHByb3ZlIjtpOjMyMDtzOjIyOiJwcm9kdWN0aW9uLWJ1bGstZGVsZXRlIjtpOjMyMTtzOjE3OiJwcm9kdWN0aW9uLWRlbGV0ZSI7aTozMjI7czoxNToicHJvZHVjdGlvbi1lZGl0IjtpOjMyMztzOjE3OiJwcm9kdWN0aW9uLXJlcG9ydCI7aTozMjQ7czoxNToicHJvZHVjdGlvbi12aWV3IjtpOjMyNTtzOjE4OiJwcm9maXQtbG9zcy1hY2Nlc3MiO2k6MzI2O3M6MTU6InB1cmNoYXNlLWFjY2VzcyI7aTozMjc7czoxMjoicHVyY2hhc2UtYWRkIjtpOjMyODtzOjE2OiJwdXJjaGFzZS1hcHByb3ZlIjtpOjMyOTtzOjIwOiJwdXJjaGFzZS1idWxrLWRlbGV0ZSI7aTozMzA7czoxNToicHVyY2hhc2UtZGVsZXRlIjtpOjMzMTtzOjEzOiJwdXJjaGFzZS1lZGl0IjtpOjMzMjtzOjIwOiJwdXJjaGFzZS1wYXltZW50LWFkZCI7aTozMzM7czoyMzoicHVyY2hhc2UtcGF5bWVudC1kZWxldGUiO2k6MzM0O3M6MjE6InB1cmNoYXNlLXBheW1lbnQtZWRpdCI7aTozMzU7czoyMToicHVyY2hhc2UtcGF5bWVudC12aWV3IjtpOjMzNjtzOjE1OiJwdXJjaGFzZS1yZXBvcnQiO2k6MzM3O3M6MjI6InB1cmNoYXNlLXJlcG9ydC1hY2Nlc3MiO2k6MzM4O3M6MTM6InB1cmNoYXNlLXZpZXciO2k6MzM5O3M6MTE6InJvbGUtYWNjZXNzIjtpOjM0MDtzOjg6InJvbGUtYWRkIjtpOjM0MTtzOjE2OiJyb2xlLWJ1bGstZGVsZXRlIjtpOjM0MjtzOjExOiJyb2xlLWRlbGV0ZSI7aTozNDM7czo5OiJyb2xlLWVkaXQiO2k6MzQ0O3M6MTE6InJvbGUtcmVwb3J0IjtpOjM0NTtzOjk6InJvbGUtdmlldyI7aTozNDY7czoyMjoic2FsYXJ5LWdlbmVyYXRlLWFjY2VzcyI7aTozNDc7czoxOToic2FsYXJ5LWdlbmVyYXRlLWFkZCI7aTozNDg7czoyNzoic2FsYXJ5LWdlbmVyYXRlLWJ1bGstZGVsZXRlIjtpOjM0OTtzOjIyOiJzYWxhcnktZ2VuZXJhdGUtZGVsZXRlIjtpOjM1MDtzOjIyOiJzYWxhcnktZ2VuZXJhdGUtcmVwb3J0IjtpOjM1MTtzOjE5OiJzYWxhcnktc2V0dXAtYWNjZXNzIjtpOjM1MjtzOjE2OiJzYWxhcnktc2V0dXAtYWRkIjtpOjM1MztzOjI0OiJzYWxhcnktc2V0dXAtYnVsay1kZWxldGUiO2k6MzU0O3M6MTk6InNhbGFyeS1zZXR1cC1kZWxldGUiO2k6MzU1O3M6MTc6InNhbGFyeS1zZXR1cC1lZGl0IjtpOjM1NjtzOjE5OiJzYWxhcnktc2V0dXAtcmVwb3J0IjtpOjM1NztzOjE3OiJzYWxhcnktc2V0dXAtdmlldyI7aTozNTg7czoxMToic2FsZS1hY2Nlc3MiO2k6MzU5O3M6ODoic2FsZS1hZGQiO2k6MzYwO3M6MTI6InNhbGUtYXBwcm92ZSI7aTozNjE7czoxNjoic2FsZS1idWxrLWRlbGV0ZSI7aTozNjI7czoxMToic2FsZS1kZWxldGUiO2k6MzYzO3M6OToic2FsZS1lZGl0IjtpOjM2NDtzOjExOiJzYWxlLXJlcG9ydCI7aTozNjU7czo5OiJzYWxlLXZpZXciO2k6MzY2O3M6MTk6InNhbGVzLXJlcG9ydC1hY2Nlc3MiO2k6MzY3O3M6MTI6InNoaWZ0LWFjY2VzcyI7aTozNjg7czo5OiJzaGlmdC1hZGQiO2k6MzY5O3M6MTc6InNoaWZ0LWJ1bGstZGVsZXRlIjtpOjM3MDtzOjEyOiJzaGlmdC1kZWxldGUiO2k6MzcxO3M6MTA6InNoaWZ0LWVkaXQiO2k6MzcyO3M6MTk6InNoaWZ0LW1hbmFnZS1hY2Nlc3MiO2k6MzczO3M6MTY6InNoaWZ0LW1hbmFnZS1hZGQiO2k6Mzc0O3M6MjQ6InNoaWZ0LW1hbmFnZS1idWxrLWRlbGV0ZSI7aTozNzU7czoxOToic2hpZnQtbWFuYWdlLWRlbGV0ZSI7aTozNzY7czoxNzoic2hpZnQtbWFuYWdlLWVkaXQiO2k6Mzc3O3M6MTk6InNoaWZ0LW1hbmFnZS1yZXBvcnQiO2k6Mzc4O3M6MTI6InNoaWZ0LXJlcG9ydCI7aTozNzk7czoyMToic3VtbWFyeS1yZXBvcnQtYWNjZXNzIjtpOjM4MDtzOjE1OiJzdXBwbGllci1hY2Nlc3MiO2k6MzgxO3M6MTI6InN1cHBsaWVyLWFkZCI7aTozODI7czoyMzoic3VwcGxpZXItYWR2YW5jZS1hY2Nlc3MiO2k6MzgzO3M6MjA6InN1cHBsaWVyLWFkdmFuY2UtYWRkIjtpOjM4NDtzOjI0OiJzdXBwbGllci1hZHZhbmNlLWFwcHJvdmUiO2k6Mzg1O3M6Mjg6InN1cHBsaWVyLWFkdmFuY2UtYnVsay1kZWxldGUiO2k6Mzg2O3M6MjM6InN1cHBsaWVyLWFkdmFuY2UtZGVsZXRlIjtpOjM4NztzOjIxOiJzdXBwbGllci1hZHZhbmNlLWVkaXQiO2k6Mzg4O3M6MjM6InN1cHBsaWVyLWFkdmFuY2UtcmVwb3J0IjtpOjM4OTtzOjIwOiJzdXBwbGllci1idWxrLWRlbGV0ZSI7aTozOTA7czoxNToic3VwcGxpZXItZGVsZXRlIjtpOjM5MTtzOjEzOiJzdXBwbGllci1lZGl0IjtpOjM5MjtzOjIyOiJzdXBwbGllci1sZWRnZXItYWNjZXNzIjtpOjM5MztzOjIzOiJzdXBwbGllci1wYXltZW50LWFjY2VzcyI7aTozOTQ7czoxNToic3VwcGxpZXItcmVwb3J0IjtpOjM5NTtzOjEwOiJ0YXgtYWNjZXNzIjtpOjM5NjtzOjc6InRheC1hZGQiO2k6Mzk3O3M6MTU6InRheC1idWxrLWRlbGV0ZSI7aTozOTg7czoxMDoidGF4LWRlbGV0ZSI7aTozOTk7czo4OiJ0YXgtZWRpdCI7aTo0MDA7czoxMDoidGF4LXJlcG9ydCI7aTo0MDE7czoxMzoidGVuYW50LWFjY2VzcyI7aTo0MDI7czoxMDoidGVuYW50LWFkZCI7aTo0MDM7czoxODoidGVuYW50LWJ1bGstZGVsZXRlIjtpOjQwNDtzOjEzOiJ0ZW5hbnQtZGVsZXRlIjtpOjQwNTtzOjExOiJ0ZW5hbnQtZWRpdCI7aTo0MDY7czoyMDoidGVuYW50LWxlZGdlci1hY2Nlc3MiO2k6NDA3O3M6MjQ6InRlbmFudC1wcm9kdWN0aW9uLWFjY2VzcyI7aTo0MDg7czoyMToidGVuYW50LXByb2R1Y3Rpb24tYWRkIjtpOjQwOTtzOjI5OiJ0ZW5hbnQtcHJvZHVjdGlvbi1idWxrLWRlbGV0ZSI7aTo0MTA7czoyNDoidGVuYW50LXByb2R1Y3Rpb24tZGVsZXRlIjtpOjQxMTtzOjIyOiJ0ZW5hbnQtcHJvZHVjdGlvbi1lZGl0IjtpOjQxMjtzOjM0OiJ0ZW5hbnQtcHJvZHVjdGlvbi1wcm9kdWN0LWRlbGl2ZXJ5IjtpOjQxMztzOjQyOiJ0ZW5hbnQtcHJvZHVjdGlvbi1wcm9kdWN0LWRlbGl2ZXJ5LWRldGFpbHMiO2k6NDE0O3M6MjI6InRlbmFudC1wcm9kdWN0aW9uLXZpZXciO2k6NDE1O3M6MzA6InRvZGF5cy1jdXN0b21lci1yZWNlaXB0LWFjY2VzcyI7aTo0MTY7czoyOToidG9kYXlzLXB1cmNoYXNlLXJlcG9ydC1hY2Nlc3MiO2k6NDE3O3M6MjY6InRvZGF5cy1zYWxlcy1yZXBvcnQtYWNjZXNzIjtpOjQxODtzOjE2OiJ0cmFuc3BvcnQtYWNjZXNzIjtpOjQxOTtzOjEzOiJ0cmFuc3BvcnQtYWRkIjtpOjQyMDtzOjE3OiJ0cmFuc3BvcnQtYXBwcm92ZSI7aTo0MjE7czoyMToidHJhbnNwb3J0LWJ1bGstZGVsZXRlIjtpOjQyMjtzOjE2OiJ0cmFuc3BvcnQtZGVsZXRlIjtpOjQyMztzOjE0OiJ0cmFuc3BvcnQtZWRpdCI7aTo0MjQ7czoxNjoidHJhbnNwb3J0LXJlcG9ydCI7aTo0MjU7czoyMzoidHJhbnNwb3J0LXJlcG9ydC1hY2Nlc3MiO2k6NDI2O3M6MTQ6InRyYW5zcG9ydC12aWV3IjtpOjQyNztzOjIwOiJ0cmlhbC1iYWxhbmNlLWFjY2VzcyI7aTo0Mjg7czoxMjoidHJ1Y2stYWNjZXNzIjtpOjQyOTtzOjk6InRydWNrLWFkZCI7aTo0MzA7czoxNzoidHJ1Y2stYnVsay1kZWxldGUiO2k6NDMxO3M6MTI6InRydWNrLWRlbGV0ZSI7aTo0MzI7czoxMDoidHJ1Y2stZWRpdCI7aTo0MzM7czoxOToidHJ1Y2stbGVkZ2VyLWFjY2VzcyI7aTo0MzQ7czoxMjoidHJ1Y2stcmVwb3J0IjtpOjQzNTtzOjExOiJ1bml0LWFjY2VzcyI7aTo0MzY7czo4OiJ1bml0LWFkZCI7aTo0Mzc7czoxNjoidW5pdC1idWxrLWRlbGV0ZSI7aTo0Mzg7czoxMToidW5pdC1kZWxldGUiO2k6NDM5O3M6OToidW5pdC1lZGl0IjtpOjQ0MDtzOjExOiJ1bml0LXJlcG9ydCI7aTo0NDE7czoxMToidXNlci1hY2Nlc3MiO2k6NDQyO3M6ODoidXNlci1hZGQiO2k6NDQzO3M6MTY6InVzZXItYnVsay1kZWxldGUiO2k6NDQ0O3M6MTE6InVzZXItZGVsZXRlIjtpOjQ0NTtzOjk6InVzZXItZWRpdCI7aTo0NDY7czoxMToidXNlci1yZXBvcnQiO2k6NDQ3O3M6OToidXNlci12aWV3IjtpOjQ0ODtzOjIzOiJ2b3VjaGVyLWFwcHJvdmFsLWFjY2VzcyI7aTo0NDk7czoyMzoidm91Y2hlci1hcHByb3ZhbC1yZXBvcnQiO2k6NDUwO3M6MTY6IndhcmVob3VzZS1hY2Nlc3MiO2k6NDUxO3M6MTM6IndhcmVob3VzZS1hZGQiO2k6NDUyO3M6MjE6IndhcmVob3VzZS1idWxrLWRlbGV0ZSI7aTo0NTM7czoxNjoid2FyZWhvdXNlLWRlbGV0ZSI7aTo0NTQ7czoxNDoid2FyZWhvdXNlLWVkaXQiO2k6NDU1O3M6MTY6IndhcmVob3VzZS1yZXBvcnQiO2k6NDU2O3M6MjE6IndlZWtseS1ob2xpZGF5LWFjY2VzcyI7aTo0NTc7czoxODoid2Vla2x5LWhvbGlkYXktYWRkIjtpOjQ1ODtzOjI2OiJ3ZWVrbHktaG9saWRheS1idWxrLWRlbGV0ZSI7aTo0NTk7czoyMToid2Vla2x5LWhvbGlkYXktZGVsZXRlIjtpOjQ2MDtzOjE5OiJ3ZWVrbHktaG9saWRheS1lZGl0IjtpOjQ2MTtzOjIxOiJ3ZWVrbHktaG9saWRheS1yZXBvcnQiO319', 1647920974);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `allowance_deduction_manages`
--
ALTER TABLE `allowance_deduction_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_types`
--
ALTER TABLE `asset_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `daily_closings`
--
ALTER TABLE `daily_closings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_education`
--
ALTER TABLE `employee_education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_professional_information`
--
ALTER TABLE `employee_professional_information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_items`
--
ALTER TABLE `expense_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labor_bills`
--
ALTER TABLE `labor_bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labor_bill_rates`
--
ALTER TABLE `labor_bill_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labor_heads`
--
ALTER TABLE `labor_heads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_application_manages`
--
ALTER TABLE `leave_application_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_installments`
--
ALTER TABLE `loan_installments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_people`
--
ALTER TABLE `loan_people`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `machine_purchases`
--
ALTER TABLE `machine_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `machine_services`
--
ALTER TABLE `machine_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_categories`
--
ALTER TABLE `maintenance_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_machines`
--
ALTER TABLE `maintenance_machines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_purchases`
--
ALTER TABLE `maintenance_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_purchase_payments`
--
ALTER TABLE `maintenance_purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_services`
--
ALTER TABLE `maintenance_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_service_payments`
--
ALTER TABLE `maintenance_service_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_units`
--
ALTER TABLE `maintenance_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_bag_costs`
--
ALTER TABLE `production_bag_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_materials`
--
ALTER TABLE `production_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_milling_costs`
--
ALTER TABLE `production_milling_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_other_products`
--
ALTER TABLE `production_other_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_materials`
--
ALTER TABLE `purchase_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rateables`
--
ALTER TABLE `rateables`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salary_generates`
--
ALTER TABLE `salary_generates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_products`
--
ALTER TABLE `sale_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shift_manages`
--
ALTER TABLE `shift_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenant_productions`
--
ALTER TABLE `tenant_productions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenant_production_materials`
--
ALTER TABLE `tenant_production_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenant_production_products`
--
ALTER TABLE `tenant_production_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenant_production_product_deliveries`
--
ALTER TABLE `tenant_production_product_deliveries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenant_production_product_purchases`
--
ALTER TABLE `tenant_production_product_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transports`
--
ALTER TABLE `transports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_details`
--
ALTER TABLE `transport_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transport_expense_category`
--
ALTER TABLE `transport_expense_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trucks`
--
ALTER TABLE `trucks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse_product`
--
ALTER TABLE `warehouse_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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

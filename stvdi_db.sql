-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2024 at 12:56 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stvdi_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `fx_currencies`
--

CREATE TABLE `fx_currencies` (
  `currency_id` int(11) NOT NULL,
  `org_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ISO` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `rate` float NOT NULL DEFAULT 1,
  `decimals` tinyint(1) NOT NULL DEFAULT 2,
  `symbol_placement` enum('before','after') CHARACTER SET latin1 NOT NULL DEFAULT 'before',
  `primary_order` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `is_active` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fx_currencies`
--

INSERT INTO `fx_currencies` (`currency_id`, `org_id`, `name`, `ISO`, `symbol`, `code`, `rate`, `decimals`, `symbol_placement`, `primary_order`, `is_default`, `is_active`) VALUES
(2, 'FINDREX', 'United States Dollars', '840', '$', 'USD', 1, 2, 'before', 1, 'No', 'Yes'),
(3, 'FINDREX', 'British Pound Sterling', '826', '£', 'GBP', 0.813402, 2, 'before', 0, 'No', 'Yes'),
(4, 'FINDREX', 'Euro', '978', '€', 'EUR', 0.94747, 2, 'before', 0, 'No', 'Yes'),
(5, 'FINDREX', 'Nigerian Naira', '566', '₦', 'NGN', 1200.15, 2, 'before', 0, 'Yes', 'Yes'),
(1, 'default', 'United States Dollars', '840', '$', 'USD', 1, 2, 'before', 0, 'Yes', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `fx_log`
--

CREATE TABLE `fx_log` (
  `org_id` text NOT NULL,
  `user_id` text NOT NULL,
  `user_role` int(2) NOT NULL,
  `name` text NOT NULL,
  `note` text NOT NULL,
  `IP` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fx_log`
--

INSERT INTO `fx_log` (`org_id`, `user_id`, `user_role`, `name`, `note`, `IP`, `created_at`) VALUES
('', '', 0, '', 'Account Profile Updated Successfully!', '', '2024-01-06 22:36:43'),
('', '', 0, '', 'Account Profile Updated Successfully!', '', '2024-01-06 22:37:44'),
('', '', 0, '', 'Account Profile Updated Successfully!', '', '2024-01-07 05:18:52'),
('', '', 0, '', 'Account Deactivated Successfully!', '', '2024-01-07 05:48:11'),
('', '', 0, '', 'Account Deactivated Successfully!', '', '2024-01-07 06:03:03'),
('', '', 0, '', 'Account Deactivated Successfully!', '', '2024-01-07 06:23:33'),
('', '', 0, '', 'Account Deactivated Successfully!', '', '2024-01-07 06:35:59'),
('', '', 0, '', 'Account Deactivated Successfully!', '', '2024-01-07 06:39:21'),
('', '', 0, '', 'Examinee Added Successfully!', '', '2024-04-21 21:57:46'),
('', '', 0, '', 'Examinee Updated Successfully!', '', '2024-04-21 22:04:21'),
('', '', 0, '', 'Examinee Added Successfully!', '', '2024-04-21 22:05:13'),
('', '', 0, '', 'Examinee Added Successfully!', '', '2024-04-21 22:06:06');

-- --------------------------------------------------------

--
-- Table structure for table `fx_menu_main`
--

CREATE TABLE `fx_menu_main` (
  `main_order_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `short_code` text DEFAULT NULL,
  `img` text DEFAULT NULL,
  `tree_view` enum('0','1') NOT NULL DEFAULT '0',
  `is_admin` enum('0','1','NIL','F') NOT NULL DEFAULT '1',
  `get_view` enum('0','1') NOT NULL DEFAULT '1',
  `get_add` enum('0','1') NOT NULL DEFAULT '1',
  `get_edit` enum('0','1') NOT NULL DEFAULT '1',
  `get_delete` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_disabled_array` text NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `is_active` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fx_menu_main`
--

INSERT INTO `fx_menu_main` (`main_order_id`, `name`, `short_code`, `img`, `tree_view`, `is_admin`, `get_view`, `get_add`, `get_edit`, `get_delete`, `created_at`, `updated_at`, `is_disabled_array`, `status`, `is_active`) VALUES
(1, 'Dashboard', 'dashboard', '<i class=\"pg-icon\">home</i>', '0', '1', '1', '0', '0', '0', '2022-07-23 19:07:28', '2024-04-15 12:13:34', '', '1', '1'),
(2, 'Students', NULL, '<i class=\"pg-icon\">users</i>', '1', '1', '1', '1', '1', '1', '2024-01-15 10:45:35', '2024-04-15 12:42:48', '', '1', '1'),
(3, 'CMS', 'cms', '<i class=\"pg-icon\">pages</i>', '0', '1', '1', '', '', '', '2024-01-15 10:45:35', '2024-04-15 12:57:30', '', '', '1'),
(4, 'Reports', NULL, '<i class=\"pg-icon\">chart</i>', '1', '1', '1', '', '', '', '2024-01-15 10:45:35', '2024-04-15 12:47:41', '', '', '1'),
(5, 'Settings', 'settings', '<i class=\"pg-icon\">settings</i>', '0', '1', '1', '1', '1', '1', '2024-01-15 10:45:35', '2024-04-15 12:43:55', '', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `fx_menu_sub`
--

CREATE TABLE `fx_menu_sub` (
  `sub_order_id` int(11) NOT NULL,
  `main_order_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `short_code` text NOT NULL,
  `img` text DEFAULT NULL,
  `tree_view_list` enum('0','1') NOT NULL DEFAULT '1',
  `is_admin` enum('0','1','NIL') NOT NULL DEFAULT '1',
  `get_view` enum('0','1') NOT NULL DEFAULT '1',
  `get_add` enum('0','1') NOT NULL DEFAULT '1',
  `get_edit` enum('0','1') NOT NULL DEFAULT '1',
  `get_delete` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fx_menu_sub`
--

INSERT INTO `fx_menu_sub` (`sub_order_id`, `main_order_id`, `name`, `short_code`, `img`, `tree_view_list`, `is_admin`, `get_view`, `get_add`, `get_edit`, `get_delete`, `created_at`) VALUES
(1, 2, 'List Students', 'students', '<i class=\"pg-icon\">LS</i>', '1', '1', '1', '1', '1', '1', '2024-04-16 23:15:44'),
(2, 18, 'Customers Report', 'reports/examinees', NULL, '1', '1', '1', '0', '0', '0', '2024-01-16 21:12:47'),
(3, 18, 'Users Report', 'reports/staffs', NULL, '1', '1', '1', '0', '0', '0', '2024-01-16 21:12:38');

-- --------------------------------------------------------

--
-- Table structure for table `fx_message_tpl`
--

CREATE TABLE `fx_message_tpl` (
  `message_id` varchar(100) NOT NULL,
  `org_id` text NOT NULL,
  `sender` text NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `type` tinytext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fx_message_tpl`
--

INSERT INTO `fx_message_tpl` (`message_id`, `org_id`, `sender`, `subject`, `message`, `type`, `created_at`, `updated_at`) VALUES
('111e25ed-259f-4504-bfd8-29d6158ec1e5', 'JISCHOOL', 'Admin', 'Recolour', 'S1APzAr9zmxHTGRSOxA7+k++bDm1i6eq9h72pLhZkI1W+E17PdQE17l/knvLTJ7SQrvwgV4QpdrQVInAu5SucAEUkFaqFkx6ZJr1cRTPhQ+ureVkgiNzmzeQo8Uodw+3ZPQTbqvq2sv4EHRJCxR/CuT/2BPu5msvCKcQQbIIYOi8POsxmNx2sl9cT4X1Q3T/Jo+Vk43E73kV+IE7XpQ9cPiwabHLKHPcMAd6ua9hx9tPoxrTggQdQ/UGtloQfGES6+wkNiZ5IbBeJzDd0uFa5HkTIeH3uexEKcPRzBINpmliTDJTUDdPRNlRFrk+6Izo4K/kAxghV47A1p2ZUC0W6kvtfGRVntfBbi7lbcYeOVsoFN3utc4zIHpnLbNK8e5S2fp/o3nqcoiup0Ph3u3vVPVH++elLQyrM4stk4ZI9GCPI1Zb+vHKLgmaTWL8jj9frElHTlrHDPVSPJZvljDWhsm/Dbzomup6hM0qRSmpvzo0fJ8axGA5tJakNze/lpVS0Pj6lYEgRC/i8qs7Ib6YUt2NAdNZeLOXDS6MuO8alMaVYzMuXWAQO2VjSN9E+v0U6U0JbPw1ZWRrbR8K1l9ypLeUTyKPOMMIlM3yXImlkh22LrkcF7CPBbMPINCpD4gFNQXPqFZrvB/W7KVmN4Jkfwx63W7IPIQRH9fqKWKjuYtOR/wKPFmtQu1fWz2Go3urmZzK6FrK2ZnqfWITeaVM5aLPwZzrGTGePygxgYY+fCY/EZ73J1cOi1SQZynrvliAnyaxti7CmlK5cnJKWhMXTSL7gruM0JMsKCz76MzIvP4=', 'email', '2022-01-03 17:02:03', '2022-01-29 14:14:24'),
('41779f19-4a4d-4752-b032-a418ec8c5799', 'JISCHOOL', 'Principal', 'Congratulations!', '/SM1nhZ9R6/pQkhi3fD8gX2v6cx6dSc2XADzwgvRXZ6zOeLVznIVuu2RhF5bqHSkVwz5npfinoRLwbAXBo3SasMXytpW7AG3hSv2CCw7GgNkq4HwHXuJdsc6IZ1FY/hgAkBWy7FbIBonmL8ls5DSJTN1dwYRGKAKBE5rLlI4QppYKfYG/8m0QjnwmEPZtF78u5P2bc1b9Guv5IMy7lK3de7O5ZbKgnfXPRq7w59VMVNlO2732d7y2zk4PKb/sD+RLh7Wfc6YnoM9WfuWZd4POjp0bkv3uLlziWGdoG86mnIKSwlTZnOdRTKsobswPpaURo2NKbh9yEoaxwi6B555Nvdl0z+DCYCyKQpGs1/mb2g/YaQKmLUw+RMEW/6mLrEG2oJ5Ssr2M2VXdAs5PWoEz0wZk/AU82JjM5i5aCItfwMF/ukfoO4D6LRtcQcOUO8VCKY306QszLVgrqKckURgRlwPwAgS0GOLlrCervJcyIk=', 'email', '2022-01-05 07:31:19', '2022-01-29 14:14:07'),
('e5dc178d-8a1b-485f-9841-4ab2ac8d2931', 'JISCHOOL', 'Admin', 'Exam Notification!', 'KikZN1M7BoWHAWP9Uvrf/9b2fTy1RmFIY5AnHX6oMiIsRCKhIXnFLyufGJ77iIomaOcCPlUWsEAjQwlV4ifWhvFFgUeWVKdEwrGKCCCfGBavwTD8xfZJ3yBrt/nF3atqtzj7SSX2nR71ZzAIQNXYGWLXwyl6kPpnQNxK0uRMcqo=', 'sms', '2022-01-05 10:10:29', '2022-01-29 14:11:29');

-- --------------------------------------------------------

--
-- Table structure for table `fx_org`
--

CREATE TABLE `fx_org` (
  `type_id` int(11) DEFAULT 1,
  `reg_num` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `img` varchar(50) DEFAULT NULL,
  `img_white` varchar(50) DEFAULT NULL,
  `favicon` varchar(50) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(22) DEFAULT NULL,
  `slogan` tinytext DEFAULT NULL,
  `description` text DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `province` varchar(40) DEFAULT NULL,
  `county` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `org_id` varchar(100) NOT NULL,
  `default_row_per_page` int(11) NOT NULL DEFAULT 25,
  `default_template` varchar(20) NOT NULL DEFAULT 'default',
  `default_theme` varchar(20) NOT NULL DEFAULT 'default',
  `frontend_template` varchar(20) NOT NULL DEFAULT 'default',
  `frontend_theme` varchar(20) NOT NULL DEFAULT 'default',
  `license` text DEFAULT NULL,
  `license_package` varchar(100) DEFAULT 'Free',
  `license_start_date` datetime DEFAULT NULL,
  `license_end_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fx_org`
--

INSERT INTO `fx_org` (`type_id`, `reg_num`, `name`, `img`, `img_white`, `favicon`, `email`, `phone`, `slogan`, `description`, `website`, `address`, `province`, `county`, `country`, `org_id`, `default_row_per_page`, `default_template`, `default_theme`, `frontend_template`, `frontend_theme`, `license`, `license_package`, `license_start_date`, `license_end_date`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Benson Idahosa University', NULL, NULL, NULL, 'admin@biu.edu.ng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'BIU', 25, 'default', 'default', 'default', 'default', NULL, 'Free', NULL, NULL, '2024-04-15 00:00:03', '2024-04-16 00:39:49'),
(1, NULL, 'COMPANY NAME', NULL, NULL, NULL, 'amaezedan@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ORG', 25, 'default', 'default', 'default', 'default', NULL, 'Free', NULL, NULL, '2023-12-15 22:32:06', '2023-12-15 22:32:06');

-- --------------------------------------------------------

--
-- Table structure for table `fx_person`
--

CREATE TABLE `fx_person` (
  `user_id` varchar(100) NOT NULL,
  `org_id` varchar(100) DEFAULT NULL,
  `class_id` int(255) DEFAULT NULL,
  `section_id` int(255) DEFAULT NULL,
  `level_id` int(11) DEFAULT NULL,
  `parent_id` int(255) DEFAULT NULL,
  `sibling_id` int(255) DEFAULT NULL,
  `admission_no` varchar(100) DEFAULT NULL,
  `rfid_code` varchar(100) DEFAULT NULL,
  `admission_date` datetime DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `scholarship` enum('No','Yes') DEFAULT 'No',
  `img` text DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `gender` enum('Female','Male') DEFAULT NULL,
  `marital_status` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `school_house_id` int(11) DEFAULT NULL,
  `blood_group` varchar(200) DEFAULT NULL,
  `vehroute_id` int(11) DEFAULT NULL,
  `hostel_room_id` int(11) DEFAULT NULL,
  `is_guardian` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `father_phone` varchar(100) DEFAULT NULL,
  `father_occupation` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `mother_phone` varchar(100) DEFAULT NULL,
  `mother_occupation` varchar(100) DEFAULT NULL,
  `guardian_name` varchar(100) DEFAULT NULL,
  `guardian_relation` varchar(100) DEFAULT NULL,
  `guardian_phone` varchar(100) DEFAULT NULL,
  `guardian_occupation` varchar(150) DEFAULT NULL,
  `guardian_address` text DEFAULT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `father_pic` varchar(200) DEFAULT NULL,
  `mother_pic` varchar(200) DEFAULT NULL,
  `guardian_pic` varchar(200) DEFAULT NULL,
  `is_active` enum('0','1') DEFAULT '1',
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `disabled_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fx_person`
--

INSERT INTO `fx_person` (`user_id`, `org_id`, `class_id`, `section_id`, `level_id`, `parent_id`, `sibling_id`, `admission_no`, `rfid_code`, `admission_date`, `firstname`, `lastname`, `middlename`, `scholarship`, `img`, `phone`, `email`, `state`, `city`, `religion`, `dob`, `gender`, `marital_status`, `address`, `route_id`, `category_id`, `school_house_id`, `blood_group`, `vehroute_id`, `hostel_room_id`, `is_guardian`, `father_name`, `father_phone`, `father_occupation`, `mother_name`, `mother_phone`, `mother_occupation`, `guardian_name`, `guardian_relation`, `guardian_phone`, `guardian_occupation`, `guardian_address`, `guardian_email`, `father_pic`, `mother_pic`, `guardian_pic`, `is_active`, `note`, `created_at`, `updated_at`, `disabled_at`) VALUES
('8c487bd2-9639-430b-86f0-e8bf075e483c', 'BIU', NULL, NULL, NULL, NULL, NULL, 'WOF/109', NULL, NULL, 'Sikemi', 'Omobolanle', 'Deborah', 'No', '8c487bd2-9639-430b-86f0-e8bf075e483c.jpg', '08038835991', 'o.sikemi@gmail.com', NULL, NULL, NULL, NULL, 'Female', 'Married', 'no 2 samanja, Aba str, Nigeria', NULL, 'MATHEMATICS | STATISTICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', 'Beautiful, Hardworking and Creative', '2021-10-12 10:07:41', '2022-02-01 13:17:06', NULL),
('9e7f11ff-5686-461f-9401-76c5c45a2c84', 'BIU', NULL, NULL, NULL, NULL, NULL, 'WOF/102', NULL, NULL, 'Damijo', 'Mofe', 'Richard', 'No', '.jpg', '09843534543', 'm.damijo@gmail.com', NULL, NULL, NULL, NULL, 'Male', '', 'no 2 ojuelegba, Aba st', NULL, 'MATHEMATICS | STATISTICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2021-10-12 10:41:33', '2022-02-01 13:17:15', NULL),
('a915245a-ce55-48c8-b724-aea012cf6d71', 'BIU', NULL, NULL, NULL, NULL, NULL, 'WOF/664', NULL, NULL, 'Oghenekevwe', 'Degarson', NULL, 'No', NULL, '(234)703-043-4443', 'o.degarson@gmail.co.uk', NULL, NULL, NULL, NULL, 'Male', '', 'no 3 oluko str, Benin City, Edo State', NULL, 'MATHEMATICS | STATISTICS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2021-10-12 21:02:50', '2022-02-01 13:16:55', NULL),
('5b57d43c-58c0-4a3e-ba15-dea4eba952e6', 'BIU', NULL, NULL, NULL, NULL, NULL, 'WOF/155', NULL, NULL, 'Chinemelum', 'Obi', NULL, 'No', NULL, '08022833135', 'chinemelum.obi@gmail.com', NULL, NULL, NULL, NULL, 'Female', '', 'no 2 ojuelegba, Aba st', NULL, 'MATHEMATICS | COMPUTER SCIENCE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2021-10-12 21:04:21', '2022-02-01 13:16:44', NULL),
('34a99859-64f3-472a-b640-483973600342', 'BIU', NULL, NULL, NULL, NULL, NULL, 'WOF/119', NULL, NULL, 'Gift', 'Eze', NULL, 'No', NULL, '08038835992', 'ezeg@yahoo.com', NULL, NULL, NULL, NULL, 'Female', '', '11 olatunji str, surulere', NULL, 'ENGINEERING | CHEMICAL ENGINEERING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2021-12-16 18:05:01', '2022-02-01 13:16:33', NULL),
('eae3cf39-3af2-4b15-a6bb-bab7058bc9d2', 'BIU', NULL, NULL, NULL, NULL, NULL, 'JIS001', NULL, NULL, 'Ogechi', 'Blessing', NULL, 'No', NULL, '7034989903', 'ogechi.blessing@gmail.com', NULL, NULL, NULL, NULL, 'Female', '', 'no 4 olatunji, along igando, Lagos State', NULL, 'MATHEMATICS | COMPUTER SCIENCE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2022-01-08 14:49:14', '2022-02-01 13:16:11', NULL),
('ca37ca42-36dc-452f-836d-cc39be897410', 'BIU', NULL, NULL, NULL, NULL, NULL, 'JIS002', NULL, NULL, 'Ekene', 'Ehirim', NULL, 'No', NULL, '70133983444', 'ekene.ehirim@gmail.com', NULL, NULL, NULL, NULL, 'Male', '', 'no 5, emeka ehirim str, Arogba, Benin City, Edo State', NULL, 'ENGINEERING | CHEMICAL ENGINEERING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2022-01-08 14:49:15', '2022-02-01 13:15:57', NULL),
('cca9ce12-b474-4633-997d-43567bd83d60', 'BIU', NULL, NULL, NULL, NULL, NULL, 'JIS194', NULL, NULL, 'Clinton', 'Elliot', NULL, 'No', NULL, '08075564455', 'clinton.elliot@gmail.com', NULL, NULL, NULL, NULL, 'Male', NULL, 'no 3 oluko str, Benin City, Edo State', NULL, 'ENGINEERING | CHEMICAL ENGINEERING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2022-01-21 13:26:22', '2022-02-02 09:21:50', NULL),
('ea01baa8-6530-44ac-92d1-48331a9c6577', 'BIU', 0, 0, NULL, NULL, NULL, 'CD001', NULL, '0000-00-00 00:00:00', 'Sonic', 'Plastics', NULL, 'No', NULL, '2347039876678', 'supplier@sonicplastics.com', NULL, NULL, 'Christian', '0000-00-00 00:00:00', 'Male', NULL, NULL, NULL, 'FT', NULL, 'fulltime', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2024-04-21 21:57:45', '2024-04-21 22:04:21', NULL),
('c0d82b34-904a-48e7-9ba8-afb7031caa6a', 'BIU', NULL, NULL, NULL, NULL, NULL, 'BIU090', NULL, NULL, 'Oge', 'Juliet', NULL, 'No', NULL, '08077566443', 'oge.juliet@mail.com', NULL, NULL, NULL, NULL, 'Male', NULL, NULL, NULL, 'FT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2024-04-21 22:05:13', '2024-04-21 22:05:13', NULL),
('b35eca80-8850-4ddb-837d-eaed7f7712e2', 'BIU', NULL, NULL, NULL, NULL, NULL, 'BIU091', NULL, NULL, 'Sasuke', 'Uchiha', NULL, 'No', NULL, '08038835992', 'chazekagbor@gmail.com', NULL, NULL, NULL, NULL, 'Male', NULL, NULL, NULL, 'FT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '2024-04-21 22:06:05', '2024-04-21 22:06:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fx_reset_password`
--

CREATE TABLE `fx_reset_password` (
  `token_id` varchar(255) NOT NULL,
  `org_id` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fx_roles`
--

CREATE TABLE `fx_roles` (
  `role_id` varchar(100) NOT NULL,
  `org_id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `note` text DEFAULT NULL,
  `is_active` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '1',
  `is_superadmin` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fx_roles`
--

INSERT INTO `fx_roles` (`role_id`, `org_id`, `name`, `note`, `is_active`, `is_superadmin`, `created_at`, `updated_at`) VALUES
('1', '0', 'Super-Administrator', '', '1', '1', '2021-10-12 09:21:02', '2023-11-16 12:29:44'),
('2', '0', 'Administrator', '', '1', '0', '2021-10-12 09:21:11', '2023-11-16 12:29:02'),
('3', '0', 'Customer', '', '1', '0', '2021-10-12 09:21:17', '2023-11-16 12:29:10'),
('4', '0', 'Guest', '', '1', '0', '2023-12-03 19:08:15', '2023-12-03 19:08:44');

-- --------------------------------------------------------

--
-- Table structure for table `fx_roles_permissions`
--

CREATE TABLE `fx_roles_permissions` (
  `role_id` varchar(100) NOT NULL,
  `org_id` varchar(100) NOT NULL,
  `main_order_id` int(11) DEFAULT NULL,
  `sub_order_id` int(11) DEFAULT NULL,
  `permission` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fx_staff`
--

CREATE TABLE `fx_staff` (
  `user_id` varchar(100) NOT NULL,
  `org_id` varchar(100) NOT NULL,
  `role_id` varchar(100) NOT NULL,
  `employee_id` varchar(100) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `qualification` varchar(200) DEFAULT NULL,
  `work_exp` varchar(200) DEFAULT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) DEFAULT NULL,
  `father_name` varchar(200) DEFAULT NULL,
  `mother_name` varchar(200) DEFAULT NULL,
  `phone` varchar(200) NOT NULL,
  `rfid_code` varchar(25) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `dob` date NOT NULL,
  `marital_status` varchar(100) DEFAULT NULL,
  `religion` varchar(50) DEFAULT NULL,
  `date_of_joining` date NOT NULL,
  `date_of_leaving` date DEFAULT NULL,
  `address` text NOT NULL,
  `note` text DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `account_title` varchar(200) DEFAULT NULL,
  `bank_account_no` varchar(200) DEFAULT NULL,
  `bank_name` varchar(200) DEFAULT NULL,
  `payscale` varchar(200) DEFAULT NULL,
  `basic_salary` varchar(200) DEFAULT NULL,
  `epf_no` varchar(200) DEFAULT NULL,
  `contract_type` varchar(100) DEFAULT NULL,
  `shift` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `twitter` varchar(200) DEFAULT NULL,
  `linkedin` varchar(200) DEFAULT NULL,
  `instagram` varchar(200) DEFAULT NULL,
  `resume` varchar(200) DEFAULT NULL,
  `joining_letter` varchar(200) DEFAULT NULL,
  `resignation_letter` varchar(200) DEFAULT NULL,
  `other_document` varchar(200) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `disabled_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fx_staff`
--

INSERT INTO `fx_staff` (`user_id`, `org_id`, `role_id`, `employee_id`, `department`, `designation`, `qualification`, `work_exp`, `firstname`, `lastname`, `middlename`, `father_name`, `mother_name`, `phone`, `rfid_code`, `email`, `dob`, `marital_status`, `religion`, `date_of_joining`, `date_of_leaving`, `address`, `note`, `img`, `gender`, `account_title`, `bank_account_no`, `bank_name`, `payscale`, `basic_salary`, `epf_no`, `contract_type`, `shift`, `location`, `facebook`, `twitter`, `linkedin`, `instagram`, `resume`, `joining_letter`, `resignation_letter`, `other_document`, `is_active`, `created_at`, `updated_at`, `disabled_at`) VALUES
('67ecea4c-5ff0-44b5-92c5-bcd86bcf1720-20231216-003205', 'ORG', '1', '1', NULL, NULL, NULL, NULL, 'Admin', 'Operator', NULL, NULL, NULL, 'NIL', NULL, 'amaezedan@gmail.com', '1989-01-01', NULL, NULL, '2023-12-16', NULL, 'NIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-12-15 22:32:05', '2023-12-15 22:32:05', NULL),
('ad63a044-06f8-4717-a6b0-17cee99bb5e8-20240415-010002', 'BIU', '2', '001', NULL, NULL, NULL, NULL, 'Akoma', 'Osondu', NULL, NULL, NULL, '234', NULL, 'admin@biu.edu.ng', '1989-01-01', NULL, NULL, '2024-04-15', NULL, 'Lagos, Nigeria', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-04-15 00:00:03', '2024-04-15 00:00:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `fx_user`
--

CREATE TABLE `fx_user` (
  `user_id` varchar(100) NOT NULL,
  `org_id` varchar(100) NOT NULL,
  `user_name` tinytext NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_pass` text NOT NULL,
  `user_role` varchar(100) NOT NULL,
  `user_phone` varchar(22) DEFAULT NULL,
  `user_sid` int(20) DEFAULT NULL,
  `user_options` text DEFAULT NULL,
  `user_avatar` varchar(100) DEFAULT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fx_user`
--

INSERT INTO `fx_user` (`user_id`, `org_id`, `user_name`, `user_email`, `user_pass`, `user_role`, `user_phone`, `user_sid`, `user_options`, `user_avatar`, `is_active`, `created_at`) VALUES
('34a99859-64f3-472a-b640-483973600342', 'BIU', 'GiftEze', 'ezeg@yahoo.com', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '3', '08038835992', NULL, NULL, NULL, '1', '2021-12-16 18:05:01'),
('5b57d43c-58c0-4a3e-ba15-dea4eba952e6', 'BIU', 'ChinemelumObi', 'chinemelum.obi@gmail.com', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '3', '08022833135', NULL, NULL, NULL, '1', '2021-10-12 21:04:21'),
('67ecea4c-5ff0-44b5-92c5-bcd86bcf1720-20231216-003205', 'ORG', 'admin.o', 'amaezedan@gmail.com', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '1', 'NIL', NULL, NULL, NULL, '1', '2023-12-15 22:32:05'),
('8c487bd2-9639-430b-86f0-e8bf075e483c', 'BIU', 'SikemiOmobolanle', 'o.sikemi@gmail.com', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '3', '08038835992', NULL, NULL, NULL, '1', '2021-10-12 10:07:40'),
('9e7f11ff-5686-461f-9401-76c5c45a2c84', 'BIU', 'DamijoMofe', 'm.damijo@gmail.com', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '3', '09843534543', NULL, NULL, NULL, '1', '2021-10-12 10:41:33'),
('a915245a-ce55-48c8-b724-aea012cf6d71', 'BIU', 'OghenekevweDegarson', 'o.degarson@gmail.co.uk', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '3', '(234)703-043-4443', NULL, NULL, NULL, '1', '2021-10-12 21:02:50'),
('ad63a044-06f8-4717-a6b0-17cee99bb5e8-20240415-010002', 'BIU', 'akoma.osondu', 'admin@biu.edu.ng', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '2', '234', NULL, NULL, NULL, '1', '2024-04-15 00:00:02'),
('b35eca80-8850-4ddb-837d-eaed7f7712e2', 'BIU', 'sasuke.uchiha', 'chazekagbor@gmail.com', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '3', '08038835992', NULL, NULL, NULL, '1', '2024-04-21 22:06:04'),
('c0d82b34-904a-48e7-9ba8-afb7031caa6a', 'BIU', 'oge.juliet', 'oge.juliet@mail.com', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '3', '08077566443', NULL, NULL, NULL, '1', '2024-04-21 22:05:12'),
('ca37ca42-36dc-452f-836d-cc39be897410', 'BIU', 'EkeneEhirim', 'ekene.ehirim@gmail.com', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '3', '70133983444', NULL, NULL, NULL, '1', '2022-01-08 14:49:15'),
('cca9ce12-b474-4633-997d-43567bd83d60', 'BIU', 'clinton.elliot', 'clinton.elliot@gmail.com', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '3', '08075564455', NULL, NULL, NULL, '1', '2022-01-21 13:26:22'),
('ea01baa8-6530-44ac-92d1-48331a9c6577', 'BIU', 'sonic.plastics', 'supplier@sonicplastics.com', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '3', NULL, NULL, NULL, NULL, '1', '2024-04-21 21:57:44'),
('eae3cf39-3af2-4b15-a6bb-bab7058bc9d2', 'BIU', 'OgechiBlessing', 'ogechi.blessing@gmail.com', '511d86ee2ab8b049118b2e836c2d6afacb8193a0d475b84e66e6202bf4c26032945f2f2b3953725e3e01e122b470135c4ca803e0d4dfed7ccf4e38fdea8e8011', '3', '7034989903', NULL, NULL, NULL, '1', '2022-01-08 14:49:14');

-- --------------------------------------------------------

--
-- Table structure for table `fx_user_session`
--

CREATE TABLE `fx_user_session` (
  `session_id` varchar(255) NOT NULL,
  `org_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `user_email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fx_user_session`
--

INSERT INTO `fx_user_session` (`session_id`, `org_id`, `user_id`, `user_email`) VALUES
('g7q32j877nr12h3fq3q1qt5i59', 'BIU', 'ad63a044-06f8-4717-a6b0-17cee99bb5e8-20240415-010002', 'admin@biu.edu.ng');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fx_currencies`
--
ALTER TABLE `fx_currencies`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `fx_menu_main`
--
ALTER TABLE `fx_menu_main`
  ADD PRIMARY KEY (`main_order_id`);

--
-- Indexes for table `fx_menu_sub`
--
ALTER TABLE `fx_menu_sub`
  ADD PRIMARY KEY (`sub_order_id`);

--
-- Indexes for table `fx_message_tpl`
--
ALTER TABLE `fx_message_tpl`
  ADD UNIQUE KEY `message_id` (`message_id`);

--
-- Indexes for table `fx_org`
--
ALTER TABLE `fx_org`
  ADD UNIQUE KEY `org_email` (`email`),
  ADD UNIQUE KEY `org_id` (`org_id`);

--
-- Indexes for table `fx_person`
--
ALTER TABLE `fx_person`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `fx_reset_password`
--
ALTER TABLE `fx_reset_password`
  ADD PRIMARY KEY (`token_id`);

--
-- Indexes for table `fx_roles`
--
ALTER TABLE `fx_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `fx_staff`
--
ALTER TABLE `fx_staff`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `fx_user`
--
ALTER TABLE `fx_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`,`user_email`) USING HASH;

--
-- Indexes for table `fx_user_session`
--
ALTER TABLE `fx_user_session`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fx_currencies`
--
ALTER TABLE `fx_currencies`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fx_person`
--
ALTER TABLE `fx_person`
  ADD CONSTRAINT `fx_person_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `fx_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fx_staff`
--
ALTER TABLE `fx_staff`
  ADD CONSTRAINT `fx_staff_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `fx_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

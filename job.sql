-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2023 at 01:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job`
--

-- --------------------------------------------------------

--
-- Table structure for table `abouts`
--

CREATE TABLE `abouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `about_title` varchar(255) NOT NULL,
  `about_sub_title` varchar(255) NOT NULL,
  `about_description` text NOT NULL,
  `about_brand_logo` varchar(255) NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-1.png',
  `about_brand_logo1` varchar(255) NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-2.png',
  `about_brand_logo2` varchar(255) NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-3.png',
  `about_brand_logo3` varchar(255) NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-1.png',
  `about_brand_logo4` varchar(255) NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-2.png',
  `about_brand_logo5` varchar(255) NOT NULL DEFAULT 'frontend/assets/images/all-img/brand-3.png',
  `about_banner_img` varchar(255) NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-1.jpg',
  `about_banner_img1` varchar(255) NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-1.jpg',
  `about_banner_img2` varchar(255) NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-1.jpg',
  `about_banner_img3` varchar(255) NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-1.jpg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'backend/image/default.png',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'omar', 'admin@gmail.com', '2023-09-13 02:49:39', '$2y$10$qbn49d.JwwF..9Qz/RjiX.lttNqf.X1rVhePEt1wBNSQ8FMVaRE6i', 'uploads/user/1700391020_6559e86c8d939.jpg', 'xHIOU1FH0s14rs5mBRZREP9IVgEP6mT1bqDwaK0ADb5Epg8v1qbhhmi5oJoA', '2023-11-18 02:49:39', '2023-11-19 07:50:20'),
(2, 'salah', 'salah@gmail.com', NULL, '$2y$10$XcJiGmAJbS40bK6BRRs06eKw/HI/jVn/3BCLpP40mS/f/K2GPdHO2', 'uploads/user/1700400433_655a0d319160e.png', NULL, '2023-11-19 13:27:13', '2023-11-19 13:27:13');

-- --------------------------------------------------------

--
-- Table structure for table `admin_searches`
--

CREATE TABLE `admin_searches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `application_groups`
--

CREATE TABLE `application_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT 0,
  `is_deleteable` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `application_groups`
--

INSERT INTO `application_groups` (`id`, `company_id`, `name`, `order`, `is_deleteable`, `created_at`, `updated_at`) VALUES
(1, 1, 'No Group', 1, 0, '2023-11-19 14:07:16', '2023-11-19 14:07:16'),
(2, 1, 'All Applications', 1, 1, '2023-11-19 14:07:16', '2023-11-19 14:07:16'),
(3, 1, 'Shortlisted', 2, 1, '2023-11-19 14:07:16', '2023-11-19 14:07:16'),
(4, 1, 'Interview', 3, 1, '2023-11-19 14:07:16', '2023-11-19 14:07:16'),
(5, 1, 'Rejected', 4, 1, '2023-11-19 14:07:16', '2023-11-19 14:07:16');

-- --------------------------------------------------------

--
-- Table structure for table `applied_jobs`
--

CREATE TABLE `applied_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `candidate_resume_id` bigint(20) UNSIGNED NOT NULL,
  `cover_letter` longtext DEFAULT NULL,
  `application_group_id` bigint(20) UNSIGNED NOT NULL,
  `order` smallint(6) NOT NULL DEFAULT 0,
  `answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`answers`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `benefits`
--

CREATE TABLE `benefits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `benefits`
--

INSERT INTO `benefits` (`id`, `company_id`, `created_at`, `updated_at`) VALUES
(1, NULL, '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(2, NULL, '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(3, NULL, '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(4, NULL, '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(5, NULL, '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(6, NULL, '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(7, NULL, '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(8, NULL, '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(9, NULL, '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(10, NULL, '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(11, NULL, '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(12, NULL, '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(13, NULL, '2023-09-13 02:50:00', '2023-09-13 02:50:00'),
(14, NULL, '2023-09-13 02:50:00', '2023-09-13 02:50:00'),
(15, NULL, '2023-09-13 02:50:00', '2023-09-13 02:50:00'),
(16, NULL, '2023-09-13 02:50:00', '2023-09-13 02:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `benefit_translations`
--

CREATE TABLE `benefit_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `benefit_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `benefit_translations`
--

INSERT INTO `benefit_translations` (`id`, `benefit_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, '400k', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(2, 2, 'Distribution team', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(3, 3, 'Async', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(4, 4, 'Vision insurance', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(5, 5, 'Unlimited vacation', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(6, 6, 'Paid time off', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(7, 7, '4 day workweek', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(8, 8, 'Company retreats', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(9, 9, 'Coworking budget', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(10, 10, 'Learning budget', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(11, 11, 'Free gym membership', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(12, 12, 'Home office budget', 'en', '2023-09-13 02:50:00', '2023-09-13 02:50:00'),
(13, 13, 'Pay in crypto', 'en', '2023-09-13 02:50:00', '2023-09-13 02:50:00'),
(14, 14, 'Profit sharing', 'en', '2023-09-13 02:50:00', '2023-09-13 02:50:00'),
(15, 15, 'No policies at work', 'en', '2023-09-13 02:50:00', '2023-09-13 02:50:00'),
(16, 16, 'Equity compensation', 'en', '2023-09-13 02:50:00', '2023-09-13 02:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_candidate_company`
--

CREATE TABLE `bookmark_candidate_company` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_candidate_job`
--

CREATE TABLE `bookmark_candidate_job` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_company`
--

CREATE TABLE `bookmark_company` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bookmark_company_category`
--

CREATE TABLE `bookmark_company_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bookmark_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profession_id` bigint(20) UNSIGNED DEFAULT NULL,
  `experience_id` bigint(20) UNSIGNED DEFAULT NULL,
  `education_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `cv` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT 1,
  `cv_visibility` tinyint(1) NOT NULL DEFAULT 1,
  `received_job_alert` tinyint(1) NOT NULL DEFAULT 1,
  `profile_complete` int(11) NOT NULL DEFAULT 100,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `exact_location` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `status` enum('available','not_available','available_in') NOT NULL DEFAULT 'available',
  `available_in` date DEFAULT NULL,
  `whatsapp_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `user_id`, `role_id`, `profession_id`, `experience_id`, `education_id`, `title`, `first_name`, `last_name`, `gender`, `website`, `photo`, `cv`, `bio`, `marital_status`, `birth_date`, `visibility`, `cv_visibility`, `received_job_alert`, `profile_complete`, `created_at`, `updated_at`, `address`, `exact_location`, `neighborhood`, `locality`, `place`, `district`, `postcode`, `region`, `country`, `long`, `lat`, `status`, `available_in`, `whatsapp_number`) VALUES
(1, 2, 1, 1, 2, 3, NULL, NULL, NULL, NULL, NULL, 'uploads/images/candidates/1700406131_655a237392ff4.png', NULL, NULL, NULL, '2023-11-23 00:00:00', 1, 1, 1, 75, '2023-11-19 14:59:18', '2023-11-19 15:02:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'available', NULL, NULL),
(2, 3, 1, 1, 2, 5, 'amman', NULL, NULL, NULL, 'https://omar.com', 'uploads/images/candidates/1700414543_655a444fd0a9e.png', NULL, NULL, NULL, '2000-02-21 00:00:00', 1, 1, 1, 75, '2023-11-19 17:20:20', '2023-11-19 17:22:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'available', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `candidate_cv_views`
--

CREATE TABLE `candidate_cv_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `view_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_education`
--

CREATE TABLE `candidate_education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `level` varchar(255) NOT NULL,
  `degree` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_experiences`
--

CREATE TABLE `candidate_experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `company` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `start` date NOT NULL,
  `end` date DEFAULT NULL,
  `responsibilities` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currently_working` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_job_alerts`
--

CREATE TABLE `candidate_job_alerts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `job_role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candidate_job_alerts`
--

INSERT INTO `candidate_job_alerts` (`id`, `candidate_id`, `job_role_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2023-11-19 17:23:08', '2023-11-19 17:23:08'),
(2, 2, 1, '2023-11-19 17:23:08', '2023-11-19 17:23:08');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_language`
--

CREATE TABLE `candidate_language` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `candidate_language_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_languages`
--

CREATE TABLE `candidate_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candidate_languages`
--

INSERT INTO `candidate_languages` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Abkhaz', 'abkhaz', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(2, 'Afar', 'afar', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(3, 'Afrikaans', 'afrikaans', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(4, 'Akan', 'akan', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(5, 'Albanian', 'albanian', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(6, 'Amharic', 'amharic', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(7, 'Arabic', 'arabic', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(8, 'Aragonese', 'aragonese', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(9, 'Armenian', 'armenian', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(10, 'Assamese', 'assamese', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(11, 'Avaric', 'avaric', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(12, 'Avestan', 'avestan', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(13, 'Aymara', 'aymara', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(14, 'Azerbaijani', 'azerbaijani', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(15, 'Bambara', 'bambara', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(16, 'Bashkir', 'bashkir', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(17, 'Basque', 'basque', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(18, 'Belarusian', 'belarusian', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(19, 'Bengali', 'bengali', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(20, 'Bihari', 'bihari', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(21, 'Bislama', 'bislama', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(22, 'Bosnian', 'bosnian', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(23, 'Breton', 'breton', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(24, 'Bulgarian', 'bulgarian', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(25, 'Burmese', 'burmese', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(26, 'Catalan; Valencian', 'catalan-valencian', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(27, 'Chamorro', 'chamorro', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(28, 'Chechen', 'chechen', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(29, 'Chichewa; Chewa; Nyanja', 'chichewa-chewa-nyanja', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(30, 'Chinese', 'chinese', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(31, 'Chuvash', 'chuvash', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(32, 'Cornish', 'cornish', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(33, 'Corsican', 'corsican', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(34, 'Cree', 'cree', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(35, 'Croatian', 'croatian', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(36, 'Czech', 'czech', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(37, 'Danish', 'danish', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(38, 'Divehi; Dhivehi; Maldivian;', 'divehi-dhivehi-maldivian', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(39, 'Dutch', 'dutch', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(40, 'English', 'english', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(41, 'Esperanto', 'esperanto', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(42, 'Estonian', 'estonian', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(43, 'Ewe', 'ewe', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(44, 'Faroese', 'faroese', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(45, 'Fijian', 'fijian', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(46, 'Finnish', 'finnish', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(47, 'French', 'french', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(48, 'Fula; Fulah; Pulaar; Pular', 'fula-fulah-pulaar-pular', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(49, 'Galician', 'galician', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(50, 'Georgian', 'georgian', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(51, 'German', 'german', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(52, 'Greek, Modern', 'greek-modern', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(53, 'Guaraní', 'guarani', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(54, 'Gujarati', 'gujarati', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(55, 'Haitian; Haitian Creole', 'haitian-haitian-creole', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(56, 'Hausa', 'hausa', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(57, 'Hebrew', 'hebrew', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(58, 'Hebrew', 'hebrew', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(59, 'Herero', 'herero', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(60, 'Hindi', 'hindi', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(61, 'Hiri Motu', 'hiri-motu', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(62, 'Hungarian', 'hungarian', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(63, 'Interlingua', 'interlingua', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(64, 'Indonesian', 'indonesian', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(65, 'Interlingue', 'interlingue', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(66, 'Irish', 'irish', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(67, 'Igbo', 'igbo', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(68, 'Inupiaq', 'inupiaq', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(69, 'Ido', 'ido', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(70, 'Icelandic', 'icelandic', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(71, 'Italian', 'italian', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(72, 'Inuktitut', 'inuktitut', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(73, 'Japanese', 'japanese', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(74, 'Javanese', 'javanese', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(75, 'Kalaallisut, Greenlandic', 'kalaallisut-greenlandic', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(76, 'Kannada', 'kannada', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(77, 'Kanuri', 'kanuri', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(78, 'Kashmiri', 'kashmiri', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(79, 'Kazakh', 'kazakh', '2023-09-13 02:49:56', '2023-09-13 02:49:56'),
(80, 'Khmer', 'khmer', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(81, 'Kikuyu, Gikuyu', 'kikuyu-gikuyu', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(82, 'Kinyarwanda', 'kinyarwanda', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(83, 'Kirghiz, Kyrgyz', 'kirghiz-kyrgyz', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(84, 'Komi', 'komi', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(85, 'Kongo', 'kongo', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(86, 'Korean', 'korean', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(87, 'Kurdish', 'kurdish', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(88, 'Kwanyama, Kuanyama', 'kwanyama-kuanyama', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(89, 'Latin', 'latin', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(90, 'Luxembourgish, Letzeburgesch', 'luxembourgish-letzeburgesch', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(91, 'Luganda', 'luganda', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(92, 'Limburgish, Limburgan, Limburger', 'limburgish-limburgan-limburger', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(93, 'Lingala', 'lingala', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(94, 'Lao', 'lao', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(95, 'Lithuanian', 'lithuanian', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(96, 'Luba-Katanga', 'luba-katanga', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(97, 'Latvian', 'latvian', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(98, 'Manx', 'manx', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(99, 'Macedonian', 'macedonian', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(100, 'Malagasy', 'malagasy', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(101, 'Malay', 'malay', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(102, 'Malayalam', 'malayalam', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(103, 'Maltese', 'maltese', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(104, 'Māori', 'maori', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(105, 'Marathi (Marāṭhī)', 'marathi-marathi', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(106, 'Marshallese', 'marshallese', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(107, 'Mongolian', 'mongolian', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(108, 'Nauru', 'nauru', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(109, 'Navajo, Navaho', 'navajo-navaho', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(110, 'Norwegian Bokmål', 'norwegian-bokmal', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(111, 'North Ndebele', 'north-ndebele', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(112, 'Nepali', 'nepali', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(113, 'Ndonga', 'ndonga', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(114, 'Norwegian Nynorsk', 'norwegian-nynorsk', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(115, 'Norwegian', 'norwegian', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(116, 'Nuosu', 'nuosu', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(117, 'South Ndebele', 'south-ndebele', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(118, 'Occitan', 'occitan', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(119, 'Ojibwe, Ojibwa', 'ojibwe-ojibwa', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(120, 'Old Church Slavonic, Church Slavic, Church Slavonic, Old Bulgarian, Old Slavonic', 'old-church-slavonic-church-slavic-church-slavonic-old-bulgarian-old-slavonic', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(121, 'Oromo', 'oromo', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(122, 'Oriya', 'oriya', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(123, 'Ossetian, Ossetic', 'ossetian-ossetic', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(124, 'Panjabi, Punjabi', 'panjabi-punjabi', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(125, 'Pāli', 'pali', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(126, 'Persian', 'persian', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(127, 'Polish', 'polish', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(128, 'Pashto, Pushto', 'pashto-pushto', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(129, 'Portuguese', 'portuguese', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(130, 'Quechua', 'quechua', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(131, 'Romansh', 'romansh', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(132, 'Kirundi', 'kirundi', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(133, 'Romanian, Moldavian, Moldovan', 'romanian-moldavian-moldovan', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(134, 'Russian', 'russian', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(135, 'Sanskrit (Saṁskṛta)', 'sanskrit-saskta', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(136, 'Sardinian', 'sardinian', '2023-09-13 02:49:57', '2023-09-13 02:49:57'),
(137, 'Sindhi', 'sindhi', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(138, 'Northern Sami', 'northern-sami', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(139, 'Samoan', 'samoan', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(140, 'Sango', 'sango', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(141, 'Serbian', 'serbian', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(142, 'Scottish Gaelic; Gaelic', 'scottish-gaelic-gaelic', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(143, 'Shona', 'shona', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(144, 'Sinhala, Sinhalese', 'sinhala-sinhalese', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(145, 'Slovak', 'slovak', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(146, 'Slovene', 'slovene', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(147, 'Somali', 'somali', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(148, 'Southern Sotho', 'southern-sotho', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(149, 'Spanish; Castilian', 'spanish-castilian', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(150, 'Sundanese', 'sundanese', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(151, 'Swahili', 'swahili', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(152, 'Swati', 'swati', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(153, 'Swedish', 'swedish', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(154, 'Tamil', 'tamil', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(155, 'Telugu', 'telugu', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(156, 'Tajik', 'tajik', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(157, 'Thai', 'thai', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(158, 'Tigrinya', 'tigrinya', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(159, 'Tibetan Standard, Tibetan, Central', 'tibetan-standard-tibetan-central', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(160, 'Turkmen', 'turkmen', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(161, 'Tagalog', 'tagalog', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(162, 'Tswana', 'tswana', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(163, 'Tonga (Tonga Islands)', 'tonga-tonga-islands', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(164, 'Turkish', 'turkish', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(165, 'Tsonga', 'tsonga', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(166, 'Tatar', 'tatar', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(167, 'Twi', 'twi', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(168, 'Tahitian', 'tahitian', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(169, 'Uighur, Uyghur', 'uighur-uyghur', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(170, 'Ukrainian', 'ukrainian', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(171, 'Urdu', 'urdu', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(172, 'Uzbek', 'uzbek', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(173, 'Venda', 'venda', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(174, 'Vietnamese', 'vietnamese', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(175, 'Volapük', 'volapuk', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(176, 'Walloon', 'walloon', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(177, 'Welsh', 'welsh', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(178, 'Wolof', 'wolof', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(179, 'Western Frisian', 'western-frisian', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(180, 'Xhosa', 'xhosa', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(181, 'Yiddish', 'yiddish', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(182, 'Yoruba', 'yoruba', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(183, 'Zhuang, Chuang', 'zhuang-chuang', '2023-09-13 02:49:58', '2023-09-13 02:49:58');

-- --------------------------------------------------------

--
-- Table structure for table `candidate_resumes`
--

CREATE TABLE `candidate_resumes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `candidate_skill`
--

CREATE TABLE `candidate_skill` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `skill_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `about_brand_logo` varchar(255) DEFAULT NULL,
  `about_brand_logo1` varchar(255) DEFAULT NULL,
  `about_brand_logo2` varchar(255) DEFAULT NULL,
  `about_brand_logo3` varchar(255) DEFAULT NULL,
  `about_brand_logo4` varchar(255) DEFAULT NULL,
  `about_brand_logo5` varchar(255) DEFAULT NULL,
  `about_banner_img` varchar(255) DEFAULT NULL,
  `about_banner_img1` varchar(255) DEFAULT NULL,
  `about_banner_img2` varchar(255) DEFAULT NULL,
  `about_banner_img3` varchar(255) DEFAULT NULL,
  `mission_image` varchar(255) DEFAULT NULL,
  `candidate_image` varchar(255) DEFAULT NULL,
  `employers_image` varchar(255) DEFAULT NULL,
  `contact_map` text NOT NULL,
  `register_page_image` varchar(255) DEFAULT NULL,
  `login_page_image` varchar(255) DEFAULT NULL,
  `home_page_banner_image` varchar(255) DEFAULT NULL,
  `page403_image` varchar(255) DEFAULT NULL,
  `page404_image` varchar(255) DEFAULT NULL,
  `page500_image` varchar(255) DEFAULT NULL,
  `page503_image` varchar(255) DEFAULT NULL,
  `comingsoon_image` varchar(255) DEFAULT NULL,
  `footer_phone_no` varchar(255) DEFAULT NULL,
  `footer_facebook_link` varchar(255) DEFAULT NULL,
  `footer_instagram_link` varchar(255) DEFAULT NULL,
  `footer_twitter_link` varchar(255) DEFAULT NULL,
  `footer_youtube_link` varchar(255) DEFAULT NULL,
  `privary_page` longtext DEFAULT NULL,
  `terms_page` longtext DEFAULT NULL,
  `refund_page` longtext DEFAULT NULL,
  `maintenance_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `about_brand_logo`, `about_brand_logo1`, `about_brand_logo2`, `about_brand_logo3`, `about_brand_logo4`, `about_brand_logo5`, `about_banner_img`, `about_banner_img1`, `about_banner_img2`, `about_banner_img3`, `mission_image`, `candidate_image`, `employers_image`, `contact_map`, `register_page_image`, `login_page_image`, `home_page_banner_image`, `page403_image`, `page404_image`, `page500_image`, `page503_image`, `comingsoon_image`, `footer_phone_no`, `footer_facebook_link`, `footer_instagram_link`, `footer_twitter_link`, `footer_youtube_link`, `privary_page`, `terms_page`, `refund_page`, `maintenance_image`, `created_at`, `updated_at`) VALUES
(1, '', 'uploads/about/1700395875_6559fb63e9438.png', 'uploads/about/1700395937_6559fba12dc02.png', 'uploads/about/1700395875_6559fb63e9857.png', 'uploads/about/1700395937_6559fba12df3c.png', '', 'uploads/about/1700398364_655a051c09a37.png', 'uploads/about/1700397121_655a00418a593.png', 'uploads/about/1700397121_655a00418ab4e.png', 'uploads/about/1700398302_655a04de6a0ca.png', 'frontend/assets/images/banner/about-banner-5.png', 'frontend/assets/images/all-img/cta-1.png', 'frontend/assets/images/all-img/cta-2.png', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d45409.623727952174!2d35.911889314491894!3d31.96111812679102!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sjo!4v1700398476011!5m2!1sen!2sjo\" width=\"950\" height=\"550\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'uploads/register/1700398782_655a06be9ec1d.png', 'uploads/login/1700398659_655a0643bbbe7.png', 'uploads/home/1700396856_6559ff3804944.png', 'frontend/assets/images/banner/error-banner.png', 'frontend/assets/images/banner/error-banner.png', 'frontend/assets/images/banner/error-banner.png', 'frontend/assets/images/banner/error-banner.png', 'frontend/assets/images/all-img/coming-banner.png', '+962799742617', 'https://www.facebook.com', 'https://www.instagram.com', 'https://www.twitter.com', 'https://www.youtube.com', '<h2>01. Privacy Policy</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue, mattis faucibus nisl vehicula nec. Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo. Vivamus nec neque a libero sodales aliquam a et dolor.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><h2>02. Limitations</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue.</li><li>mattis faucibus nisl vehicula nec, Mauris at scelerisque lorem.</li><li>Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et. Aenean vel metus leo.</li><li>Vivamus nec neque a libero sodales aliquam a et dolor.</li></ul><h2>03. Security</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ex neque, elementum eu blandit in, ornare eu purus. Fusce eu rhoncus mi, quis ultrices lacus. Phasellus id pellentesque nulla. Cras erat nisi, mattis et efficitur et, iaculis a lacus. Fusce gravida augue quis leo facilisis.</p><h2>04. Privacy Policy</h2><p>Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus. Vivamus sit amet turpis sem. Integer vitae tortor ac ex scelerisque facilisis ac vitae urna. In hac habitasse platea dictumst. Maecenas imperdiet tortor arcu, nec tincidunt neque malesuada volutpat.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><p>Fusce rutrum mauris sit amet justo rutrum, ut sodales lorem ullamcorper. Aliquam vitae iaculis urna. Nulla vitae mi vel nisl viverra ullamcorper vel elementum est. Mauris vitae elit nec enim tincidunt aliquet. Donec ultrices nulla a enim pulvinar, quis pulvinar lacus consectetur. Donec dignissim, risus nec mollis efficitur, turpis erat blandit urna, eget elementum lacus lectus eget lorem.</p><p><br>&nbsp;</p>', '<h2>01. Terms &amp; Condition</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue, mattis faucibus nisl vehicula nec. Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo. Vivamus nec neque a libero sodales aliquam a et dolor.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><h2>02. Limitations</h2><p>Praesent placerat dictum elementum. Nam pulvinar urna vel lectus maximus, eget faucibus turpis hendrerit. Sed iaculis molestie arcu, et accumsan nisi. Quisque molestie velit vitae ligula luctus bibendum. Duis sit amet eros mollis, viverra ipsum sed, convallis sapien. Donec justo erat, pulvinar vitae dui ut, finibus euismod enim. Donec velit tortor, mollis eu tortor euismod, gravida lacinia arcu.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Curabitur luctus sapien augue.</li><li>mattis faucibus nisl vehicula nec, Mauris at scelerisque lorem.</li><li>Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et. Aenean vel metus leo.</li><li>Vivamus nec neque a libero sodales aliquam a et dolor.</li></ul><h2>03. Security</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur ex neque, elementum eu blandit in, ornare eu purus. Fusce eu rhoncus mi, quis ultrices lacus. Phasellus id pellentesque nulla. Cras erat nisi, mattis et efficitur et, iaculis a lacus. Fusce gravida augue quis leo facilisis.</p><h2>04. Privacy Policy</h2><p>Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus. Vivamus sit amet turpis sem. Integer vitae tortor ac ex scelerisque facilisis ac vitae urna. In hac habitasse platea dictumst. Maecenas imperdiet tortor arcu, nec tincidunt neque malesuada volutpat.</p><ul><li>In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum.</li><li>Mauris at scelerisque lorem. Nullam tempus felis ipsum, sagittis malesuada nulla vulputate et.</li><li>Aenean vel metus leo.</li><li>Vestibulum rhoncus sagittis dolor vel finibus.</li><li>Integer feugiat lacus ut efficitur mattis. Sed quis molestie velit.</li></ul><p>Fusce rutrum mauris sit amet justo rutrum, ut sodales lorem ullamcorper. Aliquam vitae iaculis urna. Nulla vitae mi vel nisl viverra ullamcorper vel elementum est. Mauris vitae elit nec enim tincidunt aliquet. Donec ultrices nulla a enim pulvinar, quis pulvinar lacus consectetur. Donec dignissim, risus nec mollis efficitur, turpis erat blandit urna, eget elementum lacus lectus eget lorem.</p><p><br>&nbsp;</p>', NULL, 'frontend/assets/images/all-img/coming-banner.png', '2023-09-13 02:49:38', '2023-11-19 13:25:03');

-- --------------------------------------------------------

--
-- Table structure for table `cms_contents`
--

CREATE TABLE `cms_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_slug` varchar(255) DEFAULT NULL,
  `translation_code` varchar(255) DEFAULT NULL,
  `text` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_contents`
--

INSERT INTO `cms_contents` (`id`, `page_slug`, `translation_code`, `text`, `created_at`, `updated_at`) VALUES
(1, 'terms_condition_page', 'en', '<h2>Terms &amp; Conditions</h2>\r\n\r\n  <p>Welcome to our job search service. By using our platform, you agree to comply with and be bound by the following terms and conditions. Please read these terms carefully before accessing or using our services.</p>\r\n\r\n  <h3>1. User Responsibilities</h3>\r\n  <p>Users are required to provide accurate and truthful information in their profiles. Any misuse of information or violation of our community guidelines may result in the termination of the user\'s account.</p>\r\n\r\n  <h3>2. Job Listings</h3>\r\n  <p>Our platform provides job listings for informational purposes only. We do not guarantee the accuracy or completeness of the job listings, and we are not responsible for any employment decisions made based on the information provided.</p>\r\n\r\n  <h3>3. Privacy Policy</h3>\r\n  <p>Our Privacy Policy outlines how we collect, use, and protect your personal information. By using our services, you agree to the terms outlined in our Privacy Policy.</p>\r\n\r\n  <h3>4. Prohibited Activities</h3>\r\n  <p>Users are prohibited from engaging in any activities that may be deemed illegal, unethical, or in violation of these terms and conditions. This includes but is not limited to fraud, harassment, and unauthorized use of the platform.</p>\r\n\r\n  <h3>5. Termination of Service</h3>\r\n  <p>We reserve the right to terminate or suspend access to our services at our sole discretion, without prior notice or liability, for any reason, including, but not limited to, a breach of these terms.</p>\r\n\r\n  <p>This is a simplified example, and you should tailor the terms and conditions to the specific features and policies of your job search service. Always consult with legal professionals to ensure compliance with applicable laws and regulations.</p>\r\n<p><br>&nbsp;</p>', '2023-09-13 02:49:39', '2023-11-19 13:16:18'),
(2, 'privacy_page', 'en', '<p>Welcome to [Find-job]. By accessing or using our services, you agree to comply with and be bound by the following terms and conditions. If you do not agree to these terms, please do not use our services.</p>\r\n\r\n  <h3>1. Service Overview</h3>\r\n  <p>[Find-job] connects job seekers with employers offering employment opportunities. Our platform facilitates the job search process and provides tools for users to apply to job listings.</p>\r\n\r\n  <h3>2. User Responsibilities</h3>\r\n  <p>Users are responsible for providing accurate and up-to-date information in their profiles. [Your Company] is not responsible for any inaccuracies in user profiles or job listings.</p>\r\n\r\n  <h3>3. Job Listings</h3>\r\n  <p>[Your Company] strives to provide accurate and current job listings; however, we do not guarantee the accuracy, completeness, or availability of the listings. Employers are responsible for the content of their job postings.</p>\r\n\r\n  <h3>4. Account Security</h3>\r\n  <p>Users are responsible for maintaining the confidentiality of their account credentials. [Your Company] is not liable for any unauthorized access to user accounts.</p>\r\n\r\n  <h3>5. Termination of Service</h3>\r\n  <p>[Your Company] reserves the right to terminate or suspend user accounts without prior notice for violations of these terms and conditions or for any other reason.</p>\r\n\r\n  <h3>6. Privacy Policy</h3>\r\n  <p>Our Privacy Policy outlines how we collect, use, and protect user information. By using our services, you agree to the terms outlined in our Privacy Policy.</p>\r\n\r\n  <h3>7. Limitation of Liability</h3>\r\n  <p>[Your Company] is not liable for any damages, losses, or expenses arising from the use of our services or the inability to access our platform.</p>\r\n\r\n  <h3>8. Governing Law</h3>\r\n  <p>These terms and conditions are governed by and construed in accordance with the laws of [Your Jurisdiction].</p>\r\n\r\n  <p>These terms and conditions may be updated or modified at any time without prior notice. It is your responsibility to review them periodically for changes.</p>', '2023-09-13 02:49:39', '2023-11-19 13:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `industry_type_id` bigint(20) UNSIGNED NOT NULL,
  `organization_type_id` bigint(20) UNSIGNED NOT NULL,
  `team_size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `establishment_date` date DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `visibility` tinyint(1) NOT NULL DEFAULT 1,
  `profile_completion` tinyint(1) NOT NULL DEFAULT 0,
  `bio` text DEFAULT NULL,
  `vision` text DEFAULT NULL,
  `total_views` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `exact_location` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `is_profile_verified` tinyint(1) NOT NULL DEFAULT 0,
  `document_verified_at` datetime DEFAULT NULL,
  `question_feature_enable` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `user_id`, `industry_type_id`, `organization_type_id`, `team_size_id`, `logo`, `banner`, `establishment_date`, `website`, `visibility`, `profile_completion`, `bio`, `vision`, `total_views`, `created_at`, `updated_at`, `address`, `exact_location`, `neighborhood`, `locality`, `place`, `district`, `postcode`, `region`, `country`, `long`, `lat`, `is_profile_verified`, `document_verified_at`, `question_feature_enable`) VALUES
(1, 1, 4, 3, 8, 'uploads/images/company/1700402899_655a16d35016b.png', 'uploads/images/company/1700414836_655a45740c4f4.png', '2018-11-12', 'https://talentspace.ai/', 1, 0, '<p>Automate Your Hiring Process Discover the Power of AI recruitment and make it more Efficient, Logical, and Bias-Free</p>', '<h3>Fast. Fair. Flexible. Finally, hiring technology that works</h3><p>Recruiting experience platform designed to automate workflows and make scaling hiring easy. Improve how you, Source , shortlist, engage, screen,and hire talent with<br>AI recruiting, Job matching, assessments, and Voice interviewing</p>', 0, '2023-11-19 14:07:16', '2023-11-19 17:46:12', 'amman', 'amman', 'amman/st', 'amman', 'amman', 'amman', '11181', NULL, 'jordan', 0, NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `company_applied_job_rejected`
--

CREATE TABLE `company_applied_job_rejected` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `applied_job_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_applied_job_shortlist`
--

CREATE TABLE `company_applied_job_shortlist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `applied_job_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_bookmark_categories`
--

CREATE TABLE `company_bookmark_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_questions`
--

CREATE TABLE `company_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `reuse` tinyint(1) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_question_job`
--

CREATE TABLE `company_question_job` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `company_question_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_infos`
--

CREATE TABLE `contact_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `secondary_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `secondary_email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_infos`
--

INSERT INTO `contact_infos` (`id`, `user_id`, `phone`, `secondary_phone`, `email`, `secondary_email`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, '', NULL, '', '2023-11-19 14:07:16', '2023-11-19 17:46:12'),
(2, 2, '', '', '', '', '2023-11-19 14:59:18', '2023-11-19 14:59:18'),
(3, 3, '', '', '', '', '2023-11-19 17:20:20', '2023-11-19 17:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `cookies`
--

CREATE TABLE `cookies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `allow_cookies` tinyint(1) NOT NULL DEFAULT 1,
  `cookie_name` varchar(255) NOT NULL DEFAULT 'gdpr_cookie',
  `cookie_expiration` tinyint(4) NOT NULL DEFAULT 30,
  `force_consent` tinyint(1) NOT NULL DEFAULT 0,
  `darkmode` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cookies`
--

INSERT INTO `cookies` (`id`, `allow_cookies`, `cookie_name`, `cookie_expiration`, `force_consent`, `darkmode`, `created_at`, `updated_at`) VALUES
(1, 0, 'gdpr_cookie', 30, 0, 0, '2023-09-13 02:49:38', '2023-11-19 13:21:28');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sortname` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `image`, `slug`, `icon`, `sortname`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Aruba', 'backend/image/flags/flag-of-Aruba.jpg', 'aruba', 'flag-icon-aw', 'AW', 12.5, -69.96666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(2, 'Afghanistan', 'backend/image/flags/flag-of-Afghanistan.jpg', 'afghanistan', 'flag-icon-af', 'AF', 33, 65, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(3, 'Angola', 'backend/image/flags/flag-of-Angola.jpg', 'angola', 'flag-icon-ao', 'AO', -12.5, 18.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(4, 'Anguilla', 'backend/image/flags/flag-of-Anguilla.jpg', 'anguilla', 'flag-icon-ai', 'AI', 18.25, -63.16666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(5, 'Åland Islands', 'backend/image/flags/flag-of-Åland-Islands.jpg', 'aland-islands', 'flag-icon-ax', 'AX', 60.116667, 19.9, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(6, 'Albania', 'backend/image/flags/flag-of-Albania.jpg', 'albania', 'flag-icon-al', 'AL', 41, 20, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(7, 'Andorra', 'backend/image/flags/flag-of-Andorra.jpg', 'andorra', 'flag-icon-ad', 'AD', 42.5, 1.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(8, 'United Arab Emirates', 'backend/image/flags/flag-of-United-Arab-Emirates.jpg', 'united-arab-emirates', 'flag-icon-ae', 'AE', 24, 54, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(9, 'Argentina', 'backend/image/flags/flag-of-Argentina.jpg', 'argentina', 'flag-icon-ar', 'AR', -34, -64, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(10, 'Armenia', 'backend/image/flags/flag-of-Armenia.jpg', 'armenia', 'flag-icon-am', 'AM', 40, 45, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(11, 'American Samoa', 'backend/image/flags/flag-of-American-Samoa.jpg', 'american-samoa', 'flag-icon-as', 'AS', -14.33333333, -170, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(12, 'Antarctica', 'backend/image/flags/flag-of-Antarctica.jpg', 'antarctica', 'flag-icon-aq', 'AQ', -90, 0, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(13, 'French Southern and Antarctic Lands', 'backend/image/flags/flag-of-French-Southern-and-Antarctic-Lands.jpg', 'french-southern-and-antarctic-lands', 'flag-icon-tf', 'TF', -49.25, 69.167, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(14, 'Antigua and Barbuda', 'backend/image/flags/flag-of-Antigua-and-Barbuda.jpg', 'antigua-and-barbuda', 'flag-icon-ag', 'AG', 17.05, -61.8, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(15, 'Australia', 'backend/image/flags/flag-of-Australia.jpg', 'australia', 'flag-icon-au', 'AU', -27, 133, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(16, 'Austria', 'backend/image/flags/flag-of-Austria.jpg', 'austria', 'flag-icon-at', 'AT', 47.33333333, 13.33333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(17, 'Azerbaijan', 'backend/image/flags/flag-of-Azerbaijan.jpg', 'azerbaijan', 'flag-icon-az', 'AZ', 40.5, 47.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(18, 'Burundi', 'backend/image/flags/flag-of-Burundi.jpg', 'burundi', 'flag-icon-bi', 'BI', -3.5, 30, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(19, 'Belgium', 'backend/image/flags/flag-of-Belgium.jpg', 'belgium', 'flag-icon-be', 'BE', 50.83333333, 4, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(20, 'Benin', 'backend/image/flags/flag-of-Benin.jpg', 'benin', 'flag-icon-bj', 'BJ', 9.5, 2.25, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(21, 'Burkina Faso', 'backend/image/flags/flag-of-Burkina-Faso.jpg', 'burkina-faso', 'flag-icon-bf', 'BF', 13, -2, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(22, 'Bangladesh', 'backend/image/flags/flag-of-Bangladesh.jpg', 'bangladesh', 'flag-icon-bd', 'BD', 24, 90, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(23, 'Bulgaria', 'backend/image/flags/flag-of-Bulgaria.jpg', 'bulgaria', 'flag-icon-bg', 'BG', 43, 25, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(24, 'Bahrain', 'backend/image/flags/flag-of-Bahrain.jpg', 'bahrain', 'flag-icon-bh', 'BH', 26, 50.55, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(25, 'Bahamas', 'backend/image/flags/flag-of-Bahamas.jpg', 'bahamas', 'flag-icon-bs', 'BS', 24.25, -76, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(26, 'Bosnia and Herzegovina', 'backend/image/flags/flag-of-Bosnia-and-Herzegovina.jpg', 'bosnia-and-herzegovina', 'flag-icon-ba', 'BA', 44, 18, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(27, 'Saint Barthélemy', 'backend/image/flags/flag-of-Saint-Barthélemy.jpg', 'saint-barthelemy', 'flag-icon-bl', 'BL', 18.5, -63.41666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(28, 'Belarus', 'backend/image/flags/flag-of-Belarus.jpg', 'belarus', 'flag-icon-by', 'BY', 53, 28, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(29, 'Belize', 'backend/image/flags/flag-of-Belize.jpg', 'belize', 'flag-icon-bz', 'BZ', 17.25, -88.75, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(30, 'Bermuda', 'backend/image/flags/flag-of-Bermuda.jpg', 'bermuda', 'flag-icon-bm', 'BM', 32.33333333, -64.75, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(31, 'Bolivia', 'backend/image/flags/flag-of-Bolivia.jpg', 'bolivia', 'flag-icon-bo', 'BO', -17, -65, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(32, 'Brazil', 'backend/image/flags/flag-of-Brazil.jpg', 'brazil', 'flag-icon-br', 'BR', -10, -55, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(33, 'Barbados', 'backend/image/flags/flag-of-Barbados.jpg', 'barbados', 'flag-icon-bb', 'BB', 13.16666666, -59.53333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(34, 'Brunei', 'backend/image/flags/flag-of-Brunei.jpg', 'brunei', 'flag-icon-bn', 'BN', 4.5, 114.66666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(35, 'Bhutan', 'backend/image/flags/flag-of-Bhutan.jpg', 'bhutan', 'flag-icon-bt', 'BT', 27.5, 90.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(36, 'Bouvet Island', 'backend/image/flags/flag-of-Bouvet-Island.jpg', 'bouvet-island', 'flag-icon-bv', 'BV', -54.43333333, 3.4, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(37, 'Botswana', 'backend/image/flags/flag-of-Botswana.jpg', 'botswana', 'flag-icon-bw', 'BW', -22, 24, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(38, 'Central African Republic', 'backend/image/flags/flag-of-Central-African-Republic.jpg', 'central-african-republic', 'flag-icon-cf', 'CF', 7, 21, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(39, 'Canada', 'backend/image/flags/flag-of-Canada.jpg', 'canada', 'flag-icon-ca', 'CA', 60, -95, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(40, 'Cocos (Keeling) Islands', 'backend/image/flags/flag-of-Cocos-(Keeling)-Islands.jpg', 'cocos-keeling-islands', 'flag-icon-cc', 'CC', -12.5, 96.83333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(41, 'Switzerland', 'backend/image/flags/flag-of-Switzerland.jpg', 'switzerland', 'flag-icon-ch', 'CH', 47, 8, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(42, 'Chile', 'backend/image/flags/flag-of-Chile.jpg', 'chile', 'flag-icon-cl', 'CL', -30, -71, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(43, 'China', 'backend/image/flags/flag-of-China.jpg', 'china', 'flag-icon-cn', 'CN', 35, 105, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(44, 'Ivory Coast', 'backend/image/flags/flag-of-Ivory-Coast.jpg', 'ivory-coast', 'flag-icon-ci', 'CI', 8, -5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(45, 'Cameroon', 'backend/image/flags/flag-of-Cameroon.jpg', 'cameroon', 'flag-icon-cm', 'CM', 6, 12, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(46, 'DR Congo', 'backend/image/flags/flag-of-DR-Congo.jpg', 'dr-congo', 'flag-icon-cd', 'CD', 0, 25, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(47, 'Republic of the Congo', 'backend/image/flags/flag-of-Republic-of-the-Congo.jpg', 'republic-of-the-congo', 'flag-icon-cg', 'CG', -1, 15, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(48, 'Cook Islands', 'backend/image/flags/flag-of-Cook-Islands.jpg', 'cook-islands', 'flag-icon-ck', 'CK', -21.23333333, -159.76666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(49, 'Colombia', 'backend/image/flags/flag-of-Colombia.jpg', 'colombia', 'flag-icon-co', 'CO', 4, -72, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(50, 'Comoros', 'backend/image/flags/flag-of-Comoros.jpg', 'comoros', 'flag-icon-km', 'KM', -12.16666666, 44.25, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(51, 'Cape Verde', 'backend/image/flags/flag-of-Cape-Verde.jpg', 'cape-verde', 'flag-icon-cv', 'CV', 16, -24, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(52, 'Costa Rica', 'backend/image/flags/flag-of-Costa-Rica.jpg', 'costa-rica', 'flag-icon-cr', 'CR', 10, -84, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(53, 'Cuba', 'backend/image/flags/flag-of-Cuba.jpg', 'cuba', 'flag-icon-cu', 'CU', 21.5, -80, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(54, 'Curaçao', 'backend/image/flags/flag-of-Curaçao.jpg', 'curacao', 'flag-icon-cw', 'CW', 12.116667, -68.933333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(55, 'Christmas Island', 'backend/image/flags/flag-of-Christmas-Island.jpg', 'christmas-island', 'flag-icon-cx', 'CX', -10.5, 105.66666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(56, 'Cayman Islands', 'backend/image/flags/flag-of-Cayman-Islands.jpg', 'cayman-islands', 'flag-icon-ky', 'KY', 19.5, -80.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(57, 'Cyprus', 'backend/image/flags/flag-of-Cyprus.jpg', 'cyprus', 'flag-icon-cy', 'CY', 35, 33, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(58, 'Czech Republic', 'backend/image/flags/flag-of-Czech-Republic.jpg', 'czech-republic', 'flag-icon-cz', 'CZ', 49.75, 15.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(59, 'Germany', 'backend/image/flags/flag-of-Germany.jpg', 'germany', 'flag-icon-de', 'DE', 51, 9, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(60, 'Djibouti', 'backend/image/flags/flag-of-Djibouti.jpg', 'djibouti', 'flag-icon-dj', 'DJ', 11.5, 43, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(61, 'Dominica', 'backend/image/flags/flag-of-Dominica.jpg', 'dominica', 'flag-icon-dm', 'DM', 15.41666666, -61.33333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(62, 'Denmark', 'backend/image/flags/flag-of-Denmark.jpg', 'denmark', 'flag-icon-dk', 'DK', 56, 10, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(63, 'Dominican Republic', 'backend/image/flags/flag-of-Dominican-Republic.jpg', 'dominican-republic', 'flag-icon-do', 'DO', 19, -70.66666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(64, 'Algeria', 'backend/image/flags/flag-of-Algeria.jpg', 'algeria', 'flag-icon-dz', 'DZ', 28, 3, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(65, 'Ecuador', 'backend/image/flags/flag-of-Ecuador.jpg', 'ecuador', 'flag-icon-ec', 'EC', -2, -77.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(66, 'Egypt', 'backend/image/flags/flag-of-Egypt.jpg', 'egypt', 'flag-icon-eg', 'EG', 27, 30, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(67, 'Eritrea', 'backend/image/flags/flag-of-Eritrea.jpg', 'eritrea', 'flag-icon-er', 'ER', 15, 39, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(68, 'Western Sahara', 'backend/image/flags/flag-of-Western-Sahara.jpg', 'western-sahara', 'flag-icon-eh', 'EH', 24.5, -13, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(69, 'Spain', 'backend/image/flags/flag-of-Spain.jpg', 'spain', 'flag-icon-es', 'ES', 40, -4, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(70, 'Estonia', 'backend/image/flags/flag-of-Estonia.jpg', 'estonia', 'flag-icon-ee', 'EE', 59, 26, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(71, 'Ethiopia', 'backend/image/flags/flag-of-Ethiopia.jpg', 'ethiopia', 'flag-icon-et', 'ET', 8, 38, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(72, 'Finland', 'backend/image/flags/flag-of-Finland.jpg', 'finland', 'flag-icon-fi', 'FI', 64, 26, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(73, 'Fiji', 'backend/image/flags/flag-of-Fiji.jpg', 'fiji', 'flag-icon-fj', 'FJ', -18, 175, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(74, 'Falkland Islands', 'backend/image/flags/flag-of-Falkland-Islands.jpg', 'falkland-islands', 'flag-icon-fk', 'FK', -51.75, -59, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(75, 'France', 'backend/image/flags/flag-of-France.jpg', 'france', 'flag-icon-fr', 'FR', 46, 2, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(76, 'Faroe Islands', 'backend/image/flags/flag-of-Faroe-Islands.jpg', 'faroe-islands', 'flag-icon-fo', 'FO', 62, -7, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(77, 'Micronesia', 'backend/image/flags/flag-of-Micronesia.jpg', 'micronesia', 'flag-icon-fm', 'FM', 6.91666666, 158.25, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(78, 'Gabon', 'backend/image/flags/flag-of-Gabon.jpg', 'gabon', 'flag-icon-ga', 'GA', -1, 11.75, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(79, 'United Kingdom', 'backend/image/flags/flag-of-United-Kingdom.jpg', 'united-kingdom', 'flag-icon-gb', 'GB', 54, -2, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(80, 'Georgia', 'backend/image/flags/flag-of-Georgia.jpg', 'georgia', 'flag-icon-ge', 'GE', 42, 43.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(81, 'Guernsey', 'backend/image/flags/flag-of-Guernsey.jpg', 'guernsey', 'flag-icon-gg', 'GG', 49.46666666, -2.58333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(82, 'Ghana', 'backend/image/flags/flag-of-Ghana.jpg', 'ghana', 'flag-icon-gh', 'GH', 8, -2, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(83, 'Gibraltar', 'backend/image/flags/flag-of-Gibraltar.jpg', 'gibraltar', 'flag-icon-gi', 'GI', 36.13333333, -5.35, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(84, 'Guinea', 'backend/image/flags/flag-of-Guinea.jpg', 'guinea', 'flag-icon-gn', 'GN', 11, -10, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(85, 'Guadeloupe', 'backend/image/flags/flag-of-Guadeloupe.jpg', 'guadeloupe', 'flag-icon-gp', 'GP', 16.25, -61.583333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(86, 'Gambia', 'backend/image/flags/flag-of-Gambia.jpg', 'gambia', 'flag-icon-gm', 'GM', 13.46666666, -16.56666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(87, 'Guinea-Bissau', 'backend/image/flags/flag-of-Guinea-Bissau.jpg', 'guinea-bissau', 'flag-icon-gw', 'GW', 12, -15, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(88, 'Equatorial Guinea', 'backend/image/flags/flag-of-Equatorial-Guinea.jpg', 'equatorial-guinea', 'flag-icon-gq', 'GQ', 2, 10, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(89, 'Greece', 'backend/image/flags/flag-of-Greece.jpg', 'greece', 'flag-icon-gr', 'GR', 39, 22, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(90, 'Grenada', 'backend/image/flags/flag-of-Grenada.jpg', 'grenada', 'flag-icon-gd', 'GD', 12.11666666, -61.66666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(91, 'Greenland', 'backend/image/flags/flag-of-Greenland.jpg', 'greenland', 'flag-icon-gl', 'GL', 72, -40, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(92, 'Guatemala', 'backend/image/flags/flag-of-Guatemala.jpg', 'guatemala', 'flag-icon-gt', 'GT', 15.5, -90.25, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(93, 'French Guiana', 'backend/image/flags/flag-of-French-Guiana.jpg', 'french-guiana', 'flag-icon-gf', 'GF', 4, -53, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(94, 'Guam', 'backend/image/flags/flag-of-Guam.jpg', 'guam', 'flag-icon-gu', 'GU', 13.46666666, 144.78333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(95, 'Guyana', 'backend/image/flags/flag-of-Guyana.jpg', 'guyana', 'flag-icon-gy', 'GY', 5, -59, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(96, 'Hong Kong', 'backend/image/flags/flag-of-Hong-Kong.jpg', 'hong-kong', 'flag-icon-hk', 'HK', 22.267, 114.188, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(97, 'Honduras', 'backend/image/flags/flag-of-Honduras.jpg', 'honduras', 'flag-icon-hn', 'HN', 15, -86.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(98, 'Croatia', 'backend/image/flags/flag-of-Croatia.jpg', 'croatia', 'flag-icon-hr', 'HR', 45.16666666, 15.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(99, 'Haiti', 'backend/image/flags/flag-of-Haiti.jpg', 'haiti', 'flag-icon-ht', 'HT', 19, -72.41666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(100, 'Hungary', 'backend/image/flags/flag-of-Hungary.jpg', 'hungary', 'flag-icon-hu', 'HU', 47, 20, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(101, 'Indonesia', 'backend/image/flags/flag-of-Indonesia.jpg', 'indonesia', 'flag-icon-id', 'ID', -5, 120, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(102, 'Isle of Man', 'backend/image/flags/flag-of-Isle-of-Man.jpg', 'isle-of-man', 'flag-icon-im', 'IM', 54.25, -4.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(103, 'India', 'backend/image/flags/flag-of-India.jpg', 'india', 'flag-icon-in', 'IN', 20, 77, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(104, 'British Indian Ocean Territory', 'backend/image/flags/flag-of-British-Indian-Ocean-Territory.jpg', 'british-indian-ocean-territory', 'flag-icon-io', 'IO', -6, 71.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(105, 'Ireland', 'backend/image/flags/flag-of-Ireland.jpg', 'ireland', 'flag-icon-ie', 'IE', 53, -8, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(106, 'Iran', 'backend/image/flags/flag-of-Iran.jpg', 'iran', 'flag-icon-ir', 'IR', 32, 53, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(107, 'Iraq', 'backend/image/flags/flag-of-Iraq.jpg', 'iraq', 'flag-icon-iq', 'IQ', 33, 44, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(108, 'Iceland', 'backend/image/flags/flag-of-Iceland.jpg', 'iceland', 'flag-icon-is', 'IS', 65, -18, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(109, 'Israel', 'backend/image/flags/flag-of-Israel.jpg', 'israel', 'flag-icon-il', 'IL', 31.47, 35.13, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(110, 'Italy', 'backend/image/flags/flag-of-Italy.jpg', 'italy', 'flag-icon-it', 'IT', 42.83333333, 12.83333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(111, 'Jamaica', 'backend/image/flags/flag-of-Jamaica.jpg', 'jamaica', 'flag-icon-jm', 'JM', 18.25, -77.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(112, 'Jersey', 'backend/image/flags/flag-of-Jersey.jpg', 'jersey', 'flag-icon-je', 'JE', 49.25, -2.16666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(113, 'Jordan', 'backend/image/flags/flag-of-Jordan.jpg', 'jordan', 'flag-icon-jo', 'JO', 31, 36, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(114, 'Japan', 'backend/image/flags/flag-of-Japan.jpg', 'japan', 'flag-icon-jp', 'JP', 36, 138, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(115, 'Kazakhstan', 'backend/image/flags/flag-of-Kazakhstan.jpg', 'kazakhstan', 'flag-icon-kz', 'KZ', 48, 68, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(116, 'Kenya', 'backend/image/flags/flag-of-Kenya.jpg', 'kenya', 'flag-icon-ke', 'KE', 1, 38, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(117, 'Kyrgyzstan', 'backend/image/flags/flag-of-Kyrgyzstan.jpg', 'kyrgyzstan', 'flag-icon-kg', 'KG', 41, 75, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(118, 'Cambodia', 'backend/image/flags/flag-of-Cambodia.jpg', 'cambodia', 'flag-icon-kh', 'KH', 13, 105, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(119, 'Kiribati', 'backend/image/flags/flag-of-Kiribati.jpg', 'kiribati', 'flag-icon-ki', 'KI', 1.41666666, 173, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(120, 'Saint Kitts and Nevis', 'backend/image/flags/flag-of-Saint-Kitts-and-Nevis.jpg', 'saint-kitts-and-nevis', 'flag-icon-kn', 'KN', 17.33333333, -62.75, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(121, 'South Korea', 'backend/image/flags/flag-of-South-Korea.jpg', 'south-korea', 'flag-icon-kr', 'KR', 37, 127.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(122, 'Kosovo', 'backend/image/flags/flag-of-Kosovo.jpg', 'kosovo', 'flag-icon-xk', 'XK', 42.666667, 21.166667, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(123, 'Kuwait', 'backend/image/flags/flag-of-Kuwait.jpg', 'kuwait', 'flag-icon-kw', 'KW', 29.5, 45.75, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(124, 'Laos', 'backend/image/flags/flag-of-Laos.jpg', 'laos', 'flag-icon-la', 'LA', 18, 105, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(125, 'Lebanon', 'backend/image/flags/flag-of-Lebanon.jpg', 'lebanon', 'flag-icon-lb', 'LB', 33.83333333, 35.83333333, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(126, 'Liberia', 'backend/image/flags/flag-of-Liberia.jpg', 'liberia', 'flag-icon-lr', 'LR', 6.5, -9.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(127, 'Libya', 'backend/image/flags/flag-of-Libya.jpg', 'libya', 'flag-icon-ly', 'LY', 25, 17, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(128, 'Saint Lucia', 'backend/image/flags/flag-of-Saint-Lucia.jpg', 'saint-lucia', 'flag-icon-lc', 'LC', 13.88333333, -60.96666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(129, 'Liechtenstein', 'backend/image/flags/flag-of-Liechtenstein.jpg', 'liechtenstein', 'flag-icon-li', 'LI', 47.26666666, 9.53333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(130, 'Sri Lanka', 'backend/image/flags/flag-of-Sri-Lanka.jpg', 'sri-lanka', 'flag-icon-lk', 'LK', 7, 81, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(131, 'Lesotho', 'backend/image/flags/flag-of-Lesotho.jpg', 'lesotho', 'flag-icon-ls', 'LS', -29.5, 28.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(132, 'Lithuania', 'backend/image/flags/flag-of-Lithuania.jpg', 'lithuania', 'flag-icon-lt', 'LT', 56, 24, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(133, 'Luxembourg', 'backend/image/flags/flag-of-Luxembourg.jpg', 'luxembourg', 'flag-icon-lu', 'LU', 49.75, 6.16666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(134, 'Latvia', 'backend/image/flags/flag-of-Latvia.jpg', 'latvia', 'flag-icon-lv', 'LV', 57, 25, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(135, 'Macau', 'backend/image/flags/flag-of-Macau.jpg', 'macau', 'flag-icon-mo', 'MO', 22.16666666, 113.55, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(136, 'Saint Martin', 'backend/image/flags/flag-of-Saint-Martin.jpg', 'saint-martin', 'flag-icon-mf', 'MF', 18.08333333, -63.95, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(137, 'Morocco', 'backend/image/flags/flag-of-Morocco.jpg', 'morocco', 'flag-icon-ma', 'MA', 32, -5, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(138, 'Monaco', 'backend/image/flags/flag-of-Monaco.jpg', 'monaco', 'flag-icon-mc', 'MC', 43.73333333, 7.4, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(139, 'Moldova', 'backend/image/flags/flag-of-Moldova.jpg', 'moldova', 'flag-icon-md', 'MD', 47, 29, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(140, 'Madagascar', 'backend/image/flags/flag-of-Madagascar.jpg', 'madagascar', 'flag-icon-mg', 'MG', -20, 47, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(141, 'Maldives', 'backend/image/flags/flag-of-Maldives.jpg', 'maldives', 'flag-icon-mv', 'MV', 3.25, 73, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(142, 'Mexico', 'backend/image/flags/flag-of-Mexico.jpg', 'mexico', 'flag-icon-mx', 'MX', 23, -102, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(143, 'Marshall Islands', 'backend/image/flags/flag-of-Marshall-Islands.jpg', 'marshall-islands', 'flag-icon-mh', 'MH', 9, 168, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(144, 'Macedonia', 'backend/image/flags/flag-of-Macedonia.jpg', 'macedonia', 'flag-icon-mk', 'MK', 41.83333333, 22, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(145, 'Mali', 'backend/image/flags/flag-of-Mali.jpg', 'mali', 'flag-icon-ml', 'ML', 17, -4, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(146, 'Malta', 'backend/image/flags/flag-of-Malta.jpg', 'malta', 'flag-icon-mt', 'MT', 35.83333333, 14.58333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(147, 'Myanmar', 'backend/image/flags/flag-of-Myanmar.jpg', 'myanmar', 'flag-icon-mm', 'MM', 22, 98, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(148, 'Montenegro', 'backend/image/flags/flag-of-Montenegro.jpg', 'montenegro', 'flag-icon-me', 'ME', 42.5, 19.3, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(149, 'Mongolia', 'backend/image/flags/flag-of-Mongolia.jpg', 'mongolia', 'flag-icon-mn', 'MN', 46, 105, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(150, 'Northern Mariana Islands', 'backend/image/flags/flag-of-Northern-Mariana-Islands.jpg', 'northern-mariana-islands', 'flag-icon-mp', 'MP', 15.2, 145.75, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(151, 'Mozambique', 'backend/image/flags/flag-of-Mozambique.jpg', 'mozambique', 'flag-icon-mz', 'MZ', -18.25, 35, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(152, 'Mauritania', 'backend/image/flags/flag-of-Mauritania.jpg', 'mauritania', 'flag-icon-mr', 'MR', 20, -12, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(153, 'Montserrat', 'backend/image/flags/flag-of-Montserrat.jpg', 'montserrat', 'flag-icon-ms', 'MS', 16.75, -62.2, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(154, 'Martinique', 'backend/image/flags/flag-of-Martinique.jpg', 'martinique', 'flag-icon-mq', 'MQ', 14.666667, -61, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(155, 'Mauritius', 'backend/image/flags/flag-of-Mauritius.jpg', 'mauritius', 'flag-icon-mu', 'MU', -20.28333333, 57.55, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(156, 'Malawi', 'backend/image/flags/flag-of-Malawi.jpg', 'malawi', 'flag-icon-mw', 'MW', -13.5, 34, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(157, 'Malaysia', 'backend/image/flags/flag-of-Malaysia.jpg', 'malaysia', 'flag-icon-my', 'MY', 2.5, 112.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(158, 'Mayotte', 'backend/image/flags/flag-of-Mayotte.jpg', 'mayotte', 'flag-icon-yt', 'YT', -12.83333333, 45.16666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(159, 'Namibia', 'backend/image/flags/flag-of-Namibia.jpg', 'namibia', 'flag-icon-na', 'NA', -22, 17, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(160, 'New Caledonia', 'backend/image/flags/flag-of-New-Caledonia.jpg', 'new-caledonia', 'flag-icon-nc', 'NC', -21.5, 165.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(161, 'Niger', 'backend/image/flags/flag-of-Niger.jpg', 'niger', 'flag-icon-ne', 'NE', 16, 8, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(162, 'Norfolk Island', 'backend/image/flags/flag-of-Norfolk-Island.jpg', 'norfolk-island', 'flag-icon-nf', 'NF', -29.03333333, 167.95, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(163, 'Nigeria', 'backend/image/flags/flag-of-Nigeria.jpg', 'nigeria', 'flag-icon-ng', 'NG', 10, 8, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(164, 'Nicaragua', 'backend/image/flags/flag-of-Nicaragua.jpg', 'nicaragua', 'flag-icon-ni', 'NI', 13, -85, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(165, 'Niue', 'backend/image/flags/flag-of-Niue.jpg', 'niue', 'flag-icon-nu', 'NU', -19.03333333, -169.86666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(166, 'Netherlands', 'backend/image/flags/flag-of-Netherlands.jpg', 'netherlands', 'flag-icon-nl', 'NL', 52.5, 5.75, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(167, 'Norway', 'backend/image/flags/flag-of-Norway.jpg', 'norway', 'flag-icon-no', 'NO', 62, 10, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(168, 'Nepal', 'backend/image/flags/flag-of-Nepal.jpg', 'nepal', 'flag-icon-np', 'NP', 28, 84, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(169, 'Nauru', 'backend/image/flags/flag-of-Nauru.jpg', 'nauru', 'flag-icon-nr', 'NR', -0.53333333, 166.91666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(170, 'New Zealand', 'backend/image/flags/flag-of-New-Zealand.jpg', 'new-zealand', 'flag-icon-nz', 'NZ', -41, 174, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(171, 'Oman', 'backend/image/flags/flag-of-Oman.jpg', 'oman', 'flag-icon-om', 'OM', 21, 57, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(172, 'Pakistan', 'backend/image/flags/flag-of-Pakistan.jpg', 'pakistan', 'flag-icon-pk', 'PK', 30, 70, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(173, 'Panama', 'backend/image/flags/flag-of-Panama.jpg', 'panama', 'flag-icon-pa', 'PA', 9, -80, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(174, 'Pitcairn Islands', 'backend/image/flags/flag-of-Pitcairn-Islands.jpg', 'pitcairn-islands', 'flag-icon-pn', 'PN', -25.06666666, -130.1, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(175, 'Peru', 'backend/image/flags/flag-of-Peru.jpg', 'peru', 'flag-icon-pe', 'PE', -10, -76, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(176, 'Philippines', 'backend/image/flags/flag-of-Philippines.jpg', 'philippines', 'flag-icon-ph', 'PH', 13, 122, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(177, 'Palau', 'backend/image/flags/flag-of-Palau.jpg', 'palau', 'flag-icon-pw', 'PW', 7.5, 134.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(178, 'Papua New Guinea', 'backend/image/flags/flag-of-Papua-New-Guinea.jpg', 'papua-new-guinea', 'flag-icon-pg', 'PG', -6, 147, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(179, 'Poland', 'backend/image/flags/flag-of-Poland.jpg', 'poland', 'flag-icon-pl', 'PL', 52, 20, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(180, 'Puerto Rico', 'backend/image/flags/flag-of-Puerto-Rico.jpg', 'puerto-rico', 'flag-icon-pr', 'PR', 18.25, -66.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(181, 'North Korea', 'backend/image/flags/flag-of-North-Korea.jpg', 'north-korea', 'flag-icon-kp', 'KP', 40, 127, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(182, 'Portugal', 'backend/image/flags/flag-of-Portugal.jpg', 'portugal', 'flag-icon-pt', 'PT', 39.5, -8, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(183, 'Paraguay', 'backend/image/flags/flag-of-Paraguay.jpg', 'paraguay', 'flag-icon-py', 'PY', -23, -58, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(184, 'Palestine', 'backend/image/flags/flag-of-Palestine.jpg', 'palestine', 'flag-icon-ps', 'PS', 31.9, 35.2, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(185, 'French Polynesia', 'backend/image/flags/flag-of-French-Polynesia.jpg', 'french-polynesia', 'flag-icon-pf', 'PF', -15, -140, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(186, 'Qatar', 'backend/image/flags/flag-of-Qatar.jpg', 'qatar', 'flag-icon-qa', 'QA', 25.5, 51.25, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(187, 'Réunion', 'backend/image/flags/flag-of-Réunion.jpg', 'reunion', 'flag-icon-re', 'RE', -21.15, 55.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(188, 'Romania', 'backend/image/flags/flag-of-Romania.jpg', 'romania', 'flag-icon-ro', 'RO', 46, 25, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(189, 'Russia', 'backend/image/flags/flag-of-Russia.jpg', 'russia', 'flag-icon-ru', 'RU', 60, 100, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(190, 'Rwanda', 'backend/image/flags/flag-of-Rwanda.jpg', 'rwanda', 'flag-icon-rw', 'RW', -2, 30, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(191, 'Saudi Arabia', 'backend/image/flags/flag-of-Saudi-Arabia.jpg', 'saudi-arabia', 'flag-icon-sa', 'SA', 25, 45, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(192, 'Sudan', 'backend/image/flags/flag-of-Sudan.jpg', 'sudan', 'flag-icon-sd', 'SD', 15, 30, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(193, 'Senegal', 'backend/image/flags/flag-of-Senegal.jpg', 'senegal', 'flag-icon-sn', 'SN', 14, -14, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(194, 'Singapore', 'backend/image/flags/flag-of-Singapore.jpg', 'singapore', 'flag-icon-sg', 'SG', 1.36666666, 103.8, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(195, 'South Georgia', 'backend/image/flags/flag-of-South-Georgia.jpg', 'south-georgia', 'flag-icon-gs', 'GS', -54.5, -37, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(196, 'Svalbard and Jan Mayen', 'backend/image/flags/flag-of-Svalbard-and-Jan-Mayen.jpg', 'svalbard-and-jan-mayen', 'flag-icon-sj', 'SJ', 78, 20, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(197, 'Solomon Islands', 'backend/image/flags/flag-of-Solomon-Islands.jpg', 'solomon-islands', 'flag-icon-sb', 'SB', -8, 159, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(198, 'Sierra Leone', 'backend/image/flags/flag-of-Sierra-Leone.jpg', 'sierra-leone', 'flag-icon-sl', 'SL', 8.5, -11.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(199, 'El Salvador', 'backend/image/flags/flag-of-El-Salvador.jpg', 'el-salvador', 'flag-icon-sv', 'SV', 13.83333333, -88.91666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(200, 'San Marino', 'backend/image/flags/flag-of-San-Marino.jpg', 'san-marino', 'flag-icon-sm', 'SM', 43.76666666, 12.41666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(201, 'Somalia', 'backend/image/flags/flag-of-Somalia.jpg', 'somalia', 'flag-icon-so', 'SO', 10, 49, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(202, 'Saint Pierre and Miquelon', 'backend/image/flags/flag-of-Saint-Pierre-and-Miquelon.jpg', 'saint-pierre-and-miquelon', 'flag-icon-pm', 'PM', 46.83333333, -56.33333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(203, 'Serbia', 'backend/image/flags/flag-of-Serbia.jpg', 'serbia', 'flag-icon-rs', 'RS', 44, 21, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(204, 'South Sudan', 'backend/image/flags/flag-of-South-Sudan.jpg', 'south-sudan', 'flag-icon-ss', 'SS', 7, 30, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(205, 'São Tomé and Príncipe', 'backend/image/flags/flag-of-São-Tomé-and-Príncipe.jpg', 'sao-tome-and-principe', 'flag-icon-st', 'ST', 1, 7, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(206, 'Suriname', 'backend/image/flags/flag-of-Suriname.jpg', 'suriname', 'flag-icon-sr', 'SR', 4, -56, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(207, 'Slovakia', 'backend/image/flags/flag-of-Slovakia.jpg', 'slovakia', 'flag-icon-sk', 'SK', 48.66666666, 19.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(208, 'Slovenia', 'backend/image/flags/flag-of-Slovenia.jpg', 'slovenia', 'flag-icon-si', 'SI', 46.11666666, 14.81666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(209, 'Sweden', 'backend/image/flags/flag-of-Sweden.jpg', 'sweden', 'flag-icon-se', 'SE', 62, 15, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(210, 'Swaziland', 'backend/image/flags/flag-of-Swaziland.jpg', 'swaziland', 'flag-icon-sz', 'SZ', -26.5, 31.5, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(211, 'Sint Maarten', 'backend/image/flags/flag-of-Sint-Maarten.jpg', 'sint-maarten', 'flag-icon-sx', 'SX', 18.033333, -63.05, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(212, 'Seychelles', 'backend/image/flags/flag-of-Seychelles.jpg', 'seychelles', 'flag-icon-sc', 'SC', -4.58333333, 55.66666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(213, 'Syria', 'backend/image/flags/flag-of-Syria.jpg', 'syria', 'flag-icon-sy', 'SY', 35, 38, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(214, 'Turks and Caicos Islands', 'backend/image/flags/flag-of-Turks-and-Caicos-Islands.jpg', 'turks-and-caicos-islands', 'flag-icon-tc', 'TC', 21.75, -71.58333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(215, 'Chad', 'backend/image/flags/flag-of-Chad.jpg', 'chad', 'flag-icon-td', 'TD', 15, 19, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(216, 'Togo', 'backend/image/flags/flag-of-Togo.jpg', 'togo', 'flag-icon-tg', 'TG', 8, 1.16666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(217, 'Thailand', 'backend/image/flags/flag-of-Thailand.jpg', 'thailand', 'flag-icon-th', 'TH', 15, 100, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(218, 'Tajikistan', 'backend/image/flags/flag-of-Tajikistan.jpg', 'tajikistan', 'flag-icon-tj', 'TJ', 39, 71, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(219, 'Tokelau', 'backend/image/flags/flag-of-Tokelau.jpg', 'tokelau', 'flag-icon-tk', 'TK', -9, -172, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(220, 'Turkmenistan', 'backend/image/flags/flag-of-Turkmenistan.jpg', 'turkmenistan', 'flag-icon-tm', 'TM', 40, 60, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(221, 'Timor-Leste', 'backend/image/flags/flag-of-Timor-Leste.jpg', 'timor-leste', 'flag-icon-tl', 'TL', -8.83333333, 125.91666666, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(222, 'Tonga', 'backend/image/flags/flag-of-Tonga.jpg', 'tonga', 'flag-icon-to', 'TO', -20, -175, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(223, 'Trinidad and Tobago', 'backend/image/flags/flag-of-Trinidad-and-Tobago.jpg', 'trinidad-and-tobago', 'flag-icon-tt', 'TT', 11, -61, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(224, 'Tunisia', 'backend/image/flags/flag-of-Tunisia.jpg', 'tunisia', 'flag-icon-tn', 'TN', 34, 9, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(225, 'Turkey', 'backend/image/flags/flag-of-Turkey.jpg', 'turkey', 'flag-icon-tr', 'TR', 39, 35, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(226, 'Tuvalu', 'backend/image/flags/flag-of-Tuvalu.jpg', 'tuvalu', 'flag-icon-tv', 'TV', -8, 178, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(227, 'Taiwan', 'backend/image/flags/flag-of-Taiwan.jpg', 'taiwan', 'flag-icon-tw', 'TW', 23.5, 121, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(228, 'Tanzania', 'backend/image/flags/flag-of-Tanzania.jpg', 'tanzania', 'flag-icon-tz', 'TZ', -6, 35, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(229, 'Uganda', 'backend/image/flags/flag-of-Uganda.jpg', 'uganda', 'flag-icon-ug', 'UG', 1, 32, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(230, 'Ukraine', 'backend/image/flags/flag-of-Ukraine.jpg', 'ukraine', 'flag-icon-ua', 'UA', 49, 32, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(231, 'United States Minor Outlying Islands', 'backend/image/flags/flag-of-United-States-Minor-Outlying-Islands.jpg', 'united-states-minor-outlying-islands', 'flag-icon-um', 'UM', 19.2911437, 166.618332, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(232, 'Uruguay', 'backend/image/flags/flag-of-Uruguay.jpg', 'uruguay', 'flag-icon-uy', 'UY', -33, -56, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(233, 'United States', 'backend/image/flags/flag-of-United-States.jpg', 'united-states', 'flag-icon-us', 'US', 38, -97, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(234, 'Uzbekistan', 'backend/image/flags/flag-of-Uzbekistan.jpg', 'uzbekistan', 'flag-icon-uz', 'UZ', 41, 64, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(235, 'Vatican City', 'backend/image/flags/flag-of-Vatican-City.jpg', 'vatican-city', 'flag-icon-va', 'VA', 41.9, 12.45, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(236, 'Saint Vincent and the Grenadines', 'backend/image/flags/flag-of-Saint-Vincent-and-the-Grenadines.jpg', 'saint-vincent-and-the-grenadines', 'flag-icon-vc', 'VC', 13.25, -61.2, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(237, 'Venezuela', 'backend/image/flags/flag-of-Venezuela.jpg', 'venezuela', 'flag-icon-ve', 'VE', 8, -66, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(238, 'British Virgin Islands', 'backend/image/flags/flag-of-British-Virgin-Islands.jpg', 'british-virgin-islands', 'flag-icon-vg', 'VG', 18.431383, -64.62305, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(239, 'United States Virgin Islands', 'backend/image/flags/flag-of-United-States-Virgin-Islands.jpg', 'united-states-virgin-islands', 'flag-icon-vi', 'VI', 18.35, -64.933333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(240, 'Vietnam', 'backend/image/flags/flag-of-Vietnam.jpg', 'vietnam', 'flag-icon-vn', 'VN', 16.16666666, 107.83333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(241, 'Vanuatu', 'backend/image/flags/flag-of-Vanuatu.jpg', 'vanuatu', 'flag-icon-vu', 'VU', -16, 167, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(242, 'Wallis and Futuna', 'backend/image/flags/flag-of-Wallis-and-Futuna.jpg', 'wallis-and-futuna', 'flag-icon-wf', 'WF', -13.3, -176.2, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(243, 'Samoa', 'backend/image/flags/flag-of-Samoa.jpg', 'samoa', 'flag-icon-ws', 'WS', -13.58333333, -172.33333333, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(244, 'Yemen', 'backend/image/flags/flag-of-Yemen.jpg', 'yemen', 'flag-icon-ye', 'YE', 15, 48, 1, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(245, 'South Africa', 'backend/image/flags/flag-of-South-Africa.jpg', 'south-africa', 'flag-icon-za', 'ZA', -29, 24, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(246, 'Zambia', 'backend/image/flags/flag-of-Zambia.jpg', 'zambia', 'flag-icon-zm', 'ZM', -15, 30, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13'),
(247, 'Zimbabwe', 'backend/image/flags/flag-of-Zimbabwe.jpg', 'zimbabwe', 'flag-icon-zw', 'ZW', -20, 30, 0, '2023-09-13 02:49:38', '2023-11-19 08:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `symbol_position` varchar(255) NOT NULL DEFAULT 'left',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `symbol_position`, `created_at`, `updated_at`) VALUES
(1, 'United State Dollar', 'USD', '$', 'left', '2023-09-13 02:49:39', '2023-09-13 02:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `payment_provider` enum('flutterwave','mollie','midtrans','paypal','paystack','razorpay','sslcommerz','stripe','instamojo','offline') NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `usd_amount` varchar(255) DEFAULT NULL,
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `manual_payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_type` enum('subscription_based','per_job_based') NOT NULL DEFAULT 'subscription_based'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `earnings`
--

INSERT INTO `earnings` (`id`, `order_id`, `payment_provider`, `company_id`, `amount`, `currency_symbol`, `usd_amount`, `payment_status`, `created_at`, `updated_at`, `manual_payment_id`, `transaction_id`, `plan_id`, `payment_type`) VALUES
(1, '655a3428228aa', 'offline', 1, '0', '$', '0', 'paid', '2023-11-19 16:13:28', '2023-11-19 16:13:28', NULL, 'tr_655a3428228ac', 1, 'subscription_based');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'High School', 'high-school', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(2, 'Intermediate', 'intermediate', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(3, 'Bachelor Degree', 'bachelor-degree', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(4, 'Master Degree', 'master-degree', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(5, 'Graduated', 'graduated', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(6, 'PhD', 'phd', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(7, 'Any', 'any', '2023-09-13 02:49:42', '2023-09-13 02:49:42');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `type`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'New User', 'new_user', 'Welcome {user_name}', '<p>Hi {user_name},</p><p>Welcome to {company_name}. It\'s great to have you here!</p><p>Have a great time!</p><p>Regards,<br>{company_name} team</p>', '2023-09-13 02:49:17', '2023-09-13 02:49:17'),
(2, 'Edited Job', 'new_edited_job_available', 'New Edited Job Available For Approval!', '<p>Hello <strong>{admin_name}</strong>,<br>A new edited job available for approval!</p>', '2023-09-13 02:49:17', '2023-09-13 02:49:17'),
(3, 'New Job Available', 'new_job_available', 'New Job Available For Approval!', '<p>Hello {admin_name},<br>A new job available for approval!</p>', '2023-09-13 02:49:17', '2023-09-13 02:49:17'),
(4, 'New Plan Purchase', 'new_plan_purchase', '{user_name} Has Purchased The {plan_label} Plan!', '<p>{user_name} Has Purchased The {plan_label} Plan!</p>', '2023-09-13 02:49:17', '2023-09-13 02:49:17'),
(5, 'New User Registered', 'new_user_registered', 'New {user_role} Registered!', '<p>Hello {admin_name},<br>A {user_role} Registered Recently!</p>', '2023-09-13 02:49:17', '2023-09-13 02:49:17'),
(6, 'Plan Purchase', 'plan_purchase', 'Plan Purchased', '<p>Hello {user_name}!<br>You purchase of {plan_type} has been successfully completed!<br>Regards</p>', '2023-09-13 02:49:17', '2023-09-13 02:49:17'),
(7, 'New Pending Candidate', 'new_pending_candidate', 'Candidate Created', '<p>Hello {user_name},<br><br>Your candidate profile has been created and is waiting for admin approval.<br><br>Please login with your credentials below to check status -<br>Your Email : {user_email}<br>Your Password : {user_password}<br><br>Regards</p>', '2023-09-13 02:49:17', '2023-09-13 02:49:17'),
(8, 'New Candidate', 'new_candidate', 'Candidate Created', '<p>Hello {user_name},<br><br>Your candidate profile has been created.<br><br>Please login with your credentials below to check status -<br>Your Email : {user_email}<br>Your Password : {user_password}<br><br>Regards</p>', '2023-09-13 02:49:17', '2023-09-13 02:49:17'),
(9, 'New Company Pending', 'new_company_pending', 'Company created and waiting for admin approval', '<p>Hello {user_name},<br><br>Your company profile has been created and is waiting for admin approval.<br><br>Please check back your account with the login information below -<br>Your Email : {user_email}<br>Your Password : {user_password}<br><br>Regards</p>', '2023-09-13 02:49:17', '2023-09-13 02:49:17'),
(10, 'New Company', 'new_company', 'Company Created', '<p>Hello {user_name},<br><br>Your company profile has been created. Please login with below information.<br><br>Please check back your account with the login information below -<br>Your Email : {user_email}<br>Your Password : {user_password}<br><br>Regards</p>', '2023-09-13 02:49:17', '2023-09-13 02:49:17'),
(11, 'Update Company Password', 'update_company_pass', '{account_type} Updated', '<p>Hello {user_name},<br><br>Your {account_type} profile password updated.<br><br>Your Email : {user_email}<br>Your password : {password}<br><br>Regards</p>', '2023-09-13 02:49:17', '2023-09-13 02:49:17'),
(12, 'Verify Subscription Notification', 'verify_subscription_notification', 'Verify Your Subscription', '<p>Thanks for your interest in our newsletter!</p><p>You\'re one step away</p><h2>verify your email address</h2><p>to subscribe our newletter.</p><h3><a href=\'{verify_subscription}\'>Verify Now</a>&nbsp;</h3><p>Regards</p>', '2023-09-13 02:49:17', '2023-09-13 02:49:17');

-- --------------------------------------------------------

--
-- Table structure for table `experiences`
--

CREATE TABLE `experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `experiences`
--

INSERT INTO `experiences` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Fresher', 'fresher', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(2, '1 Year', '1-year', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(3, '2 Years', '2-years', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(4, '3+ Years', '3-years', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(5, '5+ Years', '5-years', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(6, '8+ Years', '8-years', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(7, '10+ Years', '10-years', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(8, '15+ Years', '15-years', '2023-09-13 02:49:41', '2023-09-13 02:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faq_category_id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `answer` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq_categories`
--

INSERT INTO `faq_categories` (`id`, `name`, `slug`, `icon`, `order`, `created_at`, `updated_at`) VALUES
(1, 'Job', 'job', 'fas fa-briefcase', 0, '2023-09-13 02:49:39', '2023-09-13 02:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `industry_types`
--

CREATE TABLE `industry_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `industry_types`
--

INSERT INTO `industry_types` (`id`, `created_at`, `updated_at`) VALUES
(1, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(2, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(3, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(4, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(5, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(6, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(7, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(8, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(9, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(10, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(11, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(12, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(13, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(14, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(15, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(16, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(17, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(18, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(19, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(20, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(21, '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(22, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(23, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(24, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(25, '2023-09-13 02:49:43', '2023-09-13 02:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `industry_type_translations`
--

CREATE TABLE `industry_type_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `industry_type_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `industry_type_translations`
--

INSERT INTO `industry_type_translations` (`id`, `industry_type_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'Agro Based Industry', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(2, 2, 'Archi/Enggr/Construction', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(3, 3, 'Automobile/Industrial Machine', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(4, 4, 'Bank/Mon-Bank Fin. Institute', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(5, 5, 'Electronics/Consumer Durables', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(6, 6, 'Energy/Power/Fuel', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(7, 7, 'Garments/Textile', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(8, 8, 'Govt./Semi-Govt./Autonomous', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(9, 9, 'Pharmaceuticals', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(10, 10, 'Hospital/Diagnostic Center', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(11, 11, 'Airline/Travel/Tourism', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(12, 12, 'Manufacturing (Light Industry)', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(13, 13, 'Manufacturing (Heavy Industry)', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(14, 14, 'Hotel/Restaurant', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(15, 15, 'Information Technology', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(16, 16, 'Logistics/Transportation', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(17, 17, 'Entertainment/Recreation', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(18, 18, 'Media/Advertising/Event Mgt.', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(19, 19, 'NGO/Development', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(20, 20, 'Real Estate/Development', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(21, 21, 'Wholesale/Retail/Export-Import', 'en', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(22, 22, 'Telecommunication', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(23, 23, 'Food & Beverage Industry', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(24, 24, 'Security Service', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(25, 25, 'Fire, Safety & Protection', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `experience_id` bigint(20) UNSIGNED NOT NULL,
  `education_id` bigint(20) UNSIGNED NOT NULL,
  `job_type_id` bigint(20) UNSIGNED NOT NULL,
  `salary_type_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `vacancies` varchar(255) NOT NULL,
  `min_salary` int(11) DEFAULT 0,
  `max_salary` int(11) DEFAULT 0,
  `deadline` date DEFAULT NULL,
  `description` longtext NOT NULL,
  `status` enum('pending','active','expired') NOT NULL DEFAULT 'pending',
  `apply_on` enum('app','email','custom_url') NOT NULL DEFAULT 'app',
  `apply_email` varchar(255) DEFAULT NULL,
  `apply_url` varchar(255) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `featured_until` date DEFAULT NULL,
  `highlight` tinyint(1) NOT NULL DEFAULT 0,
  `highlight_until` date DEFAULT NULL,
  `is_remote` tinyint(1) NOT NULL DEFAULT 0,
  `total_views` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `exact_location` varchar(255) DEFAULT NULL,
  `neighborhood` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `long` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `parent_job_id` bigint(20) UNSIGNED DEFAULT NULL,
  `waiting_for_edit_approval` tinyint(1) NOT NULL DEFAULT 0,
  `salary_mode` enum('range','custom') NOT NULL DEFAULT 'range',
  `custom_salary` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_benefit`
--

CREATE TABLE `job_benefit` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `benefit_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE `job_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` longtext DEFAULT NULL,
  `icon` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_categories`
--

INSERT INTO `job_categories` (`id`, `image`, `icon`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'backend/image/default.png', 'fas fa-hammer', '2023-09-13 02:49:40', '2023-09-13 02:49:41', 'engineerarchitects'),
(2, 'backend/image/default.png', 'fas fa-tshirt', '2023-09-13 02:49:40', '2023-09-13 02:49:41', 'garmentstextile'),
(3, 'backend/image/default.png', 'fas fa-pen', '2023-09-13 02:49:40', '2023-09-13 02:49:41', 'designcreative'),
(4, 'backend/image/default.png', 'fas fa-hospital', '2023-09-13 02:49:40', '2023-09-13 02:49:41', 'hospitality-travel-tourism'),
(5, 'uploads/images/jobCategory\\MXeFmWdTRTkxdiidYMIWopVj1mZcevl1cOo9Guak.png', 'fas fa-desktop', '2023-09-13 02:49:40', '2023-11-19 13:29:11', 'it-telecommunication'),
(6, 'uploads/images/jobCategory\\DKlTyYdt4YlKpLIFBC3HZMrz5q8oFAAhilrcbMDD.png', 'fas fa-user-md', '2023-09-13 02:49:41', '2023-11-19 13:31:00', 'medicalpharma'),
(7, 'backend/image/default.png', 'fas fa-car', '2023-09-13 02:49:41', '2023-09-13 02:49:41', 'drivingmotor-technician'),
(8, 'backend/image/default.png', 'fas fa-gavel', '2023-09-13 02:49:41', '2023-09-13 02:49:41', 'lawlegal'),
(9, 'backend/image/default.png', 'fas fa-ellipsis-v', '2023-09-13 02:49:41', '2023-09-13 02:49:41', 'others');

-- --------------------------------------------------------

--
-- Table structure for table `job_category_translations`
--

CREATE TABLE `job_category_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_category_translations`
--

INSERT INTO `job_category_translations` (`id`, `job_category_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'Engineer/Architects', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(2, 2, 'Garments/Textile', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(3, 3, 'Design/Creative', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(4, 4, 'Hospitality/ Travel/ Tourism', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(5, 5, 'IT & Telecommunication', 'en', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(6, 6, 'Medical/Pharma', 'en', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(7, 7, 'Driving/Motor Technician', 'en', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(8, 8, 'Law/Legal', 'en', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(9, 9, 'Others', 'en', '2023-09-13 02:49:41', '2023-09-13 02:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `job_roles`
--

CREATE TABLE `job_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_roles`
--

INSERT INTO `job_roles` (`id`, `created_at`, `updated_at`) VALUES
(1, '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(2, '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(3, '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(4, '2023-09-13 02:49:41', '2023-09-13 02:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `job_role_translations`
--

CREATE TABLE `job_role_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_role_translations`
--

INSERT INTO `job_role_translations` (`id`, `job_role_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'Team Leader', 'en', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(2, 2, 'Manager', 'en', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(3, 3, 'Assistant Manager', 'en', '2023-09-13 02:49:41', '2023-09-13 02:49:41'),
(4, 4, 'Executive', 'en', '2023-09-13 02:49:41', '2023-09-13 02:49:41');

-- --------------------------------------------------------

--
-- Table structure for table `job_skills`
--

CREATE TABLE `job_skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `skill_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_tag`
--

CREATE TABLE `job_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_types`
--

CREATE TABLE `job_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_types`
--

INSERT INTO `job_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Full Time', 'full-time', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(2, 'Part Time', 'part-time', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(3, 'Contractual', 'contractual', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(4, 'Intern', 'intern', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(5, 'Freelance', 'freelance', '2023-09-13 02:49:40', '2023-09-13 02:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `direction` varchar(3) NOT NULL DEFAULT 'ltr',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `direction`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'flag-icon-gb', 'ltr', '2023-09-13 02:49:39', '2023-09-13 02:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `language_data`
--

CREATE TABLE `language_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_data`
--

INSERT INTO `language_data` (`id`, `code`, `data`, `created_at`, `updated_at`) VALUES
(1, 'en', '{\"cv\":\"CV\",\"no\":\"No\",\"on\":\"ON\",\"or\":\"or Login with\",\"to\":\"To\",\"add\":\"Add\",\"all\":\"All\",\"and\":\"and\",\"app\":\"App\",\"bio\":\"Bio\",\"cms\":\"CMS\",\"faq\":\"FAQ\",\"job\":\"Job\",\"ltr\":\"Left To Right\",\"map\":\"Map\",\"now\":\"Now\",\"off\":\"OFF\",\"onn\":\"On\",\"pdf\":\"PDF\",\"rtl\":\"Right To Left\",\"seo\":\"SEO\",\"tag\":\"Tag\",\"top\":\"Top\",\"url\":\"URL\",\"yes\":\"Yes\",\"auto\":\"Auto\",\"back\":\"Back\",\"blog\":\"Blog\",\"body\":\"Body\",\"city\":\"City\",\"code\":\"Code\",\"dark\":\"Dark\",\"date\":\"Date\",\"days\":\"Days\",\"edit\":\"Edit\",\"faqs\":\"Faqs\",\"flag\":\"Flag\",\"home\":\"Home\",\"icon\":\"Icon\",\"jobs\":\"Jobs\",\"left\":\"Left\",\"logo\":\"Logo\",\"male\":\"Male\",\"name\":\"Name\",\"page\":\"Page\",\"paid\":\"Paid\",\"plan\":\"Plan\",\"post\":\"Post\",\"rate\":\"Rate\",\"role\":\"Role\",\"save\":\"Save\",\"smtp\":\"SMTP\",\"tags\":\"Tags\",\"view\":\"View\",\"year\":\"Year\",\"Draft\":\"Draft\",\"Hello\":\"Hello\",\"about\":\"About\",\"basic\":\"Basic\",\"clear\":\"Clear\",\"clone\":\"Clone\",\"close\":\"Close\",\"draft\":\"Draft\",\"email\":\"Email\",\"enter\":\"Enter\",\"files\":\"Files\",\"hello\":\"Hello\",\"image\":\"Image\",\"label\":\"Label\",\"light\":\"Light\",\"login\":\"Login\",\"miles\":\"Miles\",\"notes\":\"Notes\",\"order\":\"Order\",\"other\":\"Other\",\"phone\":\"Phone\",\"posts\":\"Posts\",\"price\":\"Price\",\"reply\":\"Reply\",\"right\":\"Right\",\"roles\":\"Roles\",\"stars\":\"Stars\",\"state\":\"State\",\"theme\":\"Theme\",\"times\":\"Times\",\"title\":\"Title\",\"action\":\"Action\",\"active\":\"Active\",\"amount\":\"Amount\",\"answer\":\"Answer\",\"author\":\"Author\",\"banner\":\"Banner\",\"cancel\":\"Cancel\",\"create\":\"Create\",\"degree\":\"Degree\",\"delete\":\"Delete\",\"enable\":\"Enable\",\"female\":\"Female\",\"filter\":\"Filter\",\"gender\":\"Gender\",\"github\":\"GitHub\",\"images\":\"Images\",\"latest\":\"Latest\",\"log_in\":\"Log In\",\"manual\":\"Manual\",\"method\":\"Method\",\"mollie\":\"Mollie\",\"oldest\":\"Oldest\",\"orders\":\"Orders\",\"others\":\"Others\",\"paypal\":\"Paypal\",\"period\":\"Period\",\"public\":\"Public\",\"reddit\":\"Reddit\",\"remote\":\"Remote\",\"salary\":\"Salary\",\"search\":\"Search\",\"select\":\"Select\",\"single\":\"Single\",\"skills\":\"Skills\",\"sortby\":\"Sort by\",\"status\":\"Status\",\"stripe\":\"Stripe\",\"submit\":\"Submit\",\"symbol\":\"Symbol\",\"thanks\":\"Thanks\",\"unpaid\":\"Unpaid\",\"update\":\"Update\",\"upload\":\"Upload\",\"vision\":\"Vision\",\"within\":\"Within\",\"Welcome\":\"Welcome\",\"account\":\"Account\",\"actions\":\"Actions\",\"add_job\":\"Add Job\",\"address\":\"Address\",\"approve\":\"Approve\",\"benefit\":\" Benefit\",\"comment\":\"Comment\",\"company\":\"Company\",\"contact\":\"Contact\",\"country\":\"Country\",\"default\":\"Default\",\"details\":\"Details\",\"disable\":\"Disable\",\"english\":\"English\",\"expired\":\"Expired\",\"favicon\":\"Favicon\",\"general\":\"General\",\"go_back\":\"Go Back\",\"hire_us\":\"Hire Us\",\"invoice\":\"Invoice\",\"jobs_by\":\"jobs by\",\"keyword\":\"Keyword\",\"leaflet\":\"Leaflet\",\"limited\":\"Limited\",\"log_out\":\"Log Out\",\"married\":\"Married\",\"message\":\"Message\",\"my_jobs\":\"My Jobs\",\"offline\":\"Offline\",\"options\":\"Options\",\"pay_now\":\"PAY NOW\",\"payment\":\"Payment\",\"pending\":\"Pending\",\"pricing\":\"Pricing\",\"private\":\"Private\",\"profile\":\"Profile\",\"promote\":\"Promote\",\"publish\":\"Publish\",\"save_to\":\"Save To\",\"sign_in\":\"Sign In\",\"sort_by\":\"Sort By\",\"subject\":\"Subject\",\"support\":\"Support\",\"twitter\":\"Twitter\",\"updated\":\"updated\",\"upgrade\":\"Upgrade\",\"warning\":\"Warning\",\"website\":\"Website\",\"welcome\":\"Welcome\",\"youtube\":\"Youtube\",\"Username\":\"Username\",\"about_me\":\"About Me\",\"about_us\":\"About Us\",\"activate\":\"Activate\",\"all_faqs\":\"All Faqs\",\"all_jobs\":\"All Jobs\",\"app_name\":\"App Name\",\"apply_on\":\"Apply On\",\"benefits\":\"Benefits\",\"bg_color\":\"BG Color\",\"call_now\":\"Call Now\",\"category\":\"Category\",\"comments\":\"Comments\",\"contacts\":\"Contacts\",\"currency\":\"Currency\",\"deadline\":\"Deadline\",\"download\":\"Download\",\"duration\":\"duraiton\",\"earnings\":\"Earnings\",\"edit_job\":\"Edit Job\",\"edit_seo\":\"Edit Seo\",\"employee\":\"Employee\",\"employer\":\"Company\",\"end_date\":\"End Date\",\"everyone\":\"Everyone\",\"facebook\":\"Facebook\",\"faq_list\":\"Faq List\",\"featured\":\"Featured\",\"find_job\":\"Find Job\",\"get_help\":\"Get Help\",\"job_list\":\"Job List\",\"job_role\":\"Job Role\",\"job_tags\":\"Job Tags\",\"job_type\":\"Job Type\",\"language\":\"Language\",\"latitude\":\"Latitude\",\"linkedin\":\"Linkedin\",\"live_job\":\"Live Jobs\",\"livemode\":\"Live Mode\",\"location\":\"Location\",\"map_type\":\"Map Type\",\"midtrans\":\"Midtrans\",\"new_jobs\":\"New Jobs\",\"open_job\":\"Open Job\",\"order_no\":\"Order No\",\"overview\":\"Overview\",\"password\":\"Password\",\"paystack\":\"Paystack\",\"per_page\":\"Per Page\",\"phone_no\":\"Phone No\",\"physical\":\"Physical\",\"position\":\"Position\",\"post_job\":\"Post Job\",\"previous\":\"Previous\",\"question\":\"Question\",\"razorpay\":\"Razorpay\",\"register\":\"Register\",\"rejected\":\"Rejected\",\"remotely\":\"Remotely\",\"send_now\":\"Send Now\",\"settings\":\"Settings\",\"show_all\":\"Show All\",\"skip_now\":\"Skip Now\",\"store_id\":\"Store ID\",\"subjects\":\"Subjects\",\"tag_list\":\"Tag List\",\"timezone\":\"Timezone\",\"username\":\"Username\",\"verified\":\"Verified\",\"view_all\":\"View All\",\"view_job\":\"View Job\",\"zip_code\":\"Zip Code\",\"Published\":\"Published\",\"activated\":\"Activated\",\"affiliate\":\"Affiliate\",\"all_roles\":\"All Roles\",\"all_state\":\"All State\",\"all_users\":\"All Users\",\"app_debug\":\"App Debug\",\"apply_job\":\"Apply Job\",\"apply_now\":\"Apply Now\",\"apply_url\":\"Apply Url\",\"available\":\"Available\",\"biography\":\"Biography\",\"bookmarks\":\"Bookmarks\",\"candidate\":\"Candidate\",\"choose_cv\":\"Choose CV\",\"city_list\":\"City List\",\"client_id\":\"Client Id\",\"companies\":\"Companies\",\"completed\":\"Completed\",\"dark_logo\":\"Dark Logo\",\"dashboard\":\"Dashboard\",\"direction\":\"Direction\",\"education\":\"Education\",\"employers\":\"Companies\",\"filter_by\":\"Filter By\",\"follow_us\":\"Follow us\",\"forbidden\":\"Forbidden\",\"full_name\":\"Full Name\",\"headphone\":\"Headphone\",\"highlight\":\"Highlight\",\"instagram\":\"Instagram\",\"instamojo\":\"Instamojo\",\"job_alert\":\"Job Alert\",\"job_level\":\"Job Level\",\"job_limit\":\"Job Post Limit\",\"job_title\":\"Job Title\",\"languages\":\"Languages\",\"live_mode\":\"Live Mode\",\"longitude\":\"Longitude\",\"mail_host\":\"Mail Host\",\"mail_port\":\"Mail Port\",\"many_more\":\"many more\",\"nav_color\":\"Nav Color\",\"page_name\":\"Page Name\",\"pinterest\":\"Pinterest\",\"plan_list\":\"Plan List\",\"plan_name\":\"Plan Name\",\"post_list\":\"Post List\",\"published\":\"Published\",\"read_more\":\"Read more\",\"remaining\":\"Remaining\",\"save_next\":\"Save & Next\",\"send_mail\":\"Send Email\",\"site_logo\":\"Site Logo\",\"subscribe\":\"Subscribe\",\"team_size\":\"Team Size\",\"time_zone\":\"Time Zone\",\"translate\":\"Translate\",\"unlimited\":\"Unlimited\",\"unpublish\":\"Unpublish\",\"user_edit\":\"User Edit\",\"user_list\":\"User List\",\"vacancies\":\"Total Vacancies\",\"view_jobs\":\"View Jobs\",\"work_type\":\"Work Type\",\"worldwide\":\"Worldwide\",\"Email Sent\":\"Email Sent\",\"about_page\":\"About Page\",\"all_author\":\"All Author\",\"all_states\":\"All States\",\"all_status\":\"All Status\",\"attributes\":\"Attributes\",\"background\":\"Background\",\"backup_now\":\"Backup Now\",\"birth_date\":\"Birth Date\",\"browse_job\":\"Browse Job\",\"candidates\":\"Candidates\",\"city_count\":\"City Count\",\"client_key\":\"Client Key\",\"comingsoon\":\"Coming-Soon\",\"contact_us\":\"Contact us\",\"copy_links\":\"Copy Link\",\"create_faq\":\"Create FAQ\",\"create_new\":\"Create New\",\"custom_url\":\"Custom Url\",\"dd_mm_yyyy\":\"DD\\/MM\\/YYY\",\"delete_job\":\"Delete Job\",\"department\":\"Department\",\"educations\":\"Educations\",\"email_list\":\"Email List\",\"email_sent\":\"Email Sent\",\"enter_city\":\"Enter City\",\"experience\":\"Experience\",\"founded_in\":\"Founded In\",\"go_back_to\":\"Go back to\",\"google-map\":\"Google Map\",\"google_map\":\"Google Map\",\"group_name\":\"Group Name\",\"inactivate\":\"In-Activate\",\"indeed_api\":\"Indeed API\",\"job_expire\":\"Job Expire\",\"job_posted\":\"Job Posted\",\"job_status\":\"Job Status\",\"learn_more\":\"Learn More\",\"light_logo\":\"Light Logo\",\"login_page\":\"Login Page\",\"main_color\":\"Main Color\",\"max_salary\":\"Maximum Salary\",\"meta_title\":\"Meta Title\",\"min_salary\":\"Minimum Salary\",\"mollie_key\":\"Mollie Key\",\"my_profile\":\"My Profile\",\"newsletter\":\"Newsletter\",\"on_the_top\":\"On the top\",\"owner_name\":\"Owner Name\",\"permission\":\"Permission\",\"post_a_job\":\"Post a Job\",\"price_plan\":\"Price Plan\",\"profession\":\"Profession\",\"public_key\":\"Public Key\",\"remote_job\":\"Remote Job\",\"roles_list\":\"Roles List\",\"saved_jobs\":\"Saved Jobs\",\"search_job\":\"Search Job\",\"secret_key\":\"Secret Key\",\"select_one\":\"Select One\",\"send_email\":\"Send Email\",\"server_key\":\"Server Key\",\"skill_list\":\"Skill List\",\"sslcommerz\":\"SSL Commerz\",\"start_date\":\"Start Date\",\"state_list\":\"State List\",\"suggestion\":\"Suggestion\",\"text_color\":\"Text Color\",\"total_post\":\"Total Posts\",\"unverified\":\"Unverified\",\"updated_at\":\"Updated At\",\"user_image\":\"User Image\",\"users_list\":\"Users List\",\"who_we_are\":\"Who we are\",\"Enter_title\":\"Enter title\",\"active_jobs\":\"Active Jobs\",\"add_company\":\"Add Company\",\"all_country\":\"All Country\",\"app_country\":\"App Country\",\"apply_email\":\"Apply Email\",\"browse_file\":\"Browse file\",\"browse_jobs\":\"Browse Jobs\",\"bulk_import\":\"Bulk Import\",\"button_link\":\"Button Link\",\"ccpa_cookie\":\"CCPA Cookie\",\"change_file\":\"Change file\",\"choose_city\":\"Choose city\",\"choose_file\":\"Choose File\",\"choose_plan\":\"Select Your Plan\",\"clear_cache\":\"Clear Cache\",\"coming_soon\":\"Coming Soon\",\"cookie_name\":\"Cookie Name\",\"create_plan\":\"Current Plan\",\"create_post\":\"Create Post\",\"create_role\":\"Create Role\",\"create_user\":\"Create User\",\"deactivated\":\"Deactivated\",\"default_lat\":\"Default latitude\",\"description\":\"Description\",\"designation\":\"Designation\",\"disable_all\":\"Disable All\",\"download_cv\":\"Download Cv\",\"easy_to_use\":\"Easy to Use\",\"error_image\":\"Error Image\",\"error_pages\":\"Error Pages\",\"example_map\":\"Example Map\",\"flutterwave\":\"Flutterwave\",\"gdpr_cookie\":\"GDPR Cookie\",\"get_started\":\"Get Started\",\"indeed_jobs\":\"Indeed Jobs\",\"job_applied\":\"Job Applied\",\"job_details\":\"Job Details\",\"job_promote\":\"Job Promote\",\"joined_date\":\"Joined Date\",\"latest_jobs\":\"Latest Jobs\",\"lgpd_cookie\":\"LGPD Cookie\",\"login_image\":\"Login Image\",\"mail_driver\":\"Mail Driver\",\"maintenance\":\"Maintenance\",\"manage_jobs\":\"Manage Jobs\",\"map_address\":\"Map Address\",\"merchant_id\":\"Merchant ID\",\"new_message\":\"New message\",\"no_comments\":\"No Comments\",\"our_mission\":\"Our Mission\",\"owner_email\":\"Owner Email\",\"pay_per_job\":\"Pay Per Job\",\"phone_email\":\"Phone & Email\",\"popular_tag\":\"Popular Tag\",\"preferences\":\"Preferences\",\"privacy_url\":\"Privacy URL\",\"professions\":\"Professions\",\"profile_url\":\"Profile Url\",\"promote_job\":\"Promote Job\",\"recent_jobs\":\"Recent Jobs\",\"recent_post\":\"Recent Post\",\"recommanded\":\"Recommended\",\"recommended\":\"Recommended\",\"remember_me\":\"Remember Me\",\"resend_link\":\"Resend link\",\"salary_type\":\"Salary Type\",\"secret_hash\":\"Secret Hash\",\"select_city\":\"Select City\",\"select_plan\":\"Select Plan\",\"single_base\":\"Single Base\",\"slider_list\":\"Slider List\",\"testimonial\":\"Testimonial\",\"there_is_no\":\"There is no\",\"transaction\":\"Transaction\",\"translating\":\"Translating\",\"upgrade_now\":\"Upgrade Now\",\"upload_logo\":\"Upload Logo\",\"user_create\":\"User Create\",\"view_resume\":\"View Resume\",\"website_url\":\"Website URL\",\"accent_color\":\"Accent Color\",\"affiliate_id\":\"Affiliate ID\",\"all_category\":\"All Category\",\"all_language\":\"All Language\",\"applications\":\"Applications\",\"applied_jobs\":\"Applied Jobs\",\"apply_filter\":\"Apply Filter\",\"apply_job_on\":\"Apply for Job On\",\"are_you_sure\":\"Are you sure ?\",\"assign_roles\":\"Assign Roles\",\"auto_payment\":\"Auto Payment\",\"availability\":\"Availability\",\"available_in\":\"Available In\",\"bank_payment\":\"Bank Payment\",\"banner_image\":\"Banner Image\",\"benefit_list\":\"Benefit List\",\"blog_deatils\":\"Blog Details\",\"button_color\":\"Button Color\",\"cash_payment\":\"Cash Payment\",\"change_image\":\"Change Image\",\"company_info\":\"Company Info\",\"company_list\":\"Company List\",\"company_name\":\"Company Name\",\"company_size\":\"Company Size\",\"contact_info\":\"Contact Info\",\"contact_list\":\"Contact List\",\"cookie_title\":\"We use cookies!\",\"country_list\":\"Country List\",\"cover_letter\":\"Cover Letter\",\"created_time\":\"Created Time\",\"date_applied\":\"Date Applied\",\"default_long\":\"Default longitude\",\"delete_image\":\"Delete Image\",\"edit_profile\":\"Edit Profile\",\"english_text\":\"English Text\",\"example_file\":\"Example File\",\"expired_jobs\":\"Expired Jobs\",\"faq_category\":\"Faq Category\",\"featured_job\":\"Featured Job\",\"find_job_now\":\"Find Job Now\",\"full_address\":\"Full Address\",\"get_in_touch\":\"Get In Touch\",\"job-category\":\"Job Category\",\"job_approval\":\"Job Approval\",\"job_benefits\":\"Job Benefits\",\"job_category\":\"Job Category\",\"job_overview\":\"Job Overview\",\"latest_users\":\"Latest Users\",\"loader_image\":\"Loader Image\",\"mark_as_paid\":\"Mark as paid\",\"member_since\":\"Member Since\",\"navbar_color\":\"Navbar Color\",\"new_password\":\"New Password\",\"not_verified\":\"Not Verified\",\"notification\":\"Notification\",\"organization\":\"Organization\",\"page_expired\":\"Page Expired\",\"payment_type\":\"Payment Type\",\"pending_jobs\":\"Pending Jobs\",\"phone_number\":\"Phone Number\",\"plan_details\":\"Plan Details\",\"post_a_reply\":\"Post a Reply\",\"profile_link\":\"Profile Link\",\"profile_view\":\"Profile View\",\"register_now\":\"Register Now\",\"related_jobs\":\"Related Jobs\",\"salary_range\":\"Salary Range\",\"save_changes\":\"Save Changes\",\"select_state\":\"Select State\",\"send_message\":\"Send Message\",\"short_listed\":\"Short Listed\",\"site_favicon\":\"Site Favicon\",\"slider_color\":\"Slider Color\",\"social_login\":\"Social Login\",\"social_media\":\"Social Media\",\"states_count\":\"States Count\",\"step_1_title\":\"Step 1 Title\",\"step_2_title\":\"Step 2 Title\",\"step_3_title\":\"Step 3 Title\",\"step_4_title\":\"Step 4 Title\",\"successfully\":\"successfully\",\"tag_has_jobs\":\"Tag has jobs\",\"update_email\":\"Update Email\",\"upgrade_plan\":\"Upgrade Plan\",\"upload_photo\":\"Upload Photo\",\"view_details\":\"View Details\",\"view_invoice\":\"View Invoice\",\"view_message\":\"View Message\",\"view_profile\":\"View Profile\",\"view_sitemap\":\"View Sitemap\",\"Check_example\":\"Check Example\",\"Force_consent\":\"Force Consent ?\",\"active_filter\":\"Active Filter\",\"add_cv_resume\":\"Add a CV\\/Resume\",\"add_education\":\"Add Education\",\"add_new_group\":\"Add New Group\",\"allow_cookies\":\"Allow Cookies\",\"and_many_more\":\"and many more\",\"basic_setting\":\"Basic Setting\",\"bookmark_jobs\":\"Bookmark Jobs\",\"carrerjet_api\":\"Careerjet API\",\"category_list\":\"Category List\",\"check_payment\":\"Check Payment\",\"choose_resume\":\"Choose Resume\",\"client_secret\":\"Client Secret\",\"close_account\":\"Close Account\",\"contact_email\":\"Contact Email\",\"contact_title\":\"Who we are\",\"cookies_alert\":\"Cookies Alert\",\"currency_list\":\"Currency List\",\"custom_salary\":\"Custom Salary\",\"date_of_birth\":\"Date Of Birth\",\"documentation\":\"Documentation\",\"edit_currency\":\"Edit Currency\",\"edit_language\":\"Edit Language\",\"email_address\":\"Email Address\",\"email_support\":\"Email Support\",\"employer_name\":\"Company Name\",\"enter_keyword\":\"Enter Keyword...\",\"favorite_jobs\":\"Favorite Jobs\",\"featured_jobs\":\"Featured Jobs\",\"force_consent\":\"Force Consent ?\",\"founding_info\":\"Founding Info\",\"give_feedback\":\"Give Feedback\",\"industry_type\":\"Industry Type\",\"instamojo_key\":\"Instamojo Key\",\"instamojo_url\":\"Instamojo URL\",\"job_not_found\":\"Job not found\",\"job_role_list\":\"Job Role List\",\"language_list\":\"Language List\",\"mail_password\":\"Mail Password\",\"mail_settings\":\"Mail Settings\",\"mail_username\":\"Mail Username\",\"menu_settings\":\"Menu Settings\",\"mission_image\":\"Mission Image\",\"mobile_slider\":\"Mobile Slider\",\"multiple_base\":\"Multiple Base\",\"no_data_found\":\"No Data Found!\",\"not_available\":\"Not Available\",\"notifications\":\"Notifications\",\"on_your_email\":\"On Your Email\",\"open_position\":\"Open Position\",\"per_job_price\":\"Per job price\",\"plan_benefits\":\"Plan Benefits\",\"plans_billing\":\"Plans & Billing\",\"prerequisites\":\"Prerequisites\",\"primary_color\":\"Primary Color\",\"publisher_key\":\"Publisher Key\",\"quick_actions\":\"Quick Actions\",\"razor_payment\":\"Razor Payment\",\"refund_policy\":\"Refund Policy\",\"register_page\":\"Register Page\",\"registered_at\":\"Registered At\",\"save_as_draft\":\"Save As Draft\",\"seo_page_list\":\"Seo Page List\",\"show_frontend\":\"Show this package on frontend\",\"sidebar_color\":\"Sidebar Color\",\"theme_setting\":\"Theme Setting\",\"total_authors\":\"Total Authors\",\"upgrade_guide\":\"Upgrade Guide\",\"upload_banner\":\"Upload Banner\",\"view_all_jobs\":\"View All Jobs\",\"view_frontend\":\"Look in frontend\",\"visit_website\":\"Visit Website\",\"why_choose_us\":\"Why choose us\",\"write_a_reply\":\"Write A Reply\",\"add_experience\":\"Add Experience\",\"add_your_first\":\"Add your first\",\"advance_filter\":\"Advance Filter\",\"browse_website\":\"Browse Website\",\"button_outline\":\"Button Outline\",\"candidate_list\":\"Candidate List\",\"careerjet_jobs\":\"Careerjet Jobs\",\"choose_country\":\"Choose country\",\"color_settings\":\"Color Settings\",\"company_vision\":\"Company Vision\",\"congratulation\":\"Congratulations\",\"cost_effective\":\"Cost Effective\",\"create_account\":\"Create Account\",\"custom_payment\":\"Custom Payment\",\"cv_resume_name\":\"Cv\\/Resume Name\",\"database_files\":\"Database Files\",\"days_remaining\":\"Days Remaining\",\"default_locale\":\"Default Locale\",\"edit_candidate\":\"Edit Candidate\",\"edit_education\":\"Edit Education\",\"email_verified\":\"Email Verified\",\"enter_location\":\"Enter Location\",\"facebook_pixel\":\"Facebook Pixel\",\"find_candidate\":\"Find Candidate\",\"find_employers\":\"Find Companies\",\"highlight_jobs\":\"Highlight Jobs\",\"highlights_job\":\"Highlights Job\",\"i_am_available\":\"I am available\",\"keep_me_logged\":\"Keep me logged in\",\"latest_invoice\":\"Latest Invoices\",\"layout_setting\":\"Layout Setting\",\"mail_from_name\":\"Mail From Name\",\"make_it_active\":\"Make it active\",\"make_it_expire\":\"Make It Expire\",\"manual_payment\":\"Manual Payment\",\"marital_status\":\"Marital Status\",\"merchant_email\":\"Merchant Email\",\"mollie_payment\":\"Mollie Payment\",\"mollie_setting\":\"Mollie Setting\",\"open_positions\":\"Open Positions\",\"orders_details\":\"Orders Details\",\"payment_method\":\"Payment Method\",\"payment_status\":\"Payment Status\",\"paypal_payment\":\"Paypal Payment\",\"post_a_comment\":\"Post a Comment\",\"privacy_policy\":\"Privacy & Policy\",\"profile_verify\":\"Profile Verify\",\"register_image\":\"Register Image\",\"reset_password\":\"Reset Password\",\"responsibility\":\"Responsibility\",\"resume_privacy\":\"Resume Privacy\",\"salary_details\":\"Salary Details\",\"select_country\":\"Select Country\",\"send_test_mail\":\"Send Test Mail\",\"setup_progress\":\"Setup Progress\",\"share_this_job\":\"Share This Job\",\"skill_has_jobs\":\"Skill has jobs\",\"social_details\":\"Social Details\",\"social_profile\":\"Social Profile\",\"store_password\":\"Store Password\",\"stripe_payment\":\"Stripe Payment\",\"theme_settings\":\"Theme Settings\",\"total_category\":\"Total Category\",\"total_comments\":\"Total Comments\",\"total_new_jobs\":\"Total New Jobs\",\"transaction_no\":\"Transaction No\",\"upgrade_system\":\"Upgrade System\",\"view_dashboard\":\"View Dashboard\",\"view_more_jobs\":\"View More Jobs\",\"your_cv_resume\":\"Your CV\\/Resume\",\"your_resume_is\":\"Your resume is\",\"account_details\":\"Account Details\",\"account_setting\":\"Account Setting\",\"already_applied\":\"Already Applied\",\"app_country_set\":\"App country set\",\"apply_with_ease\":\"Apply with Ease\",\"billing_address\":\"Billing Address\",\"candidate_image\":\"Candidate Image\",\"candidate_title\":\"Join Our Talent Network\",\"change_password\":\"Change Password\",\"choose_job_role\":\"Choose Job Role\",\"comingsoon_page\":\"Comingsoon Page\",\"company_joblist\":\"Company Joblist\",\"compare_changes\":\"Compare Changes\",\"confirm_payment\":\"Confirm Payment\",\"congratulations\":\"Congratulations\",\"contact_details\":\"Contact Details\",\"create_category\":\"Create Category\",\"create_currency\":\"Create Currency\",\"create_employer\":\"Create Company\",\"create_language\":\"Create Language\",\"created_content\":\"Created Content\",\"delete_language\":\"Delete Language\",\"edit_experience\":\"Edit Experience\",\"edited_job_list\":\"Edited Job List\",\"education_level\":\"Education Level\",\"email_templates\":\"Email Templates\",\"employers_image\":\"Companies Image\",\"employers_title\":\"Discover Your Perfect Team\",\"enter_city_name\":\"Enter city name\",\"facebook_pixels\":\"Facebook Pixels\",\"find_candidates\":\"Find Candidates\",\"forget_password\":\"Forget Password\",\"google_nalytics\":\"Google Analytics\",\"have_a_question\":\"Have a question ?\",\"job_description\":\"Job Description\",\"layout_settings\":\"Layout Settings\",\"mail_encryption\":\"Mail Encryption\",\"no_notification\":\"No Notification\",\"nothing_to_sync\":\"Nothing to Sync\",\"on_a_custom_url\":\"On a custom URL\",\"on_our_platform\":\"On our platform\",\"payment_gateway\":\"Payment Gateway\",\"paypal_settings\":\"Paypal Settings\",\"product_roadmap\":\"Product Roadmap\",\"profession_list\":\"Profession List\",\"profile_details\":\"Profile Details\",\"profile_picture\":\"Profile Picture\",\"profile_privacy\":\"Profile Privacy\",\"profile_updated\":\"Profile Updated\",\"save_for_letter\":\"Save for letter\",\"saved_candidate\":\"Saved Candidates\",\"secondary_color\":\"Secondary Color\",\"secondary_email\":\"Secondary Email\",\"secondary_phone\":\"Secondary Phone\",\"select_language\":\"Select Language\",\"skills_you_have\":\"Skills you have\",\"stripe_settings\":\"Stripe Settings\",\"system_settings\":\"System Settings\",\"system_timezone\":\"System Timezone\",\"terms_condition\":\"Terms & Conditions\",\"thumbnail_image\":\"Thumbnail Image\",\"tittle_headline\":\"Tittle\\/headline\",\"total_employers\":\"Total Companies\",\"unauthenticated\":\"Unauthenticated\",\"whatsapp_number\":\"Whatsapp Number\",\"working_process\":\"Working Process\",\"write_a_comment\":\"Write A Comment\",\"your_profile_is\":\"Your profile is\",\"about_brand_logo\":\"About Brand Logo\",\"account_complete\":\"Account Complete\",\"all_notification\":\"All Notification\",\"app_country_type\":\"App Country Type\",\"application_mode\":\"Application Mode\",\"approved_changes\":\"Approved Changes\",\"available_format\":\"Available format\",\"benefit_has_jobs\":\"Benefit has jobs\",\"browse_employers\":\"Browse Companies\",\"coming_soon_mode\":\"Coming Soon Mode\",\"comingsoon_image\":\"Coming soon Image\",\"company_location\":\"Company Location\",\"confirm_password\":\"Confirm Password\",\"cookies_settings\":\"Cookies Settings\",\"create_candidate\":\"Create Candidate\",\"currency_example\":\"Currency Example\",\"current_location\":\"Current Location\",\"current_password\":\"Current Password\",\"custom_questions\":\"Custom Questions\",\"deadline_expired\":\"Deadline Expired\",\"default_latitude\":\"Default Latitude\",\"download_invoice\":\"Download Invoice\",\"employer_details\":\"Company Details\",\"experience_level\":\"Experience Level\",\"generate_sitemap\":\"Generate Sitemap\",\"get_access_token\":\"Get Access Token\",\"github_client_id\":\"GitHub Client Id\",\"google_analytics\":\"Google Analytics\",\"google_client_id\":\"Google Client Id\",\"help_and_support\":\"Help & Support\",\"instamojo_secret\":\"Instamojo Secret\",\"latest_jobs_from\":\"Latest jobs from\",\"maintenance_mode\":\"Maintenance Mode\",\"mark_all_as_read\":\"Mark all as read\",\"meta_description\":\"Meta Description\",\"midtrans_payment\":\"Midtrans Payment\",\"midtrans_setting\":\"Midtrans Setting\",\"no_open_position\":\"No Open Position\",\"nocaptcha_secret\":\"Nocaptcha Secret\",\"payment_provider\":\"Payment Provider\",\"paystack_payment\":\"Paystack Payment\",\"personal_website\":\"Personal Website\",\"popular_category\":\"Popular Category\",\"popular_location\":\"Popular Location\",\"popular_searches\":\"Popular Searches\",\"profile_in_title\":\"Your profile is incomplete\",\"profile_link_url\":\"Profile Link \\/ URL\",\"recently_applied\":\"Recently Applied\",\"responsibilities\":\"Responsibilities\",\"result_found_for\":\"result found for\",\"search_employers\":\"Search Companies\",\"show_in_the_menu\":\"Show in the menu\",\"supported_format\":\"Supported format\",\"terms_conditions\":\"Terms & Conditions\",\"terms_of_service\":\"Terms of Service\",\"testimonial_list\":\"Testimonial List\",\"total_candidates\":\"Total Candidates\",\"translation_text\":\"Translation Text\",\"update_cv_resume\":\"Update Cv\\/Resume\",\"update_education\":\"Update Education\",\"upload_cv_resume\":\"Upload Cv\\/Resume\",\"user_role_manage\":\"User Role Manage\",\"view_all_company\":\"View All Company\",\"website_settings\":\"Website Settings\",\"years_experience\":\"Years Experience\",\"admin_theme_style\":\"Admin Theme Style\",\"affiliate_setting\":\"Affiliate Setting\",\"all_notifications\":\"All Notifications\",\"app_configuration\":\"App Configuration\",\"applicant_options\":\"Applicant Options\",\"are_you_sure_item\":\"Are you sure item ?\",\"basic_information\":\"Basic Information\",\"bookmark_category\":\"Bookmark Category\",\"browse_candidates\":\"Browse Candidates\",\"button_text_color\":\"Button Text Color\",\"comming_soon_mode\":\"Comming Soon Mode\",\"currently_working\":\"Currently Working\",\"custom_css_and_js\":\"Custom CSS And JS\",\"default_longitude\":\"Default Longitude\",\"dont_have_account\":\"Don\'t have an account?\",\"external_platform\":\"External Platform\",\"facebook_pixel_id\":\"Facebook Pixel Id\",\"faq_category_list\":\"Faq Category List\",\"industry_has_jobs\":\"Industry type has companies\",\"instamojo_setting\":\"Instamojo Setting\",\"job_category_list\":\"Job Category List\",\"job_role_has_jobs\":\"Job role has jobs\",\"job_title_keyword\":\"Job Title, Keyword\",\"login_credentials\":\"Login Credentials\",\"login_with_github\":\"Login with GitHub\",\"login_with_google\":\"Login with Google\",\"logo_banner_image\":\"Logo & Banner Image\",\"mail_from_address\":\"Mail From Address\",\"maintenance_image\":\"Maintenance Image\",\"maximum_file_size\":\"Maximum file size\",\"mobile_app_config\":\"Mobile App Config\",\"nocaptcha_sitekey\":\"Nocaptcha Sitekey\",\"organization_type\":\"Organization Type\",\"paystack_settings\":\"Paystack Settings\",\"quality_candidate\":\"Quality Candidate\",\"razorpay_settings\":\"Razorpay Settings\",\"search_candidates\":\"Search Candidates\",\"select_profession\":\"Select Profession\",\"select_visibility\":\"Select Visibility\",\"selected_location\":\"SELECTED LOCATION\",\"short_description\":\"Short Description\",\"show_popular_list\":\"Show Popular List \",\"twitter_client_id\":\"Twitter Client Id\",\"update_experience\":\"Update Experience\",\"user_verification\":\"User Verification\",\"view_applications\":\"View Applications\",\"yes_want_to_login\":\"Yes, I want to login\",\"your_availability\":\"Your availability\",\"zoho_verification\":\"Zoho Verification\",\"Reject_button_text\":\"Reject Button Text\",\"about_banner_image\":\"About Banner Image\",\"account_activation\":\"Account Activation\",\"account_delete_msg\":\"If you delete your account, you\'ll lose access to matched jobs, followed employers, job alerts, shortlisted jobs, and other services\",\"button_hover_color\":\"Button Hover Color\",\"cancel_application\":\"Cancel Application\",\"cookie_description\":\"We use cookies to provide our services and for analytics and marketing. To find out more about our use of cookies, please see our Privacy Policy. By continuing to browse our website, you agree to our use of cookies.\",\"download_my_resume\":\"Download My Resume\",\"edited_job_content\":\"Edited Job Content\",\"email_verification\":\"Email Verification\",\"employer_dashboard\":\"Company Dashboard\",\"establishment_date\":\"Establishment Date\",\"existing_questions\":\"Existing Questions\",\"facebook_client_id\":\"Facebook Client Id\",\"featured_job_limit\":\"Featured Job Post Limit\",\"featured_job_price\":\"Featured job price\",\"footer_description\":\"Discover tailored opportunities for job seekers and top talent for employers\",\"found_in_this_page\":\"found in this page\",\"if_you_delete_this\":\"If you delete this\",\"invalid_job_status\":\"Invalid job status\",\"job_status_changed\":\"Job Status Changed\",\"languages_you_know\":\"Languages you know\",\"linkedin_client_id\":\"Linkedin Client Id\",\"login_with_twitter\":\"Login with Twitter\",\"menu_show_frontend\":\"Show Menu List\",\"page_preview_image\":\"Page Preview Image\",\"payment_was_failed\":\"Payment was failed\",\"reject_button_text\":\"Enter approve button to text\",\"return_to_job_list\":\"Return To Job List\",\"select_cookie_name\":\"Select cookie name\",\"share_this_profile\":\"Share This Profile\",\"signup_with_github\":\"Signup with GitHub\",\"signup_with_google\":\"Signup with Google\",\"step_1_description\":\"Step 1 Description\",\"step_2_description\":\"Step 2 Description\",\"step_3_description\":\"Step 3 Description\",\"step_4_description\":\"Step 4 Description\",\"subscriptions_date\":\"Subscriptions Date\",\"top_nav_text_color\":\"Top Nav Text Color\",\"translate_language\":\"Translate Language\",\"Approve_button_text\":\"Approve Button Text\",\"Or_pay_per_job_post\":\"OR Choose Pay Per Job Posting\",\"account_setup_title\":\"Account Setup Title\",\"add_new_social_link\":\"Add New Social Link\",\"add_your_first_plan\":\"Add your first plan\",\"advance_information\":\"Advance Information\",\"all_rights_reserved\":\"All Rights Reserved\",\"approve_button_text\":\"Approve Button Text\",\"candidate_dashboard\":\"Candidate Dashboard\",\"clients_testimonial\":\"What Our Clients Say\",\"company_description\":\"Company Description\",\"company_information\":\"Company Information\",\"contact_information\":\"Contact Information\",\"country_wise_states\":\"Country Wise States\",\"create_account_as_a\":\"CREATE ACCOUNT AS A\",\"create_your_profile\":\"Create Your Profile\",\"current_resume_size\":\"Current resume size\",\"edited_job_approval\":\"Edited Job Approval\",\"employers_dashboard\":\"Companies Dashboard\",\"exact_location_only\":\"Exact Location Only\",\"flutterwave_payment\":\"Flutterwave Payment\",\"frontend_icon_color\":\"Frontend Icon Color\",\"frontend_link_color\":\"Frontend Link Color\",\"gdpr_cookie_consent\":\"GDPR Compliance\",\"google_analytics_id\":\"Google Analytics Id\",\"highlight_job_limit\":\"Highlighted Job Post Limit\",\"industry_types_list\":\"Industry Types List\",\"its_not_a_free_plan\":\"It\'s not a free plan\",\"login_register_page\":\"Login Register Page\",\"login_with_employer\":\"Login with Company\",\"login_with_facebook\":\"Login with Facebook\",\"login_with_linkedin\":\"Login with Linkedin\",\"mark_profile_verify\":\"Mark Company who purchase this plan as verified\",\"mobile_app_settings\":\"Mobile App Settings\",\"opps_page_not_found\":\"Oops! Page not found\",\"pending_edited_jobs\":\"Pending Edited Jobs\",\"service_unavailable\":\"Service Unavailable\",\"set_default_package\":\"Set Default Package\",\"signup_with_twitter\":\"Signup with Twitter\",\"ssl_commerz_payment\":\"SSL Commerz Payment\",\"sslcommerz_settings\":\"SSL Commerz Settings\",\"total_amount_to_pay\":\"Total Amount to pay\",\"track_your_progress\":\"Track Your Progress\",\"unauthorized_access\":\"Unauthorized Access\",\"upload_banner_image\":\"Upload Banner Image\",\"view_all_candidates\":\"View All Candidates\",\"website_theme_style\":\"Website Theme Style\",\"your_google_map_key\":\"Your Google Map Key\",\"already_have_account\":\"Already have an account?\",\"auto_payment_methods\":\"Auto Payment Methods\",\"change_account_email\":\"Change Account Email Address\",\"close_delete_account\":\"Close\\/Delete Account\",\"contact_info_updated\":\"Contact Info updated\",\"create_plan_benefits\":\"Current Plan Benefits\",\"dont_have_permission\":\"Do not have permission\",\"flutterwave_settings\":\"Flutterwave Settings\",\"forgot_your_password\":\"Forgot Your Password\",\"github_client_secret\":\"GitHub Client Secret\",\"google_client_secret\":\"Google Client Secret\",\"hightlight_job_price\":\"Highlight job price\",\"hubspot_verification\":\"Hubspot Verification\",\"i_forgot_my_password\":\"I forgot my password\",\"login_with_candidate\":\"Login with Candidate\",\"maintenance_subtitle\":\"Maintenance Subtitle\",\"our_mission_headline\":\"We\\u2019re a highly  professionals team\",\"page_content_updated\":\"Page content updated\",\"receive_applications\":\"Receive Applications\",\"set_default_currency\":\"Set Default Currency\",\"set_default_language\":\"Set Default Language\",\"signup_with_facebook\":\"Signup with Facebook\",\"signup_with_linkedin\":\"Signup with Linkedin\",\"skill_has_candidates\":\"Skill has candidates\",\"social_login_setting\":\"Social Login Setting\",\"social_media_profile\":\"Social Media Profile\",\"something_went_wrong\":\"Something went wrong\",\"ssl_commerz_settings\":\"SSl Commerz Settings\",\"total_verified_users\":\"Total Verified Users\",\"verify_email_address\":\"Verify Email Address\",\"visibility_this_menu\":\"Visibility this menu?\",\"what_our_people_says\":\"What Our People Says\",\"allow_cookies_consent\":\"Allow Cookies Consent ?\",\"backend_color_setting\":\"Backend Color Setting\",\"browse_file_here_only\":\"Choose a new file\",\"candidate_description\":\"Unlock endless opportunities and connect with top employers. Let your skills shine and land your dream job.\",\"candidate_must_answer\":\"Required ( Candidate must answer )\",\"company_title_keyword\":\"Company Title Keyword\",\"cookie_expiration_day\":\"Cookie Expiration (day)\",\"employer_or_candidate\":\"Company Or Candidate ?\",\"employers_description\":\"Access a pool of skilled candidates and streamline your hiring process. Find the best talent for your company\'s success\",\"employers_information\":\"Companies Information\",\"explore_opportunities\":\"Explore Opportunities\",\"fully_remote_position\":\"Fully Remote Position\",\"google_search_console\":\"Google Search Console\",\"internal_server_error\":\"Internal Server Error\",\"job_category_has_jobs\":\"Job category has jobs\",\"job_status_now_expire\":\"Job Status Now Expire\",\"logo_and_favicon_here\":\"Logo & favicon here\",\"money_pay_with_stripe\":\"Money pay with stripe\",\"on_your_email_address\":\"On your email address\",\"order_and_transaction\":\"Order & Transaction\",\"page_meta_data_edited\":\"Page Meta Data Edited\",\"published_job_content\":\"Published Job Content\",\"rejected_applications\":\"Rejected Applications\",\"search_engine_ndexing\":\"Search Engine Indexing\",\"see_all_notifications\":\"See All Notifications\",\"tag_already_exists_in\":\"Tag already exists in\",\"top_navigation_layout\":\"Top Navigation Layout\",\"twitter_client_secret\":\"Twitter Client Secret\",\"upload_your_cv_resume\":\"Upload Your CV\\/Resume\",\"working_process_setup\":\"Working Process Setup\",\"year_of_establishment\":\"Year of Establishment\",\"account_setup_subtitle\":\"Account Setup Subtitle\",\"basic_standard_premium\":\"Basic \\/ Standard \\/ Premium\",\"benefit_already_exists\":\"Benefit already exists\",\"candidate_hiring_stage\":\"Candidate Hiring Stage\",\"candidate_profile_view\":\"Candidates Profile View\",\"click_to_add_a_pointer\":\"Click to add a pointer\",\"company_contact_public\":\"Company Phone & Email Address For Public View\",\"facebook_client_secret\":\"Facebook Client Secret\",\"featured_jobs_duration\":\"Featured jobs duration\",\"follow_me_social_media\":\"Follow Me Social Media\",\"frontend_color_setting\":\"Frontend Color Setting\",\"group_is_not_deletable\":\"Group is not deletable\",\"i_am_currently_working\":\"I am currently working\",\"left_navigation_layout\":\"Left Navigation Layout\",\"linkedin_client_secret\":\"Linkedin Client Secret\",\"location_configuration\":\"Location Configuration\",\"mail_sent_successfully\":\"Mail Sent Successfully\",\"manual_payment_methods\":\"Manual Payment Methods\",\"maximum_deadline_limit\":\"Maximum deadline limit\",\"most_popular_vacancies\":\"Most Popular Vacancies\",\"pinterest_verification\":\"Pinterest verification\",\"profile_in_description\":\"Complete your profile before applying to jobs, Add your information, resume, and profile picture for a better chance of getting hired.\",\"show_language_switcher\":\"Show Language Switcher on Frontend\",\"switch_to_company_name\":\"Switch to company name\",\"sync_language_contents\":\"Sync language contents\",\"upload_profile_picture\":\"Upload Profile Picture\",\"view_all_notifications\":\"View All Notifications\",\"add_screening_questions\":\"Add Screening Questions\",\"button_text_hover_color\":\"Button Text Hover Color\",\"candidate_language_list\":\"Candidate Language List\",\"candidate_title_keyword\":\"Candidate title, keyword\",\"choose_plan_description\":\"Explore the perfect pricing plan that suits your needs and take your journey to new heights\",\"create_custom_questions\":\"Create Custom Questions\",\"github_login_credential\":\"GitHub Login Credential\",\"google_login_credential\":\"Google Login Credential\",\"highlight_jobs_duration\":\"Highlight jobs duration\",\"it_will_be_gone_forever\":\"it will be gone forever.\",\"job_cloned_successfully\":\"Job Cloned Successfully\",\"job_role_has_candidates\":\"Job role has candidates\",\"left_sidebar_text_color\":\"Left Sidebar Text Color\",\"manual_payment_gateways\":\"Manual Payment Gateways\",\"money_pay_with_razorpay\":\"Money pay with Razorpay\",\"online_payment_gatewats\":\"Online Payment Gateways\",\"organization_types_list\":\"Organization Types List\",\"our_mission_description\":\"At Jobpilot, our mission is to empower individuals and organizations to achieve their full potential by connecting talent with opportunity. We believe that every person deserves meaningful work, and every employer deserves exceptional talent. \\n\\nWe are dedicated to delivering quality connections. We strive for excellence in matching talent to the right opportunities, resulting in long-lasting, fulfilling employment relationships.\",\"payment_gateway_setting\":\"Payment Gateway Setting\",\"payment_is_mark_as_paid\":\"Payment is mark as paid\",\"question_feature_enable\":\"Custom question successfully enabled\",\"recaptcha_configuration\":\"Recaptcha Configuration\",\"recently_published_jobs\":\"Recently Published Jobs\",\"set_recommended_package\":\"Set Recommended Package\",\"start_typing_for_search\":\"Start Typing For Search\",\"terms_and_condition_url\":\"Terms And Condition URL\",\"you_have_seen_the_cv_on\":\"You have seen the CV on\",\"Enter_reject_button_text\":\"Enter reject button to text\",\"experience_and_education\":\"Experience & Education\",\"faq_created_successfully\":\"Faq Created Successfully\",\"faq_deleted_successfully\":\"Faq Deleted Successfully\",\"faq_updated_successfully\":\"Faq Updated Successfully\",\"job_applied_successfully\":\"Job Applied Successfully\",\"job_created_successfully\":\"Job Created Successfully\",\"job_deleted_successfully\":\"Job Deleted Successfully\",\"job_promote_successfully\":\"Job Promote Successfully\",\"job_updated_successfully\":\"Job Updated Successfully\",\"question_created_success\":\"Question created successfully\",\"question_deleted_success\":\"Question deleted successfully\",\"question_updated_success\":\"Question updated successfully\",\"send_password_reset_link\":\"Send Password Reset Link\",\"show_contact_information\":\"Show Contact Information\",\"top_nav_background_color\":\"Top Nav Background Color\",\"translation_available_in\":\"Translation available in\",\"twitter_login_credential\":\"Twitter Login Credential\",\"your_contact_information\":\"Your Contact Information\",\"Enter_approve_button_text\":\"Enter approve button to text\",\"ability_to_profile_verify\":\"Ability to verify company profile\",\"benefit_already_exists_in\":\"Benefit already exists in\",\"browse_photo_or_drop_here\":\"Browse photo or drop here\",\"delete_selected_countries\":\"Delete Selected Countries\",\"facebook_login_credential\":\"Facebook Login Credential\",\"frontend_icon_color_hover\":\"Frontend Icon Color Hover\",\"linkedin_login_credential\":\"Linkedin Login Credential\",\"menu_created_successfully\":\"Menu created successfully\",\"menu_deleted_successfully\":\"Menu deleted successfully\",\"menu_updated_successfully\":\"Menu updated successfully\",\"open_jobs_waiting_for_you\":\"Open jobs waiting for you\",\"payperjob_setting_updated\":\"Payperjob setting updated\",\"plan_created_successfully\":\"Plan Created Successfully\",\"plan_deleted_successfully\":\"Plan Deleted Successfully\",\"plan_updated_successfully\":\"Plan Updated Successfully\",\"post_created_successfully\":\"Post Created Successfully\",\"post_deleted_successfully\":\"Post Deleted Successfully\",\"post_updated_successfully\":\"Post Updated Successfully\",\"profession_has_candidates\":\"Profession has candidates\",\"question_feature_disabled\":\"Custom question successfully disabled\",\"recently_purchased_orders\":\"Recently Purchased Orders\",\"resume_added_successfully\":\"Resume added successfully\",\"role_created_successfully\":\"Role Created Successfully\",\"role_deleted_successfully\":\"Role Deleted Successfully\",\"role_updated_successfully\":\"Role Updated Successfully\",\"tag_imported_successfully\":\"Tag imported successfully\",\"user_created_successfully\":\"User Created Successfully\",\"user_deleted_successfully\":\"User Deleted Successfully\",\"user_updated_successfully\":\"User Updated Successfully\",\"website_language_switcher\":\"Frontend Language Switcher\",\"candidate_cv_preview_limit\":\"Candidate Cv Preview Limit\",\"cookie_approve_button_text\":\"Allow all Cookies\",\"cookie_decline_button_text\":\"Reject all Cookies\",\"default_latitude_longitude\":\"Default Latitude & Longitude\",\"email_deleted_successfully\":\"Email Deleted Successfully\",\"frontend_currency_switcher\":\"Frontend Currency Switcher\",\"group_created_successfully\":\"Group Created Successfully\",\"group_deleted_successfully\":\"Group Deleted Successfully\",\"group_updated_successfully\":\"Group Updated Successfully\",\"i_have_read_and_agree_with\":\"I\'ve read and agree with\",\"job_added_to_favorite_list\":\"Job added to favorite list\",\"jobs_from_our_partner_site\":\"Jobs from our partner site\",\"language_sync_successfully\":\"Language Sync Successfully\",\"professional_title_tagline\":\"Professional Title\\/Tagline\",\"skill_created_successfully\":\"Skill created successfully\",\"skill_deleted_successfully\":\"Skill deleted successfully\",\"skill_updated_successfully\":\"Skill updated successfully\",\"social_media_links_updated\":\"Social Media Links updated\",\"Enter_cookie_expiration_day\":\"Enter cookie expiration day\",\"comment_edited_successfully\":\"Comment edited successfully\",\"complete_your_project_setup\":\"Complete your project setup\",\"developed_by_templatecookie\":\"Developed by Templatecookie\",\"email_verified_successfully\":\"Email Verified Successfully\",\"enter_cookie_expiration_day\":\"Enter cookie expiration day\",\"full_app_and_database_files\":\"Full App And Database Backup\",\"plan_purchased_successfully\":\"Plan purchased successfully\",\"plan_successfully_purchased\":\"Plan successfully purchased\",\"privary_policy_page_content\":\"Privacy Policy Page Content\",\"profile_update_successfully\":\"Profile update successfully\",\"skill_imported_successfully\":\"Skill imported successfully\",\"sorry_for_the_inconvenience\":\"Sorry For The Inconvenience\",\"benefit_created_successfully\":\"Benefit created successfully\",\"benefit_deleted_successfully\":\"Benefit deleted successfully\",\"benefit_updated_successfully\":\"Benefit updated successfully\",\"comment_deleted_successfully\":\"Comment deleted successfully\",\"company_created_successfully\":\"Company created successfully\",\"company_deleted_successfully\":\"Company deleted Successfully\",\"company_updated_successfully\":\"Company updated Successfully\",\"contact_deleted_successfully\":\"Contact Deleted Successfully\",\"country_created_successfully\":\"Country Created Successfully\",\"country_deleted_successfully\":\"Country Deleted Successfully\",\"country_updated_successfully\":\"Country Updated Successfully\",\"selected_screening_questions\":\"Selected Screening Questions\",\"setting_updated_successfully\":\"Setting updated successfully\",\"terms_conditons_page_content\":\"Terms Conditions Page Content\",\"the_view_count_will_be_reset\":\"the view count will be reset\",\"work_process_content_updated\":\"Work process content updated\",\"write_script_with_script_tag\":\"Write a script with script tag\",\"your_email_has_been_verified\":\"Your email has been verified\",\"category_created_successfully\":\"Category created successfully\",\"category_deleted_successfully\":\"Category deleted successfully\",\"category_updated_successfully\":\"Category updated successfully\",\"choose_from_existing_question\":\"Choose from existing question\",\"comming_soon_mode_description\":\"In ac turpis mi. Donec quis semper neque. Nulla cursus gravida interdum. Curabitur luctus sapien .\",\"create_new_screening_question\":\"Create new screening question\",\"currency_changed_successfully\":\"Currency Changed Successfully\",\"currency_created_successfully\":\"Currency Created Successfully\",\"currency_deleted_successfully\":\"Currency Deleted Successfully\",\"currency_updated_successfully\":\"Currency Updated Successfully\",\"email_unverified_successfully\":\"Email Unverified Successfully\",\"job_role_created_successfully\":\"Job Role created Successfully\",\"job_role_deleted_successfully\":\"Job Role deleted Successfully\",\"job_role_updated_successfully\":\"Job Role updated Successfully\",\"language_created_successfully\":\"Language created successfully\",\"language_deleted_successfully\":\"Language deleted successfully\",\"language_updated_successfully\":\"Language updated successfully\",\"left_sidebar_background_color\":\"Left Sidebar Background Color\",\"please_wait_while_translating\":\"Please wait while translating\",\"profile_verified_successfully\":\"Profile Verified Successfully\",\"set_country_language_currency\":\"Set Country, Language, Currency\",\"sign_in_to_start_your_session\":\"Sign In To Start Your Session\",\"timezone_updated_successfully\":\"Timezone Updated Successfully\",\"username_updated_successfully\":\"Username updated successfully\",\"your_job_creation_is_complete\":\"Your job creation is complete\",\"your_verify_link_is_not_valid\":\"Your verify link is not valid\",\"candidate_created_successfully\":\"Candidate Created Successfully\",\"candidate_deleted_successfully\":\"Candidate Deleted Successfully\",\"candidate_updated_successfully\":\"Candidate updated successfully\",\"candidate_will_apply_job_using\":\"Candidate will apply for a job using\",\"company_activated_successfully\":\"Company Activated Successfully\",\"job_removed_from_favorite_list\":\"Job removed from favorite list\",\"job_role_imported_successfully\":\"Job role imported successfully\",\"location_configuration_updated\":\"Location configuration updated\",\"notify_me_my_recent_activities\":\"Notify me of my recent activities\",\"you_have_no_featured_job_limit\":\"You have no featured job limit\",\"do_you_want_to_promote_your_job\":\"Do you want to promote your job ?\",\"job_status_updated_successfully\":\"Job status updated successfully\",\"organization_type_has_companies\":\"Organization type has companies\",\"please_fill_all_required_fields\":\"Please fill all required fields\",\"profession_created_successfully\":\"Profession created successfully\",\"profession_deleted_successfully\":\"Profession deleted successfully\",\"profession_updated_successfully\":\"Profession updated successfully\",\"profile_unverified_successfully\":\"Profile Unverified Successfully\",\"recaptcha_configuration_updated\":\"Recaptcha Configuration updated\",\"tag_status_updated_successfully\":\"Tag status updated successfully\",\"test_your_smtp_credentials_here\":\"Test your SMTP credentials here\",\"username_has_already_been_taken\":\"Username has already been taken\",\"we_care_about_customer_services\":\"We care about customer service\",\"write_style_with_style_tag_like\":\"Write style with style tag like\",\"you_have_no_highlight_job_limit\":\"You have no highlight job limit\",\"your_contact_mail_has_been_sent\":\"Your contact mail has been sent\",\"application_upgrade_successfully\":\"Application Upgrade Successfully\",\"candidate_activated_successfully\":\"Candidate Activated Successfully\",\"candidate_added_to_bookmark_list\":\"Candidate added to bookmark list\",\"choose_a_pricing_plan_from_below\":\"Select Your Ideal Pricing Plan\",\"company_deactivated_successfully\":\"Company Deactivated Successfully\",\"employer_account_auto_activation\":\"Company Account Auto Activation\",\"faq_category_sorted_successfully\":\"Faq Category Sorted Successfully\",\"if_you_have_any_token_validation\":\"if you have any token validation\",\"indeed_api_configuration_updated\":\"Indeed API Configuration updated\",\"job_changes_applied_successfully\":\"Job changes applied successfully\",\"job_deadline_max_expiration_days\":\"Job deadline max expiration days\",\"language_changing_status_changed\":\"Language changing status changed\",\"no_payment_method_available_here\":\"No payment method available here!\",\"notify_me_when_new_job_published\":\"Notify me when a new job is published\",\"profession_imported_successfully\":\"Profession imported successfully\",\"share_your_thoughts_on_this_post\":\"Share Your Thoughts On This Post\",\"testimonial_created_successfully\":\"Testimonial Created Successfully\",\"testimonial_deleted_successfully\":\"Testimonial Deleted Successfully\",\"testimonial_updated_successfully\":\"Testimonial Updated Successfully\",\"candidate_account_auto_activation\":\"Candidate Account Auto Activation\",\"candidate_profile_view_limitation\":\"Candidate Profile View Limitation\",\"default_language_set_successfully\":\"Default Language Set Successfully\",\"expired_status_depend_on_deadline\":\"Expired status depend on deadline\",\"faq_category_successfully_created\":\"Faq Category Successfully Created\",\"faq_category_successfully_deleted\":\"Faq Category Successfully Deleted\",\"faq_category_successfully_updated\":\"Faq Category Successfully Updated\",\"google_job_indexing_configuration\":\"Google Job Indexing Configuration\",\"our_website_is_under_construction\":\"Our website is under construction\",\"saerch_or_write_tag_and_hit_enter\":\"Search or write tag and hit enter\",\"translations_updated_successfully\":\"Translations updated successfully\",\"write_script_with_script_tag_like\":\"Write a script with script tag like\",\"blog_category_updated_successfully\":\"Blog Category updated Successfully\",\"candidate_deactivated_successfully\":\"Candidate Deactivated Successfully\",\"coming_soon_mode_is_on_change_from\":\"Coming soon mode is on. Change from\",\"industry_type_created_successfully\":\"Industry Type created successfully\",\"industry_type_deleted_successfully\":\"Industry Type deleted successfully\",\"industry_type_updated_successfully\":\"Industry Type updated successfully\",\"job_category_imported_successfully\":\"Job category imported successfully\",\"job_has_been_created_and_published\":\"Job has been created and published\",\"maintenance_mode_is_on_change_from\":\"Maintenance mode is on. Change from\",\"remaining_features_on_current_plan\":\"Stats from your current plan\",\"You_can_not_delete_default_language\":\"You can not delete default language\",\"application_removed_from_our_system\":\"Application removed from our system\",\"careerjet_api_configuration_updated\":\"Careerjet API Configuration updated\",\"header_custom_style_before_head_end\":\"Header custom style (before the head end)\",\"heads_up_customize_the_way_you_like\":\"Heads Up! Customize the way you like\",\"industry_type_imported_successfully\":\"Indrusty type imported successfully\",\"manual_payment_created_successfully\":\"Manual Payment Created Successfully\",\"manual_payment_deleted_successfully\":\"Manual Payment Deleted Successfully\",\"manual_payment_updated_successfully\":\"Manual Payment Updated Successfully\",\"mollie_setting_updated_successfully\":\"Mollie Setting Updated Successfully\",\"payment_status_updated_successfully\":\"Payment Status Updated Successfully\",\"paypal_setting_updated_successfully\":\"Paypal Setting Updated Successfully\",\"share_your_thoughts_on_this_comment\":\"Share Your Thoughts On This Comment\",\"social_setting_updated_successfully\":\"Social Setting Updated Successfully\",\"stripe_setting_updated_successfully\":\"Stripe Setting Updated Successfully\",\"there_is_no_plan_found_in_this_page\":\"There is no plan found on this page\",\"website_setting_update_successfully\":\"Website setting update successfully\",\"your_earnings_overview_of_this_year\":\"Your Earnings Overview Of This Year\",\"buy_premium_subscription_to_post_job\":\"Unlock the Power of Premium Job Postings\",\"candidate_removed_from_bookmark_list\":\"Candidate removed from bookmark list\",\"flutter_setting_updated_successfully\":\"Flutterwave Setting Updated Successfully\",\"footer_custom_script_before_body_end\":\"Footer custom script (before body end)\",\"header_custom_script_before_head_end\":\"Header custom script (before the head end)\",\"your_subscription_added_successfully\":\"Your subscription added successfully\",\"are_you_sure_want_to_delete_this_item\":\"Are you sure, you want to delete this item?\",\"comeingsoon_page_upadate_successfully\":\"ComeingSoon Page upadate successfully\",\"cookies_settings_successfully_updated\":\"Cookies settings successfully updated\",\"create_a_job_without_comapany_account\":\"Create a job without Company account\",\"midtrans_setting_updated_successfully\":\"Midtrans Setting Updated Successfully\",\"paystack_setting_updated_successfully\":\"Paystack Setting Updated Successfully\",\"razorpay_setting_updated_successfully\":\"RazorPay Setting Updated Successfully\",\"are_you_sure_want_to_delete_this_item?\":\"Are you sure want to delete this item?\",\"instamojo_setting_updated_successfully\":\"Instamojo Setting Updated Successfully\",\"organization_type_created_successfully\":\"Organization Type created successfully\",\"organization_type_deleted_successfully\":\"Organization Type deleted successfully\",\"organization_type_updated_successfully\":\"Organization Type updated successfully\",\"page_meta_content_updated_successfully\":\"Page Meta Content Updated successfully\",\"payment_is_placed_waiting_for_approval\":\"Payment is placed waiting for approval\",\"congratulations_you_profile_is_complete\":\"Congratulations, Your profile is 100% complete!\",\"notify_me_when_employers_shortlisted_me\":\"Notify me when employers shortlisted me\",\"organization_type_imported_successfully\":\"Organization type imported successfully\",\"promote_your_job_to_get_more_candidates\":\"Promote your job to get more candidates\",\"please_configure_your_mail_setting_first\":\"Please configure your mail setting first\",\"ssl_commerz_setting_updated_successfully\":\"SSl Commerz Setting Updated Successfully\",\"are_you_sure_you_want_to_delete_this_item\":\"Are you sure you want to delete this item ?\",\"default_plan_package_updated_successfully\":\"Default Plan Package Updated Successfully\",\"enable_social_media_login_to_your_website\":\"Enable Social Media Login to your website\",\"no_price_plan_found_contact_website_owner\":\"No price plan found, contact website owner\",\"notify_me_when_my_applied_jobs_are_expire\":\"Notify me when my applied jobs expire\",\"unlock_your_potential_embrace_your_future\":\"Unlock Your Potential, Embrace Your Future.\",\"all_application_will_show_on_your_dashboard\":\"All applications will show on your dashboard\",\"note_you_will_be_notified_for_this_role_only\":\"Note: You will be notified for the selected roles only\",\"page_translation_content_delete_successfully\":\"Page translation content delete successfully\",\"verify_your_email_before_accessing_dashboard\":\"Verify your email before accessing the dashboard\",\"we_are_highly_skilled_and_professionals_team\":\"We\\u2019re a highly skilled and professionals team.\",\"supported_format_jpeg_png_max_photo_size_5_mb\":\"Supported format JPEG, PNG. Max photo size 5 MB\",\"you_are_not_authorized_to_perform_this_action\":\"You are not authorized to perform this action\",\"you_can_do_it_if_you_want_to_do_job_promotion\":\"You can do it if you want to do a job promotion !\",\"no_description_has_been_added_to_this_language\":\"No description has been added to <b>:current<\\/b> language\",\"payment_and_job_is_placed_waiting_for_approval\":\"Payment and Job is placed waiting for approval\",\"please_confirm_your_password_before_continuing\":\"Please confirm your password before continuing\",\"you_can_send_a_mail_to_multiple_email_addresses\":\"You can send a mail to multiple email addresses\",\"you_dont_have_permission_to_perform_this_action\":\"You don\'t have permission to perform this action\",\"your_email_configuration_is_successfully_working\":\"Your email configuration is successfully working.\",\"for_external_links_begin_with_httpswwwyour_linkcom\":\"For external links, begin with \'https:\\/\\/www.your-link.com\'\",\"here_is_your_daily_activities_career_opportunities\":\"Here are your daily activities & career opportunities\",\"job_deadline_expiration_limit_updated_successfully\":\"Job deadline expiration limit updated successfully\",\"setup_smtp_to_send_all_applications_emails_such_as\":\"Setup SMTP to send all applications emails, such as\",\"job_has_been_created_and_waiting_for_admin_approval\":\"Job has been created and waiting for admin approval\",\"you_have_purchased_this_free_plan_cant_buy_it_again\":\"You have purchased this free plan. Can\'t purchase it again\",\"job_post_will_not_be_expired_anytime_soon_if_you_put\":\"Job post will not be expired anytime soon, if you put\",\"photo_larger_than_pixels_work_best_max_photo_size_mb\":\"A photo larger than 1520x312 pixels work best. Max photo size 5 MB.\",\"set_automatically_ip_based_country_language_currency\":\"Set automatically ip based country language currency\",\"for_internal_links_use_your_link_as_the_starting_point\":\"For internal links, use \'\\/your-link\' as the starting point\",\"something_went_wrong_it_look_like_you_dont_have_access\":\"Something went wrong. It looks like you don\'t have access.\",\"this_job_is_now_pending_please_wait_for_admin_approval\":\"This job is now pending. Please wait for admin approval\",\"highlight_jobs_or_show_them_on_the_home_page_as_a_feature\":\"Highlight jobs or show them on the home page as a feature.\",\"want_to_receive_payments_setup_at_least_1_payment_gateway\":\"Want to receive payments? Setup at least 1 Payment Gateway\",\"you_have_reached_your_plan_limit_please_upgrade_your_plan\":\"You have reached your plan limit. Please upgrade your plan.\",\"you_can_manage_your_form_my_jobs_section_in_your_dashboard\":\"You can manage your form my-jobs section in your dashboard\",\"sorry_your_session_has_expired_please_refresh_and_try_again\":\"Sorry, your session has expired. Please refresh and try again.\",\"we_sent_a_verify_mail_to_your_email_please_check_your_email\":\"We sent a verify mail to your email. Please check your email\",\"your_javascript_arrays_or_objects_which_requires_in_backend\":\"your javascript arrays or objects which requires in backend\",\"discover_your_perfect_job_matching_your_interests_and_skills\":\"Discover Your Perfect Job: Matching Your Interests and Skills\",\"you_dont_have_a_chosen_plan_please_choose_a_plan_to_continue\":\"You don\'t have a chosen plan. Please choose a plan to continue\",\"a_fresh_verification_link_has_been_sent_to_your_email_address\":\"A fresh verification link has been sent to your email address.\",\"mail_not_sent_for_the_reason_of_incomplete_mail_configuration\":\"Mail not sent for the reason of incomplete mail configuration\",\"want_to_reduce_points_for_repeated_viewings_of_a_candidate_cv\":\"Want to reduce points for repeated viewings of a candidate CV ?\",\"your_job_successfully_updated_please_wait_for_approve_changes\":\"Your job successfully updated. Please wait for approve changes\",\"if_you_already_have_the_transaction_generated_for_current_order\":\"If you already have the transaction generated for the current order\",\"it_should_be_at_least_pixels_but_or_larger_is_preferred_up_to_mb\":\"It should be at least 600\\u00d7315 pixels, but 1200\\u00d7630 or larger is preferred (up to 5MB).\",\"your_application_might_show_an_error_if_you_dont_have_setup_smtp\":\"Your Application might show an error if you don\'t have setup SMTP\",\"improve_your_site_ranking_by_adding_seo_information_to_your_pages\":\"Improve your site ranking by adding SEO information to your pages.\",\"standard_seo_meta_descriptions_consist_160_165_characters_maximum\":\"Standard SEO meta descriptions consist of 160-165 characters maximum\",\"something_went_wrong_it_look_like_the_internal_server_has_some_errors\":\"Something went wrong. It looks like the Internal Server has some errors.\",\"candidate_apply_job_on_your_website_all_application_on_your_own_website\":\"Candidate apply for a job on your website, all applications on your own website\",\"leave_the_social_media_input_field_empty_to_remove_the_link_from_website\":\"Leave the social media input field empty to remove the link from the website.\",\"these_tags_will_show_the_user_as_a_popular_tag_suggestion_on_the_job_page\":\"These tags will show the user as a popular tag suggestion on the job page!\",\"we_are_working_hard_to_make_our_website_ready_for_you_we_will_be_back_soon\":\"We are working hard to make our website ready for you. We will be back soon.\",\"candidate_apply_job_on_your_email_address_and_all_application_in_your_email\":\"candidate apply for a job on your email address and all application in your email .\",\"language_created_successfully_please_translate_the_language_as_per_your_need\":\"Language Created Successfully. Please translate the language as per your need\",\"something_went_wrong_its_look_like_the_link_is_broken_or_the_page_is_removed\":\"Something went wrong. It looks like the link is broken or the page is removed.\",\"effortlessly_apply_to_jobs_that_match_your_preferences_with_just_a_few_clicks\":\"Effortlessly apply to jobs that match your preferences with just a few clicks\",\"you_have_reached_your_limit_for_viewing_candidate_cv_please_upgrade_your_plan\":\"You have reached your limit for viewing candidate cv. Please upgrade your plan.\",\"pay_only_for_a_single_job_creation_and_you_can_also_highlight_or_featured_them\":\"Pay only for individual job creations. Highlight or feature your postings to attract top talent\",\"your_account_is_not_active_please_wait_until_the_account_is_activated_by_admin\":\"Your account is not active. Please wait until the account is activated by admin\",\"your_purchased_plan_order_has_pending._please_wait_until_the_order_is_approved\":\"Your purchased plan order has pending. Please wait until the order is approved\",\"build_a_standout_profile_highlighting_your_skills_experience_and_qualifications\":\"Build a standout profile highlighting your skills, experience, and qualifications\",\"stay_informed_on_your_applications_and_manage_your_job_seeking_journey_effectively\":\"Stay informed on your applications and manage your job-seeking journey effectively\",\"your_corrections_are_pending_please_wait_for_admin_approved_to_modify_your_changes\":\"Your corrections are pending. Please wait for admin approved to modify your changes.\",\"we_couldnot_find_any_accounts_please_continue_to_register_as_a_candidate_or_employer\":\"We couldn\'t find any accounts. Please continue to register as a candidate or employer\",\"browse_through_a_diverse_range_of_job_listings_tailored_to_your_interests_and_expertise\":\"Browse through a diverse range of job listings tailored to your interests and expertise\",\"add_your_brand_theme_color_it_will_be_reflected_on_your_website_and_admin_panel_add_your\":\"Add your brand theme color, it will be reflected on your website and admin panel. Add your\",\"if_you_perform_this_action_you_need_to_login_your_account_first_do_you_want_to_login_now\":\"Performing this action requires logging into your account. Would you like to log in now\",\"something_went_wrong_it_look_like_the_server_is_unavailable_and_the_visitor_bot_or_human\":\"Something went wrong. It looks like  the server is unavailable and the visitor, bot or human.\",\"praesent_non_sem_facilisis_hendrerit_nisi_vitae_volutpat_quam_Aliquam_metus_mauris_semper\":\"At Jobpilot, we\'re more than just a job portal; we\'re your partner in career success. Our dedicated team is committed to revolutionizing the job search experience. \\n\\nWe believe in connecting talent with opportunity, ensuring that every individual finds meaningful work, and every employer discovers exceptional talent. With a passion for excellence, we strive to make the job market accessible, transparent, and rewarding for all. Join us on this journey as we shape the future of employment.\",\"we_have_created_a_streamlined_user_interface_so_you_can_easily_manage_your_jobs_and_candidates\":\"We have created a streamlined user-interface so you can easily manage your jobs and candidates.\",\"praesent_non_sem_facilisis_hendrerit_nisi_vitae_volutpat_quam_Aliquam_metus_mauris_semper_metus\":\"At Jobpilot, we\'re more than just a job portal; we\'re your partner in career success. Our dedicated team is committed to revolutionizing the job search experience. \\n\\nWe believe in connecting talent with opportunity, ensuring that every individual finds meaningful work, and every employer discovers exceptional talent. With a passion for excellence, we strive to make the job market accessible, transparent, and rewarding for all. Join us on this journey as we shape the future of employment.\",\"now_you_can_start_using_your_account_you_can_post_job_purchase_plan_for_upcoming_job_and_many_more_enjoy\":\"Now you can start using your account. You can post a job, purchase a plan for an upcoming job, and many more. Enjoy\",\"use_this_feature_to_integrate_any_third_party_integration_tool_using_their_verification_method_for_example\":\"Use this feature to integrate any third-party integration tool using their verification method. For Example,\",\"we_have_sent_an_verification_to_your_email_address_click_the_to_verify_your_email_address_and_activate_your_account\":\"We have sent a verification to your email address. Click the to verify your email address and activate your account\",\"want_to_chat_We_love_to_hear_from_you_get_in_touch_with_our_customer_success_team_to_inquire_rates_or_just_say_hello\":\"Want to chat? We\\u2019d love to hear from you! Get in touch with our Customer Success Team to inquire about speaking events, advertising rates, or just say hello.\",\"irrespective_of_your_organizations_size_we_have_a_large_pool_of_candidates_with_diverse_skill_sets_and_experience_levels\":\"Irrespective of your organization\\u2019s size, we have a large pool of candidates with diverse skill sets and experience levels.\",\"elevate_your_job_postings_with_a_premium_subscription_get_expanded_reach_targeted_promotion_and_advanced_applicant_filtering\":\"Elevate your job postings with a premium subscription. Get expanded reach, targeted promotion, and advanced applicant filtering.\",\"You_are_searching_for_jobs_from_current_but_your_selected_location_is_selected_and_we_have_found_results_matching_your_criteria\":\"You are searching for jobs from <b>:current<\\/b> but your selected location is <b>:selected<\\/b> and we have found <b>:total<\\/b> results matching your criteria\",\"complete_your_profile_before_applying_to_jobs_add_your_information_resume_and_profile_picture_for_a_better_chance_of_getting_hired\":\"Complete your profile before applying to jobs, Add your information, resume, and profile picture for a better chance of getting hired.\",\"whether_you_choose_to_post_your_jobs_directly_or_have_them_indexed_automatically_our_pricing_model_is_highly_competitive_and_cost_effective\":\"Whether you choose to post your jobs directly or have them indexed automatically, our pricing model is highly competitive and cost-effective.\",\"seo_is_crucial_because_it_makes_your_website_more_visible_and_that_means_more_traffic_and_more_opportunities_to_convert_prospects_into_customers_check_out_the_seo_tools_you_can_use_for_optimal_ranking\":\"SEO is crucial because it makes your website more visible, and that means more traffic and more opportunities to convert prospects into customers. Check out the SEO tools you can use for optimal ranking.\",\"65_of_users_prefer_social_logins_but_60_believe_that_companies_offering_social_logging_are_more_up_to_date_and_innovative_not_only_do_they_benefit_the_user_they_benefit_your_brand_logic_and_these_statistics_dictate_that_social_login_is_a_no_brainer\":\"65% of users prefer social logins, but 60% believe that companies offering social logging are more up to date and innovative; not only do they benefit the user, but they also benefit your brand. Logic, and these statistics, dictate that social login is a no-brainer.\",\"change_account_user_name_and_email\":\"Change Account Username & Email\",\"load_more\":\"Load More\",\"negotiable\":\"Negotiable\"}', '2023-09-13 02:49:39', '2023-11-19 11:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `manual_payments`
--

CREATE TABLE `manual_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('bank_payment','cash_payment','check_payment','custom_payment') NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu_settings`
--

CREATE TABLE `menu_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `for` text DEFAULT NULL,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_settings`
--

INSERT INTO `menu_settings` (`id`, `url`, `status`, `default`, `for`, `order`, `created_at`, `updated_at`) VALUES
(1, '/', 1, 1, '[\"public\",\"employee\",\"candidate\"]', 0, '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(2, '/jobs', 1, 1, '[\"public\",\"candidate\"]', 1, '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(3, '/candidates', 1, 1, '[\"public\",\"employee\"]', 2, '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(4, '/employers', 1, 1, '[\"public\",\"candidate\"]', 3, '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(5, '/posts', 1, 1, '[\"public\"]', 4, '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(6, '/plans', 1, 1, '[\"public\",\"employee\"]', 5, '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(7, '/company/dashboard', 1, 1, '[\"employee\"]', 6, '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(8, '/company/my-jobs', 1, 1, '[\"employee\"]', 7, '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(9, '/candidate/dashboard', 1, 1, '[\"candidate\"]', 8, '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(10, '/candidate/job/alerts', 1, 1, '[\"candidate\"]', 9, '2023-09-13 02:49:25', '2023-09-13 02:49:25');

-- --------------------------------------------------------

--
-- Table structure for table `menu_settings_translations`
--

CREATE TABLE `menu_settings_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_settings_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_settings_translations`
--

INSERT INTO `menu_settings_translations` (`id`, `menu_settings_id`, `title`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'Home', 'en', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(2, 1, 'হোম', 'bn', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(3, 1, 'घर', 'hi', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(4, 1, 'Maison', 'fr', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(5, 1, 'Hogar', 'es', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(6, 1, 'Rumah', 'id', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(7, 1, 'Heim', 'de', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(8, 1, 'بيت', 'ar', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(9, 2, 'Find Job', 'en', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(10, 2, 'চাকরী খোজা', 'bn', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(11, 2, 'नौकरी ढूंढो', 'hi', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(12, 2, 'Trouver Un Emploi', 'fr', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(13, 2, 'Encuentra Trabajo', 'es', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(14, 2, 'Mencari Pekerjaan', 'id', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(15, 2, 'Job Finden', 'de', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(16, 2, 'ابحث عن وظيفة', 'ar', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(17, 3, 'Candidates', 'en', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(18, 3, 'প্রার্থী', 'bn', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(19, 3, 'उम्मीदवार', 'hi', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(20, 3, 'Candidates', 'fr', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(21, 3, 'Candidates', 'es', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(22, 3, 'Kandidat', 'id', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(23, 3, 'Kandidatinnen', 'de', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(24, 3, 'مرشحين', 'ar', '2023-09-13 02:49:23', '2023-09-13 02:49:23'),
(25, 4, 'Companies', 'en', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(26, 4, 'কোম্পানিগুলো', 'bn', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(27, 4, 'कंपनियों', 'hi', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(28, 4, 'Entreprises', 'fr', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(29, 4, 'Compañías', 'es', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(30, 4, 'Perusahaan', 'id', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(31, 4, 'Firmen', 'de', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(32, 4, 'شركات', 'ar', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(33, 5, 'Blog', 'en', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(34, 5, 'ব্লগ', 'bn', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(35, 5, 'ब्लॉग', 'hi', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(36, 5, 'Blog', 'fr', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(37, 5, 'Blog', 'es', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(38, 5, 'Blog', 'id', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(39, 5, 'Blog', 'de', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(40, 5, 'مدونة', 'ar', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(41, 6, 'Pricing', 'en', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(42, 6, 'মূল্য নির্ধারণ', 'bn', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(43, 6, 'मूल्य निर्धारण', 'hi', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(44, 6, 'Tarifs', 'fr', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(45, 6, 'Precios', 'es', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(46, 6, 'Harga', 'id', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(47, 6, 'Preisgestaltung', 'de', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(48, 6, 'التسعير', 'ar', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(49, 7, 'Dashboard', 'en', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(50, 7, 'ড্যাশবোর্ড', 'bn', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(51, 7, 'डैशबोर्ड', 'hi', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(52, 7, 'Tableau De Bord', 'fr', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(53, 7, 'Panel', 'es', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(54, 7, 'Dasbor', 'id', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(55, 7, 'Armaturenbrett', 'de', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(56, 7, 'لوحة القيادة', 'ar', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(57, 8, 'My Job', 'en', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(58, 8, 'আমার কাজ', 'bn', '2023-09-13 02:49:24', '2023-09-13 02:49:24'),
(59, 8, 'मेरी नौकरी', 'hi', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(60, 8, 'Mon Boulot', 'fr', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(61, 8, 'Mi Trabajo', 'es', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(62, 8, 'Pekerjaan saya', 'id', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(63, 8, 'Mein Job', 'de', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(64, 8, 'عملي', 'ar', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(65, 9, 'Dashboard', 'en', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(66, 9, 'ড্যাশবোর্ড', 'bn', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(67, 9, 'डैशबोर्ड', 'hi', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(68, 9, 'Tableau De Bord', 'fr', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(69, 9, 'Panel', 'es', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(70, 9, 'Dasbor', 'id', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(71, 9, 'Armaturenbrett', 'de', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(72, 9, 'لوحة القيادة', 'ar', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(73, 10, 'Job Alert', 'en', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(74, 10, 'চাকরির সতর্কীকরণ', 'bn', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(75, 10, 'जॉब अलर्ट', 'hi', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(76, 10, 'Alerte D\'emploi', 'fr', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(77, 10, 'Alerta De Trabajo', 'es', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(78, 10, 'Pemberitahuan Pekerjaan', 'id', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(79, 10, 'Jobalarm', 'de', '2023-09-13 02:49:25', '2023-09-13 02:49:25'),
(80, 10, 'حالة تأهب وظيفة', 'ar', '2023-09-13 02:49:25', '2023-09-13 02:49:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(3, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(4, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(5, '2016_06_01_000004_create_oauth_clients_table', 1),
(6, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(7, '2019_08_19_000000_create_failed_jobs_table', 1),
(8, '2020_11_12_184107_create_permission_tables', 1),
(9, '2020_12_23_122556_create_contacts_table', 1),
(10, '2021_02_18_112239_create_admins_table', 1),
(11, '2021_07_14_154223_create_users_table', 1),
(12, '2021_08_23_115402_create_settings_table', 1),
(13, '2021_08_25_061331_create_languages_table', 1),
(14, '2021_12_14_142236_create_emails_table', 1),
(15, '2021_12_17_110211_create_testimonials_table', 1),
(16, '2021_12_19_152529_create_faq_categories_table', 1),
(17, '2021_12_21_105713_create_faqs_table', 1),
(18, '2022_01_25_131111_add_fields_to_settings_table', 1),
(19, '2022_01_26_091457_add_social_login_fields_to_users_table', 1),
(20, '2022_01_27_044638_create_experiences_table', 1),
(21, '2022_01_27_044649_create_education_table', 1),
(22, '2022_01_27_055733_create_job_types_table', 1),
(23, '2022_01_27_060057_create_salary_types_table', 1),
(24, '2022_01_27_081546_create_organization_types_table', 1),
(25, '2022_01_27_095019_create_team_sizes_table', 1),
(26, '2022_01_27_101204_create_nationalities_table', 1),
(27, '2022_01_27_121442_create_countries_table', 1),
(28, '2022_01_27_121452_create_states_table', 1),
(29, '2022_01_27_121453_create_cities_table', 1),
(30, '2022_01_28_030131_create_industry_types_table', 1),
(31, '2022_01_28_030802_create_professions_table', 1),
(32, '2022_01_28_033627_create_job_roles_table', 1),
(33, '2022_01_29_110746_create_companies_table', 1),
(34, '2022_01_29_120010_create_job_categories_table', 1),
(35, '2022_01_29_120020_create_candidates_table', 1),
(36, '2022_01_29_133751_create_jobs_table', 1),
(37, '2022_01_30_051177_create_post_categories_table', 1),
(38, '2022_01_30_051199_create_posts_table', 1),
(39, '2022_02_09_154506_create_company_bookmark_categories_table', 1),
(40, '2022_02_10_154506_create_bookmark_company_table', 1),
(41, '2022_02_10_160813_create_bookmark_candidate_job_table', 1),
(42, '2022_02_10_160821_create_bookmark_candidate_company_table', 1),
(43, '2022_02_10_161917_create_social_links_table', 1),
(44, '2022_02_10_162218_create_contact_infos_table', 1),
(45, '2022_02_19_141812_create_plans_table', 1),
(46, '2022_02_22_114329_create_post_comments_table', 1),
(47, '2022_02_22_183128_create_application_groups_table', 1),
(48, '2022_02_22_183129_create_applied_jobs_table', 1),
(49, '2022_03_01_213343_create_website_settings_table', 1),
(50, '2022_03_05_125615_create_currencies_table', 1),
(51, '2022_03_05_145248_create_abouts_table', 1),
(52, '2022_03_05_181737_create_our_missions_table', 1),
(53, '2022_03_08_110106_create_notifications_table', 1),
(54, '2022_03_10_110704_create_cms_table', 1),
(55, '2022_03_13_143318_create_payment_settings_table', 1),
(56, '2022_03_13_162626_create_user_plans_table', 1),
(57, '2022_03_13_193937_create_orders_table', 1),
(58, '2022_03_13_204812_create_earnings_table', 1),
(59, '2022_03_15_100012_create_terms_categories_table', 1),
(60, '2022_03_24_045305_create_seos_table', 1),
(61, '2022_03_26_130136_create_queue_jobs_table', 1),
(62, '2022_03_28_093629_add_socialite_column_to_users_table', 1),
(63, '2022_03_28_123603_create_theme_settings_table', 1),
(64, '2022_03_29_100616_create_timezones_table', 1),
(65, '2022_03_29_121851_create_admin_searches_table', 1),
(66, '2022_03_30_082959_create_cookies_table', 1),
(67, '2022_04_25_132657_create_setup_guides_table', 1),
(68, '2022_04_27_090501_create_bookmark_company_category_table', 1),
(69, '2022_04_30_041155_create_company_applied_job_rejected_table', 1),
(70, '2022_04_30_043011_create_company_applied_job_shortlist_table', 1),
(71, '2022_06_18_031525_add_full_address_to_candidates_table', 1),
(72, '2022_06_18_031525_add_full_address_to_companies_table', 1),
(73, '2022_06_18_031525_add_full_address_to_jobs_table', 1),
(74, '2022_06_27_050337_add_map_to_settings_table', 1),
(75, '2022_07_19_062856_create_manual_payments_table', 1),
(76, '2022_07_20_033046_add_manual_payment_id_to_earnings_table', 1),
(77, '2022_07_23_044852_add_transaction_id_to_earnings_table', 1),
(78, '2022_08_02_103529_create_candidate_resumes_table', 1),
(79, '2022_08_03_061932_add_fields_to_applied_jobs_table', 1),
(80, '2022_08_29_035902_add_employer_activation_field_to_settings_table', 1),
(81, '2022_08_29_063449_remove_some_columns_from_cms_table', 1),
(82, '2022_08_29_090125_create_cms_contents_table', 1),
(83, '2022_08_30_115827_remove_add_settings_table', 1),
(84, '2022_09_06_052408_create_skills_table', 1),
(85, '2022_09_06_052409_create_candidate_languages_table', 1),
(86, '2022_09_06_053034_create_candidate_skill_table', 1),
(87, '2022_09_06_053045_create_candidate_language_table', 1),
(88, '2022_10_16_063305_add_language_field_to_faqs_tables', 1),
(89, '2022_10_16_063328_add_language_field_to_testimonials_tables', 1),
(90, '2022_10_16_071227_add_available_status_fields_to_candidates_table', 1),
(91, '2022_10_16_100636_add_payperjob_field_to_settings_table', 1),
(92, '2022_10_17_024137_add_plan_id_field_to_earnings_table', 1),
(93, '2022_11_07_091932_add_candidate_account_auto_activation_to_settings_table', 1),
(94, '2022_11_09_040558_create_seo_page_contents_table', 1),
(95, '2022_11_11_085423_add_leaflet_map_field_to_settings_table', 1),
(96, '2022_11_12_060938_create_candidate_experiences_table', 1),
(97, '2022_11_12_091250_create_candidate_education_table', 1),
(98, '2022_11_15_095541_add_profile_limitaion_field_to_plans_table', 1),
(99, '2022_11_15_102325_add_profile_limitaion_field_to_user_plans_table', 1),
(100, '2022_11_17_083919_add_job_auto_approve_columns_to_settings', 1),
(101, '2022_11_17_090506_add_job_edited_columns_to_jobs', 1),
(102, '2022_11_18_032938_create_benefits_table', 1),
(103, '2022_11_18_032939_create_tags_table', 1),
(104, '2022_11_18_032940_create_job_benefit_table', 1),
(105, '2022_11_18_032941_create_job_tag_table', 1),
(106, '2022_11_23_104905_add_delete_columns_to_seos_table', 1),
(107, '2022_12_20_094532_change_salary_column_to_jobs_table', 1),
(108, '2022_12_20_102724_add_currency_switcher_field_to_settings_table', 1),
(109, '2022_12_23_104503_create_candidate_language_permission_table', 1),
(110, '2022_12_25_062232_add_highlight_features_job_duration_to_settings_table', 1),
(111, '2022_12_25_062645_add_highlight_featured_job_duration_field_to_jobs_table', 1),
(112, '2022_12_25_110928_create_benefit_permission_seeder_table', 1),
(113, '2022_12_26_082221_create_candidate_cv_views_table', 1),
(114, '2023_02_03_103051_add_currently_working_field_to_candidate_experiences_table', 1),
(115, '2023_02_06_112504_create_industry_type_translations_table', 1),
(116, '2023_02_07_034518_create_benefit_translations_table', 1),
(117, '2023_02_07_034909_create_profession_translations_table', 1),
(118, '2023_02_07_035108_create_skill_translations_table', 1),
(119, '2023_02_07_040101_create_job_role_translations_table', 1),
(120, '2023_02_07_095642_create_job_category_translations_table', 1),
(121, '2023_02_10_043825_add_fields_to_jobs_table', 1),
(122, '2023_02_10_053823_add_refund_page_column_to_cms_table', 1),
(123, '2023_02_13_093723_create_email_templates_table', 1),
(124, '2023_02_15_052022_remove_nationality_field_from_companies_table', 1),
(125, '2023_02_15_052100_remove_nationality_field_from_candidates_table', 1),
(126, '2023_02_16_085939_add_deadline_expiration_limit_to_settings_table', 1),
(127, '2023_02_17_022353_create_tags_crud_permission_table', 1),
(128, '2023_02_20_045609_create_tag_translations_table', 1),
(129, '2023_02_20_082840_add_show_popular_list_column_into_tags_table', 1),
(130, '2023_03_27_040314_create_verification_codes_table', 1),
(131, '2023_05_08_103421_add_field_to_candidates_table', 1),
(132, '2023_05_08_103951_add_fields_to_candidates_table', 1),
(133, '2023_05_10_045052_create_candidate_job_alerts_table', 1),
(134, '2023_05_12_012531_add_locale_field_to_posts_table', 1),
(135, '2023_05_12_083513_add_company_id_field_to_benefits_table', 1),
(136, '2023_05_24_012856_create_organization_type_translations_table', 1),
(137, '2023_05_24_064631_add_exact_location_field_to_jobs_table', 1),
(138, '2023_05_24_111237_add_exact_location_field_to_companies_table', 1),
(139, '2023_05_24_111306_add_exact_location_field_to_candidates_table', 1),
(140, '2023_07_12_054618_create_menu_settings_table', 1),
(141, '2023_07_12_061924_store_menu_settings_permission_table', 1),
(142, '2023_07_17_061226_create_menu_settings_translations_table', 1),
(143, '2023_07_17_123311_update__add_map_to_settings_table', 1),
(144, '2023_07_18_071238_remove_fields_from_cookies_table', 1),
(145, '2023_07_19_035849_remove_map_box_from_enum_list_for_settings_table', 1),
(146, '2023_07_19_063150_store_menu_settings_data_table', 1),
(147, '2023_07_23_061220_create_plan_descriptions_table', 1),
(148, '2023_07_24_090807_remove_field_from_cms_table', 1),
(149, '2023_07_27_014537_create_job_skills_table', 1),
(150, '2023_08_01_101505_add_company_id_nullable_in_jobs_table', 1),
(151, '2023_08_01_112923_add_slug_to_job_categories_table', 1),
(152, '2023_08_02_030340_add_is_verified_column_in_companies_table', 1),
(153, '2023_08_07_054149_create_media_table', 1),
(154, '2023_08_10_032122_seed_job_categories_data_table', 1),
(155, '2023_08_11_021109_create_company_questions_table', 1),
(156, '2023_08_11_090656_create_company_question_job_table', 1),
(157, '2023_08_14_063056_add_answers_column_to_applied_jobs', 1),
(158, '2023_08_18_031419_add_profile_verify_column_in_plans_table', 1),
(159, '2023_08_22_093708_add_question_feature_enable_to_companies_table', 1),
(160, '2023_08_31_094716_add_additional_skills', 1),
(161, '2023_09_01_035037_create_language_data_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1),
(1, 'App\\Models\\Admin', 2);

-- --------------------------------------------------------

--
-- Table structure for table `nationalities`
--

CREATE TABLE `nationalities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0dcca929-86e5-4942-8a6f-b66df0101da5', 'App\\Notifications\\Admin\\NewUserRegisteredNotification', 'App\\Models\\Admin', 1, '{\"title\":\"A Candidate registered recently\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/candidate\\/2\"}', '2023-11-19 17:45:37', '2023-11-19 17:20:22', '2023-11-19 17:45:37'),
('35a4438b-a25e-41c4-af0e-d9cf25c02a8c', 'App\\Notifications\\Admin\\NewUserRegisteredNotification', 'App\\Models\\Admin', 1, '{\"title\":\"A Candidate registered recently\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/candidate\\/1\"}', '2023-11-19 17:45:37', '2023-11-19 14:59:18', '2023-11-19 17:45:37'),
('5640face-bd90-42f4-85f2-10b5fea10e89', 'App\\Notifications\\Admin\\NewUserRegisteredNotification', 'App\\Models\\Admin', 2, '{\"title\":\"A Candidate registered recently\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/candidate\\/2\"}', NULL, '2023-11-19 17:20:22', '2023-11-19 17:20:22'),
('97f9982d-ca3f-4d41-8de8-bd68333787d4', 'App\\Notifications\\Admin\\NewUserRegisteredNotification', 'App\\Models\\Admin', 2, '{\"title\":\"A Candidate registered recently\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/candidate\\/1\"}', NULL, '2023-11-19 14:59:18', '2023-11-19 14:59:18'),
('bd8d18ac-45fc-4466-b2bc-0dab4ee9d847', 'App\\Notifications\\Admin\\NewUserRegisteredNotification', 'App\\Models\\Admin', 1, '{\"title\":\"A Company registered recently\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/company\\/1\"}', '2023-11-19 14:15:08', '2023-11-19 14:07:16', '2023-11-19 14:15:08'),
('c3abe640-bbc7-4c48-b7ea-0fb7dd410e8a', 'App\\Notifications\\Admin\\NewUserRegisteredNotification', 'App\\Models\\Admin', 2, '{\"title\":\"A Company registered recently\",\"url\":\"http:\\/\\/localhost:8000\\/admin\\/company\\/1\"}', NULL, '2023-11-19 14:07:16', '2023-11-19 14:07:16');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `address` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organization_types`
--

CREATE TABLE `organization_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organization_types`
--

INSERT INTO `organization_types` (`id`, `created_at`, `updated_at`) VALUES
(1, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(2, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(3, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(4, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(5, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(6, '2023-09-13 02:49:43', '2023-09-13 02:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `organization_type_translations`
--

CREATE TABLE `organization_type_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_type_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organization_type_translations`
--

INSERT INTO `organization_type_translations` (`id`, `organization_type_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'Government', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(2, 2, 'Semi Government', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(3, 3, 'Public', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(4, 4, 'Private', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(5, 5, 'NGO', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(6, 6, 'International Agencies', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `our_missions`
--

CREATE TABLE `our_missions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mission_image` varchar(255) NOT NULL DEFAULT 'frontend/assets/images/banner/about-banner-5.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('salah@gmail.com', '$2y$10$C6qWPOHes4GnMOrlnBtLqu8ktUPzfzH1eR2YbJLHuZ3wsFe/shhSK', '2023-11-19 14:00:56');

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paypal` tinyint(1) NOT NULL DEFAULT 1,
  `paypal_live_mode` tinyint(1) NOT NULL DEFAULT 0,
  `stripe` tinyint(1) NOT NULL DEFAULT 1,
  `razorpay` tinyint(1) NOT NULL DEFAULT 1,
  `paystack` tinyint(1) NOT NULL DEFAULT 1,
  `ssl_commerz` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_settings`
--

INSERT INTO `payment_settings` (`id`, `paypal`, `paypal_live_mode`, `stripe`, `razorpay`, `paystack`, `ssl_commerz`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 1, 1, 1, 1, '2023-09-13 02:49:29', '2023-09-13 02:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'admin.create', 'admin', 'admin', '2023-09-13 02:49:05', '2023-09-13 02:49:05'),
(2, 'admin.view', 'admin', 'admin', '2023-09-13 02:49:05', '2023-09-13 02:49:05'),
(3, 'admin.edit', 'admin', 'admin', '2023-09-13 02:49:05', '2023-09-13 02:49:05'),
(4, 'admin.delete', 'admin', 'admin', '2023-09-13 02:49:05', '2023-09-13 02:49:05'),
(5, 'order.view', 'admin', 'order', '2023-09-13 02:49:05', '2023-09-13 02:49:05'),
(6, 'order.download', 'admin', 'order', '2023-09-13 02:49:05', '2023-09-13 02:49:05'),
(7, 'company.create', 'admin', 'company', '2023-09-13 02:49:05', '2023-09-13 02:49:05'),
(8, 'company.view', 'admin', 'company', '2023-09-13 02:49:05', '2023-09-13 02:49:05'),
(9, 'company.update', 'admin', 'company', '2023-09-13 02:49:05', '2023-09-13 02:49:05'),
(10, 'company.delete', 'admin', 'company', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(11, 'map.create', 'admin', 'map', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(12, 'map.view', 'admin', 'map', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(13, 'map.update', 'admin', 'map', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(14, 'map.delete', 'admin', 'map', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(15, 'candidate.create', 'admin', 'candidate', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(16, 'candidate.view', 'admin', 'candidate', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(17, 'candidate.update', 'admin', 'candidate', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(18, 'candidate.delete', 'admin', 'candidate', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(19, 'job.create', 'admin', 'job', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(20, 'job.view', 'admin', 'job', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(21, 'job.update', 'admin', 'job', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(22, 'job.delete', 'admin', 'job', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(23, 'job_category.create', 'admin', 'job_category', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(24, 'job_category.view', 'admin', 'job_category', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(25, 'job_category.update', 'admin', 'job_category', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(26, 'job_category.delete', 'admin', 'job_category', '2023-09-13 02:49:06', '2023-09-13 02:49:06'),
(27, 'job_role.view', 'admin', 'job_role', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(28, 'job_role.create', 'admin', 'job_role', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(29, 'job_role.update', 'admin', 'job_role', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(30, 'job_role.delete', 'admin', 'job_role', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(31, 'plan.create', 'admin', 'price_plan', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(32, 'plan.view', 'admin', 'price_plan', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(33, 'plan.update', 'admin', 'price_plan', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(34, 'plan.delete', 'admin', 'price_plan', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(35, 'industry_types.create', 'admin', 'attributes', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(36, 'industry_types.view', 'admin', 'attributes', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(37, 'industry_types.update', 'admin', 'attributes', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(38, 'industry_types.delete', 'admin', 'attributes', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(39, 'professions.create', 'admin', 'attributes', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(40, 'professions.view', 'admin', 'attributes', '2023-09-13 02:49:07', '2023-09-13 02:49:07'),
(41, 'professions.update', 'admin', 'attributes', '2023-09-13 02:49:08', '2023-09-13 02:49:08'),
(42, 'professions.delete', 'admin', 'attributes', '2023-09-13 02:49:08', '2023-09-13 02:49:08'),
(43, 'skills.create', 'admin', 'attributes', '2023-09-13 02:49:08', '2023-09-13 02:49:08'),
(44, 'skills.view', 'admin', 'attributes', '2023-09-13 02:49:08', '2023-09-13 02:49:08'),
(45, 'skills.update', 'admin', 'attributes', '2023-09-13 02:49:08', '2023-09-13 02:49:08'),
(46, 'skills.delete', 'admin', 'attributes', '2023-09-13 02:49:08', '2023-09-13 02:49:08'),
(47, 'post.create', 'admin', 'blog', '2023-09-13 02:49:08', '2023-09-13 02:49:08'),
(48, 'post.view', 'admin', 'blog', '2023-09-13 02:49:08', '2023-09-13 02:49:08'),
(49, 'post.update', 'admin', 'blog', '2023-09-13 02:49:08', '2023-09-13 02:49:08'),
(50, 'post.delete', 'admin', 'blog', '2023-09-13 02:49:08', '2023-09-13 02:49:08'),
(51, 'country.create', 'admin', 'location', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(52, 'country.view', 'admin', 'location', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(53, 'country.update', 'admin', 'location', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(54, 'country.delete', 'admin', 'location', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(55, 'state.create', 'admin', 'location', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(56, 'state.view', 'admin', 'location', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(57, 'state.update', 'admin', 'location', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(58, 'state.delete', 'admin', 'location', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(59, 'city.create', 'admin', 'location', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(60, 'city.view', 'admin', 'location', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(61, 'city.update', 'admin', 'location', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(62, 'city.delete', 'admin', 'location', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(63, 'newsletter.view', 'admin', 'newsletter', '2023-09-13 02:49:09', '2023-09-13 02:49:09'),
(64, 'newsletter.sendmail', 'admin', 'newsletter', '2023-09-13 02:49:10', '2023-09-13 02:49:10'),
(65, 'newsletter.delete', 'admin', 'newsletter', '2023-09-13 02:49:10', '2023-09-13 02:49:10'),
(66, 'contact.view', 'admin', 'contact', '2023-09-13 02:49:10', '2023-09-13 02:49:10'),
(67, 'contact.delete', 'admin', 'contact', '2023-09-13 02:49:10', '2023-09-13 02:49:10'),
(68, 'testimonial.create', 'admin', 'testimonial', '2023-09-13 02:49:10', '2023-09-13 02:49:10'),
(69, 'testimonial.view', 'admin', 'testimonial', '2023-09-13 02:49:10', '2023-09-13 02:49:10'),
(70, 'testimonial.update', 'admin', 'testimonial', '2023-09-13 02:49:10', '2023-09-13 02:49:10'),
(71, 'testimonial.delete', 'admin', 'testimonial', '2023-09-13 02:49:10', '2023-09-13 02:49:10'),
(72, 'faq.create', 'admin', 'faq', '2023-09-13 02:49:10', '2023-09-13 02:49:10'),
(73, 'faq.view', 'admin', 'faq', '2023-09-13 02:49:10', '2023-09-13 02:49:10'),
(74, 'faq.update', 'admin', 'faq', '2023-09-13 02:49:11', '2023-09-13 02:49:11'),
(75, 'faq.delete', 'admin', 'faq', '2023-09-13 02:49:11', '2023-09-13 02:49:11'),
(76, 'role.create', 'admin', 'role', '2023-09-13 02:49:11', '2023-09-13 02:49:11'),
(77, 'role.view', 'admin', 'role', '2023-09-13 02:49:11', '2023-09-13 02:49:11'),
(78, 'role.edit', 'admin', 'role', '2023-09-13 02:49:11', '2023-09-13 02:49:11'),
(79, 'role.delete', 'admin', 'role', '2023-09-13 02:49:11', '2023-09-13 02:49:11'),
(80, 'setting.view', 'admin', 'settings', '2023-09-13 02:49:11', '2023-09-13 02:49:11'),
(81, 'setting.update', 'admin', 'settings', '2023-09-13 02:49:11', '2023-09-13 02:49:11'),
(82, 'candidate-language.create', 'admin', 'candidate-language', '2023-09-13 02:49:11', '2023-09-13 02:49:11'),
(83, 'candidate-language.view', 'admin', 'candidate-language', '2023-09-13 02:49:11', '2023-09-13 02:49:11'),
(84, 'candidate-language.update', 'admin', 'candidate-language', '2023-09-13 02:49:12', '2023-09-13 02:49:12'),
(85, 'candidate-language.delete', 'admin', 'candidate-language', '2023-09-13 02:49:12', '2023-09-13 02:49:12'),
(86, 'benefits.create', 'admin', 'attributes', '2023-09-13 02:49:12', '2023-09-13 02:49:12'),
(87, 'benefits.view', 'admin', 'attributes', '2023-09-13 02:49:12', '2023-09-13 02:49:12'),
(88, 'benefits.update', 'admin', 'attributes', '2023-09-13 02:49:12', '2023-09-13 02:49:12'),
(89, 'benefits.delete', 'admin', 'attributes', '2023-09-13 02:49:12', '2023-09-13 02:49:12'),
(90, 'tags.create', 'admin', 'attributes', '2023-09-13 02:49:18', '2023-09-13 02:49:18'),
(91, 'tags.view', 'admin', 'attributes', '2023-09-13 02:49:18', '2023-09-13 02:49:18'),
(92, 'tags.update', 'admin', 'attributes', '2023-09-13 02:49:18', '2023-09-13 02:49:18'),
(93, 'tags.delete', 'admin', 'attributes', '2023-09-13 02:49:18', '2023-09-13 02:49:18'),
(94, 'menu-setting.index', 'admin', 'menu-setting', '2023-09-13 02:49:22', '2023-09-13 02:49:22'),
(95, 'menu-setting.create', 'admin', 'menu-setting', '2023-09-13 02:49:22', '2023-09-13 02:49:22'),
(96, 'menu-setting.update', 'admin', 'menu-setting', '2023-09-13 02:49:22', '2023-09-13 02:49:22'),
(97, 'menu-setting.delete', 'admin', 'menu-setting', '2023-09-13 02:49:22', '2023-09-13 02:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `job_limit` int(11) NOT NULL,
  `featured_job_limit` int(11) NOT NULL,
  `highlight_job_limit` int(11) NOT NULL,
  `candidate_cv_view_limit` int(11) NOT NULL DEFAULT 0,
  `recommended` tinyint(1) NOT NULL DEFAULT 0,
  `frontend_show` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `candidate_cv_view_limitation` enum('unlimited','limited') NOT NULL DEFAULT 'limited',
  `profile_verify` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `label`, `price`, `job_limit`, `featured_job_limit`, `highlight_job_limit`, `candidate_cv_view_limit`, `recommended`, `frontend_show`, `created_at`, `updated_at`, `candidate_cv_view_limitation`, `profile_verify`) VALUES
(1, 'Free Plan', 0.00, 1, 1, 1, 3, 0, 1, '2023-09-13 02:49:25', '2023-09-13 02:49:25', 'limited', 0),
(2, 'Basic Plan', 20.00, 5, 3, 2, 10, 0, 1, '2023-09-13 02:49:25', '2023-09-13 02:49:25', 'limited', 0),
(3, 'Standard Plan', 50.00, 20, 8, 4, 20, 1, 1, '2023-09-13 02:49:26', '2023-09-13 02:49:26', 'limited', 0),
(4, 'Trial', 0.00, 1, 1, 1, 5, 0, 0, '2023-09-13 02:49:38', '2023-09-13 02:49:38', 'limited', 0);

-- --------------------------------------------------------

--
-- Table structure for table `plan_descriptions`
--

CREATE TABLE `plan_descriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(4) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_descriptions`
--

INSERT INTO `plan_descriptions` (`id`, `plan_id`, `locale`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Company Essentials at No Cost: Boost Your Business', '2023-09-13 02:49:26', '2023-09-13 02:49:26'),
(2, 2, 'en', 'Foundational Solutions: Propel Your Company Forward', '2023-09-13 02:49:26', '2023-09-13 02:49:26'),
(3, 3, 'en', 'Premium Growth Tools: Accelerate Your Business Success', '2023-09-13 02:49:26', '2023-09-13 02:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `locale` varchar(255) NOT NULL DEFAULT 'en',
  `image` varchar(255) DEFAULT NULL,
  `short_description` text NOT NULL,
  `description` longtext NOT NULL,
  `status` enum('draft','published') NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `professions`
--

CREATE TABLE `professions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `professions`
--

INSERT INTO `professions` (`id`, `created_at`, `updated_at`) VALUES
(1, '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(2, '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(3, '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(4, '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(5, '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(6, '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(7, '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(8, '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(9, '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(10, '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(11, '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(12, '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(13, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(14, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(15, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(16, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(17, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(18, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(19, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(20, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(21, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(22, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(23, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(24, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(25, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(26, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(27, '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(28, '2023-09-13 02:49:40', '2023-09-13 02:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `profession_translations`
--

CREATE TABLE `profession_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `profession_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profession_translations`
--

INSERT INTO `profession_translations` (`id`, `profession_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'Physician', 'en', '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(2, 2, 'Engineer', 'en', '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(3, 3, 'Chef', 'en', '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(4, 4, 'Lawyer', 'en', '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(5, 5, 'Designer', 'en', '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(6, 6, 'Labourer', 'en', '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(7, 7, 'Dentist', 'en', '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(8, 8, 'Accountant', 'en', '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(9, 9, 'Dental Hygienist', 'en', '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(10, 10, 'Actor', 'en', '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(11, 11, 'Electrician', 'en', '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(12, 12, 'Software Developer', 'en', '2023-09-13 02:49:39', '2023-09-13 02:49:39'),
(13, 13, 'Pharmacist', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(14, 14, 'Technician', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(15, 15, 'Artist', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(16, 16, 'Teacher', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(17, 17, 'Journalist', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(18, 18, 'Cashier', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(19, 19, 'Secretary', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(20, 20, 'Scientist', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(21, 21, 'Soldier', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(22, 22, 'Gardener', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(23, 23, 'Farmer', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(24, 24, 'Librarian', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(25, 25, 'Driver', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(26, 26, 'Fishermen', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(27, 27, 'Police Officer ', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40'),
(28, 28, 'Tailor', 'en', '2023-09-13 02:49:40', '2023-09-13 02:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `queue_jobs`
--

CREATE TABLE `queue_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'admin', '2023-09-13 02:49:05', '2023-09-13 02:49:05');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salary_types`
--

CREATE TABLE `salary_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_types`
--

INSERT INTO `salary_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Monthly', 'monthly', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(2, 'Project Basis', 'project-basis', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(3, 'Hourly', 'hourly', '2023-09-13 02:49:42', '2023-09-13 02:49:42'),
(4, 'Yearly', 'yearly', '2023-09-13 02:49:42', '2023-09-13 02:49:42');

-- --------------------------------------------------------

--
-- Table structure for table `seos`
--

CREATE TABLE `seos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seos`
--

INSERT INTO `seos` (`id`, `page_slug`, `created_at`, `updated_at`) VALUES
(1, 'home', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(2, 'jobs', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(3, 'job-details', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(4, 'candidates', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(5, 'candidate-details', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(6, 'company', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(7, 'company-details', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(8, 'blog', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(9, 'post-details', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(10, 'pricing', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(11, 'login', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(12, 'register', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(13, 'about', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(14, 'contact', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(15, 'faq', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(16, 'terms-condition', '2023-09-13 02:49:38', '2023-09-13 02:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `seo_page_contents`
--

CREATE TABLE `seo_page_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `language_code` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seo_page_contents`
--

INSERT INTO `seo_page_contents` (`id`, `page_id`, `language_code`, `title`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Welcome To Jobpilot', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(2, 2, 'en', 'Jobs', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(3, 3, 'en', 'Job Details', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(4, 4, 'en', 'Candidates', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(5, 5, 'en', 'Candidate Details', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(6, 6, 'en', 'Company', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(7, 7, 'en', 'Company Details', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(8, 8, 'en', 'Blog', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(9, 9, 'en', 'Post Details', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(10, 10, 'en', 'Pricing', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(11, 11, 'en', 'Login', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(12, 12, 'en', 'Register', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(13, 13, 'en', 'About', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(14, 14, 'en', 'Contact', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(15, 15, 'en', 'FAQ', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(16, 16, 'en', 'Terms Condition', 'Jobpilot is job portal laravel script designed to create, manage and publish jobs posts. Companies can create their profile and publish jobs posts. Candidate can apply job posts.', 'frontend/assets/images/jobpilot.png', '2023-09-13 02:49:38', '2023-09-13 02:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dark_logo` varchar(255) DEFAULT NULL,
  `light_logo` varchar(255) DEFAULT NULL,
  `favicon_image` varchar(255) DEFAULT NULL,
  `header_css` text DEFAULT NULL,
  `header_script` text DEFAULT NULL,
  `body_script` text DEFAULT NULL,
  `sidebar_color` varchar(255) DEFAULT NULL,
  `nav_color` varchar(255) DEFAULT NULL,
  `sidebar_txt_color` varchar(255) DEFAULT NULL,
  `nav_txt_color` varchar(255) DEFAULT NULL,
  `main_color` varchar(255) DEFAULT NULL,
  `accent_color` varchar(255) DEFAULT NULL,
  `frontend_primary_color` varchar(255) DEFAULT NULL,
  `frontend_secondary_color` varchar(255) DEFAULT NULL,
  `working_process_step1_title` varchar(255) DEFAULT NULL,
  `working_process_step1_description` text DEFAULT NULL,
  `working_process_step2_title` varchar(255) DEFAULT NULL,
  `working_process_step2_description` text DEFAULT NULL,
  `working_process_step3_title` varchar(255) DEFAULT NULL,
  `working_process_step3_description` text DEFAULT NULL,
  `working_process_step4_title` varchar(255) DEFAULT NULL,
  `working_process_step4_description` text DEFAULT NULL,
  `dark_mode` tinyint(1) NOT NULL DEFAULT 0,
  `google_analytics` tinyint(1) NOT NULL DEFAULT 0,
  `search_engine_indexing` tinyint(1) NOT NULL DEFAULT 1,
  `default_layout` tinyint(1) NOT NULL DEFAULT 1,
  `default_plan` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `job_limit` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `featured_job_limit` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `highlight_job_limit` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `timezone` varchar(255) NOT NULL DEFAULT 'UTC',
  `language_changing` tinyint(1) NOT NULL DEFAULT 1,
  `email_verification` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `default_map` enum('google-map','leaflet') NOT NULL DEFAULT 'leaflet',
  `google_map_key` varchar(255) DEFAULT NULL,
  `default_long` double DEFAULT NULL,
  `default_lat` double DEFAULT NULL,
  `app_country_type` enum('single_base','multiple_base') NOT NULL DEFAULT 'multiple_base',
  `app_country` bigint(20) UNSIGNED DEFAULT NULL,
  `employer_auto_activation` tinyint(1) NOT NULL DEFAULT 1,
  `per_job_active` tinyint(1) NOT NULL DEFAULT 1,
  `per_job_price` double(8,2) DEFAULT 100.00,
  `highlight_job_price` double(8,2) DEFAULT 50.00,
  `featured_job_price` double(8,2) DEFAULT 50.00,
  `candidate_account_auto_activation` tinyint(1) NOT NULL DEFAULT 1,
  `job_auto_approved` tinyint(1) NOT NULL DEFAULT 0,
  `edited_job_auto_approved` tinyint(1) NOT NULL DEFAULT 1,
  `currency_switcher` tinyint(1) NOT NULL DEFAULT 1,
  `highlight_job_days` int(11) DEFAULT 0,
  `featured_job_days` int(11) DEFAULT 0,
  `job_deadline_expiration_limit` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `email`, `dark_logo`, `light_logo`, `favicon_image`, `header_css`, `header_script`, `body_script`, `sidebar_color`, `nav_color`, `sidebar_txt_color`, `nav_txt_color`, `main_color`, `accent_color`, `frontend_primary_color`, `frontend_secondary_color`, `working_process_step1_title`, `working_process_step1_description`, `working_process_step2_title`, `working_process_step2_description`, `working_process_step3_title`, `working_process_step3_description`, `working_process_step4_title`, `working_process_step4_description`, `dark_mode`, `google_analytics`, `search_engine_indexing`, `default_layout`, `default_plan`, `job_limit`, `featured_job_limit`, `highlight_job_limit`, `timezone`, `language_changing`, `email_verification`, `created_at`, `updated_at`, `default_map`, `google_map_key`, `default_long`, `default_lat`, `app_country_type`, `app_country`, `employer_auto_activation`, `per_job_active`, `per_job_price`, `highlight_job_price`, `featured_job_price`, `candidate_account_auto_activation`, `job_auto_approved`, `edited_job_auto_approved`, `currency_switcher`, `highlight_job_days`, `featured_job_days`, `job_deadline_expiration_limit`) VALUES
(1, 'find-job@gmail.com', 'uploads/app/logo\\IkELkK80aBMPqklhZbOjb6KfW17QdnJwUJ3udxzu.png', 'uploads/app/logo\\ZBpdWAtaXrbAyyEdX6ANplTdT3gjyMTJNhpBsh0e.png', 'uploads/app/logo\\o6q5qbu2YNrpBEex4xPJ99sZQkTKHayrJrKQ4oAW.png', NULL, NULL, NULL, '#0A5179', '#0A5179', '#C1D6F0', '#C1D6F0', '#0055B6', '#5A94D8', '#0A65CC', '#487CB8', 'Create Account', 'Aliquam facilisis egestas sapien, nec tempor leo tristique at.', 'Upload Cv Resume', 'Curabitur sit amet maximus ligula. Nam a nulla ante. Nam sodales', 'Find Suitable Job', 'Curabitur sit amet maximus ligula. Nam a nulla ante. Nam sodales', 'Apply Job', 'Curabitur sit amet maximus ligula. Nam a nulla ante. Nam sodales', 0, 0, 1, 1, 1, 1, 1, 1, 'UTC', 0, 0, '2023-09-13 02:49:29', '2023-11-19 13:24:43', 'google-map', 'https://maps.app.goo.gl/WfQ9MnHmHJqmYfqK8', 90.411270491741, 23.757853442383, 'single_base', 113, 1, 0, 100.00, 50.00, 50.00, 1, 0, 1, 0, 0, 0, 30);

-- --------------------------------------------------------

--
-- Table structure for table `setup_guides`
--

CREATE TABLE `setup_guides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `action_route` varchar(255) NOT NULL,
  `action_label` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setup_guides`
--

INSERT INTO `setup_guides` (`id`, `task_name`, `title`, `description`, `action_route`, `action_label`, `status`, `created_at`, `updated_at`) VALUES
(1, 'app_setting', 'App Information ', 'Add your app logo, name, description, owner and other information.', 'settings.general', 'Add App Information', 1, '2023-09-13 02:49:38', '2023-11-19 11:39:12'),
(2, 'smtp_setting', 'SMTP Configuration', 'Add your app logo, name, description, owner and other information.', 'settings.email', 'Add Mail Configuration', 1, '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(3, 'payment_setting', 'Enable Payment Method', 'Enable to payment methods to receive payments from your customer.', 'settings.payment', 'Add Payment', 1, '2023-09-13 02:49:38', '2023-09-13 02:49:38'),
(4, 'theme_setting', 'Customize Theme', 'Customize your theme to make your app look more attractive.', 'settings.theme', 'Customize Your App Now', 1, '2023-09-13 02:49:38', '2023-11-19 11:55:04');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `created_at`, `updated_at`) VALUES
(1, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(2, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(3, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(4, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(5, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(6, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(7, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(8, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(9, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(10, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(11, '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(12, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(13, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(14, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(15, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(16, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(17, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(18, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(19, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(20, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(21, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(22, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(23, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(24, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(25, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(26, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(27, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(28, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(29, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(30, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(31, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(32, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(33, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(34, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(35, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(36, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(37, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(38, '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(39, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(40, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(41, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(42, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(43, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(44, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(45, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(46, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(47, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(48, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(49, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(50, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(51, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(52, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(53, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(54, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(55, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(56, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(57, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(58, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(59, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(60, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(61, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(62, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(63, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(64, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(65, '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(66, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(67, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(68, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(69, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(70, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(71, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(72, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(73, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(74, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(75, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(76, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(77, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(78, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(79, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(80, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(81, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(82, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(83, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(84, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(85, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(86, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(87, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(88, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(89, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(90, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(91, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(92, '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(93, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(94, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(95, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(96, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(97, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(98, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(99, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(100, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(101, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(102, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(103, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(104, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(105, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(106, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(107, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(108, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(109, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(110, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(111, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(112, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(113, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(114, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(115, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(116, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(117, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(118, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(119, '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(120, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(121, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(122, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(123, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(124, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(125, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(126, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(127, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(128, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(129, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(130, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(131, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(132, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(133, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(134, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(135, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(136, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(137, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(138, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(139, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(140, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(141, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(142, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(143, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(144, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(145, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(146, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(147, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(148, '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(149, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(150, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(151, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(152, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(153, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(154, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(155, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(156, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(157, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(158, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(159, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(160, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(161, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(162, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(163, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(164, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(165, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(166, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(167, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(168, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(169, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(170, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(171, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(172, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(173, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(174, '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(175, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(176, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(177, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(178, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(179, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(180, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(181, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(182, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(183, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(184, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(185, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(186, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(187, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(188, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(189, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(190, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(191, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(192, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(193, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(194, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(195, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(196, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(197, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(198, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(199, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(200, '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(201, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(202, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(203, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(204, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(205, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(206, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(207, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(208, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(209, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(210, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(211, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(212, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(213, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(214, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(215, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(216, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(217, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(218, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(219, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(220, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(221, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(222, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(223, '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(224, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(225, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(226, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(227, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(228, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(229, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(230, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(231, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(232, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(233, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(234, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(235, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(236, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(237, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(238, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(239, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(240, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(241, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(242, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(243, '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(244, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(245, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(246, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(247, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(248, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(249, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(250, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(251, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(252, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(253, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(254, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(255, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(256, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(257, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(258, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(259, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(260, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(261, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(262, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(263, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(264, '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(265, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(266, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(267, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(268, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(269, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(270, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(271, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(272, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(273, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(274, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(275, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(276, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(277, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(278, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(279, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(280, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(281, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(282, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(283, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(284, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(285, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(286, '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(287, '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(288, '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(289, '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(290, '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(291, '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(292, '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(293, '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(294, '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(295, '2023-09-13 02:49:55', '2023-09-13 02:49:55');

-- --------------------------------------------------------

--
-- Table structure for table `skill_translations`
--

CREATE TABLE `skill_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `skill_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skill_translations`
--

INSERT INTO `skill_translations` (`id`, `skill_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'html', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(2, 2, 'css', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(3, 3, 'js', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(4, 4, 'php', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(5, 5, 'laravel', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(6, 6, 'mysql', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(7, 7, 'vuejs', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(8, 8, 'reactjs', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(9, 9, 'nodejs', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(10, 10, 'expressjs', 'en', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(11, 11, 'python', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(12, 12, 'django', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(13, 13, 'C++', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(14, 14, 'C#', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(15, 15, 'Customer Service', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(16, 16, 'C (Programming Language)', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(17, 17, 'Change Management', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(18, 18, 'Communication', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(19, 19, 'Coaching', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(20, 20, 'Customer Relationship Management (CRM)', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(21, 21, 'Contract Negotiation', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(22, 22, 'Construction', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(23, 23, 'Customer Satisfaction', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(24, 24, 'Continuous Improvement', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(25, 25, 'Cascading Style Sheets (CSS)', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(26, 26, 'Community Outreach', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(27, 27, 'Supply Chain Management', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(28, 28, 'Cross-functional Team Leadership', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(29, 29, 'Contract Management', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(30, 30, 'Management Consulting', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(31, 31, 'Construction Management', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(32, 32, 'Adobe Creative Suite', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(33, 33, 'Business Development', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(34, 34, 'New Business Development', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(35, 35, 'Data Analysis', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(36, 36, 'Product Development', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(37, 37, 'Software Development', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(38, 38, 'Graphic Design', 'en', '2023-09-13 02:49:44', '2023-09-13 02:49:44'),
(39, 39, 'Digital Marketing', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(40, 40, 'Leadership Development', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(41, 41, 'Research and Development (R&D)', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(42, 42, 'Data Entry', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(43, 43, 'Organizational Development', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(44, 44, 'Web Development', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(45, 45, 'Databases', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(46, 46, 'Web Design', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(47, 47, 'Curriculum Development', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(48, 48, 'Software Development Life Cycle (SDLC)', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(49, 49, 'Staff Development', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(50, 50, 'Oracle Database', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(51, 51, 'Digital Media', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(52, 52, 'Program Development', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(53, 53, 'Microsoft Excel', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(54, 54, 'English', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(55, 55, 'Event Planning', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(56, 56, 'Engineering', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(57, 57, 'Event Management', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(58, 58, 'Editing', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(59, 59, 'E-Commerce', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(60, 60, 'Entrepreneurship', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(61, 61, 'Higher Education', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(62, 62, 'E-Learning', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(63, 63, 'Employee Relations', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(64, 64, 'Real Estate', 'en', '2023-09-13 02:49:45', '2023-09-13 02:49:45'),
(65, 65, 'Microsoft Office', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(66, 66, 'Project Engineering', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(67, 67, 'Energy', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(68, 68, 'Search Engine Optimization (SEO)', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(69, 69, 'Employee Training', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(70, 70, 'Email Marketing', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(71, 71, 'Enterprise Resource Planning (ERP)', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(72, 72, 'Project Management', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(73, 73, 'Microsoft PowerPoint', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(74, 74, 'Strategic Planning', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(75, 75, 'Public Speaking', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(76, 76, 'Adobe Photoshop', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(77, 77, 'Project Planning', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(78, 78, 'Public Relations', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(79, 79, 'Program Management', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(80, 80, 'Manufacturing Process Improvement', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(81, 81, 'Business Planning', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(82, 82, 'Business Process Improvement', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(83, 83, 'Problem Solving', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(84, 84, 'Photography', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(85, 85, 'SAP Products', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(86, 86, 'Python (Programming Language)', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(87, 87, 'Product Management', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(88, 88, 'Public Policy', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(89, 89, 'F#', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(90, 90, 'Financial Analysis', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(91, 91, 'Finance', 'en', '2023-09-13 02:49:46', '2023-09-13 02:49:46'),
(92, 92, 'Financial Reporting', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(93, 93, 'Fundraising', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(94, 94, 'Forecasting', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(95, 95, 'Financial Accounting', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(96, 96, 'Food and Beverage Operations', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(97, 97, 'Facebook', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(98, 98, 'French', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(99, 99, 'Corporate Finance', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(100, 100, 'Financial Modeling', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(101, 101, 'Fashion', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(102, 102, 'Financial Services', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(103, 103, '.NET Framework', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(104, 104, 'Leadership', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(105, 105, 'G++', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(106, 106, 'Government', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(107, 107, 'Oil and Gas', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(108, 108, 'Git', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(109, 109, 'Gas', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(110, 110, 'Grant Writing', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(111, 111, 'Lead Generation', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(112, 112, 'Google Analytics', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(113, 113, 'Fast-Moving Consumer Goods (FMCG)', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(114, 114, 'Corporate Governance', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(115, 115, 'General Ledgers', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(116, 116, 'Sales', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(117, 117, 'Graphics', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(118, 118, 'Research Skills', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(119, 119, 'Requirements Gathering', 'en', '2023-09-13 02:49:47', '2023-09-13 02:49:47'),
(120, 120, 'Good Manufacturing Practice (GMP)', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(121, 121, 'German', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(122, 122, 'HTML', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(123, 123, 'Healthcare', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(124, 124, 'Human Resources (HR)', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(125, 125, 'Hospitals', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(126, 126, 'Healthcare Management', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(127, 127, 'Hospitality Industry', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(128, 128, 'HTML5', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(129, 129, 'Hotel Management', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(130, 130, 'Hospitality Management', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(131, 131, 'Computer Hardware', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(132, 132, 'Healthcare Information Technology (HIT)', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(133, 133, 'Mental Health', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(134, 134, 'Public Health', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(135, 135, 'U.S. Health Insurance Portability and Accountability Act (HIPAA)', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(136, 136, 'HR Consulting', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(137, 137, 'Inventory Management', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(138, 138, 'Adobe Illustrator', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(139, 139, 'IT Integration', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(140, 140, 'Business Intelligence (BI)', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(141, 141, 'Adobe InDesign', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(142, 142, 'Insurance', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(143, 143, 'ITIL', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(144, 144, 'Investments', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(145, 145, 'Interviewing', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(146, 146, 'Information Technology', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(147, 147, 'Internal Controls', 'en', '2023-09-13 02:49:48', '2023-09-13 02:49:48'),
(148, 148, 'Interpersonal Skills', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(149, 149, 'IT Service Management', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(150, 150, 'Java', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(151, 151, 'JavaScript', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(152, 152, 'jQuery', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(153, 153, 'J#', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(154, 154, 'Journalism', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(155, 155, 'Jakarta EE', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(156, 156, 'Jira', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(157, 157, 'Node.js', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(158, 158, 'Core Java', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(159, 159, 'JSON', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(160, 160, 'React.js', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(161, 161, 'JavaServer Pages (JSP)', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(162, 162, 'Criminal Justice', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(163, 163, 'Online Journalism', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(164, 164, 'Jenkins', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(165, 165, 'Journal Entries (Accounting)', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(166, 166, 'Joint Ventures', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(167, 167, 'Joomla!', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(168, 168, 'Kaizen', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(169, 169, 'K-12 Education', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(170, 170, 'Key Account Development', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(171, 171, 'Kanban', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(172, 172, 'Key Performance Indicators', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(173, 173, '401(k) Retirement Savings Plans', 'en', '2023-09-13 02:49:49', '2023-09-13 02:49:49'),
(174, 174, 'Accounting', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(175, 175, 'Knowledge Management', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(176, 176, 'Project Management Body of Knowledge (PMBOK)', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(177, 177, '10-Key Typing', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(178, 178, 'Product Knowledge', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(179, 179, 'KPI Reporting', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(180, 180, 'Kubernetes', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(181, 181, 'KYC Verification', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(182, 182, 'Keynote', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(183, 183, 'Keyword Research', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(184, 184, 'Knitwear', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(185, 185, 'Team Leadership', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(186, 186, 'Logistics Management', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(187, 187, 'Linux', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(188, 188, 'Lean Manufacturing', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(189, 189, 'P&L Management', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(190, 190, 'Legal Research', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(191, 191, 'Management', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(192, 192, 'Legal Writing', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(193, 193, 'Litigation', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(194, 194, 'Educational Leadership', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(195, 195, 'Logo Design', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(196, 196, 'Corporate Law', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(197, 197, 'Loans', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(198, 198, 'Microsoft Word', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(199, 199, 'Social Media', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(200, 200, 'Marketing', 'en', '2023-09-13 02:49:50', '2023-09-13 02:49:50'),
(201, 201, 'Marketing Strategy', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(202, 202, 'Sales Management', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(203, 203, 'Time Management', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(204, 204, 'Team Management', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(205, 205, 'Account Management', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(206, 206, 'Social Media Marketing', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(207, 207, 'Operations Management', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(208, 208, 'N+', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(209, 209, 'Negotiation', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(210, 210, 'Nonprofit Organizations', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(211, 211, 'Networking', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(212, 212, 'Nursing', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(213, 213, 'Network Administration', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(214, 214, 'ASP.NET', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(215, 215, 'Network Security', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(216, 216, 'New Media', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(217, 217, 'Newsletters', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(218, 218, 'Nutrition', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(219, 219, 'Critical Care Nursing', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(220, 220, 'Network Design', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(221, 221, 'Microsoft Outlook', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(222, 222, 'Sales Operations', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(223, 223, 'Online Marketing', 'en', '2023-09-13 02:49:51', '2023-09-13 02:49:51'),
(224, 224, 'Online Advertising', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(225, 225, 'Office Administration', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(226, 226, 'Organization Skills', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(227, 227, 'Operating Systems', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(228, 228, 'Quality Assurance', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(229, 229, 'Quality Management', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(230, 230, 'Qualitative Research', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(231, 231, 'QuickBooks', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(232, 232, 'Quality Control', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(233, 233, 'Quality System', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(234, 234, 'Quantitative Research', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(235, 235, 'Quality Auditing', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(236, 236, 'Micro Focus Quality Center', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(237, 237, 'Software Quality Assurance', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(238, 238, 'Q#', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(239, 239, 'Analytical Skills', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(240, 240, 'SQL', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(241, 241, 'Advanced Product Quality Planning (APQP)', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(242, 242, 'Quantity Surveying', 'en', '2023-09-13 02:49:52', '2023-09-13 02:49:52'),
(243, 243, 'Language Integrated Query (LINQ)', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(244, 244, 'R&R', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(245, 245, 'Retail', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(246, 246, 'Recruiting', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(247, 247, 'Risk Management', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(248, 248, 'Market Research', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(249, 249, 'Requirements Analysis', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(250, 250, 'R (Programming Language)', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(251, 251, 'Clinical Research', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(252, 252, 'A++', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(253, 253, 'AutoCAD', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(254, 254, 'Business Analysis', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(255, 255, 'Advertising', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(256, 256, 'Mergers & Acquisitions (M&A)', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(257, 257, 'Software as a Service (SaaS)', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(258, 258, 'Agile Methodologies', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(259, 259, 'Auditing', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(260, 260, 'Business Strategy', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(261, 261, 'Team Building', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(262, 262, 'Budgeting', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(263, 263, 'Banking', 'en', '2023-09-13 02:49:53', '2023-09-13 02:49:53'),
(264, 264, 'Business-to-Business (B2B)', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(265, 265, 'Blogging', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(266, 266, 'Business Process', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(267, 267, 'Brand Development', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(268, 268, 'Small Business', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(269, 269, 'Brand Management', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(270, 270, 'Alpine JS', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(271, 271, 'Livewire', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(272, 272, 'Tailwind css', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(273, 273, 'Inertia JS', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(274, 274, 'TDD', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(275, 275, 'PEST PHP', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(276, 276, 'Wordpress', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(277, 277, 'Drupal', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(278, 278, 'Symfony', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(279, 279, 'Codignator', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(280, 280, 'Flask', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(281, 281, 'Pinia', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(282, 282, 'JEST', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(283, 283, 'Mysql', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(284, 284, 'Oracal', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(285, 285, 'MS Sql', 'en', '2023-09-13 02:49:54', '2023-09-13 02:49:54'),
(286, 286, 'Node', 'en', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(287, 287, 'Angular JS', 'en', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(288, 288, 'Ruby On Rails', 'en', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(289, 289, 'Bootstrap', 'en', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(290, 290, 'PHPmyadmin', 'en', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(291, 291, 'Cloud Computing', 'en', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(292, 292, 'AWS', 'en', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(293, 293, 'Valet', 'en', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(294, 294, 'REST API', 'en', '2023-09-13 02:49:55', '2023-09-13 02:49:55'),
(295, 295, 'GraphQL', 'en', '2023-09-13 02:49:55', '2023-09-13 02:49:55');

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `social_media` enum('facebook','twitter','instagram','youtube','linkedin','pinterest','reddit','github','other') NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_links`
--

INSERT INTO `social_links` (`id`, `user_id`, `social_media`, `url`, `created_at`, `updated_at`) VALUES
(6, 1, 'linkedin', 'https://talentspace.ai/', '2023-11-19 17:46:12', '2023-11-19 17:46:12');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `show_popular_list` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `created_at`, `updated_at`, `show_popular_list`) VALUES
(1, '2023-09-13 02:49:58', '2023-09-13 02:49:58', 1),
(2, '2023-09-13 02:49:58', '2023-09-13 02:49:58', 1),
(3, '2023-09-13 02:49:58', '2023-09-13 02:49:58', 0),
(4, '2023-09-13 02:49:58', '2023-09-13 02:49:58', 0),
(5, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 1),
(6, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 1),
(7, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 0),
(8, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 1),
(9, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 0),
(10, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 1),
(11, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 0),
(12, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 1),
(13, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 1),
(14, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 0),
(15, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 0),
(16, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 1),
(17, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 0),
(18, '2023-09-13 02:49:59', '2023-09-13 02:49:59', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tag_translations`
--

CREATE TABLE `tag_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tag_translations`
--

INSERT INTO `tag_translations` (`id`, `tag_id`, `name`, `locale`, `created_at`, `updated_at`) VALUES
(1, 1, 'php', 'en', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(2, 2, 'laravel', 'en', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(3, 3, 'mysql', 'en', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(4, 4, 'job', 'en', '2023-09-13 02:49:58', '2023-09-13 02:49:58'),
(5, 5, 'frontend', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(6, 6, 'backend', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(7, 7, 'bootstrap', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(8, 8, 'team', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(9, 9, 'testing', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(10, 10, 'database', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(11, 11, 'jobs', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(12, 12, 'remote', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(13, 13, 'others', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(14, 14, 'seeker', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(15, 15, 'candidate', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(16, 16, 'company', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(17, 17, 'technology', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59'),
(18, 18, 'work', 'en', '2023-09-13 02:49:59', '2023-09-13 02:49:59');

-- --------------------------------------------------------

--
-- Table structure for table `team_sizes`
--

CREATE TABLE `team_sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team_sizes`
--

INSERT INTO `team_sizes` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Only Me', 'only-me', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(2, '10 Members', '10-members', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(3, '10-20 Members', '10-20-members', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(4, '20-50 Members', '20-50-members', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(5, '50-100 Members', '50-100-members', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(6, '100-200 Members', '100-200-members', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(7, '200-500 Members', '200-500-members', '2023-09-13 02:49:43', '2023-09-13 02:49:43'),
(8, '500+ Members', '500-members', '2023-09-13 02:49:43', '2023-09-13 02:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `terms_categories`
--

CREATE TABLE `terms_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `stars` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(255) NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theme_settings`
--

CREATE TABLE `theme_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE `timezones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`id`, `value`) VALUES
(1, 'Africa/Abidjan'),
(2, 'Africa/Accra'),
(3, 'Africa/Addis_Ababa'),
(4, 'Africa/Algiers'),
(5, 'Africa/Asmara'),
(6, 'Africa/Bamako'),
(7, 'Africa/Bangui'),
(8, 'Africa/Banjul'),
(9, 'Africa/Bissau'),
(10, 'Africa/Blantyre'),
(11, 'Africa/Brazzaville'),
(12, 'Africa/Bujumbura'),
(13, 'Africa/Cairo'),
(14, 'Africa/Casablanca'),
(15, 'Africa/Ceuta'),
(16, 'Africa/Conakry'),
(17, 'Africa/Dakar'),
(18, 'Africa/Dar_es_Salaam'),
(19, 'Africa/Djibouti'),
(20, 'Africa/Douala'),
(21, 'Africa/El_Aaiun'),
(22, 'Africa/Freetown'),
(23, 'Africa/Gaborone'),
(24, 'Africa/Harare'),
(25, 'Africa/Johannesburg'),
(26, 'Africa/Juba'),
(27, 'Africa/Kampala'),
(28, 'Africa/Khartoum'),
(29, 'Africa/Kigali'),
(30, 'Africa/Kinshasa'),
(31, 'Africa/Lagos'),
(32, 'Africa/Libreville'),
(33, 'Africa/Lome'),
(34, 'Africa/Luanda'),
(35, 'Africa/Lubumbashi'),
(36, 'Africa/Lusaka'),
(37, 'Africa/Malabo'),
(38, 'Africa/Maputo'),
(39, 'Africa/Maseru'),
(40, 'Africa/Mbabane'),
(41, 'Africa/Mogadishu'),
(42, 'Africa/Monrovia'),
(43, 'Africa/Nairobi'),
(44, 'Africa/Ndjamena'),
(45, 'Africa/Niamey'),
(46, 'Africa/Nouakchott'),
(47, 'Africa/Ouagadougou'),
(48, 'Africa/Porto-Novo'),
(49, 'Africa/Sao_Tome'),
(50, 'Africa/Tripoli'),
(51, 'Africa/Tunis'),
(52, 'Africa/Windhoek'),
(53, 'America/Adak'),
(54, 'America/Anchorage'),
(55, 'America/Anguilla'),
(56, 'America/Antigua'),
(57, 'America/Araguaina'),
(58, 'America/Argentina/Buenos_Aires'),
(59, 'America/Argentina/Catamarca'),
(60, 'America/Argentina/Cordoba'),
(61, 'America/Argentina/Jujuy'),
(62, 'America/Argentina/La_Rioja'),
(63, 'America/Argentina/Mendoza'),
(64, 'America/Argentina/Rio_Gallegos'),
(65, 'America/Argentina/Salta'),
(66, 'America/Argentina/San_Juan'),
(67, 'America/Argentina/San_Luis'),
(68, 'America/Argentina/Tucuman'),
(69, 'America/Argentina/Ushuaia'),
(70, 'America/Aruba'),
(71, 'America/Asuncion'),
(72, 'America/Atikokan'),
(73, 'America/Bahia'),
(74, 'America/Bahia_Banderas'),
(75, 'America/Barbados'),
(76, 'America/Belem'),
(77, 'America/Belize'),
(78, 'America/Blanc-Sablon'),
(79, 'America/Boa_Vista'),
(80, 'America/Bogota'),
(81, 'America/Boise'),
(82, 'America/Cambridge_Bay'),
(83, 'America/Campo_Grande'),
(84, 'America/Cancun'),
(85, 'America/Caracas'),
(86, 'America/Cayenne'),
(87, 'America/Cayman'),
(88, 'America/Chicago'),
(89, 'America/Chihuahua'),
(90, 'America/Ciudad_Juarez'),
(91, 'America/Costa_Rica'),
(92, 'America/Creston'),
(93, 'America/Cuiaba'),
(94, 'America/Curacao'),
(95, 'America/Danmarkshavn'),
(96, 'America/Dawson'),
(97, 'America/Dawson_Creek'),
(98, 'America/Denver'),
(99, 'America/Detroit'),
(100, 'America/Dominica'),
(101, 'America/Edmonton'),
(102, 'America/Eirunepe'),
(103, 'America/El_Salvador'),
(104, 'America/Fort_Nelson'),
(105, 'America/Fortaleza'),
(106, 'America/Glace_Bay'),
(107, 'America/Goose_Bay'),
(108, 'America/Grand_Turk'),
(109, 'America/Grenada'),
(110, 'America/Guadeloupe'),
(111, 'America/Guatemala'),
(112, 'America/Guayaquil'),
(113, 'America/Guyana'),
(114, 'America/Halifax'),
(115, 'America/Havana'),
(116, 'America/Hermosillo'),
(117, 'America/Indiana/Indianapolis'),
(118, 'America/Indiana/Knox'),
(119, 'America/Indiana/Marengo'),
(120, 'America/Indiana/Petersburg'),
(121, 'America/Indiana/Tell_City'),
(122, 'America/Indiana/Vevay'),
(123, 'America/Indiana/Vincennes'),
(124, 'America/Indiana/Winamac'),
(125, 'America/Inuvik'),
(126, 'America/Iqaluit'),
(127, 'America/Jamaica'),
(128, 'America/Juneau'),
(129, 'America/Kentucky/Louisville'),
(130, 'America/Kentucky/Monticello'),
(131, 'America/Kralendijk'),
(132, 'America/La_Paz'),
(133, 'America/Lima'),
(134, 'America/Los_Angeles'),
(135, 'America/Lower_Princes'),
(136, 'America/Maceio'),
(137, 'America/Managua'),
(138, 'America/Manaus'),
(139, 'America/Marigot'),
(140, 'America/Martinique'),
(141, 'America/Matamoros'),
(142, 'America/Mazatlan'),
(143, 'America/Menominee'),
(144, 'America/Merida'),
(145, 'America/Metlakatla'),
(146, 'America/Mexico_City'),
(147, 'America/Miquelon'),
(148, 'America/Moncton'),
(149, 'America/Monterrey'),
(150, 'America/Montevideo'),
(151, 'America/Montserrat'),
(152, 'America/Nassau'),
(153, 'America/New_York'),
(154, 'America/Nome'),
(155, 'America/Noronha'),
(156, 'America/North_Dakota/Beulah'),
(157, 'America/North_Dakota/Center'),
(158, 'America/North_Dakota/New_Salem'),
(159, 'America/Nuuk'),
(160, 'America/Ojinaga'),
(161, 'America/Panama'),
(162, 'America/Paramaribo'),
(163, 'America/Phoenix'),
(164, 'America/Port-au-Prince'),
(165, 'America/Port_of_Spain'),
(166, 'America/Porto_Velho'),
(167, 'America/Puerto_Rico'),
(168, 'America/Punta_Arenas'),
(169, 'America/Rankin_Inlet'),
(170, 'America/Recife'),
(171, 'America/Regina'),
(172, 'America/Resolute'),
(173, 'America/Rio_Branco'),
(174, 'America/Santarem'),
(175, 'America/Santiago'),
(176, 'America/Santo_Domingo'),
(177, 'America/Sao_Paulo'),
(178, 'America/Scoresbysund'),
(179, 'America/Sitka'),
(180, 'America/St_Barthelemy'),
(181, 'America/St_Johns'),
(182, 'America/St_Kitts'),
(183, 'America/St_Lucia'),
(184, 'America/St_Thomas'),
(185, 'America/St_Vincent'),
(186, 'America/Swift_Current'),
(187, 'America/Tegucigalpa'),
(188, 'America/Thule'),
(189, 'America/Tijuana'),
(190, 'America/Toronto'),
(191, 'America/Tortola'),
(192, 'America/Vancouver'),
(193, 'America/Whitehorse'),
(194, 'America/Winnipeg'),
(195, 'America/Yakutat'),
(196, 'Antarctica/Casey'),
(197, 'Antarctica/Davis'),
(198, 'Antarctica/DumontDUrville'),
(199, 'Antarctica/Macquarie'),
(200, 'Antarctica/Mawson'),
(201, 'Antarctica/McMurdo'),
(202, 'Antarctica/Palmer'),
(203, 'Antarctica/Rothera'),
(204, 'Antarctica/Syowa'),
(205, 'Antarctica/Troll'),
(206, 'Antarctica/Vostok'),
(207, 'Arctic/Longyearbyen'),
(208, 'Asia/Aden'),
(209, 'Asia/Almaty'),
(210, 'Asia/Amman'),
(211, 'Asia/Anadyr'),
(212, 'Asia/Aqtau'),
(213, 'Asia/Aqtobe'),
(214, 'Asia/Ashgabat'),
(215, 'Asia/Atyrau'),
(216, 'Asia/Baghdad'),
(217, 'Asia/Bahrain'),
(218, 'Asia/Baku'),
(219, 'Asia/Bangkok'),
(220, 'Asia/Barnaul'),
(221, 'Asia/Beirut'),
(222, 'Asia/Bishkek'),
(223, 'Asia/Brunei'),
(224, 'Asia/Chita'),
(225, 'Asia/Choibalsan'),
(226, 'Asia/Colombo'),
(227, 'Asia/Damascus'),
(228, 'Asia/Dhaka'),
(229, 'Asia/Dili'),
(230, 'Asia/Dubai'),
(231, 'Asia/Dushanbe'),
(232, 'Asia/Famagusta'),
(233, 'Asia/Gaza'),
(234, 'Asia/Hebron'),
(235, 'Asia/Ho_Chi_Minh'),
(236, 'Asia/Hong_Kong'),
(237, 'Asia/Hovd'),
(238, 'Asia/Irkutsk'),
(239, 'Asia/Jakarta'),
(240, 'Asia/Jayapura'),
(241, 'Asia/Jerusalem'),
(242, 'Asia/Kabul'),
(243, 'Asia/Kamchatka'),
(244, 'Asia/Karachi'),
(245, 'Asia/Kathmandu'),
(246, 'Asia/Khandyga'),
(247, 'Asia/Kolkata'),
(248, 'Asia/Krasnoyarsk'),
(249, 'Asia/Kuala_Lumpur'),
(250, 'Asia/Kuching'),
(251, 'Asia/Kuwait'),
(252, 'Asia/Macau'),
(253, 'Asia/Magadan'),
(254, 'Asia/Makassar'),
(255, 'Asia/Manila'),
(256, 'Asia/Muscat'),
(257, 'Asia/Nicosia'),
(258, 'Asia/Novokuznetsk'),
(259, 'Asia/Novosibirsk'),
(260, 'Asia/Omsk'),
(261, 'Asia/Oral'),
(262, 'Asia/Phnom_Penh'),
(263, 'Asia/Pontianak'),
(264, 'Asia/Pyongyang'),
(265, 'Asia/Qatar'),
(266, 'Asia/Qostanay'),
(267, 'Asia/Qyzylorda'),
(268, 'Asia/Riyadh'),
(269, 'Asia/Sakhalin'),
(270, 'Asia/Samarkand'),
(271, 'Asia/Seoul'),
(272, 'Asia/Shanghai'),
(273, 'Asia/Singapore'),
(274, 'Asia/Srednekolymsk'),
(275, 'Asia/Taipei'),
(276, 'Asia/Tashkent'),
(277, 'Asia/Tbilisi'),
(278, 'Asia/Tehran'),
(279, 'Asia/Thimphu'),
(280, 'Asia/Tokyo'),
(281, 'Asia/Tomsk'),
(282, 'Asia/Ulaanbaatar'),
(283, 'Asia/Urumqi'),
(284, 'Asia/Ust-Nera'),
(285, 'Asia/Vientiane'),
(286, 'Asia/Vladivostok'),
(287, 'Asia/Yakutsk'),
(288, 'Asia/Yangon'),
(289, 'Asia/Yekaterinburg'),
(290, 'Asia/Yerevan'),
(291, 'Atlantic/Azores'),
(292, 'Atlantic/Bermuda'),
(293, 'Atlantic/Canary'),
(294, 'Atlantic/Cape_Verde'),
(295, 'Atlantic/Faroe'),
(296, 'Atlantic/Madeira'),
(297, 'Atlantic/Reykjavik'),
(298, 'Atlantic/South_Georgia'),
(299, 'Atlantic/St_Helena'),
(300, 'Atlantic/Stanley'),
(301, 'Australia/Adelaide'),
(302, 'Australia/Brisbane'),
(303, 'Australia/Broken_Hill'),
(304, 'Australia/Darwin'),
(305, 'Australia/Eucla'),
(306, 'Australia/Hobart'),
(307, 'Australia/Lindeman'),
(308, 'Australia/Lord_Howe'),
(309, 'Australia/Melbourne'),
(310, 'Australia/Perth'),
(311, 'Australia/Sydney'),
(312, 'Europe/Amsterdam'),
(313, 'Europe/Andorra'),
(314, 'Europe/Astrakhan'),
(315, 'Europe/Athens'),
(316, 'Europe/Belgrade'),
(317, 'Europe/Berlin'),
(318, 'Europe/Bratislava'),
(319, 'Europe/Brussels'),
(320, 'Europe/Bucharest'),
(321, 'Europe/Budapest'),
(322, 'Europe/Busingen'),
(323, 'Europe/Chisinau'),
(324, 'Europe/Copenhagen'),
(325, 'Europe/Dublin'),
(326, 'Europe/Gibraltar'),
(327, 'Europe/Guernsey'),
(328, 'Europe/Helsinki'),
(329, 'Europe/Isle_of_Man'),
(330, 'Europe/Istanbul'),
(331, 'Europe/Jersey'),
(332, 'Europe/Kaliningrad'),
(333, 'Europe/Kirov'),
(334, 'Europe/Kyiv'),
(335, 'Europe/Lisbon'),
(336, 'Europe/Ljubljana'),
(337, 'Europe/London'),
(338, 'Europe/Luxembourg'),
(339, 'Europe/Madrid'),
(340, 'Europe/Malta'),
(341, 'Europe/Mariehamn'),
(342, 'Europe/Minsk'),
(343, 'Europe/Monaco'),
(344, 'Europe/Moscow'),
(345, 'Europe/Oslo'),
(346, 'Europe/Paris'),
(347, 'Europe/Podgorica'),
(348, 'Europe/Prague'),
(349, 'Europe/Riga'),
(350, 'Europe/Rome'),
(351, 'Europe/Samara'),
(352, 'Europe/San_Marino'),
(353, 'Europe/Sarajevo'),
(354, 'Europe/Saratov'),
(355, 'Europe/Simferopol'),
(356, 'Europe/Skopje'),
(357, 'Europe/Sofia'),
(358, 'Europe/Stockholm'),
(359, 'Europe/Tallinn'),
(360, 'Europe/Tirane'),
(361, 'Europe/Ulyanovsk'),
(362, 'Europe/Vaduz'),
(363, 'Europe/Vatican'),
(364, 'Europe/Vienna'),
(365, 'Europe/Vilnius'),
(366, 'Europe/Volgograd'),
(367, 'Europe/Warsaw'),
(368, 'Europe/Zagreb'),
(369, 'Europe/Zurich'),
(370, 'Indian/Antananarivo'),
(371, 'Indian/Chagos'),
(372, 'Indian/Christmas'),
(373, 'Indian/Cocos'),
(374, 'Indian/Comoro'),
(375, 'Indian/Kerguelen'),
(376, 'Indian/Mahe'),
(377, 'Indian/Maldives'),
(378, 'Indian/Mauritius'),
(379, 'Indian/Mayotte'),
(380, 'Indian/Reunion'),
(381, 'Pacific/Apia'),
(382, 'Pacific/Auckland'),
(383, 'Pacific/Bougainville'),
(384, 'Pacific/Chatham'),
(385, 'Pacific/Chuuk'),
(386, 'Pacific/Easter'),
(387, 'Pacific/Efate'),
(388, 'Pacific/Fakaofo'),
(389, 'Pacific/Fiji'),
(390, 'Pacific/Funafuti'),
(391, 'Pacific/Galapagos'),
(392, 'Pacific/Gambier'),
(393, 'Pacific/Guadalcanal'),
(394, 'Pacific/Guam'),
(395, 'Pacific/Honolulu'),
(396, 'Pacific/Kanton'),
(397, 'Pacific/Kiritimati'),
(398, 'Pacific/Kosrae'),
(399, 'Pacific/Kwajalein'),
(400, 'Pacific/Majuro'),
(401, 'Pacific/Marquesas'),
(402, 'Pacific/Midway'),
(403, 'Pacific/Nauru'),
(404, 'Pacific/Niue'),
(405, 'Pacific/Norfolk'),
(406, 'Pacific/Noumea'),
(407, 'Pacific/Pago_Pago'),
(408, 'Pacific/Palau'),
(409, 'Pacific/Pitcairn'),
(410, 'Pacific/Pohnpei'),
(411, 'Pacific/Port_Moresby'),
(412, 'Pacific/Rarotonga'),
(413, 'Pacific/Saipan'),
(414, 'Pacific/Tahiti'),
(415, 'Pacific/Tarawa'),
(416, 'Pacific/Tongatapu'),
(417, 'Pacific/Wake'),
(418, 'Pacific/Wallis'),
(419, 'UTC');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'backend/image/default.png',
  `role` enum('company','candidate') NOT NULL DEFAULT 'candidate',
  `recent_activities_alert` tinyint(1) NOT NULL DEFAULT 1,
  `job_expired_alert` tinyint(1) NOT NULL DEFAULT 1,
  `new_job_alert` tinyint(1) NOT NULL DEFAULT 1,
  `shortlisted_alert` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `is_demo_field` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_type` varchar(255) NOT NULL DEFAULT 'email',
  `google_id` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `email_verified_at`, `image`, `role`, `recent_activities_alert`, `job_expired_alert`, `new_job_alert`, `shortlisted_alert`, `status`, `is_demo_field`, `remember_token`, `created_at`, `updated_at`, `auth_type`, `google_id`, `facebook_id`, `provider`, `provider_id`) VALUES
(1, 'Talentspace.ai', 'omar', 'a@a.com', '$2y$10$Y7esi5YbhQGoOdQBiZUoI.BLjrflP.FjQF3gvLXjJMjVVZTxc9lDS', '2023-11-19 14:12:57', 'backend/image/default.png', 'company', 1, 1, 1, 1, 1, 0, NULL, '2023-11-19 14:07:16', '2023-11-19 17:27:16', 'email', NULL, NULL, NULL, NULL),
(2, 'ahmed', 'ahmed', 'ahmed@gmail.com', '$2y$10$ECnbn5yOdY5P8CisHAYANejSVcvAwCV2QrF8l0TxHCZljWEYygGQK', '2023-11-19 17:46:48', 'backend/image/default.png', 'candidate', 1, 1, 1, 1, 1, 0, NULL, '2023-11-19 14:59:18', '2023-11-19 17:46:48', 'email', NULL, NULL, NULL, NULL),
(3, 'belal', 'lana', 'lana@gmail.com', '$2y$10$xcv9nnq36NzGTDJUGYHVFepvJjhJmSHmjtsLK53ZZvfqJye9LosSu', '2023-11-19 17:46:44', 'backend/image/default.png', 'candidate', 1, 1, 1, 1, 1, 0, NULL, '2023-11-19 17:20:20', '2023-11-19 17:46:44', 'email', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_plans`
--

CREATE TABLE `user_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` bigint(20) UNSIGNED NOT NULL,
  `job_limit` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `featured_job_limit` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `highlight_job_limit` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `candidate_cv_view_limit` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `candidate_cv_view_limitation` enum('unlimited','limited') NOT NULL DEFAULT 'limited'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_plans`
--

INSERT INTO `user_plans` (`id`, `company_id`, `plan_id`, `job_limit`, `featured_job_limit`, `highlight_job_limit`, `candidate_cv_view_limit`, `created_at`, `updated_at`, `candidate_cv_view_limitation`) VALUES
(1, 1, 1, 1, 1, 1, 3, '2023-11-19 16:13:28', '2023-11-19 16:13:28', 'limited');

-- --------------------------------------------------------

--
-- Table structure for table `verification_codes`
--

CREATE TABLE `verification_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('reset_password','email_verify') NOT NULL,
  `expire_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `website_settings`
--

CREATE TABLE `website_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map_address` text NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `live_job` text NOT NULL,
  `companies` text NOT NULL,
  `candidates` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_settings`
--

INSERT INTO `website_settings` (`id`, `phone`, `address`, `map_address`, `facebook`, `instagram`, `twitter`, `youtube`, `title`, `sub_title`, `description`, `live_job`, `companies`, `candidates`, `created_at`, `updated_at`) VALUES
(1, '(319) 555-0115', 'Discover tailored opportunities for job seekers and top talent for employers', 'Zakir Soft Map', 'https://www.facebook.com/zakirsoft', 'https://www.instagram.com/zakirsoft', 'https://www.twitter.com/zakirsoft', 'https://www.youtube.com/zakirsoft', 'Who we are', 'We’re highly skilled and professionals team.', 'Praesent non sem facilisis, hendrerit nisi vitae, volutpat quam. Aliquam metus mauris, semper eu eros vitae, blandit tristique metus. Vestibulum maximus nec justo sed maximus.', '175,324', '97,354', '3,847,154', '2023-09-13 02:49:38', '2023-09-13 02:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `your_table_name`
--

CREATE TABLE `your_table_name` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `your_table_name`
--

INSERT INTO `your_table_name` (`id`, `name`, `email`, `image`, `bio`) VALUES
(1, 'Loraine Lindsay', 'lorainelindsay.com', 'dummy-data/images/candidates/candidate-01.jpg', 'Hi I am Loraine. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(2, 'Rakibul Islam', 'rakib@mail.com', 'dummy-data/images/candidates/candidate-02.jpg', 'Hi I am Rakibul Islam. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(3, 'Armaan Malik', 'arman@mail.com', 'dummy-data/images/candidates/candidate-03.jpg', 'Hi I am Armaan. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(4, 'Ariful Islam', 'arif@mail.com', 'dummy-data/images/candidates/candidate-04.jpg', 'Hi I am Ariful Islam. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(5, 'Hasibur Rahman', 'hasib@mail.com', 'dummy-data/images/candidates/candidate-05.jpg', 'Hi I am Hasibur Rahman. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(6, 'Khalilur Rahman', 'Khalil@mail.com', 'dummy-data/images/candidates/candidate-06.jpg', 'Hi I am Khalil. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(7, 'Partho Borai', 'partho@mail.com', 'dummy-data/images/candidates/candidate-07.jpg', 'Hi I am Partho. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(8, 'Solaiman Hossen', 'solaiman@mail.com', 'dummy-data/images/candidates/candidate-08.jpg', 'Hi I am Solaiman. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(9, 'Zahidul Islam', 'zahid@mail.com', 'dummy-data/images/candidates/candidate-09.jpg', 'Hi I am Zahid. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(10, 'Sheikh Rashed', 'rashed@mail.com', 'dummy-data/images/candidates/candidate-10.jpg', 'Hi I am Rashed. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(11, 'Jihadul Islam', 'jihad@mail.com', 'dummy-data/images/candidates/candidate-11.jpg', 'Hi I am Jihad. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(12, 'Riyad Hossain', 'riyad@mail.com', 'dummy-data/images/candidates/candidate-12.jpg', 'Hi I am Riyad Hossain. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(13, 'Ibnu mahtab', 'mahtab@mail.com', 'dummy-data/images/candidates/candidate-13.jpg', 'Hi I am Ibnu Mahtab. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(14, 'Mahfuzur Rahman', 'mahfuj@mail.com', 'dummy-data/images/candidates/candidate-14.jpg', 'Hi I am Mahfujur Rahman. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(15, 'Abdullah', 'abdullah@mail.com', 'dummy-data/images/candidates/candidate-15.jpg', 'Hi I am Abdullah. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(16, 'Masum Billah', 'manusm@mail.com', 'dummy-data/images/candidates/candidate-16.jpg', 'Hi I am Masum. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(17, 'Zafor Iqbal', 'zafor@mail.com', 'dummy-data/images/candidates/candidate-17.jpg', 'Hi I am Zafor Iqbal. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(18, 'Rasel Rana', 'rasel@mail.com', 'dummy-data/images/candidates/candidate-18.jpg', 'Hi I am Rasel Rana. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(19, 'Mizanur Rahman', 'mizan@mail.com', 'dummy-data/images/candidates/candidate-19.jpg', 'Hi I am Mizanur Rahman. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(20, 'Mohammad Aslam', 'aslam@mail.com', 'dummy-data/images/candidates/candidate-20.jpg', 'Hi I am Mohammad Aslam. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(21, 'Lotika Rana', 'lotika@mail.com', 'dummy-data/images/candidates/candidate-01.jpg', 'Hi I am Lotika. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(22, 'Ariful Islam', 'ariful@mail.com', 'dummy-data/images/candidates/candidate-02.jpg', 'Hi I am Ariful Islam. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(23, 'Manus Islam', 'masud@mail.com', 'dummy-data/images/candidates/candidate-03.jpg', 'Hi I am Masud. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(24, 'Rakibul Islam', 'rakibul@mail.com', 'dummy-data/images/candidates/candidate-04.jpg', 'Hi I am Loraine. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(25, 'Nazmul Hosaain', 'nazmul@mail.com', 'dummy-data/images/candidates/candidate-05.jpg', 'Hi I am Nazmul. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(26, 'Afif Hossain', 'afif@mail.com', 'dummy-data/images/candidates/candidate-06.jpg', 'Hi I am Afif Hossain. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(27, 'Liton Das', 'litondas@mail.com', 'dummy-data/images/candidates/candidate-07.jpg', 'Hi I am Liton Das. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(28, 'Mushfiqur Rahim', 'musfiq@mail.com', 'dummy-data/images/candidates/candidate-08.jpg', 'Hi I am Mushfiqur Rahim. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(29, 'Sakib Al Hasan', 'sakib@mail.com', 'dummy-data/images/candidates/candidate-09.jpg', 'Hi I am Sakib Al Hasan. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(30, 'Mehedi Hasan', 'mehedi@mail.com', 'dummy-data/images/candidates/candidate-10.jpg', 'Hi I am Mehedi Hassan. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(31, 'Loraine Lindsay', 'lorainelindsay.com', 'dummy-data/images/candidates/candidate-01.jpg', 'Hi I am Loraine. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(32, 'Rakibul Islam', 'rakib@mail.com', 'dummy-data/images/candidates/candidate-02.jpg', 'Hi I am Rakibul Islam. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(33, 'Armaan Malik', 'arman@mail.com', 'dummy-data/images/candidates/candidate-03.jpg', 'Hi I am Armaan. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(34, 'Ariful Islam', 'arif@mail.com', 'dummy-data/images/candidates/candidate-04.jpg', 'Hi I am Ariful Islam. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(35, 'Hasibur Rahman', 'hasib@mail.com', 'dummy-data/images/candidates/candidate-05.jpg', 'Hi I am Hasibur Rahman. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(36, 'Khalilur Rahman', 'Khalil@mail.com', 'dummy-data/images/candidates/candidate-06.jpg', 'Hi I am Khalil. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(37, 'Partho Borai', 'partho@mail.com', 'dummy-data/images/candidates/candidate-07.jpg', 'Hi I am Partho. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(38, 'Solaiman Hossen', 'solaiman@mail.com', 'dummy-data/images/candidates/candidate-08.jpg', 'Hi I am Solaiman. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(39, 'Zahidul Islam', 'zahid@mail.com', 'dummy-data/images/candidates/candidate-09.jpg', 'Hi I am Zahid. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(40, 'Sheikh Rashed', 'rashed@mail.com', 'dummy-data/images/candidates/candidate-10.jpg', 'Hi I am Rashed. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(41, 'Jihadul Islam', 'jihad@mail.com', 'dummy-data/images/candidates/candidate-11.jpg', 'Hi I am Jihad. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(42, 'Riyad Hossain', 'riyad@mail.com', 'dummy-data/images/candidates/candidate-12.jpg', 'Hi I am Riyad Hossain. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(43, 'Ibnu mahtab', 'mahtab@mail.com', 'dummy-data/images/candidates/candidate-13.jpg', 'Hi I am Ibnu Mahtab. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(44, 'Mahfuzur Rahman', 'mahfuj@mail.com', 'dummy-data/images/candidates/candidate-14.jpg', 'Hi I am Mahfujur Rahman. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(45, 'Abdullah', 'abdullah@mail.com', 'dummy-data/images/candidates/candidate-15.jpg', 'Hi I am Abdullah. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(46, 'Masum Billah', 'manusm@mail.com', 'dummy-data/images/candidates/candidate-16.jpg', 'Hi I am Masum. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(47, 'Zafor Iqbal', 'zafor@mail.com', 'dummy-data/images/candidates/candidate-17.jpg', 'Hi I am Zafor Iqbal. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(48, 'Rasel Rana', 'rasel@mail.com', 'dummy-data/images/candidates/candidate-18.jpg', 'Hi I am Rasel Rana. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(49, 'Mizanur Rahman', 'mizan@mail.com', 'dummy-data/images/candidates/candidate-19.jpg', 'Hi I am Mizanur Rahman. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(50, 'Mohammad Aslam', 'aslam@mail.com', 'dummy-data/images/candidates/candidate-20.jpg', 'Hi I am Mohammad Aslam. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(51, 'Lotika Rana', 'lotika@mail.com', 'dummy-data/images/candidates/candidate-01.jpg', 'Hi I am Lotika. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(52, 'Ariful Islam', 'ariful@mail.com', 'dummy-data/images/candidates/candidate-02.jpg', 'Hi I am Ariful Islam. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(53, 'Manus Islam', 'masud@mail.com', 'dummy-data/images/candidates/candidate-03.jpg', 'Hi I am Masud. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(54, 'Rakibul Islam', 'rakibul@mail.com', 'dummy-data/images/candidates/candidate-04.jpg', 'Hi I am Loraine. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(55, 'Nazmul Hosaain', 'nazmul@mail.com', 'dummy-data/images/candidates/candidate-05.jpg', 'Hi I am Nazmul. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(56, 'Afif Hossain', 'afif@mail.com', 'dummy-data/images/candidates/candidate-06.jpg', 'Hi I am Afif Hossain. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(57, 'Liton Das', 'litondas@mail.com', 'dummy-data/images/candidates/candidate-07.jpg', 'Hi I am Liton Das. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(58, 'Mushfiqur Rahim', 'musfiq@mail.com', 'dummy-data/images/candidates/candidate-08.jpg', 'Hi I am Mushfiqur Rahim. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(59, 'Sakib Al Hasan', 'sakib@mail.com', 'dummy-data/images/candidates/candidate-09.jpg', 'Hi I am Sakib Al Hasan. I am PHP expert and I am working as a full-stack developer in templatecookie'),
(60, 'Mehedi Hasan', 'mehedi@mail.com', 'dummy-data/images/candidates/candidate-10.jpg', 'Hi I am Mehedi Hassan. I am PHP expert and I am working as a full-stack developer in templatecookie');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abouts`
--
ALTER TABLE `abouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_searches`
--
ALTER TABLE `admin_searches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `application_groups`
--
ALTER TABLE `application_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_groups_company_id_foreign` (`company_id`);

--
-- Indexes for table `applied_jobs`
--
ALTER TABLE `applied_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applied_jobs_candidate_id_foreign` (`candidate_id`),
  ADD KEY `applied_jobs_job_id_foreign` (`job_id`),
  ADD KEY `applied_jobs_candidate_resume_id_foreign` (`candidate_resume_id`),
  ADD KEY `applied_jobs_application_group_id_foreign` (`application_group_id`);

--
-- Indexes for table `benefits`
--
ALTER TABLE `benefits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `benefit_translations`
--
ALTER TABLE `benefit_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `benefit_translations_benefit_id_foreign` (`benefit_id`);

--
-- Indexes for table `bookmark_candidate_company`
--
ALTER TABLE `bookmark_candidate_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookmark_candidate_company_candidate_id_foreign` (`candidate_id`),
  ADD KEY `bookmark_candidate_company_company_id_foreign` (`company_id`);

--
-- Indexes for table `bookmark_candidate_job`
--
ALTER TABLE `bookmark_candidate_job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookmark_candidate_job_candidate_id_foreign` (`candidate_id`),
  ADD KEY `bookmark_candidate_job_job_id_foreign` (`job_id`);

--
-- Indexes for table `bookmark_company`
--
ALTER TABLE `bookmark_company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookmark_company_company_id_foreign` (`company_id`),
  ADD KEY `bookmark_company_candidate_id_foreign` (`candidate_id`),
  ADD KEY `bookmark_company_category_id_foreign` (`category_id`);

--
-- Indexes for table `bookmark_company_category`
--
ALTER TABLE `bookmark_company_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookmark_company_category_bookmark_id_foreign` (`bookmark_id`),
  ADD KEY `bookmark_company_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidates_user_id_foreign` (`user_id`),
  ADD KEY `candidates_role_id_foreign` (`role_id`),
  ADD KEY `candidates_profession_id_foreign` (`profession_id`),
  ADD KEY `candidates_experience_id_foreign` (`experience_id`),
  ADD KEY `candidates_education_id_foreign` (`education_id`);

--
-- Indexes for table `candidate_cv_views`
--
ALTER TABLE `candidate_cv_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_cv_views_company_id_foreign` (`company_id`),
  ADD KEY `candidate_cv_views_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `candidate_education`
--
ALTER TABLE `candidate_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_education_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `candidate_experiences`
--
ALTER TABLE `candidate_experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_experiences_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `candidate_job_alerts`
--
ALTER TABLE `candidate_job_alerts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_job_alerts_candidate_id_foreign` (`candidate_id`),
  ADD KEY `candidate_job_alerts_job_role_id_foreign` (`job_role_id`);

--
-- Indexes for table `candidate_language`
--
ALTER TABLE `candidate_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_language_candidate_id_foreign` (`candidate_id`),
  ADD KEY `candidate_language_candidate_language_id_foreign` (`candidate_language_id`);

--
-- Indexes for table `candidate_languages`
--
ALTER TABLE `candidate_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidate_resumes`
--
ALTER TABLE `candidate_resumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_resumes_candidate_id_foreign` (`candidate_id`);

--
-- Indexes for table `candidate_skill`
--
ALTER TABLE `candidate_skill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candidate_skill_candidate_id_foreign` (`candidate_id`),
  ADD KEY `candidate_skill_skill_id_foreign` (`skill_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_contents`
--
ALTER TABLE `cms_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `companies_user_id_foreign` (`user_id`),
  ADD KEY `companies_industry_type_id_foreign` (`industry_type_id`),
  ADD KEY `companies_organization_type_id_foreign` (`organization_type_id`),
  ADD KEY `companies_team_size_id_foreign` (`team_size_id`);

--
-- Indexes for table `company_applied_job_rejected`
--
ALTER TABLE `company_applied_job_rejected`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_applied_job_rejected_company_id_foreign` (`company_id`),
  ADD KEY `company_applied_job_rejected_applied_job_id_foreign` (`applied_job_id`);

--
-- Indexes for table `company_applied_job_shortlist`
--
ALTER TABLE `company_applied_job_shortlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_applied_job_shortlist_company_id_foreign` (`company_id`),
  ADD KEY `company_applied_job_shortlist_applied_job_id_foreign` (`applied_job_id`);

--
-- Indexes for table `company_bookmark_categories`
--
ALTER TABLE `company_bookmark_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_bookmark_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `company_questions`
--
ALTER TABLE `company_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_questions_company_id_foreign` (`company_id`);

--
-- Indexes for table `company_question_job`
--
ALTER TABLE `company_question_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_infos`
--
ALTER TABLE `contact_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_infos_user_id_foreign` (`user_id`);

--
-- Indexes for table `cookies`
--
ALTER TABLE `cookies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `earnings_company_id_foreign` (`company_id`),
  ADD KEY `earnings_manual_payment_id_foreign` (`manual_payment_id`),
  ADD KEY `earnings_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emails_email_unique` (`email`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiences`
--
ALTER TABLE `experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faq_categories_name_unique` (`name`),
  ADD UNIQUE KEY `faq_categories_slug_unique` (`slug`);

--
-- Indexes for table `industry_types`
--
ALTER TABLE `industry_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `industry_type_translations`
--
ALTER TABLE `industry_type_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `industry_type_translations_industry_type_id_foreign` (`industry_type_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_company_id_foreign` (`company_id`),
  ADD KEY `jobs_category_id_foreign` (`category_id`),
  ADD KEY `jobs_role_id_foreign` (`role_id`),
  ADD KEY `jobs_experience_id_foreign` (`experience_id`),
  ADD KEY `jobs_education_id_foreign` (`education_id`),
  ADD KEY `jobs_job_type_id_foreign` (`job_type_id`),
  ADD KEY `jobs_salary_type_id_foreign` (`salary_type_id`);

--
-- Indexes for table `job_benefit`
--
ALTER TABLE `job_benefit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_benefit_job_id_foreign` (`job_id`),
  ADD KEY `job_benefit_benefit_id_foreign` (`benefit_id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_categories_slug_unique` (`slug`);

--
-- Indexes for table `job_category_translations`
--
ALTER TABLE `job_category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_category_translations_job_category_id_foreign` (`job_category_id`);

--
-- Indexes for table `job_roles`
--
ALTER TABLE `job_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_role_translations`
--
ALTER TABLE `job_role_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_role_translations_job_role_id_foreign` (`job_role_id`);

--
-- Indexes for table `job_skills`
--
ALTER TABLE `job_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_skills_job_id_foreign` (`job_id`),
  ADD KEY `job_skills_skill_id_foreign` (`skill_id`);

--
-- Indexes for table `job_tag`
--
ALTER TABLE `job_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_tag_job_id_foreign` (`job_id`),
  ADD KEY `job_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `job_types`
--
ALTER TABLE `job_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_name_unique` (`name`),
  ADD UNIQUE KEY `languages_code_unique` (`code`),
  ADD UNIQUE KEY `languages_icon_unique` (`icon`);

--
-- Indexes for table `language_data`
--
ALTER TABLE `language_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manual_payments`
--
ALTER TABLE `manual_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `menu_settings`
--
ALTER TABLE `menu_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_settings_translations`
--
ALTER TABLE `menu_settings_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_settings_translations_menu_settings_id_foreign` (`menu_settings_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `nationalities`
--
ALTER TABLE `nationalities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organization_types`
--
ALTER TABLE `organization_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organization_type_translations`
--
ALTER TABLE `organization_type_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_type_translations_organization_type_id_foreign` (`organization_type_id`);

--
-- Indexes for table `our_missions`
--
ALTER TABLE `our_missions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_label_unique` (`label`);

--
-- Indexes for table `plan_descriptions`
--
ALTER TABLE `plan_descriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_descriptions_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_author_id_foreign` (`author_id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_author_id_foreign` (`author_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profession_translations`
--
ALTER TABLE `profession_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profession_translations_profession_id_foreign` (`profession_id`);

--
-- Indexes for table `queue_jobs`
--
ALTER TABLE `queue_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue_jobs_queue_index` (`queue`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `salary_types`
--
ALTER TABLE `salary_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seos`
--
ALTER TABLE `seos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_page_contents`
--
ALTER TABLE `seo_page_contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seo_page_contents_page_id_foreign` (`page_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_app_country_foreign` (`app_country`);

--
-- Indexes for table `setup_guides`
--
ALTER TABLE `setup_guides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skill_translations`
--
ALTER TABLE `skill_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skill_translations_skill_id_foreign` (`skill_id`);

--
-- Indexes for table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_links_user_id_foreign` (`user_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag_translations`
--
ALTER TABLE `tag_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_translations_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `team_sizes`
--
ALTER TABLE `team_sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms_categories`
--
ALTER TABLE `terms_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timezones`
--
ALTER TABLE `timezones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_plans`
--
ALTER TABLE `user_plans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_plans_company_id_foreign` (`company_id`),
  ADD KEY `user_plans_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `verification_codes`
--
ALTER TABLE `verification_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verification_codes_user_id_foreign` (`user_id`);

--
-- Indexes for table `website_settings`
--
ALTER TABLE `website_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `your_table_name`
--
ALTER TABLE `your_table_name`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abouts`
--
ALTER TABLE `abouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_searches`
--
ALTER TABLE `admin_searches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `application_groups`
--
ALTER TABLE `application_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `applied_jobs`
--
ALTER TABLE `applied_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `benefits`
--
ALTER TABLE `benefits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `benefit_translations`
--
ALTER TABLE `benefit_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bookmark_candidate_company`
--
ALTER TABLE `bookmark_candidate_company`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmark_candidate_job`
--
ALTER TABLE `bookmark_candidate_job`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmark_company`
--
ALTER TABLE `bookmark_company`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bookmark_company_category`
--
ALTER TABLE `bookmark_company_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `candidate_cv_views`
--
ALTER TABLE `candidate_cv_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidate_education`
--
ALTER TABLE `candidate_education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidate_experiences`
--
ALTER TABLE `candidate_experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidate_job_alerts`
--
ALTER TABLE `candidate_job_alerts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `candidate_language`
--
ALTER TABLE `candidate_language`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidate_languages`
--
ALTER TABLE `candidate_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT for table `candidate_resumes`
--
ALTER TABLE `candidate_resumes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `candidate_skill`
--
ALTER TABLE `candidate_skill`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_contents`
--
ALTER TABLE `cms_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_applied_job_rejected`
--
ALTER TABLE `company_applied_job_rejected`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_applied_job_shortlist`
--
ALTER TABLE `company_applied_job_shortlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_bookmark_categories`
--
ALTER TABLE `company_bookmark_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_questions`
--
ALTER TABLE `company_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_question_job`
--
ALTER TABLE `company_question_job`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_infos`
--
ALTER TABLE `contact_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cookies`
--
ALTER TABLE `cookies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `experiences`
--
ALTER TABLE `experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `industry_types`
--
ALTER TABLE `industry_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `industry_type_translations`
--
ALTER TABLE `industry_type_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_benefit`
--
ALTER TABLE `job_benefit`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `job_category_translations`
--
ALTER TABLE `job_category_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `job_roles`
--
ALTER TABLE `job_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `job_role_translations`
--
ALTER TABLE `job_role_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `job_skills`
--
ALTER TABLE `job_skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_tag`
--
ALTER TABLE `job_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_types`
--
ALTER TABLE `job_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `language_data`
--
ALTER TABLE `language_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `manual_payments`
--
ALTER TABLE `manual_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_settings`
--
ALTER TABLE `menu_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `menu_settings_translations`
--
ALTER TABLE `menu_settings_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT for table `nationalities`
--
ALTER TABLE `nationalities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organization_types`
--
ALTER TABLE `organization_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `organization_type_translations`
--
ALTER TABLE `organization_type_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `our_missions`
--
ALTER TABLE `our_missions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `plan_descriptions`
--
ALTER TABLE `plan_descriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `professions`
--
ALTER TABLE `professions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `profession_translations`
--
ALTER TABLE `profession_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `queue_jobs`
--
ALTER TABLE `queue_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salary_types`
--
ALTER TABLE `salary_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seos`
--
ALTER TABLE `seos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `seo_page_contents`
--
ALTER TABLE `seo_page_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setup_guides`
--
ALTER TABLE `setup_guides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT for table `skill_translations`
--
ALTER TABLE `skill_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT for table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tag_translations`
--
ALTER TABLE `tag_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `team_sizes`
--
ALTER TABLE `team_sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `terms_categories`
--
ALTER TABLE `terms_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_settings`
--
ALTER TABLE `theme_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timezones`
--
ALTER TABLE `timezones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_plans`
--
ALTER TABLE `user_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `verification_codes`
--
ALTER TABLE `verification_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `website_settings`
--
ALTER TABLE `website_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `your_table_name`
--
ALTER TABLE `your_table_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `application_groups`
--
ALTER TABLE `application_groups`
  ADD CONSTRAINT `application_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `applied_jobs`
--
ALTER TABLE `applied_jobs`
  ADD CONSTRAINT `applied_jobs_application_group_id_foreign` FOREIGN KEY (`application_group_id`) REFERENCES `application_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applied_jobs_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applied_jobs_candidate_resume_id_foreign` FOREIGN KEY (`candidate_resume_id`) REFERENCES `candidate_resumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `applied_jobs_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `benefit_translations`
--
ALTER TABLE `benefit_translations`
  ADD CONSTRAINT `benefit_translations_benefit_id_foreign` FOREIGN KEY (`benefit_id`) REFERENCES `benefits` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookmark_candidate_company`
--
ALTER TABLE `bookmark_candidate_company`
  ADD CONSTRAINT `bookmark_candidate_company_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmark_candidate_company_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookmark_candidate_job`
--
ALTER TABLE `bookmark_candidate_job`
  ADD CONSTRAINT `bookmark_candidate_job_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmark_candidate_job_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookmark_company`
--
ALTER TABLE `bookmark_company`
  ADD CONSTRAINT `bookmark_company_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmark_company_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `company_bookmark_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmark_company_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookmark_company_category`
--
ALTER TABLE `bookmark_company_category`
  ADD CONSTRAINT `bookmark_company_category_bookmark_id_foreign` FOREIGN KEY (`bookmark_id`) REFERENCES `bookmark_company` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookmark_company_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `company_bookmark_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `candidates`
--
ALTER TABLE `candidates`
  ADD CONSTRAINT `candidates_education_id_foreign` FOREIGN KEY (`education_id`) REFERENCES `education` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidates_experience_id_foreign` FOREIGN KEY (`experience_id`) REFERENCES `experiences` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidates_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidates_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `candidate_cv_views`
--
ALTER TABLE `candidate_cv_views`
  ADD CONSTRAINT `candidate_cv_views_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`),
  ADD CONSTRAINT `candidate_cv_views_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `candidate_education`
--
ALTER TABLE `candidate_education`
  ADD CONSTRAINT `candidate_education_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `candidate_experiences`
--
ALTER TABLE `candidate_experiences`
  ADD CONSTRAINT `candidate_experiences_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `candidate_job_alerts`
--
ALTER TABLE `candidate_job_alerts`
  ADD CONSTRAINT `candidate_job_alerts_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidate_job_alerts_job_role_id_foreign` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `candidate_language`
--
ALTER TABLE `candidate_language`
  ADD CONSTRAINT `candidate_language_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidate_language_candidate_language_id_foreign` FOREIGN KEY (`candidate_language_id`) REFERENCES `candidate_languages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `candidate_resumes`
--
ALTER TABLE `candidate_resumes`
  ADD CONSTRAINT `candidate_resumes_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `candidate_skill`
--
ALTER TABLE `candidate_skill`
  ADD CONSTRAINT `candidate_skill_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `candidate_skill_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_industry_type_id_foreign` FOREIGN KEY (`industry_type_id`) REFERENCES `industry_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `companies_organization_type_id_foreign` FOREIGN KEY (`organization_type_id`) REFERENCES `organization_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `companies_team_size_id_foreign` FOREIGN KEY (`team_size_id`) REFERENCES `team_sizes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `companies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `company_applied_job_rejected`
--
ALTER TABLE `company_applied_job_rejected`
  ADD CONSTRAINT `company_applied_job_rejected_applied_job_id_foreign` FOREIGN KEY (`applied_job_id`) REFERENCES `applied_jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `company_applied_job_rejected_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `company_applied_job_shortlist`
--
ALTER TABLE `company_applied_job_shortlist`
  ADD CONSTRAINT `company_applied_job_shortlist_applied_job_id_foreign` FOREIGN KEY (`applied_job_id`) REFERENCES `applied_jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `company_applied_job_shortlist_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `company_bookmark_categories`
--
ALTER TABLE `company_bookmark_categories`
  ADD CONSTRAINT `company_bookmark_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `company_questions`
--
ALTER TABLE `company_questions`
  ADD CONSTRAINT `company_questions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `contact_infos`
--
ALTER TABLE `contact_infos`
  ADD CONSTRAINT `contact_infos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `earnings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `earnings_manual_payment_id_foreign` FOREIGN KEY (`manual_payment_id`) REFERENCES `manual_payments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `earnings_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `industry_type_translations`
--
ALTER TABLE `industry_type_translations`
  ADD CONSTRAINT `industry_type_translations_industry_type_id_foreign` FOREIGN KEY (`industry_type_id`) REFERENCES `industry_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobs_education_id_foreign` FOREIGN KEY (`education_id`) REFERENCES `education` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobs_experience_id_foreign` FOREIGN KEY (`experience_id`) REFERENCES `experiences` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobs_job_type_id_foreign` FOREIGN KEY (`job_type_id`) REFERENCES `job_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobs_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jobs_salary_type_id_foreign` FOREIGN KEY (`salary_type_id`) REFERENCES `salary_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_benefit`
--
ALTER TABLE `job_benefit`
  ADD CONSTRAINT `job_benefit_benefit_id_foreign` FOREIGN KEY (`benefit_id`) REFERENCES `benefits` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_benefit_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_category_translations`
--
ALTER TABLE `job_category_translations`
  ADD CONSTRAINT `job_category_translations_job_category_id_foreign` FOREIGN KEY (`job_category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_role_translations`
--
ALTER TABLE `job_role_translations`
  ADD CONSTRAINT `job_role_translations_job_role_id_foreign` FOREIGN KEY (`job_role_id`) REFERENCES `job_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_skills`
--
ALTER TABLE `job_skills`
  ADD CONSTRAINT `job_skills_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_skills_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_tag`
--
ALTER TABLE `job_tag`
  ADD CONSTRAINT `job_tag_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `job_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_settings_translations`
--
ALTER TABLE `menu_settings_translations`
  ADD CONSTRAINT `menu_settings_translations_menu_settings_id_foreign` FOREIGN KEY (`menu_settings_id`) REFERENCES `menu_settings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `organization_type_translations`
--
ALTER TABLE `organization_type_translations`
  ADD CONSTRAINT `organization_type_translations_organization_type_id_foreign` FOREIGN KEY (`organization_type_id`) REFERENCES `organization_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plan_descriptions`
--
ALTER TABLE `plan_descriptions`
  ADD CONSTRAINT `plan_descriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `post_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profession_translations`
--
ALTER TABLE `profession_translations`
  ADD CONSTRAINT `profession_translations_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `seo_page_contents`
--
ALTER TABLE `seo_page_contents`
  ADD CONSTRAINT `seo_page_contents_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `seos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_app_country_foreign` FOREIGN KEY (`app_country`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `skill_translations`
--
ALTER TABLE `skill_translations`
  ADD CONSTRAINT `skill_translations_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_links`
--
ALTER TABLE `social_links`
  ADD CONSTRAINT `social_links_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tag_translations`
--
ALTER TABLE `tag_translations`
  ADD CONSTRAINT `tag_translations_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_plans`
--
ALTER TABLE `user_plans`
  ADD CONSTRAINT `user_plans_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_plans_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verification_codes`
--
ALTER TABLE `verification_codes`
  ADD CONSTRAINT `verification_codes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

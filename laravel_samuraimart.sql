-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost:8889
-- 生成日時: 2025 年 6 月 09 日 08:01
-- サーバのバージョン： 5.7.39
-- PHP のバージョン: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `laravel_samuraimart`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 0, 'カテゴリー', 'fa-bars', 'categories', NULL, '2025-06-06 07:46:44', '2025-06-06 07:46:44'),
(9, 0, 0, '商品', 'fa-bars', 'products', NULL, '2025-06-06 09:18:22', '2025-06-06 09:18:22'),
(10, 0, 0, '親カテゴリー', 'fa-bars', 'major-categories', NULL, '2025-06-08 05:53:44', '2025-06-08 05:53:44'),
(11, 0, 0, 'ユーザー', 'fa-bars', 'users', NULL, '2025-06-08 05:55:22', '2025-06-08 05:55:22');

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '::1', '[]', '2025-06-06 07:41:40', '2025-06-06 07:41:40'),
(2, 1, 'admin', 'GET', '::1', '[]', '2025-06-06 07:44:33', '2025-06-06 07:44:33'),
(3, 1, 'admin', 'GET', '::1', '[]', '2025-06-06 07:44:36', '2025-06-06 07:44:36'),
(4, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 07:44:53', '2025-06-06 07:44:53'),
(5, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u30ab\\u30c6\\u30b4\\u30ea\\u30fc\",\"icon\":\"fa-bars\",\"uri\":\"categories\",\"roles\":[null],\"permission\":null,\"_token\":\"OlkCscuxSetARQA6nXWzrWjuin4ChVAW7biYfkjH\"}', '2025-06-06 07:46:44', '2025-06-06 07:46:44'),
(6, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-06-06 07:46:44', '2025-06-06 07:46:44'),
(7, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-06-06 07:47:24', '2025-06-06 07:47:24'),
(8, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 07:47:49', '2025-06-06 07:47:49'),
(9, 1, 'admin/categories', 'GET', '::1', '[]', '2025-06-06 07:50:42', '2025-06-06 07:50:42'),
(10, 1, 'admin/categories', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2025-06-06 07:51:05', '2025-06-06 07:51:05'),
(11, 1, 'admin/categories', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2025-06-06 07:51:07', '2025-06-06 07:51:07'),
(12, 1, 'admin/categories', 'GET', '::1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2025-06-06 07:51:10', '2025-06-06 07:51:10'),
(13, 1, 'admin/categories', 'GET', '::1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2025-06-06 07:51:12', '2025-06-06 07:51:12'),
(14, 1, 'admin/categories', 'GET', '::1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2025-06-06 07:51:20', '2025-06-06 07:51:20'),
(15, 1, 'admin/categories', 'GET', '::1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2025-06-06 07:51:23', '2025-06-06 07:51:23'),
(16, 1, 'admin/categories', 'GET', '::1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"}}', '2025-06-06 07:53:42', '2025-06-06 07:53:42'),
(17, 1, 'admin/categories', 'GET', '::1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"id\":null,\"name\":\"PC\",\"major_category_name\":null,\"created_at\":{\"start\":null,\"end\":null},\"_pjax\":\"#pjax-container\"}', '2025-06-06 07:54:42', '2025-06-06 07:54:42'),
(18, 1, 'admin/categories', 'GET', '::1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"id\":null,\"name\":\"PC\",\"major_category_name\":null,\"created_at\":{\"start\":null,\"end\":null}}', '2025-06-06 09:13:33', '2025-06-06 09:13:33'),
(19, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:14:25', '2025-06-06 09:14:25'),
(20, 1, 'admin/categories', 'GET', '::1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"id\":null,\"name\":\"PC\",\"major_category_name\":null,\"created_at\":{\"start\":null,\"end\":null},\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:14:32', '2025-06-06 09:14:32'),
(21, 1, 'admin/categories', 'GET', '::1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:16:12', '2025-06-06 09:16:12'),
(22, 1, 'admin/categories', 'GET', '::1', '{\"_sort\":{\"column\":\"created_at\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:16:14', '2025-06-06 09:16:14'),
(23, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:16:24', '2025-06-06 09:16:24'),
(24, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\",\"icon\":\"fa-bars\",\"uri\":\"products\",\"roles\":[null],\"permission\":null,\"_token\":\"OlkCscuxSetARQA6nXWzrWjuin4ChVAW7biYfkjH\"}', '2025-06-06 09:18:22', '2025-06-06 09:18:22'),
(25, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-06-06 09:18:23', '2025-06-06 09:18:23'),
(26, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:18:54', '2025-06-06 09:18:54'),
(27, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-06-06 09:19:10', '2025-06-06 09:19:10'),
(28, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:19:13', '2025-06-06 09:19:13'),
(29, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:20:39', '2025-06-06 09:20:39'),
(30, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:33:28', '2025-06-06 09:33:28'),
(31, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:37:04', '2025-06-06 09:37:04'),
(32, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:37:16', '2025-06-06 09:37:16'),
(33, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:38:55', '2025-06-06 09:38:55'),
(34, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:39:41', '2025-06-06 09:39:41'),
(35, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:42:21', '2025-06-06 09:42:21'),
(36, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"OlkCscuxSetARQA6nXWzrWjuin4ChVAW7biYfkjH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-06-06 09:42:37', '2025-06-06 09:42:37'),
(37, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-06 09:42:37', '2025-06-06 09:42:37'),
(38, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:48:40', '2025-06-06 09:48:40'),
(39, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"OlkCscuxSetARQA6nXWzrWjuin4ChVAW7biYfkjH\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-06-06 09:49:54', '2025-06-06 09:49:54'),
(40, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-06 09:49:54', '2025-06-06 09:49:54'),
(41, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 09:50:06', '2025-06-06 09:50:06'),
(42, 1, 'admin', 'GET', '::1', '[]', '2025-06-06 11:15:57', '2025-06-06 11:15:57'),
(43, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 11:16:19', '2025-06-06 11:16:19'),
(44, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 11:16:25', '2025-06-06 11:16:25'),
(45, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-06 11:17:06', '2025-06-06 11:17:06'),
(46, 1, 'admin', 'GET', '::1', '[]', '2025-06-07 05:47:10', '2025-06-07 05:47:10'),
(47, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 05:47:28', '2025-06-07 05:47:28'),
(48, 1, 'admin/categories/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 05:47:37', '2025-06-07 05:47:37'),
(49, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 05:47:51', '2025-06-07 05:47:51'),
(50, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 05:47:55', '2025-06-07 05:47:55'),
(51, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 05:48:00', '2025-06-07 05:48:00'),
(52, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-06-07 05:49:05', '2025-06-07 05:49:05'),
(53, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 05:49:05', '2025-06-07 05:49:05'),
(54, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 05:59:29', '2025-06-07 05:59:29'),
(55, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 05:59:34', '2025-06-07 05:59:34'),
(56, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 06:09:20', '2025-06-07 06:09:20'),
(57, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-06-07 06:33:47', '2025-06-07 06:33:47'),
(58, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 06:33:47', '2025-06-07 06:33:47'),
(59, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 06:35:52', '2025-06-07 06:35:52'),
(60, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 06:35:55', '2025-06-07 06:35:55'),
(61, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 06:55:42', '2025-06-07 06:55:42'),
(62, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-06-07 06:55:59', '2025-06-07 06:55:59'),
(63, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 06:55:59', '2025-06-07 06:55:59'),
(64, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 06:56:09', '2025-06-07 06:56:09'),
(65, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-06-07 06:56:44', '2025-06-07 06:56:44'),
(66, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 06:56:45', '2025-06-07 06:56:45'),
(67, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 06:56:52', '2025-06-07 06:56:52'),
(68, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-06-07 06:57:53', '2025-06-07 06:57:53'),
(69, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 06:57:53', '2025-06-07 06:57:53'),
(70, 1, 'admin/products/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 08:36:36', '2025-06-07 08:36:36'),
(71, 1, 'admin/products', 'POST', '::1', '{\"name\":\"test\",\"description\":\"test\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-06-07 08:42:54', '2025-06-07 08:42:54'),
(72, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 08:42:54', '2025-06-07 08:42:54'),
(73, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 08:59:25', '2025-06-07 08:59:25'),
(74, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 09:00:38', '2025-06-07 09:00:38'),
(75, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 09:00:40', '2025-06-07 09:00:40'),
(76, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 09:05:45', '2025-06-07 09:05:45'),
(77, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-06-07 09:06:07', '2025-06-07 09:06:07'),
(78, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 09:06:07', '2025-06-07 09:06:07'),
(79, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 09:10:52', '2025-06-07 09:10:52'),
(80, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 09:10:55', '2025-06-07 09:10:55'),
(81, 1, 'admin/products/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 09:10:57', '2025-06-07 09:10:57'),
(82, 1, 'admin/products', 'POST', '::1', '{\"name\":\"test\",\"description\":\"test\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-06-07 09:11:29', '2025-06-07 09:11:29'),
(83, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 09:11:29', '2025-06-07 09:11:29'),
(84, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 09:14:33', '2025-06-07 09:14:33'),
(85, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 09:18:15', '2025-06-07 09:18:15'),
(86, 1, 'admin/products/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 09:26:07', '2025-06-07 09:26:07'),
(87, 1, 'admin/products', 'POST', '::1', '{\"name\":\"test\",\"description\":\"test\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-06-07 09:26:47', '2025-06-07 09:26:47'),
(88, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 09:26:47', '2025-06-07 09:26:47'),
(89, 1, 'admin', 'GET', '::1', '[]', '2025-06-07 09:32:26', '2025-06-07 09:32:26'),
(90, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 09:32:37', '2025-06-07 09:32:37'),
(91, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 09:32:40', '2025-06-07 09:32:40'),
(92, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 09:32:43', '2025-06-07 09:32:43'),
(93, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 10:32:24', '2025-06-07 10:32:24'),
(94, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 10:32:27', '2025-06-07 10:32:27'),
(95, 1, 'admin/products/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:32:34', '2025-06-07 10:32:34'),
(96, 1, 'admin/products', 'POST', '::1', '{\"name\":\"test\",\"description\":\"test\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products\"}', '2025-06-07 10:33:05', '2025-06-07 10:33:05'),
(97, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 10:33:05', '2025-06-07 10:33:05'),
(98, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 10:33:32', '2025-06-07 10:33:32'),
(99, 1, 'admin/products', 'GET', '::1', '[]', '2025-06-07 10:33:34', '2025-06-07 10:33:34'),
(100, 1, 'admin/products/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:33:39', '2025-06-07 10:33:39'),
(101, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:33:48', '2025-06-07 10:33:48'),
(102, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2025-06-07 10:33:53', '2025-06-07 10:33:53'),
(103, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2025-06-07 10:35:37', '2025-06-07 10:35:37'),
(104, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:35:41', '2025-06-07 10:35:41'),
(105, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products?&page=1\"}', '2025-06-07 10:35:57', '2025-06-07 10:35:57'),
(106, 1, 'admin/products', 'GET', '::1', '{\"page\":\"1\"}', '2025-06-07 10:35:57', '2025-06-07 10:35:57'),
(107, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:39:06', '2025-06-07 10:39:06'),
(108, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products?&page=1\"}', '2025-06-07 10:39:20', '2025-06-07 10:39:20'),
(109, 1, 'admin/products', 'GET', '::1', '{\"page\":\"1\"}', '2025-06-07 10:39:21', '2025-06-07 10:39:21'),
(110, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:39:37', '2025-06-07 10:39:37'),
(111, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products?&page=1\"}', '2025-06-07 10:40:03', '2025-06-07 10:40:03'),
(112, 1, 'admin/products', 'GET', '::1', '{\"page\":\"1\"}', '2025-06-07 10:40:03', '2025-06-07 10:40:03'),
(113, 1, 'admin/products', 'GET', '::1', '{\"page\":\"1\"}', '2025-06-07 10:40:40', '2025-06-07 10:40:40'),
(114, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:41:42', '2025-06-07 10:41:42'),
(115, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products?&page=1\"}', '2025-06-07 10:41:54', '2025-06-07 10:41:54'),
(116, 1, 'admin/products', 'GET', '::1', '{\"page\":\"1\"}', '2025-06-07 10:41:54', '2025-06-07 10:41:54'),
(117, 1, 'admin/products', 'GET', '::1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:42:00', '2025-06-07 10:42:00'),
(118, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"22\",\"_model\":\"App_Models_Product\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2025-06-07 10:42:19', '2025-06-07 10:42:19'),
(119, 1, 'admin/products', 'GET', '::1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:42:20', '2025-06-07 10:42:20'),
(120, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"23\",\"_model\":\"App_Models_Product\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2025-06-07 10:42:27', '2025-06-07 10:42:27'),
(121, 1, 'admin/products', 'GET', '::1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:42:27', '2025-06-07 10:42:27'),
(122, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"24\",\"_model\":\"App_Models_Product\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2025-06-07 10:42:34', '2025-06-07 10:42:34'),
(123, 1, 'admin/products', 'GET', '::1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:42:35', '2025-06-07 10:42:35'),
(124, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"25\",\"_model\":\"App_Models_Product\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2025-06-07 10:42:41', '2025-06-07 10:42:41'),
(125, 1, 'admin/products', 'GET', '::1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:42:41', '2025-06-07 10:42:41'),
(126, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2025-06-07 10:43:59', '2025-06-07 10:43:59'),
(127, 1, 'admin/products', 'GET', '::1', '{\"page\":\"1\"}', '2025-06-07 10:44:03', '2025-06-07 10:44:03'),
(128, 1, 'admin/products/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 10:44:11', '2025-06-07 10:44:11'),
(129, 1, 'admin/products/1', 'PUT', '::1', '{\"name\":\"Laravel\\u5165\\u9580\",\"description\":\"Laravel\\u5165\\u9580\\u306e\\u672c\\u3067\\u3059\\u3002\",\"price\":\"2000\",\"category_id\":\"5\",\"_token\":\"9N42hSqrJ8vzq7FGy4cN1BVJpyFUkS537zCisKBF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/products?&page=1\"}', '2025-06-07 10:45:10', '2025-06-07 10:45:10'),
(130, 1, 'admin/products', 'GET', '::1', '{\"page\":\"1\"}', '2025-06-07 10:45:10', '2025-06-07 10:45:10'),
(131, 1, 'admin/products', 'GET', '::1', '{\"page\":\"1\"}', '2025-06-07 12:22:37', '2025-06-07 12:22:37'),
(132, 1, 'admin/products', 'GET', '::1', '{\"page\":\"1\"}', '2025-06-07 12:22:38', '2025-06-07 12:22:38'),
(133, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 12:26:43', '2025-06-07 12:26:43'),
(134, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 12:26:51', '2025-06-07 12:26:51'),
(135, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-07 12:26:56', '2025-06-07 12:26:56'),
(136, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2025-06-07 13:08:25', '2025-06-07 13:08:25'),
(137, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2025-06-07 13:08:29', '2025-06-07 13:08:29'),
(138, 1, 'admin/categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-08 04:04:03', '2025-06-08 04:04:03'),
(139, 1, 'admin/categories', 'GET', '::1', '[]', '2025-06-08 05:51:36', '2025-06-08 05:51:36'),
(140, 1, 'admin/products', 'GET', '::1', '{\"page\":\"1\",\"_pjax\":\"#pjax-container\"}', '2025-06-08 05:52:14', '2025-06-08 05:52:14'),
(141, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-08 05:52:35', '2025-06-08 05:52:35'),
(142, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u89aa\\u30ab\\u30c6\\u30b4\\u30ea\\u30fc\",\"icon\":\"fa-bars\",\"uri\":\"major-categories\",\"roles\":[null],\"permission\":null,\"_token\":\"T11rJHJfXalOd8g5RlKynzJvwV6gHuC1WHo4RJSa\"}', '2025-06-08 05:53:44', '2025-06-08 05:53:44'),
(143, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-06-08 05:53:44', '2025-06-08 05:53:44'),
(144, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-06-08 05:53:53', '2025-06-08 05:53:53'),
(145, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u30e6\\u30fc\\u30b6\\u30fc\",\"icon\":\"fa-bars\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"T11rJHJfXalOd8g5RlKynzJvwV6gHuC1WHo4RJSa\"}', '2025-06-08 05:55:22', '2025-06-08 05:55:22'),
(146, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-06-08 05:55:22', '2025-06-08 05:55:22'),
(147, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2025-06-08 05:55:25', '2025-06-08 05:55:25'),
(148, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-08 05:55:41', '2025-06-08 05:55:41'),
(149, 1, 'admin/users', 'GET', '::1', '[]', '2025-06-08 07:26:07', '2025-06-08 07:26:07'),
(150, 1, 'admin/users', 'GET', '::1', '[]', '2025-06-08 08:38:15', '2025-06-08 08:38:15'),
(151, 1, 'admin/users', 'GET', '::1', '[]', '2025-06-08 11:38:45', '2025-06-08 11:38:45'),
(152, 1, 'admin/users', 'GET', '::1', '[]', '2025-06-08 13:22:12', '2025-06-08 13:22:12'),
(153, 1, 'admin/users', 'GET', '::1', '{\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2025-06-08 13:22:47', '2025-06-08 13:22:47'),
(154, 1, 'admin/users', 'GET', '::1', '{\"_scope_\":\"trashed\"}', '2025-06-08 13:23:24', '2025-06-08 13:23:24'),
(155, 1, 'admin/major-categories', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-08 13:23:37', '2025-06-08 13:23:37'),
(156, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-08 13:23:40', '2025-06-08 13:23:40'),
(157, 1, 'admin/users', 'GET', '::1', '[]', '2025-06-08 13:24:53', '2025-06-08 13:24:53'),
(158, 1, 'admin/users', 'GET', '::1', '{\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2025-06-08 13:25:15', '2025-06-08 13:25:15'),
(159, 1, 'admin/users/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2025-06-08 13:27:15', '2025-06-08 13:27:15'),
(160, 1, 'admin/users/1', 'PUT', '::1', '{\"name\":\"\\u5927\\u9ad9\\u77e5 \\u4e09\\u4f73\",\"email\":\"hiyoko_m@icloud.com\",\"email_verified_at\":\"2025-06-08 22:27:15\",\"password\":null,\"postal_code\":null,\"address\":null,\"phone\":null,\"deleted_at\":null,\"_token\":\"adDsV4j7k96vTnfIZhuAU3EOauITumQ741yp6C5k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/laravel-samuraimart\\/public\\/admin\\/users?_scope_=trashed\"}', '2025-06-08 13:28:26', '2025-06-08 13:28:26'),
(161, 1, 'admin/users/1/edit', 'GET', '::1', '[]', '2025-06-08 13:28:26', '2025-06-08 13:28:26'),
(162, 1, 'admin/users/1', 'PUT', '::1', '{\"name\":\"\\u5927\\u9ad9\\u77e5 \\u4e09\\u4f73\",\"email\":\"hiyoko_m@icloud.com\",\"email_verified_at\":\"2025-06-08 22:27:15\",\"password\":null,\"postal_code\":null,\"address\":null,\"phone\":null,\"deleted_at\":null,\"_token\":\"adDsV4j7k96vTnfIZhuAU3EOauITumQ741yp6C5k\",\"_method\":\"PUT\"}', '2025-06-08 14:05:50', '2025-06-08 14:05:50'),
(163, 1, 'admin/users/1/edit', 'GET', '::1', '[]', '2025-06-08 14:05:50', '2025-06-08 14:05:50');

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2025-06-06 07:39:46', '2025-06-06 07:39:46');

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$rHN1DDTu1CQC44eqx1Dkn.zy6EojPHTSC96OhVBT2SNuSFSK9mOuy', 'Administrator', NULL, '71Jswo4Uf3GA21L1B5WVzcpF0BcKk0a3I3BYwPsyrbO0bFmbyKcCxjl1YMvs', '2025-06-06 07:39:46', '2025-06-06 07:39:46');

-- --------------------------------------------------------

--
-- テーブルの構造 `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `major_category_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`, `major_category_id`) VALUES
(1, 'ビジネス', 'ビジネス', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(2, '文学・評論', '文学・評論', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(3, '人文・思想', '人文・思想', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(4, 'スポーツ', 'スポーツ', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(5, 'コンピュータ・IT', 'コンピュータ・IT', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(6, '資格・検定・就職', '資格・検定・就職', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(7, '絵本・児童書', '絵本・児童書', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(8, '写真集', '写真集', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(9, 'ゲーム攻略本', 'ゲーム攻略本', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(10, '雑誌', '雑誌', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(11, 'アート・デザイン', 'アート・デザイン', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(12, 'ノンフィクション', 'ノンフィクション', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(13, 'ノートPC', 'ノートPC', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(14, 'デスクトップPC', 'デスクトップPC', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(15, 'タブレット', 'タブレット', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(16, '19~20インチ', '19~20インチ', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(17, 'デスクトップPC', 'デスクトップPC', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0),
(18, 'タブレット', 'タブレット', '2025-05-31 12:18:18', '2025-05-31 12:18:18', 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `major_categories`
--

CREATE TABLE `major_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `major_categories`
--

INSERT INTO `major_categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, '本', '本', '2025-06-07 13:23:47', '2025-06-07 13:23:47'),
(2, 'コンピュータ', 'コンピュータ', '2025-06-07 13:23:47', '2025-06-07 13:23:47'),
(3, 'ディスプレイ', 'ディスプレイ', '2025-06-07 13:23:47', '2025-06-07 13:23:47');

-- --------------------------------------------------------

--
-- テーブルの構造 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_05_24_211644_create_categories_table', 1),
(6, '2025_05_25_160446_create_products_table', 1),
(7, '2025_06_01_163712_create_reviews_table', 2),
(8, '2025_06_01_192157_add_title_to_reviews_table', 3),
(9, '2025_06_01_200914_create_product_user_table', 4),
(10, '2025_06_03_123327_add_columns_to_users', 5),
(11, '2018_12_23_120000_create_shoppingcart_table', 6),
(12, '2025_06_04_221444_add_buy_flag_to_shoppingcart', 7),
(13, '2025_06_05_184746_add_score_to_reviews', 8),
(14, '2016_01_04_173148_create_admin_tables', 9),
(15, '2025_06_06_165644_add_image_to_products', 10),
(16, '2025_06_07_221535_create_major_categories_table', 11),
(17, '2025_06_07_221821_add_major_category_to_categories', 12),
(18, '2025_06_07_222922_drop_column_categories_table', 13),
(19, '2025_06_08_133608_add_soft_delete_to_users', 14);

-- --------------------------------------------------------

--
-- テーブルの構造 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category_id`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Laravel入門', 'Laravel入門の本です。', 2000, 5, '2025-05-31 12:21:16', '2025-06-07 10:45:10', 'img/book_yoko.png'),
(2, '青田 康弘', '「ケンタウル祭さいだねえ」「ああ」「橋はしを架かけるとこじゃないんでしょうか」女の子がさびしそうに。', 190165, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(3, '笹田 英樹', 'んやり白いシャツが入り乱みだれて、六、七人の生徒らが、口笛くちぶえも、みんな聞きおぼえのある声が、。', 60201, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(4, '山岸 英樹', 'た。そしてもうそのかたちは天気輪てんきりんの柱はしらのように考えられてしかたなかったのは、このごろ。', 144499, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(5, '吉本 京助', '快ゆかいになって、その一つの平屋根ひらやねの上に、眼めもさめるような、青宝玉サファイアは向むこうへ。', 33582, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(6, '坂本 花子', 'や風にゆらぎ、その立派りっぱな人たちでいっぱいで河かわが見えませんでした。二人ふたりは一度どにはね。', 131799, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(7, '桐山 美加子', 'がたくさん見えその遠いのはぼうっと白く見えるという、これがつまり今日の銀河ぎんがステーションで、も。', 178001, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(8, '鈴木 修平', 'こをもういちど手にもった紙きれと引き合わせてから、さっき見たような鷺さぎが、まるでひるの間にいっぱ。', 117333, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(9, '渡辺 桃子', 'びびとたちはしずかに席せきにもたれて睡ねむっていました。マルソがジョバンニが、なんだかあたりまえで。', 88764, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(10, '中島 充', 'も一言ひとことも物ものを言いわなかったの」ジョバンニが窓まどの下を通り、汽車はだんだんこころもちを。', 104266, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(11, '佐々木 翼', 'こいつはたいしたもんですからね、川原で待まっているからうごいていました。六時がうってしばらく木のあ。', 83715, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(12, '木村 翼', 'さしました。けれどもみんなは乗のり切らないのです」青年はきちっと口を結むすんで男の子を見おろしなが。', 78461, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(13, '野村 拓真', 'れつの電燈でんとうがだんだん向むこうへめぐり、黄いろの雁がんの足を、軽かるくひっぱりました。ふりか。', 34826, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(14, '原田 結衣', 'ことばで、そっと談はなし合ったのです。だんだん近づいて見ると、そこらには、蹄ひづめの二つある足跡あ。', 30757, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(15, '宮沢 稔', 'のが四棟むねばかり立って、その影かげが大きく天井てんじょうを、あちこち歩きまわって監督かんとくをは。', 51113, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(16, '渡辺 京助', '字架じゅうじかは窓まどの正面しょうめんの凸とつレンズのかたちをつくり、それもだんだん、まん中がふく。', 14060, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(17, '笹田 翔太', 'した。それから元気よく口笛くちぶえを吹ふき、男の子はまるで絹きぬで包つつんだり、ひとの切符きっぷを。', 47456, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(18, '藤本 幹', 'ら北へ亙わたっているだろうかと考えてふり返かえって見ると、その白い岩いわの上を、一生けん命めい勢い。', 156423, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(19, '杉山 修平', 'こみちを、どんどんのぼって行きましょう」青年は男の子のぬれたようにまっすぐに立っているのでした。け。', 5336, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(20, '中津川 結衣', 'さっさっと青じろく時々光ってその孔雀くじゃくの声だってさっき聞こえた」カムパネルラはわけもないとい。', 131578, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', ''),
(21, '野村 花子', 'いいというように急いそいで出してみましたら、そこにはもうあの鳥捕とりとりは、もうそこに鳥捕とりとり。', 125892, 1, '2025-05-31 12:36:24', '2025-05-31 12:36:24', '');

-- --------------------------------------------------------

--
-- テーブルの構造 `product_user`
--

CREATE TABLE `product_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `product_user`
--

INSERT INTO `product_user` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 1, 1, '2025-06-04 12:54:22', '2025-06-04 12:54:22');

-- --------------------------------------------------------

--
-- テーブルの構造 `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `reviews`
--

INSERT INTO `reviews` (`id`, `content`, `product_id`, `user_id`, `created_at`, `updated_at`, `title`, `score`) VALUES
(1, 'とても良かった！', 1, 1, '2025-06-01 08:38:38', '2025-06-01 08:38:38', '', 0),
(2, 'とても参考になった！', 1, 1, '2025-06-05 10:03:38', '2025-06-05 10:03:38', 'おすすめです！', 5);

-- --------------------------------------------------------

--
-- テーブルの構造 `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `buy_flag` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `shoppingcart`
--

INSERT INTO `shoppingcart` (`identifier`, `instance`, `content`, `number`, `created_at`, `updated_at`, `buy_flag`) VALUES
('1', '1', 'O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";O:32:\"Gloudemans\\Shoppingcart\\CartItem\":11:{s:5:\"rowId\";s:32:\"027c91341fd5cf4d2579b49c4b6a90da\";s:2:\"id\";s:1:\"1\";s:3:\"qty\";s:1:\"1\";s:4:\"name\";s:13:\"Laravel入門\";s:5:\"price\";d:2000;s:6:\"weight\";d:0;s:7:\"options\";O:39:\"Gloudemans\\Shoppingcart\\CartItemOptions\":2:{s:8:\"\0*\0items\";a:0:{}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:7:\"taxRate\";i:21;s:49:\"\0Gloudemans\\Shoppingcart\\CartItem\0associatedModel\";N;s:46:\"\0Gloudemans\\Shoppingcart\\CartItem\0discountRate\";i:0;s:8:\"instance\";s:1:\"1\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}', 1, '2025-06-05 09:17:52', '2025-06-05 09:17:52', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `postal_code`, `address`, `phone`, `deleted_at`) VALUES
(1, '大髙知 三佳', 'hiyoko_m@icloud.com', NULL, '$2y$10$TqKErHo.In65NXHFQlFQVOaP2mYIllO/IqmY.YgZbPy9TkuLtWThi', NULL, '2025-05-31 12:55:22', '2025-06-08 13:24:20', '', '', '', '2025-06-08 13:24:20'),
(2, 'test', 'test@email.com', '2025-06-08 08:03:22', '$2y$12$/jAPjkjMgb7aT9IojO2B5unlSP.RbpctFKHeGivM1vvqAVdoIsQ/a', NULL, NULL, NULL, '', '', '', NULL),
(4, 'test', 'test2@email.com', '2025-06-08 08:37:28', '$2y$10$eM.YcM.9LizYCf8YZ4h8eOIVz.8v1JeWz.z2WWzyJXYObDCjtZ2XG', NULL, NULL, NULL, '', 'test', '', NULL);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- テーブルのインデックス `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- テーブルのインデックス `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- テーブルのインデックス `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- テーブルのインデックス `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- テーブルのインデックス `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- テーブルのインデックス `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- テーブルのインデックス `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- テーブルのインデックス `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- テーブルのインデックス `major_categories`
--
ALTER TABLE `major_categories`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- テーブルのインデックス `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- テーブルのインデックス `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `product_user`
--
ALTER TABLE `product_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_user_user_id_foreign` (`user_id`),
  ADD KEY `product_user_product_id_foreign` (`product_id`);

--
-- テーブルのインデックス `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`identifier`,`instance`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- テーブルの AUTO_INCREMENT `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- テーブルの AUTO_INCREMENT `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- テーブルの AUTO_INCREMENT `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- テーブルの AUTO_INCREMENT `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- テーブルの AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `major_categories`
--
ALTER TABLE `major_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- テーブルの AUTO_INCREMENT `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルの AUTO_INCREMENT `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- テーブルの AUTO_INCREMENT `product_user`
--
ALTER TABLE `product_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルの AUTO_INCREMENT `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルの AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `product_user`
--
ALTER TABLE `product_user`
  ADD CONSTRAINT `product_user_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

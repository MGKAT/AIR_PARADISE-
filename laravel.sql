-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 24 mai 2025 à 22:18
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `laravel`
--

-- --------------------------------------------------------

--
-- Structure de la table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flight_history_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `card_number` varchar(255) NOT NULL,
  `expiry_date` varchar(255) NOT NULL,
  `cvv` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bookings`
--

INSERT INTO `bookings` (`id`, `flight_history_id`, `full_name`, `email`, `card_number`, `expiry_date`, `cvv`, `status`, `created_at`, `updated_at`) VALUES
(1, 19, 'wafo', 'bakamkamgajosianeclaire@gmail.com', 'eyJpdiI6IjRSdWVZSHNxdXBCdXRKaXJVSktnY1E9PSIsInZhbHVlIjoiekxQYTRpOWJZb0Y3aG5ZZEZFNnVnQT09IiwibWFjIjoiZWQ0MDBiOTM1YmNhZTAzMWFiNDIzODhiNWZiMzU1MGQ1ZjcyNDc5ZjA2YTI2NDE2MDhjZDIyN2U4ZmY4MWM2NCIsInRhZyI6IiJ9', '20/25', 'eyJpdiI6Ik1GOU5meGRqNWM2SUNDaThPeGtrbHc9PSIsInZhbHVlIjoiR3lIZE9zUHFFUUNoK0RIMTVCQmswUT09IiwibWFjIjoiYjM0MzFiNWMwZjZhZTgxNmI2MjU1NWQxZjU0YmJmY2JjYTgzMDlhY2M1ZDBlN2RkM2JmM2NiYzU1YTMxNTJhYSIsInRhZyI6IiJ9', 'pending', '2025-05-05 13:39:12', '2025-05-05 13:39:12'),
(2, 19, 'wafo', 'bakamkamgajosianeclaire@gmail.com', 'eyJpdiI6ImoranlraFVXWjlqRndRWU5xc3RYR3c9PSIsInZhbHVlIjoieE50azUyQXZYZitaaUtXekdmSjZBdz09IiwibWFjIjoiY2Y0ZTEwMzE3Njk0YWUyZjdmZTI0NTU4ODEyNmM0OTRkODQ2MWI1Mzc5YTNlMTUzNzZhZDE0ODJjOGMwODNlMSIsInRhZyI6IiJ9', '20/25', 'eyJpdiI6Ik1qVHlEbFdhc04xcm5hOVBxYlVtYlE9PSIsInZhbHVlIjoieVI2WUgvYXRUTE1qM01ob0Zjd25XQT09IiwibWFjIjoiMTNmODNlZTExOTIxMWFmMjE0NTVlNmEwZTQ2ZDEzYjU3NjZmZDcxMGJiYjE1NWNjMTA4ZGE2YjhmNjg0Mjk4ZiIsInRhZyI6IiJ9', 'pending', '2025-05-05 13:43:33', '2025-05-05 13:43:33'),
(3, 20, 'wafo olivier dylan', 'bakamkamgajosianeclaire@gmail.com', 'eyJpdiI6ImQrUUR2MHE2RjYyam9nOGJPY0k2TlE9PSIsInZhbHVlIjoiUVRIaEhaUFA2SDlCd21aSHoxRmY2d01OWm1wM1RtTDQ3NjV4bGhUajhmaz0iLCJtYWMiOiIyMTA3ZDYxNjg5ZjIzZTU0MDVlNzM2M2NmMTBhMmIzNDA3YzFkNDhiMzFiOGQyNDQ2OWI5OWFhMzRhZjUwODZmIiwidGFnIjoiIn0=', '12/25', 'eyJpdiI6IjJxVXYwZUcyYUlyZVc5YTBPdEZBT2c9PSIsInZhbHVlIjoiQU5PQ0s0d1J3VENZTEhCQW9uWjR5dz09IiwibWFjIjoiYjI3ZDQ5ZWYzNmRkYzE5ZmYzZDE5MTFjZmNmMDEzYzRlMGI3MGI4NWFmNGNjNzA5ZmM3ZDBlYzg5YWRhYWZlMiIsInRhZyI6IiJ9', 'pending', '2025-05-05 13:52:10', '2025-05-05 13:52:10'),
(4, 21, 'vjkbkb', 'bakamkamgajosianeclaire@gmail.com111', 'eyJpdiI6IlZqcTJHaWpENEp4QWZIaVpSSzh4SEE9PSIsInZhbHVlIjoiU1NEV3FJaEdYT01QeEIzTGkyOHFnUT09IiwibWFjIjoiNDAzMTNjYWExNTc3Y2EyOTM0YmI1YzMxMzMzNmMyZDU2ZmM1MWMzYTVlMTFiODhmMTQyMTUyMDE3NjE1N2MyOSIsInRhZyI6IiJ9', '12/12', 'eyJpdiI6ImxpL085SUhPeWs2N2diQlZXbjI2M2c9PSIsInZhbHVlIjoiMHpYMDhYbjV4MmYza0lpcHdSR1g1UT09IiwibWFjIjoiZjdhMzA5OGU5OTAwNzM5MjI1ZmFkYWJlODVhNzM0ZTZkNmM4YjBjMzJmNjE2MmVhMTcyMGM4YzNiNWE0MDYwNSIsInRhZyI6IiJ9', 'pending', '2025-05-06 07:21:07', '2025-05-06 07:21:07'),
(5, 25, 'tayou', 'wafoolivierdylan@gmail.com', 'eyJpdiI6IitVRWVlVlhTWWVMcUxnZC9qQlZERWc9PSIsInZhbHVlIjoiOU9FUUlZMjM2RWpBUnQxV0lQWC8rTGt1OGdGNGtCcUhTNDk4NUNkdGJjbz0iLCJtYWMiOiIwYTYzZWI2ZWUwOTNlMTZmZTUxYzNhYzIyYTU0MDFlMjEyMGRmYjMzM2RkNDUyNzlmOTdiYTM1ZjJlMDk0NTZjIiwidGFnIjoiIn0=', '125', 'eyJpdiI6Ik9DVnFBVDlxaVVFdDk0UjM2WFhzd2c9PSIsInZhbHVlIjoiUXpjbVh4STNHZlJPOFJ4L3NueHlxZz09IiwibWFjIjoiYWQ4ZmQxMWQ0OWRjYjQwYmQ4NTBkMGEyNDY4OTdhZWM3OGNjNGE1MzUyNjA5OTRiMzQ5OTY1MTBlZjI2YmQxMCIsInRhZyI6IiJ9', 'pending', '2025-05-23 17:29:16', '2025-05-23 17:29:16'),
(6, 27, 'wafo olivier dylan', 'bakamkamgajosianeclaire@gmail.com', 'eyJpdiI6IlI5dTdkelY2c0NwZ21lVkNpajFOanc9PSIsInZhbHVlIjoiUTB3cnVCRHN4TjI0cUFsdTFickcydnVYbDhDam52LzR6WmhYK3QwTWQwQT0iLCJtYWMiOiJmY2VjYjI4NTM4NTI4OWRlOWUxMzc1NmE5Y2NlMmRhODUzMmEzZTdkYThjZGFjNWY1ZDk0YTU1NjNhNjdjM2YxIiwidGFnIjoiIn0=', '12/25', 'eyJpdiI6IlV6Um0vVnFGOE5FM0VaUWFwRHpNMXc9PSIsInZhbHVlIjoiZ0FlbnAvOE9qblNmSFZCdVYvQjN0dz09IiwibWFjIjoiZTgwNDU1NGJjYTRjYzI0M2Q2NjI1ODQ0MGEwZjY5OTQzNjBlYThiZTdiZWRhOTYxMGNhNTA1NmRhMjY2ZjJjYSIsInRhZyI6IiJ9', 'pending', '2025-05-24 07:59:16', '2025-05-24 07:59:16');

-- --------------------------------------------------------

--
-- Structure de la table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
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
-- Structure de la table `flight_histories`
--

CREATE TABLE `flight_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `departure_city` varchar(255) NOT NULL,
  `arrival_city` varchar(255) NOT NULL,
  `flight_date` date NOT NULL,
  `departure_time` varchar(255) NOT NULL,
  `arrival_time` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `flight_histories`
--

INSERT INTO `flight_histories` (`id`, `departure_city`, `arrival_city`, `flight_date`, `departure_time`, `arrival_time`, `price`, `created_at`, `updated_at`) VALUES
(1, 'New York', 'Philadelphia', '2025-05-10', '23', '21', 25.00, '2025-05-04 11:55:47', '2025-05-04 11:55:47'),
(2, 'Washington', 'Chula Vista', '2025-05-15', '2025-05-15 à 08:00', '2025-05-15 à 11:00', 350.00, '2025-05-04 11:59:24', '2025-05-04 11:59:24'),
(3, 'New York', 'Philadelphia', '2025-05-11', '2025-05-11 à 08:00', '2025-05-11 à 11:00', 350.00, '2025-05-04 12:09:01', '2025-05-04 12:09:01'),
(4, 'Washington', 'Los Angeles', '2025-05-09', '2025-05-09 à 08:00', '2025-05-09 à 11:00', 350.00, '2025-05-04 12:10:03', '2025-05-04 12:10:03'),
(5, 'Denver', 'Baton Rouge', '2025-05-10', '2025-05-10 à 08:00', '2025-05-10 à 11:00', 350.00, '2025-05-04 12:17:03', '2025-05-04 12:17:03'),
(6, 'Denver', 'Baton Rouge', '2025-05-10', '2025-05-10 à 08:00', '2025-05-10 à 11:00', 350.00, '2025-05-04 12:17:03', '2025-05-04 12:17:03'),
(7, 'Milwaukee', 'Orlando', '2025-05-09', '2025-05-09 à 08:00', '2025-05-09 à 11:00', 350.00, '2025-05-04 12:19:58', '2025-05-04 12:19:58'),
(8, 'Hialeah', 'Tucson', '2025-05-10', '2025-05-10 à 08:00', '2025-05-10 à 11:00', 350.00, '2025-05-04 12:23:04', '2025-05-04 12:23:04'),
(9, 'Baton Rouge', 'Washington', '2025-05-10', '2025-05-10 à 08:00', '2025-05-10 à 11:00', 350.00, '2025-05-04 12:24:50', '2025-05-04 12:24:50'),
(10, 'Baton Rouge', 'Washington', '2025-05-10', '2025-05-10 à 08:00', '2025-05-10 à 11:00', 350.00, '2025-05-04 12:24:53', '2025-05-04 12:24:53'),
(11, 'Baton Rouge', 'Washington', '2025-05-10', '2025-05-10 à 08:00', '2025-05-10 à 11:00', 350.00, '2025-05-04 12:24:57', '2025-05-04 12:24:57'),
(12, 'Washington', 'Tucson', '2025-05-17', '2025-05-17 à 08:00', '2025-05-17 à 11:00', 350.00, '2025-05-04 12:29:24', '2025-05-04 12:29:24'),
(13, 'Tucson', 'Sacramento', '2025-05-17', '2025-05-17 à 08:00', '2025-05-17 à 11:00', 350.00, '2025-05-04 12:30:20', '2025-05-04 12:30:20'),
(14, 'Plano', 'Austin', '2025-05-10', '2025-05-10 à 14:00', '2025-05-10 à 17:00', 420.00, '2025-05-04 12:39:01', '2025-05-04 12:39:01'),
(15, 'Austin', 'Austin', '2025-05-07', '2025-05-07 à 08:00', '2025-05-07 à 11:00', 350.00, '2025-05-04 12:41:23', '2025-05-04 12:41:23'),
(16, 'Austin', 'New York', '2025-05-10', '2025-05-10 à 14:00', '2025-05-10 à 17:00', 420.00, '2025-05-04 12:43:57', '2025-05-04 12:43:57'),
(17, 'Los Angeles', 'Miami', '2025-05-03', '2025-05-03 à 08:00', '2025-05-03 à 11:00', 350.00, '2025-05-04 12:45:54', '2025-05-04 12:45:54'),
(18, 'New York', 'Washington', '2025-05-11', '2025-05-11 à 08:00', '2025-05-11 à 11:00', 350.00, '2025-05-04 12:58:43', '2025-05-04 12:58:43'),
(19, 'Miami', 'Hialeah', '2025-05-08', '08:00', '11:00', 350.00, '2025-05-05 13:22:30', '2025-05-05 13:22:30'),
(20, 'Hialeah', 'Hialeah', '2025-05-08', '08:00', '11:00', 350.00, '2025-05-05 13:51:53', '2025-05-05 13:51:53'),
(21, 'Orlando', 'New Orleans', '2025-05-09', '08:00', '11:00', 350.00, '2025-05-06 07:20:22', '2025-05-06 07:20:22'),
(22, 'new', 'new', '2025-05-16', '08:00', '11:00', 350.00, '2025-05-22 12:24:28', '2025-05-22 12:24:28'),
(23, 'New York', 'Jacksonville', '2025-05-24', '08:00', '11:00', 350.00, '2025-05-22 12:34:47', '2025-05-22 12:34:47'),
(24, 'El Paso', 'Washington', '2025-05-24', '08:00', '11:00', 350.00, '2025-05-23 13:56:09', '2025-05-23 13:56:09'),
(25, 'New York', 'Dallas', '2025-05-24', '08:00', '11:00', 649.54, '2025-05-23 17:28:53', '2025-05-23 17:28:53'),
(26, 'Dallas', 'New York', '2025-05-31', '08:00', '11:00', 646.03, '2025-05-23 17:41:01', '2025-05-23 17:41:01'),
(27, 'Dallas', 'New York', '2025-05-30', '08:00', '11:00', 646.03, '2025-05-24 07:57:09', '2025-05-24 07:57:09');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
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
-- Structure de la table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2025_04_10_072625_create_flights_table', 2),
(10, '0001_01_01_000000_create_users_table', 3),
(11, '0001_01_01_000001_create_cache_table', 3),
(12, '0001_01_01_000002_create_jobs_table', 3),
(13, '2025_05_04_122207_create_flight_histories_table', 3),
(14, '2025_05_04_175445_create__bookings__table', 4),
(15, '2025_05_04_180217_create_bookings_table', 5),
(16, '2025_05_05_153702_create_bookings_table', 6);

-- --------------------------------------------------------

--
-- Structure de la table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0C6s1aMR4Ed71udKSIQ8DwFQozhHLhsmoJ5qFZ5v', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEdPRmF1SHExa3Z1R3pqdDJ2a3k5ZUFqQVJsQ0xGVnlwaHhpOVFGSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748017862),
('lotWdkvQX1ivdI7HsHyKye09lQ6uT0EBY13k8z1f', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRW1KS1RGQUpNVDVZUzdiUllSNkxnVHQxbzlNU2pVbWVzWUQ2cGlxaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748091438),
('TkHFKxJLCVQSyRGvCjo6kWC2qy2g411pUPDXxxmx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWENQeDZUSHBlUDJzU2pqSm5TbjF3WGJ1dENqaXVhb0daU3B4b1pNZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748081579),
('uePNKa9k62rB6ZwLHLylpFic2E3ancjxgTRbkuw3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnBWTVQzQ3BCYW95S2sycmxmQmNvUGw1ODhJVm9qQzEwWGRtZjFLNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1747924618),
('zwTsDfCnz7rmttPU6Uu3ntFD0w7T2YyyUNm8JwMH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV21McmdLVjdxRTZ0MzlUZHExMlFvRjBjT1JLanQ4Zll0V3pUZENrayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748029443);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_flight_history_id_foreign` (`flight_history_id`);

--
-- Index pour la table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `flight_histories`
--
ALTER TABLE `flight_histories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `flight_histories`
--
ALTER TABLE `flight_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_flight_history_id_foreign` FOREIGN KEY (`flight_history_id`) REFERENCES `flight_histories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

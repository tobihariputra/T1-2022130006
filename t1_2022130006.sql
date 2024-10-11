-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for t1_2022130006
DROP DATABASE IF EXISTS `t1_2022130006`;
CREATE DATABASE IF NOT EXISTS `t1_2022130006` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t1_2022130006`;

-- Dumping structure for table t1_2022130006.cache
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table t1_2022130006.cache: ~0 rows (approximately)

-- Dumping structure for table t1_2022130006.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table t1_2022130006.cache_locks: ~0 rows (approximately)

-- Dumping structure for table t1_2022130006.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table t1_2022130006.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table t1_2022130006.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table t1_2022130006.jobs: ~0 rows (approximately)

-- Dumping structure for table t1_2022130006.job_batches
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table t1_2022130006.job_batches: ~0 rows (approximately)

-- Dumping structure for table t1_2022130006.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table t1_2022130006.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2024_10_03_171751_create_products_table', 1);

-- Dumping structure for table t1_2022130006.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table t1_2022130006.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table t1_2022130006.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` char(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `retail_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `wholesale_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `origin` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int unsigned NOT NULL DEFAULT '0',
  `product_image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table t1_2022130006.products: ~102 rows (approximately)
INSERT INTO `products` (`id`, `product_name`, `description`, `retail_price`, `wholesale_price`, `origin`, `quantity`, `product_image`, `created_at`, `updated_at`) VALUES
	('001', 'iphone xr', 'xr', 3600000.00, 3400000.00, 'EN', 12, '1728633886_547247ff-0893-4690-bf9e-30c084b8fd7b.jpg', '2024-10-11 01:04:46', '2024-10-11 01:04:46'),
	('002', 'iphone 15', '15 pro', 12000000.00, 11500000.00, 'US', 15, '1728633925_images.jpg', '2024-10-11 01:05:26', '2024-10-11 01:05:26'),
	('003', 'maiores', 'Quo animi aliquid qui rerum officiis voluptatem dicta.', 8669065.41, 7802158.87, 'CO', 96, NULL, '2023-11-17 13:36:17', '2024-03-05 18:17:43'),
	('004', 'voluptate', 'Quas ut nisi fugiat deserunt perspiciatis ut voluptatem.', 7245101.37, 6520591.23, 'EG', 89, NULL, '2024-04-27 11:00:33', '2024-06-13 03:34:12'),
	('005', 'qui', 'Delectus magnam beatae libero.', 8563810.14, 7707429.13, 'LV', 8, NULL, '2024-04-13 07:32:24', '2024-06-07 04:02:43'),
	('006', 'id', 'Nisi aut libero et corporis.', 3771601.16, 3394441.04, 'AU', 68, NULL, '2023-12-07 09:30:58', '2024-08-08 01:15:44'),
	('007', 'debitis', 'Eius sed qui unde recusandae laudantium molestias.', 4392661.09, 3953394.98, 'MO', 39, NULL, '2024-02-28 02:21:10', '2024-09-12 17:15:53'),
	('008', 'quis', 'Sit laboriosam voluptates saepe non et.', 5043235.33, 4538911.80, 'HN', 91, NULL, '2024-06-06 02:29:27', '2024-06-28 02:31:58'),
	('009', 'quaerat', 'Ut repudiandae autem nesciunt fugiat et quos aut.', 3092806.26, 2783525.63, 'BL', 53, NULL, '2023-11-26 17:35:28', '2024-08-11 10:35:26'),
	('011', 'repudiandae', 'Animi dolor a est sed sed qui.', 7876545.66, 7088891.09, 'GW', 40, NULL, '2024-03-12 13:42:48', '2024-06-28 18:55:34'),
	('012', 'fugiat', 'Veritatis harum nihil tempore itaque necessitatibus ex.', 4420895.70, 3978806.13, 'LY', 83, NULL, '2024-03-14 00:01:04', '2024-06-04 16:37:12'),
	('013', 'vitae', 'Quae aut id eaque dolorem qui rerum sint.', 1906474.53, 1715827.08, 'NU', 29, NULL, '2024-09-27 14:58:21', '2024-10-04 13:07:02'),
	('014', 'quidem', 'Fugit aut exercitationem molestiae at.', 6587214.25, 5928492.83, 'MF', 92, NULL, '2024-05-27 20:44:52', '2024-08-05 23:35:51'),
	('015', 'eaque', 'Iure commodi aut dolorem fugit illum voluptatem et debitis.', 7418516.03, 6676664.43, 'MG', 21, NULL, '2024-10-04 22:44:46', '2024-10-08 10:05:57'),
	('016', 'odio', 'Eos laborum molestias repudiandae cum sequi qui cupiditate.', 6877042.02, 6189337.82, 'GG', 78, NULL, '2024-01-02 10:31:25', '2024-07-29 06:49:49'),
	('017', 'sequia', 'Deserunt adipisci expedita qui enim optio ex.', 3474418.85, 3126976.97, 'WS', 99, NULL, '2023-11-23 20:41:11', '2024-10-11 01:16:19'),
	('018', 'veniam', 'Accusamus rem porro fugiat hic.', 33015.09, 29713.58, 'JP', 96, '1728634563_Screenshot 2024-05-16 010553.png', '2024-06-02 09:45:43', '2024-10-11 01:16:03'),
	('019', 'labore', 'Atque voluptatem atque consequuntur.', 769248.34, 692323.51, 'LU', 24, NULL, '2024-09-30 09:52:49', '2024-10-01 07:36:45'),
	('020', 'officiis', 'Animi sunt natus quae dolore voluptates occaecati.', 7916134.21, 7124520.79, 'SB', 85, NULL, '2024-06-30 05:05:50', '2024-07-13 21:22:32'),
	('021', 'rem', 'Qui culpa et et eos ducimus assumenda molestiae.', 1772522.62, 1595270.36, 'ES', 19, NULL, '2024-06-12 13:45:15', '2024-06-16 07:19:50'),
	('022', 'vel', 'Eos sint sint suscipit non provident est.', 5685620.07, 5117058.06, 'FR', 34, NULL, '2024-05-27 16:16:06', '2024-06-26 11:51:49'),
	('023', 'amet', 'Consequatur qui impedit repellendus et quia aspernatur.', 9959972.40, 8963975.16, 'HT', 35, NULL, '2024-08-22 03:17:15', '2024-09-14 04:36:16'),
	('024', 'ut', 'Vel eos officia expedita magnam amet exercitationem.', 212620.07, 191358.06, 'ZA', 25, NULL, '2024-10-07 22:02:06', '2024-10-10 12:40:39'),
	('025', 'id', 'Dicta officiis blanditiis vitae enim commodi debitis ut.', 3858310.40, 3472479.36, 'EE', 22, NULL, '2023-10-26 22:51:57', '2023-11-29 07:45:28'),
	('026', 'accusamus', 'Rerum et dolorem et assumenda eveniet.', 9540714.04, 8586642.64, 'NU', 41, NULL, '2024-05-27 15:53:40', '2024-08-28 15:51:58'),
	('027', 'ipsum', 'Ducimus minus nam consequuntur porro rerum sit.', 1470171.80, 1323154.62, 'RU', 55, NULL, '2024-08-21 22:47:49', '2024-08-23 18:43:12'),
	('028', 'sequi', 'Sequi quaerat et qui provident est et.', 6428044.44, 5785240.00, 'AR', 46, NULL, '2024-07-21 14:17:08', '2024-09-04 09:04:18'),
	('029', 'eum', 'Saepe doloremque eaque accusantium aperiam ab autem.', 4765320.80, 4288788.72, 'ME', 51, NULL, '2024-02-14 02:47:26', '2024-06-06 20:23:25'),
	('030', 'et', 'Reiciendis praesentium dolor quibusdam et reprehenderit explicabo fugit.', 1288864.18, 1159977.76, 'MR', 64, NULL, '2024-01-06 00:20:00', '2024-03-01 23:12:32'),
	('031', 'saepe', 'Molestias nihil voluptas sunt.', 4490547.51, 4041492.76, 'CC', 13, NULL, '2024-09-02 04:55:32', '2024-10-01 19:15:06'),
	('032', 'cumque', 'Architecto dolore quibusdam occaecati asperiores velit voluptatem id.', 7910711.69, 7119640.52, 'LY', 98, NULL, '2023-11-22 14:08:19', '2024-03-28 22:34:36'),
	('033', 'et', 'Aut et laborum eum laudantium voluptatibus nesciunt omnis.', 9382768.77, 8444491.89, 'NU', 10, NULL, '2024-10-06 13:07:54', '2024-10-06 21:13:12'),
	('034', 'et', 'Sit non doloribus quos eum.', 3864909.22, 3478418.30, 'NU', 62, NULL, '2024-04-21 12:45:54', '2024-09-25 01:32:20'),
	('035', 'quaerat', 'Et esse eius porro enim temporibus.', 3536036.98, 3182433.28, 'LB', 1, NULL, '2024-01-02 20:39:21', '2024-03-17 10:35:13'),
	('036', 'eligendi', 'Magnam dolorem ut consequuntur minima nostrum quis.', 9183161.66, 8264845.49, 'PM', 73, NULL, '2024-06-12 02:29:52', '2024-06-30 16:17:15'),
	('037', 'quae', 'Amet est delectus aut.', 1451139.73, 1306025.76, 'NU', 62, NULL, '2024-07-19 15:37:12', '2024-08-26 08:10:54'),
	('038', 'tenetur', 'Dolorum aut earum dolores odio aut soluta nulla.', 540218.79, 486196.91, 'BO', 24, NULL, '2024-09-04 08:13:17', '2024-10-01 19:22:15'),
	('039', 'rem', 'Suscipit blanditiis ipsa ut consequatur recusandae officia voluptate sint.', 1313772.04, 1182394.84, 'PG', 9, NULL, '2023-12-02 05:21:05', '2024-08-03 19:27:38'),
	('040', 'in', 'Omnis ut exercitationem quisquam repellendus sit beatae.', 2022588.80, 1820329.92, 'SD', 71, NULL, '2024-03-05 02:37:26', '2024-07-25 05:35:54'),
	('041', 'rerum', 'Impedit sed similique veritatis eos.', 8767077.58, 7890369.82, 'NF', 10, NULL, '2024-01-20 10:33:01', '2024-07-18 21:57:12'),
	('042', 'molestiae', 'Aut eos quidem dolor.', 3985879.66, 3587291.69, 'ES', 40, NULL, '2023-10-20 19:57:19', '2024-07-17 08:26:13'),
	('043', 'omnis', 'Hic dicta voluptatem et est tempora voluptatem molestias.', 877879.29, 790091.36, 'GM', 56, NULL, '2024-01-07 21:35:32', '2024-01-31 08:22:54'),
	('044', 'ipsum', 'Earum tempore consequatur et porro id rerum est.', 7548565.11, 6793708.60, 'LU', 92, NULL, '2024-10-06 22:57:55', '2024-10-09 11:37:09'),
	('045', 'laudantium', 'Provident ex id itaque et ex dolorum.', 4631042.49, 4167938.24, 'IE', 39, NULL, '2023-12-17 23:34:31', '2024-05-25 23:31:24'),
	('046', 'dicta', 'Voluptatem aut voluptatibus pariatur aut.', 4858224.20, 4372401.78, 'SX', 22, NULL, '2024-01-06 20:53:31', '2024-07-21 18:28:37'),
	('047', 'in', 'Tempore et nisi laudantium quidem dolor ab et.', 3814046.87, 3432642.18, 'MK', 98, NULL, '2024-03-04 20:02:17', '2024-07-26 22:23:29'),
	('048', 'qui', 'Cumque atque aliquam quo eaque quam maiores.', 7558785.14, 6802906.63, 'ZM', 56, NULL, '2024-02-01 04:18:00', '2024-03-21 21:01:17'),
	('049', 'rerum', 'Aliquam ut corrupti voluptates qui.', 5227443.74, 4704699.37, 'MK', 17, NULL, '2024-07-16 01:07:35', '2024-10-01 10:44:29'),
	('050', 'praesentium', 'Illo libero sed maiores accusantium est sed.', 9872918.14, 8885626.33, 'HT', 75, NULL, '2023-11-20 11:46:16', '2024-04-13 09:04:13'),
	('051', 'animi', 'Optio quam vitae nostrum quidem nisi.', 8198944.66, 7379050.19, 'AR', 2, NULL, '2024-01-01 00:54:15', '2024-05-21 13:34:52'),
	('052', 'aut', 'Molestiae qui est quae nulla omnis.', 3323460.01, 2991114.01, 'ME', 46, NULL, '2024-06-11 03:30:31', '2024-06-23 12:39:56'),
	('053', 'et', 'Aperiam consequuntur deserunt repellendus temporibus et.', 6876647.60, 6188982.84, 'AO', 54, NULL, '2024-08-25 04:12:47', '2024-09-13 01:21:32'),
	('054', 'a', 'Modi officiis necessitatibus alias nostrum et et tempore.', 1523520.59, 1371168.53, 'SR', 48, NULL, '2024-01-10 02:05:45', '2024-06-27 14:11:08'),
	('055', 'perspiciatis', 'Magnam earum quas ut temporibus laborum debitis voluptas.', 2495810.48, 2246229.43, 'MS', 78, NULL, '2024-09-13 22:32:59', '2024-09-26 20:57:22'),
	('056', 'maxime', 'Fugit commodi eos vitae error.', 6585462.97, 5926916.67, 'TM', 18, NULL, '2024-02-06 12:30:08', '2024-05-04 18:42:33'),
	('057', 'modi', 'Qui natus nostrum omnis quibusdam et.', 1689931.75, 1520938.58, 'QA', 73, NULL, '2023-12-13 18:47:33', '2024-05-21 23:11:04'),
	('058', 'nesciunt', 'Molestiae unde officiis dolor nulla eaque nam sapiente.', 2281969.39, 2053772.45, 'BN', 95, NULL, '2024-09-11 14:28:05', '2024-10-08 07:26:37'),
	('059', 'illum', 'Cupiditate possimus illo qui earum est.', 1994036.19, 1794632.57, 'GN', 40, NULL, '2024-01-04 08:27:01', '2024-05-22 14:28:22'),
	('060', 'repellendus', 'Atque ut ut id commodi temporibus ipsum.', 5500648.22, 4950583.40, 'MC', 52, NULL, '2024-09-12 09:23:31', '2024-09-21 23:42:13'),
	('061', 'praesentium', 'Sunt impedit voluptates voluptas vitae ab nam sapiente.', 5768058.79, 5191252.91, 'ZM', 93, NULL, '2024-06-05 06:23:16', '2024-09-27 15:25:29'),
	('062', 'cumque', 'Delectus enim est et esse vero.', 2905287.81, 2614759.03, 'TK', 51, NULL, '2023-12-31 13:16:17', '2024-02-29 06:21:28'),
	('063', 'hic', 'Repellendus maxime impedit aliquid est.', 5192307.30, 4673076.57, 'IE', 61, NULL, '2023-10-18 18:32:15', '2024-06-03 00:16:45'),
	('064', 'nihil', 'Neque repellendus quasi eum repellat quos ipsa.', 9246511.07, 8321859.96, 'CK', 42, NULL, '2024-06-15 00:14:45', '2024-08-25 17:29:10'),
	('065', 'totam', 'Labore quaerat autem nihil repudiandae a aut.', 4375709.66, 3938138.69, 'MH', 38, NULL, '2024-06-11 23:17:19', '2024-06-22 15:10:07'),
	('066', 'iste', 'Quos nobis voluptate nam.', 7224126.57, 6501713.91, 'MU', 34, NULL, '2024-07-02 08:54:27', '2024-09-17 07:05:55'),
	('067', 'delectus', 'A in excepturi voluptatem recusandae maxime placeat.', 2769912.85, 2492921.57, 'PA', 4, NULL, '2024-09-16 03:02:20', '2024-09-27 09:12:15'),
	('068', 'eius', 'Praesentium voluptatem eius doloribus ducimus cumque ex.', 8673272.24, 7805945.02, 'RE', 89, NULL, '2024-07-17 04:59:19', '2024-07-24 15:23:16'),
	('069', 'voluptas', 'Iste dolor molestiae est magni soluta.', 8224177.35, 7401759.62, 'GB', 97, NULL, '2024-08-05 01:11:43', '2024-09-21 02:04:38'),
	('070', 'similique', 'Sed et consequatur ut reprehenderit.', 8065494.92, 7258945.43, 'ME', 38, NULL, '2024-08-19 04:14:19', '2024-08-25 19:05:19'),
	('071', 'eius', 'Doloremque incidunt aut cupiditate sit necessitatibus ab laborum.', 3510485.43, 3159436.89, 'MS', 70, NULL, '2024-07-24 00:11:35', '2024-10-08 20:54:04'),
	('072', 'illum', 'Minima est aut molestiae assumenda.', 4106197.85, 3695578.07, 'KH', 58, NULL, '2024-01-03 04:09:55', '2024-08-11 03:29:15'),
	('073', 'harum', 'Amet corporis maiores fuga et corrupti aut cupiditate.', 59879.66, 53891.69, 'GG', 97, NULL, '2023-10-28 06:31:23', '2024-09-16 22:51:48'),
	('074', 'eos', 'Molestiae facilis saepe ut dignissimos qui error.', 3173053.51, 2855748.16, 'TL', 8, NULL, '2024-05-01 08:20:49', '2024-07-03 01:02:26'),
	('075', 'accusamus', 'Beatae voluptatem voluptatem est magni vel ad.', 4730305.44, 4257274.90, 'SD', 39, NULL, '2024-09-18 16:03:06', '2024-09-19 15:40:54'),
	('076', 'rerum', 'Accusantium aut et a odit.', 3929580.72, 3536622.65, 'BS', 63, NULL, '2024-06-01 23:04:12', '2024-08-05 16:53:51'),
	('077', 'id', 'Nulla provident possimus sit amet sapiente.', 1329823.20, 1196840.88, 'MU', 25, NULL, '2024-05-08 18:26:03', '2024-06-27 13:17:59'),
	('078', 'ratione', 'Cum animi molestiae voluptas id alias veniam quo.', 459051.76, 413146.58, 'KN', 92, NULL, '2024-02-04 22:31:51', '2024-02-19 13:26:15'),
	('079', 'sint', 'Quo quisquam eos architecto et non.', 4781014.55, 4302913.10, 'SH', 83, NULL, '2024-05-02 01:20:03', '2024-08-14 16:40:00'),
	('080', 'officiis', 'Consectetur et architecto aliquid ratione iusto.', 7721209.46, 6949088.51, 'CA', 58, NULL, '2024-04-25 11:38:43', '2024-07-14 14:21:35'),
	('081', 'asperiores', 'Cumque ipsam molestiae porro.', 4696868.19, 4227181.37, 'GD', 73, NULL, '2023-12-11 23:57:18', '2024-04-10 05:22:24'),
	('082', 'modi', 'Voluptatibus et culpa nesciunt hic aspernatur.', 9948823.53, 8953941.18, 'NR', 35, NULL, '2024-06-12 04:29:20', '2024-08-14 16:38:43'),
	('083', 'delectus', 'Fugiat quia voluptatem libero vero labore sed assumenda.', 7139026.28, 6425123.65, 'GI', 14, NULL, '2024-09-12 04:00:11', '2024-09-26 06:37:53'),
	('084', 'soluta', 'Id qui perferendis eum facere minus.', 1243799.18, 1119419.26, 'LC', 66, NULL, '2024-08-17 20:08:56', '2024-09-12 09:53:56'),
	('085', 'molestiae', 'Saepe illum qui labore id consectetur architecto.', 6458429.17, 5812586.25, 'CY', 68, NULL, '2023-11-15 17:07:31', '2024-01-19 05:58:52'),
	('086', 'aperiam', 'Qui similique natus placeat sed omnis.', 6481575.15, 5833417.64, 'GR', 91, NULL, '2024-01-27 22:07:32', '2024-08-04 00:59:56'),
	('087', 'qui', 'Nisi temporibus deserunt ex illum dolorum mollitia quisquam.', 1954254.33, 1758828.90, 'BL', 73, NULL, '2024-10-02 03:34:36', '2024-10-09 23:41:39'),
	('088', 'consequuntur', 'Recusandae repellendus saepe et ratione deserunt reiciendis possimus.', 6599692.24, 5939723.02, 'FJ', 55, NULL, '2023-10-29 06:19:11', '2024-04-15 16:10:33'),
	('089', 'omnis', 'Necessitatibus consequatur sit tenetur qui.', 201798.54, 181618.69, 'GU', 3, NULL, '2023-12-08 20:05:01', '2024-09-09 10:13:28'),
	('090', 'quibusdam', 'Numquam et velit soluta id quo repellat.', 4998802.42, 4498922.18, 'MA', 83, NULL, '2024-03-11 09:21:56', '2024-07-30 09:52:51'),
	('091', 'possimus', 'Vero in voluptatem illum suscipit eaque.', 4775879.61, 4298291.65, 'CN', 85, NULL, '2024-05-08 00:38:37', '2024-07-06 13:39:01'),
	('092', 'reprehenderit', 'Esse dolor sint dolor magni velit.', 9755350.00, 8779815.00, 'AW', 83, NULL, '2024-06-12 16:20:53', '2024-09-08 06:07:49'),
	('093', 'voluptate', 'Et non eveniet aut ad beatae.', 3794637.53, 3415173.78, 'FR', 79, NULL, '2024-07-02 00:18:56', '2024-08-14 06:46:46'),
	('094', 'mollitia', 'Corporis totam voluptatem sequi ea omnis facere.', 2373204.31, 2135883.88, 'TD', 39, NULL, '2024-07-24 08:22:28', '2024-08-17 08:12:26'),
	('095', 'qui', 'Velit commodi dolor nesciunt repellat laboriosam ipsum.', 4336226.52, 3902603.87, 'TG', 58, NULL, '2024-03-17 07:46:42', '2024-05-13 14:22:31'),
	('096', 'suscipit', 'Veniam natus velit doloribus sint.', 4706394.33, 4235754.90, 'TC', 49, NULL, '2024-03-31 05:13:51', '2024-05-12 07:05:48'),
	('097', 'sed', 'Est aut blanditiis dignissimos dolorem quos quibusdam aut.', 8562031.52, 7705828.37, 'SK', 89, NULL, '2024-02-14 13:20:46', '2024-08-16 14:48:25'),
	('098', 'porro', 'Doloribus ut sint eum soluta in eos.', 804045.37, 723640.83, 'SN', 96, NULL, '2023-12-06 20:42:09', '2024-06-01 03:30:19'),
	('099', 'qui', 'Qui iste iusto est ratione autem eaque qui.', 9688982.86, 8720084.57, 'LS', 39, NULL, '2024-02-04 02:26:10', '2024-09-12 02:43:19'),
	('100', 'culpa', 'Dolore et distinctio consequuntur eum quos voluptas magni molestias.', 4815965.61, 4334369.05, 'BW', 66, NULL, '2024-03-16 15:18:06', '2024-04-15 17:37:02'),
	('101', 'nobis', 'Sit nulla voluptas provident vero eius voluptatem nostrum.', 1882018.01, 1693816.21, 'PK', 40, NULL, '2024-03-14 01:38:52', '2024-10-01 13:57:15'),
	('102', 'ipsum', 'Ipsum consequatur dolorem ipsum dolores facilis ut quod.', 3053434.44, 2748091.00, 'KW', 49, NULL, '2024-07-09 12:25:50', '2024-07-20 10:23:06'),
	('103', 'TEST', 'APES', 6755555.00, 6700000.00, 'IP', 1, '1728634118_Screenshot 2024-07-19 153039.png', '2024-10-11 01:08:38', '2024-10-11 01:08:38');

-- Dumping structure for table t1_2022130006.sessions
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table t1_2022130006.sessions: ~1 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('9WXVLXAF8r5nCzbbgQwwj0CBz7H8eglgOlkPt4Gg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWU5IeFE3U1MydEMyRDNXcmNnU01INlpXUTdnazlMRjFDcXM5V1NMSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1728636414);

-- Dumping structure for table t1_2022130006.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table t1_2022130006.users: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

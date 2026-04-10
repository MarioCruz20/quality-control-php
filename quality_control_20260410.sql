-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: quality_control
-- ------------------------------------------------------
-- Server version	5.7.44-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `batch_analysis`
--

DROP TABLE IF EXISTS `batch_analysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_analysis` (
  `batch_analysis_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `isactive` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `lot_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`batch_analysis_id`),
  KEY `batch_analysis_lot_id_foreign` (`lot_id`),
  CONSTRAINT `batch_analysis_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lot` (`lot_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_analysis`
--

LOCK TABLES `batch_analysis` WRITE;
/*!40000 ALTER TABLE `batch_analysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_analysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_analysis_line`
--

DROP TABLE IF EXISTS `batch_analysis_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_analysis_line` (
  `batch_analysis_line_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `isactive` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `moisture` decimal(8,2) DEFAULT NULL,
  `temperature` decimal(8,2) DEFAULT NULL,
  `sodium` decimal(8,2) DEFAULT NULL,
  `protein` decimal(8,2) DEFAULT NULL,
  `number_batch` int(11) DEFAULT NULL,
  `batch_analysis_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`batch_analysis_line_id`),
  KEY `batch_analysis_line_batch_analysis_id_foreign` (`batch_analysis_id`),
  CONSTRAINT `batch_analysis_line_batch_analysis_id_foreign` FOREIGN KEY (`batch_analysis_id`) REFERENCES `batch_analysis` (`batch_analysis_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_analysis_line`
--

LOCK TABLES `batch_analysis_line` WRITE;
/*!40000 ALTER TABLE `batch_analysis_line` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_analysis_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_analysis_state`
--

DROP TABLE IF EXISTS `batch_analysis_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_analysis_state` (
  `batch_analysis_state_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `isactive` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datefrom` date DEFAULT NULL,
  `dateto` datetime DEFAULT NULL,
  `date_diff` decimal(8,2) DEFAULT NULL,
  `batch_analysis_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`batch_analysis_state_id`),
  KEY `batch_analysis_state_batch_analysis_id_foreign` (`batch_analysis_id`),
  CONSTRAINT `batch_analysis_state_batch_analysis_id_foreign` FOREIGN KEY (`batch_analysis_id`) REFERENCES `batch_analysis` (`batch_analysis_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_analysis_state`
--

LOCK TABLES `batch_analysis_state` WRITE;
/*!40000 ALTER TABLE `batch_analysis_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_analysis_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lot`
--

DROP TABLE IF EXISTS `lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lot` (
  `lot_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `isactive` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production_date` datetime DEFAULT NULL,
  `analysis_date` datetime DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lot_id`),
  KEY `lot_product_id_foreign` (`product_id`),
  CONSTRAINT `lot_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lot`
--

LOCK TABLES `lot` WRITE;
/*!40000 ALTER TABLE `lot` DISABLE KEYS */;
/*!40000 ALTER TABLE `lot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_03_03_210703_create_production_line_table',2),(5,'2026_03_03_225258_modify_isactive_in_production_line_table',3),(6,'2026_03_03_225501_create_product_table',3),(7,'2026_03_04_010907_add_updatedby_to_production_line1_table',4),(8,'2026_03_04_011709_modify_isactive_in_production_line1_table',5),(14,'2026_03_04_031032_create_quality_parameters_table',6),(15,'2026_03_04_031107_create_lot_table',6),(16,'2026_03_04_031126_create_batch_analysis_table',6),(17,'2026_03_04_031138_create_batch_analysis_state_table',6),(18,'2026_03_04_031151_create_batch_analysis_line_table',6),(19,'2026_03_25_054048_create_products_table',7),(20,'2026_03_26_012129_create_personal_access_tokens_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `isactive` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `production_line_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_production_line_id_foreign` (`production_line_id`),
  CONSTRAINT `product_production_line_id_foreign` FOREIGN KEY (`production_line_id`) REFERENCES `production_line` (`production_line_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2026-03-18 05:01:07',0,'2026-04-08 18:48:06','Y','Prueba API Product','API-1122',NULL,1),(3,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Doritos','SKU-5025',NULL,1),(4,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Snack Mix','SKU-4244',NULL,1),(5,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Snack Mix','SKU-1860',NULL,1),(6,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Nachos','SKU-8400',NULL,1),(7,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Tortilla Chips','SKU-2378',NULL,1),(8,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Doritos','SKU-1452',NULL,1),(9,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Snack Mix','SKU-0187',NULL,1),(10,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Nachos','SKU-1962',NULL,1),(11,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Doritos','SKU-8240',NULL,1),(12,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Snack Mix','SKU-9952',NULL,1),(13,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Doritos','SKU-8099',NULL,1),(14,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Nachos','SKU-0385',NULL,1),(15,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Doritos','SKU-6512',NULL,1),(16,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Papas Fritas','SKU-6286',NULL,1),(17,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Tortilla Chips','SKU-3454',NULL,1),(18,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Doritos','SKU-6037',NULL,1),(19,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Tortilla Chips','SKU-9954',NULL,1),(20,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Tortilla Chips','SKU-2672',NULL,1),(21,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Snack Mix','SKU-7016',NULL,1),(22,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34','Y','Papas Fritas','SKU-8398',NULL,1),(23,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Doritos','SKU-4821',NULL,1),(24,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Tortilla Chips','SKU-4579',NULL,1),(25,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Doritos','SKU-9263',NULL,1),(26,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Doritos','SKU-1983',NULL,1),(27,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Doritos','SKU-9298',NULL,1),(28,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Snack Mix','SKU-6941',NULL,1),(29,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Nachos','SKU-4486',NULL,1),(30,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Tortilla Chips','SKU-6010',NULL,1),(31,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Tortilla Chips','SKU-5118',NULL,1),(32,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Nachos','SKU-0151',NULL,1),(33,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Nachos','SKU-2859',NULL,1),(34,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Doritos','SKU-9812',NULL,1),(35,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Doritos','SKU-7516',NULL,1),(36,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Nachos','SKU-7856',NULL,1),(37,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Snack Mix','SKU-5785',NULL,1),(38,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Doritos','SKU-0186',NULL,1),(39,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Snack Mix','SKU-1069',NULL,1),(40,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Doritos','SKU-2817',NULL,1),(41,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Papas Fritas','SKU-0442',NULL,1),(42,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58','Y','Snack Mix','SKU-7996',NULL,1),(43,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Nachos','SKU-8560',NULL,1),(44,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Nachos','SKU-8559',NULL,1),(45,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Snack Mix','SKU-8248',NULL,1),(46,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Doritos','SKU-7973',NULL,1),(47,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Doritos','SKU-1635',NULL,1),(48,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Nachos','SKU-6795',NULL,1),(49,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Snack Mix','SKU-3481',NULL,1),(50,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Tortilla Chips','SKU-1217',NULL,1),(51,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Doritos','SKU-5791',NULL,1),(52,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Papas Fritas','SKU-2740',NULL,1),(53,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Tortilla Chips','SKU-5203',NULL,1),(54,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Nachos','SKU-7756',NULL,1),(55,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Nachos','SKU-5941',NULL,1),(56,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Snack Mix','SKU-2212',NULL,1),(57,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Snack Mix','SKU-4046',NULL,1),(58,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Tortilla Chips','SKU-9089',NULL,1),(59,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Snack Mix','SKU-2509',NULL,1),(60,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Nachos','SKU-1494',NULL,1),(61,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Snack Mix','SKU-1958',NULL,1),(62,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35','Y','Doritos','SKU-7194',NULL,1),(63,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','Y','quia eum','PRD-4347',NULL,1),(64,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','N','quidem commodi','PRD-8679',NULL,1),(65,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','Y','aliquid ut','PRD-9779',NULL,1),(66,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','N','sunt quae','PRD-3490',NULL,1),(67,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','N','sunt sit','PRD-3747',NULL,1),(68,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','Y','enim architecto','PRD-4328',NULL,1),(69,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','N','assumenda doloremque','PRD-0578',NULL,1),(70,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','Y','molestiae autem','PRD-9743',NULL,1),(71,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','N','omnis ex','PRD-9406',NULL,1),(72,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','N','neque temporibus','PRD-2126',NULL,1),(73,'2026-04-08 18:51:18',0,'2026-04-08 18:51:18','Y','Prueba API Product','API-9999',NULL,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production_line`
--

DROP TABLE IF EXISTS `production_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `production_line` (
  `production_line_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updatedby` int(10) unsigned DEFAULT NULL,
  `isactive` enum('Y','N') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`production_line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production_line`
--

LOCK TABLES `production_line` WRITE;
/*!40000 ALTER TABLE `production_line` DISABLE KEYS */;
INSERT INTO `production_line` VALUES (1,'2026-03-12 01:53:27',0,'2026-04-08 18:47:44',0,'Y','Prueba API 1','Prueba API1'),(2,'2026-03-12 01:59:12',0,'2026-03-12 02:00:49',0,'Y','Test','LINEA-TEST'),(3,'2026-03-18 00:34:34',0,'2026-03-18 00:34:45',0,'Y','Boquitas','LINE-SNACK'),(4,'2026-03-19 01:07:27',0,'2026-03-19 01:07:27',0,'N','eaque mollitia','LINE-0838'),(5,'2026-03-19 01:07:27',0,'2026-03-19 01:07:27',0,'Y','quia tenetur','LINE-7952'),(6,'2026-03-19 01:07:27',0,'2026-03-19 01:07:27',0,'N','aut facilis','LINE-1742'),(7,'2026-03-19 02:17:58',0,'2026-03-19 02:17:58',0,'Y','aliquid aut','LINE-8958'),(8,'2026-03-19 02:17:58',0,'2026-03-19 02:17:58',0,'Y','et voluptatem','LINE-6406'),(9,'2026-03-19 02:17:58',0,'2026-03-19 02:17:58',0,'Y','excepturi magni','LINE-5536'),(10,'2026-03-19 02:17:58',0,'2026-03-19 02:17:58',0,'Y','fugit et','LINE-4009'),(11,'2026-03-19 02:17:58',0,'2026-03-19 02:17:58',0,'N','blanditiis accusamus','LINE-5694'),(12,'2026-03-19 02:17:58',0,'2026-03-19 02:17:58',0,'Y','quaerat corporis','LINE-7340'),(13,'2026-03-19 02:17:58',0,'2026-03-19 02:17:58',0,'N','voluptates labore','LINE-4428'),(14,'2026-03-19 02:17:58',0,'2026-03-19 02:17:58',0,'Y','temporibus laborum','LINE-0467'),(15,'2026-03-19 02:17:58',0,'2026-03-19 02:17:58',0,'N','consequuntur quos','LINE-2484'),(16,'2026-03-19 02:17:58',0,'2026-03-19 02:17:58',0,'N','consequatur incidunt','LINE-0334'),(17,'2026-03-25 04:41:28',0,'2026-03-25 04:41:28',0,'N','mollitia rerum','LINE-8713'),(18,'2026-03-25 04:41:28',0,'2026-03-25 04:41:28',0,'N','itaque maxime','LINE-1322'),(19,'2026-03-25 04:41:28',0,'2026-03-25 04:41:28',0,'Y','incidunt perferendis','LINE-9665'),(20,'2026-03-25 04:41:28',0,'2026-03-25 04:41:28',0,'N','id sed','LINE-1017'),(21,'2026-03-25 04:41:28',0,'2026-03-25 04:41:28',0,'N','deleniti ut','LINE-1381'),(22,'2026-03-25 04:41:28',0,'2026-03-25 04:41:28',0,'Y','fugiat unde','LINE-8438'),(23,'2026-03-25 04:41:28',0,'2026-03-25 04:41:28',0,'N','iste dicta','LINE-5359'),(24,'2026-03-25 04:41:28',0,'2026-03-25 04:41:28',0,'N','occaecati asperiores','LINE-5368'),(25,'2026-03-25 04:41:28',0,'2026-03-25 04:41:28',0,'N','minima nisi','LINE-5278'),(26,'2026-03-25 04:41:28',0,'2026-03-25 04:41:28',0,'Y','occaecati quos','LINE-3421'),(27,'2026-03-25 04:42:28',0,'2026-03-25 04:42:28',0,'N','nobis et','LINE-9442'),(28,'2026-03-25 04:42:28',0,'2026-03-25 04:42:28',0,'Y','et occaecati','LINE-6572'),(29,'2026-03-25 04:42:28',0,'2026-03-25 04:42:28',0,'Y','omnis necessitatibus','LINE-6319'),(30,'2026-03-25 04:42:28',0,'2026-03-25 04:42:28',0,'Y','mollitia voluptatem','LINE-5833'),(31,'2026-03-25 04:42:28',0,'2026-03-25 04:42:28',0,'Y','sit aut','LINE-1048'),(32,'2026-03-25 04:42:28',0,'2026-03-25 04:42:28',0,'Y','iste consequatur','LINE-5406'),(33,'2026-03-25 04:42:28',0,'2026-03-25 04:42:28',0,'Y','vel distinctio','LINE-2242'),(34,'2026-03-25 04:42:28',0,'2026-03-25 04:42:28',0,'N','non ipsa','LINE-3125'),(35,'2026-03-25 04:42:28',0,'2026-03-25 04:42:28',0,'N','consectetur accusamus','LINE-8635'),(36,'2026-03-25 04:42:28',0,'2026-03-25 04:42:28',0,'Y','enim ipsum','LINE-1960'),(37,'2026-03-25 04:44:27',0,'2026-03-25 04:44:27',0,'Y','in exercitationem','LINE-3043'),(38,'2026-03-25 04:44:27',0,'2026-03-25 04:44:27',0,'N','repellat ut','LINE-2964'),(39,'2026-03-25 04:44:27',0,'2026-03-25 04:44:27',0,'Y','vel assumenda','LINE-1361'),(40,'2026-03-25 04:44:27',0,'2026-03-25 04:44:27',0,'Y','ratione deleniti','LINE-9198'),(41,'2026-03-25 04:44:27',0,'2026-03-25 04:44:27',0,'N','dignissimos quidem','LINE-5441'),(42,'2026-03-25 04:44:27',0,'2026-03-25 04:44:27',0,'Y','rerum blanditiis','LINE-0246'),(45,'2026-03-25 04:44:27',0,'2026-03-25 04:44:27',0,'Y','vel dolorem','LINE-7269'),(46,'2026-03-25 04:44:27',0,'2026-03-26 02:28:57',0,'Y','Prueba API 1','Prueba API1'),(47,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34',0,'Y','quo placeat','LINE-1779'),(48,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34',0,'Y','molestiae eos','LINE-8792'),(49,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34',0,'Y','necessitatibus qui','LINE-4942'),(50,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34',0,'Y','facere ad','LINE-0728'),(51,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34',0,'Y','quas nemo','LINE-5648'),(52,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34',0,'Y','autem iure','LINE-8074'),(53,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34',0,'N','optio ullam','LINE-4699'),(54,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34',0,'Y','molestiae vitae','LINE-6242'),(55,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34',0,'Y','ea enim','LINE-0047'),(56,'2026-03-25 04:47:34',0,'2026-03-25 04:47:34',0,'Y','quas quae','LINE-0523'),(57,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58',0,'N','autem atque','LINE-2420'),(58,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58',0,'Y','quod magni','LINE-1889'),(59,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58',0,'N','et quia','LINE-6844'),(60,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58',0,'Y','asperiores corporis','LINE-8829'),(61,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58',0,'Y','labore maxime','LINE-4694'),(62,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58',0,'Y','aut qui','LINE-5428'),(63,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58',0,'N','distinctio aut','LINE-9846'),(64,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58',0,'N','debitis quaerat','LINE-9421'),(65,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58',0,'Y','et error','LINE-2257'),(66,'2026-03-25 04:49:58',0,'2026-03-25 04:49:58',0,'N','fugiat totam','LINE-0173'),(67,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35',0,'Y','aut voluptas','LINE-1055'),(68,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35',0,'N','eos quibusdam','LINE-5041'),(69,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35',0,'N','eos doloribus','LINE-1666'),(70,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35',0,'N','ad molestiae','LINE-4898'),(71,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35',0,'N','rem quaerat','LINE-2786'),(72,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35',0,'N','et autem','LINE-9155'),(73,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35',0,'Y','perspiciatis in','LINE-1354'),(74,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35',0,'N','tempora omnis','LINE-1481'),(75,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35',0,'Y','voluptas a','LINE-0667'),(76,'2026-03-25 04:50:35',0,'2026-03-25 04:50:35',0,'N','ea laboriosam','LINE-5113'),(77,'2026-03-25 04:57:44',0,'2026-03-25 04:57:44',0,'Y','voluptatum molestiae','LINE-6507'),(78,'2026-03-25 04:57:44',0,'2026-03-25 04:57:44',0,'Y','dignissimos voluptates','LINE-7432'),(79,'2026-03-25 04:57:44',0,'2026-03-25 04:57:44',0,'N','tempore et','LINE-3080'),(80,'2026-03-25 04:57:44',0,'2026-03-25 04:57:44',0,'N','dolores rerum','LINE-5787'),(81,'2026-03-25 04:57:44',0,'2026-03-25 04:57:44',0,'N','soluta assumenda','LINE-2281'),(82,'2026-03-25 04:57:44',0,'2026-03-25 04:57:44',0,'N','dicta sint','LINE-3596'),(83,'2026-03-25 04:57:44',0,'2026-03-25 04:57:44',0,'N','dignissimos fuga','LINE-9143'),(84,'2026-03-25 04:57:44',0,'2026-03-25 04:57:44',0,'Y','laudantium nisi','LINE-0592'),(85,'2026-03-25 04:57:44',0,'2026-03-25 04:57:44',0,'N','earum sed','LINE-2621'),(86,'2026-03-25 04:57:44',0,'2026-03-25 04:57:44',0,'Y','omnis consequatur','LINE-1636'),(87,'2026-03-25 04:59:59',0,'2026-03-25 04:59:59',0,'Y','excepturi voluptas','LINE-2176'),(88,'2026-03-25 04:59:59',0,'2026-03-25 04:59:59',0,'Y','mollitia esse','LINE-9384'),(89,'2026-03-25 04:59:59',0,'2026-03-25 04:59:59',0,'Y','perspiciatis id','LINE-6268'),(90,'2026-03-25 04:59:59',0,'2026-03-25 04:59:59',0,'Y','voluptatem enim','LINE-2998'),(91,'2026-03-25 04:59:59',0,'2026-03-25 04:59:59',0,'N','maxime sunt','LINE-4473'),(92,'2026-03-25 04:59:59',0,'2026-03-25 04:59:59',0,'Y','magnam excepturi','LINE-5646'),(93,'2026-03-25 04:59:59',0,'2026-03-25 04:59:59',0,'Y','officiis ut','LINE-5448'),(94,'2026-03-25 04:59:59',0,'2026-03-25 04:59:59',0,'Y','voluptatem facilis','LINE-2703'),(95,'2026-03-25 04:59:59',0,'2026-03-25 04:59:59',0,'Y','nostrum sed','LINE-7106'),(96,'2026-03-25 04:59:59',0,'2026-03-25 04:59:59',0,'N','cum officiis','LINE-2450'),(97,'2026-03-25 05:01:48',0,'2026-03-25 05:01:48',0,'N','magni nesciunt','LINE-4027'),(98,'2026-03-25 05:01:48',0,'2026-03-25 05:01:48',0,'N','accusantium corporis','LINE-3187'),(99,'2026-03-25 05:01:48',0,'2026-03-25 05:01:48',0,'N','at et','LINE-4553'),(100,'2026-03-25 05:01:48',0,'2026-03-25 05:01:48',0,'N','ullam itaque','LINE-5231'),(101,'2026-03-25 05:01:48',0,'2026-03-25 05:01:48',0,'Y','assumenda sed','LINE-0165'),(102,'2026-03-25 05:01:48',0,'2026-03-25 05:01:48',0,'Y','neque voluptatibus','LINE-1540'),(103,'2026-03-25 05:01:48',0,'2026-03-25 05:01:48',0,'N','quis accusantium','LINE-8572'),(104,'2026-03-25 05:01:48',0,'2026-03-25 05:01:48',0,'N','repudiandae architecto','LINE-5492'),(105,'2026-03-25 05:01:48',0,'2026-03-25 05:01:48',0,'Y','earum illum','LINE-8834'),(106,'2026-03-25 05:01:48',0,'2026-03-25 05:01:48',0,'Y','voluptatem architecto','LINE-2095'),(107,'2026-03-25 05:11:32',0,'2026-03-25 05:11:32',0,'Y','et deserunt','LINE-7783'),(108,'2026-03-25 05:11:32',0,'2026-03-25 05:11:32',0,'Y','consequatur adipisci','LINE-1988'),(109,'2026-03-25 05:11:32',0,'2026-03-25 05:11:32',0,'N','velit qui','LINE-2077'),(110,'2026-03-25 05:11:32',0,'2026-03-25 05:11:32',0,'N','culpa explicabo','LINE-0929'),(111,'2026-03-25 05:11:32',0,'2026-03-25 05:11:32',0,'N','qui quia','LINE-7163'),(112,'2026-03-25 05:11:32',0,'2026-03-25 05:11:32',0,'N','ipsum temporibus','LINE-9632'),(113,'2026-03-25 05:11:32',0,'2026-03-25 05:11:32',0,'N','fuga eum','LINE-1410'),(114,'2026-03-25 05:11:32',0,'2026-03-25 05:11:32',0,'N','animi nesciunt','LINE-5105'),(115,'2026-03-25 05:11:32',0,'2026-03-25 05:11:32',0,'Y','praesentium ab','LINE-0143'),(116,'2026-03-25 05:11:32',0,'2026-03-25 05:11:32',0,'N','itaque aliquam','LINE-8956'),(117,'2026-03-25 05:12:40',0,'2026-03-25 05:12:40',0,'N','rem atque','LINE-9002'),(118,'2026-03-25 05:12:40',0,'2026-03-25 05:12:40',0,'Y','ut rerum','LINE-4874'),(119,'2026-03-25 05:12:40',0,'2026-03-25 05:12:40',0,'N','repudiandae consequatur','LINE-5722'),(120,'2026-03-25 05:12:40',0,'2026-03-25 05:12:40',0,'Y','accusantium est','LINE-1252'),(121,'2026-03-25 05:12:40',0,'2026-03-25 05:12:40',0,'N','sit recusandae','LINE-2181'),(122,'2026-03-25 05:12:40',0,'2026-03-25 05:12:40',0,'N','ex dolor','LINE-6711'),(123,'2026-03-25 05:12:40',0,'2026-03-25 05:12:40',0,'Y','similique in','LINE-9293'),(124,'2026-03-25 05:12:40',0,'2026-03-25 05:12:40',0,'Y','nemo magni','LINE-0006'),(125,'2026-03-25 05:12:40',0,'2026-03-25 05:12:40',0,'Y','rem repellendus','LINE-2196'),(126,'2026-03-25 05:12:40',0,'2026-03-25 05:12:40',0,'N','maxime consequuntur','LINE-6407'),(127,'2026-03-25 05:13:02',0,'2026-03-25 05:13:02',0,'Y','omnis ratione','LINE-8580'),(128,'2026-03-25 05:13:02',0,'2026-03-25 05:13:02',0,'Y','provident est','LINE-1831'),(129,'2026-03-25 05:13:02',0,'2026-03-25 05:13:02',0,'Y','amet voluptatem','LINE-5754'),(130,'2026-03-25 05:13:02',0,'2026-03-25 05:13:02',0,'Y','facere autem','LINE-6285'),(131,'2026-03-25 05:13:02',0,'2026-03-25 05:13:02',0,'N','amet iste','LINE-2779'),(132,'2026-03-25 05:13:02',0,'2026-03-25 05:13:02',0,'N','qui nobis','LINE-7797'),(133,'2026-03-25 05:13:02',0,'2026-03-25 05:13:02',0,'Y','sit sit','LINE-2260'),(134,'2026-03-25 05:13:02',0,'2026-03-25 05:13:02',0,'N','beatae reiciendis','LINE-8958'),(135,'2026-03-25 05:13:02',0,'2026-03-25 05:13:02',0,'N','ipsam dolor','LINE-4088'),(136,'2026-03-25 05:13:02',0,'2026-03-25 05:13:02',0,'N','corporis officiis','LINE-3511'),(137,'2026-03-25 05:35:12',0,'2026-03-25 05:35:12',0,'N','est dignissimos','LINE-9187'),(138,'2026-03-25 05:35:12',0,'2026-03-25 05:35:12',0,'Y','dicta molestias','LINE-9240'),(139,'2026-03-25 05:35:12',0,'2026-03-25 05:35:12',0,'Y','fugiat quas','LINE-3308'),(140,'2026-03-25 05:35:12',0,'2026-03-25 05:35:12',0,'N','autem et','LINE-8324'),(141,'2026-03-25 05:35:12',0,'2026-03-25 05:35:12',0,'N','et id','LINE-7556'),(142,'2026-03-25 05:35:12',0,'2026-03-25 05:35:12',0,'N','tempore cumque','LINE-0695'),(143,'2026-03-25 05:35:12',0,'2026-03-25 05:35:12',0,'Y','alias rerum','LINE-0332'),(144,'2026-03-25 05:35:12',0,'2026-03-25 05:35:12',0,'N','in odio','LINE-4998'),(145,'2026-03-25 05:35:12',0,'2026-03-25 05:35:12',0,'N','fugiat quia','LINE-9848'),(146,'2026-03-25 05:35:12',0,'2026-03-25 05:35:12',0,'Y','et omnis','LINE-7299'),(147,'2026-03-25 05:35:39',0,'2026-03-25 05:35:39',0,'N','recusandae accusamus','LINE-1566'),(148,'2026-03-25 05:35:39',0,'2026-03-25 05:35:39',0,'Y','molestias rem','LINE-7235'),(149,'2026-03-25 05:35:39',0,'2026-03-25 05:35:39',0,'Y','magni eum','LINE-4775'),(150,'2026-03-25 05:35:39',0,'2026-03-25 05:35:39',0,'Y','ullam consequuntur','LINE-3882'),(151,'2026-03-25 05:35:39',0,'2026-03-25 05:35:39',0,'Y','repudiandae autem','LINE-2954'),(152,'2026-03-25 05:35:39',0,'2026-03-25 05:35:39',0,'N','sunt praesentium','LINE-6000'),(153,'2026-03-25 05:35:39',0,'2026-03-25 05:35:39',0,'N','eos aut','LINE-5995'),(154,'2026-03-25 05:35:39',0,'2026-03-25 05:35:39',0,'Y','est laudantium','LINE-9984'),(155,'2026-03-25 05:35:39',0,'2026-03-25 05:35:39',0,'Y','id quis','LINE-0387'),(156,'2026-03-25 05:35:39',0,'2026-03-25 05:35:39',0,'Y','unde quibusdam','LINE-7590'),(157,'2026-03-25 05:38:27',0,'2026-03-25 05:38:27',0,'N','consequuntur deserunt','LINE-8009'),(158,'2026-03-25 05:38:27',0,'2026-03-25 05:38:27',0,'N','sapiente ut','LINE-7837'),(159,'2026-03-25 05:38:27',0,'2026-03-25 05:38:27',0,'Y','eos iusto','LINE-1335'),(160,'2026-03-25 05:38:27',0,'2026-03-25 05:38:27',0,'Y','nostrum ab','LINE-9332'),(161,'2026-03-25 05:38:27',0,'2026-03-25 05:38:27',0,'N','quibusdam consequatur','LINE-3151'),(162,'2026-03-25 05:38:27',0,'2026-03-25 05:38:27',0,'Y','sit dolore','LINE-0980'),(163,'2026-03-25 05:38:27',0,'2026-03-25 05:38:27',0,'Y','tenetur dolorem','LINE-5999'),(164,'2026-03-25 05:38:27',0,'2026-03-25 05:38:27',0,'N','sit earum','LINE-6115'),(165,'2026-03-25 05:38:27',0,'2026-03-25 05:38:27',0,'N','voluptatum dolor','LINE-3572'),(166,'2026-03-25 05:38:27',0,'2026-03-25 05:38:27',0,'N','ex et','LINE-0670'),(167,'2026-03-25 05:46:03',0,'2026-03-25 05:46:03',0,'N','quam non','LINE-5285'),(168,'2026-03-25 05:46:03',0,'2026-03-25 05:46:03',0,'Y','ut voluptatem','LINE-9306'),(169,'2026-03-25 05:46:03',0,'2026-03-25 05:46:03',0,'Y','qui ut','LINE-4019'),(170,'2026-03-25 05:46:03',0,'2026-03-25 05:46:03',0,'N','unde sed','LINE-1276'),(171,'2026-03-25 05:46:03',0,'2026-03-25 05:46:03',0,'Y','voluptate soluta','LINE-4043'),(172,'2026-03-25 05:46:03',0,'2026-03-25 05:46:03',0,'Y','praesentium repellat','LINE-2038'),(173,'2026-03-25 05:46:03',0,'2026-03-25 05:46:03',0,'N','aliquam aut','LINE-6709'),(174,'2026-03-25 05:46:03',0,'2026-03-25 05:46:03',0,'Y','placeat provident','LINE-5904'),(175,'2026-03-25 05:46:03',0,'2026-03-25 05:46:03',0,'Y','tempore modi','LINE-4976'),(176,'2026-03-25 05:46:03',0,'2026-03-25 05:46:03',0,'Y','in architecto','LINE-1279'),(177,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13',0,'Y','occaecati et','LINE-1375'),(178,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13',0,'N','tempora ut','LINE-4520'),(179,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13',0,'Y','quas magni','LINE-3202'),(180,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13',0,'Y','ea aut','LINE-0663'),(181,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13',0,'N','qui aut','LINE-0723'),(182,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13',0,'N','quia ut','LINE-0101'),(183,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13',0,'Y','cum qui','LINE-0088'),(184,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13',0,'Y','et excepturi','LINE-9606'),(185,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13',0,'Y','officia tenetur','LINE-6428'),(186,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13',0,'Y','sunt mollitia','LINE-2779'),(187,'2026-03-26 02:36:07',0,'2026-03-26 02:36:07',0,'Y','Api NOMBRE','API descripcion'),(188,'2026-03-26 02:37:42',0,'2026-03-26 02:37:42',0,'Y','Api NOMBRE 2','API 2 descripcion');
/*!40000 ALTER TABLE `production_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality_parameters`
--

DROP TABLE IF EXISTS `quality_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quality_parameters` (
  `quality_parameter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `createdby` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `isactive` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_moisture` decimal(8,2) DEFAULT NULL,
  `max_moisture` decimal(8,2) DEFAULT NULL,
  `min_temperature` decimal(8,2) DEFAULT NULL,
  `max_temperature` decimal(8,2) DEFAULT NULL,
  `min_sodium` decimal(8,2) DEFAULT NULL,
  `max_sodium` decimal(8,2) DEFAULT NULL,
  `min_protein` decimal(8,2) DEFAULT NULL,
  `max_protein` decimal(8,2) DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`quality_parameter_id`),
  KEY `quality_parameters_product_id_foreign` (`product_id`),
  CONSTRAINT `quality_parameters_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality_parameters`
--

LOCK TABLES `quality_parameters` WRITE;
/*!40000 ALTER TABLE `quality_parameters` DISABLE KEYS */;
INSERT INTO `quality_parameters` VALUES (1,'2026-03-25 05:51:13',0,'2026-04-08 19:21:11','Y',2.20,2.20,222.00,333.00,100.00,400.00,2.00,6.00,1),(3,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','Y',1.04,3.24,155.00,186.00,108.00,498.00,1.00,5.00,1),(4,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','Y',1.62,3.87,144.00,200.00,83.00,343.00,2.00,5.00,6),(5,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','Y',1.76,3.33,157.00,185.00,85.00,460.00,1.00,5.00,1),(6,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','Y',1.65,3.85,148.00,186.00,95.00,384.00,3.00,8.00,7),(7,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','Y',1.61,3.92,145.00,184.00,88.00,429.00,3.00,6.00,8),(8,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','Y',1.24,3.14,154.00,193.00,101.00,403.00,1.00,7.00,8),(9,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','Y',1.14,3.80,143.00,197.00,96.00,421.00,2.00,7.00,8),(10,'2026-03-25 05:51:13',0,'2026-03-25 05:51:13','Y',1.51,3.77,152.00,184.00,90.00,359.00,3.00,6.00,10),(11,'2026-04-08 19:17:43',0,'2026-04-08 19:17:43','Y',1.20,3.50,150.00,190.00,100.00,400.00,2.00,6.00,1);
/*!40000 ALTER TABLE `quality_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('KyO1RK5ywtVzrjauwScb7k0Hl0eTd57fePPiFQo3',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoibGp0RVJNREJKOXhYbGc0NGVjRk94ckRDbzZ3Z1FNTzh2YlJGa09HOSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1775794491),('NEkzERP2LPfmJXqxRrXmQtyRdxGj44kf0NFOZUPw',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoidW8wNG1Dak5kNFBoem81eXVUaXVCSWNKb0trU3JKUU53ZVlzSmtaRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ob21lIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1775698311),('SbqosZDmlIln6Mm5204xGOIbdxmdQwv9Eh3sACQ2',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2VTTnpabUJaQnhjRHdrcGtsNWRrbXpOU25WajVOSUlqUkVmUTBnVCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1775839884),('YXKxrAhAvisTexNNVYOX5wei92fEcmKsmAoorBtU',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1dBS0lWT2hzRlZic2VkTkp6R2tnWVk2S2xFNHc3SE9PaEVDNFZvRiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdC5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1775795128);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'quality_control'
--

--
-- Dumping routines for database 'quality_control'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-10 11:08:02

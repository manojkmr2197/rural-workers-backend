-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: rural_workers
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `area_id` int NOT NULL AUTO_INCREMENT,
  `area_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`area_id`),
  KEY `area_fk` (`city_id`),
  CONSTRAINT `area_fk` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'திருச்சி');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `job_id` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_area_mapping`
--

DROP TABLE IF EXISTS `job_area_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_area_mapping` (
  `job_area_id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  `area_id` int NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`job_area_id`),
  KEY `job_area_mapping_city_FK` (`city_id`),
  KEY `job_area_mapping_area_FK` (`area_id`),
  KEY `job_area_mapping_job_FK` (`job_id`),
  CONSTRAINT `job_area_mapping_area_FK` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`),
  CONSTRAINT `job_area_mapping_city_FK` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  CONSTRAINT `job_area_mapping_job_FK` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_area_mapping`
--

LOCK TABLES `job_area_mapping` WRITE;
/*!40000 ALTER TABLE `job_area_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_area_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proof_type`
--

DROP TABLE IF EXISTS `proof_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proof_type` (
  `proof_type_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proof_type`
--

LOCK TABLES `proof_type` WRITE;
/*!40000 ALTER TABLE `proof_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `proof_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_comments`
--

DROP TABLE IF EXISTS `worker_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `comments` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `worker_id` int NOT NULL,
  `comments_is_verified` varchar(1) COLLATE utf8mb4_general_ci DEFAULT 'Y',
  PRIMARY KEY (`comment_id`),
  KEY `worker_comments_workers_data_FK` (`worker_id`),
  CONSTRAINT `worker_comments_workers_data_FK` FOREIGN KEY (`worker_id`) REFERENCES `workers_data` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_comments`
--

LOCK TABLES `worker_comments` WRITE;
/*!40000 ALTER TABLE `worker_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_job_mapping`
--

DROP TABLE IF EXISTS `worker_job_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_job_mapping` (
  `worker_job_id` int NOT NULL AUTO_INCREMENT,
  `worker_id` int NOT NULL,
  `job_area_mapping_id` int NOT NULL,
  PRIMARY KEY (`worker_job_id`),
  KEY `worker_job_mapping_worker_FK` (`worker_id`),
  KEY `worker_job_mapping_job_area_FK` (`job_area_mapping_id`),
  CONSTRAINT `worker_job_mapping_job_area_FK` FOREIGN KEY (`job_area_mapping_id`) REFERENCES `job_area_mapping` (`job_area_id`),
  CONSTRAINT `worker_job_mapping_worker_FK` FOREIGN KEY (`worker_id`) REFERENCES `workers_data` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_job_mapping`
--

LOCK TABLES `worker_job_mapping` WRITE;
/*!40000 ALTER TABLE `worker_job_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_job_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers_data`
--

DROP TABLE IF EXISTS `workers_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers_data` (
  `worker_id` int NOT NULL AUTO_INCREMENT,
  `worker_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `worker_address_1` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `worker_address_2` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `worker_phone_no` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `worker_whatsapp_no` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `worker_mail_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `worker_id_proof_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `worker_id_proof` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `worker_is_verified` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N',
  `worker_created_date` timestamp NULL DEFAULT NULL,
  `worker_created_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `worker_modified_date` timestamp NULL DEFAULT NULL,
  `worker_modified_by` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `worker_rating` float DEFAULT NULL,
  PRIMARY KEY (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers_data`
--

LOCK TABLES `workers_data` WRITE;
/*!40000 ALTER TABLE `workers_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `workers_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'rural_workers'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-27 20:54:34

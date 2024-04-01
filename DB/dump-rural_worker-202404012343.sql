-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: rural_worker
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
  `AREA_ID` int NOT NULL AUTO_INCREMENT,
  `AREA_NAME_ENGLISH` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AREA_NAME_TAMIL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CITY_ID` int NOT NULL,
  PRIMARY KEY (`AREA_ID`),
  KEY `AREA_fk` (`CITY_ID`),
  CONSTRAINT `AREA_fk` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`)
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
  `CITY_ID` int NOT NULL AUTO_INCREMENT,
  `CITY_NAME_ENGLISH` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CITY_NAME_TAMIL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CITY_IS_ENABLED` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (2,'Madurai','மதுரை',NULL),(3,'Trichy-1','திருச்சி','Y'),(4,'Madurai-1','மதுரை','Y');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `JOB_ID` int NOT NULL AUTO_INCREMENT,
  `JOB_NAME_ENGLISH` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `JOB_NAME_TAMIL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`JOB_ID`)
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
  `JOB_AREA_ID` int NOT NULL AUTO_INCREMENT,
  `JOB_ID` int NOT NULL,
  `AREA_ID` int NOT NULL,
  `CITY_ID` int NOT NULL,
  PRIMARY KEY (`JOB_AREA_ID`),
  KEY `job_AREA_mapping_city_FK` (`CITY_ID`),
  KEY `job_AREA_mapping_AREA_FK` (`AREA_ID`),
  KEY `job_AREA_mapping_job_FK` (`JOB_ID`),
  CONSTRAINT `job_AREA_mapping_AREA_FK` FOREIGN KEY (`AREA_ID`) REFERENCES `area` (`AREA_ID`),
  CONSTRAINT `job_AREA_mapping_city_FK` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`),
  CONSTRAINT `job_AREA_mapping_job_FK` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`JOB_ID`)
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
  `PROOF_TYPE_NAME` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
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
-- Table structure for table `user_data`
--

DROP TABLE IF EXISTS `user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_data` (
  `USER_ID` int NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `USER_PHONE_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `USER_ADDRESS` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CREATED_DATE` timestamp NULL DEFAULT NULL,
  `MODIFIED_DATE` timestamp NULL DEFAULT NULL,
  `LOGIN_DATE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_data`
--

LOCK TABLES `user_data` WRITE;
/*!40000 ALTER TABLE `user_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_statistics`
--

DROP TABLE IF EXISTS `user_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_statistics` (
  `STATISTICS_ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int DEFAULT NULL,
  `WORKER_ID` int DEFAULT NULL,
  `CALL_COUNT` bigint DEFAULT NULL,
  `WHATSAPP_COUNT` bigint DEFAULT NULL,
  `LAST_MODIFIED_DATE` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`STATISTICS_ID`),
  KEY `user_statistics_user_data_FK` (`USER_ID`),
  KEY `user_statistics_WORKER_DATA_FK` (`WORKER_ID`),
  CONSTRAINT `user_statistics_user_data_FK` FOREIGN KEY (`USER_ID`) REFERENCES `user_data` (`USER_ID`),
  CONSTRAINT `user_statistics_WORKER_DATA_FK` FOREIGN KEY (`WORKER_ID`) REFERENCES `worker_data` (`WORKER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_statistics`
--

LOCK TABLES `user_statistics` WRITE;
/*!40000 ALTER TABLE `user_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_comments`
--

DROP TABLE IF EXISTS `worker_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_comments` (
  `COMMENT_ID` int NOT NULL AUTO_INCREMENT,
  `COMMENTS_TEXT` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WORKER_ID` int NOT NULL,
  `IS_COMMENT_VERIFIED` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'Y',
  PRIMARY KEY (`COMMENT_ID`),
  KEY `WORKER_COMMENTS_WORKER_DATA_FK` (`WORKER_ID`),
  CONSTRAINT `WORKER_COMMENTS_WORKER_DATA_FK` FOREIGN KEY (`WORKER_ID`) REFERENCES `worker_data` (`WORKER_ID`)
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
-- Table structure for table `worker_data`
--

DROP TABLE IF EXISTS `worker_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_data` (
  `WORKER_ID` int NOT NULL AUTO_INCREMENT,
  `WORKER_NAME` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WORKER_ADDRESS_1` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WORKER_ADDRESS_2` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `WORKER_PHONE_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `WORKER_WHATSAPP_NO` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `WORKER_MAIL_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `WORKER_ID_PROOF_TYPE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `WORKER_ID_PROOF` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_WORKER_VERIFIED` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N',
  `WORKER_CREATED_DATE` timestamp NULL DEFAULT NULL,
  `WORKER_CREATED_BY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `WORKER_MODIFIED_DATE` timestamp NULL DEFAULT NULL,
  `WORKER_MODIFIED_BY` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `WORKER_RATING` float DEFAULT NULL,
  PRIMARY KEY (`WORKER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_data`
--

LOCK TABLES `worker_data` WRITE;
/*!40000 ALTER TABLE `worker_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `worker_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_job_mapping`
--

DROP TABLE IF EXISTS `worker_job_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker_job_mapping` (
  `WORKER_JOB_ID` int NOT NULL AUTO_INCREMENT,
  `WORKER_ID` int NOT NULL,
  `JOB_AREA_MAPPING_ID` int NOT NULL,
  PRIMARY KEY (`WORKER_JOB_ID`),
  KEY `WORKER_JOB_MAPPING_worker_FK` (`WORKER_ID`),
  KEY `WORKER_JOB_MAPPING_job_AREA_FK` (`JOB_AREA_MAPPING_ID`),
  CONSTRAINT `WORKER_JOB_MAPPING_job_AREA_FK` FOREIGN KEY (`JOB_AREA_MAPPING_ID`) REFERENCES `job_area_mapping` (`JOB_AREA_ID`),
  CONSTRAINT `WORKER_JOB_MAPPING_worker_FK` FOREIGN KEY (`WORKER_ID`) REFERENCES `worker_data` (`WORKER_ID`)
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
-- Dumping routines for database 'rural_worker'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-01 23:43:27

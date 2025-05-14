-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: necktie
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

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
-- Current Database: `necktie`
--

/*!40000 DROP DATABASE IF EXISTS `necktie`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `necktie` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `necktie`;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lang` char(5) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `updated_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'en','Room 02, 10/F, 9 Chiu Lung Street, Eurobank Centre, Hong Kong, Central','Central and Western','2025-05-08 06:35:29'),(2,'zh','香港中環昭隆街9號歐銀中心10樓02室','中西區','2025-05-08 06:35:59'),(3,'zh','香港灣仔莊士敦道128號台山中心6樓6A室','灣仔區','2025-05-14 00:39:52'),(4,'en','Room 6A, 6/F, 128 Johnston Road, Toisan Centre, Wanchai','Wanchai','2025-05-08 07:33:24'),(9,'en','Room E, 3/F, 123 Musk Road, Wanchai','Wanchai','2025-05-14 00:44:12'),(10,'zh','灣仔馬斯克道123號3樓E室','灣仔區','2025-05-13 11:29:03'),(13,'en','Room A, 20/F, 123 Waterloo Road, Mongkok','Yau Tsim Mong','2025-05-14 02:43:34'),(14,'zh','旺角窩打老道123號20樓A室','油尖旺區','2025-05-14 02:43:34');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_hour`
--

DROP TABLE IF EXISTS `business_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_hour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lang` char(5) DEFAULT NULL,
  `hour_string` varchar(400) DEFAULT NULL,
  `updated_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_hour`
--

LOCK TABLES `business_hour` WRITE;
/*!40000 ALTER TABLE `business_hour` DISABLE KEYS */;
INSERT INTO `business_hour` VALUES (1,'en','Monday:09:00-18:00, Tuesday:09:00-18:00, Wednesday:09:00-18:00, Thursday:09:00-18:00, Friday:09:00-18:00, Saturday:09:00-13:00, Sunday:Closed，Public Holiday:Closed','2025-05-08 06:44:30'),(2,'zh','星期一:09:00-18:00, 星期二:09:00-18:00, 星期三:09:00-18:00, 星期四:09:00-18:00, 星期五:09:00-18:00, 星期六:09:00-13:00, 星期日:休息，公眾假期:休息','2025-05-08 06:44:49'),(3,'en','Monday:09:30-11:00,16:00-18:00, Tuesday:09:30-11:00,16:00-18:00, Wednesday:09:30-11:00,16:00-18:00, Thursday:09:30-11:00,16:00-18:00, Friday:09:30-11:00,16:00-18:00, Saturday:09:30-11:00,16:00-18:00, Sunday:Closed，Public Holiday:Closed','2025-05-08 07:40:39'),(4,'zh','星期一:09:30-11:00,16:00-18:00, 星期二:09:30-11:00,16:00-18:00, 星期三:09:30-11:00,16:00-18:00, 星期四:09:30-11:00,16:00-18:00, 星期五:09:30-11:00,16:00-18:00, 星期六:09:30-11:00,16:00-18:00, 星期日:休息，公眾假期:休息','2025-05-08 08:27:48'),(7,'en','Monday:09:00-18:00, Tuesday:09:00-18:00, Wednesday:09:00-18:00, Thursday:09:00-18:00, Friday:09:00-18:00, Saturday:09:00-13:00, Sunday:Closed, Public Holiday:Closed','2025-05-13 11:29:03'),(8,'zh','星期一:09:00-20:00, 星期二:09:00-20:00, 星期三:09:00-20:00, 星期四:09:00-20:00,星期五:09:00-20:00, 星期六:09:00-20:00, 星期日:休息，公眾假期:休息','2025-05-13 11:29:03'),(9,'en','Mon-Fri:9am-5pm','2025-05-14 02:43:34'),(10,'zh','星期一至星期五:上午9時至下午5時','2025-05-14 02:43:34');
/*!40000 ALTER TABLE `business_hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lang` char(5) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `updated_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'en','General Practitioner','2025-05-08 07:21:16'),(2,'zh','普通科門診','2025-05-08 07:21:20'),(5,'en','Specialist','2025-05-14 00:56:09'),(6,'zh','耳鼻喉專科','2025-05-14 00:59:49'),(7,'en','SP','2025-05-14 02:43:34'),(8,'zh','專科醫生','2025-05-14 02:43:34');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` float DEFAULT NULL,
  `updated_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phone` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,540,'2025-05-08 07:49:17','28773222,28773888'),(2,150,'2025-05-08 07:49:33','25732448'),(5,200,'2025-05-13 11:29:03','37286723'),(7,1000,'2025-05-14 02:43:34','12345678');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_address`
--

DROP TABLE IF EXISTS `doctor_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_doctor_id` (`doctor_id`),
  KEY `fk_address_id` (`address_id`),
  CONSTRAINT `doctor_address_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `doctor_address_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_address`
--

LOCK TABLES `doctor_address` WRITE;
/*!40000 ALTER TABLE `doctor_address` DISABLE KEYS */;
INSERT INTO `doctor_address` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(9,5,9),(10,5,10),(13,7,13),(14,7,14);
/*!40000 ALTER TABLE `doctor_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_business_hour`
--

DROP TABLE IF EXISTS `doctor_business_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_business_hour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int DEFAULT NULL,
  `business_hour_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_doctor_id` (`doctor_id`),
  KEY `fk_business_hour_id` (`business_hour_id`),
  CONSTRAINT `doctor_business_hour_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `doctor_business_hour_ibfk_2` FOREIGN KEY (`business_hour_id`) REFERENCES `business_hour` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_business_hour`
--

LOCK TABLES `doctor_business_hour` WRITE;
/*!40000 ALTER TABLE `doctor_business_hour` DISABLE KEYS */;
INSERT INTO `doctor_business_hour` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(7,5,7),(8,5,8),(9,7,9),(10,7,10);
/*!40000 ALTER TABLE `doctor_business_hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_category`
--

DROP TABLE IF EXISTS `doctor_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_doctor_id` (`doctor_id`),
  KEY `fk_category_id` (`category_id`),
  CONSTRAINT `doctor_category_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `doctor_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_category`
--

LOCK TABLES `doctor_category` WRITE;
/*!40000 ALTER TABLE `doctor_category` DISABLE KEYS */;
INSERT INTO `doctor_category` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(7,5,5),(8,5,6),(9,7,7),(10,7,8);
/*!40000 ALTER TABLE `doctor_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_price_policy`
--

DROP TABLE IF EXISTS `doctor_price_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_price_policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int DEFAULT NULL,
  `price_policy_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_doctor_id` (`doctor_id`),
  KEY `fk_price_policy_id` (`price_policy_id`),
  CONSTRAINT `doctor_price_policy_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `doctor_price_policy_ibfk_2` FOREIGN KEY (`price_policy_id`) REFERENCES `price_policy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_price_policy`
--

LOCK TABLES `doctor_price_policy` WRITE;
/*!40000 ALTER TABLE `doctor_price_policy` DISABLE KEYS */;
INSERT INTO `doctor_price_policy` VALUES (1,1,3),(2,1,4),(3,2,1),(4,2,2),(5,5,5),(6,5,6),(7,7,7),(8,7,8);
/*!40000 ALTER TABLE `doctor_price_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `name`
--

DROP TABLE IF EXISTS `name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `name` (
  `id` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int DEFAULT NULL,
  `lang` char(5) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `updated_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_doctor_name` (`doctor_id`),
  CONSTRAINT `name_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `name`
--

LOCK TABLES `name` WRITE;
/*!40000 ALTER TABLE `name` DISABLE KEYS */;
INSERT INTO `name` VALUES (1,1,'en','Wong Siu Pang','2025-05-08 00:16:53'),(2,1,'zh','王兆鵬','2025-05-08 00:17:11'),(3,2,'en','Wong To Chuen','2025-05-08 07:45:16'),(4,2,'zh','王陶村','2025-05-08 07:45:16'),(9,5,'en','Chan Chi Ming','2025-05-13 11:29:03'),(10,5,'zh','陳子明','2025-05-13 11:29:03'),(13,7,'en','Au Lik Hong','2025-05-14 02:43:34'),(14,7,'zh','歐力康','2025-05-14 02:43:34');
/*!40000 ALTER TABLE `name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price_policy`
--

DROP TABLE IF EXISTS `price_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_policy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lang` char(5) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `updated_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price_policy`
--

LOCK TABLES `price_policy` WRITE;
/*!40000 ALTER TABLE `price_policy` DISABLE KEYS */;
INSERT INTO `price_policy` VALUES (1,'en','not inclusive Western medicine','2025-05-08 06:23:32'),(2,'zh','不包括西藥','2025-05-08 06:23:47'),(3,'en','inclusive 3 Days of Western medicine','2025-05-08 06:23:58'),(4,'zh','包括3日西藥','2025-05-08 06:24:14'),(5,'en','inclusive 5 Days of Western medicine','2025-05-13 11:29:03'),(6,'zh','包括5日西藥','2025-05-13 11:29:03'),(7,'en','inclusive 7 Days of Western medicine','2025-05-14 02:43:34'),(8,'zh','包括7日西藥','2025-05-14 02:43:34');
/*!40000 ALTER TABLE `price_policy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-14 15:22:26

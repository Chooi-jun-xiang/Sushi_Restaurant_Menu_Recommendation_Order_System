CREATE DATABASE  IF NOT EXISTS `sushi_restaurant_menu_suggestion_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sushi_restaurant_menu_suggestion_system`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sushi_restaurant_menu_suggestion_system
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `customer_email` varchar(45) NOT NULL,
  `customer_password` varchar(45) NOT NULL,
  `customer_phone_number` varchar(45) DEFAULT NULL,
  `customer_registration_date` varchar(45) DEFAULT NULL,
  `is_member` tinyint(1) DEFAULT '0',
  `membership_points` int DEFAULT '0',
  `customer_birthday` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'ahjun','ahjun@gmail.com','Chooi123!','01116182812','2024-01-23 06:54:29',1,1790,'2000-01-23'),(2,'ahjun2','ahjun2@gmail.com','Chooi123!','01116182811','2024-01-23 06:58:32',0,2413,'2000-01-20'),(3,'alex','alex@gmail.com','Chooi123!','01116182821','2024-01-23 06:59:12',0,3084,'2000-01-01'),(4,'aaron2','aaron@gmail.com','Chooi123!','01116182822','2024-01-23 06:59:48',0,NULL,'2000-12-12'),(5,'jun xiang','junxiang@gmail.com','Chooi123!','01116182816','2024-01-23 07:00:59',1,2600,'2000-01-23'),(6,'abcde','abc@gmail.com','Abc12345!','01116182815','2025-01-23 14:59:05',0,NULL,'2005-01-01'),(7,'chooi jun xiang','chooi@gmail.com','Chooi123!','01116182813','2025-01-23 23:22:36',0,0,'2003-12-16');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_ratings`
--

DROP TABLE IF EXISTS `food_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_ratings` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `menu_item_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `unique_customer_item` (`customer_id`,`menu_item_id`),
  KEY `menu_item_id` (`menu_item_id`),
  CONSTRAINT `food_ratings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `food_ratings_ibfk_2` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_item` (`menu_item_id`),
  CONSTRAINT `food_ratings_chk_1` CHECK (((`rating` >= 1) and (`rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_ratings`
--

LOCK TABLES `food_ratings` WRITE;
/*!40000 ALTER TABLE `food_ratings` DISABLE KEYS */;
INSERT INTO `food_ratings` VALUES (2,3,1,5,'2025-01-23 00:53:28','2025-01-23 00:53:28'),(3,3,14,5,'2025-01-23 00:53:36','2025-01-23 00:53:36'),(4,3,2,4,'2025-01-23 00:53:42','2025-01-23 00:53:42'),(5,3,9,3,'2025-01-23 00:53:56','2025-01-23 00:53:56'),(6,3,13,4,'2025-01-23 00:54:05','2025-01-23 00:54:05'),(7,3,6,3,'2025-01-23 00:54:15','2025-01-23 00:54:15'),(8,3,7,4,'2025-01-23 00:54:25','2025-01-23 00:54:25'),(9,2,1,5,'2025-01-23 00:54:59','2025-01-23 00:54:59'),(10,2,5,3,'2025-01-23 00:55:09','2025-01-23 00:55:09'),(11,2,2,5,'2025-01-23 00:55:12','2025-01-23 00:55:12'),(12,5,1,5,'2025-01-23 01:21:33','2025-01-23 01:21:33'),(13,5,26,4,'2025-01-23 01:21:56','2025-01-23 01:21:56'),(14,1,1,5,'2025-01-23 15:28:39','2025-01-23 15:28:39'),(15,1,26,3,'2025-01-23 15:28:56','2025-01-23 15:28:56');
/*!40000 ALTER TABLE `food_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item`
--

DROP TABLE IF EXISTS `menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item` (
  `menu_item_id` int NOT NULL,
  `item_name` varchar(45) DEFAULT NULL,
  `item_price` double DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `total_rating` int DEFAULT '0',
  `rating_count` int DEFAULT '0',
  PRIMARY KEY (`menu_item_id`),
  UNIQUE KEY `menu_item_id_UNIQUE` (`menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item`
--

LOCK TABLES `menu_item` WRITE;
/*!40000 ALTER TABLE `menu_item` DISABLE KEYS */;
INSERT INTO `menu_item` VALUES (1,'Tobiko_sushi',5.5,'sushi',20,4),(2,'Unagi_sushi',7.9,'sushi',9,2),(3,'Ebi_Tempura_sushi',5.9,'sushi',0,0),(4,'Tamago_sushi',3.9,'sushi',0,0),(5,'Inari_sushi',3.9,'sushi',3,1),(6,'Ume_sushi_mix',32.9,'Special_Sushi',3,1),(7,'Lobster_Temaki',9.9,'Special_Sushi',4,1),(8,'California_Maki',28.9,'maki',0,0),(9,'Sake_Belly_Sashimi',29.9,'sashimi',3,1),(10,'Sake_Sashimi',26.9,'sashimi',0,0),(11,'Chawan_Mushi',9.9,'Chawan_Mushi',0,0),(12,'Ebi_Tempura',27.9,'A_La_Carte_Age',0,0),(13,'Mix_Tempura',24.9,'A_La_Carte_Age',4,1),(14,'Saba_Shioyaki',17.9,'A_La_Carte_Age',5,1),(15,'Mix_Tempura_Teishoku',34.9,'Teishoku',0,0),(16,'Tori_Katsu_Teishoku',38.9,'Teishoku',0,0),(17,'Tori_Katsu_Egg_Tartar_Teishoku',35.9,'Teishoku',0,0),(18,'Tai_Katsu_Miso_Yaki_Teishoku',39.9,'Teishoku',0,0),(19,'Tai_Katsu_Egg_Tartar_Teishoku',42.9,'Teishoku',0,0),(20,'Tori_Katsu_Curry_Rice',26.9,'Curry',0,0),(21,'Seafood_Curry_Rice',28.9,'Curry',0,0),(22,'Nigiri_Udon_Set',36.9,'set',0,0),(23,'Udon_Tempura_Sashimi_Gozen',37.9,'set',0,0),(24,'Italian_Tiramisu',10.9,'Dessert',0,0),(25,'Taro_Balls',9.9,'Dessert',0,0),(26,'Passion_Fruit_Lemon_Tea_Jug',24.9,'Tea_jug',7,2),(27,'Mix_Berry_Fruit_Tea_Jug',24.9,'Tea_jug',0,0),(28,'Ice_Lemon_Tea',10.9,'Cold_Beverages',0,0),(29,'Grape_Juice',10.9,'Cold_Beverages',0,0),(30,'Iced_Ocha',3.9,'Cold_Beverages',0,0),(31,'Ocha(cup)',3.9,'Hot_Beverages',0,0),(32,'Ocha(pot)',9.9,'Hot_Beverages',0,0),(33,'Hot_Citron ',9.9,'Hot_Beverages',0,0);
/*!40000 ALTER TABLE `menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` varchar(45) NOT NULL,
  `total_amount` double NOT NULL,
  `customer_id` varchar(45) NOT NULL,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (101,'2024-01-23 07:35:14',2239.5,'1',1),(102,'2024-01-23 07:37:04',9049.5,'2',1),(103,'2024-01-25 07:46:47',9204.5,'3',1),(104,'2024-01-25 07:49:17',13682.2,'4',1),(105,'2024-01-26 07:55:34',7423.099999999999,'5',1),(106,'2024-02-10 07:58:33',3780.0000000000005,'1',1),(107,'2024-02-14 08:01:52',3856.1000000000004,'2',1),(108,'2024-02-21 08:07:33',7758.5,'3',1),(109,'2024-03-03 08:10:37',7037.2,'4',1),(110,'2024-03-17 08:12:36',14353.3,'5',1),(111,'2024-03-17 08:14:38',7672.5,'1',1),(112,'2024-04-01 08:16:11',5390.2,'2',1),(113,'2024-04-26 08:17:35',2308.5,'3',1),(114,'2024-04-26 08:18:57',8021.9,'4',1),(115,'2024-05-05 08:21:37',4840.5,'5',1),(116,'2024-05-20 08:23:19',6627.5,'1',1),(117,'2024-06-21 08:25:11',8529,'2',1),(118,'2024-06-28 08:26:58',15020,'3',1),(119,'2024-07-07 08:28:20',8052.5,'4',1),(120,'2024-07-21 08:30:09',2330,'5',1),(121,'2025-01-23 08:36:45',5.5,'5',1),(122,'2025-01-23 09:22:43',44.3,'5',1),(123,'2025-01-23 23:28:09',13.4,'1',1),(124,'2025-01-23 23:39:18',110,'1',1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_details_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `menu_item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `item_price` double NOT NULL,
  PRIMARY KEY (`order_details_id`),
  KEY `order_details_order_fk_idx` (`order_id`),
  CONSTRAINT `order_details_order_fk` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (205,101,1,100,5.5),(206,101,2,80,7.9),(207,101,3,90,5.9),(208,101,4,70,3.9),(209,101,5,65,3.9),(210,102,6,90,32.9),(211,102,7,75,9.9),(212,102,8,50,28.9),(213,102,9,45,29.9),(214,102,10,95,26.9),(215,103,11,85,9.9),(216,103,12,80,27.9),(217,103,13,97,24.9),(218,103,14,75,17.9),(219,103,15,68,34.9),(220,104,16,78,38.9),(221,104,17,88,35.9),(222,104,18,66,39.9),(223,104,19,58,42.9),(224,104,20,88,26.9),(225,105,21,55,28.9),(226,105,22,57,36.9),(227,105,23,65,37.9),(228,105,24,59,10.9),(229,105,25,63,9.9),(230,106,26,40,24.9),(231,106,27,47,24.9),(232,106,28,56,10.9),(233,106,29,67,10.9),(234,106,30,70,3.9),(235,107,1,87,5.5),(236,107,2,96,7.9),(237,107,3,76,5.9),(238,107,4,67,3.9),(239,107,5,59,3.9),(240,107,31,60,3.9),(241,107,32,66,9.9),(242,107,33,80,9.9),(243,108,6,66,32.9),(244,108,7,50,9.9),(245,108,8,50,28.9),(246,108,9,59,29.9),(247,108,10,70,26.9),(248,109,11,66,9.9),(249,109,12,50,27.9),(250,109,13,53,24.9),(251,109,14,49,17.9),(252,109,15,80,34.9),(253,110,16,79,38.9),(254,110,17,80,35.9),(255,110,18,95,39.9),(256,110,19,65,42.9),(257,110,20,68,26.9),(258,111,21,62,28.9),(259,111,22,60,36.9),(260,111,23,68,37.9),(261,111,24,50,10.9),(262,111,25,55,9.9),(263,112,26,66,24.9),(264,112,27,70,24.9),(265,112,28,77,10.9),(266,112,29,80,10.9),(267,112,30,75,3.9),(268,113,1,50,5.5),(269,113,2,55,7.9),(270,113,31,80,3.9),(271,113,32,70,9.9),(272,113,33,60,9.9),(273,114,6,66,32.9),(274,114,7,60,9.9),(275,114,8,50,28.9),(276,114,9,60,29.9),(277,114,10,75,26.9),(278,115,25,55,9.9),(279,115,26,60,24.9),(280,115,27,60,24.9),(281,115,28,65,10.9),(282,115,29,55,10.9),(283,116,1,65,5.5),(284,116,5,60,3.9),(285,116,6,70,32.9),(286,116,7,65,9.9),(287,116,8,50,28.9),(288,116,9,55,29.9),(289,117,10,50,26.9),(290,117,11,55,9.9),(291,117,12,60,27.9),(292,117,13,65,24.9),(293,117,14,70,17.9),(294,117,15,60,34.9),(295,118,16,60,38.9),(296,118,17,65,35.9),(297,118,18,135,39.9),(298,118,19,75,42.9),(299,118,20,65,26.9),(300,119,21,55,28.9),(301,119,22,65,36.9),(302,119,23,70,37.9),(303,119,24,75,10.9),(304,119,25,60,9.9),(305,120,29,50,10.9),(306,120,30,55,3.9),(307,120,31,60,3.9),(308,120,32,65,9.9),(309,120,33,70,9.9),(310,121,1,1,5.5),(311,122,1,1,5.5),(312,122,31,1,3.9),(313,122,15,1,34.9),(314,123,1,1,5.5),(315,123,2,1,7.9),(316,124,1,20,5.5);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sales_id` int NOT NULL AUTO_INCREMENT,
  `sale_date` varchar(45) NOT NULL,
  `quantity_sales` int NOT NULL,
  `daily_sales` double NOT NULL DEFAULT '0',
  `monthly_sales` double NOT NULL DEFAULT '0',
  `yearly_sales` double NOT NULL DEFAULT '0',
  `revenue` double NOT NULL DEFAULT '0',
  `menu_item_id` varchar(45) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  PRIMARY KEY (`sales_id`),
  UNIQUE KEY `menu_item_id` (`menu_item_id`,`sale_date`),
  KEY `order_id_idx` (`order_id`),
  CONSTRAINT `sales_order_fk` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (30,'2024-01-23 07:35:42',100,100,100,100,550,'1',NULL),(31,'2024-01-23 07:38:14',90,90,90,90,2961,'6',NULL),(32,'2024-01-25 07:51:31',78,78,78,78,3034.2,'16',NULL),(33,'2024-01-26 07:56:30',55,55,55,55,1589.5,'21',NULL),(34,'2024-02-10 07:59:31',40,40,40,40,996,'26',NULL),(35,'2024-02-14 08:02:33',87,87,87,87,478.5,'1',NULL),(36,'2024-03-03 08:11:16',66,66,66,66,653.4,'11',NULL),(37,'2024-03-17 08:13:03',79,79,79,79,3073.1,'16',NULL),(38,'2024-03-17 08:15:10',62,62,62,62,1791.8,'21',NULL),(39,'2024-04-01 08:16:38',66,66,66,66,1643.3999999999999,'26',NULL),(40,'2024-04-26 08:17:58',50,50,50,50,275,'1',NULL),(41,'2024-04-26 08:19:56',66,66,66,66,2171.4,'6',NULL),(42,'2024-05-05 08:22:07',55,55,55,55,544.5,'25',NULL),(43,'2024-05-20 08:23:58',65,65,65,65,357.5,'1',NULL),(44,'2024-06-21 08:25:52',50,50,50,50,1345,'10',NULL),(45,'2024-06-28 08:27:33',60,60,60,60,2334,'16',NULL),(46,'2024-07-07 08:29:02',55,55,55,55,1589.5,'21',NULL),(47,'2024-07-21 08:30:37',50,50,50,50,545,'29',NULL),(48,'2025-01-23 08:37:15',1,1,1,1,5.5,'1',NULL),(49,'2025-01-23 09:38:52',1,1,1,1,5.5,'1',NULL),(50,'2025-01-23 23:37:43',1,1,1,1,5.5,'1',NULL),(51,'2025-01-23 23:40:20',20,20,20,20,110,'1',NULL);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(45) DEFAULT NULL,
  `staff_email` varchar(45) DEFAULT NULL,
  `staff_password` varchar(45) DEFAULT NULL,
  `staff_phone_number` varchar(45) DEFAULT NULL,
  `staff_role` varchar(45) DEFAULT NULL,
  `staff_hire_date` date DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `staff_id_UNIQUE` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'alexmanager','alexmanager@gmail.com','Chooi123!','01116182812','manager','2024-01-01'),(2,'alexstaff','alexstaff@gmail.com','Chooi123!','01116182811','staff','2024-01-02'),(3,'staff2','staff2@gmail.com','1','01116182816','staff','2025-01-15'),(4,'staff 3','staff3@gmail.com','1','01116182817','staff','2025-01-15'),(5,'staff33','staff33@gmail.com','1','01116182818','staff','2025-01-15'),(6,'a','a','a','a','staff','2025-01-19'),(7,'1','1@gmail.com','Choi123!','1234567','staff','2025-01-19'),(11,'abc','abc@gmail.com','Chooi123!','1234567','staff','2025-01-20'),(12,'ABCDE','ABCDE@GMAIL.COM','Chooi123!','1234567','staff','2025-01-20'),(13,'abcde','abcde1@gmail.com','Chooi123!','1234567','staff','2025-01-20'),(14,'j','j@gmail.com','Chooi456!','1234567','staff','2025-01-20');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-24  1:13:46

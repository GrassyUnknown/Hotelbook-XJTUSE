-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility` (
  `facility_id` int NOT NULL,
  `facility_name` varchar(45) DEFAULT NULL,
  `facility_capacity` int DEFAULT NULL,
  `facility_now` int DEFAULT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (3,'3',33,3),(6,'方法',5,5),(11,'111',1111,1);
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilityorder`
--

DROP TABLE IF EXISTS `facilityorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilityorder` (
  `facilityorder_id` int NOT NULL,
  `facility_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `reserve_timing` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`facilityorder_id`),
  KEY `fk_user_has_facility_facility1_idx` (`facility_id`),
  KEY `fk_user_has_facility_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_facility_facility1` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`),
  CONSTRAINT `fk_user_has_facility_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilityorder`
--

LOCK TABLES `facilityorder` WRITE;
/*!40000 ALTER TABLE `facilityorder` DISABLE KEYS */;
INSERT INTO `facilityorder` VALUES (123,6,0,'12354');
/*!40000 ALTER TABLE `facilityorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal`
--

DROP TABLE IF EXISTS `meal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal` (
  `meal_id` int NOT NULL,
  `meal_description` varchar(45) DEFAULT NULL,
  `meal_name` varchar(45) DEFAULT NULL,
  `meal_cost` int DEFAULT NULL,
  PRIMARY KEY (`meal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal`
--

LOCK TABLES `meal` WRITE;
/*!40000 ALTER TABLE `meal` DISABLE KEYS */;
INSERT INTO `meal` VALUES (3,'3','3',3),(41,'41','411',148),(2000,'14','741',1);
/*!40000 ALTER TABLE `meal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mealorder`
--

DROP TABLE IF EXISTS `mealorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mealorder` (
  `mealorder_id` int NOT NULL,
  `mealorder_timing` varchar(45) DEFAULT NULL,
  `mealorder_number` int DEFAULT NULL,
  `meal_id` int DEFAULT NULL,
  `mealorder_cost` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`mealorder_id`),
  KEY `fk_mealorder_meal1_idx` (`meal_id`),
  KEY `fk_mealorder_user1_idx` (`user_id`),
  CONSTRAINT `fk_mealorder_meal1` FOREIGN KEY (`meal_id`) REFERENCES `meal` (`meal_id`),
  CONSTRAINT `fk_mealorder_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mealorder`
--

LOCK TABLES `mealorder` WRITE;
/*!40000 ALTER TABLE `mealorder` DISABLE KEYS */;
INSERT INTO `mealorder` VALUES (555,'545',454,41,454,0);
/*!40000 ALTER TABLE `mealorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL,
  `room_name` varchar(45) DEFAULT NULL,
  `room_cost` int DEFAULT NULL,
  `room_description` varchar(45) DEFAULT NULL,
  `room_img` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'5104',4,'5',NULL),(555,'444',555,'4',NULL),(7444,'777',421,'41',NULL);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomorder`
--

DROP TABLE IF EXISTS `roomorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomorder` (
  `roomorder_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `roomorder_cost` int DEFAULT NULL,
  `roomorder_description` varchar(45) DEFAULT NULL,
  `roomorder_reservedate` varchar(45) DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`roomorder_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `fk_roomorder_room1_idx` (`room_id`),
  CONSTRAINT `fk_roomorder_room1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomorder`
--

LOCK TABLES `roomorder` WRITE;
/*!40000 ALTER TABLE `roomorder` DISABLE KEYS */;
INSERT INTO `roomorder` VALUES (131231211,11,1888,'已支付，支付方式：储值卡','2023-12-11',1),(131231219,11,1888,'待线下支付','2023-12-19',1),(131231220,11,1888,'已支付，支付方式：微信','2023-12-20',1);
/*!40000 ALTER TABLE `roomorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_pwd` varchar(45) DEFAULT NULL,
  `user_description` varchar(45) DEFAULT NULL,
  `user_balance` int DEFAULT NULL,
  `user_tel` varchar(45) DEFAULT NULL,
  `user_isvip` int DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (0,'姓名','pwdui','description958',9999999,'194',12),(1,'474','1417','744',14,'17',1),(4,'4','666','44',4,'44',1),(11,'123','757','47',998111,'74',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-05 10:29:03

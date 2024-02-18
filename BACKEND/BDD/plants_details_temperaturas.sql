CREATE DATABASE  IF NOT EXISTS `plants_details` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `plants_details`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: plants_details
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `temperaturas`
--

DROP TABLE IF EXISTS `temperaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temperaturas` (
  `id_temperatura` int NOT NULL AUTO_INCREMENT,
  `temperatura` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_temperatura`),
  UNIQUE KEY `id_temperatura_UNIQUE` (`id_temperatura`),
  UNIQUE KEY `temperatura_UNIQUE` (`temperatura`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temperaturas`
--

LOCK TABLES `temperaturas` WRITE;
/*!40000 ALTER TABLE `temperaturas` DISABLE KEYS */;
INSERT INTO `temperaturas` VALUES (14,'10-20°C'),(15,'10-21°C'),(16,'10-24°C'),(17,'13-20°C'),(18,'13-21°C'),(19,'13-24°C'),(20,'15-20°C'),(21,'15-21°C'),(22,'15-22°C'),(23,'15-24°C'),(24,'15-25°C'),(25,'15-30°C'),(26,'16-21°C'),(27,'18-23°C'),(28,'18-24°C'),(29,'18-26°C'),(30,'18-30°C'),(31,'18-32°C'),(32,'21-24°C'),(33,'21-29°C'),(34,'21-32°C'),(35,'21-35°C'),(36,'22-29°C'),(37,'24-30°C'),(38,'25-30°C');
/*!40000 ALTER TABLE `temperaturas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-17 21:26:36

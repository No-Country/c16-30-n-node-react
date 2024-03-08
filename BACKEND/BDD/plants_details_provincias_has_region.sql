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
-- Table structure for table `provincias_has_region`
--

DROP TABLE IF EXISTS `provincias_has_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias_has_region` (
  `provincia_id` int NOT NULL,
  `region_id` int NOT NULL,
  PRIMARY KEY (`provincia_id`,`region_id`),
  KEY `fk_provincias_has_region_region1_idx` (`region_id`),
  KEY `fk_provincias_has_region_provincias1_idx` (`provincia_id`),
  CONSTRAINT `fk_provincias_has_region_provincias1` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id_provincias`),
  CONSTRAINT `fk_provincias_has_region_region1` FOREIGN KEY (`region_id`) REFERENCES `region` (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias_has_region`
--

LOCK TABLES `provincias_has_region` WRITE;
/*!40000 ALTER TABLE `provincias_has_region` DISABLE KEYS */;
INSERT INTO `provincias_has_region` VALUES (37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(38,2),(42,2),(43,2),(53,2),(54,2),(44,3),(51,3),(52,3),(48,4),(49,4),(50,4),(39,5),(40,5),(41,5),(42,5),(46,5),(50,5),(43,6),(44,6),(45,6),(46,6),(47,6),(55,6),(45,7),(46,7),(55,7),(56,8),(57,8),(58,8),(59,8),(60,8);
/*!40000 ALTER TABLE `provincias_has_region` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-17 21:26:35

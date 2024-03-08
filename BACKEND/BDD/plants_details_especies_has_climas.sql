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
-- Table structure for table `especies_has_climas`
--

DROP TABLE IF EXISTS `especies_has_climas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especies_has_climas` (
  `especie_id` int NOT NULL,
  `clima_id` int NOT NULL,
  PRIMARY KEY (`especie_id`,`clima_id`),
  KEY `fk_especies_has_climas_climas1_idx` (`clima_id`),
  KEY `fk_especies_has_climas_especies1_idx` (`especie_id`),
  CONSTRAINT `fk_especies_has_climas_climas1` FOREIGN KEY (`clima_id`) REFERENCES `climas` (`id_clima`),
  CONSTRAINT `fk_especies_has_climas_especies1` FOREIGN KEY (`especie_id`) REFERENCES `especies` (`id_especie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especies_has_climas`
--

LOCK TABLES `especies_has_climas` WRITE;
/*!40000 ALTER TABLE `especies_has_climas` DISABLE KEYS */;
INSERT INTO `especies_has_climas` VALUES (157,25),(175,25),(178,25),(193,25),(195,25),(198,25),(199,25),(211,25),(224,25),(226,25),(228,25),(231,25),(160,26),(166,26),(167,26),(172,26),(173,26),(175,26),(178,26),(180,26),(181,26),(184,26),(187,26),(188,26),(189,26),(190,26),(191,26),(192,26),(193,26),(198,26),(199,26),(200,26),(201,26),(202,26),(203,26),(205,26),(207,26),(211,26),(212,26),(213,26),(214,26),(215,26),(216,26),(219,26),(221,26),(222,26),(226,26),(229,26),(231,26),(232,26),(157,27),(159,27),(165,27),(168,27),(170,27),(176,27),(177,27),(179,27),(182,27),(183,27),(185,27),(186,27),(197,27),(206,27),(208,27),(209,27),(210,27),(217,27),(218,27),(219,27),(220,27),(227,27),(230,27),(231,27),(232,27),(156,28),(158,28),(159,28),(161,28),(162,28),(163,28),(164,28),(165,28),(168,28),(196,28),(223,28),(225,28),(226,28),(232,28),(176,29),(177,29),(179,29),(183,29),(185,29),(186,29),(194,29),(197,29),(208,29),(209,29),(219,29),(224,29),(227,29),(228,29),(230,29),(231,29),(158,30),(163,30),(164,30),(169,30),(171,30),(174,30),(176,30),(177,30),(179,30),(183,30),(185,30),(186,30),(194,30),(196,30),(197,30),(204,30),(208,30),(209,30),(210,30),(219,30),(220,30),(225,30),(227,30),(230,30),(231,30),(232,30);
/*!40000 ALTER TABLE `especies_has_climas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-17 21:26:34

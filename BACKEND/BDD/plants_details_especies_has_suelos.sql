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
-- Table structure for table `especies_has_suelos`
--

DROP TABLE IF EXISTS `especies_has_suelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especies_has_suelos` (
  `especie_id` int NOT NULL,
  `suelo_id` int NOT NULL,
  PRIMARY KEY (`especie_id`,`suelo_id`),
  KEY `fk_especies_has_suelos_suelos1_idx` (`suelo_id`),
  KEY `fk_especies_has_suelos_especies1_idx` (`especie_id`),
  CONSTRAINT `fk_especies_has_suelos_especies1` FOREIGN KEY (`especie_id`) REFERENCES `especies` (`id_especie`),
  CONSTRAINT `fk_especies_has_suelos_suelos1` FOREIGN KEY (`suelo_id`) REFERENCES `suelos` (`id_suelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especies_has_suelos`
--

LOCK TABLES `especies_has_suelos` WRITE;
/*!40000 ALTER TABLE `especies_has_suelos` DISABLE KEYS */;
INSERT INTO `especies_has_suelos` VALUES (161,14),(162,14),(168,14),(169,14),(170,14),(171,14),(174,14),(187,14),(193,14),(204,14),(207,14),(208,14),(209,14),(217,14),(218,14),(219,14),(230,14),(156,15),(157,15),(158,15),(159,15),(160,15),(161,15),(162,15),(163,15),(164,15),(165,15),(166,15),(167,15),(168,15),(169,15),(170,15),(171,15),(172,15),(173,15),(174,15),(175,15),(176,15),(177,15),(178,15),(179,15),(180,15),(181,15),(182,15),(183,15),(184,15),(185,15),(186,15),(187,15),(188,15),(189,15),(190,15),(191,15),(192,15),(193,15),(194,15),(195,15),(196,15),(197,15),(198,15),(199,15),(200,15),(201,15),(202,15),(203,15),(204,15),(205,15),(206,15),(207,15),(208,15),(209,15),(210,15),(211,15),(212,15),(213,15),(214,15),(215,15),(216,15),(217,15),(218,15),(219,15),(220,15),(221,15),(222,15),(223,15),(224,15),(225,15),(226,15),(227,15),(228,15),(229,15),(230,15),(231,15),(232,15),(156,16),(157,16),(158,16),(159,16),(160,16),(161,16),(163,16),(164,16),(165,16),(166,16),(167,16),(168,16),(169,16),(170,16),(171,16),(172,16),(173,16),(174,16),(175,16),(176,16),(177,16),(178,16),(179,16),(180,16),(181,16),(182,16),(183,16),(184,16),(185,16),(186,16),(188,16),(189,16),(190,16),(191,16),(192,16),(193,16),(195,16),(196,16),(197,16),(198,16),(199,16),(200,16),(201,16),(202,16),(203,16),(204,16),(205,16),(206,16),(207,16),(210,16),(211,16),(212,16),(213,16),(214,16),(215,16),(216,16),(217,16),(218,16),(219,16),(220,16),(221,16),(222,16),(223,16),(224,16),(225,16),(226,16),(227,16),(228,16),(229,16),(230,16),(232,16),(156,17),(158,17),(159,17),(163,17),(164,17),(165,17),(166,17),(167,17),(173,17),(176,17),(177,17),(179,17),(181,17),(182,17),(183,17),(197,17),(206,17),(210,17),(220,17),(223,17),(226,17),(227,17),(232,17),(162,18),(194,18),(208,18),(209,18),(231,18);
/*!40000 ALTER TABLE `especies_has_suelos` ENABLE KEYS */;
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

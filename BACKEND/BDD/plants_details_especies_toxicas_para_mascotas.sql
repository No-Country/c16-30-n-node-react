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
-- Table structure for table `especies_toxicas_para_mascotas`
--

DROP TABLE IF EXISTS `especies_toxicas_para_mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especies_toxicas_para_mascotas` (
  `especie_id` int NOT NULL,
  `mascota_id` int NOT NULL,
  PRIMARY KEY (`especie_id`,`mascota_id`),
  KEY `fk_especies_has_mascotas_mascotas1_idx` (`mascota_id`),
  KEY `fk_especies_has_mascotas_especies1_idx` (`especie_id`),
  CONSTRAINT `fk_especies_has_mascotas_especies1` FOREIGN KEY (`especie_id`) REFERENCES `especies` (`id_especie`),
  CONSTRAINT `fk_especies_has_mascotas_mascotas1` FOREIGN KEY (`mascota_id`) REFERENCES `mascotas` (`id_mascota`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especies_toxicas_para_mascotas`
--

LOCK TABLES `especies_toxicas_para_mascotas` WRITE;
/*!40000 ALTER TABLE `especies_toxicas_para_mascotas` DISABLE KEYS */;
INSERT INTO `especies_toxicas_para_mascotas` VALUES (158,1),(159,1),(168,1),(169,1),(170,1),(171,1),(187,1),(195,1),(196,1),(208,1),(209,1),(215,1),(216,1),(217,1),(224,1),(226,1),(227,1),(158,2),(159,2),(168,2),(169,2),(170,2),(171,2),(187,2),(195,2),(196,2),(208,2),(209,2),(215,2),(216,2),(217,2),(224,2),(226,2),(227,2),(159,3),(168,3),(169,3),(170,3),(171,3),(183,3),(158,4),(183,4),(183,5);
/*!40000 ALTER TABLE `especies_toxicas_para_mascotas` ENABLE KEYS */;
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

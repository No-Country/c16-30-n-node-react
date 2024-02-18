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
-- Table structure for table `requerimientos_luz`
--

DROP TABLE IF EXISTS `requerimientos_luz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requerimientos_luz` (
  `id_requerimiento_luz` int NOT NULL AUTO_INCREMENT,
  `requerimiento_luz` varchar(45) DEFAULT NULL,
  `significado` varchar(1000) DEFAULT NULL,
  `horas_luz` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_requerimiento_luz`),
  UNIQUE KEY `id_requerimiento_luz_UNIQUE` (`id_requerimiento_luz`),
  UNIQUE KEY `requerimients_luz_UNIQUE` (`requerimiento_luz`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requerimientos_luz`
--

LOCK TABLES `requerimientos_luz` WRITE;
/*!40000 ALTER TABLE `requerimientos_luz` DISABLE KEYS */;
INSERT INTO `requerimientos_luz` VALUES (4,'Sol directo','Estas plantas requieren una exposición directa al sol durante la mayor parte del día, preferiblemente más de 6 horas diarias. Son plantas que prosperan con la luz solar intensa y suelen provenir de climas cálidos.','Más de 6 horas'),(5,'Sol parcial','Estas plantas necesitan una exposición moderada al sol, preferiblemente entre 4 y 6 horas diarias de luz solar directa o parcialmente filtrada. No toleran la exposición prolongada a la luz solar intensa y pueden quemarse si se expone a ella durante períodos prolongados.','Entre 4 y 6 horas'),(6,'Luz indirecta','Las plantas que prefieren la luz indirecta prosperan con la luz que se filtra a través de una cortina u otro obstáculo. No toleran la exposición directa al sol y suelen ser sensibles a la luz solar intensa. Son ideales para ubicaciones interiores cerca de una ventana orientada al este o al oeste.','Luz indirecta, sin exposición directa al sol'),(7,'Media sombra','Estas plantas requieren entre 2 y 4 horas diarias de sol directo o luz filtrada. Pueden tolerar períodos cortos de luz solar intensa, pero prefieren la sombra durante la parte más caliente del día. Se benefician de áreas con luz difusa o sombra parcial.','Entre 2 y 4 horas'),(8,'Sombra','Las plantas que prefieren la sombra pueden crecer en áreas con muy poca o ninguna exposición directa al sol. Son sensibles a la luz solar intensa y pueden quemarse si se exponen a ella. Se ubican mejor en áreas sombreadas del jardín o en interiores con luz artificial.','Poca o ninguna');
/*!40000 ALTER TABLE `requerimientos_luz` ENABLE KEYS */;
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

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
-- Table structure for table `requerimientos_agua`
--

DROP TABLE IF EXISTS `requerimientos_agua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requerimientos_agua` (
  `id_requerimientos_agua` int NOT NULL AUTO_INCREMENT,
  `requerimiento_agua` varchar(100) DEFAULT NULL,
  `significado` varchar(1000) DEFAULT NULL,
  `frecuencia_regado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_requerimientos_agua`),
  UNIQUE KEY `requerimiento_agua_UNIQUE` (`requerimiento_agua`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requerimientos_agua`
--

LOCK TABLES `requerimientos_agua` WRITE;
/*!40000 ALTER TABLE `requerimientos_agua` DISABLE KEYS */;
INSERT INTO `requerimientos_agua` VALUES (1,'Bajo','Las plantas con una alta necesidad de riego generalmente requieren ser regadas con más frecuencia. Esto podría significar regarlas varias veces por semana, o incluso a diario en climas muy cálidos o secos. El objetivo es mantener el suelo constantemente húmedo, pero no saturado, para satisfacer las demandas de agua de estas plantas.','1-3 días'),(2,'Moderado','Las plantas con una necesidad de riego moderada necesitarán ser regadas con menos frecuencia que las de alta necesidad de riego. Por lo general, esto podría implicar regarlas una vez a la semana o cada pocos días, dependiendo de factores como el clima, el tipo de suelo y la cantidad de luz solar que reciben. El objetivo es mantener el suelo uniformemente húmedo, permitiendo que se seque ligeramente entre riegos.','3-7 días'),(3,'Alto','Las plantas con una baja necesidad de riego requerirán ser regadas con la menor frecuencia. Esto podría significar regarlas una vez cada dos semanas o incluso menos frecuentemente, dependiendo de las condiciones ambientales. Estas plantas pueden ser más tolerantes a la sequía y pueden sobrevivir con períodos prolongados sin agua. El objetivo es regarlas solo cuando el suelo esté seco en profundidad, evitando el exceso de agua que pueda llevar al encharcamiento.','7-14 días');
/*!40000 ALTER TABLE `requerimientos_agua` ENABLE KEYS */;
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

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
-- Table structure for table `suelos`
--

DROP TABLE IF EXISTS `suelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suelos` (
  `id_suelo` int NOT NULL AUTO_INCREMENT,
  `suelo` varchar(45) DEFAULT NULL,
  `significado` varchar(450) DEFAULT NULL,
  PRIMARY KEY (`id_suelo`),
  UNIQUE KEY `id_suelo_UNIQUE` (`id_suelo`),
  UNIQUE KEY `suelo_UNIQUE` (`suelo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suelos`
--

LOCK TABLES `suelos` WRITE;
/*!40000 ALTER TABLE `suelos` DISABLE KEYS */;
INSERT INTO `suelos` VALUES (14,'Suelo suelto','Se refiere a un suelo que tiene una estructura granular que permite una buena circulación del aire y el agua. Este tipo de suelo facilita el crecimiento de las raíces y evita el encharcamiento.'),(15,'Bien drenado','Indica que el suelo tiene la capacidad de permitir que el agua se filtre a través de él, evitando la acumulación de agua en exceso que pueda provocar el encharcamiento y pudrir las raíces de las plantas.'),(16,'Rico en materia orgánica','Significa que el suelo contiene una cantidad adecuada de material orgánico descompuesto, como compost, estiércol u otros materiales orgánicos. Este tipo de suelo es beneficioso porque proporciona nutrientes a las plantas y mejora la estructura del suelo.'),(17,'Ligeramente ácido','Indica que el pH del suelo está en un rango ligeramente ácido, que es favorable para la mayoría de las plantas hortícolas. Un pH ligeramente ácido, generalmente en el rango de 6 a 6.5, facilita la disponibilidad de nutrientes para las plantas.'),(18,'Profundo','Se refiere a un suelo que tiene una buena profundidad, lo que permite que las raíces de las plantas puedan extenderse y desarrollarse adecuadamente.');
/*!40000 ALTER TABLE `suelos` ENABLE KEYS */;
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

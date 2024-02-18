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
-- Table structure for table `familia`
--

DROP TABLE IF EXISTS `familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familia` (
  `id_familia` int NOT NULL AUTO_INCREMENT,
  `familia` varchar(100) DEFAULT NULL,
  `detalles` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id_familia`),
  UNIQUE KEY `id_familia_UNIQUE` (`id_familia`),
  UNIQUE KEY `familia_UNIQUE` (`familia`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familia`
--

LOCK TABLES `familia` WRITE;
/*!40000 ALTER TABLE `familia` DISABLE KEYS */;
INSERT INTO `familia` VALUES (50,'Amaranthaceae','La familia Amaranthaceae incluye plantas herbáceas, principalmente anuales o perennes. Muchas especies de esta familia son consideradas malezas, pero algunas se cultivan como vegetales de hojas comestibles, como la acelga y la espinaca.'),(51,'Amaryllidaceae','La familia Amaryllidaceae comprende plantas bulbosas y perennes, conocidas por sus atractivas flores. Incluye especies ornamentales como los narcisos, los tulipanes y las cebollas.'),(52,'Apiaceae','La familia Apiaceae, anteriormente conocida como Umbelliferae, incluye plantas herbáceas aromáticas con flores en umbelas. Muchas especies son comestibles o medicinales, como el apio, el perejil y el hinojo.'),(53,'Arecaceae','La familia Arecaceae, también conocida como Palmae, está compuesta principalmente por palmeras, algunas de las cuales son de gran importancia económica para la producción de aceite de palma, coco y datiles.'),(54,'Asparagaceae','La familia Asparagaceae incluye plantas perennes con hojas generalmente en forma de lanza y flores en forma de campana o racimos. Comprende géneros como Asparagus y Agave.'),(55,'Asteraceae','La familia Asteraceae, conocida comúnmente como la familia de las asteráceas o compuestas, es una de las familias más grandes de plantas con flores. Incluye muchas especies ornamentales y plantas medicinales, como las margaritas, los girasoles y la manzanilla.'),(56,'Brassicaceae','La familia Brassicaceae, anteriormente conocida como Cruciferae, incluye muchas plantas de importancia económica y alimentaria, como la col, el brócoli, la coliflor y el rábano. Muchas especies tienen flores en forma de cruz.'),(57,'Convolvulaceae','La familia Convolvulaceae incluye plantas herbáceas, arbustos y algunas especies trepadoras, como la campanilla, el camote y la gloria de la mañana. Muchas especies tienen flores en forma de trompeta.'),(58,'Cucurbitaceae','La familia Cucurbitaceae está compuesta por plantas trepadoras o rastreras, con tallos largos y flexibles y flores generalmente unisexuales. Incluye importantes cultivos alimentarios como el pepino, la calabaza y el melón.'),(59,'Fabaceae','La familia Fabaceae, conocida comúnmente como la familia de las leguminosas, es una de las familias más grandes de plantas con flores, con una amplia distribución y diversidad de especies. Incluye importantes cultivos alimentarios como los frijoles, los guisantes y la soja.'),(60,'Lamiaceae','La familia Lamiaceae, anteriormente conocida como Labiatae, incluye muchas plantas herbáceas y arbustivas con hojas opuestas y aromáticas. Incluye especies culinarias y medicinales como la menta, el tomillo y el romero.'),(61,'Lauraceae','La familia Lauraceae comprende árboles y arbustos, principalmente tropicales o subtropicales, conocidos por sus hojas aromáticas y aceites esenciales. Incluye especies como el laurel, el aguacate y la canela.'),(62,'Malvaceae','La familia Malvaceae incluye plantas herbáceas, arbustos y árboles, muchas de las cuales tienen flores grandes y vistosas. Incluye especies ornamentales como las malvas y plantas de importancia económica como el algodón.'),(63,'Plantaginaceae','La familia Plantaginaceae incluye plantas herbáceas con hojas basales en forma de roseta y flores en espigas. Incluye especies como la llantén y el verónica, que se utilizan en jardinería y herbolaria.'),(64,'Poaceae','La familia Poaceae, conocida comúnmente como la familia de las gramíneas o poáceas, es una de las familias más grandes de plantas con flores, que incluye hierbas, arbustos y árboles. Incluye importantes cultivos alimentarios como el maíz, el trigo y el arroz.'),(65,'Rosaceae','La familia Rosaceae incluye plantas herbáceas, arbustos y árboles, muchas de las cuales tienen flores en forma de rosa y frutos comestibles. Incluye especies ornamentales como las rosas y frutas como las fresas, las manzanas y las peras.'),(66,'Solanaceae','La familia Solanaceae incluye plantas herbáceas, arbustos y árboles, muchas de las cuales son de importancia económica y medicinal. Incluye cultivos alimentarios como el tomate, la papa, el pimiento y la berenjena.'),(67,'Verbenaceae','La familia Verbenaceae incluye plantas herbáceas, arbustos y árboles, algunas de las cuales tienen propiedades medicinales o se utilizan en jardinería. Incluye especies como la verbena y la lantana.'),(68,'Zingiberaceae','La familia Zingiberaceae está compuesta principalmente por plantas herbáceas tropicales con rizomas carnosos y hojas alternas. Incluye especies como el jengibre, la cúrcuma y el cardamomo.');
/*!40000 ALTER TABLE `familia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-17 21:26:37

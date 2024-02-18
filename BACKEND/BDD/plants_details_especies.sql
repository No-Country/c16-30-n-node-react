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
-- Table structure for table `especies`
--

DROP TABLE IF EXISTS `especies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especies` (
  `id_especie` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `nombre_cientifico` varchar(100) NOT NULL,
  `requerimiento_luz_id` int NOT NULL,
  `ritmo_crecimiento_id` int NOT NULL,
  `temperatura_id` int NOT NULL,
  `color_id` int NOT NULL,
  `tipo_planta_id` int NOT NULL,
  `duracion_id` int NOT NULL,
  `temporada_id` int NOT NULL,
  `detalles_id` int NOT NULL,
  `familia_id` int NOT NULL,
  `requerimientos_agua_id` int NOT NULL,
  `toxica_para_mascotas` tinyint NOT NULL,
  `tiempo_fructificacion` varchar(45) DEFAULT NULL,
  `clasificacion_planta_id` int NOT NULL,
  PRIMARY KEY (`id_especie`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `id_especie_UNIQUE` (`id_especie`),
  UNIQUE KEY `id_especie` (`id_especie`),
  KEY `fk_especies_requerimientos_luz_idx` (`requerimiento_luz_id`),
  KEY `fk_especies_ritmos_crecimiento1_idx` (`ritmo_crecimiento_id`),
  KEY `fk_especies_temperaturas1_idx` (`temperatura_id`),
  KEY `fk_especies_colores1_idx` (`color_id`),
  KEY `fk_especies_tipos_planta1_idx` (`tipo_planta_id`),
  KEY `fk_especies_duraciones1_idx` (`duracion_id`),
  KEY `fk_especies_temporadas1_idx` (`temporada_id`),
  KEY `fk_especies_detalles1_idx` (`detalles_id`),
  KEY `fk_especies_familia1_idx` (`familia_id`),
  KEY `fk_especies_requerimientos_agua1_idx` (`requerimientos_agua_id`),
  KEY `id_especies_id_clasificacion_planta` (`clasificacion_planta_id`),
  CONSTRAINT `fk_especies_colores1` FOREIGN KEY (`color_id`) REFERENCES `colores` (`id_color`),
  CONSTRAINT `fk_especies_detalles1` FOREIGN KEY (`detalles_id`) REFERENCES `detalles` (`id_detalles`),
  CONSTRAINT `fk_especies_duraciones1` FOREIGN KEY (`duracion_id`) REFERENCES `duraciones` (`id_duraciones`),
  CONSTRAINT `fk_especies_familia1` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`id_familia`),
  CONSTRAINT `fk_especies_requerimientos_agua1` FOREIGN KEY (`requerimientos_agua_id`) REFERENCES `requerimientos_agua` (`id_requerimientos_agua`),
  CONSTRAINT `fk_especies_requerimientos_luz` FOREIGN KEY (`requerimiento_luz_id`) REFERENCES `requerimientos_luz` (`id_requerimiento_luz`),
  CONSTRAINT `fk_especies_ritmos_crecimiento1` FOREIGN KEY (`ritmo_crecimiento_id`) REFERENCES `ritmos_crecimiento` (`id_ritmo_crecimiento`),
  CONSTRAINT `fk_especies_temperaturas1` FOREIGN KEY (`temperatura_id`) REFERENCES `temperaturas` (`id_temperatura`),
  CONSTRAINT `fk_especies_temporadas1` FOREIGN KEY (`temporada_id`) REFERENCES `temporadas` (`id_temporada`),
  CONSTRAINT `fk_especies_tipos_planta1` FOREIGN KEY (`tipo_planta_id`) REFERENCES `tipos_planta` (`id_tipo_planta`),
  CONSTRAINT `id_especies_id_clasificacion_planta` FOREIGN KEY (`clasificacion_planta_id`) REFERENCES `clasificacion_planta` (`id_clasificacion_planta`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especies`
--

LOCK TABLES `especies` WRITE;
/*!40000 ALTER TABLE `especies` DISABLE KEYS */;
INSERT INTO `especies` VALUES (156,'Achicoria','Cichorium intybus',5,2,28,12,25,2,19,1,55,2,0,'90-120 días',1),(157,'Ajedrea','Satureja',5,3,24,12,25,3,19,1,60,2,0,'70-90 días',1),(158,'Ají','Capsicum annuum',4,3,34,3,23,1,17,1,66,2,1,'60-90 días',1),(159,'Ajo','Allium sativum',4,1,21,8,24,3,23,1,51,1,1,'90-150 días',1),(160,'Albahaca','Ocimum basilicum',4,3,30,12,25,1,17,1,60,2,0,'60-90 días',2),(161,'Apio','Apium graveolens',5,2,26,12,31,2,19,1,52,2,0,'100-120 días',1),(162,'Batata','Ipomoea batatas',4,2,33,2,33,3,17,1,57,2,0,'90-120 días',2),(163,'Berenjena','Solanum melongena',4,2,33,6,23,1,17,1,66,2,0,'60-80 días',1),(164,'Berro','Nasturtium officinale',7,3,14,12,25,1,19,1,56,3,0,'30-50 días',1),(165,'Brócoli','Brassica oleracea var. italica',4,2,27,12,27,2,24,1,56,2,0,'60-90 días',1),(166,'Calabacín','Cucurbita pepo',4,3,33,12,30,1,17,1,58,2,0,'40-60 días',1),(167,'Calabaza','Cucurbita',4,3,33,2,30,1,17,1,58,2,0,'90-120 días',1),(168,'Cebolla','Allium cepa',4,2,19,8,24,2,23,1,51,1,1,'100-150 días',1),(169,'Cebolla de Invierno','Allium fistulosum',4,2,20,12,24,2,24,1,51,2,1,'90-150 días',1),(170,'Cebolla de Verdeo','Allium fistulosum',4,2,20,12,31,2,19,1,51,2,1,'60-90 días',1),(171,'Cebollín','Allium schoenoprasum',4,3,18,12,31,3,19,1,51,2,1,'60-90 días',2),(172,'Cedrón','Aloysia citrodora',5,2,24,12,23,3,19,1,67,2,0,'60-90 días',1),(173,'Chayote','Sechium edule',4,3,33,12,32,3,19,1,58,2,0,'90-120 días',2),(174,'Chirivía','Pastinaca sativa',5,2,21,8,29,2,19,1,52,2,0,'90-120 días',2),(175,'Cilantro','Coriandrum sativum',5,3,29,12,25,1,19,1,52,2,0,'60-90 días',1),(176,'Col','Brassica oleracea var. capitata',4,2,17,12,25,2,24,1,56,2,0,'50-100 días',2),(177,'Coliflor','Brassica oleracea var. botrytis',4,2,21,8,27,2,24,1,56,2,0,'60-100 días',1),(178,'Culantro','Eryngium foetidum',5,3,34,12,25,1,19,1,52,2,0,'90-120 días',1),(179,'Endibia','Cichorium endivia',7,2,21,12,25,2,19,1,55,2,0,'70-90 días',2),(180,'Eneldo','Anethum graveolens',5,2,28,12,25,1,19,1,52,2,0,'40-60 días',1),(181,'Escarola','Cichorium endivia',7,2,21,12,25,2,19,1,55,2,0,'60-80 días',1),(182,'Espárragos','Asparagus officinalis',4,2,23,12,31,3,17,1,54,2,0,'2-3 años',2),(183,'Espinaca','Spinacia oleracea',7,3,16,12,25,1,19,1,50,3,1,'40-60 días',1),(184,'Estragón','Artemisia dracunculus',5,2,28,12,25,3,19,1,55,2,0,'90-120 días',2),(185,'Guisante','Pisum sativum',4,2,16,12,28,1,25,1,59,2,0,'60-80 días',1),(186,'Habas','Vicia faba',4,2,15,12,28,1,25,1,59,2,0,'70-90 días',1),(187,'Hediondilla','Limnophila aromatica',5,3,36,12,25,3,19,1,63,2,1,'90-120 días',1),(188,'Hierba Buena','Mentha',5,3,28,12,25,3,19,1,60,2,0,'60-90 días',1),(189,'Hierbabuena','Mentha spicata',5,3,28,12,25,3,19,1,60,2,0,'60-90 días',2),(190,'Hierbaluisa','Aloysia citrodora',5,3,24,12,23,3,19,1,67,2,0,'60-90 días',1),(191,'Hinojo','Foeniculum vulgare',4,2,28,12,24,3,19,1,52,2,0,'70-90 días',1),(192,'Hinojo de Jardín','Foeniculum vulgare var. azoricum',4,2,28,12,24,3,19,1,52,2,0,'70-90 días',1),(193,'Jengibre','Zingiber officinale',6,1,37,1,33,3,17,1,68,3,0,'8-10 meses',2),(194,'Jícama','Pachyrhizus erosus',4,3,38,11,33,3,17,1,59,2,0,'150-180 días',1),(195,'Laurel','Laurus nobilis',5,2,20,12,23,3,19,1,61,1,1,'Varía',2),(196,'Lavanda','Lavandula',4,1,33,6,23,3,19,1,60,1,1,'90-120 días',1),(197,'Lechuga','Lactuca sativa',7,3,22,12,25,1,19,1,55,2,0,'40-60 días',2),(198,'Limoncillo','Cymbopogon citratus',5,3,35,12,25,3,18,1,64,2,0,'90-120 días',2),(199,'Maíz','Zea mays',4,3,31,12,26,1,18,1,64,3,0,'60-100 días',2),(200,'Manzanilla','Matricaria chamomilla',5,3,23,8,25,1,19,1,55,1,0,'90-120 días',2),(201,'Mejorana','Origanum majorana',5,3,28,12,25,3,18,1,60,2,0,'90-120 días',1),(202,'Melisa','Melissa officinalis',5,3,28,12,25,3,18,1,60,2,0,'90-120 días',1),(203,'Menta','Mentha',5,3,28,12,25,3,18,1,60,2,0,'60-90 días',2),(204,'Nabo','Brassica rapa var. rapa',5,2,21,8,29,2,24,1,56,2,0,'60-90 días',2),(205,'Orégano','Origanum vulgare',5,3,28,12,25,3,18,1,60,2,0,'90-120 días',1),(206,'Pak choi','Brassica rapa chinensis',5,3,28,12,25,1,24,1,56,2,0,'40-60 días',1),(207,'Palmito','Chamaerops humilis',4,1,25,12,31,3,18,1,53,2,0,'Varía',1),(208,'Papas','Solanum tuberosum',4,2,20,8,33,3,17,1,66,2,1,'80-120 días',1),(209,'Patata','Solanum tuberosum',4,2,20,11,33,3,17,1,66,2,1,'90-120 días',1),(210,'Pepino','Cucumis sativus',4,3,34,12,32,1,18,1,58,2,0,'50-70 días',1),(211,'Perejil','Petroselinum crispum',5,3,24,12,25,2,19,1,60,2,0,'70-90 días',2),(212,'Perejil de Monte','Petroselinum crispum',5,3,24,12,25,2,19,1,60,2,0,'70-90 días',1),(213,'Perifollo','Anthriscus cerefolium',5,3,21,12,25,1,19,1,52,2,0,'60-80 días',2),(214,'Pimpinela','Sanguisorba minor',5,3,24,12,25,3,19,1,65,2,0,'60-80 días',1),(215,'Poleo','Mentha pulegium',5,3,28,12,25,3,18,1,60,2,1,'90-120 días',2),(216,'Poleo Menta','Mentha piperita',5,3,28,12,25,3,18,1,60,2,1,'90-120 días',2),(217,'Puerro','Allium ampeloprasum',5,2,19,8,31,2,19,1,51,2,1,'120-150 días',1),(218,'Rabano','Raphanus sativus',5,3,23,3,29,1,19,1,56,2,0,'20-30 días',2),(219,'Remolacha','Beta vulgaris',5,2,20,3,29,2,19,1,50,2,0,'60-90 días',2),(220,'Repollo','Brassica oleracea var. capitata',4,2,17,12,25,2,24,1,56,2,0,'70-100 días',2),(221,'Romero','Rosmarinus officinalis',4,2,28,12,23,3,18,1,60,1,0,'90-120 días',1),(222,'Romero Blanco','Rosmarinus officinalis',4,2,28,12,23,3,18,1,60,1,0,'90-120 días',2),(223,'Rúcula','Eruca vesicaria',5,3,16,12,25,1,19,1,56,3,0,'40-60 días',2),(224,'Salvia','Salvia officinalis',5,2,28,12,23,3,18,1,60,1,1,'90-120 días',1),(225,'Tilo','Tilia',5,1,24,12,23,3,19,1,62,2,0,'Varía',1),(226,'Tomate','Solanum lycopersicum',4,3,34,3,23,1,18,1,66,2,1,'60-85 días',1),(227,'Tomate Cherry','Solanum lycopersicum var. cerasiforme',4,3,32,3,32,3,17,1,66,2,1,'60-75 días',1),(228,'Tomillo','Thymus vulgaris',5,2,28,12,23,3,18,1,60,1,0,'90-120 días',1),(229,'Yerba Buena','Mentha',5,3,28,12,25,3,18,1,60,2,0,'60-90 días',1),(230,'Zanahoria','Daucus carota',5,2,20,2,29,2,19,1,50,2,0,'70-80 días',2),(231,'Zapallo','Cucurbita',4,3,33,2,30,1,17,1,58,2,0,'90-120 días',1),(232,'Acelga','Beta vulgaris',5,3,20,12,25,2,19,1,50,2,0,'50-60 días',2);
/*!40000 ALTER TABLE `especies` ENABLE KEYS */;
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

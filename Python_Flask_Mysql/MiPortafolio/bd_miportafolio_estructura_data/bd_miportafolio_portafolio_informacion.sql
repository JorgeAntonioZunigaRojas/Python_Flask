CREATE DATABASE  IF NOT EXISTS `bd_miportafolio` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bd_miportafolio`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_miportafolio
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `portafolio_informacion`
--

DROP TABLE IF EXISTS `portafolio_informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portafolio_informacion` (
  `informacion_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `datos_codigo` int(11) DEFAULT NULL,
  `proyectos_codigo` int(11) DEFAULT NULL,
  `experiencia_codigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`informacion_codigo`),
  KEY `datos_codigo` (`datos_codigo`),
  KEY `proyectos_codigo` (`proyectos_codigo`),
  KEY `experiencia_codigo` (`experiencia_codigo`),
  CONSTRAINT `portafolio_informacion_ibfk_1` FOREIGN KEY (`datos_codigo`) REFERENCES `portafolio_datos` (`datos_codigo`),
  CONSTRAINT `portafolio_informacion_ibfk_2` FOREIGN KEY (`proyectos_codigo`) REFERENCES `portafolio_proyectos` (`proyectos_codigo`),
  CONSTRAINT `portafolio_informacion_ibfk_3` FOREIGN KEY (`experiencia_codigo`) REFERENCES `portafolio_experiencia` (`experiencia_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portafolio_informacion`
--

LOCK TABLES `portafolio_informacion` WRITE;
/*!40000 ALTER TABLE `portafolio_informacion` DISABLE KEYS */;
INSERT INTO `portafolio_informacion` VALUES (4,1,1,1),(5,1,2,2),(6,2,3,3),(7,2,4,4),(8,1,3,3),(11,1,4,4);
/*!40000 ALTER TABLE `portafolio_informacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-17 16:36:20

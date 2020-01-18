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
-- Table structure for table `portafolio_proyectos`
--

DROP TABLE IF EXISTS `portafolio_proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portafolio_proyectos` (
  `proyectos_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `proyectos_titulo` varchar(100) DEFAULT NULL,
  `proyectos_subtitulo` varchar(50) DEFAULT NULL,
  `proyectos_fecha` date DEFAULT NULL,
  `proyectos_direccion_web` varchar(80) DEFAULT NULL,
  `proyectos_descripcion` text DEFAULT NULL,
  `proyectos_foto` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`proyectos_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portafolio_proyectos`
--

LOCK TABLES `portafolio_proyectos` WRITE;
/*!40000 ALTER TABLE `portafolio_proyectos` DISABLE KEYS */;
INSERT INTO `portafolio_proyectos` VALUES (1,'Portafolio en Flask','Integracion con Mysql','2020-01-16','http://www.armando.com/portafolio','Lorem Ipsum es simplemente el texto de relleno \n  de las imprentas y archivos de texto. Lorem Ipsum h\n  a sido el texto de relleno estándar de las \n  industrias desde el año 1500, cuando un impresor \n  N. del T. persona que se dedica a la imprenta','portafolio_flask.png'),(2,'Portafolio en Django','Integracion con MongoDB','2020-01-20','http://www.armando.com/portafoliomongo','Lorem Ipsum es simplemente el texto de relleno \n  de las imprentas y archivos de texto. Lorem Ipsum h\n  a sido el texto de relleno estándar de las \n  industrias desde el año 1500, cuando un impresor \n  N. del T. persona que se dedica a la imprenta','portafolio_django.jpg'),(3,'Ecommerce DJANGO','Integracion con POSTGRESS','2020-01-22','http://www.armando.com/ecommerce','Lorem Ipsum es simplemente el texto de relleno \n  de las imprentas y archivos de texto. Lorem Ipsum h\n  a sido el texto de relleno estándar de las \n  industrias desde el año 1500, cuando un impresor \n  N. del T. persona que se dedica a la imprenta','ecommerce_django.jpg'),(4,'BIG DATA','Integracion con SQL','2020-02-22','http://www.armando.com/bigdata','Lorem Ipsum es simplemente el texto de relleno \n  de las imprentas y archivos de texto. Lorem Ipsum h\n  a sido el texto de relleno estándar de las \n  industrias desde el año 1500, cuando un impresor \n  N. del T. persona que se dedica a la imprenta','bigdata.png');
/*!40000 ALTER TABLE `portafolio_proyectos` ENABLE KEYS */;
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

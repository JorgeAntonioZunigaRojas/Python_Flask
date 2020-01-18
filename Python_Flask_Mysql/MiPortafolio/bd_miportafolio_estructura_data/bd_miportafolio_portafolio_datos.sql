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
-- Table structure for table `portafolio_datos`
--

DROP TABLE IF EXISTS `portafolio_datos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portafolio_datos` (
  `datos_codigo` int(11) NOT NULL AUTO_INCREMENT,
  `datos_nombre` varchar(150) DEFAULT NULL,
  `datos_descripcion` text DEFAULT NULL,
  `datos_foto` varchar(60) DEFAULT NULL,
  `datos_correo` varchar(120) DEFAULT NULL,
  `datos_twitter` varchar(120) DEFAULT NULL,
  `datos_facebook` varchar(120) DEFAULT NULL,
  `datos_github` varchar(120) DEFAULT NULL,
  `datos_instagram` varchar(120) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`datos_codigo`),
  CONSTRAINT `chk_estados` CHECK (`estado` in (1,0))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portafolio_datos`
--

LOCK TABLES `portafolio_datos` WRITE;
/*!40000 ALTER TABLE `portafolio_datos` DISABLE KEYS */;
INSERT INTO `portafolio_datos` VALUES (1,'Jorge Antonio Zuñiga Rojas','Ingeniero de Sistemas','foto_toño.jpeg','toño@gmail.com','toño@twitter','toño@facebook','toño@github','toño@instagram','1'),(2,'GUILLE','Ingeniero Mecanico','foto_guille.jpg','guille@gmail.com','guille@twitter','guille@facebook','guille@github','guille@instagram','1'),(3,'HELEN','Tecnico Computacion Informatica','f8.JPG','helen@gmail.com','helen@twitter','helen@facebook','helen@github','helen@instagram','1'),(4,'TATY','Administradora','f8.JPG','taty@gmail.com','taty@twitter','taty@facebook','taty@github','taty@instagram','1'),(5,'MIGUEL','Economica','f8.JPG','miguel@gmail.com','miguel@twitter','miguel@facebook','miguel@github','miguel@instagram','1');
/*!40000 ALTER TABLE `portafolio_datos` ENABLE KEYS */;
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

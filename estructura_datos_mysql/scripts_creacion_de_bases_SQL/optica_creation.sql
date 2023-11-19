-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: optica
-- ------------------------------------------------------
-- Server version	8.2.0

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


CREATE DATABASE optica;
USE optica;
--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idclientes` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `numero_edificio` int NOT NULL,
  `piso` int NOT NULL,
  `puerta` int NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `codigo_postal` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `fecha_registro` date NOT NULL,
  `cliente_recomendador` int DEFAULT NULL,
  PRIMARY KEY (`idclientes`),
  UNIQUE KEY `idclientes_UNIQUE` (`idclientes`),
  KEY `ciente_recomendador_idx` (`cliente_recomendador`),
  CONSTRAINT `fk_cliente_recomendador` FOREIGN KEY (`cliente_recomendador`) REFERENCES `clientes` (`idclientes`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Alan Waller','C/ Roca',4,5,6,'Barcelona','08045','España','8574832746','waller@gmail.com','2022-05-05',NULL),(2,'Marcela Rodriguez','C/ Papa',4,5,6,'Barcelona','08045','España','645768796','marcela@gmail.com','2022-05-06',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idempleados` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idempleados`),
  UNIQUE KEY `idempleados_UNIQUE` (`idempleados`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (3,'García Camprodon');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `idmarcas` int NOT NULL AUTO_INCREMENT,
  `nombre_marca` varchar(45) NOT NULL,
  `proveedor` int NOT NULL,
  PRIMARY KEY (`idmarcas`),
  UNIQUE KEY `idmarcas_UNIQUE` (`idmarcas`),
  UNIQUE KEY `nombre_marca_UNIQUE` (`nombre_marca`),
  KEY `fk_proveedor_idx` (`proveedor`),
  CONSTRAINT `fk_proveedor` FOREIGN KEY (`proveedor`) REFERENCES `proveedores` (`idproveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Marca Fantasy',1),(2,'Marca Curiosity',1),(3,'Marca Validity',2);
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monturas`
--

DROP TABLE IF EXISTS `monturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monturas` (
  `idmonturas` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idmonturas`),
  UNIQUE KEY `idmonturas_UNIQUE` (`idmonturas`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monturas`
--

LOCK TABLES `monturas` WRITE;
/*!40000 ALTER TABLE `monturas` DISABLE KEYS */;
INSERT INTO `monturas` VALUES (1,'Pasta'),(2,'Metálica'),(3,'Flotante');
/*!40000 ALTER TABLE `monturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idproveedores` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `numero_edificio` int NOT NULL,
  `piso` int NOT NULL,
  `puerta` int NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `codigo_postal` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `fax` varchar(45) NOT NULL,
  `nif` varchar(45) NOT NULL,
  PRIMARY KEY (`idproveedores`),
  UNIQUE KEY `idproveedores_UNIQUE` (`idproveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Gafas Montero','C/ Salsa',4,5,3,'Barcelona','08034','España','654765456','647384758','83475837Y'),(2,'Gafas Soler','C/ Salsa',6,4,5,'Barcelona','08034','España','436577856','647384758','83475837T');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idventas` int NOT NULL AUTO_INCREMENT,
  `marca` int NOT NULL,
  `graduacion` varchar(45) NOT NULL,
  `montura` int NOT NULL,
  `color_montura` varchar(45) NOT NULL,
  `color_cristales` varchar(45) NOT NULL,
  `precio` int NOT NULL,
  `empleado` int NOT NULL,
  `cliente` int NOT NULL,
  `fecha_venta` date NOT NULL,
  PRIMARY KEY (`idventas`),
  UNIQUE KEY `idventas_UNIQUE` (`idventas`),
  KEY `fk_marca_idx` (`marca`),
  KEY `fk_montura_idx` (`montura`),
  KEY `fk_empleado_idx` (`empleado`),
  KEY `fk_cliente_idx` (`cliente`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`idclientes`),
  CONSTRAINT `fk_empleado` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`idempleados`),
  CONSTRAINT `fk_marca` FOREIGN KEY (`marca`) REFERENCES `marcas` (`idmarcas`),
  CONSTRAINT `fk_montura` FOREIGN KEY (`montura`) REFERENCES `monturas` (`idmonturas`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,'3.0 / 4.0',2,'Verde','Transp.',145,3,1,'2023-05-05');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19 23:47:10

-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzeria
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

CREATE DATABASE pizzeria;
USE pizzeria;
--
-- Table structure for table `bebidas`
--

DROP TABLE IF EXISTS `bebidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bebidas` (
  `idbebidas` int NOT NULL AUTO_INCREMENT,
  `nombre_bebida` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `precio` varchar(45) NOT NULL,
  PRIMARY KEY (`idbebidas`),
  UNIQUE KEY `idbebidas_UNIQUE` (`idbebidas`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebidas`
--

LOCK TABLES `bebidas` WRITE;
/*!40000 ALTER TABLE `bebidas` DISABLE KEYS */;
INSERT INTO `bebidas` VALUES (1,'Bebida Naranja','Una bebida de naranja!','./img/bebidas/naranja.jpg','5'),(2,'Bebida Limón','Una bebida de limón!','./img/bebidas/limon.jpg','5');
/*!40000 ALTER TABLE `bebidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `burgers`
--

DROP TABLE IF EXISTS `burgers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `burgers` (
  `idburgers` int NOT NULL AUTO_INCREMENT,
  `nombre_burger` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `precio` varchar(45) NOT NULL,
  PRIMARY KEY (`idburgers`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `burgers`
--

LOCK TABLES `burgers` WRITE;
/*!40000 ALTER TABLE `burgers` DISABLE KEYS */;
INSERT INTO `burgers` VALUES (1,'Burger con cebolla','Una burger con cebolla!','./img/burgers/con_cebolla.jpg','10'),(2,'Burger de pollo','Una burger con pollo!','./img/burgers/con_pollo.jpg','10');
/*!40000 ALTER TABLE `burgers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cantidades_bebidas`
--

DROP TABLE IF EXISTS `cantidades_bebidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cantidades_bebidas` (
  `id_bebida` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  KEY `id_pedido` (`id_pedido`),
  KEY `id_bebida` (`id_bebida`),
  CONSTRAINT `cantidades_bebidas_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`idpedidos`),
  CONSTRAINT `cantidades_bebidas_ibfk_2` FOREIGN KEY (`id_bebida`) REFERENCES `bebidas` (`idbebidas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cantidades_bebidas`
--

LOCK TABLES `cantidades_bebidas` WRITE;
/*!40000 ALTER TABLE `cantidades_bebidas` DISABLE KEYS */;
INSERT INTO `cantidades_bebidas` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `cantidades_bebidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cantidades_burgers`
--

DROP TABLE IF EXISTS `cantidades_burgers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cantidades_burgers` (
  `id_burger` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  KEY `id_pedido` (`id_pedido`),
  KEY `id_burger` (`id_burger`),
  CONSTRAINT `cantidades_burgers_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`idpedidos`),
  CONSTRAINT `cantidades_burgers_ibfk_2` FOREIGN KEY (`id_burger`) REFERENCES `burgers` (`idburgers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cantidades_burgers`
--

LOCK TABLES `cantidades_burgers` WRITE;
/*!40000 ALTER TABLE `cantidades_burgers` DISABLE KEYS */;
INSERT INTO `cantidades_burgers` VALUES (2,4,2);
/*!40000 ALTER TABLE `cantidades_burgers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cantidades_pizzas`
--

DROP TABLE IF EXISTS `cantidades_pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cantidades_pizzas` (
  `id_pizzas` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  KEY `id_pizzas` (`id_pizzas`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `cantidades_pizzas_ibfk_1` FOREIGN KEY (`id_pizzas`) REFERENCES `pizzas` (`idpizzas`),
  CONSTRAINT `cantidades_pizzas_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`idpedidos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cantidades_pizzas`
--

LOCK TABLES `cantidades_pizzas` WRITE;
/*!40000 ALTER TABLE `cantidades_pizzas` DISABLE KEYS */;
INSERT INTO `cantidades_pizzas` VALUES (1,1,1),(2,1,1);
/*!40000 ALTER TABLE `cantidades_pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias_pizza`
--

DROP TABLE IF EXISTS `categorias_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias_pizza` (
  `idcategorias_pizza` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategorias_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias_pizza`
--

LOCK TABLES `categorias_pizza` WRITE;
/*!40000 ALTER TABLE `categorias_pizza` DISABLE KEYS */;
INSERT INTO `categorias_pizza` VALUES (1,'Con carne'),(2,'Vegetarianas'),(3,'Veganas');
/*!40000 ALTER TABLE `categorias_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `codigo_postal` varchar(45) NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE KEY `idcliente_UNIQUE` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Marta','Sascuález','C/ Marina','08045','Barcelona','Barcelona','95847365'),(2,'Juan','Sasquez','C/ Lepant','08056','Barcelona','Barcelona','857463764');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
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
  `apellido` varchar(45) NOT NULL,
  `nif` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `tipo_empleado` int NOT NULL,
  `tienda` int DEFAULT NULL,
  PRIMARY KEY (`idempleados`),
  UNIQUE KEY `idempleados_UNIQUE` (`idempleados`),
  KEY `fk_tipo_empleado_idx` (`tipo_empleado`),
  KEY `tienda` (`tienda`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`tienda`) REFERENCES `tiendas` (`idtiendas`),
  CONSTRAINT `fk_tipo_empleado` FOREIGN KEY (`tipo_empleado`) REFERENCES `tipo_empleado` (`idtipo_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Pascual','Marinero','94857364Y','857463745',2,1),(2,'Emérito','Gascual','47583748T','84758374',1,1);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidad_pedido`
--

DROP TABLE IF EXISTS `modalidad_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidad_pedido` (
  `idmodalidad_pedido` int NOT NULL AUTO_INCREMENT,
  `modalidad` varchar(45) NOT NULL,
  PRIMARY KEY (`idmodalidad_pedido`),
  UNIQUE KEY `idmodalidad_pedido_UNIQUE` (`idmodalidad_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidad_pedido`
--

LOCK TABLES `modalidad_pedido` WRITE;
/*!40000 ALTER TABLE `modalidad_pedido` DISABLE KEYS */;
INSERT INTO `modalidad_pedido` VALUES (1,'A domicilio'),(2,'En tienda');
/*!40000 ALTER TABLE `modalidad_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `idpedidos` int NOT NULL AUTO_INCREMENT,
  `fecha_pedido` date NOT NULL,
  `idmodalidad` int NOT NULL,
  `precio_total` int NOT NULL,
  `fecha_repartido` date NOT NULL,
  `cliente` int NOT NULL,
  `repartidor` int DEFAULT NULL,
  `tienda` int NOT NULL,
  PRIMARY KEY (`idpedidos`),
  KEY `fk_idmodalidad_idx` (`idmodalidad`),
  KEY `cliente` (`cliente`),
  KEY `repartidor` (`repartidor`),
  KEY `tienda` (`tienda`),
  CONSTRAINT `fk_idmodalidad` FOREIGN KEY (`idmodalidad`) REFERENCES `modalidad_pedido` (`idmodalidad_pedido`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`repartidor`) REFERENCES `empleados` (`idempleados`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`tienda`) REFERENCES `tiendas` (`idtiendas`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2023-06-06',1,25,'2023-06-06',1,1,1),(2,'2023-07-07',2,50,'2023-07-07',1,NULL,1);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzas`
--

DROP TABLE IF EXISTS `pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzas` (
  `idpizzas` int NOT NULL AUTO_INCREMENT,
  `nombre_pizza` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `precio` varchar(45) NOT NULL,
  `categoria_pizza` int NOT NULL,
  PRIMARY KEY (`idpizzas`),
  UNIQUE KEY `idpizzas_UNIQUE` (`idpizzas`),
  KEY `fk_categoria_pizza_idx` (`categoria_pizza`),
  CONSTRAINT `fk_categoria_pizza` FOREIGN KEY (`categoria_pizza`) REFERENCES `categorias_pizza` (`idcategorias_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzas`
--

LOCK TABLES `pizzas` WRITE;
/*!40000 ALTER TABLE `pizzas` DISABLE KEYS */;
INSERT INTO `pizzas` VALUES (1,'Pizza con pollo','Pizza que lleva pollo!','./img/pizzas/con_pollo.jpg','10',1),(2,'Pizza con brocoli','Pizza que lleva brocoli!','./img/pizzas/con_brocoli.jpg','10',2),(3,'Pizza cuatro quesos','Una pizza de cuatro quesos!','./img/pizzas/cuatro_quesos.jpg','10',2);
/*!40000 ALTER TABLE `pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiendas`
--

DROP TABLE IF EXISTS `tiendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiendas` (
  `idtiendas` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(45) NOT NULL,
  `numero_edificio` int NOT NULL,
  `puerta` int NOT NULL,
  `piso` int NOT NULL,
  `codigo_postal` varchar(45) NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  PRIMARY KEY (`idtiendas`),
  UNIQUE KEY `idtiendas_UNIQUE` (`idtiendas`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiendas`
--

LOCK TABLES `tiendas` WRITE;
/*!40000 ALTER TABLE `tiendas` DISABLE KEYS */;
INSERT INTO `tiendas` VALUES (1,'C/ Rocafort',4,5,2,'08045','Barcelona','Barcelona');
/*!40000 ALTER TABLE `tiendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_empleado`
--

DROP TABLE IF EXISTS `tipo_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_empleado` (
  `idtipo_empleado` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`idtipo_empleado`),
  UNIQUE KEY `idtipo_empleado_UNIQUE` (`idtipo_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_empleado`
--

LOCK TABLES `tipo_empleado` WRITE;
/*!40000 ALTER TABLE `tipo_empleado` DISABLE KEYS */;
INSERT INTO `tipo_empleado` VALUES (1,'Cocina'),(2,'Reparto');
/*!40000 ALTER TABLE `tipo_empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19 23:50:18

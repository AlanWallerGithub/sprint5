-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: youtube
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

CREATE DATABASE youtube;
USE youtube;
--
-- Table structure for table `canal`
--

DROP TABLE IF EXISTS `canal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canal` (
  `idcanal` int NOT NULL AUTO_INCREMENT,
  `nombre_canal` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `id_usuario_propietario` int NOT NULL,
  PRIMARY KEY (`idcanal`),
  KEY `fk_id_usuario_propietario_idx` (`id_usuario_propietario`),
  CONSTRAINT `fk_id_usuario_propietario` FOREIGN KEY (`id_usuario_propietario`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal`
--

LOCK TABLES `canal` WRITE;
/*!40000 ALTER TABLE `canal` DISABLE KEYS */;
INSERT INTO `canal` VALUES (1,'Canal Manolo','¡Mi canal!','2022-03-03',1),(2,'Canal Claudina','Mi canal','2022-03-03',2);
/*!40000 ALTER TABLE `canal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `idcomentarios` int NOT NULL AUTO_INCREMENT,
  `texto_comentario` varchar(45) NOT NULL,
  `fecha_comentario` date NOT NULL,
  `idvideo` int NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idcomentarios`),
  KEY `fk_idvideo_idx` (`idvideo`),
  KEY `fk_idusuario_idx` (`idusuario`),
  CONSTRAINT `fk_idusuario_comment` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`),
  CONSTRAINT `fk_idvideo_comment` FOREIGN KEY (`idvideo`) REFERENCES `video` (`idvideo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'No me gusta nada','2023-03-03',1,2);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dislike_comentario`
--

DROP TABLE IF EXISTS `dislike_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dislike_comentario` (
  `iddislike_comentario` int NOT NULL AUTO_INCREMENT,
  `idcomentario` int NOT NULL,
  `idusuario` int NOT NULL,
  `fecha_dislike_comentario` date NOT NULL,
  PRIMARY KEY (`iddislike_comentario`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  UNIQUE KEY `idcomentario_UNIQUE` (`idcomentario`),
  CONSTRAINT `fk_idcomentario_dis` FOREIGN KEY (`idcomentario`) REFERENCES `comentarios` (`idcomentarios`),
  CONSTRAINT `fk_idusuario_comentario` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislike_comentario`
--

LOCK TABLES `dislike_comentario` WRITE;
/*!40000 ALTER TABLE `dislike_comentario` DISABLE KEYS */;
INSERT INTO `dislike_comentario` VALUES (1,1,1,'2023-05-05');
/*!40000 ALTER TABLE `dislike_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dislikes`
--

DROP TABLE IF EXISTS `dislikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dislikes` (
  `iddislikes` int NOT NULL AUTO_INCREMENT,
  `idvideo` int NOT NULL,
  `idusuario` int NOT NULL,
  `fecha_dislike` date NOT NULL,
  PRIMARY KEY (`iddislikes`),
  UNIQUE KEY `idvideo_UNIQUE` (`idvideo`),
  UNIQUE KEY `dislikescol_UNIQUE` (`idusuario`),
  CONSTRAINT `fk_idusuario_dis` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`),
  CONSTRAINT `fk_idvideo_dis` FOREIGN KEY (`idvideo`) REFERENCES `video` (`idvideo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikes`
--

LOCK TABLES `dislikes` WRITE;
/*!40000 ALTER TABLE `dislikes` DISABLE KEYS */;
INSERT INTO `dislikes` VALUES (1,1,2,'2022-05-05');
/*!40000 ALTER TABLE `dislikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados_video`
--

DROP TABLE IF EXISTS `estados_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados_video` (
  `idestados_video` int NOT NULL AUTO_INCREMENT,
  `tipo_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idestados_video`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados_video`
--

LOCK TABLES `estados_video` WRITE;
/*!40000 ALTER TABLE `estados_video` DISABLE KEYS */;
INSERT INTO `estados_video` VALUES (1,'Publico'),(2,'Privado'),(3,'Oculto');
/*!40000 ALTER TABLE `estados_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiquetas`
--

DROP TABLE IF EXISTS `etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetas` (
  `idetiquetas` int NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` varchar(45) NOT NULL,
  `idvideo` int NOT NULL,
  PRIMARY KEY (`idetiquetas`),
  KEY `fk_idvideo_idx` (`idvideo`),
  CONSTRAINT `fk_idvideo` FOREIGN KEY (`idvideo`) REFERENCES `video` (`idvideo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetas`
--

LOCK TABLES `etiquetas` WRITE;
/*!40000 ALTER TABLE `etiquetas` DISABLE KEYS */;
INSERT INTO `etiquetas` VALUES (1,'divertido',1),(2,'bailes',1),(3,'cancion',1);
/*!40000 ALTER TABLE `etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_comentario`
--

DROP TABLE IF EXISTS `like_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_comentario` (
  `idlike_comentario` int NOT NULL AUTO_INCREMENT,
  `idcomentario` int NOT NULL,
  `idusuario` int NOT NULL,
  `fecha_like_comentario` date NOT NULL,
  PRIMARY KEY (`idlike_comentario`),
  UNIQUE KEY `idcomentario_UNIQUE` (`idcomentario`),
  UNIQUE KEY `like_comentariocol_UNIQUE` (`idusuario`),
  CONSTRAINT `fk_idcomentario` FOREIGN KEY (`idcomentario`) REFERENCES `comentarios` (`idcomentarios`),
  CONSTRAINT `fk_idusuario_like_comment` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_comentario`
--

LOCK TABLES `like_comentario` WRITE;
/*!40000 ALTER TABLE `like_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `idlikes` int NOT NULL AUTO_INCREMENT,
  `idvideo` int NOT NULL,
  `idusuario` int NOT NULL,
  `fecha_like` date NOT NULL,
  PRIMARY KEY (`idlikes`),
  UNIQUE KEY `idvideo_UNIQUE` (`idvideo`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  CONSTRAINT `fk_idusuario_like` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`),
  CONSTRAINT `fk_idvideo_like` FOREIGN KEY (`idvideo`) REFERENCES `video` (`idvideo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,1,'2022-05-05');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlists` (
  `idplaylists` int NOT NULL AUTO_INCREMENT,
  `nombre_playlist` varchar(45) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `estado` int NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idplaylists`),
  KEY `fk_estado_idx` (`estado`),
  KEY `fk_idusuario_idx` (`idusuario`),
  CONSTRAINT `fk_estado` FOREIGN KEY (`estado`) REFERENCES `estados_video` (`idestados_video`),
  CONSTRAINT `fk_idusuario_playlists` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlists`
--

LOCK TABLES `playlists` WRITE;
/*!40000 ALTER TABLE `playlists` DISABLE KEYS */;
INSERT INTO `playlists` VALUES (1,'Playlist nueva','2023-05-05',1,1);
/*!40000 ALTER TABLE `playlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `idsubscriptions` int NOT NULL AUTO_INCREMENT,
  `idcanal` int NOT NULL,
  `idusuario` int NOT NULL,
  PRIMARY KEY (`idsubscriptions`),
  UNIQUE KEY `idusuario_UNIQUE` (`idusuario`),
  UNIQUE KEY `idcanal_UNIQUE` (`idcanal`),
  CONSTRAINT `fk_idcanal_subs` FOREIGN KEY (`idcanal`) REFERENCES `canal` (`idcanal`),
  CONSTRAINT `fk_idusuario_subs` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,1,2);
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idusuarios` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `codigo_postal` varchar(45) NOT NULL,
  PRIMARY KEY (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'manolo@gmail.com','12345','mano2','1980-07-07','Masculino','España','08034'),(2,'claudina@gmail.com','12345','clau_clau','1980-07-07','Femenino','España','08024');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `video` (
  `idvideo` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `tamaño` varchar(45) NOT NULL,
  `nombre_archivo` varchar(45) NOT NULL,
  `duracion` varchar(45) NOT NULL,
  `thumbnail` varchar(45) NOT NULL,
  `reproducciones` int NOT NULL,
  `numero_likes` int NOT NULL,
  `numero_dislikes` int NOT NULL,
  `estado_video` int NOT NULL,
  `idusuario` int NOT NULL,
  `fecha_lanzamiento` date NOT NULL,
  PRIMARY KEY (`idvideo`),
  KEY `fk_estado_video_idx` (`estado_video`),
  KEY `fk_idusuario_idx` (`idusuario`),
  CONSTRAINT `fk_estado_video` FOREIGN KEY (`estado_video`) REFERENCES `estados_video` (`idestados_video`),
  CONSTRAINT `fk_idusuario_video` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'Video primero','Este video es el más divertido','456MB','video1.mp4','05:08','./img/thumbnail_1.jpg',45,1,1,1,1,'2022-02-02');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos_playlist`
--

DROP TABLE IF EXISTS `videos_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videos_playlist` (
  `idplaylist` int NOT NULL,
  `idvideo` int NOT NULL,
  UNIQUE KEY `idvideos_playlist_UNIQUE` (`idplaylist`),
  UNIQUE KEY `videos_playlistcol_UNIQUE` (`idvideo`),
  CONSTRAINT `fk_idplaylist` FOREIGN KEY (`idplaylist`) REFERENCES `playlists` (`idplaylists`),
  CONSTRAINT `fk_idvideo_pl` FOREIGN KEY (`idvideo`) REFERENCES `video` (`idvideo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videos_playlist`
--

LOCK TABLES `videos_playlist` WRITE;
/*!40000 ALTER TABLE `videos_playlist` DISABLE KEYS */;
INSERT INTO `videos_playlist` VALUES (1,1);
/*!40000 ALTER TABLE `videos_playlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-19 23:52:41

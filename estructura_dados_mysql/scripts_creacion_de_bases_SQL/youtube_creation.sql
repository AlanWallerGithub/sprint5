-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 ;
USE `youtube` ;

-- -----------------------------------------------------
-- Table `youtube`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`usuarios` (
  `idusuarios` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idusuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`estados_video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`estados_video` (
  `idestados_video` INT NOT NULL AUTO_INCREMENT,
  `tipo_estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idestados_video`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `idvideo` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `tamaño` VARCHAR(45) NOT NULL,
  `nombre_archivo` VARCHAR(45) NOT NULL,
  `duracion` VARCHAR(45) NOT NULL,
  `thumbnail` VARCHAR(45) NOT NULL,
  `reproducciones` INT NOT NULL,
  `numero_likes` INT NOT NULL,
  `numero_dislikes` INT NOT NULL,
  `estado_video` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `fecha_lanzamiento` DATE NOT NULL,
  PRIMARY KEY (`idvideo`),
  INDEX `fk_estado_video_idx` (`estado_video` ASC) VISIBLE,
  INDEX `fk_idusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_estado_video`
    FOREIGN KEY (`estado_video`)
    REFERENCES `youtube`.`estados_video` (`idestados_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuario_video`
    FOREIGN KEY (`idusuario`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`etiquetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`etiquetas` (
  `idetiquetas` INT NOT NULL AUTO_INCREMENT,
  `nombre_etiqueta` VARCHAR(45) NOT NULL,
  `idvideo` INT NOT NULL,
  PRIMARY KEY (`idetiquetas`),
  INDEX `fk_idvideo_idx` (`idvideo` ASC) VISIBLE,
  CONSTRAINT `fk_idvideo`
    FOREIGN KEY (`idvideo`)
    REFERENCES `youtube`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`canal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`canal` (
  `idcanal` INT NOT NULL AUTO_INCREMENT,
  `nombre_canal` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `id_usuario_propietario` INT NOT NULL,
  PRIMARY KEY (`idcanal`),
  INDEX `fk_id_usuario_propietario_idx` (`id_usuario_propietario` ASC) VISIBLE,
  CONSTRAINT `fk_id_usuario_propietario`
    FOREIGN KEY (`id_usuario_propietario`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`subscriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`subscriptions` (
  `idsubscriptions` INT NOT NULL AUTO_INCREMENT,
  `idcanal` INT NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idsubscriptions`),
  UNIQUE INDEX `idusuario_UNIQUE` (`idusuario` ASC) VISIBLE,
  UNIQUE INDEX `idcanal_UNIQUE` (`idcanal` ASC) VISIBLE,
  CONSTRAINT `fk_idcanal_subs`
    FOREIGN KEY (`idcanal`)
    REFERENCES `youtube`.`canal` (`idcanal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuario_subs`
    FOREIGN KEY (`idusuario`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`likes` (
  `idlikes` INT NOT NULL AUTO_INCREMENT,
  `idvideo` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `fecha_like` DATE NOT NULL,
  PRIMARY KEY (`idlikes`),
  UNIQUE INDEX `idvideo_UNIQUE` (`idvideo` ASC) VISIBLE,
  UNIQUE INDEX `idusuario_UNIQUE` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_idvideo_like`
    FOREIGN KEY (`idvideo`)
    REFERENCES `youtube`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuario_like`
    FOREIGN KEY (`idusuario`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`dislikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`dislikes` (
  `iddislikes` INT NOT NULL AUTO_INCREMENT,
  `idvideo` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `fecha_dislike` DATE NOT NULL,
  PRIMARY KEY (`iddislikes`),
  UNIQUE INDEX `idvideo_UNIQUE` (`idvideo` ASC) VISIBLE,
  UNIQUE INDEX `dislikescol_UNIQUE` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_idvideo_dis`
    FOREIGN KEY (`idvideo`)
    REFERENCES `youtube`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuario_dis`
    FOREIGN KEY (`idusuario`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlists` (
  `idplaylists` INT NOT NULL AUTO_INCREMENT,
  `nombre_playlist` VARCHAR(45) NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `estado` INT NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idplaylists`),
  INDEX `fk_estado_idx` (`estado` ASC) VISIBLE,
  INDEX `fk_idusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_estado`
    FOREIGN KEY (`estado`)
    REFERENCES `youtube`.`estados_video` (`idestados_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuario_playlists`
    FOREIGN KEY (`idusuario`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`videos_playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`videos_playlist` (
  `idplaylist` INT NOT NULL,
  `idvideo` INT NOT NULL,
  UNIQUE INDEX `idvideos_playlist_UNIQUE` (`idplaylist` ASC) VISIBLE,
  UNIQUE INDEX `videos_playlistcol_UNIQUE` (`idvideo` ASC) VISIBLE,
  CONSTRAINT `fk_idplaylist`
    FOREIGN KEY (`idplaylist`)
    REFERENCES `youtube`.`playlists` (`idplaylists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idvideo_pl`
    FOREIGN KEY (`idvideo`)
    REFERENCES `youtube`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`comentarios` (
  `idcomentarios` INT NOT NULL AUTO_INCREMENT,
  `texto_comentario` VARCHAR(45) NOT NULL,
  `fecha_comentario` DATE NOT NULL,
  `idvideo` INT NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idcomentarios`),
  INDEX `fk_idvideo_idx` (`idvideo` ASC) VISIBLE,
  INDEX `fk_idusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_idvideo_comment`
    FOREIGN KEY (`idvideo`)
    REFERENCES `youtube`.`video` (`idvideo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuario_comment`
    FOREIGN KEY (`idusuario`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`like_comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`like_comentario` (
  `idlike_comentario` INT NOT NULL AUTO_INCREMENT,
  `idcomentario` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `fecha_like_comentario` DATE NOT NULL,
  PRIMARY KEY (`idlike_comentario`),
  UNIQUE INDEX `idcomentario_UNIQUE` (`idcomentario` ASC) VISIBLE,
  UNIQUE INDEX `like_comentariocol_UNIQUE` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_idcomentario`
    FOREIGN KEY (`idcomentario`)
    REFERENCES `youtube`.`comentarios` (`idcomentarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuario_like_comment`
    FOREIGN KEY (`idusuario`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`dislike_comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`dislike_comentario` (
  `iddislike_comentario` INT NOT NULL AUTO_INCREMENT,
  `idcomentario` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `fecha_dislike_comentario` DATE NOT NULL,
  PRIMARY KEY (`iddislike_comentario`),
  UNIQUE INDEX `idusuario_UNIQUE` (`idusuario` ASC) VISIBLE,
  UNIQUE INDEX `idcomentario_UNIQUE` (`idcomentario` ASC) VISIBLE,
  CONSTRAINT `fk_idcomentario_dis`
    FOREIGN KEY (`idcomentario`)
    REFERENCES `youtube`.`comentarios` (`idcomentarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuario_comentario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `youtube`.`usuarios` (`idusuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

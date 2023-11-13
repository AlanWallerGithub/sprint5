-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema spotify
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8 ;
USE `spotify` ;

-- -----------------------------------------------------
-- Table `spotify`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`tipo_usuario` (
  `idtipo_usuario` INT NOT NULL AUTO_INCREMENT,
  `tipo_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipo_usuario`),
  UNIQUE INDEX `idtipo_usuario_UNIQUE` (`idtipo_usuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  `tipo_usuario` INT NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE INDEX `iduser_UNIQUE` (`iduser` ASC) VISIBLE,
  UNIQUE INDEX `usercol_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_tipo_usuario_idx` (`tipo_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_tipo_usuario`
    FOREIGN KEY (`tipo_usuario`)
    REFERENCES `spotify`.`tipo_usuario` (`idtipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`metodo_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`metodo_pago` (
  `idmetodo_pago` INT NOT NULL AUTO_INCREMENT,
  `tipo_pago` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmetodo_pago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`subscriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`subscriptions` (
  `idsubscriptions` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_renovacion` DATE NOT NULL,
  `metodo_pago` INT NOT NULL,
  PRIMARY KEY (`idsubscriptions`),
  UNIQUE INDEX `idsubscriptions_UNIQUE` (`idsubscriptions` ASC) VISIBLE,
  INDEX `fk_user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_metodo_pago_idx` (`metodo_pago` ASC) VISIBLE,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `spotify`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_metodo_pago`
    FOREIGN KEY (`metodo_pago`)
    REFERENCES `spotify`.`metodo_pago` (`idmetodo_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`tarjetas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`tarjetas` (
  `idtarjetas` INT NOT NULL AUTO_INCREMENT,
  `fecha_caducidad` DATE NOT NULL,
  `codigo_seguridad` VARCHAR(45) NOT NULL,
  `numero_tarjeta` VARCHAR(45) NOT NULL,
  `iduser` INT NOT NULL,
  PRIMARY KEY (`idtarjetas`),
  INDEX `fk_iduser_idx` (`iduser` ASC) VISIBLE,
  CONSTRAINT `fk_iduser_tarjetas`
    FOREIGN KEY (`iduser`)
    REFERENCES `spotify`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`cuentas_paypal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`cuentas_paypal` (
  `idcuentas_paypal` INT NOT NULL AUTO_INCREMENT,
  `usuario_paypal` VARCHAR(45) NOT NULL,
  `iduser` INT NOT NULL,
  PRIMARY KEY (`idcuentas_paypal`),
  INDEX `fk_iduser_idx` (`iduser` ASC) VISIBLE,
  CONSTRAINT `fk_iduser_paypal`
    FOREIGN KEY (`iduser`)
    REFERENCES `spotify`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`pagos_premium`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`pagos_premium` (
  `idpagos_premium` INT NOT NULL AUTO_INCREMENT,
  `fecha_pago` DATE NOT NULL,
  `precio_total` INT NOT NULL,
  `idusuario` INT NOT NULL,
  PRIMARY KEY (`idpagos_premium`),
  UNIQUE INDEX `idpagos_premium_UNIQUE` (`idpagos_premium` ASC) VISIBLE,
  INDEX `fk_idusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_idusuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `spotify`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlists_eliminadas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlists_eliminadas` (
  `idplaylists_eliminadas` INT NOT NULL AUTO_INCREMENT,
  `fecha_eliminacion` DATE NOT NULL,
  PRIMARY KEY (`idplaylists_eliminadas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`playlists` (
  `idplaylists` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `numero_canciones` INT NOT NULL,
  `fecha_creacion` DATE NOT NULL,
  `idusuario` INT NOT NULL,
  `idplaylists_eliminadas` INT NULL,
  PRIMARY KEY (`idplaylists`),
  UNIQUE INDEX `idplaylists_UNIQUE` (`idplaylists` ASC) VISIBLE,
  INDEX `fk_idusuario_idx` (`idusuario` ASC) VISIBLE,
  INDEX `fk_idplaylists_eliminadas_idx` (`idplaylists_eliminadas` ASC) VISIBLE,
  CONSTRAINT `fk_idusuario_playlists`
    FOREIGN KEY (`idusuario`)
    REFERENCES `spotify`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idplaylists_eliminadas`
    FOREIGN KEY (`idplaylists_eliminadas`)
    REFERENCES `spotify`.`playlists_eliminadas` (`idplaylists_eliminadas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artistas` (
  `idartistas` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen_artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idartistas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`album` (
  `idalbum` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `fecha_lanzamiento` DATE NOT NULL,
  `imagen_portada` VARCHAR(45) NOT NULL,
  `artista` INT NOT NULL,
  PRIMARY KEY (`idalbum`),
  UNIQUE INDEX `idalbum_UNIQUE` (`idalbum` ASC) VISIBLE,
  INDEX `fk_artista_idx` (`artista` ASC) VISIBLE,
  CONSTRAINT `fk_artista`
    FOREIGN KEY (`artista`)
    REFERENCES `spotify`.`artistas` (`idartistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`canciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`canciones` (
  `idcanciones` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `album` INT NOT NULL,
  `artista` INT NOT NULL,
  `duracion` VARCHAR(45) NOT NULL,
  `reproducciones` INT NOT NULL,
  PRIMARY KEY (`idcanciones`),
  INDEX `fk_album_idx` (`album` ASC) VISIBLE,
  INDEX `fk_artista_idx` (`artista` ASC) VISIBLE,
  CONSTRAINT `fk_album_canciones`
    FOREIGN KEY (`album`)
    REFERENCES `spotify`.`album` (`idalbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artista_canciones`
    FOREIGN KEY (`artista`)
    REFERENCES `spotify`.`artistas` (`idartistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`canciones_compartidas_en_playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`canciones_compartidas_en_playlist` (
  `idcanciones_compartidas_en_playlist` INT NOT NULL AUTO_INCREMENT,
  `idplaylists` INT NOT NULL,
  `usuario_que_la_compartio` INT NOT NULL,
  `fecha_de_compartir` DATE NOT NULL,
  `cancion` INT NOT NULL,
  PRIMARY KEY (`idcanciones_compartidas_en_playlist`),
  INDEX `fk_cancion_idx` (`cancion` ASC) VISIBLE,
  INDEX `fk_usuario_que_la_compartio_idx` (`usuario_que_la_compartio` ASC) VISIBLE,
  INDEX `fk_idplaylists_idx` (`idplaylists` ASC) VISIBLE,
  CONSTRAINT `fk_cancion`
    FOREIGN KEY (`cancion`)
    REFERENCES `spotify`.`canciones` (`idcanciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_que_la_compartio`
    FOREIGN KEY (`usuario_que_la_compartio`)
    REFERENCES `spotify`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idplaylists`
    FOREIGN KEY (`idplaylists`)
    REFERENCES `spotify`.`playlists` (`idplaylists`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artistas_seguidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artistas_seguidos` (
  `idartistas` INT NOT NULL,
  `iduser` INT NOT NULL,
  INDEX `fk_idartistas_idx` (`idartistas` ASC) VISIBLE,
  INDEX `fk_iduser_idx` (`iduser` ASC) VISIBLE,
  CONSTRAINT `fk_idartistas_seguidos`
    FOREIGN KEY (`idartistas`)
    REFERENCES `spotify`.`artistas` (`idartistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_iduser_artistas_seguidos`
    FOREIGN KEY (`iduser`)
    REFERENCES `spotify`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`artistas_relacionados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`artistas_relacionados` (
  `idartista1` INT NOT NULL,
  `idartista2` INT NOT NULL,
  INDEX `fk_idartistas1_idx` (`idartista1` ASC) VISIBLE,
  INDEX `fk_idartista2_idx` (`idartista2` ASC) VISIBLE,
  CONSTRAINT `fk_idartista1`
    FOREIGN KEY (`idartista1`)
    REFERENCES `spotify`.`artistas` (`idartistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idartista2`
    FOREIGN KEY (`idartista2`)
    REFERENCES `spotify`.`artistas` (`idartistas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`canciones_preferidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`canciones_preferidas` (
  `idcancion` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `nombre_cancion` VARCHAR(45) NOT NULL,
  INDEX `fk_idcancion_idx` (`idcancion` ASC) VISIBLE,
  INDEX `fk_idusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_idcancion_preferida`
    FOREIGN KEY (`idcancion`)
    REFERENCES `spotify`.`canciones` (`idcanciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuario_canciones_preferidas`
    FOREIGN KEY (`idusuario`)
    REFERENCES `spotify`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `spotify`.`albumes_preferidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spotify`.`albumes_preferidos` (
  `idalbum` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `nombre_album` VARCHAR(45) NOT NULL,
  INDEX `fk_idalbum_idx` (`idalbum` ASC) VISIBLE,
  INDEX `fk_idusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `fk_idalbum_preferido`
    FOREIGN KEY (`idalbum`)
    REFERENCES `spotify`.`album` (`idalbum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idusuario_album_preferido`
    FOREIGN KEY (`idusuario`)
    REFERENCES `spotify`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

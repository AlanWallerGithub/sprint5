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
  `imagen_portada` VARCHAR(100) NOT NULL,
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

-- -----------------------------------------------------
-- Data for table `spotify`.`tipo_usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`tipo_usuario` (`idtipo_usuario`, `tipo_usuario`) VALUES (1, 'Free');
INSERT INTO `spotify`.`tipo_usuario` (`idtipo_usuario`, `tipo_usuario`) VALUES (2, 'Premium');

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`user` (`iduser`, `email`, `password`, `username`, `fecha_nacimiento`, `genero`, `pais`, `codigo_postal`, `tipo_usuario`) VALUES (1, 'chancha@gmail.com', '12345', 'chancho_pastor', '1980-09-09', 'Masculino', 'España', '08045', 1);
INSERT INTO `spotify`.`user` (`iduser`, `email`, `password`, `username`, `fecha_nacimiento`, `genero`, `pais`, `codigo_postal`, `tipo_usuario`) VALUES (2, 'casadoro@gmail.com', '123456', 'casadoro2', '1980-04-04', 'Masculino', 'España', '08035', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`metodo_pago`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`metodo_pago` (`idmetodo_pago`, `tipo_pago`) VALUES (1, 'Tarjeta');
INSERT INTO `spotify`.`metodo_pago` (`idmetodo_pago`, `tipo_pago`) VALUES (2, 'Paypal');

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`subscriptions`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`subscriptions` (`idsubscriptions`, `user_id`, `fecha_inicio`, `fecha_renovacion`, `metodo_pago`) VALUES (1, 2, '2021-03-03', '2024-03-03', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`tarjetas`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`tarjetas` (`idtarjetas`, `fecha_caducidad`, `codigo_seguridad`, `numero_tarjeta`, `iduser`) VALUES (1, '2025-04-04', '465', '253475867', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`cuentas_paypal`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`cuentas_paypal` (`idcuentas_paypal`, `usuario_paypal`, `iduser`) VALUES (1, 'micuenta', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`pagos_premium`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`pagos_premium` (`idpagos_premium`, `fecha_pago`, `precio_total`, `idusuario`) VALUES (1, '2021-03-03', 31, 2);
INSERT INTO `spotify`.`pagos_premium` (`idpagos_premium`, `fecha_pago`, `precio_total`, `idusuario`) VALUES (2, '2022-03-03', 31, 2);
INSERT INTO `spotify`.`pagos_premium` (`idpagos_premium`, `fecha_pago`, `precio_total`, `idusuario`) VALUES (3, '2023-03-03', 31, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`playlists_eliminadas`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`playlists_eliminadas` (`idplaylists_eliminadas`, `fecha_eliminacion`) VALUES (1, '2022-05-05');

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`playlists`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`playlists` (`idplaylists`, `titulo`, `numero_canciones`, `fecha_creacion`, `idusuario`, `idplaylists_eliminadas`) VALUES (1, 'Playlist de cosas buenas', 2, '2022-03-03', 1, NULL);
INSERT INTO `spotify`.`playlists` (`idplaylists`, `titulo`, `numero_canciones`, `fecha_creacion`, `idusuario`, `idplaylists_eliminadas`) VALUES (2, 'Playlist borrosa', 5, '2022-03-03', 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`artistas`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`artistas` (`idartistas`, `nombre`, `imagen_artista`) VALUES (1, 'Casablanca', './img/artists/casablanca.jpg');
INSERT INTO `spotify`.`artistas` (`idartistas`, `nombre`, `imagen_artista`) VALUES (2, 'Julio Balazar', './img/artists/julio_balanzar.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`album`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`album` (`idalbum`, `titulo`, `fecha_lanzamiento`, `imagen_portada`, `artista`) VALUES (1, 'Casablanca Songs', '2022-03-03', './img/artists/casablanca/albums/casablanca_songs.jpg', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`canciones`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`canciones` (`idcanciones`, `titulo`, `album`, `artista`, `duracion`, `reproducciones`) VALUES (1, 'Santiago', 1, 1, '03:04', 54);
INSERT INTO `spotify`.`canciones` (`idcanciones`, `titulo`, `album`, `artista`, `duracion`, `reproducciones`) VALUES (2, 'Pac', 1, 1, '02:03', 43);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`canciones_compartidas_en_playlist`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`canciones_compartidas_en_playlist` (`idcanciones_compartidas_en_playlist`, `idplaylists`, `usuario_que_la_compartio`, `fecha_de_compartir`, `cancion`) VALUES (1, 1, 2, '2023-03-03', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`artistas_seguidos`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`artistas_seguidos` (`idartistas`, `iduser`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`artistas_relacionados`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`artistas_relacionados` (`idartista1`, `idartista2`) VALUES (1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`canciones_preferidas`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`canciones_preferidas` (`idcancion`, `idusuario`, `nombre_cancion`) VALUES (1, 1, 'Santiago');

COMMIT;


-- -----------------------------------------------------
-- Data for table `spotify`.`albumes_preferidos`
-- -----------------------------------------------------
START TRANSACTION;
USE `spotify`;
INSERT INTO `spotify`.`albumes_preferidos` (`idalbum`, `idusuario`, `nombre_album`) VALUES (1, 1, 'Casablanca Songs');

COMMIT;


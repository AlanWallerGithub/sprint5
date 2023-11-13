-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8mb3 ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`clientes` (
  `idclientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero_edificio` INT NOT NULL,
  `piso` INT NOT NULL,
  `puerta` INT NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `fecha_registro` DATE NOT NULL,
  `cliente_recomendador` INT NOT NULL,
  PRIMARY KEY (`idclientes`),
  UNIQUE INDEX `idclientes_UNIQUE` (`idclientes` ASC) VISIBLE,
  INDEX `ciente_recomendador_idx` (`cliente_recomendador` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_recomendador`
    FOREIGN KEY (`cliente_recomendador`)
    REFERENCES `optica`.`clientes` (`idclientes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `optica`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`proveedores` (
  `idproveedores` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero_edificio` INT NOT NULL,
  `piso` INT NOT NULL,
  `puerta` INT NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `fax` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproveedores`),
  UNIQUE INDEX `idproveedores_UNIQUE` (`idproveedores` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `optica`.`marcas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`marcas` (
  `idmarcas` INT NOT NULL AUTO_INCREMENT,
  `nombre_marca` VARCHAR(45) NOT NULL,
  `proveedor` INT NOT NULL,
  PRIMARY KEY (`idmarcas`),
  UNIQUE INDEX `idmarcas_UNIQUE` (`idmarcas` ASC) VISIBLE,
  UNIQUE INDEX `nombre_marca_UNIQUE` (`nombre_marca` ASC) VISIBLE,
  INDEX `fk_proveedor_idx` (`proveedor` ASC) VISIBLE,
  CONSTRAINT `fk_proveedor`
    FOREIGN KEY (`proveedor`)
    REFERENCES `optica`.`proveedores` (`idproveedores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `optica`.`monturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`monturas` (
  `idmonturas` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmonturas`),
  UNIQUE INDEX `idmonturas_UNIQUE` (`idmonturas` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `optica`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`ventas` (
  `idventas` INT NOT NULL AUTO_INCREMENT,
  `marca` INT NOT NULL,
  `graduacion` VARCHAR(45) NOT NULL,
  `montura` INT NOT NULL,
  `color_montura` VARCHAR(45) NOT NULL,
  `color_cristales` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `empleado` INT NOT NULL,
  `cliente` INT NOT NULL,
  `fecha_venta` DATE NOT NULL,
  PRIMARY KEY (`idventas`),
  UNIQUE INDEX `idventas_UNIQUE` (`idventas` ASC) VISIBLE,
  INDEX `fk_marca_idx` (`marca` ASC) VISIBLE,
  INDEX `fk_montura_idx` (`montura` ASC) VISIBLE,
  INDEX `fk_empleado_idx` (`empleado` ASC) VISIBLE,
  INDEX `fk_cliente_idx` (`cliente` ASC) VISIBLE,
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`cliente`)
    REFERENCES `optica`.`clientes` (`idclientes`),
  CONSTRAINT `fk_empleado`
    FOREIGN KEY (`empleado`)
    REFERENCES `optica`.`empleados` (`idempleados`),
  CONSTRAINT `fk_marca`
    FOREIGN KEY (`marca`)
    REFERENCES `optica`.`marcas` (`idmarcas`),
  CONSTRAINT `fk_montura`
    FOREIGN KEY (`montura`)
    REFERENCES `optica`.`monturas` (`idmonturas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `optica`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `optica`.`empleados` (
  `idempleados` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `ventas` INT NOT NULL,
  PRIMARY KEY (`idempleados`),
  UNIQUE INDEX `idempleados_UNIQUE` (`idempleados` ASC) VISIBLE,
  INDEX `fk_ventas_idx` (`ventas` ASC) VISIBLE,
  CONSTRAINT `fk_ventas`
    FOREIGN KEY (`ventas`)
    REFERENCES `optica`.`ventas` (`idventas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

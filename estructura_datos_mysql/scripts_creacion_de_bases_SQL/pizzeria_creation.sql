-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8mb3 ;
USE `pizzeria` ;

-- -----------------------------------------------------
-- Table `pizzeria`.`bebidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`bebidas` (
  `idbebidas` INT NOT NULL AUTO_INCREMENT,
  `nombre_bebida` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idbebidas`),
  UNIQUE INDEX `idbebidas_UNIQUE` (`idbebidas` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`burgers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`burgers` (
  `idburgers` INT NOT NULL AUTO_INCREMENT,
  `nombre_burger` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idburgers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`categorias_pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`categorias_pizza` (
  `idcategorias_pizza` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategorias_pizza`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`modalidad_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`modalidad_pedido` (
  `idmodalidad_pedido` INT NOT NULL AUTO_INCREMENT,
  `modalidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmodalidad_pedido`),
  UNIQUE INDEX `idmodalidad_pedido_UNIQUE` (`idmodalidad_pedido` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pedidos` (
  `idpedidos` INT NOT NULL AUTO_INCREMENT,
  `fecha_pedido` DATE NOT NULL,
  `idmodalidad` INT NOT NULL,
  `pizzas_brocoli` INT NOT NULL,
  `pizzas_pollo` INT NOT NULL,
  `pizzas_cuatro_quesos` INT NOT NULL,
  `burgers_cebolla` INT NOT NULL,
  `burgers_pollo` INT NOT NULL,
  `bebidas_naranja` INT NOT NULL,
  `bebidas_limon` INT NOT NULL,
  `precio_total` INT NOT NULL,
  `fecha_repartido` DATE NOT NULL,
  `idempleado_repartidor` INT NOT NULL,
  PRIMARY KEY (`idpedidos`),
  INDEX `fk_idmodalidad_idx` (`idmodalidad` ASC) VISIBLE,
  CONSTRAINT `fk_idmodalidad`
    FOREIGN KEY (`idmodalidad`)
    REFERENCES `pizzeria`.`modalidad_pedido` (`idmodalidad_pedido`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `idpedidos` INT NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE INDEX `idcliente_UNIQUE` (`idcliente` ASC) VISIBLE,
  INDEX `fk_idpedidos_idx` (`idpedidos` ASC) VISIBLE,
  CONSTRAINT `fk_idpedidos`
    FOREIGN KEY (`idpedidos`)
    REFERENCES `pizzeria`.`pedidos` (`idpedidos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`tipo_empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`tipo_empleado` (
  `idtipo_empleado` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipo_empleado`),
  UNIQUE INDEX `idtipo_empleado_UNIQUE` (`idtipo_empleado` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`empleados` (
  `idempleados` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `tipo_empleado` INT NOT NULL,
  PRIMARY KEY (`idempleados`),
  UNIQUE INDEX `idempleados_UNIQUE` (`idempleados` ASC) VISIBLE,
  INDEX `fk_tipo_empleado_idx` (`tipo_empleado` ASC) VISIBLE,
  CONSTRAINT `fk_tipo_empleado`
    FOREIGN KEY (`tipo_empleado`)
    REFERENCES `pizzeria`.`tipo_empleado` (`idtipo_empleado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`pizzas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`pizzas` (
  `idpizzas` INT NOT NULL AUTO_INCREMENT,
  `nombre_pizza` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `categoria_pizza` INT NOT NULL,
  PRIMARY KEY (`idpizzas`),
  UNIQUE INDEX `idpizzas_UNIQUE` (`idpizzas` ASC) VISIBLE,
  INDEX `fk_categoria_pizza_idx` (`categoria_pizza` ASC) VISIBLE,
  CONSTRAINT `fk_categoria_pizza`
    FOREIGN KEY (`categoria_pizza`)
    REFERENCES `pizzeria`.`categorias_pizza` (`idcategorias_pizza`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria`.`tiendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria`.`tiendas` (
  `idtiendas` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(45) NOT NULL,
  `numero_edificio` INT NOT NULL,
  `puerta` INT NOT NULL,
  `piso` INT NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `provincia` VARCHAR(45) NOT NULL,
  `idpedidos` INT NOT NULL,
  `idempleados` INT NOT NULL,
  PRIMARY KEY (`idtiendas`),
  UNIQUE INDEX `idtiendas_UNIQUE` (`idtiendas` ASC) VISIBLE,
  INDEX `fk_idpedidos_idx` (`idpedidos` ASC) VISIBLE,
  INDEX `fk_idempleados_idx` (`idempleados` ASC) VISIBLE,
  CONSTRAINT `fk_idempleados`
    FOREIGN KEY (`idempleados`)
    REFERENCES `pizzeria`.`empleados` (`idempleados`),
  CONSTRAINT `fk_idpedidos_tienda`
    FOREIGN KEY (`idpedidos`)
    REFERENCES `pizzeria`.`pedidos` (`idpedidos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

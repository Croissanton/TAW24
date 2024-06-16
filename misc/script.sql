-- MySQL Script generated by MySQL Workbench
-- Mon Apr 15 13:07:37 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(90) NOT NULL,
  `passwordHash` VARCHAR(90) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(90) NOT NULL,
  `edad` SMALLINT(3) NOT NULL,
  `permisos_adc` BIT(3) NOT NULL,
  `sexo` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entrenador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Entrenador` (
  `idUsuario` INT NOT NULL,
  `Crosstraining` BIT(1) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `id_UNIQUE` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `id`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entrenador_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Entrenador_Usuario` (
  `idUsuario` INT NOT NULL,
  `idEntrenador` INT NOT NULL,
  PRIMARY KEY (`idUsuario`, `idEntrenador`),
  INDEX `idEntrenador_idx` (`idEntrenador` ASC) VISIBLE,
  CONSTRAINT `fkEntrenador_Entrenador_Usuario`
    FOREIGN KEY (`idEntrenador`)
    REFERENCES `mydb`.`Entrenador` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkUsuario_Entrenador_Usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dieta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dieta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idDietista` INT NOT NULL,
  `fechaCreacion` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `idDietista_idx` (`idDietista` ASC) VISIBLE,
  CONSTRAINT `idDietista`
    FOREIGN KEY (`idDietista`)
    REFERENCES `mydb`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `fecha_UNIQUE` (`fecha` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dieta_Dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dieta_Dia` (
  `idDieta` INT NOT NULL,
  `idDia` INT NOT NULL,
  PRIMARY KEY (`idDieta`, `idDia`),
  INDEX `idDia_idx` (`idDia` ASC) VISIBLE,
  CONSTRAINT `fkDia_Dieta_Dia`
    FOREIGN KEY (`idDia`)
    REFERENCES `mydb`.`Dia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkDieta_Dieta_Dia`
    FOREIGN KEY (`idDieta`)
    REFERENCES `mydb`.`Dieta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comida` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Menu_Dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Menu_Dia` (
  `idMenu` INT NOT NULL,
  `idDia` INT NOT NULL,
  `Completado` BIT(1) NOT NULL,
  PRIMARY KEY (`idMenu`, `idDia`),
  INDEX `idDia_idx` (`idDia` ASC) VISIBLE,
  CONSTRAINT `fkDia_Menu_Dia`
    FOREIGN KEY (`idDia`)
    REFERENCES `mydb`.`Dia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkMenu_Menu_Dia`
    FOREIGN KEY (`idMenu`)
    REFERENCES `mydb`.`Menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comida_Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comida_Menu` (
  `idComida` INT NOT NULL,
  `idMenu` INT NOT NULL,
  PRIMARY KEY (`idComida`, `idMenu`),
  INDEX `idMenu_idx` (`idMenu` ASC) VISIBLE,
  CONSTRAINT `fkMenu_Comida_Menu`
    FOREIGN KEY (`idMenu`)
    REFERENCES `mydb`.`Menu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkComida_Comida_Menu`
    FOREIGN KEY (`idComida`)
    REFERENCES `mydb`.`Comida` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sesion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Crosstraining` BIT(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ejercicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ejercicio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idTipo` INT NOT NULL,
  `nombre` VARCHAR(90) NOT NULL,
  `url` VARCHAR(256) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  INDEX `idTipo_idx` (`idTipo` ASC) VISIBLE,
  CONSTRAINT `idTipo`
    FOREIGN KEY (`idTipo`)
    REFERENCES `mydb`.`Tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rutina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rutina` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idEntrenador` INT NOT NULL,
  `fechaCreacion` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `idEntrenador_idx` (`idEntrenador` ASC) VISIBLE,
  CONSTRAINT `idEntrenador`
    FOREIGN KEY (`idEntrenador`)
    REFERENCES `mydb`.`Entrenador` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rutina_Sesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rutina_Sesion` (
  `idRutina` INT NOT NULL,
  `idSesion` INT NOT NULL,
  `diaDeSemana` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idRutina`, `idSesion`),
  INDEX `idSesion_idx` (`idSesion` ASC) VISIBLE,
  CONSTRAINT `fkRutina_Rutina_Sesion`
    FOREIGN KEY (`idRutina`)
    REFERENCES `mydb`.`Rutina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkSesion_Rutina_Sesion`
    FOREIGN KEY (`idSesion`)
    REFERENCES `mydb`.`Sesion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GrupoMuscular`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GrupoMuscular` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ejercicio_GrupoMuscular`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ejercicio_GrupoMuscular` (
  `idEjercicio` INT NOT NULL,
  `idGrupoMuscular` INT NOT NULL,
  PRIMARY KEY (`idEjercicio`, `idGrupoMuscular`),
  INDEX `idGrupoMuscular_idx` (`idGrupoMuscular` ASC) VISIBLE,
  CONSTRAINT `fkGrupoMuscular_Ejercicio_GrupoMuscular`
    FOREIGN KEY (`idGrupoMuscular`)
    REFERENCES `mydb`.`GrupoMuscular` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkEjercicio_Ejercicio_GrupoMuscular`
    FOREIGN KEY (`idEjercicio`)
    REFERENCES `mydb`.`Ejercicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sesion_Ejercicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sesion_Ejercicio` (
  `idSesion` INT NOT NULL,
  `idEjercicio` INT NOT NULL,
  `repeticiones` INT NULL,
  `duracion` INT NULL,
  `peso` SMALLINT(3) NULL,
  `completado` BIT(1) NOT NULL,
  `orden` INT NOT NULL,
  `velocidad` INT NULL,
  `distancia` INT NULL,
  PRIMARY KEY (`idSesion`, `idEjercicio`),
  INDEX `idEjercicio_idx` (`idEjercicio` ASC) VISIBLE,
  CONSTRAINT `fkSesion_Sesion_Ejercicio`
    FOREIGN KEY (`idSesion`)
    REFERENCES `mydb`.`Sesion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkEjercicio_Sesion_Ejercicio`
    FOREIGN KEY (`idEjercicio`)
    REFERENCES `mydb`.`Ejercicio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Rutina_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Rutina_Usuario` (
  `idRutina` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idRutina`, `idUsuario`),
  INDEX `idUsuario_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fkUsuario_Rutina_Usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkRutina_Rutina_Usuario`
    FOREIGN KEY (`idRutina`)
    REFERENCES `mydb`.`Rutina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario_Dieta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario_Dieta` (
  `idUsuario` INT NOT NULL,
  `idDieta` INT NOT NULL,
  PRIMARY KEY (`idUsuario`, `idDieta`),
  INDEX `fk_Usuario_has_Dieta_Dieta1_idx` (`idDieta` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Dieta_Usuario1_idx` (`idUsuario` ASC) VISIBLE,
  CONSTRAINT `fkUsuario_Dieta_Usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `mydb`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fkDieta_Dieta_Usuario`
    FOREIGN KEY (`idDieta`)
    REFERENCES `mydb`.`Dieta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- MySQL Script generated by MySQL Workbench
-- Wed Jul 19 19:41:59 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema if0_34674594_barbearia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema if0_34674594_barbearia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `if0_34674594_barbearia` DEFAULT CHARACTER SET utf8 ;
USE `if0_34674594_barbearia` ;

-- -----------------------------------------------------
-- Table `if0_34674594_barbearia`.`Endereço_Barbearia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `if0_34674594_barbearia`.`Endereço_Barbearia` (
  `idEndereço_Barbearia` INT NOT NULL AUTO_INCREMENT,
  `CEP` VARCHAR(45) NULL,
  `Rua` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  PRIMARY KEY (`idEndereço_Barbearia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `if0_34674594_barbearia`.`Barbearia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `if0_34674594_barbearia`.`Barbearia` (
  `idBarbearia` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(45) NULL,
  `CNPJ` VARCHAR(45) NULL,
  `Endereço_Barbearia_idEndereço_Barbearia` INT NOT NULL,
  PRIMARY KEY (`idBarbearia`, `Endereço_Barbearia_idEndereço_Barbearia`),
  INDEX `fk_Barbearia_Endereço_Barbearia_idx` (`Endereço_Barbearia_idEndereço_Barbearia` ASC) ,
  CONSTRAINT `fk_Barbearia_Endereço_Barbearia`
    FOREIGN KEY (`Endereço_Barbearia_idEndereço_Barbearia`)
    REFERENCES `if0_34674594_barbearia`.`Endereço_Barbearia` (`idEndereço_Barbearia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `if0_34674594_barbearia`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `if0_34674594_barbearia`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `if0_34674594_barbearia`.`Cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `if0_34674594_barbearia`.`Cargos` (
  `idCargos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `salario` VARCHAR(45) NULL,
  PRIMARY KEY (`idCargos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `if0_34674594_barbearia`.`Funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `if0_34674594_barbearia`.`Funcionarios` (
  `idFuncionarios` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `CPF` VARCHAR(45) NULL,
  `Cargos_idCargos` INT NOT NULL,
  PRIMARY KEY (`idFuncionarios`, `Cargos_idCargos`),
  INDEX `fk_Funcionarios_Cargos1_idx` (`Cargos_idCargos` ASC),
  CONSTRAINT `fk_Funcionarios_Cargos1`
    FOREIGN KEY (`Cargos_idCargos`)
    REFERENCES `if0_34674594_barbearia`.`Cargos` (`idCargos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `if0_34674594_barbearia`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `if0_34674594_barbearia`.`Estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `quantidade` VARCHAR(45) NULL,
  `Funcionarios_idFuncionarios` INT NOT NULL,
  PRIMARY KEY (`idEstoque`, `Funcionarios_idFuncionarios`),
  INDEX `fk_Estoque_Funcionarios1_idx` (`Funcionarios_idFuncionarios` ASC),
  CONSTRAINT `fk_Estoque_Funcionarios1`
    FOREIGN KEY (`Funcionarios_idFuncionarios`)
    REFERENCES `if0_34674594_barbearia`.`Funcionarios` (`idFuncionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `if0_34674594_barbearia`.`Email_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `if0_34674594_barbearia`.`Email_Cliente` (
  `idEmail_Cliente` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idEmail_Cliente`, `Cliente_idCliente`),
  INDEX `fk_Email_Cliente_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Email_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `if0_34674594_barbearia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `if0_34674594_barbearia`.`Telefone_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `if0_34674594_barbearia`.`Telefone_Cliente` (
  `idTelefone_Cliente` INT NOT NULL AUTO_INCREMENT,
  `n_Tel` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idTelefone_Cliente`, `Cliente_idCliente`),
  INDEX `fk_Telefone_Cliente_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Telefone_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `if0_34674594_barbearia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `if0_34674594_barbearia`.`Agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `if0_34674594_barbearia`.`Agendamento` (
  `idAgendamento` INT NOT NULL AUTO_INCREMENT,
  `data` VARCHAR(45) NULL,
  `hora` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Funcionarios_idFuncionarios` INT NOT NULL,
  `Barbearia_idBarbearia` INT NOT NULL,
  PRIMARY KEY (`idAgendamento`, `Cliente_idCliente`, `Funcionarios_idFuncionarios`, `Barbearia_idBarbearia`),
  INDEX `fk_Agendamento_Cliente1_idx` (`Cliente_idCliente` ASC) ,
  INDEX `fk_Agendamento_Funcionarios1_idx` (`Funcionarios_idFuncionarios` ASC) ,
  INDEX `fk_Agendamento_Barbearia1_idx` (`Barbearia_idBarbearia` ASC) ,
  CONSTRAINT `fk_Agendamento_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `if0_34674594_barbearia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agendamento_Funcionarios1`
    FOREIGN KEY (`Funcionarios_idFuncionarios`)
    REFERENCES `if0_34674594_barbearia`.`Funcionarios` (`idFuncionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Agendamento_Barbearia1`
    FOREIGN KEY (`Barbearia_idBarbearia`)
    REFERENCES `if0_34674594_barbearia`.`Barbearia` (`idBarbearia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `if0_34674594_barbearia`.`Telefone_Funcionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `if0_34674594_barbearia`.`Telefone_Funcionarios` (
  `idTelefone_Funcionarios` INT NOT NULL AUTO_INCREMENT,
  `n_Tel` VARCHAR(45) NULL,
  `Funcionarios_idFuncionarios` INT NOT NULL,
  PRIMARY KEY (`idTelefone_Funcionarios`, `Funcionarios_idFuncionarios`),
  INDEX `fk_Telefone_Funcionarios_Funcionarios1_idx` (`Funcionarios_idFuncionarios` ASC) ,
  CONSTRAINT `fk_Telefone_Funcionarios_Funcionarios1`
    FOREIGN KEY (`Funcionarios_idFuncionarios`)
    REFERENCES `if0_34674594_barbearia`.`Funcionarios` (`idFuncionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `if0_34674594_barbearia`.`Endereço_Funconarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `if0_34674594_barbearia`.`Endereço_Funconarios` (
  `idEndereço_Funconarios` INT NOT NULL AUTO_INCREMENT,
  `end_Funcionario` VARCHAR(45) NULL,
  `Funcionarios_idFuncionarios` INT NOT NULL,
  PRIMARY KEY (`idEndereço_Funconarios`, `Funcionarios_idFuncionarios`),
  INDEX `fk_Endereço_Funconarios_Funcionarios1_idx` (`Funcionarios_idFuncionarios` ASC) ,
  CONSTRAINT `fk_Endereço_Funconarios_Funcionarios1`
    FOREIGN KEY (`Funcionarios_idFuncionarios`)
    REFERENCES `if0_34674594_barbearia`.`Funcionarios` (`idFuncionarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `if0_34674594_barbearia`.`Email_Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `if0_34674594_barbearia`.`Email_Funcionario` (
  `idEmail_Funcionario` INT NOT NULL AUTO_INCREMENT,
  `email_Funcionario` VARCHAR(45) NULL,
  `Funcionarios_idFuncionarios` INT NOT NULL,
  `Funcionarios_Cargos_idCargos` INT NOT NULL,
  PRIMARY KEY (`idEmail_Funcionario`, `Funcionarios_idFuncionarios`, `Funcionarios_Cargos_idCargos`),
  INDEX `fk_Email_Funcionario_Funcionarios1_idx` (`Funcionarios_idFuncionarios` ASC, `Funcionarios_Cargos_idCargos` ASC) ,
  CONSTRAINT `fk_Email_Funcionario_Funcionarios1`
    FOREIGN KEY (`Funcionarios_idFuncionarios` , `Funcionarios_Cargos_idCargos`)
    REFERENCES `if0_34674594_barbearia`.`Funcionarios` (`idFuncionarios` , `Cargos_idCargos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

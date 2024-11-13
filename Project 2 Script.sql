-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cs_bag15552
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cs_bag15552
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cs_bag15552` DEFAULT CHARACTER SET utf8 ;
USE `cs_bag15552` ;

-- -----------------------------------------------------
-- Table `cs_bag15552`.`Family_Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Family_Account` (
  `idFamily_Account` INT NOT NULL,
  `Family_Name` VARCHAR(45) NULL,
  PRIMARY KEY (`idFamily_Account`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`User` (
  `idUser` INT NOT NULL,
  `Family_Account_idFamily_Account` INT NOT NULL,
  `First_Name` VARCHAR(45) NULL,
  `Last_Name` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`),
  INDEX `fk_User_Family_Account1_idx` (`Family_Account_idFamily_Account` ASC) VISIBLE,
  CONSTRAINT `fk_User_Family_Account1`
    FOREIGN KEY (`Family_Account_idFamily_Account`)
    REFERENCES `cs_bag15552`.`Family_Account` (`idFamily_Account`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Subscription_Plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Subscription_Plan` (
  `idSubscription_Plan` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  `Price` INT NULL,
  `Resolution` VARCHAR(45) NULL,
  PRIMARY KEY (`idSubscription_Plan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Subscription_Plan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Subscription_Plan` (
  `idSubscription_Plan` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  `Price` INT NULL,
  `Resolution` VARCHAR(45) NULL,
  PRIMARY KEY (`idSubscription_Plan`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Payment` (
  `User_idUser` INT NOT NULL,
  `Subscription_Plan_idSubscription_Plan` INT NOT NULL,
  `Date` DATE NULL,
  `Payment_Type` VARCHAR(45) NULL,
  PRIMARY KEY (`User_idUser`, `Subscription_Plan_idSubscription_Plan`),
  INDEX `fk_User_has_Subscription_Plan_Subscription_Plan1_idx` (`Subscription_Plan_idSubscription_Plan` ASC) VISIBLE,
  INDEX `fk_User_has_Subscription_Plan_User_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Subscription_Plan_User`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `cs_bag15552`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Subscription_Plan_Subscription_Plan1`
    FOREIGN KEY (`Subscription_Plan_idSubscription_Plan`)
    REFERENCES `cs_bag15552`.`Subscription_Plan` (`idSubscription_Plan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Genre` (
  `idGenre` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(150) NULL,
  PRIMARY KEY (`idGenre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Movie` (
  `idMovie` INT NOT NULL,
  `Genre_idGenre` INT NOT NULL,
  `Title` VARCHAR(45) NULL,
  `Release_year` YEAR(4) NULL,
  `Duration` TIME NULL,
  `Age_rating` VARCHAR(45) NULL,
  `Language` VARCHAR(45) NULL,
  PRIMARY KEY (`idMovie`),
  INDEX `fk_Movie_Genre1_idx` (`Genre_idGenre` ASC) VISIBLE,
  CONSTRAINT `fk_Movie_Genre1`
    FOREIGN KEY (`Genre_idGenre`)
    REFERENCES `cs_bag15552`.`Genre` (`idGenre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Watch_History`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Watch_History` (
  `User_idUser` INT NOT NULL,
  `Movie_idMovie` INT NOT NULL,
  `Date_watched` DATE NULL,
  PRIMARY KEY (`User_idUser`, `Movie_idMovie`),
  INDEX `fk_User_has_Movie_Movie1_idx` (`Movie_idMovie` ASC) VISIBLE,
  INDEX `fk_User_has_Movie_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Movie_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `cs_bag15552`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Movie_Movie1`
    FOREIGN KEY (`Movie_idMovie`)
    REFERENCES `cs_bag15552`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Reviews` (
  `User_idUser` INT NOT NULL,
  `Movie_idMovie` INT NOT NULL,
  `Score` INT NULL,
  `Comments` VARCHAR(100) NULL,
  PRIMARY KEY (`User_idUser`, `Movie_idMovie`),
  INDEX `fk_User_has_Movie_Movie2_idx` (`Movie_idMovie` ASC) VISIBLE,
  INDEX `fk_User_has_Movie_User2_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Movie_User2`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `cs_bag15552`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Movie_Movie2`
    FOREIGN KEY (`Movie_idMovie`)
    REFERENCES `cs_bag15552`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Device` (
  `idDevice` INT NOT NULL,
  `User_idUser` INT NOT NULL,
  `Type` VARCHAR(45) NULL,
  `Last_access_date` DATE NULL,
  `OS` VARCHAR(45) NULL,
  PRIMARY KEY (`idDevice`),
  INDEX `fk_Device_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_Device_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `cs_bag15552`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`User_Preferences`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`User_Preferences` (
  `User_idUser` INT NOT NULL,
  `Genre_idGenre` INT NOT NULL,
  PRIMARY KEY (`User_idUser`, `Genre_idGenre`),
  INDEX `fk_User_has_Genre_Genre1_idx` (`Genre_idGenre` ASC) VISIBLE,
  INDEX `fk_User_has_Genre_User1_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Genre_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `cs_bag15552`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Genre_Genre1`
    FOREIGN KEY (`Genre_idGenre`)
    REFERENCES `cs_bag15552`.`Genre` (`idGenre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cs_bag15552`.`Watch_List`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs_bag15552`.`Watch_List` (
  `User_idUser` INT NOT NULL,
  `Movie_idMovie` INT NOT NULL,
  PRIMARY KEY (`User_idUser`, `Movie_idMovie`),
  INDEX `fk_User_has_Movie_Movie3_idx` (`Movie_idMovie` ASC) VISIBLE,
  INDEX `fk_User_has_Movie_User3_idx` (`User_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_User_has_Movie_User3`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `cs_bag15552`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Movie_Movie3`
    FOREIGN KEY (`Movie_idMovie`)
    REFERENCES `cs_bag15552`.`Movie` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

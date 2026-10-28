-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema drone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema drone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `drone` DEFAULT CHARACTER SET utf8 ;
USE `drone` ;

-- -----------------------------------------------------
-- Table `drone`.`drone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drone`.`drone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `additional_info` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drone`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drone`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drone`.`usage_event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drone`.`usage_event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_time` DATE NULL,
  `end_time` DATE NULL,
  `user_id` INT NOT NULL,
  `drone_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usage_event_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_usage_event_drone1_idx` (`drone_id` ASC) VISIBLE,
  CONSTRAINT `fk_usage_event_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `drone`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usage_event_drone1`
    FOREIGN KEY (`drone_id`)
    REFERENCES `drone`.`drone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drone`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `drone`.`images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `latitude` DECIMAL(8,6) NOT NULL,
  `longitude` DECIMAL(9,6) NOT NULL,
  `altitude` DECIMAL(8,2) NOT NULL,
  `timestamp` TIMESTAMP NOT NULL,
  `usage_event_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `drone_id` INT NOT NULL,
  `analysis_description` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_images_usage_event1_idx` (`usage_event_id` ASC) VISIBLE,
  INDEX `fk_images_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_images_drone1_idx` (`drone_id` ASC) VISIBLE,
  CONSTRAINT `fk_images_usage_event1`
    FOREIGN KEY (`usage_event_id`)
    REFERENCES `drone`.`usage_event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_images_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `drone`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_images_drone1`
    FOREIGN KEY (`drone_id`)
    REFERENCES `drone`.`drone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

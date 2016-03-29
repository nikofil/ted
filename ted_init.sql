SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `teddb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `teddb` ;

-- -----------------------------------------------------
-- Table `teddb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teddb`.`user` ;

CREATE TABLE IF NOT EXISTS `teddb`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NULL,
  `password` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL DEFAULT '',
  `surname` VARCHAR(45) NULL DEFAULT '',
  `email` VARCHAR(60) NULL DEFAULT '',
  `phone` VARCHAR(45) NULL DEFAULT '',
  `afm` VARCHAR(45) NULL DEFAULT '',
  `location` VARCHAR(150) NULL DEFAULT '',
  `lat` FLOAT NULL,
  `lon` FLOAT NULL,
  `country` VARCHAR(45) NULL DEFAULT '',
  `buyer_rating` INT NULL DEFAULT 0,
  `seller_rating` INT NULL DEFAULT 0,
  `is_admin` TINYINT(1) NULL DEFAULT false,
  `is_validated` TINYINT(1) NULL DEFAULT true,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teddb`.`item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teddb`.`item` ;

CREATE TABLE IF NOT EXISTS `teddb`.`item` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `name` VARCHAR(150) NULL,
  `description` TEXT NULL,
  `buy_price` INT NULL,
  `current_bid` INT NULL,
  `first_bid` INT NULL,
  `location` VARCHAR(150) NULL,
  `lat` FLOAT NULL,
  `lon` FLOAT NULL,
  `country` VARCHAR(45) NULL,
  `start` DATETIME NULL,
  `end` DATETIME NULL,
  PRIMARY KEY (`item_id`),
  INDEX `user_idx` (`user_id` ASC),
  CONSTRAINT `fk_item__user`
    FOREIGN KEY (`user_id`)
    REFERENCES `teddb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teddb`.`bid`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teddb`.`bid` ;

CREATE TABLE IF NOT EXISTS `teddb`.`bid` (
  `bid_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `item_id` INT NULL,
  `time` DATETIME NULL,
  `amount` INT NULL,
  PRIMARY KEY (`bid_id`),
  INDEX `user_idx` (`user_id` ASC),
  INDEX `item_idx` (`item_id` ASC),
  CONSTRAINT `fk_bid__user`
    FOREIGN KEY (`user_id`)
    REFERENCES `teddb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bid__item`
    FOREIGN KEY (`item_id`)
    REFERENCES `teddb`.`item` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teddb`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teddb`.`category` ;

CREATE TABLE IF NOT EXISTS `teddb`.`category` (
  `cat_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  PRIMARY KEY (`cat_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teddb`.`item_in_cat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teddb`.`item_in_cat` ;

CREATE TABLE IF NOT EXISTS `teddb`.`item_in_cat` (
  `cat_id` INT NULL,
  `item_id` INT NULL,
  INDEX `cat_idx` (`cat_id` ASC),
  INDEX `item_idx` (`item_id` ASC),
  CONSTRAINT `fk_item_in_cat__cat`
    FOREIGN KEY (`cat_id`)
    REFERENCES `teddb`.`category` (`cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_in_cat__item`
    FOREIGN KEY (`item_id`)
    REFERENCES `teddb`.`item` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teddb`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teddb`.`message` ;

CREATE TABLE IF NOT EXISTS `teddb`.`message` (
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `from` INT NULL,
  `to` INT NULL,
  `message` TEXT NULL,
  PRIMARY KEY (`message_id`),
  INDEX `from_idx` (`from` ASC),
  CONSTRAINT `fk_message_from__use`
    FOREIGN KEY (`from`)
    REFERENCES `teddb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_to__user`
    FOREIGN KEY (`from`)
    REFERENCES `teddb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teddb`.`item_pictures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teddb`.`item_pictures` ;

CREATE TABLE IF NOT EXISTS `teddb`.`item_pictures` (
  `item_id` INT NOT NULL,
  `image_filename` VARCHAR(45) NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

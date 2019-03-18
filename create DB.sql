-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema projectfinal
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projectfinal
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projectfinal` DEFAULT CHARACTER SET utf8 ;
USE `projectfinal` ;

-- -----------------------------------------------------
-- Table `projectfinal`.`boardgame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`boardgame` (
  `id_board_game` INT(11) NOT NULL,
  `age` VARCHAR(255) NULL DEFAULT NULL,
  `game_detail` VARCHAR(255) NULL DEFAULT NULL,
  `name_board_game` VARCHAR(255) NULL DEFAULT NULL,
  `picture_board_game` TINYBLOB NULL DEFAULT NULL,
  `qty_people_board_game` VARCHAR(255) NULL DEFAULT NULL,
  `status_board_game` VARCHAR(255) NULL DEFAULT NULL,
  `type_game` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_board_game`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`cafe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`cafe` (
  `name_cafe` VARCHAR(255) NOT NULL,
  `about` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `contact` VARCHAR(255) NULL DEFAULT NULL,
  `map` VARCHAR(255) NULL DEFAULT NULL,
  `picture` TINYBLOB NULL DEFAULT NULL,
  `price_of_hr` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`name_cafe`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`event` (
  `id_event` INT(11) NOT NULL,
  `date_start` DATETIME NULL DEFAULT NULL,
  `detail` VARCHAR(255) NULL DEFAULT NULL,
  `name_event` VARCHAR(255) NULL DEFAULT NULL,
  `price` DOUBLE NULL DEFAULT NULL,
  `qty_people_event` INT(11) NULL DEFAULT NULL,
  `time_end` DATETIME NULL DEFAULT NULL,
  `time_start` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_event`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`owner` (
  `email` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `phone` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`email`))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`member` (
  `status` VARCHAR(255) NULL DEFAULT NULL,
  `owner_email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`owner_email`),
  INDEX `fk_member_owner_idx` (`owner_email` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`reserveevent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`reserveevent` (
  `reserve_date` DATE NULL DEFAULT NULL,
  `member_email` VARCHAR(255) NOT NULL,
  `event_id` INT(11) NOT NULL,
  PRIMARY KEY (`member_email`, `event_id`),
  INDEX `FKmnqy1w0kmw0ebsb14hj86keop` (`event_id` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`reservetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`reservetable` (
  `time_reserve` DATETIME NOT NULL,
  `amount_reserve` INT(11) NULL DEFAULT NULL,
  `date_reserve` DATETIME NULL DEFAULT NULL,
  `member_email` VARCHAR(255) NOT NULL,
  `boardgame_id` INT(11) NULL DEFAULT NULL,
  `tablecafe_idtable` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`time_reserve`, `member_email`),
  INDEX `FKku5ve5gvxnowq6bmtvxltwjd0` (`member_email` ASC),
  INDEX `FKf5nno52lwwtccoaonlnve6jb7` (`boardgame_id` ASC),
  INDEX `FKio4x8nq79vb3t753absb941f6` (`tablecafe_idtable` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`tablecafe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`tablecafe` (
  `idtable` INT(11) NOT NULL,
  `chair` INT(11) NULL DEFAULT NULL,
  `status_table` VARCHAR(255) NULL DEFAULT NULL,
  `cafe_namecafe` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idtable`),
  INDEX `FK6huk69anh96t96c6hbf2qw00f` (`cafe_namecafe` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

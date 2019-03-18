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
-- Table `projectfinal`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`member` (
  `email` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`owner` (
  `status` INT(11) NULL DEFAULT NULL,
  `member_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`member_email`),
  INDEX `fk_owner_member1_idx` (`member_email` ASC),
  CONSTRAINT `fk_owner_member1`
    FOREIGN KEY (`member_email`)
    REFERENCES `projectfinal`.`member` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`cafe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`cafe` (
  `namecafe` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `map` VARCHAR(45) NULL DEFAULT NULL,
  `about` VARCHAR(45) NULL DEFAULT NULL,
  `owner_member_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`namecafe`),
  INDEX `fk_cafe_owner1_idx` (`owner_member_email` ASC),
  CONSTRAINT `fk_cafe_owner1`
    FOREIGN KEY (`owner_member_email`)
    REFERENCES `projectfinal`.`owner` (`member_email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`boardgame`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`boardgame` (
  `id` INT(11) NOT NULL,
  `nameBoardGame` VARCHAR(45) NULL DEFAULT NULL,
  `qtypeopleBoardGame` INT(11) NULL DEFAULT NULL,
  `age` INT(11) NULL DEFAULT NULL,
  `gamedetail` VARCHAR(45) NULL DEFAULT NULL,
  `photos` VARCHAR(45) NULL DEFAULT NULL,
  `typegame` VARCHAR(45) NULL DEFAULT NULL,
  `statusboardgame` INT(11) NULL DEFAULT NULL,
  `cafe_namecafe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_boardgame_cafe1_idx` (`cafe_namecafe` ASC),
  CONSTRAINT `fk_boardgame_cafe1`
    FOREIGN KEY (`cafe_namecafe`)
    REFERENCES `projectfinal`.`cafe` (`namecafe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`event` (
  `id` INT(11) NOT NULL,
  `nameEventl` VARCHAR(45) NULL DEFAULT NULL,
  `dateStart` DATE NULL DEFAULT NULL,
  `timeSart` TIME NULL DEFAULT NULL,
  `timeend` TIME NULL DEFAULT NULL,
  `detailBoardGame` VARCHAR(45) NULL DEFAULT NULL,
  `price` DOUBLE NULL DEFAULT NULL,
  `qtypeopleEvent` INT(11) NULL DEFAULT NULL,
  `cafe_namecafe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_cafe1_idx` (`cafe_namecafe` ASC),
  CONSTRAINT `fk_event_cafe1`
    FOREIGN KEY (`cafe_namecafe`)
    REFERENCES `projectfinal`.`cafe` (`namecafe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`reserveevent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`reserveevent` (
  `ReserveDate` DATE NOT NULL,
  `member_email` VARCHAR(45) NOT NULL,
  `event_id` INT(11) NOT NULL,
  PRIMARY KEY (`member_email`, `event_id`),
  INDEX `fk_reserveevent_member1_idx` (`member_email` ASC),
  INDEX `fk_reserveevent_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_reserveevent_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `projectfinal`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserveevent_member1`
    FOREIGN KEY (`member_email`)
    REFERENCES `projectfinal`.`member` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`tablecafe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`tablecafe` (
  `idtable` INT(11) NOT NULL,
  `chair` INT(11) NULL DEFAULT NULL,
  `status_table` VARCHAR(255) NULL DEFAULT NULL,
  `cafe_namecafe` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtable`),
  INDEX `fk_tablecafe_cafe1_idx` (`cafe_namecafe` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `projectfinal`.`reservetable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projectfinal`.`reservetable` (
  `time_reserve` TIME NOT NULL,
  `amount_reserve` INT(11) NULL DEFAULT NULL,
  `date_reserve` DATE NULL DEFAULT NULL,
  `boardgame_id` INT(11) NOT NULL,
  `tablecafe_idtable` INT(11) NOT NULL,
  `member_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`time_reserve`, `member_email`),
  INDEX `fk_reservetable_boardgame1_idx` (`boardgame_id` ASC),
  INDEX `fk_reservetable_tablecafe1_idx` (`tablecafe_idtable` ASC),
  INDEX `fk_reservetable_member1_idx` (`member_email` ASC))
ENGINE = MyISAM
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema focuseddb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `focuseddb` ;

-- -----------------------------------------------------
-- Schema focuseddb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `focuseddb` DEFAULT CHARACTER SET utf8 ;
USE `focuseddb` ;

-- -----------------------------------------------------
-- Table `focuseddb`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `focuseddb`.`company` ;

CREATE TABLE IF NOT EXISTS `focuseddb`.`company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(500) NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focuseddb`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `focuseddb`.`product` ;

CREATE TABLE IF NOT EXISTS `focuseddb`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  `photo_url` VARCHAR(500) NULL,
  `description` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_company_company_id_idx` (`company_id` ASC),
  CONSTRAINT `fk_product_company_company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `focuseddb`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focuseddb`.`feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `focuseddb`.`feature` ;

CREATE TABLE IF NOT EXISTS `focuseddb`.`feature` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NULL,
  `details` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_feature_product_product_id_idx` (`product_id` ASC),
  CONSTRAINT `fk_feature_product_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `focuseddb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focuseddb`.`reviewer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `focuseddb`.`reviewer` ;

CREATE TABLE IF NOT EXISTS `focuseddb`.`reviewer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gender` VARCHAR(45) NULL,
  `age` INT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focuseddb`.`feature_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `focuseddb`.`feature_review` ;

CREATE TABLE IF NOT EXISTS `focuseddb`.`feature_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `feature_id` INT NOT NULL,
  `rating` INT(10) NULL,
  `comment` VARCHAR(500) NULL,
  INDEX `fk_feature_review_feature_feature_id_idx` (`feature_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_feature_review_feature_feature_id`
    FOREIGN KEY (`feature_id`)
    REFERENCES `focuseddb`.`feature` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_feature_review_reviewer_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `focuseddb`.`reviewer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focuseddb`.`focus_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `focuseddb`.`focus_details` ;

CREATE TABLE IF NOT EXISTS `focuseddb`.`focus_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `reviewer_count` INT NULL,
  `details` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_focus_details_product_product_id_idx` (`product_id` ASC),
  CONSTRAINT `fk_focus_details_product_product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `focuseddb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO application;
 DROP USER application;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'application' IDENTIFIED BY 'application';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `focuseddb`.* TO 'application';

-- -----------------------------------------------------
-- Data for table `focuseddb`.`company`
-- -----------------------------------------------------
START TRANSACTION;
USE `focuseddb`;
INSERT INTO `focuseddb`.`company` (`id`, `name`, `description`, `username`, `password`) VALUES (1, 'CSS Hub', 'front end devs', 'csshub', 'csshub');
INSERT INTO `focuseddb`.`company` (`id`, `name`, `description`, `username`, `password`) VALUES (2, 'Acme', 'makes stuff', 'acme', 'acme');

COMMIT;


-- -----------------------------------------------------
-- Data for table `focuseddb`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `focuseddb`;
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (1, 2, 'water bottle', 2, 'waterbottle.jpg', 'holds water');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (2, 1, 'computer mouse', 15, 'mouse.jpg', 'moves cursor');

COMMIT;


-- -----------------------------------------------------
-- Data for table `focuseddb`.`feature`
-- -----------------------------------------------------
START TRANSACTION;
USE `focuseddb`;
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (1, 1, 'plastic container');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (2, 1, 'screw-on cap');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (3, 2, 'scroll wheel');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (4, 2, 'LASER');

COMMIT;


-- -----------------------------------------------------
-- Data for table `focuseddb`.`reviewer`
-- -----------------------------------------------------
START TRANSACTION;
USE `focuseddb`;
INSERT INTO `focuseddb`.`reviewer` (`id`, `gender`, `age`, `username`, `password`) VALUES (1, 'M', 24, 'user1', 'user1');
INSERT INTO `focuseddb`.`reviewer` (`id`, `gender`, `age`, `username`, `password`) VALUES (2, 'M', 30, 'user2', 'user2');
INSERT INTO `focuseddb`.`reviewer` (`id`, `gender`, `age`, `username`, `password`) VALUES (3, 'F', 21, 'user3', 'user3');

COMMIT;


-- -----------------------------------------------------
-- Data for table `focuseddb`.`feature_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `focuseddb`;
INSERT INTO `focuseddb`.`feature_review` (`id`, `user_id`, `feature_id`, `rating`, `comment`) VALUES (DEFAULT, 1, 1, 5, 'Awesome');
INSERT INTO `focuseddb`.`feature_review` (`id`, `user_id`, `feature_id`, `rating`, `comment`) VALUES (DEFAULT, 1, 2, 3, 'Sick');
INSERT INTO `focuseddb`.`feature_review` (`id`, `user_id`, `feature_id`, `rating`, `comment`) VALUES (DEFAULT, 2, 3, 1, 'Terrible');
INSERT INTO `focuseddb`.`feature_review` (`id`, `user_id`, `feature_id`, `rating`, `comment`) VALUES (DEFAULT, 2, 4, 3, 'OK');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

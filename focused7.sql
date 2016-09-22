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
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `description` VARCHAR(500) NULL,
  `photo_url` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focuseddb`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `focuseddb`.`product` ;

CREATE TABLE IF NOT EXISTS `focuseddb`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company_id` INT NULL,
  `name` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  `photo_url` VARCHAR(500) NULL,
  `description` VARCHAR(500) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_company_company_id_idx` (`company_id` ASC),
  CONSTRAINT `fk_product_company_company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `focuseddb`.`company` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
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
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focuseddb`.`reviewer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `focuseddb`.`reviewer` ;

CREATE TABLE IF NOT EXISTS `focuseddb`.`reviewer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NULL,
  `age` INT NULL,
  `gender` VARCHAR(45) NULL,
  `photo_url` VARCHAR(500) NULL,
  `points` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focuseddb`.`feature_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `focuseddb`.`feature_review` ;

CREATE TABLE IF NOT EXISTS `focuseddb`.`feature_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NULL,
  `feature_id` INT NOT NULL,
  `rating` INT(10) NULL,
  `comment` VARCHAR(500) NULL,
  INDEX `fk_feature_review_feature_feature_id_idx` (`feature_id` ASC),
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_feature_review_feature_feature_id`
    FOREIGN KEY (`feature_id`)
    REFERENCES `focuseddb`.`feature` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_feature_review_reviewer_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `focuseddb`.`reviewer` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
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
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focuseddb`.`reward`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `focuseddb`.`reward` ;

CREATE TABLE IF NOT EXISTS `focuseddb`.`reward` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `cost` VARCHAR(45) NULL,
  `photo_url` VARCHAR(500) NULL,
  `description` VARCHAR(500) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `focuseddb`.`reviewer_reward`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `focuseddb`.`reviewer_reward` ;

CREATE TABLE IF NOT EXISTS `focuseddb`.`reviewer_reward` (
  `id` INT NOT NULL,
  `reviewer_id` INT NULL,
  `reward_id` INT NULL,
  `date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reviewer_reviewer_reward_reviewer_id_idx` (`reviewer_id` ASC),
  INDEX `fk_reviewer_reward_reward_reward_id_idx` (`reward_id` ASC),
  CONSTRAINT `fk_reviewer_reviewer_reward_reviewer_id`
    FOREIGN KEY (`reviewer_id`)
    REFERENCES `focuseddb`.`reviewer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviewer_reward_reward_reward_id`
    FOREIGN KEY (`reward_id`)
    REFERENCES `focuseddb`.`reward` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO application;
 DROP USER application;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'application' IDENTIFIED BY 'application';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `focuseddb`.* TO 'application';
SET SQL_MODE = '';
GRANT USAGE ON *.* TO application@localhost;
 DROP USER application@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'application'@'localhost' IDENTIFIED BY 'application';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `focuseddb`.* TO 'application'@'localhost';

-- -----------------------------------------------------
-- Data for table `focuseddb`.`company`
-- -----------------------------------------------------
START TRANSACTION;
USE `focuseddb`;
INSERT INTO `focuseddb`.`company` (`id`, `name`, `username`, `password`, `description`, `photo_url`) VALUES (1, 'IT Solution', 'company1', 'company1', 'One-stop shop for your IT testing needs', 'https://www.bankinghub.eu/wp-content/uploads/sites/2/2015/04/solution-770x433.jpg');
INSERT INTO `focuseddb`.`company` (`id`, `name`, `username`, `password`, `description`, `photo_url`) VALUES (2, 'Curious Cutlery', 'company2', 'company2', 'Cuts and cleaves for your curious needs.', 'http://www.superfecta.com/AestheticPerfection/media/AP_Knife_Logo.png');
INSERT INTO `focuseddb`.`company` (`id`, `name`, `username`, `password`, `description`, `photo_url`) VALUES (3, 'Pro Fitness', 'company3', 'company3', 'Sport\'s apparel and accessory company. ', 'https://s-media-cache-ak0.pinimg.com/736x/58/5d/ab/585dab9e7499b78a3dfc32360cbb2e5b.jpg');
INSERT INTO `focuseddb`.`company` (`id`, `name`, `username`, `password`, `description`, `photo_url`) VALUES (4, 'High Fash Clash', 'company4', 'company4', 'Innovative fashion start-up specializing in medieval inspired garb.', 'http://webneel.com/sites/default/files/images/manual/logo-fashion/fashion-logo%20(15).gif');
INSERT INTO `focuseddb`.`company` (`id`, `name`, `username`, `password`, `description`, `photo_url`) VALUES (5, 'Red Stapler Co.', 'company5', 'company5', 'Keeps things together.', 'https://images-na.ssl-images-amazon.com/images/I/6138S3GOtCL._SL1500_.jpg');
INSERT INTO `focuseddb`.`company` (`id`, `name`, `username`, `password`, `description`, `photo_url`) VALUES (6, 'Test Company', 'test', 'test', 'For all web-app testing needs.', 'http://www.velior.ru/wp-content/uploads/2009/05/Test-Computer-Key-by-Stuart-Miles.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `focuseddb`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `focuseddb`;
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (1, 1, 'Computer Tune-Up', 80.99, 'http://www.boyntonbeachlaptoprepair.com/images/pc_tune.jpg', 'Get your computer running like new.');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (2, 1, 'Test Proctoring', 25, 'http://www.gocollege.com/images/taking-act.jpg', 'Convienent third-party IT certification testing.');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (3, 2, 'Shady Shank', 30, 'http://hellinahandbasket.net/wp-content/uploads/2015/01/prison-shank-2.jpg', 'Hand-made by real people and their real hands.');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (4, 2, 'Vegetable Shiv', 14.99, 'http://ecx.images-amazon.com/images/I/61Pv0jRKKxL._SL1500_.jpg', 'Teach vegetables a lesson in respect.');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (5, 3, 'Muscle Milk-Juice', 109.99, 'http://fitnessclipsdaily.com/wp-content/uploads/2015/08/91IrAaeahNL._SL1500_.jpg', 'Why choose between muscle milk and muscle juice when you can have both of them, together, in a bucket.');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (6, 3, '3 Minute Abs', 19.99, 'https://pbs.twimg.com/media/CUx8ttjWwAAobx3.jpg', 'You\'ve seen 7, 6, 5, and 4 minute ab workout DVDs.  Now check out 3 Minute Abs!');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (7, 4, 'Taste the Rainbow', 299.99, 'http://ep.yimg.com/ca/I/uglydress_2249_31814674', 'This stunning new design embraces the human eye and tears at your emotions.');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (8, 4, 'Evening Magic', 499.99, 'https://s-media-cache-ak0.pinimg.com/564x/91/29/53/91295308392b8cc698fa4285f920c883.jpg', 'You\'re really going to love the sleeves on this one.');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (9, 5, 'Cherry Red Stapler', 39.99, 'http://www.thinkgeek.com/images/products/zoom/61b7_swingline_stapler.jpg', 'Nobody ever loses a red stapler.');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (10, 5, 'Classic Red Stapler 3pk', 129.99, 'http://www.ranthollywood.com/wp-content/uploads/2015/05/Red-Swinglines.jpg', 'This three pack of the classic red Swingline means more red staplers for you.');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (11, 6, 'Test Product 1', 50, 'https://cdn2.hubspot.net/hub/42284/file-14233687-jpg/images/test_in_red.jpg', 'Test Description 1');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (12, 6, 'Test Product 2', 25, 'https://cdn2.hubspot.net/hub/42284/file-14233687-jpg/images/test_in_red.jpg', 'Test Description 2');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (13, 6, 'Test Product 3', 10, 'https://cdn2.hubspot.net/hub/42284/file-14233687-jpg/images/test_in_red.jpg', 'Test Description 3');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (14, 6, 'Test Product 4', 75, 'https://cdn2.hubspot.net/hub/42284/file-14233687-jpg/images/test_in_red.jpg', 'Test Description 4');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (15, 6, 'Test Product 5', 50, 'https://cdn2.hubspot.net/hub/42284/file-14233687-jpg/images/test_in_red.jpg', 'Test Description 5');
INSERT INTO `focuseddb`.`product` (`id`, `company_id`, `name`, `price`, `photo_url`, `description`) VALUES (16, 6, 'Test Product 6', 25, 'https://cdn2.hubspot.net/hub/42284/file-14233687-jpg/images/test_in_red.jpg', 'Test Description 6');

COMMIT;


-- -----------------------------------------------------
-- Data for table `focuseddb`.`feature`
-- -----------------------------------------------------
START TRANSACTION;
USE `focuseddb`;
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (1, 1, 'SSD Defragmentation');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (2, 1, 'Malware Scanning');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (3, 2, 'Preparation for Test Preparation');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (4, 2, 'Proper Pencil Holding');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (5, 3, 'Laser-edged Sharpening');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (6, 3, 'Machine-coated Carbon Steel');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (7, 3, 'Clean-grip Handle');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (8, 4, 'Diamond-edged Blade');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (9, 4, 'Machine-hardened Coating');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (10, 4, 'Stay-sharp Blade Angle');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (11, 5, 'Delicious Kale-Celery Blend');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (12, 5, 'Revolutionary 24-hour Stirring');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (13, 5, 'Milk-Juice Synthetic Compound');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (14, 6, '180 Degree, 180 Second Workout Regimine');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (15, 6, 'Core-building, Shred-hard Technology');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (16, 7, 'Pure Elastic Undergarment Construction');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (17, 7, 'ShineBrite Dye Process');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (18, 8, 'Long-lasting Puffy Sleeves');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (19, 8, 'SleeveStarch Design');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (20, 8, 'SleeveStay Construction');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (21, 9, '100-page Staple Capacity');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (22, 9, 'StayBrite Red Finish');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (23, 9, 'Official MiltonCo Design');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (24, 10, 'Three Red Staplers');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (25, 10, 'That\'s two more than one');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (26, 11, 'Test Feature 1');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (27, 11, 'Test Feature 2');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (28, 11, 'Test Feature 3');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (29, 11, 'Test Feature 4');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (30, 11, 'Test Feature 5');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (31, 12, 'Test Feature 1');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (32, 12, 'Test Feature 2');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (33, 12, 'Test Feature 3');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (34, 13, 'Test Feature 1');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (35, 13, 'Test Feature 2');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (36, 14, 'Test Feature 1');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (37, 14, 'Test Feature 2');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (38, 15, 'Test Feature 1');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (39, 15, 'Test Feature 2');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (40, 15, 'Test Feature 3');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (41, 16, 'Test Feature 1');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (42, 16, 'Test Feature 2');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (43, 16, 'Test Feature 3');
INSERT INTO `focuseddb`.`feature` (`id`, `product_id`, `details`) VALUES (DEFAULT, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `focuseddb`.`reviewer`
-- -----------------------------------------------------
START TRANSACTION;
USE `focuseddb`;
INSERT INTO `focuseddb`.`reviewer` (`id`, `username`, `password`, `age`, `gender`, `photo_url`, `points`) VALUES (1, 'user1', 'user1', 51, 'M', 'http://www.thewrap.com/wp-content/uploads/2013/10/Walter-White-funeral.jpg', 100);
INSERT INTO `focuseddb`.`reviewer` (`id`, `username`, `password`, `age`, `gender`, `photo_url`, `points`) VALUES (2, 'user2', 'user2', 30, 'M', 'http://skilldistillery.com/wp-content/uploads/2016/01/IMG_4471-500x310.jpg', 120);
INSERT INTO `focuseddb`.`reviewer` (`id`, `username`, `password`, `age`, `gender`, `photo_url`, `points`) VALUES (3, 'user3', 'user3', 21, 'F', 'http://www.billboard.com/files/styles/article_main_image/public/media/lady-gaga-golden-globes-bw-2016-billboard-650.jpg', 0);
INSERT INTO `focuseddb`.`reviewer` (`id`, `username`, `password`, `age`, `gender`, `photo_url`, `points`) VALUES (4, 'user4', 'user4', 45, 'M', 'http://a.abcnews.com/images/International/GTY_el_chapo_guzman_jt_150712_4x3_992.jpg', 200);
INSERT INTO `focuseddb`.`reviewer` (`id`, `username`, `password`, `age`, `gender`, `photo_url`, `points`) VALUES (5, 'user5', 'user5', 30, 'F', 'http://img.wennermedia.com/article-leads-vertical-300/1251312975_kim_kardashian_290x402.jpg', 110);

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


-- -----------------------------------------------------
-- Data for table `focuseddb`.`reward`
-- -----------------------------------------------------
START TRANSACTION;
USE `focuseddb`;
INSERT INTO `focuseddb`.`reward` (`id`, `name`, `cost`, `photo_url`, `description`) VALUES (1, '$5 Amazon Giftcard', '100', 'http://3.bp.blogspot.com/-kE3BAwYHsLI/VF8_9g190yI/AAAAAAAACzk/cg5prAMIHoQ/s1600/amazon-5-card.png', 'Mediocrity realized.');
INSERT INTO `focuseddb`.`reward` (`id`, `name`, `cost`, `photo_url`, `description`) VALUES (2, 'Pinata', '500', 'https://ui3.assets-asda.com/g/v5/172/759/5054070172759_280_IDShot_3.jpeg', 'Beat with a stick. Enjoy.');
INSERT INTO `focuseddb`.`reward` (`id`, `name`, `cost`, `photo_url`, `description`) VALUES (3, 'Fancy wagon', '800', 'http://cdn.grid.fotosearch.com/CSP/CSP215/k2155880.jpg', 'New handle, remodeled spokes.');
INSERT INTO `focuseddb`.`reward` (`id`, `name`, `cost`, `photo_url`, `description`) VALUES (4, 'Unicycle', '1000', 'http://www.bikes2udirect.com/bikes_html/images/items/B3832.jpg', 'Why have two when you only need one.');
INSERT INTO `focuseddb`.`reward` (`id`, `name`, `cost`, `photo_url`, `description`) VALUES (5, 'Live horse', '10000', 'http://67.media.tumblr.com/tumblr_mcq32qhjbj1qcdhbuo1_500.jpg', 'One living horse. Shipping not included.');

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

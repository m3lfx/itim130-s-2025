-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema  db_sales_s_2025
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema  db_sales_s_2025
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_sales_s_2025` DEFAULT CHARACTER SET utf8 ;
USE `db_sales_s_2025` ;

-- -----------------------------------------------------
-- Table ` db_sales_s_2025`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sales_s_2025`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ` db_sales_s_2025`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sales_s_2025`.`items` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cost_price` DECIMAL(3,2) NULL,
  `sell_price` DECIMAL(3,2) NULL,
  `quantity` INT NULL,
  `supplier_name` VARCHAR(45) NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ` db_sales_s_2025`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sales_s_2025`.`orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `date_ordered` DATE NULL,
  `date_delivery` DATE NULL,
  `status` ENUM('processing', 'delivered', 'canceled') NOT NULL,
  `customers_customer_id` INT NOT NULL, 
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_customers_idx` (`customers_customer_id` )  ,
  CONSTRAINT `fk_orders_customers`
    FOREIGN KEY (`customers_customer_id`)
    REFERENCES ` db_sales_s_2025`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ` db_sales_s_2025`.`orderline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sales_s_2025`.`orderline` (
  `item_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `quantity` SMALLINT(2) NULL,
  PRIMARY KEY (`item_id`, `order_id`),
  INDEX `fk_items_has_orders_orders1_idx` (`order_id` ) ,
  INDEX `fk_items_has_orders_items1_idx` (`item_id` ) ,
  CONSTRAINT `fk_items_has_orders_items1`
    FOREIGN KEY (`item_id`)
    REFERENCES ` db_sales_s_2025`.`items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_items_has_orders_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES ` db_sales_s_2025`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

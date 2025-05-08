-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_itim130_s
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_itim130_s
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_itim130_s` DEFAULT CHARACTER SET utf8 ;
USE `db_itim130_s` ;

-- -----------------------------------------------------
-- Table `db_itim130_s`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_itim130_s`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_itim130_s`.`subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_itim130_s`.`subjects` (
  `subject_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `units` SMALLINT(2) NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`subject_id`),
  INDEX `fk_subjects_courses_idx` (`course_id` ) ,
  CONSTRAINT `fk_subjects_courses`
    FOREIGN KEY (`course_id`)
    REFERENCES `db_itim130_s`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_itim130_s`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_itim130_s`.`students` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_itim130_s`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_itim130_s`.`enrollment` (
  `students_student_id` INT NOT NULL,
  `subjects_subject_id` INT NOT NULL,
  `grade` DECIMAL(2,2) NULL,
  PRIMARY KEY (`students_student_id`, `subjects_subject_id`),
  INDEX `fk_students_has_subjects_subjects1_idx` (`subjects_subject_id` ) ,
  INDEX `fk_students_has_subjects_students1_idx` (`students_student_id` ) ,
  CONSTRAINT `fk_students_has_subjects_students1`
    FOREIGN KEY (`students_student_id`)
    REFERENCES `db_itim130_s`.`students` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_subjects_subjects1`
    FOREIGN KEY (`subjects_subject_id`)
    REFERENCES `db_itim130_s`.`subjects` (`subject_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

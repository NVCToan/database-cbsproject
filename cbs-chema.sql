-- MySQL Script generated by MySQL Workbench
-- Tue Nov 23 22:11:41 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cmd
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cmd` ;

-- -----------------------------------------------------
-- Schema cmd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cmd` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `cmd` ;

-- -----------------------------------------------------
-- Table `cmd`.`proposal_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`proposal_types` ;

CREATE TABLE IF NOT EXISTS `cmd`.`proposal_types` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `active_flag` TINYINT(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`approval_steps`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`approval_steps` ;

CREATE TABLE IF NOT EXISTS `cmd`.`approval_steps` (
  `id` VARCHAR(10) NOT NULL,
  `approval_step_name` VARCHAR(45) NULL DEFAULT NULL,
  `approval_step_index ` VARCHAR(10) NULL DEFAULT NULL,
  `proposal_type_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_approval_steps_proposal_types1_idx` (`proposal_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_approval_steps_proposal_types1`
    FOREIGN KEY (`proposal_type_id`)
    REFERENCES `cmd`.`proposal_types` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`departments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`departments` ;

CREATE TABLE IF NOT EXISTS `cmd`.`departments` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `farther_department_id` INT(11) NULL DEFAULT NULL,
  `manager_id` INT(11) NULL DEFAULT NULL,
  `create_by` VARCHAR(45) NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) NULL DEFAULT NULL,
  `create_date` VARCHAR(45) NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`employees` ;

CREATE TABLE IF NOT EXISTS `cmd`.`employees` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `date _of_birth` VARCHAR(20) NULL DEFAULT '0',
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` VARCHAR(15) NULL DEFAULT NULL,
  `manager_id` INT(11) NULL DEFAULT NULL,
  `create_by` VARCHAR(45) NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) NULL DEFAULT NULL,
  `create_date` VARCHAR(45) NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) NULL DEFAULT NULL,
  `date_of_birth` VARCHAR(255) NULL DEFAULT NULL,
  `active_flag` TINYINT(4) NULL DEFAULT NULL,
  `department_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employees_departments1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_employees_departments1`
    FOREIGN KEY (`department_id`)
    REFERENCES `cmd`.`departments` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 49
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`teams`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`teams` ;

CREATE TABLE IF NOT EXISTS `cmd`.`teams` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cmd`.`positions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`positions` ;

CREATE TABLE IF NOT EXISTS `cmd`.`positions` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `department_id` VARCHAR(10) NOT NULL,
  `is_manager` TINYINT(4) NULL DEFAULT NULL,
  `create_by` VARCHAR(45) NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) NULL DEFAULT NULL,
  `create_date` VARCHAR(45) NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) NULL DEFAULT NULL,
  `team_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_chucvu_phongban1_idx` (`department_id` ASC) VISIBLE,
  INDEX `fk_positions_teams1_idx` (`team_id` ASC) VISIBLE,
  CONSTRAINT `fk_chucvu_phongban1`
    FOREIGN KEY (`department_id`)
    REFERENCES `cmd`.`departments` (`id`),
  CONSTRAINT `fk_positions_teams1`
    FOREIGN KEY (`team_id`)
    REFERENCES `cmd`.`teams` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`approval_step_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`approval_step_details` ;

CREATE TABLE IF NOT EXISTS `cmd`.`approval_step_details` (
  `id` VARCHAR(10) NOT NULL,
  `approval_step_id` VARCHAR(10) NOT NULL,
  `employee_id` VARCHAR(10) NULL DEFAULT NULL,
  `department_id` VARCHAR(10) NULL DEFAULT NULL,
  `position_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_approval_step_details_approval_steps1_idx` (`approval_step_id` ASC) VISIBLE,
  INDEX `fk_approval_step_details_employees1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_approval_step_details_departments1_idx` (`department_id` ASC) VISIBLE,
  INDEX `fk_approval_step_details_positions1_idx` (`position_id` ASC) VISIBLE,
  CONSTRAINT `fk_approval_step_details_approval_steps1`
    FOREIGN KEY (`approval_step_id`)
    REFERENCES `cmd`.`approval_steps` (`id`),
  CONSTRAINT `fk_approval_step_details_departments1`
    FOREIGN KEY (`department_id`)
    REFERENCES `cmd`.`departments` (`id`),
  CONSTRAINT `fk_approval_step_details_employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `cmd`.`employees` (`id`),
  CONSTRAINT `fk_approval_step_details_positions1`
    FOREIGN KEY (`position_id`)
    REFERENCES `cmd`.`positions` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`menu` ;

CREATE TABLE IF NOT EXISTS `cmd`.`menu` (
  `id` VARCHAR(10) NOT NULL,
  `parent_id` INT(11) NULL DEFAULT NULL,
  `url` VARCHAR(100) NULL DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `order_index` INT(11) NULL DEFAULT NULL,
  `create_date` TIMESTAMP NULL DEFAULT NULL,
  `update_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`roles` ;

CREATE TABLE IF NOT EXISTS `cmd`.`roles` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `position_id` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_roles_positions1_idx` (`position_id` ASC) VISIBLE,
  CONSTRAINT `fk_roles_positions1`
    FOREIGN KEY (`position_id`)
    REFERENCES `cmd`.`positions` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`auth`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`auth` ;

CREATE TABLE IF NOT EXISTS `cmd`.`auth` (
  `id` VARCHAR(10) NOT NULL,
  `role_id` VARCHAR(10) NULL DEFAULT NULL,
  `menu_id` VARCHAR(10) NULL DEFAULT NULL,
  `permission` BIT(1) NULL DEFAULT NULL,
  `active_flag` BIT(1) NULL DEFAULT NULL,
  `create_date` TIMESTAMP NULL DEFAULT NULL,
  `update_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `role_id_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_menu_auth_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `fk_menu_auth`
    FOREIGN KEY (`menu_id`)
    REFERENCES `cmd`.`menu` (`id`),
  CONSTRAINT `fk_role_auth`
    FOREIGN KEY (`role_id`)
    REFERENCES `cmd`.`roles` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`data_types`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`data_types` ;

CREATE TABLE IF NOT EXISTS `cmd`.`data_types` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`options`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`options` ;

CREATE TABLE IF NOT EXISTS `cmd`.`options` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 27
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`permissions` ;

CREATE TABLE IF NOT EXISTS `cmd`.`permissions` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`statuses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`statuses` ;

CREATE TABLE IF NOT EXISTS `cmd`.`statuses` (
  `id` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`proposals`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`proposals` ;

CREATE TABLE IF NOT EXISTS `cmd`.`proposals` (
  `id` VARCHAR(10) NOT NULL,
  `proposal_type_id` VARCHAR(10) NOT NULL,
  `creator_id` VARCHAR(10) NOT NULL,
  `status_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_dexuat_TrangThai1_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_proposals_proposal_types1_idx` (`proposal_type_id` ASC) VISIBLE,
  INDEX `fk_proposals_employees1_idx` (`creator_id` ASC) VISIBLE,
  CONSTRAINT `fk_dexuat_TrangThai1`
    FOREIGN KEY (`status_id`)
    REFERENCES `cmd`.`statuses` (`id`),
  CONSTRAINT `fk_proposals_employees1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `cmd`.`employees` (`id`),
  CONSTRAINT `fk_proposals_proposal_types1`
    FOREIGN KEY (`proposal_type_id`)
    REFERENCES `cmd`.`proposal_types` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`proposal_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`proposal_details` ;

CREATE TABLE IF NOT EXISTS `cmd`.`proposal_details` (
  `id` VARCHAR(10) NOT NULL,
  `proposal_id` VARCHAR(10) NOT NULL,
  `field_id` VARCHAR(45) NULL DEFAULT NULL,
  `content` VARCHAR(200) NULL DEFAULT NULL,
  `create_by` VARCHAR(45) NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) NULL DEFAULT NULL,
  `create_date` VARCHAR(45) NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proposal_details_proposals1_idx` (`proposal_id` ASC) VISIBLE,
  CONSTRAINT `fk_proposal_details_proposals1`
    FOREIGN KEY (`proposal_id`)
    REFERENCES `cmd`.`proposals` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 121
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`proposal_permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`proposal_permissions` ;

CREATE TABLE IF NOT EXISTS `cmd`.`proposal_permissions` (
  `id` VARCHAR(10) NOT NULL,
  `proposal_type_id` VARCHAR(10) NOT NULL,
  `department_id` VARCHAR(10) NULL DEFAULT NULL,
  `position_id` VARCHAR(10) NULL DEFAULT NULL,
  `employee_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proposal_permissions_proposal_types1_idx` (`proposal_type_id` ASC) VISIBLE,
  INDEX `fk_proposal_permissions_departments1_idx` (`department_id` ASC) VISIBLE,
  INDEX `fk_proposal_permissions_positions1_idx` (`position_id` ASC) VISIBLE,
  INDEX `fk_proposal_permissions_employees1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_proposal_permissions_departments1`
    FOREIGN KEY (`department_id`)
    REFERENCES `cmd`.`departments` (`id`),
  CONSTRAINT `fk_proposal_permissions_employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `cmd`.`employees` (`id`),
  CONSTRAINT `fk_proposal_permissions_positions1`
    FOREIGN KEY (`position_id`)
    REFERENCES `cmd`.`positions` (`id`),
  CONSTRAINT `fk_proposal_permissions_proposal_types1`
    FOREIGN KEY (`proposal_type_id`)
    REFERENCES `cmd`.`proposal_types` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`proposal_type_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`proposal_type_details` ;

CREATE TABLE IF NOT EXISTS `cmd`.`proposal_type_details` (
  `id` VARCHAR(10) NOT NULL,
  `proposal_types_id` VARCHAR(10) NOT NULL,
  `field_id` INT(11) NULL DEFAULT NULL,
  `field_name` VARCHAR(45) NULL DEFAULT NULL,
  `data_type_id` VARCHAR(10) NOT NULL,
  `create_by` VARCHAR(45) NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) NULL DEFAULT NULL,
  `create_date` VARCHAR(45) NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_type_details_data_types1_idx` (`data_type_id` ASC) VISIBLE,
  INDEX `fk_proposal_type_details_proposal_types1_idx` (`proposal_types_id` ASC) VISIBLE,
  CONSTRAINT `fk_proposal_type_details_proposal_types1`
    FOREIGN KEY (`proposal_types_id`)
    REFERENCES `cmd`.`proposal_types` (`id`),
  CONSTRAINT `fk_type_details_data_types1`
    FOREIGN KEY (`data_type_id`)
    REFERENCES `cmd`.`data_types` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`role_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`role_details` ;

CREATE TABLE IF NOT EXISTS `cmd`.`role_details` (
  `id` VARCHAR(10) NOT NULL,
  `option_id` VARCHAR(10) NOT NULL,
  `role_id` VARCHAR(10) NOT NULL,
  `permission_id` VARCHAR(10) NOT NULL,
  `create_by` VARCHAR(45) NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) NULL DEFAULT NULL,
  `create_date` VARCHAR(45) NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_role_details_options1_idx` (`option_id` ASC) VISIBLE,
  INDEX `fk_role_details_roles1_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_role_details_permissions1_idx` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `fk_role_details_options1`
    FOREIGN KEY (`option_id`)
    REFERENCES `cmd`.`options` (`id`),
  CONSTRAINT `fk_role_details_permissions1`
    FOREIGN KEY (`permission_id`)
    REFERENCES `cmd`.`permissions` (`id`),
  CONSTRAINT `fk_role_details_roles1`
    FOREIGN KEY (`role_id`)
    REFERENCES `cmd`.`roles` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`tasks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`tasks` ;

CREATE TABLE IF NOT EXISTS `cmd`.`tasks` (
  `id` VARCHAR(10) NOT NULL,
  `status_id` VARCHAR(10) NOT NULL,
  `creator_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tasks_statuses1_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_tasks_employees1_idx` (`creator_id` ASC) VISIBLE,
  CONSTRAINT `fk_tasks_employees1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `cmd`.`employees` (`id`),
  CONSTRAINT `fk_tasks_statuses1`
    FOREIGN KEY (`status_id`)
    REFERENCES `cmd`.`statuses` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`task_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`task_details` ;

CREATE TABLE IF NOT EXISTS `cmd`.`task_details` (
  `id` VARCHAR(10) NOT NULL,
  `receiver_id` VARCHAR(10) NOT NULL,
  `task_id` VARCHAR(10) NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `create_by` VARCHAR(45) NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) NULL DEFAULT NULL,
  `create_date` VARCHAR(45) NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_GiaoViec_nhanvien1_idx` (`receiver_id` ASC) VISIBLE,
  INDEX `fk_task_details_tasks1_idx` (`task_id` ASC) VISIBLE,
  CONSTRAINT `fk_GiaoViec_nhanvien1`
    FOREIGN KEY (`receiver_id`)
    REFERENCES `cmd`.`employees` (`id`),
  CONSTRAINT `fk_task_details_tasks1`
    FOREIGN KEY (`task_id`)
    REFERENCES `cmd`.`tasks` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`teams_employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`teams_employees` ;

CREATE TABLE IF NOT EXISTS `cmd`.`teams_employees` (
  `teams_id` VARCHAR(10) NOT NULL,
  `employees_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`teams_id`, `employees_id`),
  INDEX `fk_teams_has_employees_employees1_idx` (`employees_id` ASC) VISIBLE,
  INDEX `fk_teams_has_employees_teams1_idx` (`teams_id` ASC) VISIBLE,
  CONSTRAINT `fk_teams_has_employees_teams1`
    FOREIGN KEY (`teams_id`)
    REFERENCES `cmd`.`teams` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teams_has_employees_employees1`
    FOREIGN KEY (`employees_id`)
    REFERENCES `cmd`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cmd`.`positions_employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cmd`.`positions_employees` ;

CREATE TABLE IF NOT EXISTS `cmd`.`positions_employees` (
  `employee_id` VARCHAR(10) NOT NULL,
  `position_id` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`employee_id`, `position_id`),
  INDEX `fk_employees_has_positions_positions1_idx` (`position_id` ASC) VISIBLE,
  INDEX `fk_employees_has_positions_employees1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_employees_has_positions_employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `cmd`.`employees` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_positions_positions1`
    FOREIGN KEY (`position_id`)
    REFERENCES `cmd`.`positions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

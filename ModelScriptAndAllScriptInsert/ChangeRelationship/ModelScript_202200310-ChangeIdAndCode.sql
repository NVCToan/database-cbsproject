-- MySQL Script generated by MySQL Workbench
-- Fri Mar 11 03:11:52 2022
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

-- -----------------------------------------------------
-- Schema cmd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cmd` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `cmd` ;

-- -----------------------------------------------------
-- Table `cmd`.`proposal_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`proposal_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `active_flag` TINYINT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`approval_steps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`approval_steps` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `approval_step_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `approval_step_index` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `proposal_type_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE,
  INDEX `fk_approval_steps_proposal_types1_idx` (`proposal_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_approval_steps_proposal_types1`
    FOREIGN KEY (`proposal_type_id`)
    REFERENCES `cmd`.`proposal_types` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`departments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `farther_department_id` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `manager_id` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `create_by` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `create_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `date_of_birth` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT '0',
  `email` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `phone_number` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `manager_id` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `create_by` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `create_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `active_flag` TINYINT NULL DEFAULT '1',
  `department_id` INT NULL DEFAULT NULL,
  `gender` VARCHAR(1) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL COMMENT '\"M\" or \"F\"',
  `avatar` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `username` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `password` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `enable_login` TINYINT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE,
  INDEX `FKgy4qe3dnqrm3ktd76sxp7n4c2` (`department_id` ASC) VISIBLE,
  CONSTRAINT `FKgy4qe3dnqrm3ktd76sxp7n4c2`
    FOREIGN KEY (`department_id`)
    REFERENCES `cmd`.`departments` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 101
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`teams` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `name` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `position_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE,
  INDEX `FKrg8eactfnoo2fias560gvgou6` (`position_id` ASC) VISIBLE,
  CONSTRAINT `FKrg8eactfnoo2fias560gvgou6`
    FOREIGN KEY (`position_id`)
    REFERENCES `cmd`.`positions` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`positions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`positions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `department_id` INT NULL DEFAULT NULL,
  `is_manager` TINYINT NULL DEFAULT NULL,
  `create_by` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `create_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `team_id` INT NULL DEFAULT NULL,
  `role_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE,
  INDEX `fk_chucvu_phongban1_idx` (`department_id` ASC) VISIBLE,
  INDEX `fk_positions_teams1_idx` (`team_id` ASC) VISIBLE,
  INDEX `fk_role_position_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_chucvu_phongban1`
    FOREIGN KEY (`department_id`)
    REFERENCES `cmd`.`departments` (`id`),
  CONSTRAINT `fk_positions_teams1`
    FOREIGN KEY (`team_id`)
    REFERENCES `cmd`.`teams` (`id`),
  CONSTRAINT `fk_role_position`
    FOREIGN KEY (`role_id`)
    REFERENCES `cmd`.`roles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`approval_step_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`approval_step_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `approval_step_id` INT NOT NULL,
  `employee_id` INT NULL DEFAULT NULL,
  `department_id` INT NULL DEFAULT NULL,
  `position_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE,
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
CREATE TABLE IF NOT EXISTS `cmd`.`menu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `parent_id` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `url` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `name` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `order_index` INT NULL DEFAULT NULL,
  `create_date` TIMESTAMP NULL DEFAULT NULL,
  `update_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`auth`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`auth` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `role_id` INT NULL DEFAULT NULL,
  `menu_id` INT NULL DEFAULT NULL,
  `permission` TINYINT NULL DEFAULT '1',
  `active_flag` TINYINT NULL DEFAULT '1',
  `create_date` TIMESTAMP NULL DEFAULT NULL,
  `update_date` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE,
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
CREATE TABLE IF NOT EXISTS `cmd`.`data_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `description` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`options`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`options` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 27
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`positions_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`positions_employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT NOT NULL,
  `position_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_employees_has_positions_positions1_idx` (`position_id` ASC) VISIBLE,
  INDEX `fk_employees_has_positions_employees1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_employees_has_positions_employees1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `cmd`.`employees` (`id`),
  CONSTRAINT `fk_employees_has_positions_positions1`
    FOREIGN KEY (`position_id`)
    REFERENCES `cmd`.`positions` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 579
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`statuses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`proposals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`proposals` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `proposal_type_id` INT NOT NULL,
  `creator_id` INT NOT NULL,
  `status_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE,
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
CREATE TABLE IF NOT EXISTS `cmd`.`proposal_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `proposal_id` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `proposal_detail_index` INT NULL DEFAULT NULL,
  `content` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `create_by` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `create_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE,
  INDEX `fk_proposal_details_proposals1_idx` (`proposal_id` ASC) VISIBLE,
  CONSTRAINT `fk_proposal_details_proposals1`
    FOREIGN KEY (`proposal_id`)
    REFERENCES `cmd`.`proposals` (`code`))
ENGINE = InnoDB
AUTO_INCREMENT = 121
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`proposal_type_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`proposal_type_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `proposal_type_index` INT NULL DEFAULT NULL,
  `field_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `data_type_id` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `create_by` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `create_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `field_id` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `proposal_type_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE,
  INDEX `fk_type_details_data_types1_idx` (`data_type_id` ASC) VISIBLE,
  INDEX `FKdvba7s6h0uitxnu1rh5vm2r1r` (`proposal_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_type_details_data_types1`
    FOREIGN KEY (`data_type_id`)
    REFERENCES `cmd`.`data_types` (`code`),
  CONSTRAINT `FKdvba7s6h0uitxnu1rh5vm2r1r`
    FOREIGN KEY (`proposal_type_id`)
    REFERENCES `cmd`.`proposal_types` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`proposals_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`proposals_permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `proposal_type_id` INT NOT NULL,
  `department_id` INT NULL DEFAULT NULL,
  `position_id` INT NULL DEFAULT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE,
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
-- Table `cmd`.`role_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`role_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `option_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  `permission_id` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `create_by` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `modify_by` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `create_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `modify_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE,
  INDEX `fk_role_details_options1_idx` (`option_id` ASC) VISIBLE,
  INDEX `fk_role_details_roles1_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_role_details_permissions1_idx` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `fk_role_details_options1`
    FOREIGN KEY (`option_id`)
    REFERENCES `cmd`.`options` (`id`),
  CONSTRAINT `fk_role_details_permissions1`
    FOREIGN KEY (`permission_id`)
    REFERENCES `cmd`.`permissions` (`code`),
  CONSTRAINT `fk_role_details_roles1`
    FOREIGN KEY (`role_id`)
    REFERENCES `cmd`.`roles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`tasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`tasks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NOT NULL,
  `status_id` INT NOT NULL,
  `creator_id` INT NOT NULL,
  `title` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `description` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `create_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `receiver_id` INT NULL DEFAULT NULL,
  `finish_date` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id` (`code` ASC) VISIBLE,
  INDEX `fk_tasks_statuses1_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_tasks_employees1_idx` (`creator_id` ASC) VISIBLE,
  INDEX `fk_tasks_employees2_idx` (`receiver_id` ASC) VISIBLE,
  CONSTRAINT `fk_tasks_employees1`
    FOREIGN KEY (`creator_id`)
    REFERENCES `cmd`.`employees` (`id`),
  CONSTRAINT `fk_tasks_employees2`
    FOREIGN KEY (`receiver_id`)
    REFERENCES `cmd`.`employees` (`id`),
  CONSTRAINT `fk_tasks_statuses1`
    FOREIGN KEY (`status_id`)
    REFERENCES `cmd`.`statuses` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`task_his`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`task_his` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `task_id` INT NULL DEFAULT NULL,
  `status_id` INT NULL DEFAULT NULL,
  `receiver_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_task_task_his_idx` (`task_id` ASC) VISIBLE,
  INDEX `fk_status_task_his_idx` (`status_id` ASC) VISIBLE,
  INDEX `fk_emp_task_his_idx` (`receiver_id` ASC) VISIBLE,
  CONSTRAINT `fk_emp_task_his`
    FOREIGN KEY (`receiver_id`)
    REFERENCES `cmd`.`employees` (`id`),
  CONSTRAINT `fk_status_task_his`
    FOREIGN KEY (`status_id`)
    REFERENCES `cmd`.`statuses` (`id`),
  CONSTRAINT `fk_task_task_his`
    FOREIGN KEY (`task_id`)
    REFERENCES `cmd`.`tasks` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `cmd`.`teams_employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmd`.`teams_employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `team_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FKgqu2h8g8dkywvn6hdswglpcgc` (`employee_id` ASC) VISIBLE,
  INDEX `FKjal5g6ir6je09j8dma510rka2` (`team_id` ASC) VISIBLE,
  CONSTRAINT `FKgqu2h8g8dkywvn6hdswglpcgc`
    FOREIGN KEY (`employee_id`)
    REFERENCES `cmd`.`employees` (`id`),
  CONSTRAINT `FKjal5g6ir6je09j8dma510rka2`
    FOREIGN KEY (`team_id`)
    REFERENCES `cmd`.`teams` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

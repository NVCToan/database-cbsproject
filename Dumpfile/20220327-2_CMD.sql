-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: cmd
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cmd`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cmd` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `cmd`;

--
-- Table structure for table `approval_step_details`
--

DROP TABLE IF EXISTS `approval_step_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_step_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `approval_step_id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `position_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_approval_step_details_approval_steps1_idx` (`approval_step_id`),
  KEY `fk_approval_step_details_employees1_idx` (`employee_id`),
  KEY `fk_approval_step_details_departments1_idx` (`department_id`),
  KEY `fk_approval_step_details_positions1_idx` (`position_id`),
  CONSTRAINT `fk_approval_step_details_approval_steps1` FOREIGN KEY (`approval_step_id`) REFERENCES `approval_steps` (`id`),
  CONSTRAINT `fk_approval_step_details_departments1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_approval_step_details_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_approval_step_details_positions1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_step_details`
--

LOCK TABLES `approval_step_details` WRITE;
/*!40000 ALTER TABLE `approval_step_details` DISABLE KEYS */;
INSERT INTO `approval_step_details` VALUES (1,1,NULL,3,16),(2,1,NULL,1,7),(4,1,NULL,4,13);
/*!40000 ALTER TABLE `approval_step_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_steps`
--

DROP TABLE IF EXISTS `approval_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_steps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `approval_step_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `approval_step_index` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `proposal_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_approval_steps_proposal_types1_idx` (`proposal_type_id`),
  CONSTRAINT `fk_approval_steps_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_steps`
--

LOCK TABLES `approval_steps` WRITE;
/*!40000 ALTER TABLE `approval_steps` DISABLE KEYS */;
INSERT INTO `approval_steps` VALUES (1,'Phê duyệt','1',1),(2,'Kế toán','1',2);
/*!40000 ALTER TABLE `approval_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `permission` tinyint DEFAULT '1',
  `active_flag` tinyint DEFAULT '1',
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id_idx` (`role_id`),
  KEY `fk_menu_auth_idx` (`menu_id`),
  CONSTRAINT `fk_menu_auth` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `fk_role_auth` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'Textarea',NULL),(2,'Dropdown',NULL),(3,'Radio',NULL),(4,'Checkbox',NULL),(5,'Number',NULL),(6,'Calculator',NULL),(7,'Relation',NULL),(8,'Attachment',NULL),(9,'Datetime',NULL),(10,'Repeater',NULL),(11,'Label',NULL),(12,NULL,NULL);
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `farther_department_id` int DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'1','Ban Quản Lý KTX Cỏ May',0,NULL,NULL,NULL,NULL,NULL,'Quản lý hồ sơ, học phí sinh viên'),(2,'2','Bảo trì - Bảo dưỡng CSVC KTX',1,NULL,NULL,NULL,NULL,NULL,NULL),(3,'3','Đội sửa chữa',2,NULL,NULL,NULL,NULL,NULL,NULL),(4,'4','Tầng 1',2,NULL,NULL,NULL,NULL,NULL,NULL),(5,'5','Tầng 2',2,NULL,NULL,NULL,NULL,NULL,NULL),(6,'6','Tầng 3',2,NULL,NULL,NULL,NULL,NULL,NULL),(7,'7','Tầng trệt',2,NULL,NULL,NULL,NULL,NULL,NULL),(8,'8','Kiểm tra và giám sát sinh viên',1,NULL,NULL,NULL,NULL,NULL,NULL),(9,'9','Tổ chức sự kiện',1,NULL,NULL,NULL,NULL,NULL,NULL),(10,'10','Truyền thông',1,NULL,NULL,NULL,NULL,NULL,NULL),(11,'11','Sinh viên',1,NULL,NULL,NULL,NULL,NULL,NULL),(29,'ITDEP2','Ban Quản Lý IT1',1,NULL,NULL,NULL,NULL,NULL,'Đội IT ký túc xá');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_flag` tinyint DEFAULT '1',
  `department_id` int DEFAULT NULL,
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '"M" or "F"',
  `avatar` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `enable_login` tinyint DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`code`),
  KEY `FKgy4qe3dnqrm3ktd76sxp7n4c2` (`department_id`),
  CONSTRAINT `FKgy4qe3dnqrm3ktd76sxp7n4c2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (2,'DTDCAa','Nguyễn Văn Trần C','0','ThiHng.Lm77@hotmail.com','0269 0386 9201',NULL,NULL,NULL,NULL,NULL,0,7,'1','https://i.imgur.com/bFbOCtQ.jpg','ThiHng.Lm77@hotmail.com','cmdcmd',1),(3,'3','Thùy Oanh Mai MD','0','KhnhChi60@yahoo.com','029533063990',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','KhnhChi60@yahoo.com','cmdcmd',0),(4,'4','Sơn Quyền Hoàng','0','ThoQuyn95@yahoo.com','0223524277',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThoQuyn95@yahoo.com','cmdcmd',0),(5,'5','Hoài Thương Phùng','0','AnhVit.V@yahoo.com','091411954',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','AnhVit.V@yahoo.com','cmdcmd',0),(6,'6','Miss Ái Linh Phùng','0','ThanhKiu27@hotmail.com','008546847',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThanhKiu27@hotmail.com','cmdcmd',0),(7,'7','Ðan Quỳnh Tô','0','HongSa15@yahoo.com','031444607',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HongSa15@yahoo.com','cmdcmd',0),(8,'8','Bảo Tín Phùng','0','GiangThin_T@gmail.com','018243839',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','GiangThin_T@gmail.com','cmdcmd',0),(9,'9','Phước Bình Phạm','0','HongHip_Phm@yahoo.com','0238355531',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HongHip_Phm@yahoo.com','cmdcmd',0),(10,'10','Diễm Trinh Trần','0','HongNgn_Nguyn@gmail.com','010090911',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HongNgn_Nguyn@gmail.com','cmdcmd',0),(11,'11','Quang Dương Lý','0','XunHiu.Lm@yahoo.com','0294502897',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','XunHiu.Lm@yahoo.com','cmdcmd',0),(12,'12','Dr. Thanh Tuyết Trần','0','ThuVit_inh78@yahoo.com','0296018608',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThuVit_inh78@yahoo.com','cmdcmd',0),(13,'13','Hồ Nam Hoàng','0','XunQu8@hotmail.com','000697709',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','XunQu8@hotmail.com','cmdcmd',0),(14,'14','Thiếu Anh Đào','0','KinBnh89@hotmail.com','0231341053',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','KinBnh89@hotmail.com','cmdcmd',0),(15,'15','Minh Mẫn Đoàn','0','Hunh.Phan30@yahoo.com','014692150',NULL,NULL,NULL,NULL,NULL,1,7,NULL,'https://i.imgur.com/bFbOCtQ.jpg','Hunh.Phan30@yahoo.com','cmdcmd',0),(16,'16','Ðức Quyền Hồ','0','VnNhi_Tng@hotmail.com','046832044',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','VnNhi_Tng@hotmail.com','cmdcmd',0),(17,'17','Gia Thiện Đinh','0','KimKhuyn.T73@hotmail.com','028338707783',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','KimKhuyn.T73@hotmail.com','cmdcmd',0),(18,'18','Quỳnh Lâm Lâm IV','0','PhngThanh.Hong@gmail.com','026481779771',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','PhngThanh.Hong@gmail.com','cmdcmd',0),(19,'19','Ms. Việt Huy Mai','0','TUyn97@hotmail.com','02627367901',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','TUyn97@hotmail.com','cmdcmd',0),(20,'20','Thiện Sinh Vũ','0','Hut.Trng@hotmail.com','02671705151',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','Hut.Trng@hotmail.com','cmdcmd',0),(21,'21','Hương Mai Tăng','0','TunHong40@hotmail.com','024243840246',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','TunHong40@hotmail.com','cmdcmd',0),(22,'22','Nam An Trương','0','BchTr_Phng11@gmail.com','027250996423',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','BchTr_Phng11@gmail.com','cmdcmd',0),(23,'23','Ái Linh Mai','0','KimHng.Mai@gmail.com','025563693736',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','KimHng.Mai@gmail.com','cmdcmd',0),(24,'24','Hồng Nhật Trịnh I','0','ThinKim94@gmail.com','021498586417',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThinKim94@gmail.com','cmdcmd',0),(25,'25','Bình Dân Vương Sr.','0','CngLc_H@gmail.com','021096392455',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','CngLc_H@gmail.com','cmdcmd',0),(26,'26','Lương Thiện Phan','0','PhngHoa41@gmail.com','021244855898',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','PhngHoa41@gmail.com','cmdcmd',0),(27,'27','Phú Ân Dương III','0','DimMy_Dng15@gmail.com','02623486108',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','DimMy_Dng15@gmail.com','cmdcmd',0),(28,'28','Vân Quyên Nguyễn IV','0','PhiNhn31@hotmail.com','02693597959',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','PhiNhn31@hotmail.com','cmdcmd',0),(29,'29','Thế Tường Hồ','0','ChiuPhong_Vng88@hotmail.com','020841941271',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ChiuPhong_Vng88@hotmail.com','cmdcmd',0),(30,'30','Trúc Lam Tăng DDS','0','HoMi_H72@yahoo.com','02302009314',NULL,NULL,NULL,NULL,NULL,1,4,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HoMi_H72@yahoo.com','cmdcmd',0),(31,'31','Công Bằng Vương','0','QucTun.Mai@hotmail.com','02314086450',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','QucTun.Mai@hotmail.com','cmdcmd',0),(32,'32','Mrs. Diễm Uyên Tô','0','HngQu_Ng@hotmail.com','026528433246',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HngQu_Ng@hotmail.com','cmdcmd',0),(33,'33','Miss Đinh Hương Trịnh','0','MHip.Phng21@yahoo.com','02928291524',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','MHip.Phng21@yahoo.com','cmdcmd',0),(34,'34','Ðình Dương Đỗ','0','ngHi29@yahoo.com','025826823601',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ngHi29@yahoo.com','cmdcmd',0),(35,'35','Mrs. Anh Quân Ngô','0','NgcHuy_V69@hotmail.com','02219827498',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','NgcHuy_V69@hotmail.com','cmdcmd',0),(36,'36','Nam Thông Lý','0','ThcTm11@yahoo.com','02035615187',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThcTm11@yahoo.com','cmdcmd',0),(37,'37','Miss Thanh Thúy Vũ','0','ThiThi.Dng@yahoo.com','029457686398',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThiThi.Dng@yahoo.com','cmdcmd',0),(38,'38','Ngọc Liên Đào','0','ThanhHoa74@gmail.com','024539260583',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThanhHoa74@gmail.com','cmdcmd',0),(39,'39','Ms. Long Vịnh Phùng','0','ThuThun_Ng@yahoo.com','02767139007',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThuThun_Ng@yahoo.com','cmdcmd',0),(40,'40','Minh Tân Lê','0','ThchTho.on@hotmail.com','022241914468',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThchTho.on@hotmail.com','cmdcmd',0),(41,'41','Ngọc Thi Hoàng','0','DuyTn_Hong8@yahoo.com','02330225329',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','DuyTn_Hong8@yahoo.com','cmdcmd',0),(42,'42','Tuyết Hương Lâm','0','ThnhCng55@gmail.com','02 3053429',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThnhCng55@gmail.com','cmdcmd',0),(43,'43','Xuân Cung Đào','0','KimLin70@gmail.com','02493312914',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','KimLin70@gmail.com','cmdcmd',0),(44,'44','Bảo Huỳnh Vũ','0','HuTon11@hotmail.com','021191970241',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HuTon11@hotmail.com','cmdcmd',0),(45,'45','Nhật Hoàng Lý','0','CngHi_T@yahoo.com','028977402287',NULL,NULL,NULL,NULL,NULL,1,5,NULL,'https://i.imgur.com/bFbOCtQ.jpg','CngHi_T@yahoo.com','cmdcmd',0),(46,'46','Hồng Ðào Phạm','0','BuChng.Mai@yahoo.com','029293625626',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','BuChng.Mai@yahoo.com','cmdcmd',0),(47,'47','Tường Vi Lê','0','ThyTin77@hotmail.com','028318625655',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThyTin77@hotmail.com','cmdcmd',0),(48,'48','Hữu Hiệp Ngô','0','NhtLan.ng@hotmail.com','02596475024',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','NhtLan.ng@hotmail.com','cmdcmd',0),(49,'49','Trân Châu Hà','0','SongLam.Tng22@hotmail.com','027219339777',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','SongLam.Tng22@hotmail.com','cmdcmd',0),(50,'50','Tuấn Khải Tăng','0','HongDu_H16@yahoo.com','027400842384',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HongDu_H16@yahoo.com','cmdcmd',0),(51,'51','Quốc Hoài Phan','0','QucHi.Tng72@gmail.com','02657167339',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','QucHi.Tng72@gmail.com','cmdcmd',0),(52,'52','Đan Thư Hoàng','0','HngChi_Tng14@yahoo.com','02490378913',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HngChi_Tng14@yahoo.com','cmdcmd',0),(53,'53','Trung Anh Dương','0','nhTrung.o75@hotmail.com','023863943809',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','nhTrung.o75@hotmail.com','cmdcmd',0),(54,'54','Hoàng Xuân Đinh','0','cTu.Trn78@yahoo.com','027355428124',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','cTu.Trn78@yahoo.com','cmdcmd',0),(55,'55','Hoàng Việt Lâm','0','BchChiu33@yahoo.com','0210308252',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','BchChiu33@yahoo.com','cmdcmd',0),(56,'56','Cát Uy Đào Jr.','0','TngLinh32@gmail.com','024342717880',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','TngLinh32@gmail.com','cmdcmd',0),(57,'57','Gia Huy Bùi','0','KhiTm.Tng26@gmail.com','023946447267',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','KhiTm.Tng26@gmail.com','cmdcmd',0),(58,'58','Thanh Tùng Hồ','0','HnhTho97@gmail.com','020062419910',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HnhTho97@gmail.com','cmdcmd',0),(59,'59','Bá Thịnh Hồ','0','LongGiang.H@gmail.com','02403709248',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','LongGiang.H@gmail.com','cmdcmd',0),(60,'60','Lan Vy Vũ','0','ChThnh.Phan@gmail.com','02408661214',NULL,NULL,NULL,NULL,NULL,1,6,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ChThnh.Phan@gmail.com','cmdcmd',0),(61,'61','Cẩm Thúy Phan','0','ThanhTuyt.Vng@hotmail.com','028553175830',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThanhTuyt.Vng@hotmail.com','cmdcmd',0),(62,'62','Mrs. Xuân Loan Vương','0','TrngSinh_L49@gmail.com','02596847733',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','TrngSinh_L49@gmail.com','cmdcmd',0),(63,'63','Bạch Yến Lâm','0','KhuTrung_Phm@hotmail.com','02581045074',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','KhuTrung_Phm@hotmail.com','cmdcmd',0),(64,'64','Hồng Thư Phạm','0','ThiDng_H@hotmail.com','023027647371',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThiDng_H@hotmail.com','cmdcmd',0),(65,'65','Công Giang Phùng','0','Anho31@gmail.com','02672275725',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','Anho31@gmail.com','cmdcmd',0),(66,'66','Kim Thu Tô','0','Bnh.Bi69@gmail.com','020411596475',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','Bnh.Bi69@gmail.com','cmdcmd',0),(67,'67','Xuân Vũ Vương','0','ThinThanh16@yahoo.com','023511913308',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThinThanh16@yahoo.com','cmdcmd',0),(68,'68','Việt Khôi Ngô','0','CngNgh.ng36@hotmail.com','02465939969',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','CngNgh.ng36@hotmail.com','cmdcmd',0),(69,'69','Kim Hoàng Hồ','0','BchDuyn_Ng41@hotmail.com','023509628878',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','BchDuyn_Ng41@hotmail.com','cmdcmd',0),(70,'70','Mai Vy Phạm','0','KhiH.Dng59@hotmail.com','02484008120',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','KhiH.Dng59@hotmail.com','cmdcmd',0),(71,'71','Gia Huấn Hoàng','0','XunTho.o0@gmail.com','021660957658',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','XunTho.o0@gmail.com','cmdcmd',0),(72,'72','Mỹ Dung Tô','0','NguytH58@yahoo.com','026562427634',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','NguytH58@yahoo.com','cmdcmd',0),(73,'73','Ngọc Lâm Đào','0','HipHa.H@hotmail.com','02704357587',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HipHa.H@hotmail.com','cmdcmd',0),(74,'74','Hồng Đăng Đào','0','ThanhUyn61@yahoo.com','028722481031',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThanhUyn61@yahoo.com','cmdcmd',0),(75,'75','Viễn Thông Bùi','0','cSiu.Hong@yahoo.com','02220682796',NULL,NULL,NULL,NULL,NULL,1,1,NULL,'https://i.imgur.com/bFbOCtQ.jpg','cSiu.Hong@yahoo.com','cmdcmd',0),(76,'76','Uyên Minh Dương','0','TunDng12@gmail.com','02979806994',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','TunDng12@gmail.com','cmdcmd',0),(77,'77','Tú Uyên Phạm','0','NgcT.Mai@gmail.com','022979096001',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','NgcT.Mai@gmail.com','cmdcmd',0),(78,'78','Tuấn Khanh Mai','0','LanTrc89@hotmail.com','027784130917',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','LanTrc89@hotmail.com','cmdcmd',0),(79,'79','Phượng Tiên Bùi','0','TunVit_@yahoo.com','02059282380',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','TunVit_@yahoo.com','cmdcmd',0),(80,'80','Nghi Dung Trịnh','0','ChDng.Lm@yahoo.com','022981307189',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ChDng.Lm@yahoo.com','cmdcmd',0),(81,'81','Thy Vân Dương','0','QucThng_L@yahoo.com','029522132383',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','QucThng_L@yahoo.com','cmdcmd',0),(82,'82','Bích Hợp Phan','0','ThinTin.o@yahoo.com','029438709672',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThinTin.o@yahoo.com','cmdcmd',0),(83,'83','Quốc Hòa Đào','0','DimPhc_L@hotmail.com','024658338953',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','DimPhc_L@hotmail.com','cmdcmd',0),(84,'84','Tường Lân Đỗ','0','AnhTh_V84@hotmail.com','028730043561',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','AnhTh_V84@hotmail.com','cmdcmd',0),(85,'85','Lâm Tuyền Đặng','0','TunLinh_Trn3@yahoo.com','023704622404',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','TunLinh_Trn3@yahoo.com','cmdcmd',0),(86,'86','Thanh Vy Tăng','0','ThyGiang79@gmail.com','02197073489',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThyGiang79@gmail.com','cmdcmd',0),(87,'87','Hiệp Dinh Tô','0','ThyNgc63@yahoo.com','098270835',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThyNgc63@yahoo.com','cmdcmd',0),(88,'88','Hoàn Châu Tăng','0','HuKhi.V29@gmail.com','022573323621',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HuKhi.V29@gmail.com','cmdcmd',0),(89,'89','Như Ý Hồ','0','NgcHnh48@yahoo.com','02217552052',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','NgcHnh48@yahoo.com','cmdcmd',0),(90,'90','Huy Lĩnh Vũ DDS','0','cTu34@yahoo.com','026972884811',NULL,NULL,NULL,NULL,NULL,1,3,NULL,'https://i.imgur.com/bFbOCtQ.jpg','cTu34@yahoo.com','cmdcmd',0),(91,'91','Mrs. Duy Hạnh Phan','0','HuynAnh.Phm50@yahoo.com','02746883421',NULL,NULL,NULL,NULL,NULL,1,8,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HuynAnh.Phm50@yahoo.com','cmdcmd',0),(92,'92','Trúc Phương Lâm','0','TSng86@hotmail.com','02040406390',NULL,NULL,NULL,NULL,NULL,1,8,NULL,'https://i.imgur.com/bFbOCtQ.jpg','TSng86@hotmail.com','cmdcmd',0),(93,'93','Mrs. Hương Lan Đào','0','XunHnh_inh@gmail.com','021204657976',NULL,NULL,NULL,NULL,NULL,1,8,NULL,'https://i.imgur.com/bFbOCtQ.jpg','XunHnh_inh@gmail.com','cmdcmd',0),(94,'94','Diệu Hiền Lâm','0','ThinLam_Trnh@hotmail.com','02304094839',NULL,NULL,NULL,NULL,NULL,1,8,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThinLam_Trnh@hotmail.com','cmdcmd',0),(95,'95','Phương Loan Trần','0','GiaPhong32@gmail.com','021296019964',NULL,NULL,NULL,NULL,NULL,1,8,NULL,'https://i.imgur.com/bFbOCtQ.jpg','GiaPhong32@gmail.com','cmdcmd',0),(96,'96','Cường Dũng Tô','0','VitKhu20@yahoo.com','022667019725',NULL,NULL,NULL,NULL,NULL,1,8,NULL,'https://i.imgur.com/bFbOCtQ.jpg','VitKhu20@yahoo.com','cmdcmd',0),(97,'97','Chiêu Dương Ngô','0','HngLy_@hotmail.com','02824716127',NULL,NULL,NULL,NULL,NULL,1,8,NULL,'https://i.imgur.com/bFbOCtQ.jpg','HngLy_@hotmail.com','cmdcmd',0),(98,'98','Trí Hào Vương','0','ThinLng.V8@yahoo.com','02032293891',NULL,NULL,NULL,NULL,NULL,1,8,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThinLng.V8@yahoo.com','cmdcmd',0),(99,'99','Ngọc Hạnh Tô','0','ThanhHng.Trng@yahoo.com','025920420175',NULL,NULL,NULL,NULL,NULL,1,8,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThanhHng.Trng@yahoo.com','cmdcmd',0),(100,'100','Thiên An Đỗ','0','ThAnh80@hotmail.com','02253074482',NULL,NULL,NULL,NULL,NULL,1,8,NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThAnh80@hotmail.com','cmdcmd',0),(101,'DT','Ðức Chính Định Bình','0','ThiHng.Lm77@hotmail.com','026903869201',NULL,NULL,NULL,NULL,NULL,0,7,'1','https://i.imgur.com/bFbOCtQ.jpg',NULL,NULL,0),(102,'DTA','Nguyễn Văn A','0','ThiHng.Lm77@hotmail.com','026903869201',NULL,NULL,NULL,NULL,NULL,0,7,'1','https://i.imgur.com/bFbOCtQ.jpg',NULL,NULL,0),(103,'DTB','Nguyễn Văn Trần B','0','ThiHng.Lm77@hotmail.com','026903869201',NULL,NULL,NULL,NULL,NULL,0,7,'1','https://i.imgur.com/bFbOCtQ.jpg',NULL,NULL,0),(104,'DTC','Nguyễn Văn Trần C','0','ThiHng.Lm77@hotmail.com','026903869201',NULL,NULL,NULL,NULL,NULL,0,7,'1','https://i.imgur.com/bFbOCtQ.jpg',NULL,NULL,0),(106,'DTDCA','Nguyễn Văn Trần C','0','ThiHng.Lm77@hotmail.com','0269 0386 9201',NULL,NULL,NULL,NULL,NULL,0,7,'1','https://i.imgur.com/bFbOCtQ.jpg','ThiHng.Lm77@hotmail.com','cmdcmd',1),(107,'DTDCAD','Nguyễn Văn Trần C','0','ThiHng.Lm77@hotmail.com','0269 0386 9201',NULL,NULL,NULL,NULL,NULL,0,7,'1','https://i.imgur.com/bFbOCtQ.jpg','ThiHng.Lm77@hotmail.com','cmdcmd',1);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_index` int DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'Hợp đồng kinh tế'),(2,'Hợp đồng'),(3,'Cảnh báo/nhắc nhở'),(4,'Thiết bị'),(5,'Phụ tùng'),(7,'Cảm biến'),(8,'Cảm biến'),(9,'Danh mục'),(10,'Danh mục kiểm tra'),(11,'Công việc'),(12,'Đề xuất'),(13,'Loại đề xuất'),(14,'Nhân viên'),(15,'Phòng ban'),(16,'Chức vụ'),(17,'Kho'),(18,'Vai trò'),(19,'Báo cáo'),(20,'Khách hàng'),(21,'Người dùng'),(22,'Chức năng công ty'),(23,'Thẻ'),(24,'Phân loại khách hàng'),(25,'Sản phẩm'),(26,'Sản phẩm');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Xem'),(2,'Tạo'),(3,'Sửa'),(4,'Xoá'),(5,'Xem hết'),(6,'Sửa hết'),(7,'Xoá hết');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `is_manager` tinyint DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chucvu_phongban1_idx` (`department_id`),
  KEY `fk_positions_teams1_idx` (`team_id`),
  KEY `fk_role_position_idx` (`role_id`),
  CONSTRAINT `fk_chucvu_phongban1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_positions_teams1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `fk_role_position` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Đội trưởng',NULL,1,NULL,NULL,NULL,NULL,NULL,1),(2,'Đội viên',NULL,0,NULL,NULL,NULL,NULL,NULL,2),(3,'Kiểm kho',NULL,0,NULL,NULL,NULL,NULL,NULL,3),(4,'Trưởng đội 1',2,1,NULL,NULL,NULL,NULL,NULL,4),(5,'Ông cố thành viên',3,0,NULL,NULL,NULL,NULL,NULL,5),(6,'Thành viên',4,0,NULL,NULL,NULL,NULL,NULL,5),(7,'Trưởng tầng 1',4,1,NULL,NULL,NULL,NULL,NULL,6),(8,'Trưởng phòng sinh viên tầng 1',4,0,NULL,NULL,NULL,NULL,NULL,5),(9,'Thành viên',5,0,NULL,NULL,NULL,NULL,NULL,5),(10,'Trưởng tầng 2',5,1,NULL,NULL,NULL,NULL,NULL,6),(11,'Trưởng phòng sinh viên tầng 2',5,0,NULL,NULL,NULL,NULL,NULL,5),(12,'Thành viên',6,0,NULL,NULL,NULL,NULL,NULL,5),(13,'Trưởng tầng 3',6,1,NULL,NULL,NULL,NULL,NULL,6),(14,'Trưởng phòng sinh viên tầng 3',6,0,NULL,NULL,NULL,NULL,NULL,5),(15,'Thành viên',7,0,NULL,NULL,NULL,NULL,NULL,5),(16,'Trưởng tầng trệt',7,1,NULL,NULL,NULL,NULL,NULL,6),(17,'Trưởng phòng sinh viên tầng trệt',7,0,NULL,NULL,NULL,NULL,NULL,5),(18,'Thành viên',8,0,NULL,NULL,NULL,NULL,NULL,5),(19,'Ông cố đội 2',8,1,NULL,NULL,NULL,NULL,NULL,7),(20,'Tesst',NULL,0,NULL,NULL,NULL,NULL,1,5),(78,'Trưởng đội IT',29,1,NULL,NULL,NULL,NULL,NULL,1),(79,'Đội phó',29,0,NULL,NULL,NULL,NULL,NULL,2),(80,'Kế toán',29,0,NULL,NULL,NULL,NULL,NULL,3),(81,'Nhân viên',29,0,NULL,NULL,NULL,NULL,NULL,3);
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_employees`
--

DROP TABLE IF EXISTS `positions_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions_employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `position_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employees_has_positions_positions1_idx` (`position_id`),
  KEY `fk_employees_has_positions_employees1_idx` (`employee_id`),
  CONSTRAINT `fk_employees_has_positions_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_employees_has_positions_positions1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_employees`
--

LOCK TABLES `positions_employees` WRITE;
/*!40000 ALTER TABLE `positions_employees` DISABLE KEYS */;
INSERT INTO `positions_employees` VALUES (3,3,15),(4,4,15),(5,5,15),(6,6,15),(7,7,15),(8,8,15),(9,9,15),(10,10,15),(11,11,15),(12,12,15),(13,13,15),(14,14,15),(15,15,15),(16,16,8),(17,17,6),(18,18,6),(19,19,6),(20,20,6),(21,21,6),(22,22,6),(23,23,6),(24,24,6),(25,25,6),(26,26,6),(27,27,6),(28,28,6),(29,29,6),(30,30,6),(31,31,11),(32,32,9),(33,33,9),(34,34,9),(35,35,9),(36,36,9),(37,37,9),(38,38,9),(39,39,9),(40,40,9),(41,41,9),(42,42,9),(43,43,9),(44,44,9),(45,45,9),(46,46,14),(47,47,12),(48,48,12),(49,49,12),(50,50,12),(51,51,12),(52,52,12),(53,53,12),(54,54,12),(55,55,12),(56,56,12),(57,57,12),(58,58,12),(59,59,12),(60,60,12),(76,76,5),(77,77,5),(78,78,5),(79,79,5),(80,80,5),(81,81,5),(82,82,5),(83,83,5),(84,84,5),(85,85,5),(86,86,5),(87,87,5),(88,88,5),(89,89,5),(90,90,5),(91,91,6),(92,92,6),(93,93,6),(94,94,6),(95,95,6),(96,96,6),(97,97,6),(98,98,6),(99,99,6),(100,100,6),(101,101,15),(102,102,15),(103,103,15),(104,104,15),(116,106,20),(118,107,20),(120,2,20);
/*!40000 ALTER TABLE `positions_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_details`
--

DROP TABLE IF EXISTS `proposal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `proposal_detail_index` int DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proposal_details_proposals1_idx` (`proposal_id`),
  CONSTRAINT `fk_proposal_details_proposals1` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_details`
--

LOCK TABLES `proposal_details` WRITE;
/*!40000 ALTER TABLE `proposal_details` DISABLE KEYS */;
INSERT INTO `proposal_details` VALUES (1,1,1,'Ghét kim tám việc.',NULL,NULL,NULL,NULL),(5,2,1,'Tàu chỉ làm biển em leo bốn tám.',NULL,NULL,NULL,NULL),(9,3,1,'Đồng gió tàu cái khoan khoan nhà.',NULL,NULL,NULL,NULL),(13,4,1,'Độc trời bạn giết giày đã thích.',NULL,NULL,NULL,NULL),(17,5,1,'Thế thế lỗi không không con cửa bốn.',NULL,NULL,NULL,NULL),(21,6,1,'Khoan mười núi dép may chỉ độc áo.',NULL,NULL,NULL,NULL),(25,7,1,'Tám xanh vá biển việc giày leo thế mười đang.',NULL,NULL,NULL,NULL),(29,8,1,'Yêu đập máy bốn kim biết tàu.',NULL,NULL,NULL,NULL),(33,9,1,'Ờ ghế tủ ờ hàng được hết kim bè chín.',NULL,NULL,NULL,NULL),(37,10,1,'Chìm gì đang đạp may đỏ được lỗi đâu giết.',NULL,NULL,NULL,NULL),(41,11,1,'Chỉ thích máy ba xuồng đập.',NULL,NULL,NULL,NULL),(45,12,1,'Ác đâu đập ruộng làm.',NULL,NULL,NULL,NULL),(49,13,1,'Anh làm chết tô xe chín đang vẽ giết.',NULL,NULL,NULL,NULL),(53,14,1,'Nhà xe mười may viết.',NULL,NULL,NULL,NULL),(57,15,1,'Đã trăng chìm.',NULL,NULL,NULL,NULL),(61,16,1,'Hết vá nghỉ bạn thuyền.',NULL,NULL,NULL,NULL),(65,17,1,'Cửa đánh chết ờ chín.',NULL,NULL,NULL,NULL),(69,18,1,'Yêu áo mượn độc bè.',NULL,NULL,NULL,NULL),(73,19,1,'Tô đá chín con việc máy vá thuyền.',NULL,NULL,NULL,NULL),(77,20,1,'Leo máy khoảng nhà một ghế.',NULL,NULL,NULL,NULL),(81,21,1,'Nha cái cái.',NULL,NULL,NULL,NULL),(85,22,1,'Tàu ừ núi đá bơi chìm thuyền máy nước thì.',NULL,NULL,NULL,NULL),(89,23,1,'Bè tủ máy thế khâu cái khoan tôi.',NULL,NULL,NULL,NULL),(93,24,1,'Dép bơi ruộng bạn lầu ừ giày ba mua.',NULL,NULL,NULL,NULL),(97,25,1,'Bạn hàng việc đá may bơi tàu.',NULL,NULL,NULL,NULL),(101,26,1,'Khâu đỏ tô.',NULL,NULL,NULL,NULL),(105,27,1,'Chìm hóa hóa ghét.',NULL,NULL,NULL,NULL),(109,28,1,'Mười hết tôi tui bảy thì tô khoảng hết vàng.',NULL,NULL,NULL,NULL),(113,29,1,'Anh hàng hàng được đâu ngọt thì mượn biết lầu.',NULL,NULL,NULL,NULL),(117,30,1,'Tô bốn năm mướn.',NULL,NULL,NULL,NULL),(118,30,2,'Yêu thuyền bè may bốn chìm mướn nghỉ khâu cửa.\nThì yêu mua đỏ giết đâu mua khâu ruộng.\nGhét thích may nón cái.\nTôi bảy mười tủ bè chỉ núi thôi đồng.\nThích đá thuyền thuyền một thương ghét hết anh.',NULL,NULL,NULL,NULL),(119,30,3,'4668',NULL,NULL,NULL,NULL),(120,30,4,'Cửa bảy nghỉ máy.',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `proposal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_type_details`
--

DROP TABLE IF EXISTS `proposal_type_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal_type_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_type_index` int DEFAULT NULL,
  `field_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_type_id` int NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `proposal_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_details_data_types1_idx` (`data_type_id`),
  KEY `FKdvba7s6h0uitxnu1rh5vm2r1r` (`proposal_type_id`),
  CONSTRAINT `fk_type_details_data_types1` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`),
  CONSTRAINT `FKdvba7s6h0uitxnu1rh5vm2r1r` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_type_details`
--

LOCK TABLES `proposal_type_details` WRITE;
/*!40000 ALTER TABLE `proposal_type_details` DISABLE KEYS */;
INSERT INTO `proposal_type_details` VALUES (1,1,'Mục đích/Lý do',1,NULL,NULL,NULL,NULL,NULL,1),(2,2,'Tình trạng hư hỏng',2,NULL,NULL,NULL,NULL,NULL,1),(3,3,'Số phòng',1,NULL,NULL,NULL,NULL,NULL,1),(4,4,'Ghi chú',2,NULL,NULL,NULL,NULL,NULL,1),(5,1,'Mục đích/Lý do',1,NULL,NULL,NULL,NULL,NULL,2),(6,2,'Tên vật tư',1,NULL,NULL,NULL,NULL,NULL,2),(7,3,'Số lượng',1,NULL,NULL,NULL,NULL,NULL,2),(8,4,'Đơn gía',1,NULL,NULL,NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `proposal_type_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_types`
--

DROP TABLE IF EXISTS `proposal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_flag` tinyint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_types`
--

LOCK TABLES `proposal_types` WRITE;
/*!40000 ALTER TABLE `proposal_types` DISABLE KEYS */;
INSERT INTO `proposal_types` VALUES (1,'Đăng ký sửa chữa',1),(2,'Đề xuất mua hàng',1);
/*!40000 ALTER TABLE `proposal_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposals`
--

DROP TABLE IF EXISTS `proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_type_id` int NOT NULL,
  `creator_id` int NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dexuat_TrangThai1_idx` (`status_id`),
  KEY `fk_proposals_proposal_types1_idx` (`proposal_type_id`),
  KEY `fk_proposals_employees1_idx` (`creator_id`),
  CONSTRAINT `fk_dexuat_TrangThai1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `fk_proposals_employees1` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_proposals_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals`
--

LOCK TABLES `proposals` WRITE;
/*!40000 ALTER TABLE `proposals` DISABLE KEYS */;
INSERT INTO `proposals` VALUES (1,1,45,1),(2,1,54,1),(3,1,75,1),(4,1,15,1),(5,1,48,1),(6,1,19,1),(7,1,9,1),(8,1,10,1),(9,1,66,1),(10,1,22,1),(11,1,75,1),(12,1,17,1),(13,1,10,1),(14,1,17,1),(15,1,72,1),(16,1,38,1),(17,1,47,1),(18,1,69,1),(19,1,32,1),(20,1,41,1),(21,1,19,1),(22,1,75,1),(23,1,75,1),(24,1,66,1),(25,1,8,1),(26,1,47,1),(27,1,37,1),(28,1,69,1),(29,1,5,1),(30,1,23,1);
/*!40000 ALTER TABLE `proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposals_permissions`
--

DROP TABLE IF EXISTS `proposals_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposals_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `proposal_type_id` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proposal_permissions_proposal_types1_idx` (`proposal_type_id`),
  KEY `fk_proposal_permissions_departments1_idx` (`department_id`),
  KEY `fk_proposal_permissions_positions1_idx` (`position_id`),
  KEY `fk_proposal_permissions_employees1_idx` (`employee_id`),
  CONSTRAINT `fk_proposal_permissions_departments1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_proposal_permissions_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_proposal_permissions_positions1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `fk_proposal_permissions_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals_permissions`
--

LOCK TABLES `proposals_permissions` WRITE;
/*!40000 ALTER TABLE `proposals_permissions` DISABLE KEYS */;
INSERT INTO `proposals_permissions` VALUES (1,2,5,NULL,41),(2,2,1,NULL,43);
/*!40000 ALTER TABLE `proposals_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_details`
--

DROP TABLE IF EXISTS `role_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `option_id` int NOT NULL,
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_details_roles1_idx` (`role_id`),
  KEY `fk_role_details_permissions1_idx` (`permission_id`),
  CONSTRAINT `fk_role_details_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_details`
--

LOCK TABLES `role_details` WRITE;
/*!40000 ALTER TABLE `role_details` DISABLE KEYS */;
INSERT INTO `role_details` VALUES (1,11,5,1,NULL,NULL,NULL,NULL),(2,11,5,2,NULL,NULL,NULL,NULL),(3,11,5,3,NULL,NULL,NULL,NULL),(4,11,5,4,NULL,NULL,NULL,NULL),(5,12,5,1,NULL,NULL,NULL,NULL),(6,12,5,2,NULL,NULL,NULL,NULL),(7,12,5,3,NULL,NULL,NULL,NULL),(8,12,5,4,NULL,NULL,NULL,NULL),(9,14,5,1,NULL,NULL,NULL,NULL),(10,15,5,1,NULL,NULL,NULL,NULL),(11,11,4,1,NULL,NULL,NULL,NULL),(12,11,4,2,NULL,NULL,NULL,NULL),(13,11,4,3,NULL,NULL,NULL,NULL),(14,11,4,4,NULL,NULL,NULL,NULL),(15,11,4,5,NULL,NULL,NULL,NULL),(16,11,4,6,NULL,NULL,NULL,NULL),(17,12,4,1,NULL,NULL,NULL,NULL),(18,12,4,2,NULL,NULL,NULL,NULL),(19,12,4,3,NULL,NULL,NULL,NULL),(20,12,4,4,NULL,NULL,NULL,NULL),(21,12,4,5,NULL,NULL,NULL,NULL),(22,12,4,6,NULL,NULL,NULL,NULL),(23,14,4,1,NULL,NULL,NULL,NULL),(24,15,4,1,NULL,NULL,NULL,NULL),(25,16,4,1,NULL,NULL,NULL,NULL),(26,11,6,1,NULL,NULL,NULL,NULL),(27,11,6,2,NULL,NULL,NULL,NULL),(28,11,6,3,NULL,NULL,NULL,NULL),(29,11,6,4,NULL,NULL,NULL,NULL),(30,12,6,1,NULL,NULL,NULL,NULL),(31,12,6,2,NULL,NULL,NULL,NULL),(32,12,6,3,NULL,NULL,NULL,NULL),(33,12,6,4,NULL,NULL,NULL,NULL),(34,14,6,1,NULL,NULL,NULL,NULL),(35,15,6,1,NULL,NULL,NULL,NULL),(36,16,6,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Điều hành các hoạt động của KTX'),(2,'Duyệt các đề xuất nghỉ phép của sinh viên'),(3,'Giải quyết các vấn đề tiền ăn và học phí'),(4,'Quản lý cơ sở vật chất, an ninh KTX'),(5,'Sinh viên'),(6,'Nhận đề xuất và thực hiện sửa chữa hư hỏng cho các phòng'),(7,'Quản lý, chấm điểm rèn luyện cho SV và điểm danh SV');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Hoàn tất'),(2,'Bị từ chối'),(3,'Đã huỷ'),(4,'Mới'),(5,'Đang làm'),(6,'Chờ xác nhận'),(7,'Hoàn thành'),(8,'Quá hạn'),(9,'Chờ');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_his`
--

DROP TABLE IF EXISTS `task_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_his` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `receiver_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_task_his_idx` (`task_id`),
  KEY `fk_status_task_his_idx` (`status_id`),
  KEY `fk_emp_task_his_idx` (`receiver_id`),
  CONSTRAINT `fk_emp_task_his` FOREIGN KEY (`receiver_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_status_task_his` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `fk_task_task_his` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_his`
--

LOCK TABLES `task_his` WRITE;
/*!40000 ALTER TABLE `task_his` DISABLE KEYS */;
INSERT INTO `task_his` VALUES (1,1,9,46),(2,2,2,24),(3,3,5,72),(4,4,4,7),(5,5,4,35),(6,6,8,79),(7,7,4,9),(8,8,8,26),(9,9,7,93),(10,10,4,41),(11,11,4,88),(12,12,5,67),(13,13,7,77),(14,14,9,99),(15,15,8,53),(16,16,9,44),(17,17,4,42),(18,18,6,74),(19,19,5,61),(20,20,3,16),(21,21,9,39),(22,22,9,84),(23,23,2,2),(24,24,4,90),(25,25,8,88),(26,26,5,24),(27,27,1,45),(28,28,6,26),(29,29,3,42),(30,30,9,77);
/*!40000 ALTER TABLE `task_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status_id` int NOT NULL,
  `creator_id` int NOT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver_id` int DEFAULT NULL,
  `finish_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tasks_statuses1_idx` (`status_id`),
  KEY `fk_tasks_employees1_idx` (`creator_id`),
  KEY `fk_tasks_employees2_idx` (`receiver_id`),
  CONSTRAINT `fk_tasks_employees1` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_tasks_employees2` FOREIGN KEY (`receiver_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_tasks_statuses1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,9,15,'khoan xe nghỉ','Đánh nước làm đã bè xanh thích máy thôi.\nThương mượn áo tôi thuyền độc ghét hết ngọt.',NULL,46,NULL),(2,2,57,'cửa á ác','Được vá không quần.',NULL,24,NULL),(3,5,4,'tủ bè vẽ','Lỗi tám đồng làm mượn.\nKhông đang một mười bàn bảy tôi.\nRuộng áo tô đạp hàng.',NULL,72,NULL),(4,4,19,'đồng hết thôi','Ừ đánh áo được gì thế.\nTám thích mướn tôi bốn việc núi con.\nTui việc cái ừ giày con không.',NULL,7,NULL),(5,4,43,'chín đang may','Thương gì khâu chết dép chết ghét.\nBiển năm nha đập quần.\nViệc bảy vàng nhà dép đạp giày thì.',NULL,35,NULL),(6,8,8,'quê thuê trời','Đá may vẽ cửa không tô ghét.',NULL,79,NULL),(7,4,88,'đập tô tàu','Máy hết ghế leo đỏ hai gió.\nHai yêu xuồng tàu trăng thích đánh mua.\nBiết bè đạp.\nNgọt núi hàng á tui xuồng dép.',NULL,9,NULL),(8,8,33,'xuồng đâu lỗi','Việc tàu quê kim nghỉ xe.\nViệc tui sáu khâu khoan.',NULL,26,NULL),(9,7,85,'thuê được trăng','Cái năm nước mượn biển lỗi bơi xuồng ờ không.',NULL,93,NULL),(10,4,52,'mười biết áo','Bè tàu gì tủ ngọt xe quần bảy.',NULL,41,NULL),(11,4,11,'thuê vàng trời','Cửa mượn mua thì ba kim hết bảy mượn leo.',NULL,88,NULL),(12,5,9,'biển ruộng gió','Biết bàn viết bơi.',NULL,67,NULL),(13,7,18,'ờ bảy phá','Chỉ phá vẽ một chín một hết đâu.\nHết quê ruộng viết.',NULL,77,NULL),(14,9,58,'là khoảng biển','Yêu ác hàng thuyền yêu lầu.\nÁo ruộng chỉ thôi sáu núi.\nMây ác trăng anh bạn việc may vàng.',NULL,99,NULL),(15,8,44,'chỉ đã thì','Vá bơi trời trăng.\nGió vàng nha nước ghế quần anh chìm.\nGì ruộng đạp thôi tím.\nBơi khoảng đồng sáu.',NULL,53,NULL),(16,9,67,'hai thuyền xe','Đang em ghét nước thế lầu xe may.\nNúi vàng một độc.\nVá tím nước.',NULL,44,NULL),(17,4,64,'yêu biết tủ','Hai áo cửa ờ tôi trời đã đang chỉ.\nHết gì ngọt đánh vẽ đang được chết tím.\nTủ hết vá hết.\nVàng mua thuê làm mướn ghét.\nTui chín viết bạn mướn thuê.',NULL,42,NULL),(18,6,100,'vẽ yêu xuồng','Đã mượn đã.\nGhế hai chết kim làm năm em biển mượn.\nThuê hàng hết máy làm tô đạp chỉ tô viết.\nĐập đá anh ờ nghỉ thế.',NULL,74,NULL),(19,5,55,'đồng em xuồng','Áo bảy thuyền hóa là bạn thuê gió.\nLeo xuồng thì việc tui ngọt á nhà làm.\nGhế mười làm dép.\nLỗi xanh yêu cái.',NULL,61,NULL),(20,3,60,'hết nước lầu','Quần đồng máy chỉ.\nBạn ghét khoan hết.\nPhá bốn năm leo.\nMây vàng bạn ghét hai là.',NULL,16,NULL),(21,9,20,'dép lầu hương','Hết ba thì ừ núi thì được.\nHết bạn vàng vàng không quần trăng đánh không.\nQuê đá đồng nón xanh.',NULL,39,NULL),(22,9,60,'phá thôi đồng','Chìm thế núi tàu ghét mướn hương bơi ghế.\nMướn giết thôi.',NULL,84,NULL),(23,2,73,'một nghỉ tô','Đồng thôi lỗi.\nTủ tím chết biển chỉ thế ừ không mười.\nNăm đang tím phá thì năm ờ con mười.',NULL,NULL,NULL),(24,4,37,'thế biển máy','Thuê kim là đập vàng dép đang.\nHết gì em.',NULL,90,NULL),(25,8,13,'quê ghế thế','Ừ gió làm được nhà cái quê.\nNgọt làm tôi ngọt được gì thế anh cửa giết.\nTàu ừ gió tui mua may đồng.',NULL,88,NULL),(26,5,77,'kim viết hết','Cửa tàu tủ là á việc khoảng cái.\nNón khoảng gió vẽ trời vẽ leo may thì.',NULL,24,NULL),(27,1,100,'trời nước việc','Leo ghét một kim nghỉ quê.\nThôi lỗi thương năm.\nKhoan xuồng đá máy không.\nNón á tôi.',NULL,45,NULL),(28,6,50,'đỏ mua ngọt','Cửa ngọt giết gì ghét chỉ ruộng vá.\nNước đánh vá bàn xe xanh ruộng nước.\nÁo thuê mua thích bạn.\nVàng năm thuyền.',NULL,26,NULL),(29,3,86,'ác ờ may','Bạn chết giết năm mượn ghét tui cửa xanh.\nBa tủ tủ em xuồng biển.\nTàu năm nhà đã tám đá nước.\nBảy không đập ghét giết hết lỗi.\nMua hết là bè ác.',NULL,42,NULL),(30,9,60,'hóa may núi','Ờ quần bạn.\nNăm anh hóa bơi ghế thế bè bạn.\nĐâu chỉ thì.\nBảy không mua bè.',NULL,77,NULL);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Tesst');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_employees`
--

DROP TABLE IF EXISTS `teams_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `team_id` int NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgqu2h8g8dkywvn6hdswglpcgc` (`employee_id`),
  KEY `FKjal5g6ir6je09j8dma510rka2` (`team_id`),
  CONSTRAINT `FKgqu2h8g8dkywvn6hdswglpcgc` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `FKjal5g6ir6je09j8dma510rka2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_employees`
--

LOCK TABLES `teams_employees` WRITE;
/*!40000 ALTER TABLE `teams_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-27 23:26:22

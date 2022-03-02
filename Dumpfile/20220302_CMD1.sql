-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: cmd
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `cmd`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cmd` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `cmd`;

--
-- Table structure for table `approval_step_details`
--

DROP TABLE IF EXISTS `approval_step_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `approval_step_details` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `approval_step_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_approval_step_details_approval_steps1_idx` (`approval_step_id`),
  KEY `fk_approval_step_details_employees1_idx` (`employee_id`),
  KEY `fk_approval_step_details_departments1_idx` (`department_id`),
  KEY `fk_approval_step_details_positions1_idx` (`position_id`),
  CONSTRAINT `fk_approval_step_details_approval_steps1` FOREIGN KEY (`approval_step_id`) REFERENCES `approval_steps` (`id`),
  CONSTRAINT `fk_approval_step_details_departments1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_approval_step_details_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_approval_step_details_positions1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_step_details`
--

LOCK TABLES `approval_step_details` WRITE;
/*!40000 ALTER TABLE `approval_step_details` DISABLE KEYS */;
INSERT INTO `approval_step_details` VALUES (6,'1','1','1','3','16'),(7,'2','1','2','1','7'),(9,'3','1','1','4','13');
/*!40000 ALTER TABLE `approval_step_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_steps`
--

DROP TABLE IF EXISTS `approval_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `approval_steps` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `approval_step_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `approval_step_index` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `proposal_type_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_approval_steps_proposal_types1_idx` (`proposal_type_id`),
  CONSTRAINT `fk_approval_steps_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_steps`
--

LOCK TABLES `approval_steps` WRITE;
/*!40000 ALTER TABLE `approval_steps` DISABLE KEYS */;
INSERT INTO `approval_steps` VALUES (3,'1','Phê duyệt','1','1'),(4,'2','Kế toán','1','2');
/*!40000 ALTER TABLE `approval_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` tinyint(4) DEFAULT '1',
  `active_flag` tinyint(4) DEFAULT '1',
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `role_id_idx` (`role_id`),
  KEY `fk_menu_auth_idx` (`menu_id`),
  CONSTRAINT `fk_menu_auth` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `fk_role_auth` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `data_types` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (13,'1','Textarea',NULL),(14,'2','Dropdown',NULL),(15,'3','Radio',NULL),(16,'4','Checkbox',NULL),(17,'5','Number',NULL),(18,'6','Calculator',NULL),(19,'7','Relation',NULL),(20,'8','Attachment',NULL),(21,'9','Datetime',NULL),(22,'10','Repeater',NULL),(23,'11','Label',NULL),(24,'12',NULL,NULL);
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `farther_department_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (34,'1','Ban Quản Lý KTX Cỏ May','0','0',NULL,NULL,NULL,NULL),(35,'2','Bảo trì - Bảo dưỡng CSVC KTX','1','0',NULL,NULL,NULL,NULL),(36,'3','Đội sửa chữa','2','0',NULL,NULL,NULL,NULL),(37,'4','Tầng 1','2','0',NULL,NULL,NULL,NULL),(38,'5','Tầng 2','2','0',NULL,NULL,NULL,NULL),(39,'6','Tầng 3','2','0',NULL,NULL,NULL,NULL),(40,'7','Tầng trệt','2','0',NULL,NULL,NULL,NULL),(41,'8','Kiểm tra và giám sát sinh viên','1','0',NULL,NULL,NULL,NULL),(42,'9','Tổ chức sự kiện','1','0',NULL,NULL,NULL,NULL),(43,'10','Truyền thông','1','0',NULL,NULL,NULL,NULL),(44,'11','Sinh viên','1','0',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employees` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_flag` tinyint(4) DEFAULT '1',
  `department_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '"M" or "F"',
  `avatar` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `enable_login` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `FKgy4qe3dnqrm3ktd76sxp7n4c2` (`department_id`),
  CONSTRAINT `FKgy4qe3dnqrm3ktd76sxp7n4c2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (49,'1','Ðức Chính Đoàn','0','ThiHng.Lm77@hotmail.com','0269 0386 9201',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThiHng.Lm77@hotmail.com','cmdcmd',0),(50,'2','Đông Nghi Đoàn','0','PhngTrinh.Bi26@yahoo.com','0249 6226 0641',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','PhngTrinh.Bi26@yahoo.com','cmdcmd',0),(51,'3','Thùy Oanh Mai MD','0','KhnhChi60@yahoo.com','0295 3306 3990',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','KhnhChi60@yahoo.com','cmdcmd',0),(52,'4','Sơn Quyền Hoàng','0','ThoQuyn95@yahoo.com','0252 3525 4277',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThoQuyn95@yahoo.com','cmdcmd',0),(53,'5','Hoài Thương Phùng','0','AnhVit.V@yahoo.com','029 1419 1954',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','AnhVit.V@yahoo.com','cmdcmd',0),(54,'6','Miss Ái Linh Phùng','0','ThanhKiu27@hotmail.com','020 8540 6847',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThanhKiu27@hotmail.com','cmdcmd',0),(55,'7','Ðan Quỳnh Tô','0','HongSa15@yahoo.com','023 1443 4607',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HongSa15@yahoo.com','cmdcmd',0),(56,'8','Bảo Tín Phùng','0','GiangThin_T@gmail.com','021 8246 3839',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','GiangThin_T@gmail.com','cmdcmd',0),(57,'9','Phước Bình Phạm','0','HongHip_Phm@yahoo.com','0223 8350 5531',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HongHip_Phm@yahoo.com','cmdcmd',0),(58,'10','Diễm Trinh Trần','0','HongNgn_Nguyn@gmail.com','021 0099 0911',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HongNgn_Nguyn@gmail.com','cmdcmd',0),(59,'11','Quang Dương Lý','0','XunHiu.Lm@yahoo.com','0239 4500 2897',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','XunHiu.Lm@yahoo.com','cmdcmd',0),(60,'12','Dr. Thanh Tuyết Trần','0','ThuVit_inh78@yahoo.com','0209 6015 8608',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThuVit_inh78@yahoo.com','cmdcmd',0),(61,'13','Hồ Nam Hoàng','0','XunQu8@hotmail.com','020 0696 7709',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','XunQu8@hotmail.com','cmdcmd',0),(62,'14','Thiếu Anh Đào','0','KinBnh89@hotmail.com','0203 1346 1053',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','KinBnh89@hotmail.com','cmdcmd',0),(63,'15','Minh Mẫn Đoàn','0','Hunh.Phan30@yahoo.com','021 4694 2150',NULL,NULL,NULL,NULL,NULL,1,'7',NULL,'https://i.imgur.com/bFbOCtQ.jpg','Hunh.Phan30@yahoo.com','cmdcmd',0),(64,'16','Ðức Quyền Hồ','0','VnNhi_Tng@hotmail.com','024 6837 2044',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','VnNhi_Tng@hotmail.com','cmdcmd',0),(65,'17','Gia Thiện Đinh','0','KimKhuyn.T73@hotmail.com','0283 3870 7783',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','KimKhuyn.T73@hotmail.com','cmdcmd',0),(66,'18','Quỳnh Lâm Lâm IV','0','PhngThanh.Hong@gmail.com','0264 8177 9771',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','PhngThanh.Hong@gmail.com','cmdcmd',0),(67,'19','Ms. Việt Huy Mai','0','TUyn97@hotmail.com','026 2736 7901',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','TUyn97@hotmail.com','cmdcmd',0),(68,'20','Thiện Sinh Vũ','0','Hut.Trng@hotmail.com','026 7170 5151',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','Hut.Trng@hotmail.com','cmdcmd',0),(69,'21','Hương Mai Tăng','0','TunHong40@hotmail.com','0242 4384 0246',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','TunHong40@hotmail.com','cmdcmd',0),(70,'22','Nam An Trương','0','BchTr_Phng11@gmail.com','0272 5099 6423',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','BchTr_Phng11@gmail.com','cmdcmd',0),(71,'23','Ái Linh Mai','0','KimHng.Mai@gmail.com','0255 6369 3736',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','KimHng.Mai@gmail.com','cmdcmd',0),(72,'24','Hồng Nhật Trịnh I','0','ThinKim94@gmail.com','0214 9858 6417',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThinKim94@gmail.com','cmdcmd',0),(73,'25','Bình Dân Vương Sr.','0','CngLc_H@gmail.com','0210 9639 2455',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','CngLc_H@gmail.com','cmdcmd',0),(74,'26','Lương Thiện Phan','0','PhngHoa41@gmail.com','0212 4485 5898',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','PhngHoa41@gmail.com','cmdcmd',0),(75,'27','Phú Ân Dương III','0','DimMy_Dng15@gmail.com','026 2348 6108',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','DimMy_Dng15@gmail.com','cmdcmd',0),(76,'28','Vân Quyên Nguyễn IV','0','PhiNhn31@hotmail.com','026 9359 7959',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','PhiNhn31@hotmail.com','cmdcmd',0),(77,'29','Thế Tường Hồ','0','ChiuPhong_Vng88@hotmail.com','0208 4194 1271',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ChiuPhong_Vng88@hotmail.com','cmdcmd',0),(78,'30','Trúc Lam Tăng DDS','0','HoMi_H72@yahoo.com','023 0200 9314',NULL,NULL,NULL,NULL,NULL,1,'4',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HoMi_H72@yahoo.com','cmdcmd',0),(79,'31','Công Bằng Vương','0','QucTun.Mai@hotmail.com','023 1408 6450',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','QucTun.Mai@hotmail.com','cmdcmd',0),(80,'32','Mrs. Diễm Uyên Tô','0','HngQu_Ng@hotmail.com','0265 2843 3246',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HngQu_Ng@hotmail.com','cmdcmd',0),(81,'33','Miss Đinh Hương Trịnh','0','MHip.Phng21@yahoo.com','029 2829 1524',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','MHip.Phng21@yahoo.com','cmdcmd',0),(82,'34','Ðình Dương Đỗ','0','ngHi29@yahoo.com','0258 2682 3601',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ngHi29@yahoo.com','cmdcmd',0),(83,'35','Mrs. Anh Quân Ngô','0','NgcHuy_V69@hotmail.com','022 1982 7498',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','NgcHuy_V69@hotmail.com','cmdcmd',0),(84,'36','Nam Thông Lý','0','ThcTm11@yahoo.com','020 3561 5187',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThcTm11@yahoo.com','cmdcmd',0),(85,'37','Miss Thanh Thúy Vũ','0','ThiThi.Dng@yahoo.com','0294 5768 6398',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThiThi.Dng@yahoo.com','cmdcmd',0),(86,'38','Ngọc Liên Đào','0','ThanhHoa74@gmail.com','0245 3926 0583',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThanhHoa74@gmail.com','cmdcmd',0),(87,'39','Ms. Long Vịnh Phùng','0','ThuThun_Ng@yahoo.com','027 6713 9007',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThuThun_Ng@yahoo.com','cmdcmd',0),(88,'40','Minh Tân Lê','0','ThchTho.on@hotmail.com','0222 4191 4468',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThchTho.on@hotmail.com','cmdcmd',0),(89,'41','Ngọc Thi Hoàng','0','DuyTn_Hong8@yahoo.com','023 3022 5329',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','DuyTn_Hong8@yahoo.com','cmdcmd',0),(90,'42','Tuyết Hương Lâm','0','ThnhCng55@gmail.com','025 3052 3429',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThnhCng55@gmail.com','cmdcmd',0),(91,'43','Xuân Cung Đào','0','KimLin70@gmail.com','024 9331 2914',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','KimLin70@gmail.com','cmdcmd',0),(92,'44','Bảo Huỳnh Vũ','0','HuTon11@hotmail.com','0211 9197 0241',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HuTon11@hotmail.com','cmdcmd',0),(93,'45','Nhật Hoàng Lý','0','CngHi_T@yahoo.com','0289 7740 2287',NULL,NULL,NULL,NULL,NULL,1,'5',NULL,'https://i.imgur.com/bFbOCtQ.jpg','CngHi_T@yahoo.com','cmdcmd',0),(94,'46','Hồng Ðào Phạm','0','BuChng.Mai@yahoo.com','0292 9362 5626',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','BuChng.Mai@yahoo.com','cmdcmd',0),(95,'47','Tường Vi Lê','0','ThyTin77@hotmail.com','0283 1862 5655',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThyTin77@hotmail.com','cmdcmd',0),(96,'48','Hữu Hiệp Ngô','0','NhtLan.ng@hotmail.com','025 9647 5024',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','NhtLan.ng@hotmail.com','cmdcmd',0),(97,'49','Trân Châu Hà','0','SongLam.Tng22@hotmail.com','0272 1933 9777',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','SongLam.Tng22@hotmail.com','cmdcmd',0),(98,'50','Tuấn Khải Tăng','0','HongDu_H16@yahoo.com','0274 0084 2384',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HongDu_H16@yahoo.com','cmdcmd',0),(99,'51','Quốc Hoài Phan','0','QucHi.Tng72@gmail.com','026 5716 7339',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','QucHi.Tng72@gmail.com','cmdcmd',0),(100,'52','Đan Thư Hoàng','0','HngChi_Tng14@yahoo.com','024 9037 8913',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HngChi_Tng14@yahoo.com','cmdcmd',0),(101,'53','Trung Anh Dương','0','nhTrung.o75@hotmail.com','0238 6394 3809',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','nhTrung.o75@hotmail.com','cmdcmd',0),(102,'54','Hoàng Xuân Đinh','0','cTu.Trn78@yahoo.com','0273 5542 8124',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','cTu.Trn78@yahoo.com','cmdcmd',0),(103,'55','Hoàng Việt Lâm','0','BchChiu33@yahoo.com','0291 0305 8252',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','BchChiu33@yahoo.com','cmdcmd',0),(104,'56','Cát Uy Đào Jr.','0','TngLinh32@gmail.com','0243 4271 7880',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','TngLinh32@gmail.com','cmdcmd',0),(105,'57','Gia Huy Bùi','0','KhiTm.Tng26@gmail.com','0239 4644 7267',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','KhiTm.Tng26@gmail.com','cmdcmd',0),(106,'58','Thanh Tùng Hồ','0','HnhTho97@gmail.com','0200 6241 9910',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HnhTho97@gmail.com','cmdcmd',0),(107,'59','Bá Thịnh Hồ','0','LongGiang.H@gmail.com','024 0370 9248',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','LongGiang.H@gmail.com','cmdcmd',0),(108,'60','Lan Vy Vũ','0','ChThnh.Phan@gmail.com','024 0866 1214',NULL,NULL,NULL,NULL,NULL,1,'6',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ChThnh.Phan@gmail.com','cmdcmd',0),(109,'61','Cẩm Thúy Phan','0','ThanhTuyt.Vng@hotmail.com','0285 5317 5830',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThanhTuyt.Vng@hotmail.com','cmdcmd',0),(110,'62','Mrs. Xuân Loan Vương','0','TrngSinh_L49@gmail.com','025 9684 7733',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','TrngSinh_L49@gmail.com','cmdcmd',0),(111,'63','Bạch Yến Lâm','0','KhuTrung_Phm@hotmail.com','025 8104 5074',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','KhuTrung_Phm@hotmail.com','cmdcmd',0),(112,'64','Hồng Thư Phạm','0','ThiDng_H@hotmail.com','0230 2764 7371',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThiDng_H@hotmail.com','cmdcmd',0),(113,'65','Công Giang Phùng','0','Anho31@gmail.com','026 7227 5725',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','Anho31@gmail.com','cmdcmd',0),(114,'66','Kim Thu Tô','0','Bnh.Bi69@gmail.com','0204 1159 6475',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','Bnh.Bi69@gmail.com','cmdcmd',0),(115,'67','Xuân Vũ Vương','0','ThinThanh16@yahoo.com','0235 1191 3308',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThinThanh16@yahoo.com','cmdcmd',0),(116,'68','Việt Khôi Ngô','0','CngNgh.ng36@hotmail.com','024 6593 9969',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','CngNgh.ng36@hotmail.com','cmdcmd',0),(117,'69','Kim Hoàng Hồ','0','BchDuyn_Ng41@hotmail.com','0235 0962 8878',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','BchDuyn_Ng41@hotmail.com','cmdcmd',0),(118,'70','Mai Vy Phạm','0','KhiH.Dng59@hotmail.com','024 8400 8120',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','KhiH.Dng59@hotmail.com','cmdcmd',0),(119,'71','Gia Huấn Hoàng','0','XunTho.o0@gmail.com','0216 6095 7658',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','XunTho.o0@gmail.com','cmdcmd',0),(120,'72','Mỹ Dung Tô','0','NguytH58@yahoo.com','0265 6242 7634',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','NguytH58@yahoo.com','cmdcmd',0),(121,'73','Ngọc Lâm Đào','0','HipHa.H@hotmail.com','027 0435 7587',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HipHa.H@hotmail.com','cmdcmd',0),(122,'74','Hồng Đăng Đào','0','ThanhUyn61@yahoo.com','0287 2248 1031',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThanhUyn61@yahoo.com','cmdcmd',0),(123,'75','Viễn Thông Bùi','0','cSiu.Hong@yahoo.com','022 2068 2796',NULL,NULL,NULL,NULL,NULL,1,'1',NULL,'https://i.imgur.com/bFbOCtQ.jpg','cSiu.Hong@yahoo.com','cmdcmd',0),(124,'76','Uyên Minh Dương','0','TunDng12@gmail.com','029 7980 6994',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','TunDng12@gmail.com','cmdcmd',0),(125,'77','Tú Uyên Phạm','0','NgcT.Mai@gmail.com','0229 7909 6001',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','NgcT.Mai@gmail.com','cmdcmd',0),(126,'78','Tuấn Khanh Mai','0','LanTrc89@hotmail.com','0277 8413 0917',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','LanTrc89@hotmail.com','cmdcmd',0),(127,'79','Phượng Tiên Bùi','0','TunVit_@yahoo.com','020 5928 2380',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','TunVit_@yahoo.com','cmdcmd',0),(128,'80','Nghi Dung Trịnh','0','ChDng.Lm@yahoo.com','0229 8130 7189',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ChDng.Lm@yahoo.com','cmdcmd',0),(129,'81','Thy Vân Dương','0','QucThng_L@yahoo.com','0295 2213 2383',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','QucThng_L@yahoo.com','cmdcmd',0),(130,'82','Bích Hợp Phan','0','ThinTin.o@yahoo.com','0294 3870 9672',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThinTin.o@yahoo.com','cmdcmd',0),(131,'83','Quốc Hòa Đào','0','DimPhc_L@hotmail.com','0246 5833 8953',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','DimPhc_L@hotmail.com','cmdcmd',0),(132,'84','Tường Lân Đỗ','0','AnhTh_V84@hotmail.com','0287 3004 3561',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','AnhTh_V84@hotmail.com','cmdcmd',0),(133,'85','Lâm Tuyền Đặng','0','TunLinh_Trn3@yahoo.com','0237 0462 2404',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','TunLinh_Trn3@yahoo.com','cmdcmd',0),(134,'86','Thanh Vy Tăng','0','ThyGiang79@gmail.com','021 9707 3489',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThyGiang79@gmail.com','cmdcmd',0),(135,'87','Hiệp Dinh Tô','0','ThyNgc63@yahoo.com','029 8274 0835',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThyNgc63@yahoo.com','cmdcmd',0),(136,'88','Hoàn Châu Tăng','0','HuKhi.V29@gmail.com','0225 7332 3621',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HuKhi.V29@gmail.com','cmdcmd',0),(137,'89','Như Ý Hồ','0','NgcHnh48@yahoo.com','022 1755 2052',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','NgcHnh48@yahoo.com','cmdcmd',0),(138,'90','Huy Lĩnh Vũ DDS','0','cTu34@yahoo.com','0269 7288 4811',NULL,NULL,NULL,NULL,NULL,1,'3',NULL,'https://i.imgur.com/bFbOCtQ.jpg','cTu34@yahoo.com','cmdcmd',0),(139,'91','Mrs. Duy Hạnh Phan','0','HuynAnh.Phm50@yahoo.com','027 4688 3421',NULL,NULL,NULL,NULL,NULL,1,'8',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HuynAnh.Phm50@yahoo.com','cmdcmd',0),(140,'92','Trúc Phương Lâm','0','TSng86@hotmail.com','020 4040 6390',NULL,NULL,NULL,NULL,NULL,1,'8',NULL,'https://i.imgur.com/bFbOCtQ.jpg','TSng86@hotmail.com','cmdcmd',0),(141,'93','Mrs. Hương Lan Đào','0','XunHnh_inh@gmail.com','0212 0465 7976',NULL,NULL,NULL,NULL,NULL,1,'8',NULL,'https://i.imgur.com/bFbOCtQ.jpg','XunHnh_inh@gmail.com','cmdcmd',0),(142,'94','Diệu Hiền Lâm','0','ThinLam_Trnh@hotmail.com','023 0409 4839',NULL,NULL,NULL,NULL,NULL,1,'8',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThinLam_Trnh@hotmail.com','cmdcmd',0),(143,'95','Phương Loan Trần','0','GiaPhong32@gmail.com','0212 9601 9964',NULL,NULL,NULL,NULL,NULL,1,'8',NULL,'https://i.imgur.com/bFbOCtQ.jpg','GiaPhong32@gmail.com','cmdcmd',0),(144,'96','Cường Dũng Tô','0','VitKhu20@yahoo.com','0226 6701 9725',NULL,NULL,NULL,NULL,NULL,1,'8',NULL,'https://i.imgur.com/bFbOCtQ.jpg','VitKhu20@yahoo.com','cmdcmd',0),(145,'97','Chiêu Dương Ngô','0','HngLy_@hotmail.com','028 2471 6127',NULL,NULL,NULL,NULL,NULL,1,'8',NULL,'https://i.imgur.com/bFbOCtQ.jpg','HngLy_@hotmail.com','cmdcmd',0),(146,'98','Trí Hào Vương','0','ThinLng.V8@yahoo.com','020 3229 3891',NULL,NULL,NULL,NULL,NULL,1,'8',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThinLng.V8@yahoo.com','cmdcmd',0),(147,'99','Ngọc Hạnh Tô','0','ThanhHng.Trng@yahoo.com','0259 2042 0175',NULL,NULL,NULL,NULL,NULL,1,'8',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThanhHng.Trng@yahoo.com','cmdcmd',0),(148,'100','Thiên An Đỗ','0','ThAnh80@hotmail.com','022 5307 4482',NULL,NULL,NULL,NULL,NULL,1,'8',NULL,'https://i.imgur.com/bFbOCtQ.jpg','ThAnh80@hotmail.com','cmdcmd',0);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menu` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_index` int(11) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `options` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (27,'1','Hợp đồng kinh tế'),(28,'2','Hợp đồng'),(29,'3','Cảnh báo/nhắc nhở'),(30,'4','Thiết bị'),(31,'5','Phụ tùng'),(33,'6','Cảm biến'),(34,'8','Cảm biến'),(35,'9','Danh mục'),(36,'10','Danh mục kiểm tra'),(37,'11','Công việc'),(38,'12','Đề xuất'),(39,'13','Loại đề xuất'),(40,'14','Nhân viên'),(41,'15','Phòng ban'),(42,'16','Chức vụ'),(43,'17','Kho'),(44,'18','Vai trò'),(45,'19','Báo cáo'),(46,'20','Khách hàng'),(47,'21','Người dùng'),(48,'22','Chức năng công ty'),(49,'23','Thẻ'),(50,'24','Phân loại khách hàng'),(51,'25','Sản phẩm'),(52,'26','Sản phẩm');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `permissions` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (8,'1','Xem'),(9,'2','Tạo'),(10,'3','Sửa'),(11,'4','Xoá'),(12,'5','Xem hết'),(13,'6','Sửa hết'),(14,'7','Xoá hết');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `positions` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_manager` tinyint(4) DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `team_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_chucvu_phongban1_idx` (`department_id`),
  KEY `fk_positions_teams1_idx` (`team_id`),
  KEY `fk_role_position_idx` (`role_id`),
  CONSTRAINT `fk_chucvu_phongban1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_positions_teams1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `fk_role_position` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (40,'1','Thành viên ban quản lý KTX','1',1,NULL,NULL,NULL,NULL,NULL,'1'),(41,'2','Giám thị','1',0,NULL,NULL,NULL,NULL,NULL,'2'),(42,'3','Kế toán','1',0,NULL,NULL,NULL,NULL,NULL,'3'),(43,'4','Trưởng đội 1','2',1,NULL,NULL,NULL,NULL,NULL,'4'),(44,'5','Thành viên','3',0,NULL,NULL,NULL,NULL,NULL,'5'),(45,'6','Thành viên','4',0,NULL,NULL,NULL,NULL,NULL,'5'),(46,'7','Trưởng tầng 1','4',1,NULL,NULL,NULL,NULL,NULL,'6'),(47,'8','Trưởng phòng sinh viên tầng 1','4',0,NULL,NULL,NULL,NULL,NULL,'5'),(48,'9','Thành viên','5',0,NULL,NULL,NULL,NULL,NULL,'5'),(49,'10','Trưởng tầng 2','5',1,NULL,NULL,NULL,NULL,NULL,'6'),(50,'11','Trưởng phòng sinh viên tầng 2','5',0,NULL,NULL,NULL,NULL,NULL,'5'),(51,'12','Thành viên','6',0,NULL,NULL,NULL,NULL,NULL,'5'),(52,'13','Trưởng tầng 3','6',1,NULL,NULL,NULL,NULL,NULL,'6'),(53,'14','Trưởng phòng sinh viên tầng 3','6',0,NULL,NULL,NULL,NULL,NULL,'5'),(54,'15','Thành viên','7',0,NULL,NULL,NULL,NULL,NULL,'5'),(55,'16','Trưởng tầng trệt','7',1,NULL,NULL,NULL,NULL,NULL,'6'),(56,'17','Trưởng phòng sinh viên tầng trệt','7',0,NULL,NULL,NULL,NULL,NULL,'5'),(57,'18','Thành viên','8',0,NULL,NULL,NULL,NULL,NULL,'5'),(58,'19','Trưởng đội 2','8',1,NULL,NULL,NULL,NULL,NULL,'7');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_employees`
--

DROP TABLE IF EXISTS `positions_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `positions_employees` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `employee_id` (`employee_id`,`position_id`),
  KEY `fk_employees_has_positions_positions1_idx` (`position_id`),
  KEY `fk_employees_has_positions_employees1_idx` (`employee_id`),
  CONSTRAINT `fk_employees_has_positions_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_employees_has_positions_positions1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=666 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_employees`
--

LOCK TABLES `positions_employees` WRITE;
/*!40000 ALTER TABLE `positions_employees` DISABLE KEYS */;
INSERT INTO `positions_employees` VALUES (133,'1','15'),(88,'1','17'),(127,'10','15'),(128,'11','15'),(129,'12','15'),(130,'13','15'),(131,'14','15'),(132,'15','15'),(231,'16','6'),(141,'16','8'),(232,'17','6'),(233,'18','6'),(234,'19','6'),(134,'2','15'),(235,'20','6'),(236,'21','6'),(237,'22','6'),(238,'23','6'),(239,'24','6'),(240,'25','6'),(241,'26','6'),(242,'27','6'),(243,'28','6'),(244,'29','6'),(135,'3','15'),(245,'30','6'),(246,'31','11'),(336,'31','9'),(337,'32','9'),(338,'33','9'),(339,'34','9'),(340,'35','9'),(341,'36','9'),(342,'37','9'),(343,'38','9'),(344,'39','9'),(136,'4','15'),(345,'40','9'),(346,'41','9'),(347,'42','9'),(348,'43','9'),(349,'44','9'),(350,'45','9'),(441,'46','12'),(351,'46','14'),(442,'47','12'),(443,'48','12'),(444,'49','12'),(137,'5','15'),(445,'50','12'),(446,'51','12'),(447,'52','12'),(448,'53','12'),(449,'54','12'),(450,'55','12'),(451,'56','12'),(452,'57','12'),(453,'58','12'),(454,'59','12'),(138,'6','15'),(455,'60','12'),(546,'61','1'),(547,'62','1'),(548,'63','1'),(549,'64','1'),(550,'65','1'),(551,'66','1'),(552,'67','1'),(553,'68','1'),(554,'69','1'),(139,'7','15'),(555,'70','1'),(556,'71','1'),(557,'72','1'),(558,'73','1'),(559,'74','1'),(560,'75','1'),(651,'76','5'),(652,'77','5'),(653,'78','5'),(654,'79','5'),(140,'8','15'),(655,'80','5'),(656,'81','5'),(657,'82','5'),(658,'83','5'),(659,'84','5'),(660,'85','5'),(661,'86','5'),(662,'87','5'),(663,'88','5'),(664,'89','5'),(126,'9','15'),(665,'90','5');
/*!40000 ALTER TABLE `positions_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_details`
--

DROP TABLE IF EXISTS `proposal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal_details` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_detail_index` int(11) DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_proposal_details_proposals1_idx` (`proposal_id`),
  CONSTRAINT `fk_proposal_details_proposals1` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_details`
--

LOCK TABLES `proposal_details` WRITE;
/*!40000 ALTER TABLE `proposal_details` DISABLE KEYS */;
INSERT INTO `proposal_details` VALUES (56,'2','1',NULL,'Ghét kim tám việc.',NULL,NULL,NULL,NULL,'1'),(60,'3','2',NULL,'Tàu chỉ làm biển em leo bốn tám.',NULL,NULL,NULL,NULL,'1'),(64,'4','3',NULL,'Đồng gió tàu cái khoan khoan nhà.',NULL,NULL,NULL,NULL,'1'),(68,'5','4',NULL,'Độc trời bạn giết giày đã thích.',NULL,NULL,NULL,NULL,'1'),(72,'6','5',NULL,'Thế thế lỗi không không con cửa bốn.',NULL,NULL,NULL,NULL,'1'),(76,'7','6',NULL,'Khoan mười núi dép may chỉ độc áo.',NULL,NULL,NULL,NULL,'1'),(80,'8','7',NULL,'Tám xanh vá biển việc giày leo thế mười đang.',NULL,NULL,NULL,NULL,'1'),(84,'9','8',NULL,'Yêu đập máy bốn kim biết tàu.',NULL,NULL,NULL,NULL,'1'),(88,'10','9',NULL,'Ờ ghế tủ ờ hàng được hết kim bè chín.',NULL,NULL,NULL,NULL,'1'),(92,'11','10',NULL,'Chìm gì đang đạp may đỏ được lỗi đâu giết.',NULL,NULL,NULL,NULL,'1'),(96,'12','11',NULL,'Chỉ thích máy ba xuồng đập.',NULL,NULL,NULL,NULL,'1'),(100,'13','12',NULL,'Ác đâu đập ruộng làm.',NULL,NULL,NULL,NULL,'1'),(104,'14','13',NULL,'Anh làm chết tô xe chín đang vẽ giết.',NULL,NULL,NULL,NULL,'1'),(108,'15','14',NULL,'Nhà xe mười may viết.',NULL,NULL,NULL,NULL,'1'),(112,'16','15',NULL,'Đã trăng chìm.',NULL,NULL,NULL,NULL,'1'),(116,'17','16',NULL,'Hết vá nghỉ bạn thuyền.',NULL,NULL,NULL,NULL,'1'),(120,'18','17',NULL,'Cửa đánh chết ờ chín.',NULL,NULL,NULL,NULL,'1'),(124,'19','18',NULL,'Yêu áo mượn độc bè.',NULL,NULL,NULL,NULL,'1'),(128,'20','19',NULL,'Tô đá chín con việc máy vá thuyền.',NULL,NULL,NULL,NULL,'1'),(132,'21','20',NULL,'Leo máy khoảng nhà một ghế.',NULL,NULL,NULL,NULL,'1'),(136,'22','21',NULL,'Nha cái cái.',NULL,NULL,NULL,NULL,'1'),(140,'23','22',NULL,'Tàu ừ núi đá bơi chìm thuyền máy nước thì.',NULL,NULL,NULL,NULL,'1'),(144,'24','23',NULL,'Bè tủ máy thế khâu cái khoan tôi.',NULL,NULL,NULL,NULL,'1'),(148,'25','24',NULL,'Dép bơi ruộng bạn lầu ừ giày ba mua.',NULL,NULL,NULL,NULL,'1'),(152,'26','25',NULL,'Bạn hàng việc đá may bơi tàu.',NULL,NULL,NULL,NULL,'1'),(156,'27','26',NULL,'Khâu đỏ tô.',NULL,NULL,NULL,NULL,'1'),(160,'28','27',NULL,'Chìm hóa hóa ghét.',NULL,NULL,NULL,NULL,'1'),(164,'29','28',NULL,'Mười hết tôi tui bảy thì tô khoảng hết vàng.',NULL,NULL,NULL,NULL,'1'),(168,'30','29',NULL,'Anh hàng hàng được đâu ngọt thì mượn biết lầu.',NULL,NULL,NULL,NULL,'1'),(172,'31','30',NULL,'Tô bốn năm mướn.',NULL,NULL,NULL,NULL,'1'),(173,'32','30',NULL,'Yêu thuyền bè may bốn chìm mướn nghỉ khâu cửa.\nThì yêu mua đỏ giết đâu mua khâu ruộng.\nGhét thích may nón cái.\nTôi bảy mười tủ bè chỉ núi thôi đồng.\nThích đá thuyền thuyền một thương ghét hết anh.',NULL,NULL,NULL,NULL,'2'),(174,'33','30',NULL,'4668',NULL,NULL,NULL,NULL,'3'),(175,'34','30',NULL,'Cửa bảy nghỉ máy.',NULL,NULL,NULL,NULL,'4');
/*!40000 ALTER TABLE `proposal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_type_details`
--

DROP TABLE IF EXISTS `proposal_type_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal_type_details` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_type_index` int(11) DEFAULT NULL,
  `field_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_type_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `proposal_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_type_details_data_types1_idx` (`data_type_id`),
  KEY `FKdvba7s6h0uitxnu1rh5vm2r1r` (`proposal_type_id`),
  CONSTRAINT `FKdvba7s6h0uitxnu1rh5vm2r1r` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`),
  CONSTRAINT `fk_type_details_data_types1` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_type_details`
--

LOCK TABLES `proposal_type_details` WRITE;
/*!40000 ALTER TABLE `proposal_type_details` DISABLE KEYS */;
INSERT INTO `proposal_type_details` VALUES (9,'1',NULL,'Mục đích/Lý do','1',NULL,NULL,NULL,NULL,NULL,'1'),(10,'2',NULL,'Tình trạng hư hỏng','2',NULL,NULL,NULL,NULL,NULL,'1'),(11,'3',NULL,'Số phòng','1',NULL,NULL,NULL,NULL,NULL,'1'),(12,'4',NULL,'Ghi chú','2',NULL,NULL,NULL,NULL,NULL,'1'),(13,'5',NULL,'Mục đích/Lý do','1',NULL,NULL,NULL,NULL,NULL,'2'),(14,'6',NULL,'Tên vật tư','1',NULL,NULL,NULL,NULL,NULL,'2'),(15,'7',NULL,'Số lượng','1',NULL,NULL,NULL,NULL,NULL,'2'),(16,'8',NULL,'Đơn gía','1',NULL,NULL,NULL,NULL,NULL,'2');
/*!40000 ALTER TABLE `proposal_type_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_types`
--

DROP TABLE IF EXISTS `proposal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal_types` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_flag` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_types`
--

LOCK TABLES `proposal_types` WRITE;
/*!40000 ALTER TABLE `proposal_types` DISABLE KEYS */;
INSERT INTO `proposal_types` VALUES (3,'1','Đăng ký sửa chữa',1),(4,'2','Đề xuất mua hàng',1);
/*!40000 ALTER TABLE `proposal_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposals`
--

DROP TABLE IF EXISTS `proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposals` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_type_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `creator_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_dexuat_TrangThai1_idx` (`status_id`),
  KEY `fk_proposals_proposal_types1_idx` (`proposal_type_id`),
  KEY `fk_proposals_employees1_idx` (`creator_id`),
  CONSTRAINT `fk_dexuat_TrangThai1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `fk_proposals_employees1` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_proposals_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals`
--

LOCK TABLES `proposals` WRITE;
/*!40000 ALTER TABLE `proposals` DISABLE KEYS */;
INSERT INTO `proposals` VALUES (53,'1','1','45','1'),(54,'2','1','54','1'),(55,'3','1','75','1'),(56,'4','1','15','1'),(57,'5','1','48','1'),(58,'6','1','19','1'),(59,'7','1','9','1'),(60,'8','1','10','1'),(61,'9','1','66','1'),(62,'10','1','22','1'),(63,'11','1','75','1'),(64,'12','1','17','1'),(65,'13','1','10','1'),(66,'14','1','17','1'),(67,'15','1','72','1'),(68,'16','1','38','1'),(69,'17','1','47','1'),(70,'18','1','69','1'),(71,'19','1','32','1'),(72,'20','1','41','1'),(73,'21','1','19','1'),(74,'22','1','75','1'),(75,'23','1','75','1'),(76,'24','1','66','1'),(77,'25','1','8','1'),(78,'26','1','47','1'),(79,'27','1','37','1'),(80,'28','1','69','1'),(81,'29','1','5','1'),(82,'30','1','23','1');
/*!40000 ALTER TABLE `proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposals_permissions`
--

DROP TABLE IF EXISTS `proposals_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposals_permissions` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_type_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_proposal_permissions_proposal_types1_idx` (`proposal_type_id`),
  KEY `fk_proposal_permissions_departments1_idx` (`department_id`),
  KEY `fk_proposal_permissions_positions1_idx` (`position_id`),
  KEY `fk_proposal_permissions_employees1_idx` (`employee_id`),
  CONSTRAINT `fk_proposal_permissions_departments1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_proposal_permissions_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_proposal_permissions_positions1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `fk_proposal_permissions_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals_permissions`
--

LOCK TABLES `proposals_permissions` WRITE;
/*!40000 ALTER TABLE `proposals_permissions` DISABLE KEYS */;
INSERT INTO `proposals_permissions` VALUES (9,'1','2','5','1','41'),(10,'2','2','1','3','43');
/*!40000 ALTER TABLE `proposals_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_details`
--

DROP TABLE IF EXISTS `role_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role_details` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `option_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `permission_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_role_details_options1_idx` (`option_id`),
  KEY `fk_role_details_roles1_idx` (`role_id`),
  KEY `fk_role_details_permissions1_idx` (`permission_id`),
  CONSTRAINT `fk_role_details_options1` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`),
  CONSTRAINT `fk_role_details_permissions1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `fk_role_details_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_details`
--

LOCK TABLES `role_details` WRITE;
/*!40000 ALTER TABLE `role_details` DISABLE KEYS */;
INSERT INTO `role_details` VALUES (37,'1','11','5','1',NULL,NULL,NULL,NULL),(38,'2','11','5','2',NULL,NULL,NULL,NULL),(39,'3','11','5','3',NULL,NULL,NULL,NULL),(40,'4','11','5','4',NULL,NULL,NULL,NULL),(41,'5','12','5','1',NULL,NULL,NULL,NULL),(42,'6','12','5','2',NULL,NULL,NULL,NULL),(43,'7','12','5','3',NULL,NULL,NULL,NULL),(44,'8','12','5','4',NULL,NULL,NULL,NULL),(45,'9','14','5','1',NULL,NULL,NULL,NULL),(46,'10','15','5','1',NULL,NULL,NULL,NULL),(47,'11','11','4','1',NULL,NULL,NULL,NULL),(48,'12','11','4','2',NULL,NULL,NULL,NULL),(49,'13','11','4','3',NULL,NULL,NULL,NULL),(50,'14','11','4','4',NULL,NULL,NULL,NULL),(51,'15','11','4','5',NULL,NULL,NULL,NULL),(52,'16','11','4','6',NULL,NULL,NULL,NULL),(53,'17','12','4','1',NULL,NULL,NULL,NULL),(54,'18','12','4','2',NULL,NULL,NULL,NULL),(55,'19','12','4','3',NULL,NULL,NULL,NULL),(56,'20','12','4','4',NULL,NULL,NULL,NULL),(57,'21','12','4','5',NULL,NULL,NULL,NULL),(58,'22','12','4','6',NULL,NULL,NULL,NULL),(59,'23','14','4','1',NULL,NULL,NULL,NULL),(60,'24','15','4','1',NULL,NULL,NULL,NULL),(61,'25','16','4','1',NULL,NULL,NULL,NULL),(62,'26','11','6','1',NULL,NULL,NULL,NULL),(63,'27','11','6','2',NULL,NULL,NULL,NULL),(64,'28','11','6','3',NULL,NULL,NULL,NULL),(65,'29','11','6','4',NULL,NULL,NULL,NULL),(66,'30','12','6','1',NULL,NULL,NULL,NULL),(67,'31','12','6','2',NULL,NULL,NULL,NULL),(68,'32','12','6','3',NULL,NULL,NULL,NULL),(69,'33','12','6','4',NULL,NULL,NULL,NULL),(70,'34','14','6','1',NULL,NULL,NULL,NULL),(71,'35','15','6','1',NULL,NULL,NULL,NULL),(72,'36','16','6','1',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `FKrg8eactfnoo2fias560gvgou6` (`position_id`),
  CONSTRAINT `FKrg8eactfnoo2fias560gvgou6` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (8,'1','Điều hành các hoạt động của KTX',NULL),(9,'2','Duyệt các đề xuất nghỉ phép của sinh viên',NULL),(10,'3','Giải quyết các vấn đề tiền ăn và học phí',NULL),(11,'4','Quản lý cơ sở vật chất, an ninh KTX',NULL),(12,'5','Sinh viên',NULL),(13,'6','Nhận đề xuất và thực hiện sửa chữa hư hỏng cho các phòng',NULL),(14,'7','Quản lý, chấm điểm rèn luyện cho SV và điểm danh SV',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `statuses` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (10,'1','Hoàn tất'),(11,'2','Bị từ chối'),(12,'3','Đã huỷ'),(13,'4','Mới'),(14,'5','Đang làm'),(15,'6','Chờ xác nhận'),(16,'7','Hoàn thành'),(17,'8','Quá hạn'),(18,'9',NULL);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_his`
--

DROP TABLE IF EXISTS `task_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task_his` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  KEY `fk_task_task_his_idx` (`task_id`),
  KEY `fk_status_task_his_idx` (`status_id`),
  KEY `fk_emp_task_his_idx` (`receiver_id`),
  CONSTRAINT `fk_emp_task_his` FOREIGN KEY (`receiver_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_status_task_his` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `fk_task_task_his` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_his`
--

LOCK TABLES `task_his` WRITE;
/*!40000 ALTER TABLE `task_his` DISABLE KEYS */;
INSERT INTO `task_his` VALUES (1,'1','9','46'),(2,'2','2','24'),(3,'3','5','72'),(4,'4','4','7'),(5,'5','4','35'),(6,'6','8','79'),(7,'7','4','9'),(8,'8','8','26'),(9,'9','7','93'),(10,'10','4','41'),(11,'11','4','88'),(12,'12','5','67'),(13,'13','7','77'),(14,'14','9','99'),(15,'15','8','53'),(16,'16','9','44'),(17,'17','4','42'),(18,'18','6','74'),(19,'19','5','61'),(20,'20','3','16'),(21,'21','9','39'),(22,'22','9','84'),(23,'23','2','2'),(24,'24','4','90'),(25,'25','8','88'),(26,'26','5','24'),(27,'27','1','45'),(28,'28','6','26'),(29,'29','3','42'),(30,'30','9','77');
/*!40000 ALTER TABLE `task_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tasks` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `creator_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `finish_date` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_tasks_statuses1_idx` (`status_id`),
  KEY `fk_tasks_employees1_idx` (`creator_id`),
  KEY `fk_tasks_employees2_idx` (`receiver_id`),
  CONSTRAINT `fk_tasks_employees1` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_tasks_employees2` FOREIGN KEY (`receiver_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_tasks_statuses1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (91,'1','9','15','khoan xe nghỉ','Đánh nước làm đã bè xanh thích máy thôi.\nThương mượn áo tôi thuyền độc ghét hết ngọt.',NULL,'46',NULL),(92,'2','2','57','cửa á ác','Được vá không quần.',NULL,'24',NULL),(93,'3','5','4','tủ bè vẽ','Lỗi tám đồng làm mượn.\nKhông đang một mười bàn bảy tôi.\nRuộng áo tô đạp hàng.',NULL,'72',NULL),(94,'4','4','19','đồng hết thôi','Ừ đánh áo được gì thế.\nTám thích mướn tôi bốn việc núi con.\nTui việc cái ừ giày con không.',NULL,'7',NULL),(95,'5','4','43','chín đang may','Thương gì khâu chết dép chết ghét.\nBiển năm nha đập quần.\nViệc bảy vàng nhà dép đạp giày thì.',NULL,'35',NULL),(96,'6','8','8','quê thuê trời','Đá may vẽ cửa không tô ghét.',NULL,'79',NULL),(97,'7','4','88','đập tô tàu','Máy hết ghế leo đỏ hai gió.\nHai yêu xuồng tàu trăng thích đánh mua.\nBiết bè đạp.\nNgọt núi hàng á tui xuồng dép.',NULL,'9',NULL),(98,'8','8','33','xuồng đâu lỗi','Việc tàu quê kim nghỉ xe.\nViệc tui sáu khâu khoan.',NULL,'26',NULL),(99,'9','7','85','thuê được trăng','Cái năm nước mượn biển lỗi bơi xuồng ờ không.',NULL,'93',NULL),(100,'10','4','52','mười biết áo','Bè tàu gì tủ ngọt xe quần bảy.',NULL,'41',NULL),(101,'11','4','11','thuê vàng trời','Cửa mượn mua thì ba kim hết bảy mượn leo.',NULL,'88',NULL),(102,'12','5','9','biển ruộng gió','Biết bàn viết bơi.',NULL,'67',NULL),(103,'13','7','18','ờ bảy phá','Chỉ phá vẽ một chín một hết đâu.\nHết quê ruộng viết.',NULL,'77',NULL),(104,'14','9','58','là khoảng biển','Yêu ác hàng thuyền yêu lầu.\nÁo ruộng chỉ thôi sáu núi.\nMây ác trăng anh bạn việc may vàng.',NULL,'99',NULL),(105,'15','8','44','chỉ đã thì','Vá bơi trời trăng.\nGió vàng nha nước ghế quần anh chìm.\nGì ruộng đạp thôi tím.\nBơi khoảng đồng sáu.',NULL,'53',NULL),(106,'16','9','67','hai thuyền xe','Đang em ghét nước thế lầu xe may.\nNúi vàng một độc.\nVá tím nước.',NULL,'44',NULL),(107,'17','4','64','yêu biết tủ','Hai áo cửa ờ tôi trời đã đang chỉ.\nHết gì ngọt đánh vẽ đang được chết tím.\nTủ hết vá hết.\nVàng mua thuê làm mướn ghét.\nTui chín viết bạn mướn thuê.',NULL,'42',NULL),(108,'18','6','100','vẽ yêu xuồng','Đã mượn đã.\nGhế hai chết kim làm năm em biển mượn.\nThuê hàng hết máy làm tô đạp chỉ tô viết.\nĐập đá anh ờ nghỉ thế.',NULL,'74',NULL),(109,'19','5','55','đồng em xuồng','Áo bảy thuyền hóa là bạn thuê gió.\nLeo xuồng thì việc tui ngọt á nhà làm.\nGhế mười làm dép.\nLỗi xanh yêu cái.',NULL,'61',NULL),(110,'20','3','60','hết nước lầu','Quần đồng máy chỉ.\nBạn ghét khoan hết.\nPhá bốn năm leo.\nMây vàng bạn ghét hai là.',NULL,'16',NULL),(111,'21','9','20','dép lầu hương','Hết ba thì ừ núi thì được.\nHết bạn vàng vàng không quần trăng đánh không.\nQuê đá đồng nón xanh.',NULL,'39',NULL),(112,'22','9','60','phá thôi đồng','Chìm thế núi tàu ghét mướn hương bơi ghế.\nMướn giết thôi.',NULL,'84',NULL),(113,'23','2','73','một nghỉ tô','Đồng thôi lỗi.\nTủ tím chết biển chỉ thế ừ không mười.\nNăm đang tím phá thì năm ờ con mười.',NULL,'2',NULL),(114,'24','4','37','thế biển máy','Thuê kim là đập vàng dép đang.\nHết gì em.',NULL,'90',NULL),(115,'25','8','13','quê ghế thế','Ừ gió làm được nhà cái quê.\nNgọt làm tôi ngọt được gì thế anh cửa giết.\nTàu ừ gió tui mua may đồng.',NULL,'88',NULL),(116,'26','5','77','kim viết hết','Cửa tàu tủ là á việc khoảng cái.\nNón khoảng gió vẽ trời vẽ leo may thì.',NULL,'24',NULL),(117,'27','1','100','trời nước việc','Leo ghét một kim nghỉ quê.\nThôi lỗi thương năm.\nKhoan xuồng đá máy không.\nNón á tôi.',NULL,'45',NULL),(118,'28','6','50','đỏ mua ngọt','Cửa ngọt giết gì ghét chỉ ruộng vá.\nNước đánh vá bàn xe xanh ruộng nước.\nÁo thuê mua thích bạn.\nVàng năm thuyền.',NULL,'26',NULL),(119,'29','3','86','ác ờ may','Bạn chết giết năm mượn ghét tui cửa xanh.\nBa tủ tủ em xuồng biển.\nTàu năm nhà đã tám đá nước.\nBảy không đập ghét giết hết lỗi.\nMua hết là bè ác.',NULL,'42',NULL),(120,'30','9','60','hóa may núi','Ờ quần bạn.\nNăm anh hóa bơi ghế thế bè bạn.\nĐâu chỉ thì.\nBảy không mua bè.',NULL,'77',NULL);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teams` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_employees`
--

DROP TABLE IF EXISTS `teams_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teams_employees` (
  `unique_number` int(11) NOT NULL AUTO_INCREMENT,
  `teams_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `team_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `teams_id` (`teams_id`),
  KEY `fk_teams_has_employees_teams1_idx` (`teams_id`),
  KEY `FKgqu2h8g8dkywvn6hdswglpcgc` (`employee_id`),
  KEY `FKjal5g6ir6je09j8dma510rka2` (`team_id`),
  CONSTRAINT `FKgqu2h8g8dkywvn6hdswglpcgc` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `FKjal5g6ir6je09j8dma510rka2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `fk_teams_has_employees_teams1` FOREIGN KEY (`teams_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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

-- Dump completed on 2022-03-02 23:35:43

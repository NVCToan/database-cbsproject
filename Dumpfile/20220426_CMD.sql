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
  `approval_step_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
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
INSERT INTO `approval_step_details` VALUES (1,1,1,3,16),(2,1,2,1,7),(3,1,3,2,10),(4,1,1,4,13);
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
  `approval_step_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `approval_step_index` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `proposal_type_id` int DEFAULT NULL,
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
  `permission` tinyint NOT NULL DEFAULT '0',
  `active_flag` tinyint NOT NULL DEFAULT '0',
  `create_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `update_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
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
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'Textarea','\"\"'),(2,'Dropdown','\"\"'),(3,'Radio','\"\"'),(4,'Checkbox','\"\"'),(5,'Number','\"\"'),(6,'Calculator','\"\"'),(7,'Relation','\"\"'),(8,'Attachment','\"\"'),(9,'Datetime','\"\"'),(10,'Repeater','\"\"'),(11,'Label','\"\"');
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
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `farther_department_id` int NOT NULL DEFAULT '-1',
  `create_by` int NOT NULL DEFAULT '-1',
  `modify_by` int NOT NULL DEFAULT '-1',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `level` int NOT NULL,
  `head_position` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'1','Ban Quản Lý KTX Cỏ May',-1,-1,-1,'28-03-2022','28-03-2022','test',1,1),(2,'2','Bảo trì - Bảo dưỡng CSVC KTX',1,-1,-1,'28-03-2022','28-03-2022','test',2,4),(3,'3','Đội sửa chữa',2,-1,-1,'28-03-2022','28-03-2022','test',3,5),(4,'4','Tầng 1',2,-1,-1,'28-03-2022','28-03-2022','test',3,7),(5,'5','Tầng 2',2,-1,-1,'28-03-2022','28-03-2022','test',3,10),(6,'6','Tầng 3',2,-1,-1,'28-03-2022','28-03-2022','test',3,13),(7,'7','Tầng trệt',2,-1,-1,'28-03-2022','28-03-2022','test',3,16),(8,'8','Kiểm tra và giám sát sinh viên',1,-1,-1,'28-03-2022','28-03-2022','test',2,19),(9,'9','Tổ chức sự kiện',1,-1,-1,'28-03-2022','28-03-2022','test',2,NULL),(10,'10','Truyền thông',1,-1,-1,'28-03-2022','28-03-2022','test',2,NULL),(11,'11','Sinh viên',1,-1,-1,'28-03-2022','28-03-2022','test',2,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments_employees`
--

DROP TABLE IF EXISTS `departments_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments_employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_department_id_idx` (`department_id`),
  KEY `fk_employee_id_idx` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments_employees`
--

LOCK TABLES `departments_employees` WRITE;
/*!40000 ALTER TABLE `departments_employees` DISABLE KEYS */;
INSERT INTO `departments_employees` VALUES (1,7,1),(2,7,2),(3,7,3),(4,7,4),(5,7,5),(6,7,6),(7,7,7),(8,7,8),(9,7,9),(10,7,10),(11,7,11),(12,7,12),(13,7,13),(14,7,14),(15,7,15),(16,4,16),(17,4,17),(18,4,18),(19,4,19),(20,4,20),(21,4,21),(22,4,22),(23,4,23),(24,4,24),(25,4,25),(26,4,26),(27,4,27),(28,4,28),(29,4,29),(30,4,30),(31,5,31),(32,5,32),(33,5,33),(34,5,34),(35,5,35),(36,5,36),(37,5,37),(38,5,38),(39,5,39),(40,5,40),(41,5,41),(42,5,42),(43,5,43),(44,5,44),(45,5,45),(46,6,46),(47,6,47),(48,6,48),(49,6,49),(50,6,50),(51,6,51),(52,6,52),(53,6,53),(54,6,54),(55,6,55),(56,6,56),(57,6,57),(58,6,58),(59,6,59),(60,6,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,3,76),(77,3,77),(78,3,78),(79,3,79),(80,3,80),(81,3,81),(82,3,82),(83,3,83),(84,3,84),(85,3,85),(86,3,86),(87,3,87),(88,3,88),(89,3,89),(90,3,90),(91,8,91),(92,8,92),(93,8,93),(94,8,94),(95,8,95),(96,8,96),(97,8,97),(98,8,98),(99,8,99),(100,1,100),(101,4,1),(102,5,100),(103,5,2),(104,5,60),(117,3,104),(118,7,104);
/*!40000 ALTER TABLE `departments_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `date_of_birth` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `phone_number` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `active_flag` tinyint NOT NULL DEFAULT '1',
  `gender` int NOT NULL DEFAULT '0' COMMENT '"M" or "F"',
  `avatar` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `password` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enable_login` tinyint NOT NULL DEFAULT '0',
  `is_active` tinyint NOT NULL DEFAULT '1',
  `create_by` int NOT NULL DEFAULT '-1',
  `modify_by` int NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'1','Ðức Chính Đoàn','01-03-2000','ThiHng.Lm77@hotmail.com','0269 0386 9201','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThiHng.Lm77@hotmail.com','cmdcmd',0,1,-1,-1),(2,'2','Đông Nghi Đoàn','01-03-2000','PhngTrinh.Bi26@yahoo.com','0249 6226 0641','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','PhngTrinh.Bi26@yahoo.com','cmdcmd',0,1,-1,-1),(3,'3','Thùy Oanh Mai MD','01-03-2000','KhnhChi60@yahoo.com','0295 3306 3990','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KhnhChi60@yahoo.com','cmdcmd',0,1,-1,-1),(4,'4','Sơn Quyền Hoàng','01-03-2000','ThoQuyn95@yahoo.com','0252 3525 4277','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThoQuyn95@yahoo.com','cmdcmd',0,1,-1,-1),(5,'5','Hoài Thương Phùng','01-03-2000','AnhVit.V@yahoo.com','029 1419 1954','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','AnhVit.V@yahoo.com','cmdcmd',0,1,-1,-1),(6,'6','Miss Ái Linh Phùng','01-03-2000','ThanhKiu27@hotmail.com','020 8540 6847','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThanhKiu27@hotmail.com','cmdcmd',0,1,-1,-1),(7,'7','Ðan Quỳnh Tô','01-03-2000','HongSa15@yahoo.com','023 1443 4607','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HongSa15@yahoo.com','cmdcmd',0,1,-1,-1),(8,'8','Bảo Tín Phùng','01-03-2000','GiangThin_T@gmail.com','021 8246 3839','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','GiangThin_T@gmail.com','cmdcmd',0,1,-1,-1),(9,'9','Phước Bình Phạm','01-03-2000','HongHip_Phm@yahoo.com','0223 8350 5531','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HongHip_Phm@yahoo.com','cmdcmd',0,1,-1,-1),(10,'10','Diễm Trinh Trần','01-03-2000','HongNgn_Nguyn@gmail.com','021 0099 0911','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HongNgn_Nguyn@gmail.com','cmdcmd',0,1,-1,-1),(11,'11','Quang Dương Lý','01-03-2000','XunHiu.Lm@yahoo.com','0239 4500 2897','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','XunHiu.Lm@yahoo.com','cmdcmd',0,1,-1,-1),(12,'12','Dr. Thanh Tuyết Trần','01-03-2000','ThuVit_inh78@yahoo.com','0209 6015 8608','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThuVit_inh78@yahoo.com','cmdcmd',0,1,-1,-1),(13,'13','Hồ Nam Hoàng','01-03-2000','XunQu8@hotmail.com','020 0696 7709','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','XunQu8@hotmail.com','cmdcmd',0,1,-1,-1),(14,'14','Thiếu Anh Đào','01-03-2000','KinBnh89@hotmail.com','0203 1346 1053','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KinBnh89@hotmail.com','cmdcmd',0,1,-1,-1),(15,'15','Minh Mẫn Đoàn','01-03-2000','Hunh.Phan30@yahoo.com','021 4694 2150','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hunh.Phan30@yahoo.com','cmdcmd',0,1,-1,-1),(16,'16','Ðức Quyền Hồ','01-03-2000','VnNhi_Tng@hotmail.com','024 6837 2044','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','VnNhi_Tng@hotmail.com','cmdcmd',0,1,-1,-1),(17,'17','Gia Thiện Đinh','01-03-2000','KimKhuyn.T73@hotmail.com','0283 3870 7783','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KimKhuyn.T73@hotmail.com','cmdcmd',0,1,-1,-1),(18,'18','Quỳnh Lâm Lâm IV','01-03-2000','PhngThanh.Hong@gmail.com','0264 8177 9771','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','PhngThanh.Hong@gmail.com','cmdcmd',0,1,-1,-1),(19,'19','Ms. Việt Huy Mai','01-03-2000','TUyn97@hotmail.com','026 2736 7901','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TUyn97@hotmail.com','cmdcmd',0,1,-1,-1),(20,'20','Thiện Sinh Vũ','01-03-2000','Hut.Trng@hotmail.com','026 7170 5151','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hut.Trng@hotmail.com','cmdcmd',0,1,-1,-1),(21,'21','Hương Mai Tăng','01-03-2000','TunHong40@hotmail.com','0242 4384 0246','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TunHong40@hotmail.com','cmdcmd',0,1,-1,-1),(22,'22','Nam An Trương','01-03-2000','BchTr_Phng11@gmail.com','0272 5099 6423','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','BchTr_Phng11@gmail.com','cmdcmd',0,1,-1,-1),(23,'23','Ái Linh Mai','01-03-2000','KimHng.Mai@gmail.com','0255 6369 3736','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KimHng.Mai@gmail.com','cmdcmd',0,1,-1,-1),(24,'24','Hồng Nhật Trịnh I','01-03-2000','ThinKim94@gmail.com','0214 9858 6417','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThinKim94@gmail.com','cmdcmd',0,1,-1,-1),(25,'25','Bình Dân Vương Sr.','01-03-2000','CngLc_H@gmail.com','0210 9639 2455','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','CngLc_H@gmail.com','cmdcmd',0,1,-1,-1),(26,'26','Lương Thiện Phan','01-03-2000','PhngHoa41@gmail.com','0212 4485 5898','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','PhngHoa41@gmail.com','cmdcmd',0,1,-1,-1),(27,'27','Phú Ân Dương III','01-03-2000','DimMy_Dng15@gmail.com','026 2348 6108','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','DimMy_Dng15@gmail.com','cmdcmd',0,1,-1,-1),(28,'28','Vân Quyên Nguyễn IV','01-03-2000','PhiNhn31@hotmail.com','026 9359 7959','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','PhiNhn31@hotmail.com','cmdcmd',0,1,-1,-1),(29,'29','Thế Tường Hồ','01-03-2000','ChiuPhong_Vng88@hotmail.com','0208 4194 1271','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ChiuPhong_Vng88@hotmail.com','cmdcmd',0,1,-1,-1),(30,'30','Trúc Lam Tăng DDS','01-03-2000','HoMi_H72@yahoo.com','023 0200 9314','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HoMi_H72@yahoo.com','cmdcmd',0,1,-1,-1),(31,'31','Công Bằng Vương','01-03-2000','QucTun.Mai@hotmail.com','023 1408 6450','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','QucTun.Mai@hotmail.com','cmdcmd',0,1,-1,-1),(32,'32','Mrs. Diễm Uyên Tô','01-03-2000','HngQu_Ng@hotmail.com','0265 2843 3246','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HngQu_Ng@hotmail.com','cmdcmd',0,1,-1,-1),(33,'33','Miss Đinh Hương Trịnh','01-03-2000','MHip.Phng21@yahoo.com','029 2829 1524','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','MHip.Phng21@yahoo.com','cmdcmd',0,1,-1,-1),(34,'34','Ðình Dương Đỗ','01-03-2000','ngHi29@yahoo.com','0258 2682 3601','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ngHi29@yahoo.com','cmdcmd',0,1,-1,-1),(35,'35','Mrs. Anh Quân Ngô','01-03-2000','NgcHuy_V69@hotmail.com','022 1982 7498','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','NgcHuy_V69@hotmail.com','cmdcmd',0,1,-1,-1),(36,'36','Nam Thông Lý','01-03-2000','ThcTm11@yahoo.com','020 3561 5187','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThcTm11@yahoo.com','cmdcmd',0,1,-1,-1),(37,'37','Miss Thanh Thúy Vũ','01-03-2000','ThiThi.Dng@yahoo.com','0294 5768 6398','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThiThi.Dng@yahoo.com','cmdcmd',0,1,-1,-1),(38,'38','Ngọc Liên Đào','01-03-2000','ThanhHoa74@gmail.com','0245 3926 0583','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThanhHoa74@gmail.com','cmdcmd',0,1,-1,-1),(39,'39','Ms. Long Vịnh Phùng','01-03-2000','ThuThun_Ng@yahoo.com','027 6713 9007','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThuThun_Ng@yahoo.com','cmdcmd',0,1,-1,-1),(40,'40','Minh Tân Lê','01-03-2000','ThchTho.on@hotmail.com','0222 4191 4468','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThchTho.on@hotmail.com','cmdcmd',0,1,-1,-1),(41,'41','Ngọc Thi Hoàng','01-03-2000','DuyTn_Hong8@yahoo.com','023 3022 5329','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','DuyTn_Hong8@yahoo.com','cmdcmd',0,1,-1,-1),(42,'42','Tuyết Hương Lâm','01-03-2000','ThnhCng55@gmail.com','025 3052 3429','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThnhCng55@gmail.com','cmdcmd',0,1,-1,-1),(43,'43','Xuân Cung Đào','01-03-2000','KimLin70@gmail.com','024 9331 2914','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','KimLin70@gmail.com','cmdcmd',0,1,-1,-1),(44,'44','Bảo Huỳnh Vũ','01-03-2000','HuTon11@hotmail.com','0211 9197 0241','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HuTon11@hotmail.com','cmdcmd',0,1,-1,-1),(45,'45','Nhật Hoàng Lý','01-03-2000','CngHi_T@yahoo.com','0289 7740 2287','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','CngHi_T@yahoo.com','cmdcmd',0,1,-1,-1),(46,'46','Hồng Ðào Phạm','01-03-2000','BuChng.Mai@yahoo.com','0292 9362 5626','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','BuChng.Mai@yahoo.com','cmdcmd',0,1,-1,-1),(47,'47','Tường Vi Lê','01-03-2000','ThyTin77@hotmail.com','0283 1862 5655','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThyTin77@hotmail.com','cmdcmd',0,1,-1,-1),(48,'48','Hữu Hiệp Ngô','01-03-2000','NhtLan.ng@hotmail.com','025 9647 5024','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','NhtLan.ng@hotmail.com','cmdcmd',0,1,-1,-1),(49,'49','Trân Châu Hà','01-03-2000','SongLam.Tng22@hotmail.com','0272 1933 9777','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','SongLam.Tng22@hotmail.com','cmdcmd',0,1,-1,-1),(50,'50','Tuấn Khải Tăng','01-03-2000','HongDu_H16@yahoo.com','0274 0084 2384','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HongDu_H16@yahoo.com','cmdcmd',0,1,-1,-1),(51,'51','Quốc Hoài Phan','01-03-2000','QucHi.Tng72@gmail.com','026 5716 7339','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','QucHi.Tng72@gmail.com','cmdcmd',0,1,-1,-1),(52,'52','Đan Thư Hoàng','01-03-2000','HngChi_Tng14@yahoo.com','024 9037 8913','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HngChi_Tng14@yahoo.com','cmdcmd',0,1,-1,-1),(53,'53','Trung Anh Dương','01-03-2000','nhTrung.o75@hotmail.com','0238 6394 3809','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nhTrung.o75@hotmail.com','cmdcmd',0,1,-1,-1),(54,'54','Hoàng Xuân Đinh','01-03-2000','cTu.Trn78@yahoo.com','0273 5542 8124','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','cTu.Trn78@yahoo.com','cmdcmd',0,1,-1,-1),(55,'55','Hoàng Việt Lâm','01-03-2000','BchChiu33@yahoo.com','0291 0305 8252','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','BchChiu33@yahoo.com','cmdcmd',0,1,-1,-1),(56,'56','Cát Uy Đào Jr.','01-03-2000','TngLinh32@gmail.com','0243 4271 7880','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','TngLinh32@gmail.com','cmdcmd',0,1,-1,-1),(57,'57','Gia Huy Bùi','01-03-2000','KhiTm.Tng26@gmail.com','0239 4644 7267','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','KhiTm.Tng26@gmail.com','cmdcmd',0,1,-1,-1),(58,'58','Thanh Tùng Hồ','01-03-2000','HnhTho97@gmail.com','0200 6241 9910','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HnhTho97@gmail.com','cmdcmd',0,1,-1,-1),(59,'59','Bá Thịnh Hồ','01-03-2000','LongGiang.H@gmail.com','024 0370 9248','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','LongGiang.H@gmail.com','cmdcmd',0,1,-1,-1),(60,'60','Lan Vy Vũ','01-03-2000','ChThnh.Phan@gmail.com','024 0866 1214','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ChThnh.Phan@gmail.com','cmdcmd',0,1,-1,-1),(61,'61','Cẩm Thúy Phan','01-03-2000','ThanhTuyt.Vng@hotmail.com','0285 5317 5830','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThanhTuyt.Vng@hotmail.com','cmdcmd',0,1,-1,-1),(62,'62','Mrs. Xuân Loan Vương','01-03-2000','TrngSinh_L49@gmail.com','025 9684 7733','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','TrngSinh_L49@gmail.com','cmdcmd',0,1,-1,-1),(63,'63','Bạch Yến Lâm','01-03-2000','KhuTrung_Phm@hotmail.com','025 8104 5074','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','KhuTrung_Phm@hotmail.com','cmdcmd',0,1,-1,-1),(64,'64','Hồng Thư Phạm','01-03-2000','ThiDng_H@hotmail.com','0230 2764 7371','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThiDng_H@hotmail.com','cmdcmd',0,1,-1,-1),(65,'65','Công Giang Phùng','01-03-2000','Anho31@gmail.com','026 7227 5725','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Anho31@gmail.com','cmdcmd',0,1,-1,-1),(66,'66','Kim Thu Tô','01-03-2000','Bnh.Bi69@gmail.com','0204 1159 6475','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Bnh.Bi69@gmail.com','cmdcmd',0,1,-1,-1),(67,'67','Xuân Vũ Vương','01-03-2000','ThinThanh16@yahoo.com','0235 1191 3308','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThinThanh16@yahoo.com','cmdcmd',0,1,-1,-1),(68,'68','Việt Khôi Ngô','01-03-2000','CngNgh.ng36@hotmail.com','024 6593 9969','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','CngNgh.ng36@hotmail.com','cmdcmd',0,1,-1,-1),(69,'69','Kim Hoàng Hồ','01-03-2000','BchDuyn_Ng41@hotmail.com','0235 0962 8878','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','BchDuyn_Ng41@hotmail.com','cmdcmd',0,1,-1,-1),(70,'70','Mai Vy Phạm','01-03-2000','KhiH.Dng59@hotmail.com','024 8400 8120','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KhiH.Dng59@hotmail.com','cmdcmd',0,1,-1,-1),(71,'71','Gia Huấn Hoàng','01-03-2000','XunTho.o0@gmail.com','0216 6095 7658','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','XunTho.o0@gmail.com','cmdcmd',0,1,-1,-1),(72,'72','Mỹ Dung Tô','01-03-2000','NguytH58@yahoo.com','0265 6242 7634','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','NguytH58@yahoo.com','cmdcmd',0,1,-1,-1),(73,'73','Ngọc Lâm Đào','01-03-2000','HipHa.H@hotmail.com','027 0435 7587','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HipHa.H@hotmail.com','cmdcmd',0,1,-1,-1),(74,'74','Hồng Đăng Đào','01-03-2000','ThanhUyn61@yahoo.com','0287 2248 1031','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThanhUyn61@yahoo.com','cmdcmd',0,1,-1,-1),(75,'75','Viễn Thông Bùi','01-03-2000','cSiu.Hong@yahoo.com','022 2068 2796','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','cSiu.Hong@yahoo.com','cmdcmd',0,1,-1,-1),(76,'76','Uyên Minh Dương','01-03-2000','TunDng12@gmail.com','029 7980 6994','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TunDng12@gmail.com','cmdcmd',0,1,-1,-1),(77,'77','Tú Uyên Phạm','01-03-2000','NgcT.Mai@gmail.com','0229 7909 6001','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','NgcT.Mai@gmail.com','cmdcmd',0,1,-1,-1),(78,'78','Tuấn Khanh Mai','01-03-2000','LanTrc89@hotmail.com','0277 8413 0917','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','LanTrc89@hotmail.com','cmdcmd',0,1,-1,-1),(79,'79','Phượng Tiên Bùi','01-03-2000','TunVit_@yahoo.com','020 5928 2380','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TunVit_@yahoo.com','cmdcmd',0,1,-1,-1),(80,'80','Nghi Dung Trịnh','01-03-2000','ChDng.Lm@yahoo.com','0229 8130 7189','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ChDng.Lm@yahoo.com','cmdcmd',0,1,-1,-1),(81,'81','Thy Vân Dương','01-03-2000','QucThng_L@yahoo.com','0295 2213 2383','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','QucThng_L@yahoo.com','cmdcmd',0,1,-1,-1),(82,'82','Bích Hợp Phan','01-03-2000','ThinTin.o@yahoo.com','0294 3870 9672','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThinTin.o@yahoo.com','cmdcmd',0,1,-1,-1),(83,'83','Quốc Hòa Đào','01-03-2000','DimPhc_L@hotmail.com','0246 5833 8953','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','DimPhc_L@hotmail.com','cmdcmd',0,1,-1,-1),(84,'84','Tường Lân Đỗ','01-03-2000','AnhTh_V84@hotmail.com','0287 3004 3561','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','AnhTh_V84@hotmail.com','cmdcmd',0,1,-1,-1),(85,'85','Lâm Tuyền Đặng','01-03-2000','TunLinh_Trn3@yahoo.com','0237 0462 2404','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TunLinh_Trn3@yahoo.com','cmdcmd',0,1,-1,-1),(86,'86','Thanh Vy Tăng','01-03-2000','ThyGiang79@gmail.com','021 9707 3489','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThyGiang79@gmail.com','cmdcmd',0,1,-1,-1),(87,'87','Hiệp Dinh Tô','01-03-2000','ThyNgc63@yahoo.com','029 8274 0835','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThyNgc63@yahoo.com','cmdcmd',0,1,-1,-1),(88,'88','Hoàn Châu Tăng','01-03-2000','HuKhi.V29@gmail.com','0225 7332 3621','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HuKhi.V29@gmail.com','cmdcmd',0,1,-1,-1),(89,'89','Như Ý Hồ','01-03-2000','NgcHnh48@yahoo.com','022 1755 2052','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','NgcHnh48@yahoo.com','cmdcmd',0,1,-1,-1),(90,'90','Huy Lĩnh Vũ DDS','01-03-2000','cTu34@yahoo.com','0269 7288 4811','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','cTu34@yahoo.com','cmdcmd',0,1,-1,-1),(91,'91','Mrs. Duy Hạnh Phan','01-03-2000','HuynAnh.Phm50@yahoo.com','027 4688 3421','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HuynAnh.Phm50@yahoo.com','cmdcmd',0,1,-1,-1),(92,'92','Trúc Phương Lâm','01-03-2000','TSng86@hotmail.com','020 4040 6390','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TSng86@hotmail.com','cmdcmd',0,1,-1,-1),(93,'93','Mrs. Hương Lan Đào','01-03-2000','XunHnh_inh@gmail.com','0212 0465 7976','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','XunHnh_inh@gmail.com','cmdcmd',0,1,-1,-1),(94,'94','Diệu Hiền Lâm','01-03-2000','ThinLam_Trnh@hotmail.com','023 0409 4839','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThinLam_Trnh@hotmail.com','cmdcmd',0,1,-1,-1),(95,'95','Phương Loan Trần','01-03-2000','GiaPhong32@gmail.com','0212 9601 9964','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','GiaPhong32@gmail.com','cmdcmd',0,1,-1,-1),(96,'96','Cường Dũng Tô','01-03-2000','VitKhu20@yahoo.com','0226 6701 9725','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','VitKhu20@yahoo.com','cmdcmd',0,1,-1,-1),(97,'97','Chiêu Dương Ngô','01-03-2000','HngLy_@hotmail.com','028 2471 6127','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HngLy_@hotmail.com','cmdcmd',0,1,-1,-1),(98,'98','Trí Hào Vương','01-03-2000','ThinLng.V8@yahoo.com','020 3229 3891','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThinLng.V8@yahoo.com','cmdcmd',0,1,-1,-1),(99,'99','Ngọc Hạnh Tô','01-03-2000','ThanhHng.Trng@yahoo.com','0259 2042 0175','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThanhHng.Trng@yahoo.com','cmdcmd',0,1,-1,-1),(100,'DTDC2Aa2','Nguyễn Văn Trần C','01-12-2020','ThiHng.Lm77@hotmail.com','0269 0386 9201','01-01-2022','16-04-2022 18:39:08',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThiHng.Lm77@hotmail.com','cmdcmd',1,1,1,2),(104,'SV123Edit','Ðức Chính Định Bình','01-01-2013','ThiHng.Lm77@hotmail.com','0269 0386 9201','23-04-2022','24-04-2022 14:02:11',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThiHng.Lm77@hotmail.com','cmdcmd',1,1,0,0);
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
  `parent_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `order_index` int NOT NULL DEFAULT '-1',
  `create_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `update_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
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
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mss_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `item_code` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemcode_UNIQUE` (`item_code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'E','DEPE1','Phòng ban đang được sử dụng'),(2,'E','EMPE1','Không được khóa tài khoản trưởng phòng'),(3,'E','DEPE2','Mã phòng ban này đã tồn tại'),(4,'E','POSE1','Thêm chức vụ vào phòng ban thất bại!'),(5,'E','EMPE2','Không thể xóa nhân viên là trưởng phòng');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'Hợp đồng kinh tế'),(2,'Hợp đồng'),(3,'Cảnh báo/nhắc nhở'),(4,'Thiết bị'),(5,'Phụ tùng'),(6,'Cảm biến'),(7,'Cảm biến'),(8,'Cảm biến'),(9,'Danh mục'),(10,'Danh mục kiểm tra'),(11,'Công việc'),(12,'Đề xuất'),(13,'Loại đề xuất'),(14,'Nhân viên'),(15,'Phòng ban'),(16,'Chức vụ'),(17,'Kho'),(18,'Vai trò'),(19,'Báo cáo'),(20,'Khách hàng'),(21,'Người dùng'),(22,'Chức năng công ty'),(23,'Thẻ'),(24,'Phân loại khách hàng'),(25,'Sản phẩm'),(26,'Sản phẩm');
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
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
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
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `department_id` int DEFAULT NULL,
  `is_manager` tinyint NOT NULL DEFAULT '0',
  `create_by` int NOT NULL DEFAULT '-1',
  `modify_by` int NOT NULL DEFAULT '-1',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `team_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chucvu_phongban1_idx` (`department_id`),
  KEY `fk_positions_teams1_idx` (`team_id`),
  KEY `fk_role_position_idx` (`role_id`),
  CONSTRAINT `fk_chucvu_phongban1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_positions_teams1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `fk_role_position` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Thành viên ban quản lý KTX',1,1,-1,-1,'28-03-2022','28-03-2022',NULL,1),(2,'Giám thị',1,0,-1,-1,'28-03-2022','28-03-2022',NULL,2),(3,'Kế toán',1,0,-1,-1,'28-03-2022','28-03-2022',NULL,3),(4,'Trưởng đội 1',2,1,-1,-1,'28-03-2022','28-03-2022',NULL,4),(5,'Đội trưởng',3,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(6,'Thành viên',4,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(7,'Trưởng tầng 1',4,1,-1,-1,'28-03-2022','28-03-2022',NULL,6),(8,'Trưởng phòng sinh viên tầng 1',4,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(9,'Thành viên',5,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(10,'Trưởng tầng 2',5,1,-1,-1,'28-03-2022','28-03-2022',NULL,6),(11,'Trưởng phòng sinh viên tầng 2',5,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(12,'Thành viên',6,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(13,'Trưởng tầng 3',6,1,-1,-1,'28-03-2022','28-03-2022',NULL,6),(14,'Trưởng phòng sinh viên tầng 3',6,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(15,'Thành viên',7,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(16,'Trưởng tầng trệt',7,1,-1,-1,'28-03-2022','28-03-2022',NULL,6),(17,'Trưởng phòng sinh viên tầng trệt',7,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(18,'Thành viên',8,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(19,'Trưởng đội 2',8,1,-1,-1,'28-03-2022','28-03-2022',NULL,7),(20,'Trưởng đội nhạc cụ',NULL,1,-1,-1,'28-03-2022','28-03-2022',1,5),(21,'Thành viên',NULL,0,-1,-1,'28-03-2022','28-03-2022',1,5),(22,'Trưởng đội cắm hoa',NULL,1,-1,-1,'28-03-2022','28-03-2022',2,5),(23,'Trưởng đội bóng đá',NULL,1,-1,-1,'28-03-2022','28-03-2022',3,5),(24,'Trưởng đội bảo vệ',NULL,1,-1,-1,'28-03-2022','28-03-2022',4,5),(25,'Trưởng đội thuyết trình',NULL,1,-1,-1,'28-03-2022','28-03-2022',5,5),(26,'Trưởng ban sự kiện',9,1,-1,-1,'28-03-2022','28-03-2022',NULL,5),(27,'Trưởng ban truyền thông',10,1,-1,-1,'28-03-2022','28-03-2022',NULL,5),(28,'Sinh viên',11,1,-1,-1,'28-03-2022','28-03-2022',NULL,5);
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
  `employee_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employees_has_positions_positions1_idx` (`position_id`),
  KEY `fk_employees_has_positions_employees1_idx` (`employee_id`),
  CONSTRAINT `fk_employees_has_positions_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_employees_has_positions_positions1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_employees`
--

LOCK TABLES `positions_employees` WRITE;
/*!40000 ALTER TABLE `positions_employees` DISABLE KEYS */;
INSERT INTO `positions_employees` VALUES (1,1,15),(2,2,15),(3,3,15),(4,4,15),(5,5,16),(6,6,15),(7,7,15),(8,8,15),(9,9,15),(10,10,15),(11,11,15),(12,12,15),(13,13,15),(14,14,15),(15,15,15),(16,16,7),(17,17,6),(18,18,6),(19,19,6),(20,20,6),(21,21,6),(22,22,6),(23,23,6),(24,24,6),(25,25,6),(26,26,6),(27,27,6),(28,28,6),(29,29,6),(30,30,6),(31,31,10),(32,32,9),(33,33,9),(34,34,9),(35,35,9),(36,36,9),(37,37,9),(38,38,9),(39,39,9),(40,40,9),(41,41,9),(42,42,9),(43,43,9),(44,44,9),(45,45,9),(46,46,13),(47,47,12),(48,48,12),(49,49,12),(50,50,12),(51,51,12),(52,52,12),(53,53,12),(54,54,12),(55,55,12),(56,56,12),(57,57,12),(58,58,12),(59,59,12),(60,60,12),(61,61,1),(62,62,2),(63,63,2),(64,64,2),(65,65,2),(66,66,2),(67,67,2),(68,68,2),(69,69,2),(70,70,2),(71,71,2),(72,72,2),(73,73,2),(74,74,2),(75,75,2),(76,76,4),(77,77,5),(78,78,5),(79,79,5),(80,80,5),(81,81,5),(82,82,5),(83,83,5),(84,84,5),(85,85,5),(86,86,5),(87,87,5),(88,88,5),(89,89,5),(90,90,5),(91,91,19),(92,92,6),(93,93,6),(94,94,6),(95,95,6),(96,96,6),(97,97,6),(98,98,6),(99,99,6),(115,100,6),(131,104,5),(132,104,21),(133,104,17);
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
  `proposal_id` int NOT NULL DEFAULT '-1',
  `proposal_detail_index` int NOT NULL DEFAULT '-1',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proposal_details_proposals1_idx` (`proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_details`
--

LOCK TABLES `proposal_details` WRITE;
/*!40000 ALTER TABLE `proposal_details` DISABLE KEYS */;
INSERT INTO `proposal_details` VALUES (1,1,1,'Ghét kim tám việc.'),(2,1,2,'Nhà ngọt xuồng tui ghét thích may bạn xanh.\nLỗi mây ghế hóa.\nÁ bốn tủ bè.\nBàn bảy biết.\nLỗi bốn mướn phá núi tủ.'),(3,1,3,'11426'),(4,1,4,'Quê tủ chỉ.'),(5,2,1,'Tàu chỉ làm biển em leo bốn tám.'),(6,2,2,'Mượn đang xuồng năm đỏ nón.\nTàu đang con bạn đá hết.'),(7,2,3,'24170'),(8,2,4,'Chết đập được làm quần việc mười bốn thuê.\nQuần tôi khoảng hết ừ bơi xanh thích leo.\nLỗi khoan giày chết núi độc anh nhà yêu.\nTui bàn biết biển dép kim nước ác giết.\nNăm độc sáu chìm đang đá việc chín tôi được.'),(9,3,1,'Đồng gió tàu cái khoan khoan nhà.'),(10,3,2,'Đã đã tủ anh ruộng xe.\nDép thương hóa phá nha ngọt thì thích đập đang.'),(11,3,3,'11018'),(12,3,4,'Độc ừ mướn con.\nHết bảy chỉ viết.\nGì được kim quần.'),(13,4,1,'Độc trời bạn giết giày đã thích.'),(14,4,2,'Đỏ giày khoan.\nXe là không hết nón xuồng thuê.\nTui bạn ờ đạp làm hóa tám thế nhà bè.\nBảy thuyền chỉ ghế thế.'),(15,4,3,'26117'),(16,4,4,'Tui khâu là thôi chỉ ghế chín chỉ núi.\nRuộng cửa đập khoảng làm.'),(17,5,1,'Thế thế lỗi không không con cửa bốn.'),(18,5,2,'Thôi chìm ba năm hết gió chết tím nón.\nXanh đạp núi nha hết con nha chìm.'),(19,5,3,'18444'),(20,5,4,'Đồng hết khoan lầu tui đập vẽ ờ vàng.\nĐã là ruộng mướn tím chết ruộng.\nLàm đang leo năm tô thôi.'),(21,6,1,'Khoan mười núi dép may chỉ độc áo.'),(22,6,2,'Thôi tủ hết kim.\nCửa lầu chỉ thuê quê núi bốn chết khâu vẽ.\nĐược làm giết tui nghỉ trời tủ thì á cửa.'),(23,6,3,'27617'),(24,6,4,'Cái máy đã.'),(25,7,1,'Tám xanh vá biển việc giày leo thế mười đang.'),(26,7,2,'Ruộng xe đánh kim hết mười.\nMượn vá lỗi á.\nLầu lầu năm thôi núi viết.\nSáu việc mượn ngọt.'),(27,7,3,'28305'),(28,7,4,'Xuồng đỏ thích á.\nCon tô tàu thôi đá ác trời đồng nha.'),(29,8,1,'Yêu đập máy bốn kim biết tàu.'),(30,8,2,'Độc ruộng thương khoảng được.\nMột leo không.\nMột đã không đỏ giày một hết giày.'),(31,8,3,'27700'),(32,8,4,'Cái tủ đỏ em đá quê ờ ngọt vàng được.\nTàu chìm thương đỏ.'),(33,9,1,'Ờ ghế tủ ờ hàng được hết kim bè chín.'),(34,9,2,'Anh thế ruộng xe leo năm mua thế thôi.\nNha thương xuồng hương.'),(35,9,3,'24445'),(36,9,4,'Hết cái leo trời mười thuyền.'),(37,10,1,'Chìm gì đang đạp may đỏ được lỗi đâu giết.'),(38,10,2,'Nước trời xanh.'),(39,10,3,'6437'),(40,10,4,'Chỉ đập đá áo khoảng tím viết.\nXuồng tôi thích khoan tủ tô đập thuê trời.\nMột thuê năm chìm đá chỉ nha lầu quê hàng.\nHết viết lầu nghỉ nước sáu hai leo đã thế.\nNăm giày đánh nhà xuồng hai ghét.'),(41,11,1,'Chỉ thích máy ba xuồng đập.'),(42,11,2,'Thế ờ được thuyền mướn viết.\nBiển viết bơi đâu yêu yêu áo.\nHết ghét hết ừ đang bè hết mây.'),(43,11,3,'31477'),(44,11,4,'Khoan thương thích thuê mây giết giết.\nĐồng bốn đang chết leo khoảng.\nCái một bè mượn đỏ ba nha dép tôi.\nĐồng kim giết xe năm ngọt trăng trời ngọt ngọt.\nMười tím ghét thuê một thuê.'),(45,12,1,'Ác đâu đập ruộng làm.'),(46,12,2,'Khâu dép nha đỏ chìm làm.\nĐâu quần con khoảng đỏ thôi.\nXuồng kim bảy là lỗi.'),(47,12,3,'21759'),(48,12,4,'Thích được chín khoảng ghét em độc mây leo.\nViết con quê vẽ ừ vàng gió.'),(49,13,1,'Anh làm chết tô xe chín đang vẽ giết.'),(50,13,2,'Hai nón mượn núi viết cái.\nGió ghét ruộng chìm tàu mướn thế đập nón.\nKhoảng leo mượn con vàng núi áo một.'),(51,13,3,'12254'),(52,13,4,'Áo mượn ừ nghỉ đập làm.\nTám xanh chìm mây mây làm núi độc.\nMười tôi chìm đồng khoảng.'),(53,14,1,'Nhà xe mười may viết.'),(54,14,2,'Tôi nước chín em đồng là phá.\nThương hóa tui vàng thuyền núi đang vá xuồng ba.'),(55,14,3,'1573'),(56,14,4,'Áo năm lỗi tủ viết thôi mười đỏ.\nĐâu gió năm bơi biết bơi gió mười.\nBiết ác mây trăng quê thuyền sáu đạp làm vàng.'),(57,15,1,'Đã trăng chìm.'),(58,15,2,'Đập mười viết tui năm việc bạn.\nGhế dép giày tui.\nĐược giết đạp mướn ờ sáu tôi thế.\nThích chết đỏ nước hai tàu hương ghét.'),(59,15,3,'435'),(60,15,4,'Thì tàu độc quê ừ đồng.\nBè nghỉ đỏ bảy mượn nghỉ gì xe.\nKhâu mây hàng ghế khâu xuồng thuyền.\nEm hai dép.'),(61,16,1,'Hết vá nghỉ bạn thuyền.'),(62,16,2,'Đang bơi ác.\nBiển xanh hết khoan thôi hương yêu anh.\nChín quần vá yêu ba xuồng hương nón mượn chết.\nMua trời chết nước leo thương dép ừ nha độc.\nỪ đá mười biển mua.'),(63,16,3,'31537'),(64,16,4,'Nghỉ đã dép.\nĐạp hết khoảng giày thuyền đạp đâu tôi dép cái.'),(65,17,1,'Cửa đánh chết ờ chín.'),(66,17,2,'Đập ác vá trăng khoan.'),(67,17,3,'23962'),(68,17,4,'Mười tàu thích trời bốn đang vàng cái.\nGhét ờ hóa tủ thì con phá.\nLầu mây xe ngọt nha thích thương chìm chết.\nÁo tủ đá là tô tôi nghỉ mây.'),(69,18,1,'Yêu áo mượn độc bè.'),(70,18,2,'Chỉ chín giày anh bảy hết được.\nTrăng con anh khâu núi mua vá đang.\nSáu khoan tím tủ bơi xanh.\nYêu sáu viết năm thương.\nThì xuồng bạn chỉ may tím.'),(71,18,3,'18366'),(72,18,4,'Làm khoảng bảy may bè sáu xanh.\nAnh không ghế con khoảng chết thích phá bè thế.\nYêu đánh giết em biển xe cửa cửa.'),(73,19,1,'Tô đá chín con việc máy vá thuyền.'),(74,19,2,'Vàng nước vàng chìm.'),(75,19,3,'26750'),(76,19,4,'Nhà thì gì.\nGì giày đang bốn vẽ bốn.\nLà ba nước khâu thì.\nGhế tui làm.\nViệc thế độc thuyền cái tủ.'),(77,20,1,'Leo máy khoảng nhà một ghế.'),(78,20,2,'Ừ gió bảy.'),(79,20,3,'6651'),(80,20,4,'Quần thế con chỉ.\nLà ruộng nhà vá ruộng tôi.'),(81,21,1,'Nha cái cái.'),(82,21,2,'Thương hương ghế áo.'),(83,21,3,'9236'),(84,21,4,'Một may vàng kim năm gió bạn làm.'),(85,22,1,'Tàu ừ núi đá bơi chìm thuyền máy nước thì.'),(86,22,2,'Nhà hàng giày.\nGì lầu đập đồng nhà xe nón thì đập nha.\nĐạp đánh xuồng lỗi nhà quần.\nTrăng độc ba bơi.\nGhế đạp sáu đâu hết đâu quê.'),(87,22,3,'24531'),(88,22,4,'Khâu anh nón con bơi dép ruộng được ba xanh.\nGì độc hàng đánh tôi cái không cửa đang.\nThôi thuê trăng thì tàu.\nCái tám hết.'),(89,23,1,'Bè tủ máy thế khâu cái khoan tôi.'),(90,23,2,'Đã tô ghế tím giết xanh leo trời thế.\nBiết em xanh quần đỏ khoảng hương ừ khoảng thôi.\nVá lỗi đá đồng không giết ruộng tôi.'),(91,23,3,'9293'),(92,23,4,'Nha núi tui thương đang mượn mua ừ thế quê.\nGhế chỉ độc thương năm bảy phá tàu mướn tô.\nVẽ cửa nước mua tám.\nKhoảng nhà yêu núi chìm.\nChỉ nghỉ tàu con tôi được dép kim.'),(93,24,1,'Dép bơi ruộng bạn lầu ừ giày ba mua.'),(94,24,2,'Ngọt bốn thì chỉ vá ừ hàng giết.\nPhá núi hương.'),(95,24,3,'15994'),(96,24,4,'Ghét ừ đập tôi thôi trời khoan.\nXe nha gì tui ngọt.\nĐã được độc mượn vá.\nLầu mua yêu gì.'),(97,25,1,'Bạn hàng việc đá may bơi tàu.'),(98,25,2,'Nước tô dép con ghế nón độc đánh.\nVá lỗi đang hàng thương ngọt dép anh hết.\nBảy nhà bảy là chìm con được.\nNhà hương ba trăng cái được.\nChín đập vàng mướn viết đá dép.'),(99,25,3,'24749'),(100,25,4,'Bảy đập đập thích khâu viết bè.\nThích xe khoan xuồng bè hết giày vàng chết quê.\nViết gió chết.'),(101,26,1,'Khâu đỏ tô.'),(102,26,2,'Một núi á gì.'),(103,26,3,'15667'),(104,26,4,'Chỉ yêu năm.\nViết đồng lỗi một nha.\nNăm tô máy ngọt thương trời là đâu bàn.\nThế thế đồng may con đã hàng ruộng phá máy.\nGiết mua gì mây đang mượn.'),(105,27,1,'Chìm hóa hóa ghét.'),(106,27,2,'Thích núi thương năm đá gió.\nKhâu trăng đánh ngọt.'),(107,27,3,'8917'),(108,27,4,'Chín chín viết quần chỉ.\nChết quê đập bơi chỉ bạn.\nChín vẽ bạn quần hóa giày hương cái.\nAnh tám mướn xe thương núi nha không năm.\nĐánh đỏ tôi biển may biết nha xanh yêu.'),(109,28,1,'Mười hết tôi tui bảy thì tô khoảng hết vàng.'),(110,28,2,'Là kim gió đang hết vàng chín.\nThuê thế núi.\nMướn xuồng mướn ờ xanh trăng tô.'),(111,28,3,'9601'),(112,28,4,'Xe nhà đồng tui chín lầu.\nMay bảy phá độc trời vẽ thế.\nGì trăng ghét thế tàu tím con kim năm.\nTủ khâu áo leo hết khoan áo ngọt.\nChết anh thì gì phá.'),(113,29,1,'Anh hàng hàng được đâu ngọt thì mượn biết lầu.'),(114,29,2,'Quần độc thích lầu tám.\nTrời bạn ngọt thì mua.\nLeo lầu là mua con chỉ xuồng mua giết đỏ.\nXe việc tàu.'),(115,29,3,'4926'),(116,29,4,'Á con mười hương mua thương.'),(117,30,1,'Tô bốn năm mướn.'),(118,30,2,'Yêu thuyền bè may bốn chìm mướn nghỉ khâu cửa.\nThì yêu mua đỏ giết đâu mua khâu ruộng.\nGhét thích may nón cái.\nTôi bảy mười tủ bè chỉ núi thôi đồng.\nThích đá thuyền thuyền một thương ghét hết anh.'),(119,30,3,'4668'),(120,30,4,'Cửa bảy nghỉ máy.');
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
  `proposal_type_index` int NOT NULL DEFAULT '-1',
  `field_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `data_type_id` int DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `field_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `proposal_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_details_data_types1_idx` (`data_type_id`),
  KEY `FKdvba7s6h0uitxnu1rh5vm2r1r` (`proposal_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_type_details`
--

LOCK TABLES `proposal_type_details` WRITE;
/*!40000 ALTER TABLE `proposal_type_details` DISABLE KEYS */;
INSERT INTO `proposal_type_details` VALUES (1,-1,'Mục đích/Lý do',1,'-1','-1','\"\"','\"\"','\"\"',1),(2,-1,'Tình trạng hư hỏng',2,'-1','-1','\"\"','\"\"','\"\"',1),(3,-1,'Số phòng',1,'-1','-1','\"\"','\"\"','\"\"',1),(4,-1,'Ghi chú',2,'-1','-1','\"\"','\"\"','\"\"',1),(5,-1,'Mục đích/Lý do',1,'-1','-1','\"\"','\"\"','\"\"',2),(6,-1,'Tên vật tư',1,'-1','-1','\"\"','\"\"','\"\"',2),(7,-1,'Số lượng',1,'-1','-1','\"\"','\"\"','\"\"',2),(8,-1,'Đơn gía',1,'-1','-1','\"\"','\"\"','\"\"',2);
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
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `active_flag` tinyint NOT NULL DEFAULT '0',
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
  `proposal_type_id` int DEFAULT NULL,
  `creator_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_by` int NOT NULL DEFAULT '-1',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`),
  KEY `fk_dexuat_TrangThai1_idx` (`status_id`),
  KEY `fk_proposals_proposal_types1_idx` (`proposal_type_id`),
  KEY `fk_proposals_employees1_idx` (`creator_id`),
  CONSTRAINT `fk_proposals_employees1` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_proposals_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals`
--

LOCK TABLES `proposals` WRITE;
/*!40000 ALTER TABLE `proposals` DISABLE KEYS */;
INSERT INTO `proposals` VALUES (1,1,45,1,'01-01-2021',-1,'21-12-2022'),(2,1,54,1,'01-01-2021',-1,'21-12-2022'),(3,1,75,1,'01-01-2021',-1,'21-12-2022'),(4,1,15,1,'01-01-2021',-1,'21-12-2022'),(5,1,48,1,'01-01-2021',-1,'21-12-2022'),(6,1,19,1,'01-01-2021',-1,'21-12-2022'),(7,1,9,1,'01-01-2021',-1,'21-12-2022'),(8,1,10,1,'01-01-2021',-1,'21-12-2022'),(9,1,66,1,'01-01-2021',-1,'21-12-2022'),(10,1,22,1,'01-01-2021',-1,'21-12-2022'),(11,1,75,1,'01-01-2021',-1,'21-12-2022'),(12,1,17,1,'01-01-2021',-1,'21-12-2022'),(13,1,10,1,'01-01-2021',-1,'21-12-2022'),(14,1,17,1,'01-01-2021',-1,'21-12-2022'),(15,1,72,1,'01-01-2021',-1,'21-12-2022'),(16,1,38,1,'01-01-2021',-1,'21-12-2022'),(17,1,47,1,'01-01-2021',-1,'21-12-2022'),(18,1,69,1,'01-01-2021',-1,'21-12-2022'),(19,1,32,1,'01-01-2021',-1,'21-12-2022'),(20,1,41,1,'01-01-2021',-1,'21-12-2022'),(21,1,19,1,'01-01-2021',-1,'21-12-2022'),(22,1,75,1,'01-01-2021',-1,'21-12-2022'),(23,1,75,1,'01-01-2021',-1,'21-12-2022'),(24,1,66,1,'01-01-2021',-1,'21-12-2022'),(25,1,8,1,'01-01-2021',-1,'21-12-2022'),(26,1,47,1,'01-01-2021',-1,'21-12-2022'),(27,1,37,1,'01-01-2021',-1,'21-12-2022'),(28,1,69,1,'01-01-2021',-1,'21-12-2022'),(29,1,5,1,'01-01-2021',-1,'21-12-2022'),(30,1,23,1,'01-01-2021',-1,'21-12-2022');
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
  `proposal_type_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
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
INSERT INTO `proposals_permissions` VALUES (1,2,5,1,41),(2,2,1,3,43);
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
  `role_id` int DEFAULT NULL,
  `permission_id` int DEFAULT NULL,
  `create_by` int NOT NULL DEFAULT '-1',
  `modify_by` int NOT NULL DEFAULT '-1',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`),
  KEY `fk_role_details_roles1_idx` (`role_id`),
  KEY `fk_role_details_permissions1_idx` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_details`
--

LOCK TABLES `role_details` WRITE;
/*!40000 ALTER TABLE `role_details` DISABLE KEYS */;
INSERT INTO `role_details` VALUES (1,11,5,1,-1,-1,'28-03-2022','28-03-2022'),(2,11,5,2,-1,-1,'28-03-2022','28-03-2022'),(3,11,5,3,-1,-1,'28-03-2022','28-03-2022'),(4,11,5,4,-1,-1,'28-03-2022','28-03-2022'),(5,12,5,1,-1,-1,'28-03-2022','28-03-2022'),(6,12,5,2,-1,-1,'28-03-2022','28-03-2022'),(7,12,5,3,-1,-1,'28-03-2022','28-03-2022'),(8,12,5,4,-1,-1,'28-03-2022','28-03-2022'),(9,14,5,1,-1,-1,'28-03-2022','28-03-2022'),(10,15,5,1,-1,-1,'28-03-2022','28-03-2022'),(11,11,4,1,-1,-1,'28-03-2022','28-03-2022'),(12,11,4,2,-1,-1,'28-03-2022','28-03-2022'),(13,11,4,3,-1,-1,'28-03-2022','28-03-2022'),(14,11,4,4,-1,-1,'28-03-2022','28-03-2022'),(15,11,4,5,-1,-1,'28-03-2022','28-03-2022'),(16,11,4,6,-1,-1,'28-03-2022','28-03-2022'),(17,12,4,1,-1,-1,'28-03-2022','28-03-2022'),(18,12,4,2,-1,-1,'28-03-2022','28-03-2022'),(19,12,4,3,-1,-1,'28-03-2022','28-03-2022'),(20,12,4,4,-1,-1,'28-03-2022','28-03-2022'),(21,12,4,5,-1,-1,'28-03-2022','28-03-2022'),(22,12,4,6,-1,-1,'28-03-2022','28-03-2022'),(23,14,4,1,-1,-1,'28-03-2022','28-03-2022'),(24,15,4,1,-1,-1,'28-03-2022','28-03-2022'),(25,16,4,1,-1,-1,'28-03-2022','28-03-2022'),(26,11,6,1,-1,-1,'28-03-2022','28-03-2022'),(27,11,6,2,-1,-1,'28-03-2022','28-03-2022'),(28,11,6,3,-1,-1,'28-03-2022','28-03-2022'),(29,11,6,4,-1,-1,'28-03-2022','28-03-2022'),(30,12,6,1,-1,-1,'28-03-2022','28-03-2022'),(31,12,6,2,-1,-1,'28-03-2022','28-03-2022'),(32,12,6,3,-1,-1,'28-03-2022','28-03-2022'),(33,12,6,4,-1,-1,'28-03-2022','28-03-2022'),(34,14,6,1,-1,-1,'28-03-2022','28-03-2022'),(35,15,6,1,-1,-1,'28-03-2022','28-03-2022'),(36,16,6,1,-1,-1,'28-03-2022','28-03-2022');
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
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
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
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
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
INSERT INTO `task_his` VALUES (2,2,2,24),(3,3,5,72),(5,5,4,35),(6,6,8,79),(7,7,4,9),(8,8,8,26),(9,9,7,93),(10,10,4,41),(11,11,4,88),(12,12,5,67),(13,13,7,77),(14,14,9,99),(15,15,8,53),(16,16,9,44),(17,17,4,42),(18,18,6,74),(19,19,5,61),(20,20,3,16),(21,21,9,39),(22,22,9,84),(23,23,2,2),(24,24,4,90),(25,25,8,88),(26,26,5,24),(27,27,1,45),(28,28,6,26),(29,29,3,42),(30,30,9,77);
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
  `status_id` int DEFAULT NULL,
  `creator_id` int DEFAULT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `receiver_id` int DEFAULT NULL,
  `finish_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`),
  KEY `fk_tasks_statuses1_idx` (`status_id`),
  KEY `fk_tasks_employees1_idx` (`creator_id`),
  KEY `fk_tasks_employees2_idx` (`receiver_id`),
  CONSTRAINT `fk_tasks_employees1` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_tasks_employees2` FOREIGN KEY (`receiver_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_tasks_statuses1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (2,2,57,'cửa á ác','Được vá không quần.','28-03-2022',24,'28-03-2022'),(3,5,4,'tủ bè vẽ','Lỗi tám đồng làm mượn.\nKhông đang một mười bàn bảy tôi.\nRuộng áo tô đạp hàng.','28-03-2022',72,'28-03-2022'),(5,4,43,'chín đang may','Thương gì khâu chết dép chết ghét.\nBiển năm nha đập quần.\nViệc bảy vàng nhà dép đạp giày thì.','28-03-2022',35,'28-03-2022'),(6,8,8,'quê thuê trời','Đá may vẽ cửa không tô ghét.','28-03-2022',79,'28-03-2022'),(7,4,88,'đập tô tàu','Máy hết ghế leo đỏ hai gió.\nHai yêu xuồng tàu trăng thích đánh mua.\nBiết bè đạp.\nNgọt núi hàng á tui xuồng dép.','28-03-2022',9,'28-03-2022'),(8,8,33,'xuồng đâu lỗi','Việc tàu quê kim nghỉ xe.\nViệc tui sáu khâu khoan.','28-03-2022',26,'28-03-2022'),(9,7,85,'thuê được trăng','Cái năm nước mượn biển lỗi bơi xuồng ờ không.','28-03-2022',93,'28-03-2022'),(10,4,52,'mười biết áo','Bè tàu gì tủ ngọt xe quần bảy.','28-03-2022',41,'28-03-2022'),(11,4,11,'thuê vàng trời','Cửa mượn mua thì ba kim hết bảy mượn leo.','28-03-2022',88,'28-03-2022'),(12,5,9,'biển ruộng gió','Biết bàn viết bơi.','28-03-2022',67,'28-03-2022'),(13,7,18,'ờ bảy phá','Chỉ phá vẽ một chín một hết đâu.\nHết quê ruộng viết.','28-03-2022',77,'28-03-2022'),(14,9,58,'là khoảng biển','Yêu ác hàng thuyền yêu lầu.\nÁo ruộng chỉ thôi sáu núi.\nMây ác trăng anh bạn việc may vàng.','28-03-2022',99,'28-03-2022'),(15,8,44,'chỉ đã thì','Vá bơi trời trăng.\nGió vàng nha nước ghế quần anh chìm.\nGì ruộng đạp thôi tím.\nBơi khoảng đồng sáu.','28-03-2022',53,'28-03-2022'),(16,9,67,'hai thuyền xe','Đang em ghét nước thế lầu xe may.\nNúi vàng một độc.\nVá tím nước.','28-03-2022',44,'28-03-2022'),(17,4,64,'yêu biết tủ','Hai áo cửa ờ tôi trời đã đang chỉ.\nHết gì ngọt đánh vẽ đang được chết tím.\nTủ hết vá hết.\nVàng mua thuê làm mướn ghét.\nTui chín viết bạn mướn thuê.','28-03-2022',42,'28-03-2022'),(18,6,16,'vẽ yêu xuồng','Đã mượn đã.\nGhế hai chết kim làm năm em biển mượn.\nThuê hàng hết máy làm tô đạp chỉ tô viết.\nĐập đá anh ờ nghỉ thế.','28-03-2022',74,'28-03-2022'),(19,5,55,'đồng em xuồng','Áo bảy thuyền hóa là bạn thuê gió.\nLeo xuồng thì việc tui ngọt á nhà làm.\nGhế mười làm dép.\nLỗi xanh yêu cái.','28-03-2022',61,'28-03-2022'),(20,3,60,'hết nước lầu','Quần đồng máy chỉ.\nBạn ghét khoan hết.\nPhá bốn năm leo.\nMây vàng bạn ghét hai là.','28-03-2022',16,'28-03-2022'),(21,9,20,'dép lầu hương','Hết ba thì ừ núi thì được.\nHết bạn vàng vàng không quần trăng đánh không.\nQuê đá đồng nón xanh.','28-03-2022',39,'28-03-2022'),(22,9,60,'phá thôi đồng','Chìm thế núi tàu ghét mướn hương bơi ghế.\nMướn giết thôi.','28-03-2022',84,'28-03-2022'),(23,2,73,'một nghỉ tô','Đồng thôi lỗi.\nTủ tím chết biển chỉ thế ừ không mười.\nNăm đang tím phá thì năm ờ con mười.','28-03-2022',2,'28-03-2022'),(24,4,37,'thế biển máy','Thuê kim là đập vàng dép đang.\nHết gì em.','28-03-2022',90,'28-03-2022'),(25,8,13,'quê ghế thế','Ừ gió làm được nhà cái quê.\nNgọt làm tôi ngọt được gì thế anh cửa giết.\nTàu ừ gió tui mua may đồng.','28-03-2022',88,'28-03-2022'),(26,5,77,'kim viết hết','Cửa tàu tủ là á việc khoảng cái.\nNón khoảng gió vẽ trời vẽ leo may thì.','28-03-2022',24,'28-03-2022'),(27,1,5,'trời nước việc','Leo ghét một kim nghỉ quê.\nThôi lỗi thương năm.\nKhoan xuồng đá máy không.\nNón á tôi.','28-03-2022',45,'28-03-2022'),(28,6,50,'đỏ mua ngọt','Cửa ngọt giết gì ghét chỉ ruộng vá.\nNước đánh vá bàn xe xanh ruộng nước.\nÁo thuê mua thích bạn.\nVàng năm thuyền.','28-03-2022',26,'28-03-2022'),(29,3,86,'ác ờ may','Bạn chết giết năm mượn ghét tui cửa xanh.\nBa tủ tủ em xuồng biển.\nTàu năm nhà đã tám đá nước.\nBảy không đập ghét giết hết lỗi.\nMua hết là bè ác.','28-03-2022',42,'28-03-2022'),(30,9,60,'hóa may núi','Ờ quần bạn.\nNăm anh hóa bơi ghế thế bè bạn.\nĐâu chỉ thì.\nBảy không mua bè.','28-03-2022',77,'28-03-2022'),(32,1,19,'Sửa quạt 001','Quạt tạm thời xài được','24-04-2022 21:10:54',5,'');
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
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `head_position` int NOT NULL DEFAULT '-1',
  `create_by` int NOT NULL DEFAULT '-1',
  `modify_by` int NOT NULL DEFAULT '-1',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Đội nhạc cụ',100,-1,-1,'10-11-2022','10-11-2022','10-11-2022'),(2,'Đội cắm hoa',100,-1,-1,'10-11-2022','10-11-2022','10-11-2022'),(3,'Đội bóng đá',-1,-1,-1,'10-11-2022','10-11-2022','10-11-2022'),(4,'Đội bảo vệ',-1,-1,-1,'10-11-2022','10-11-2022','10-11-2022'),(5,'CLB thuyết trình',-1,-1,-1,'10-11-2022','10-11-2022','10-11-2022');
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
  `team_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgqu2h8g8dkywvn6hdswglpcgc` (`employee_id`),
  KEY `FKjal5g6ir6je09j8dma510rka2` (`team_id`),
  CONSTRAINT `FKgqu2h8g8dkywvn6hdswglpcgc` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `FKjal5g6ir6je09j8dma510rka2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_employees`
--

LOCK TABLES `teams_employees` WRITE;
/*!40000 ALTER TABLE `teams_employees` DISABLE KEYS */;
INSERT INTO `teams_employees` VALUES (55,1,104);
/*!40000 ALTER TABLE `teams_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_approval_options`
--

DROP TABLE IF EXISTS `v_approval_options`;
/*!50001 DROP VIEW IF EXISTS `v_approval_options`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_approval_options` AS SELECT 
 1 AS `item_id`,
 1 AS `item_tabl`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `cmd`
--

USE `cmd`;

--
-- Final view structure for view `v_approval_options`
--

/*!50001 DROP VIEW IF EXISTS `v_approval_options`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_approval_options` AS select `employees`.`id` AS `item_id`,'employees' AS `item_tabl`,`employees`.`name` AS `name` from `employees` union select `departments`.`id` AS `item_id`,'departments' AS `item_tabl`,`departments`.`name` AS `name` from `departments` union select `positions`.`id` AS `item_id`,'positions' AS `item_tabl`,`positions`.`name` AS `name` from `positions` union select 'DM' AS `DM`,'employees' AS `employees`,'Department Manager' AS `Department Manager` union select 'All' AS `All`,'employees' AS `employees`,'All employee' AS `All employee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26  3:45:00

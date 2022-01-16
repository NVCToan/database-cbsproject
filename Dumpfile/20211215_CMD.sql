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
  `unique_number` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_step_details`
--

LOCK TABLES `approval_step_details` WRITE;
/*!40000 ALTER TABLE `approval_step_details` DISABLE KEYS */;
INSERT INTO `approval_step_details` VALUES (1,'1','1',NULL,NULL,'16'),(2,'2','1',NULL,NULL,'7'),(4,'3','1',NULL,NULL,'13');
/*!40000 ALTER TABLE `approval_step_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_steps`
--

DROP TABLE IF EXISTS `approval_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `approval_steps` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `approval_step_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `approval_step_index` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `proposal_type_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_approval_steps_proposal_types1_idx` (`proposal_type_id`),
  CONSTRAINT `fk_approval_steps_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_steps`
--

LOCK TABLES `approval_steps` WRITE;
/*!40000 ALTER TABLE `approval_steps` DISABLE KEYS */;
INSERT INTO `approval_steps` VALUES (1,'1','Phê duyệt','1','1'),(2,'2','Kế toán','1','2');
/*!40000 ALTER TABLE `approval_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` tinyint DEFAULT '1',
  `active_flag` tinyint DEFAULT '1',
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
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
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'1','Textarea',NULL),(2,'2','Dropdown',NULL),(3,'3','Radio',NULL),(4,'4','Checkbox',NULL),(5,'5','Number',NULL),(6,'6','Calculator',NULL),(7,'7','Relation',NULL),(8,'8','Attachment',NULL),(9,'9','Datetime',NULL),(10,'10','Repeater',NULL),(11,'11','Label',NULL),(12,'12',NULL,NULL);
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `farther_department_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `father_department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (23,'1','Ban Quản Lý KTX Cỏ May','0',NULL,NULL,NULL,NULL,NULL,NULL),(24,'2','Bảo trì - Bảo dưỡng CSVC KTX','1',NULL,NULL,NULL,NULL,NULL,NULL),(25,'3','Đội sửa chữa','2',NULL,NULL,NULL,NULL,NULL,NULL),(26,'4','Tầng 1','2',NULL,NULL,NULL,NULL,NULL,NULL),(27,'5','Tầng 2','2',NULL,NULL,NULL,NULL,NULL,NULL),(28,'6','Tầng 3','2',NULL,NULL,NULL,NULL,NULL,NULL),(29,'7','Tầng trệt','2',NULL,NULL,NULL,NULL,NULL,NULL),(30,'8','Kiểm tra và giám sát sinh viên','1',NULL,NULL,NULL,NULL,NULL,NULL),(31,'9','Tổ chức sự kiện','1',NULL,NULL,NULL,NULL,NULL,NULL),(32,'10','Truyền thông','1',NULL,NULL,NULL,NULL,NULL,NULL),(33,'11','Sinh viên','1',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date _of_birth` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '0',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_flag` tinyint DEFAULT '1',
  `department_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `FKgy4qe3dnqrm3ktd76sxp7n4c2` (`department_id`),
  CONSTRAINT `FKgy4qe3dnqrm3ktd76sxp7n4c2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'1','Hùng Thịnh Đinh','0','ThyAnh79@yahoo.com','023 9324 5592',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(2,'2','An Tường Trịnh','0','Khnhan.Phm@yahoo.com','022 0066 6557',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(3,'3','Hoàng Duệ Trần I','0','NhAnh_Mai@hotmail.com','026 9470 9508',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(4,'4','Ms. Thành Thiện Vũ','0','Tn.Ng@hotmail.com','026 3632 1049',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(5,'5','Ðức Thành Lê','0','PhngUyn65@yahoo.com','0279 4142 4708',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(6,'6','Thượng Nghị Hồ','0','nhKim43@hotmail.com','0256 6920 8794',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(7,'7','Ms. Hưng Ðạo Nguyễn','0','ThuDuyn_Phan@hotmail.com','0245 1679 8200',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(8,'8','Việt Dũng Dương','0','KimThng_Vng14@hotmail.com','026 2312 7134',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(9,'9','Hiếu Phong Dương','0','DngKhnh.Phan@yahoo.com','0295 6465 3055',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(10,'10','Thanh Tuấn Vương','0','VnHng61@hotmail.com','027 6223 0001',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(11,'11','Trung Nguyên Nguyễn','0','CngLp_inh@yahoo.com','022 3304 2135',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(12,'12','Bình Ðịnh Phùng','0','TrcLinh56@hotmail.com','026 8175 7901',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(13,'13','Huy Khiêm Mai','0','Phn_Trn@yahoo.com','0210 4460 6144',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(14,'14','Mrs. Hữu Nghĩa Đặng','0','ThiVn94@yahoo.com','029 9593 5529',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(15,'15','Quỳnh Nhung Phạm I','0','MngLong_Ng39@yahoo.com','0294 7848 4548',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(16,'16','Lan Vy Hà','0','NhMai.Trng@yahoo.com','0217 2635 1851',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(17,'17','Diệu Ngà Bùi','0','KhcNinh94@hotmail.com','0278 5831 9727',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(18,'18','Hiếu Hạnh Vũ PhD','0','VnThng.Phan18@yahoo.com','0223 5664 9908',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(19,'19','Lệ Huyền Tăng','0','PhcNhn.Hong52@gmail.com','0274 4735 7681',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(20,'20','Minh Huấn Đỗ','0','MinhKhi.Phm66@yahoo.com','0260 1866 9551',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(21,'21','Tịnh Như Ngô','0','Tn.Phan@gmail.com','026 0060 0384',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(22,'22','Hải Phương Tô','0','ThnhCng.H81@hotmail.com','024 5176 3533',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(23,'23','Huy Tường Tô','0','LiuOanh.Trng@hotmail.com','028 1997 8601',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(24,'24','Nhã Yến Tô','0','CngHiu27@yahoo.com','0234 0783 5816',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(25,'25','Kiên Cường Tăng MD','0','KimQuyn_Vng@yahoo.com','026 7006 4223',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(26,'26','Nhã Hồng Lâm','0','DuyHng56@hotmail.com','029 7852 2092',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(27,'27','Bảo Anh Lâm','0','GingUyn.Ng25@gmail.com','021 9353 3989',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(28,'28','Việt Cương Dương','0','DLm.Trnh39@gmail.com','027 2231 3461',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(29,'29','Kiên Bình Bùi','0','ThDuyt28@gmail.com','0269 0985 0461',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(30,'30','Mỹ Ngọc Dương','0','KhiTm_Vng@yahoo.com','022 4287 3879',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(31,'31','Kim Sa Phạm','0','DuyBo_Vng@gmail.com','0296 0190 0409',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(32,'32','Mr. Yến Loan Vương','0','VitDng_L@hotmail.com','028 5899 0562',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(33,'33','Phương Tâm Trần','0','KiuDim.H@yahoo.com','023 9445 8427',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(34,'34','Thanh Thư Bùi','0','ThanhVy13@gmail.com','0298 1083 6068',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(35,'35','Ms. Quốc Hải Phùng','0','BoGiang_T@gmail.com','026 6671 2725',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(36,'36','Miss Ngọc Khanh Phan','0','Thnht_Vng36@yahoo.com','0256 1592 5165',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(37,'37','Thượng Cường Hoàng','0','ThinKim41@hotmail.com','0217 5648 8211',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(38,'38','Tiểu Mi Trịnh','0','KhnhGiang18@gmail.com','029 1028 1191',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(39,'39','Chấn Hùng Phùng','0','DuyNhng_H@gmail.com','0221 7287 8299',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(40,'40','Ánh Tuyết Đặng PhD','0','LanChi5@gmail.com','0228 8621 2541',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(41,'41','Nguyễn Minh Dũng','0','nguyenminhdungtd98@gmail.com','0763934399',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(42,'42','Nguyễn Văn Ký','0','nguyenky@gmail.com','03428284832',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(43,'43','Nguyễn Võ Công Toàn','0','congtoan@gmail.com','0957839282',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(44,'44','Thiên Thảo','0','thienthao@gmail.com','094883123',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(45,'45','Vũ Thị Thu Thảo','0','thuthao@gmail.com','0948843123',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(46,'46','Nguyễn Duỹ Long','0','duylong@gmail.com','0948843123',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(47,'47','Nguyễn Thanh Tốt','0','thanhtot@gmail.com','0948843123',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),(48,'48','Minh Hồ','0','minhho@gmail.com','091263823',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_index` int DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
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
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'1','Hợp đồng kinh tế'),(2,'2','Hợp đồng'),(3,'3','Cảnh báo/nhắc nhở'),(4,'4','Thiết bị'),(5,'5','Phụ tùng'),(7,'6','Cảm biến'),(8,'8','Cảm biến'),(9,'9','Danh mục'),(10,'10','Danh mục kiểm tra'),(11,'11','Công việc'),(12,'12','Đề xuất'),(13,'13','Loại đề xuất'),(14,'14','Nhân viên'),(15,'15','Phòng ban'),(16,'16','Chức vụ'),(17,'17','Kho'),(18,'18','Vai trò'),(19,'19','Báo cáo'),(20,'20','Khách hàng'),(21,'21','Người dùng'),(22,'22','Chức năng công ty'),(23,'23','Thẻ'),(24,'24','Phân loại khách hàng'),(25,'25','Sản phẩm'),(26,'26','Sản phẩm');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'1','Xem'),(2,'2','Tạo'),(3,'3','Sửa'),(4,'4','Xoá'),(5,'5','Xem hết'),(6,'6','Sửa hết'),(7,'7','Xoá hết');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_manager` tinyint DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (20,'1','Thành viên ban quản lý KTX','1',1,NULL,NULL,NULL,NULL,NULL,'1'),(21,'2','Giám thị','1',0,NULL,NULL,NULL,NULL,NULL,'2'),(22,'3','Kế toán','1',0,NULL,NULL,NULL,NULL,NULL,'3'),(23,'4','Trưởng đội 1','2',1,NULL,NULL,NULL,NULL,NULL,'4'),(24,'5','Thành viên','3',0,NULL,NULL,NULL,NULL,NULL,'5'),(25,'6','Hỗ trợ trưởng tầng','4',0,NULL,NULL,NULL,NULL,NULL,'5'),(26,'7','Trưởng tầng 1','4',1,NULL,NULL,NULL,NULL,NULL,'6'),(27,'8','Trưởng phòng sinh viên tầng 1','4',0,NULL,NULL,NULL,NULL,NULL,'5'),(28,'9','Hỗ trợ trưởng tầng','5',0,NULL,NULL,NULL,NULL,NULL,'5'),(29,'10','Trưởng tầng 2','5',1,NULL,NULL,NULL,NULL,NULL,'6'),(30,'11','Trưởng phòng sinh viên tầng 2','5',0,NULL,NULL,NULL,NULL,NULL,'5'),(31,'12','Hỗ trợ trưởng tầng','6',0,NULL,NULL,NULL,NULL,NULL,'5'),(32,'13','Trưởng tầng 3','6',1,NULL,NULL,NULL,NULL,NULL,'6'),(33,'14','Trưởng phòng sinh viên tầng 3','6',0,NULL,NULL,NULL,NULL,NULL,'5'),(34,'15','Hỗ trợ trưởng tầng','7',0,NULL,NULL,NULL,NULL,NULL,'5'),(35,'16','Trưởng tầng trệt','7',1,NULL,NULL,NULL,NULL,NULL,'6'),(36,'17','Trưởng phòng sinh viên tầng trệt','7',0,NULL,NULL,NULL,NULL,NULL,'5'),(37,'18','Thành viên','8',0,NULL,NULL,NULL,NULL,NULL,'5'),(38,'19','Trưởng đội 2','8',1,NULL,NULL,NULL,NULL,NULL,'7');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_employees`
--

DROP TABLE IF EXISTS `positions_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions_employees` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `employee_id` (`employee_id`,`position_id`),
  KEY `fk_employees_has_positions_positions1_idx` (`position_id`),
  KEY `fk_employees_has_positions_employees1_idx` (`employee_id`),
  CONSTRAINT `fk_employees_has_positions_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_employees_has_positions_positions1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_employees`
--

LOCK TABLES `positions_employees` WRITE;
/*!40000 ALTER TABLE `positions_employees` DISABLE KEYS */;
INSERT INTO `positions_employees` VALUES (60,'1','11'),(80,'1','14'),(20,'1','17'),(40,'1','8'),(37,'11','8'),(33,'12','8'),(31,'15','8'),(32,'17','8'),(57,'2','11'),(34,'2','8'),(55,'3','11'),(39,'3','8'),(35,'4','8'),(81,'41','1'),(82,'42','3'),(83,'43','4'),(84,'45','10'),(85,'46','13'),(86,'47','16'),(87,'48','19'),(38,'5','8'),(36,'7','8'),(51,'8','11');
/*!40000 ALTER TABLE `positions_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_has_employees`
--

DROP TABLE IF EXISTS `positions_has_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions_has_employees` (
  `position_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`position_id`,`employee_id`),
  KEY `FKk92oo7kakp24nt1iyrp0i11q4` (`employee_id`),
  CONSTRAINT `FKk92oo7kakp24nt1iyrp0i11q4` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `FKkw3pwwbglkt6tjm01metfi6bx` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_has_employees`
--

LOCK TABLES `positions_has_employees` WRITE;
/*!40000 ALTER TABLE `positions_has_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions_has_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_details`
--

DROP TABLE IF EXISTS `proposal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal_details` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_detail_index` int DEFAULT NULL,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_proposal_details_proposals1_idx` (`proposal_id`),
  CONSTRAINT `fk_proposal_details_proposals1` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_details`
--

LOCK TABLES `proposal_details` WRITE;
/*!40000 ALTER TABLE `proposal_details` DISABLE KEYS */;
INSERT INTO `proposal_details` VALUES (28,'1','1',NULL,'May đã thôi bảy mướn xanh dép áo vàng quê.',NULL,NULL,NULL,NULL,'1'),(29,'2','1',NULL,'Kim nón kim thôi.',NULL,NULL,NULL,NULL,'2'),(30,'3','1',NULL,'19240',NULL,NULL,NULL,NULL,'3'),(31,'4','1',NULL,'Nước biết cửa bè phá làm tám.\nĐược ngọt quê tám ghét được biết.',NULL,NULL,NULL,NULL,'4'),(32,'5','2',NULL,'Chìm năm tôi leo giết đồng chìm đâu.',NULL,NULL,NULL,NULL,'1'),(33,'6','2',NULL,'Đâu thương biển.\nBàn một độc mua thôi khâu chín.',NULL,NULL,NULL,NULL,'2'),(34,'7','2',NULL,'24725',NULL,NULL,NULL,NULL,'3'),(35,'8','2',NULL,'Quần thôi giết nước bạn lỗi hết núi đập.',NULL,NULL,NULL,NULL,'4'),(36,'9','3',NULL,'Yêu gì khoảng.',NULL,NULL,NULL,NULL,'1'),(37,'10','3',NULL,'Em thương leo gió lỗi cửa mười cái.\nÁo ờ máy xuồng.\nHai hàng ghét yêu.',NULL,NULL,NULL,NULL,'2'),(38,'11','3',NULL,'15672',NULL,NULL,NULL,NULL,'3'),(39,'12','3',NULL,'Anh ghế khoảng vẽ gió.\nAnh được ác khoan áo xuồng độc trăng chết.\nRuộng bơi hết giày khoan áo á thế yêu việc.\nĐá mướn đá đang sáu xuồng gió hàng đỏ được.\nVẽ nước sáu nước anh núi đánh nha.',NULL,NULL,NULL,NULL,'4'),(40,'13','4',NULL,'Đạp mướn độc.',NULL,NULL,NULL,NULL,'1'),(41,'14','4',NULL,'Ruộng chỉ thì.\nHai thuê đâu trăng khoảng mượn cửa sáu ờ.\nÁ độc hương ác độc máy hóa.\nSáu vá tôi lầu.',NULL,NULL,NULL,NULL,'2'),(42,'15','4',NULL,'9167',NULL,NULL,NULL,NULL,'3'),(43,'16','4',NULL,'Quần thuyền yêu khâu bốn yêu hàng á bàn đang.\nĐỏ xanh vẽ mây biết năm nhà giày vẽ phá.',NULL,NULL,NULL,NULL,'4'),(44,'17','5',NULL,'Hết nha nha khoảng.',NULL,NULL,NULL,NULL,'1'),(45,'18','5',NULL,'Đâu may máy yêu.\nXuồng làm thì đang trăng kim yêu ghét.',NULL,NULL,NULL,NULL,'2'),(46,'19','5',NULL,'9700',NULL,NULL,NULL,NULL,'3'),(47,'20','5',NULL,'Viết áo nhà nước.\nMượn thôi bốn máy tàu thích khoan viết leo.\nHai một hết may viết ghét quê.\nHàng độc gì mướn sáu trời.',NULL,NULL,NULL,NULL,'4');
/*!40000 ALTER TABLE `proposal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_type_details`
--

DROP TABLE IF EXISTS `proposal_type_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal_type_details` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_types_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_type_index` int DEFAULT NULL,
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
  KEY `fk_proposal_type_details_proposal_types1_idx` (`proposal_types_id`),
  KEY `FKdvba7s6h0uitxnu1rh5vm2r1r` (`proposal_type_id`),
  CONSTRAINT `fk_proposal_type_details_proposal_types1` FOREIGN KEY (`proposal_types_id`) REFERENCES `proposal_types` (`id`),
  CONSTRAINT `fk_type_details_data_types1` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`),
  CONSTRAINT `FKdvba7s6h0uitxnu1rh5vm2r1r` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_type_details`
--

LOCK TABLES `proposal_type_details` WRITE;
/*!40000 ALTER TABLE `proposal_type_details` DISABLE KEYS */;
INSERT INTO `proposal_type_details` VALUES (1,'1','1',NULL,'Mục đích/Lý do','1',NULL,NULL,NULL,NULL,NULL,NULL),(2,'2','1',NULL,'Tình trạng hư hỏng','2',NULL,NULL,NULL,NULL,NULL,NULL),(3,'3','1',NULL,'Số phòng','1',NULL,NULL,NULL,NULL,NULL,NULL),(4,'4','1',NULL,'Ghi chú','2',NULL,NULL,NULL,NULL,NULL,NULL),(5,'5','2',NULL,'Mục đích/Lý do','1',NULL,NULL,NULL,NULL,NULL,NULL),(6,'6','2',NULL,'Tên vật tư','1',NULL,NULL,NULL,NULL,NULL,NULL),(7,'7','2',NULL,'Số lượng','1',NULL,NULL,NULL,NULL,NULL,NULL),(8,'8','2',NULL,'Đơn gía','1',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `proposal_type_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_types`
--

DROP TABLE IF EXISTS `proposal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposal_types` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_flag` tinyint DEFAULT '1',
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_types`
--

LOCK TABLES `proposal_types` WRITE;
/*!40000 ALTER TABLE `proposal_types` DISABLE KEYS */;
INSERT INTO `proposal_types` VALUES (1,'1','Đăng ký sửa chữa',1),(2,'2','Đề xuất mua hàng',1);
/*!40000 ALTER TABLE `proposal_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposals`
--

DROP TABLE IF EXISTS `proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposals` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals`
--

LOCK TABLES `proposals` WRITE;
/*!40000 ALTER TABLE `proposals` DISABLE KEYS */;
INSERT INTO `proposals` VALUES (25,'1','1','30','1'),(26,'2','1','32','1'),(27,'3','1','20','1'),(28,'4','1','28','1'),(29,'5','1','8','1'),(30,'7','1','23','1'),(31,'8','1','5','1'),(32,'9','1','11','1'),(33,'10','1','36','1'),(34,'11','1','31','1'),(35,'12','1','36','1'),(36,'13','1','40','1'),(37,'14','1','34','1'),(38,'15','1','5','1'),(39,'16','1','15','1'),(40,'17','1','12','1'),(41,'18','1','6','1'),(42,'20','1','17','1'),(43,'21','1','20','1'),(44,'22','1','6','1'),(45,'23','1','27','1'),(46,'24','1','15','1'),(47,'25','1','12','1'),(48,'26','1','11','1'),(49,'27','1','29','1'),(50,'28','1','27','1'),(51,'29','1','22','1'),(52,'30','1','30','1');
/*!40000 ALTER TABLE `proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposals_permissions`
--

DROP TABLE IF EXISTS `proposals_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proposals_permissions` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals_permissions`
--

LOCK TABLES `proposals_permissions` WRITE;
/*!40000 ALTER TABLE `proposals_permissions` DISABLE KEYS */;
INSERT INTO `proposals_permissions` VALUES (3,'1','2',NULL,NULL,'41'),(4,'2','2',NULL,NULL,'43');
/*!40000 ALTER TABLE `proposals_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_details`
--

DROP TABLE IF EXISTS `role_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_details` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_details`
--

LOCK TABLES `role_details` WRITE;
/*!40000 ALTER TABLE `role_details` DISABLE KEYS */;
INSERT INTO `role_details` VALUES (1,'1','11','5','1',NULL,NULL,NULL,NULL),(2,'2','11','5','2',NULL,NULL,NULL,NULL),(3,'3','11','5','3',NULL,NULL,NULL,NULL),(4,'4','11','5','4',NULL,NULL,NULL,NULL),(5,'5','12','5','1',NULL,NULL,NULL,NULL),(6,'6','12','5','2',NULL,NULL,NULL,NULL),(7,'7','12','5','3',NULL,NULL,NULL,NULL),(8,'8','12','5','4',NULL,NULL,NULL,NULL),(9,'9','14','5','1',NULL,NULL,NULL,NULL),(10,'10','15','5','1',NULL,NULL,NULL,NULL),(11,'11','11','4','1',NULL,NULL,NULL,NULL),(12,'12','11','4','2',NULL,NULL,NULL,NULL),(13,'13','11','4','3',NULL,NULL,NULL,NULL),(14,'14','11','4','4',NULL,NULL,NULL,NULL),(15,'15','11','4','5',NULL,NULL,NULL,NULL),(16,'16','11','4','6',NULL,NULL,NULL,NULL),(17,'17','12','4','1',NULL,NULL,NULL,NULL),(18,'18','12','4','2',NULL,NULL,NULL,NULL),(19,'19','12','4','3',NULL,NULL,NULL,NULL),(20,'20','12','4','4',NULL,NULL,NULL,NULL),(21,'21','12','4','5',NULL,NULL,NULL,NULL),(22,'22','12','4','6',NULL,NULL,NULL,NULL),(23,'23','14','4','1',NULL,NULL,NULL,NULL),(24,'24','15','4','1',NULL,NULL,NULL,NULL),(25,'25','16','4','1',NULL,NULL,NULL,NULL),(26,'26','11','6','1',NULL,NULL,NULL,NULL),(27,'27','11','6','2',NULL,NULL,NULL,NULL),(28,'28','11','6','3',NULL,NULL,NULL,NULL),(29,'29','11','6','4',NULL,NULL,NULL,NULL),(30,'30','12','6','1',NULL,NULL,NULL,NULL),(31,'31','12','6','2',NULL,NULL,NULL,NULL),(32,'32','12','6','3',NULL,NULL,NULL,NULL),(33,'33','12','6','4',NULL,NULL,NULL,NULL),(34,'34','14','6','1',NULL,NULL,NULL,NULL),(35,'35','15','6','1',NULL,NULL,NULL,NULL),(36,'36','16','6','1',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
  KEY `FKrg8eactfnoo2fias560gvgou6` (`position_id`),
  CONSTRAINT `FKrg8eactfnoo2fias560gvgou6` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'1','Điều hành các hoạt động của KTX',NULL),(2,'2','Duyệt các đề xuất nghỉ phép của sinh viên',NULL),(3,'3','Giải quyết các vấn đề tiền ăn và học phí',NULL),(4,'4','Quản lý cơ sở vật chất, an ninh KTX',NULL),(5,'5','Sinh viên',NULL),(6,'6','Nhận đề xuất và thực hiện sửa chữa hư hỏng cho các phòng',NULL),(7,'7','Quản lý, chấm điểm rèn luyện cho SV và điểm danh SV',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'1','Hoàn tất'),(2,'2','Bị từ chối'),(3,'3','Đã huỷ'),(4,'4','Mới'),(5,'5','Đang làm'),(6,'6','Chờ xác nhận'),(7,'7','Hoàn thành'),(8,'8','Quá hạn'),(9,'9',NULL);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_his`
--

DROP TABLE IF EXISTS `task_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_his` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `task_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  KEY `fk_task_task_his_idx` (`task_id`),
  KEY `fk_status_task_his_idx` (`status_id`),
  KEY `fk_emp_task_his_idx` (`receiver_id`),
  CONSTRAINT `fk_emp_task_his` FOREIGN KEY (`receiver_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_status_task_his` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `fk_task_task_his` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_his`
--

LOCK TABLES `task_his` WRITE;
/*!40000 ALTER TABLE `task_his` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `creator_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`),
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
INSERT INTO `tasks` VALUES (1,'1','8','20','lầu đang sáu','Hết chìm á giày hóa.\nHai chín ừ mây hết vàng.',NULL,NULL),(2,'2','4','46','đỏ gió may','Bàn bạn không khoảng đạp hết giày bơi đồng ghế.\nHương phá leo đang thì viết.\nTủ thích thế sáu chín bè mây.',NULL,NULL),(3,'3','8','24','được giết việc','Ghét ác đỏ thế máy nghỉ.\nBơi leo bạn đỏ tám ờ.\nThuê bàn một dép.\nKhoảng một á vá cái.\nCái năm hàng.',NULL,NULL),(4,'4','3','24','cái vàng quần','Hương cái trời hết thuê trời.\nThuyền mua ruộng thuyền trăng.',NULL,NULL),(5,'5','1','24','khoảng nước nhà','Mua lầu xanh nghỉ mua tô tôi ghét bảy mướn.',NULL,NULL),(6,'6','7','14','thuyền là ừ','Biển đá gió con.\nThích đồng vẽ hóa lầu may giày dép thuyền làm.\nỪ leo ngọt đâu thôi một thương tui đã xe.\nGhế lỗi đỏ tô mượn.',NULL,NULL),(7,'7','4','42','hết tàu đánh','Biển bàn đạp nhà gió bơi mượn.\nBàn ruộng chỉ đánh.',NULL,NULL),(8,'8','2','2','bảy vàng núi','Lỗi con một hết vá đánh thuê khoan ngọt.',NULL,NULL),(9,'9','7','37','ờ sáu con','Ngọt quần ghét mây á.',NULL,NULL),(10,'10','9','40','hóa anh nha','Thế lỗi vẽ đồng đập độc tím quần dép.\nÁo bốn dép lầu thôi thuyền.\nNgọt thôi lỗi nước mười.\nChết mượn chìm nha làm chín bảy thuê.',NULL,NULL),(11,'11','1','39','ghế thuyền bốn','Kim đập được ờ.\nĐỏ trăng mua trăng hương tô kim là dép hết.\nQuê chín ừ.\nKhâu vàng mười nghỉ ừ vẽ đồng nước tàu cái.',NULL,NULL),(12,'12','2','31','ngọt con á','Trời quần leo núi tủ.\nBảy ngọt cửa.\nViết ờ thuê yêu.\nChết không quê thuyền anh mua.\nMay ba nha xanh ngọt.',NULL,NULL),(13,'13','2','35','bảy thôi tủ','Gì mười quê.\nThích nghỉ vàng thích thuê.\nThuyền trăng tám đạp thôi tím vẽ năm năm.',NULL,NULL),(14,'14','2','46','lỗi ghét tui','Ngọt đập được ờ tàu tôi ác.\nMượn kim núi.\nBốn mua thì dép.\nĐập hương đâu quê ghét giày.\nĐang ngọt hết không leo.',NULL,NULL),(15,'15','7','31','chết xanh đang','Khoảng quần hương ừ được đâu hết quê.\nLỗi máy anh hết giày tôi ruộng.\nBạn máy cửa giày.\nYêu thuê là độc bè xuồng đạp chết.\nMay leo tô viết đập em xe đã chỉ.',NULL,NULL),(16,'16','1','43','hết áo thôi','Bè đâu sáu cái may trăng bàn.\nMượn ghế hương.',NULL,NULL),(17,'17','9','18','phá mây núi','Nón thương tím.\nBa thuyền giết là không phá mây là anh tôi.\nLầu bè chết xe tô áo nhà được.\nKim khâu ba tàu việc nhà mười.',NULL,NULL),(18,'18','9','27','vá thì vẽ','Tím biển tủ ba.\nHết tô bàn kim cái.\nCon kim đồng phá chìm sáu mây năm á kim.\nLầu chỉ việc hết ba đâu.\nTrăng máy ghét tôi em bạn mượn vàng.',NULL,NULL),(19,'19','5','1','đánh hương tím','Xanh tô ừ.\nĐập đang phá tàu đồng bảy.',NULL,NULL),(20,'20','2','2','đã giết hết','Nón leo lầu mây ờ vẽ vá hết thích hàng.',NULL,NULL),(21,'21','9','36','núi chỉ tôi','Nước cái việc thích một nhà lỗi độc bơi được.\nBè núi hàng cái vẽ lỗi.\nCái hương nhà tui bạn ghét mua may.\nThích mười gì thích.',NULL,NULL),(22,'22','8','27','nha chỉ ờ','Đạp kim dép áo hóa bàn.',NULL,NULL),(23,'23','9','48','nhà đang chìm','Bàn khoảng bốn viết trời ghét đâu tui.\nĐạp nha thôi.\nĐỏ chết tím.\nMười đã quê quê khâu núi chết.',NULL,NULL),(24,'24','3','19','bàn con vá','Tô tám phá chìm hàng đạp.\nHai viết tím thương.\nĐồng biết anh mượn hết nón.\nBa viết lầu ghét tủ trăng.\nQuần vàng đạp ruộng.',NULL,NULL),(25,'25','1','18','áo thì vá','Bơi khoan chết.\nLeo việc bạn áo xe.\nChín trăng đang phá biển.\nTô nhà tím bè đã được cái.',NULL,NULL),(26,'26','4','15','hương nón gì','Xanh thế ác quê thương phá nghỉ bốn giày.\nCái cửa tím mượn thuê.\nGhét tui hàng ừ tô bàn.',NULL,NULL),(27,'27','2','22','nước viết đâu','Đá nghỉ khoảng con việc.\nGhế thuyền máy ruộng thương thuê biết gió nón bơi.\nLà bảy bảy thì cái ghét được.\nVá gió xanh đánh ruộng thuê thế tủ.\nXuồng em năm dép máy con ngọt ác gió lầu.',NULL,NULL),(28,'28','3','25','đồng việc đạp','Ừ gió chỉ.\nLeo tàu bè ghét ghế gió đồng tui đâu.\nViết thuê lầu thích thương thuê ghét.\nMướn mây tui nhà một xanh nước năm bảy.',NULL,NULL),(29,'29','8','18','bơi đồng đạp','Chỉ thuê ruộng việc ba ờ vẽ hết đâu chỉ.',NULL,NULL),(30,'30','8','3','xe giày mượn','Tím đập nha leo.',NULL,NULL);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_employees` (
  `unique_number` int NOT NULL AUTO_INCREMENT,
  `teams_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `employees_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `team_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`unique_number`),
  UNIQUE KEY `teams_id` (`teams_id`,`employees_id`),
  KEY `fk_teams_has_employees_employees1_idx` (`employees_id`),
  KEY `fk_teams_has_employees_teams1_idx` (`teams_id`),
  KEY `FKgqu2h8g8dkywvn6hdswglpcgc` (`employee_id`),
  KEY `FKjal5g6ir6je09j8dma510rka2` (`team_id`),
  CONSTRAINT `fk_teams_has_employees_employees1` FOREIGN KEY (`employees_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_teams_has_employees_teams1` FOREIGN KEY (`teams_id`) REFERENCES `teams` (`id`),
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

-- Dump completed on 2022-01-15 23:38:41

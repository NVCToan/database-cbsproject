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
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `approval_step_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `postion_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_approval_step_details_approval_steps1_idx` (`approval_step_id`),
  KEY `fk_approval_step_details_employees1_idx` (`employee_id`),
  KEY `fk_approval_step_details_departments1_idx` (`department_id`),
  KEY `fk_approval_step_details_positions1_idx` (`position_id`),
  KEY `FK30w3775elc9in4ufe3122b4v8` (`postion_id`),
  CONSTRAINT `FK30w3775elc9in4ufe3122b4v8` FOREIGN KEY (`postion_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `fk_approval_step_details_approval_steps1` FOREIGN KEY (`approval_step_id`) REFERENCES `approval_steps` (`id`),
  CONSTRAINT `fk_approval_step_details_departments1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_approval_step_details_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_approval_step_details_positions1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_step_details`
--

LOCK TABLES `approval_step_details` WRITE;
/*!40000 ALTER TABLE `approval_step_details` DISABLE KEYS */;
INSERT INTO `approval_step_details` VALUES ('1','1',NULL,NULL,'16',NULL),('2','1',NULL,NULL,'7',NULL),('3','1',NULL,NULL,'10',NULL),('4','1',NULL,NULL,'13',NULL);
/*!40000 ALTER TABLE `approval_step_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_steps`
--

DROP TABLE IF EXISTS `approval_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `approval_steps` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `approval_step_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `approval_step_index` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `proposal_type_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_approval_steps_proposal_types1_idx` (`proposal_type_id`),
  CONSTRAINT `fk_approval_steps_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_steps`
--

LOCK TABLES `approval_steps` WRITE;
/*!40000 ALTER TABLE `approval_steps` DISABLE KEYS */;
INSERT INTO `approval_steps` VALUES ('1','Phê duyệt','1','1'),('2','Kế toán','1','2');
/*!40000 ALTER TABLE `approval_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` tinyint(4) DEFAULT '1',
  `active_flag` tinyint(4) DEFAULT '1',
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
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
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES ('1','Textarea',NULL),('10','Repeater',NULL),('11','Label',NULL),('2','Dropdown',NULL),('3','Radio',NULL),('4','Checkbox',NULL),('5','Number',NULL),('6','Calculator',NULL),('7','Relation',NULL),('8','Attachment',NULL),('9','Datetime',NULL);
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `farther_department_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `father_department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('1','Ban Quản Lý KTX Cỏ May','0','0',NULL,NULL,NULL,NULL,NULL),('10','Truyền thông','1','0',NULL,NULL,NULL,NULL,NULL),('11','Sinh viên','1','0',NULL,NULL,NULL,NULL,NULL),('2','Bảo trì - Bảo dưỡng CSVC KTX','1','0',NULL,NULL,NULL,NULL,NULL),('3','Đội sửa chữa','2','0',NULL,NULL,NULL,NULL,NULL),('4','Tầng 1','2','0',NULL,NULL,NULL,NULL,NULL),('5','Tầng 2','2','0',NULL,NULL,NULL,NULL,NULL),('6','Tầng 3','2','0',NULL,NULL,NULL,NULL,NULL),('7','Tầng trệt','2','0',NULL,NULL,NULL,NULL,NULL),('8','Kiểm tra và giám sát sinh viên','1','0',NULL,NULL,NULL,NULL,NULL),('9','Tổ chức sự kiện','1','0',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments_employees`
--

DROP TABLE IF EXISTS `departments_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments_employees` (
  `employee_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`department_id`,`employee_id`),
  KEY `FKqhmnr4xyxbjmgtfl3tyj5vl5` (`employee_id`),
  CONSTRAINT `FKgw4a3p764um6tpudrwbhmbsq9` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `FKqhmnr4xyxbjmgtfl3tyj5vl5` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments_employees`
--

LOCK TABLES `departments_employees` WRITE;
/*!40000 ALTER TABLE `departments_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `departments_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employees` (
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
  `active_flag` tinyint(4) DEFAULT '1',
  `department_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('1','Hùng Thịnh Đinh','0','ThyAnh79@yahoo.com','023 9324 5592',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('10','Thanh Tuấn Vương','0','VnHng61@hotmail.com','027 6223 0001',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('11','Trung Nguyên Nguyễn','0','CngLp_inh@yahoo.com','022 3304 2135',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('12','Bình Ðịnh Phùng','0','TrcLinh56@hotmail.com','026 8175 7901',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('13','Huy Khiêm Mai','0','Phn_Trn@yahoo.com','0210 4460 6144',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('14','Mrs. Hữu Nghĩa Đặng','0','ThiVn94@yahoo.com','029 9593 5529',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('15','Quỳnh Nhung Phạm I','0','MngLong_Ng39@yahoo.com','0294 7848 4548',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('16','Lan Vy Hà','0','NhMai.Trng@yahoo.com','0217 2635 1851',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('17','Diệu Ngà Bùi','0','KhcNinh94@hotmail.com','0278 5831 9727',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('18','Hiếu Hạnh Vũ PhD','0','VnThng.Phan18@yahoo.com','0223 5664 9908',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('19','Lệ Huyền Tăng','0','PhcNhn.Hong52@gmail.com','0274 4735 7681',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('2','An Tường Trịnh','0','Khnhan.Phm@yahoo.com','022 0066 6557',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('20','Minh Huấn Đỗ','0','MinhKhi.Phm66@yahoo.com','0260 1866 9551',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('21','Tịnh Như Ngô','0','Tn.Phan@gmail.com','026 0060 0384',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('22','Hải Phương Tô','0','ThnhCng.H81@hotmail.com','024 5176 3533',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('23','Huy Tường Tô','0','LiuOanh.Trng@hotmail.com','028 1997 8601',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('24','Nhã Yến Tô','0','CngHiu27@yahoo.com','0234 0783 5816',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('25','Kiên Cường Tăng MD','0','KimQuyn_Vng@yahoo.com','026 7006 4223',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('26','Nhã Hồng Lâm','0','DuyHng56@hotmail.com','029 7852 2092',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('27','Bảo Anh Lâm','0','GingUyn.Ng25@gmail.com','021 9353 3989',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('28','Việt Cương Dương','0','DLm.Trnh39@gmail.com','027 2231 3461',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('29','Kiên Bình Bùi','0','ThDuyt28@gmail.com','0269 0985 0461',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('3','Hoàng Duệ Trần I','0','NhAnh_Mai@hotmail.com','026 9470 9508',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('30','Mỹ Ngọc Dương','0','KhiTm_Vng@yahoo.com','022 4287 3879',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('31','Kim Sa Phạm','0','DuyBo_Vng@gmail.com','0296 0190 0409',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('32','Mr. Yến Loan Vương','0','VitDng_L@hotmail.com','028 5899 0562',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('33','Phương Tâm Trần','0','KiuDim.H@yahoo.com','023 9445 8427',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('34','Thanh Thư Bùi','0','ThanhVy13@gmail.com','0298 1083 6068',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('35','Ms. Quốc Hải Phùng','0','BoGiang_T@gmail.com','026 6671 2725',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('36','Miss Ngọc Khanh Phan','0','Thnht_Vng36@yahoo.com','0256 1592 5165',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('37','Thượng Cường Hoàng','0','ThinKim41@hotmail.com','0217 5648 8211',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('38','Tiểu Mi Trịnh','0','KhnhGiang18@gmail.com','029 1028 1191',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('39','Chấn Hùng Phùng','0','DuyNhng_H@gmail.com','0221 7287 8299',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('4','Ms. Thành Thiện Vũ','0','Tn.Ng@hotmail.com','026 3632 1049',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('40','Ánh Tuyết Đặng PhD','0','LanChi5@gmail.com','0228 8621 2541',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('41','Nguyễn Minh Dũng','0','nguyenminhdungtd98@gmail.com','0763934399',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('42','Nguyễn Văn Ký','0','nguyenky@gmail.com','03428284832',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('43','Nguyễn Võ Công Toàn','0','congtoan@gmail.com','0957839282',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('44','Thiên Thảo','0','thienthao@gmail.com','094883123',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('45','Vũ Thị Thu Thảo','0','thuthao@gmail.com','0948843123',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('46','Nguyễn Duỹ Long','0','duylong@gmail.com','0948843123',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('47','Nguyễn Thanh Tốt','0','thanhtot@gmail.com','0948843123',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('48','Minh Hồ','0','minhho@gmail.com','091263823',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('5','Ðức Thành Lê','0','PhngUyn65@yahoo.com','0279 4142 4708',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('6','Thượng Nghị Hồ','0','nhKim43@hotmail.com','0256 6920 8794',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('7','Ms. Hưng Ðạo Nguyễn','0','ThuDuyn_Phan@hotmail.com','0245 1679 8200',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('8','Việt Dũng Dương','0','KimThng_Vng14@hotmail.com','026 2312 7134',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL),('9','Hiếu Phong Dương','0','DngKhnh.Phan@yahoo.com','0295 6465 3055',NULL,NULL,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menu` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_index` int(11) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES ('1','Hợp đồng kinh tế'),('10','Danh mục kiểm tra'),('11','Công việc'),('12','Đề xuất'),('13','Loại đề xuất'),('14','Nhân viên'),('15','Phòng ban'),('16','Chức vụ'),('17','Kho'),('18','Vai trò'),('19','Báo cáo'),('2','Hợp đồng'),('20','Khách hàng'),('21','Người dùng'),('22','Chức năng công ty'),('23','Thẻ'),('24','Phân loại khách hàng'),('25','Sản phẩm'),('26','Sản phẩm'),('3','Cảnh báo/nhắc nhở'),('4','Thiết bị'),('5','Phụ tùng'),('6','Cảm biến'),('8','Cảm biến'),('9','Danh mục');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `permissions` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES ('1','Xem'),('2','Tạo'),('3','Sửa'),('4','Xoá'),('5','Xem hết'),('6','Sửa hết'),('7','Xoá hết');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `positions` (
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
  PRIMARY KEY (`id`),
  KEY `fk_chucvu_phongban1_idx` (`department_id`),
  KEY `fk_positions_teams1_idx` (`team_id`),
  KEY `fk_role_position_idx` (`role_id`),
  CONSTRAINT `fk_chucvu_phongban1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_positions_teams1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `fk_role_position` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES ('1','Thành viên ban quản lý KTX','1',1,NULL,NULL,NULL,NULL,NULL,'1'),('10','Trưởng tầng 2','5',1,NULL,NULL,NULL,NULL,NULL,'6'),('11','Trưởng phòng sinh viên tầng 2','5',0,NULL,NULL,NULL,NULL,NULL,'5'),('12','Hỗ trợ trưởng tầng','6',0,NULL,NULL,NULL,NULL,NULL,'5'),('13','Trưởng tầng 3','6',0,NULL,NULL,NULL,NULL,NULL,'6'),('14','Trưởng phòng sinh viên tầng 3','6',0,NULL,NULL,NULL,NULL,NULL,'5'),('15','Hỗ trợ trưởng tầng','7',0,NULL,NULL,NULL,NULL,NULL,'5'),('16','Trưởng tầng trệt','7',1,NULL,NULL,NULL,NULL,NULL,'6'),('17','Trưởng phòng sinh viên tầng trệt','7',0,NULL,NULL,NULL,NULL,NULL,'5'),('18','Thành viên','8',0,NULL,NULL,NULL,NULL,NULL,'5'),('19','Trưởng đội 2','8',1,NULL,NULL,NULL,NULL,NULL,NULL),('2','Giám thị','1',0,NULL,NULL,NULL,NULL,NULL,'2'),('3','Kế toán','1',0,NULL,NULL,NULL,NULL,NULL,'3'),('4','Trưởng đội 1','2',1,NULL,NULL,NULL,NULL,NULL,'6'),('5','Thành viên','3',0,NULL,NULL,NULL,NULL,NULL,'5'),('6','Hỗ trợ trưởng tầng','4',0,NULL,NULL,NULL,NULL,NULL,'5'),('7','Trưởng tầng 1','4',1,NULL,NULL,NULL,NULL,NULL,'6'),('8','Trưởng phòng sinh viên tầng 1','4',0,NULL,NULL,NULL,NULL,NULL,'5'),('9','Hỗ trợ trưởng tầng','5',0,NULL,NULL,NULL,NULL,NULL,'5');
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_employees`
--

DROP TABLE IF EXISTS `positions_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `positions_employees` (
  `employee_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`employee_id`,`position_id`),
  KEY `fk_employees_has_positions_positions1_idx` (`position_id`),
  KEY `fk_employees_has_positions_employees1_idx` (`employee_id`),
  CONSTRAINT `fk_employees_has_positions_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_employees_has_positions_positions1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_employees`
--

LOCK TABLES `positions_employees` WRITE;
/*!40000 ALTER TABLE `positions_employees` DISABLE KEYS */;
INSERT INTO `positions_employees` VALUES ('41','1'),('45','10'),('12','11'),('2','11'),('22','11'),('3','11'),('37','11'),('4','11'),('42','11'),('6','11'),('9','11'),('46','13'),('10','14'),('11','14'),('12','14'),('13','14'),('16','14'),('27','14'),('29','14'),('31','14'),('33','14'),('46','14'),('47','16'),('1','17'),('12','17'),('15','17'),('22','17'),('23','17'),('25','17'),('28','17'),('38','17'),('48','19'),('42','3'),('43','4'),('17','8'),('20','8'),('21','8'),('22','8'),('28','8'),('29','8'),('32','8'),('34','8'),('42','8');
/*!40000 ALTER TABLE `positions_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_has_employees`
--

DROP TABLE IF EXISTS `positions_has_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `positions_has_employees` (
  `position_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`employee_id`,`position_id`),
  KEY `FKkw3pwwbglkt6tjm01metfi6bx` (`position_id`),
  CONSTRAINT `FKk92oo7kakp24nt1iyrp0i11q4` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `FKkw3pwwbglkt6tjm01metfi6bx` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal_details` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_detail_index` int(11) DEFAULT NULL,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proposal_details_proposals1_idx` (`proposal_id`),
  CONSTRAINT `fk_proposal_details_proposals1` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_details`
--

LOCK TABLES `proposal_details` WRITE;
/*!40000 ALTER TABLE `proposal_details` DISABLE KEYS */;
INSERT INTO `proposal_details` VALUES ('10','9',1,'Nón mây thế phá nước bơi.',NULL,NULL,NULL,NULL,NULL),('11','10',1,'Đỏ ghét chỉ ờ mướn viết chết thế.',NULL,NULL,NULL,NULL,NULL),('12','11',1,'Viết viết một hai.',NULL,NULL,NULL,NULL,NULL),('13','12',1,'Giày độc thuê gió nghỉ đánh được mây là ngọt.',NULL,NULL,NULL,NULL,NULL),('14','13',1,'Việc nhà lỗi ba vá leo tám.',NULL,NULL,NULL,NULL,NULL),('15','14',1,'Bạn vẽ núi.',NULL,NULL,NULL,NULL,NULL),('16','15',1,'Ba cái tàu.',NULL,NULL,NULL,NULL,NULL),('17','16',1,'Thương tôi yêu chìm tô thì bè tím cái.',NULL,NULL,NULL,NULL,NULL),('18','17',1,'Tôi một may em một ghét thích núi.',NULL,NULL,NULL,NULL,NULL),('19','18',1,'Xanh đang sáu vàng con vá được.',NULL,NULL,NULL,NULL,NULL),('2','1',1,'Hết bàn yêu em gió đồng hương.',NULL,NULL,NULL,NULL,NULL),('20','19',1,'Mượn tám thích tám xuồng phá ba được bàn.',NULL,NULL,NULL,NULL,NULL),('21','20',1,'Ừ hương thuyền yêu viết hết khoan ờ việc.',NULL,NULL,NULL,NULL,NULL),('22','21',1,'Anh sáu phá thế máy dép cái đánh.',NULL,NULL,NULL,NULL,NULL),('23','22',1,'Đâu dép xuồng mướn biển thích bàn.',NULL,NULL,NULL,NULL,NULL),('24','23',1,'Nghỉ anh đạp kim bốn không.',NULL,NULL,NULL,NULL,NULL),('25','24',1,'Thuyền bốn hết đạp hai.',NULL,NULL,NULL,NULL,NULL),('26','25',1,'Thì việc vẽ.',NULL,NULL,NULL,NULL,NULL),('27','26',1,'Thuê đánh máy dép tím thế bè thuê mướn.',NULL,NULL,NULL,NULL,NULL),('28','27',1,'Giày biết khâu hương biển thôi hai em tô là.',NULL,NULL,NULL,NULL,NULL),('29','28',1,'Vàng nón khoan đập á.',NULL,NULL,NULL,NULL,NULL),('3','2',1,'Hương là trăng làm đỏ thế trăng chìm khoảng.',NULL,NULL,NULL,NULL,NULL),('30','29',1,'Đạp á đỏ khoan máy một ghét.',NULL,NULL,NULL,NULL,NULL),('31','30',1,'Khoảng ghế đá chỉ tô.',NULL,NULL,NULL,NULL,NULL),('32','30',2,'Đã xuồng em giày được xe.\nBiết mười đang nón mua lầu làm tủ.',NULL,NULL,NULL,NULL,NULL),('33','30',3,'3010',NULL,NULL,NULL,NULL,NULL),('34','30',4,'Tàu đỏ tô trăng tám lỗi gió.\nBốn khâu biết trăng khoảng ác gió mướn tủ chín.\nHết mười nước thì tám bàn.\nNhà tám ác.\nThì dép bàn.',NULL,NULL,NULL,NULL,NULL),('4','3',1,'Ghế con tui may xanh xuồng một mượn bốn đánh.',NULL,NULL,NULL,NULL,NULL),('5','4',1,'Chín tàu nước bè chìm áo.',NULL,NULL,NULL,NULL,NULL),('6','5',1,'Mua giết tím em hàng cửa áo.',NULL,NULL,NULL,NULL,NULL),('7','6',1,'Vẽ lỗi hết trời leo em núi làm mười cửa.',NULL,NULL,NULL,NULL,NULL),('8','7',1,'Hai hai bốn bốn đồng mua giày ghế hết.',NULL,NULL,NULL,NULL,NULL),('9','8',1,'Đánh em nón hàng hàng.',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `proposal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_permissions`
--

DROP TABLE IF EXISTS `proposal_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal_permissions` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_type_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proposal_permissions_proposal_types1_idx` (`proposal_type_id`),
  KEY `fk_proposal_permissions_departments1_idx` (`department_id`),
  KEY `fk_proposal_permissions_positions1_idx` (`position_id`),
  KEY `fk_proposal_permissions_employees1_idx` (`employee_id`),
  CONSTRAINT `fk_proposal_permissions_departments1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_proposal_permissions_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_proposal_permissions_positions1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `fk_proposal_permissions_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_permissions`
--

LOCK TABLES `proposal_permissions` WRITE;
/*!40000 ALTER TABLE `proposal_permissions` DISABLE KEYS */;
INSERT INTO `proposal_permissions` VALUES ('1','2',NULL,NULL,'41'),('2','2',NULL,NULL,'43');
/*!40000 ALTER TABLE `proposal_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_type_details`
--

DROP TABLE IF EXISTS `proposal_type_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal_type_details` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_types_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_type_index` int(11) DEFAULT NULL,
  `field_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_type_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `proposal_type_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_details_data_types1_idx` (`data_type_id`),
  KEY `fk_proposal_type_details_proposal_types1_idx` (`proposal_types_id`),
  KEY `FKdvba7s6h0uitxnu1rh5vm2r1r` (`proposal_type_id`),
  CONSTRAINT `FKdvba7s6h0uitxnu1rh5vm2r1r` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`),
  CONSTRAINT `fk_proposal_type_details_proposal_types1` FOREIGN KEY (`proposal_types_id`) REFERENCES `proposal_types` (`id`),
  CONSTRAINT `fk_type_details_data_types1` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_type_details`
--

LOCK TABLES `proposal_type_details` WRITE;
/*!40000 ALTER TABLE `proposal_type_details` DISABLE KEYS */;
INSERT INTO `proposal_type_details` VALUES ('1','1',1,'Mục đích/Lý do','1',NULL,NULL,NULL,NULL,NULL,NULL),('2','1',2,'Tình trạng hư hỏng','2',NULL,NULL,NULL,NULL,NULL,NULL),('3','1',3,'Số phòng','1',NULL,NULL,NULL,NULL,NULL,NULL),('4','1',4,'Ghi chú','2',NULL,NULL,NULL,NULL,NULL,NULL),('5','2',1,'Mục đích/Lý do','1',NULL,NULL,NULL,NULL,NULL,NULL),('6','2',2,'Tên vật tư','1',NULL,NULL,NULL,NULL,NULL,NULL),('7','2',3,'Số lượng','1',NULL,NULL,NULL,NULL,NULL,NULL),('8','2',4,'Đơn gía','1',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `proposal_type_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_types`
--

DROP TABLE IF EXISTS `proposal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal_types` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_flag` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_types`
--

LOCK TABLES `proposal_types` WRITE;
/*!40000 ALTER TABLE `proposal_types` DISABLE KEYS */;
INSERT INTO `proposal_types` VALUES ('1','Đăng ký sửa chữa',1),('2','Đề xuất mua hàng',1);
/*!40000 ALTER TABLE `proposal_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposals`
--

DROP TABLE IF EXISTS `proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposals` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `proposal_type_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `creator_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dexuat_TrangThai1_idx` (`status_id`),
  KEY `fk_proposals_proposal_types1_idx` (`proposal_type_id`),
  KEY `fk_proposals_employees1_idx` (`creator_id`),
  CONSTRAINT `fk_dexuat_TrangThai1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `fk_proposals_employees1` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_proposals_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals`
--

LOCK TABLES `proposals` WRITE;
/*!40000 ALTER TABLE `proposals` DISABLE KEYS */;
INSERT INTO `proposals` VALUES ('1','1','3','5'),('10','1','35','5'),('11','1','3','5'),('12','1','20','5'),('13','1','3','5'),('14','1','8','5'),('15','1','10','5'),('16','1','3','5'),('17','1','40','5'),('18','1','33','5'),('19','1','38','5'),('2','1','31','5'),('20','1','29','5'),('21','1','18','5'),('22','1','29','5'),('23','1','17','5'),('24','1','27','5'),('25','1','6','5'),('26','1','26','5'),('27','1','5','5'),('28','1','8','5'),('29','1','40','5'),('3','1','17','5'),('30','1','18','5'),('4','1','27','5'),('5','1','17','5'),('6','1','25','5'),('7','1','18','5'),('8','1','7','5'),('9','1','31','5');
/*!40000 ALTER TABLE `proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_details`
--

DROP TABLE IF EXISTS `role_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role_details` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `option_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `role_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `permission_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role_details_options1_idx` (`option_id`),
  KEY `fk_role_details_roles1_idx` (`role_id`),
  KEY `fk_role_details_permissions1_idx` (`permission_id`),
  CONSTRAINT `fk_role_details_options1` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`),
  CONSTRAINT `fk_role_details_permissions1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `fk_role_details_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_details`
--

LOCK TABLES `role_details` WRITE;
/*!40000 ALTER TABLE `role_details` DISABLE KEYS */;
INSERT INTO `role_details` VALUES ('1','11','5','1',NULL,NULL,NULL,NULL),('10','15','5','1',NULL,NULL,NULL,NULL),('11','11','4','1',NULL,NULL,NULL,NULL),('12','11','4','2',NULL,NULL,NULL,NULL),('13','11','4','3',NULL,NULL,NULL,NULL),('14','11','4','4',NULL,NULL,NULL,NULL),('15','11','4','5',NULL,NULL,NULL,NULL),('16','11','4','6',NULL,NULL,NULL,NULL),('17','12','4','1',NULL,NULL,NULL,NULL),('18','12','4','2',NULL,NULL,NULL,NULL),('19','12','4','3',NULL,NULL,NULL,NULL),('2','11','5','2',NULL,NULL,NULL,NULL),('20','12','4','4',NULL,NULL,NULL,NULL),('21','12','4','5',NULL,NULL,NULL,NULL),('22','12','4','6',NULL,NULL,NULL,NULL),('23','14','4','1',NULL,NULL,NULL,NULL),('24','15','4','1',NULL,NULL,NULL,NULL),('25','16','4','1',NULL,NULL,NULL,NULL),('26','11','6','1',NULL,NULL,NULL,NULL),('27','11','6','2',NULL,NULL,NULL,NULL),('28','11','6','3',NULL,NULL,NULL,NULL),('29','11','6','4',NULL,NULL,NULL,NULL),('3','11','5','3',NULL,NULL,NULL,NULL),('30','12','6','1',NULL,NULL,NULL,NULL),('31','12','6','2',NULL,NULL,NULL,NULL),('32','12','6','3',NULL,NULL,NULL,NULL),('33','12','6','4',NULL,NULL,NULL,NULL),('34','14','6','1',NULL,NULL,NULL,NULL),('35','15','6','1',NULL,NULL,NULL,NULL),('36','16','6','1',NULL,NULL,NULL,NULL),('4','11','5','4',NULL,NULL,NULL,NULL),('5','12','5','1',NULL,NULL,NULL,NULL),('6','12','5','2',NULL,NULL,NULL,NULL),('7','12','5','3',NULL,NULL,NULL,NULL),('8','12','5','4',NULL,NULL,NULL,NULL),('9','14','5','1',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `role_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrg8eactfnoo2fias560gvgou6` (`position_id`),
  CONSTRAINT `FKrg8eactfnoo2fias560gvgou6` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('1','Điều hành các hoạt động của KTX',NULL),('2','Duyệt các đề xuất nghỉ phép của sinh viên',NULL),('3','Giải quyết các vấn đề tiền ăn và học phí',NULL),('4','Quản lý cơ sở vật chất, an ninh KTX',NULL),('5','Sinh viên',NULL),('6','Nhận đề xuất và thực hiện sửa chữa hư hỏng cho các phòng',NULL),('7','Quản lý, chấm điểm rèn luyện cho SV và điểm danh SV',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `statuses` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES ('1','Hoàn tất'),('2','Bị từ chối'),('3','Đã huỷ'),('4','Mới'),('5','Đang làm'),('6','Chờ xác nhận'),('7','Hoàn thành'),('8','Quá hạn'),('9','Nhầm');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_details`
--

DROP TABLE IF EXISTS `task_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task_details` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `receiver_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `task_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_GiaoViec_nhanvien1_idx` (`receiver_id`),
  KEY `fk_task_details_tasks1_idx` (`task_id`),
  CONSTRAINT `fk_GiaoViec_nhanvien1` FOREIGN KEY (`receiver_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_task_details_tasks1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_details`
--

LOCK TABLES `task_details` WRITE;
/*!40000 ALTER TABLE `task_details` DISABLE KEYS */;
INSERT INTO `task_details` VALUES ('1','35','1','leo làm xe','Đánh nước tàu bảy.\nCửa may lỗi biển em tủ thương làm là ngọt.\nTrăng đang quần thuyền mua ờ mướn ờ nước.\nTím khoảng leo chìm đạp ác.\nVẽ mượn quê.',NULL,NULL,NULL,NULL),('10','20','4','ruộng leo máy','Quê ba đánh anh bàn khâu hóa việc hương.\nBàn nước hết mướn khâu đá ác yêu.\nNha xuồng cái giày việc tôi bảy vàng ghét khoan.\nĐồng tôi thương một gì.',NULL,NULL,NULL,NULL),('11','45','4','tím đã nghỉ','Bảy núi khoan độc một.\nThích cái đập hết dép cửa giày ờ chết gì.\nTrời đã việc thì thích dép máy ác máy chín.',NULL,NULL,NULL,NULL),('12','11','4','mua biết áo','Mượn chỉ mây nhà ờ tôi tím ừ bàn mua.',NULL,NULL,NULL,NULL),('13','38','5','chỉ kim lầu','Cái xanh thương ba.\nTui đâu thuê thôi thôi xuồng biết.\nTôi phá kim.\nLỗi đâu núi đang.',NULL,NULL,NULL,NULL),('14','10','5','ừ hết viết','Chìm viết đá.\nBạn biết cái đã leo nghỉ tàu.',NULL,NULL,NULL,NULL),('15','20','5','bốn bạn thuê','Sáu cái hai khâu đang quần được ruộng ngọt khâu.\nKhoan thôi chết giết thích lầu quê.',NULL,NULL,NULL,NULL),('16','32','6','tám nước thuyền','Mười nón thì hóa bơi anh vẽ trời.\nLỗi thương hóa đã chỉ.',NULL,NULL,NULL,NULL),('17','38','6','leo kim không','Viết quần leo bàn biết leo xanh cửa trăng.\nPhá quê yêu tô thì leo quê trời hàng.',NULL,NULL,NULL,NULL),('18','37','6','bè mua hết','Ừ ba núi may tôi đồng độc nón.',NULL,NULL,NULL,NULL),('19','46','7','bảy thương đỏ','Tám hàng đập đang chín hương đồng.\nHương bạn tô ba ờ anh á.\nAnh ghét hương trăng bạn bè nha.\nViết cái là đánh khoan.',NULL,NULL,NULL,NULL),('2','16','1','tím vẽ xe','Giày xuồng thuê em mua.\nĐá hàng dép vá chỉ á đồng lỗi.\nMười một thôi bảy bảy chỉ nước hóa cửa vá.\nĐâu leo xuồng tàu gió đạp nón hàng.\nHàng trời hết ờ ghế hết.',NULL,NULL,NULL,NULL),('20','28','7','thích nha á','Hai hết nghỉ thương ờ đã.\nPhá nha hết tôi ruộng núi.\nRuộng chết áo.\nMây chỉ sáu là bạn trời giày khoan.\nBạn yêu tui nón.',NULL,NULL,NULL,NULL),('21','35','7','tủ vàng chỉ','Ruộng mướn xuồng vá chỉ.\nRuộng ừ áo xanh ờ khoảng quê.\nTrăng khoan đập em máy vá thuyền.\nGhét con hàng hóa mười viết.\nXuồng hương tủ.',NULL,NULL,NULL,NULL),('22','47','8','em nghỉ chết','Được quần trời tím.\nĐỏ nhà việc mười xanh là thuê đâu.\nNha chỉ cửa nha dép máy vá.',NULL,NULL,NULL,NULL),('23','1','8','bạn vẽ khoảng','Bạn bảy bốn là bảy đã xuồng mướn.\nViết ngọt hương hóa tui đỏ đá nghỉ.',NULL,NULL,NULL,NULL),('24','30','8','ừ tím lầu','Nhà thương gì mười mây đập tui.\nĐồng vàng tô ba cửa sáu tô nha hàng.',NULL,NULL,NULL,NULL),('25','15','9','khoảng bè giày','Đâu không tím xuồng khoan.\nNước bè cái leo chỉ sáu thôi nghỉ thì.',NULL,NULL,NULL,NULL),('26','43','9','tô trăng con','May quê tô thì cửa thì khoan.',NULL,NULL,NULL,NULL),('27','37','9','không bơi thích','Quần cái quần leo ruộng gì.\nNha bàn hóa ừ hai yêu.',NULL,NULL,NULL,NULL),('28','4','10','giết giày việc','Là á khoan viết.',NULL,NULL,NULL,NULL),('29','9','10','tám việc nha','Trời sáu quê gì tím áo biết kim á tàu.\nChìm quần khoảng.\nGhế thế thế gì may yêu.',NULL,NULL,NULL,NULL),('3','6','1','ngọt thương yêu','Độc hết mượn đạp quần mua việc bốn lầu.\nChỉ nghỉ giày hóa thuê nước ghét đá.\nĐập chìm đạp tủ bơi.\nTrăng bốn xanh leo.',NULL,NULL,NULL,NULL),('30','32','10','nước tôi tám','Chết bạn giết bơi giày.\nCửa chết may bơi con con lầu ờ đồng leo.\nCửa đỏ gió lầu núi.\nThuyền hàng đâu thế thì mua thuê kim đập.\nĐạp bảy phá chết chín em đánh mây á.',NULL,NULL,NULL,NULL),('31','40','11','việc khoan ngọt','Cái mướn xanh biển đá ruộng.\nChết á dép được đạp gì leo ruộng bàn dép.\nKhoan may dép mười quê tám.',NULL,NULL,NULL,NULL),('32','15','11','không bạn việc','Núi nha trăng hết ừ chỉ bạn thuê.\nNgọt đang biết ngọt thuê thích lỗi.\nĐánh ngọt biết tui giết may.\nVàng máy khoảng dép núi lỗi kim.',NULL,NULL,NULL,NULL),('33','17','11','chìm mượn ừ','Làm tím độc làm xanh.\nLà xanh khoảng hóa thế xuồng.\nHương tàu mướn.',NULL,NULL,NULL,NULL),('34','36','12','tô mượn xe','Một ghế bơi thuyền bốn bốn mười.\nĐập quần viết viết gì xanh tím đạp hương.\nĐánh hết tô mười đồng giày một mây ờ.',NULL,NULL,NULL,NULL),('35','47','12','trăng cửa thuê','Đang sáu lầu sáu.',NULL,NULL,NULL,NULL),('36','26','12','mua tôi đỏ','Anh gì bạn áo thế.\nThì hương cửa năm chìm độc khâu.\nĐập tui biết.',NULL,NULL,NULL,NULL),('37','30','13','thương nha khâu','Tôi mây em.\nCửa á thuê may mua giày leo tui.\nMột bơi ác chỉ thế hương thôi đang đang gì.\nHương chín trăng đạp đã.\nCửa khoan hai mướn may quần á.',NULL,NULL,NULL,NULL),('38','41','13','ác lỗi một','Máy ừ thuê chìm.',NULL,NULL,NULL,NULL),('39','12','13','gì quần may','Là kim thuyền tủ độc đập.\nHai cái thuê bàn xe ruộng quần xanh.\nKhâu sáu máy.\nCửa ba ác làm biết đỏ.',NULL,NULL,NULL,NULL),('4','43','2','chỉ tím vá','May nghỉ chìm đập bốn.\nThế cái việc.',NULL,NULL,NULL,NULL),('40','41','14','bè mây dép','Hóa khoảng gió cái ác áo đập bốn.\nĐá ác tám tàu con em ngọt lầu ngọt giày.\nBàn vẽ yêu bốn ừ.\nTô vẽ ba khâu mượn xe ruộng áo.\nLeo dép nghỉ mây được.',NULL,NULL,NULL,NULL),('41','36','14','lầu khoan tôi','Kim đã chín là ờ năm.\nĐược tô bàn thôi xanh trời bảy giày máy thế.\nĐâu ác tui vàng biết nước anh biển.\nThôi ác mượn á mướn tủ thích chỉ đỏ chết.\nTàu vẽ chìm bàn đâu yêu.',NULL,NULL,NULL,NULL),('42','26','14','đỏ đã ruộng','Năm gió tím hàng.\nXanh một mười hàng dép ngọt.\nĐộc hai núi gió đập tím bơi một.',NULL,NULL,NULL,NULL),('43','30','15','ba áo dép','Đạp chỉ thích vẽ kim chín ngọt giày.',NULL,NULL,NULL,NULL),('44','17','15','hóa phá vá','Máy độc á hương giết vá ba khoảng.',NULL,NULL,NULL,NULL),('45','19','15','hết ruộng hương','Tôi bơi tám đạp.\nĐang vàng leo.\nMượn ừ anh thôi nha.',NULL,NULL,NULL,NULL),('46','37','16','trăng viết nha','Tô dép tui nước núi một hàng tủ.\nSáu được may chìm đã sáu.\nLà giày hương tủ là ruộng ghét quê.\nĐâu yêu lầu đang ghế tàu thì.\nXanh ba ác.',NULL,NULL,NULL,NULL),('47','32','16','ờ khoảng tím','Khoan đồng đang mua ruộng con bốn tủ giết máy.\nBiết chết nha bốn.\nThế bốn đập.\nHương bạn năm tui.',NULL,NULL,NULL,NULL),('48','11','16','hàng độc trăng','Cửa thuê giày cái leo mười giết.\nNón leo mướn đạp tím vẽ.',NULL,NULL,NULL,NULL),('49','4','17','quê bàn mướn','Đỏ thuê giết xe đang bốn hóa hết không.\nCon yêu tô mượn viết nón kim.\nỪ tím chìm đã hai khoan là.\nVá chìm bảy xe ác đánh không leo em cái.',NULL,NULL,NULL,NULL),('5','2','2','năm là giày','Cái mua tám bè đâu quần hàng phá.\nNhà biết bảy á lầu.\nTui tím nghỉ viết bảy mười thuyền.\nAnh nha giết độc xanh.',NULL,NULL,NULL,NULL),('50','17','17','xuồng tôi nón','Là kim leo xuồng.\nNón ghét thuyền hương lỗi khoảng mây biết là.\nHai đỏ gió đã.\nTô trời xanh khâu trời.',NULL,NULL,NULL,NULL),('51','27','17','tàu hóa á','Vàng mười chết em được cái tô.\nMột thuyền tui ừ.\nKim thuyền đỏ được tím biết đã không mượn.',NULL,NULL,NULL,NULL),('52','4','18','máy đạp anh','Leo năm ghế đá.\nThôi mây núi mượn bàn biết bảy bạn.\nThôi năm sáu tôi vẽ gì phá vẽ hai.',NULL,NULL,NULL,NULL),('53','4','18','kim con đánh','Việc nha một.\nTàu đồng cửa mười chìm nghỉ hết con.\nỪ vá thôi cái đập thuyền mướn phá tui.\nĐâu tủ khâu tám tàu đỏ.\nNha sáu biển hàng.',NULL,NULL,NULL,NULL),('54','38','18','biết tôi hết','Chỉ ừ tôi.\nKhoan đồng giày gì hương ghét.\nĐồng bảy xe tô nón em.\nĐang mượn con khâu xe mười may ghét núi bơi.\nỜ đỏ bảy máy biết khâu vẽ đá ngọt ờ.',NULL,NULL,NULL,NULL),('55','45','19','xe vá khoảng','Em thôi thôi cửa khâu mười ghế.',NULL,NULL,NULL,NULL),('56','11','19','xuồng áo mười','Yêu nhà tôi đá bảy yêu viết không.',NULL,NULL,NULL,NULL),('57','26','19','biết biển cửa','Là tô đập năm đâu hết xe viết khâu biết.',NULL,NULL,NULL,NULL),('58','38','20','ghét tô ừ','Nhà bốn ngọt giết tím dép bè.',NULL,NULL,NULL,NULL),('59','35','20','may núi mây','Nhà ờ xanh ác ờ năm bơi hết.\nXe ruộng nước được thuê nón giết khâu.\nHết ác áo thích bạn tui chín việc vá leo.',NULL,NULL,NULL,NULL),('6','14','2','đồng xuồng ác','Thế giày mười giày núi một.',NULL,NULL,NULL,NULL),('60','42','20','trời tủ biết','Ruộng kim bạn mười giết cửa làm không hương máy.',NULL,NULL,NULL,NULL),('61','41','21','đồng thương á','Đạp đánh thế chìm lỗi.\nBốn lỗi tủ đạp phá may hương vàng.\nNhà chín mây được mướn chết núi tàu.\nCửa á thương mượn mượn may ừ năm.',NULL,NULL,NULL,NULL),('62','40','21','biển thế máy','Giết hương ghế đạp đỏ.',NULL,NULL,NULL,NULL),('63','32','21','hóa anh vá','Chín ghế thôi hóa.\nBốn bảy bảy may chỉ xuồng bàn tủ bè.\nHương quần thế chết lỗi tám gì.',NULL,NULL,NULL,NULL),('64','41','22','đỏ đá con','Nón tím phá bạn viết đã ừ ghế viết phá.\nXuồng hàng xe.\nChỉ được á bơi tôi nghỉ mây.\nBàn bạn ừ ruộng giết đạp đang hương mướn chìm.',NULL,NULL,NULL,NULL),('65','46','22','mướn xuồng đánh','May ngọt hàng gió tím leo á nhà.\nGì lầu đập.\nBốn độc khoảng.\nThôi bơi đập khoảng quê đạp cái.',NULL,NULL,NULL,NULL),('66','5','22','tôi thì tô','Con chỉ lầu đồng hương lỗi việc thương giết.\nEm mây xanh thích giết bè bàn thuê.',NULL,NULL,NULL,NULL),('67','22','23','thế thuê trăng','Vàng tám xanh sáu vàng ghế leo tím.\nKhoảng làm khoảng đá bảy ừ.\nNhà quần nghỉ anh dép chết là ruộng.',NULL,NULL,NULL,NULL),('68','43','23','tám nha bàn','Thương tui tôi đạp giày tàu ờ.\nXe hóa thế ác ừ máy.\nBạn em cửa mười ruộng hết đạp mua.\nVá hóa chỉ hương biết đạp tủ.\nNgọt tủ tám nón ngọt leo áo đâu mua.',NULL,NULL,NULL,NULL),('69','10','23','ngọt sáu khoảng','Xe máy mây làm cái lầu đỏ.\nĐá đã đỏ trăng trăng cái nghỉ khoảng.',NULL,NULL,NULL,NULL),('7','30','3','đang máy hóa','Bảy đạp mười ác áo việc hàng việc.\nThuyền tím năm lầu.\nKhâu máy đánh yêu thế.',NULL,NULL,NULL,NULL),('70','40','24','hàng quần mướn','Nha bốn đã lầu thích xe nhà khoảng làm nón.\nBạn ờ làm tủ.\nYêu chết vá một thuê bạn anh mướn máy.\nGió đá ghét tui.\nTô đá xuồng.',NULL,NULL,NULL,NULL),('71','8','24','thích vàng viết','Khoảng ghét mượn ừ mười thích năm thích hóa.\nThôi mướn hết giày chỉ ghế thế.\nVẽ tàu ghế.\nThế mua giày khoan.\nEm bơi ruộng bàn đã năm hóa.',NULL,NULL,NULL,NULL),('72','13','24','mướn ba đập','Vá một xanh núi.\nÁ em mượn tàu một ghét.\nXanh nón biết chỉ biển.\nTám đâu mua là tám hóa cửa.\nRuộng may chết tui tôi hương tám may thôi xuồng.',NULL,NULL,NULL,NULL),('73','42','25','được hết đâu','Thích mua đâu nha chín thương.\nNăm nón hàng tui biết bạn.',NULL,NULL,NULL,NULL),('74','38','25','mây đánh nước','Đập bè ghế.\nVàng thì nha yêu giày bàn chỉ anh đá.\nMay vá bạn cái một đá bạn tủ mướn.\nNghỉ ghế giày bơi.',NULL,NULL,NULL,NULL),('75','37','25','tui hàng á','Hàng đỏ xe tàu.\nThương cửa thuê mười gió thế yêu bè ngọt máy.\nChìm giày cửa giày là quê á.\nMây bốn con trời ừ.\nLầu năm khoan leo được ghét hóa.',NULL,NULL,NULL,NULL),('76','3','26','khoan ruộng năm','Thuyền ừ thôi xe chỉ anh núi.\nTô trời ừ hai bốn.\nGiày quê gió khoan là đá anh em thì chỉ.',NULL,NULL,NULL,NULL),('77','24','26','bảy mây chín','Trăng con nha ruộng biển dép ừ áo.\nGì lầu á nha á tám chết bốn bốn không.\nMướn ngọt nha lầu tôi ghế mướn ờ việc.\nHương hết á dép nghỉ không dép sáu đã tô.',NULL,NULL,NULL,NULL),('78','28','26','nha bơi máy','Không tám chìm phá là đá nha.\nNước thế đang cửa tím giày.\nÁo đỏ một.',NULL,NULL,NULL,NULL),('79','33','27','biển thì tàu','Con hết trời khoan hàng thế tím bốn hai.\nTàu bè hai năm gì mướn.\nThuyền sáu quê nhà xe chìm nghỉ.\nNước việc bảy may cái biết.',NULL,NULL,NULL,NULL),('8','30','3','máy tám sáu','Tôi thì tôi bè tám em yêu á máy bàn.\nLàm gió quê nghỉ.\nĐã đỏ độc tím.\nNước chỉ nón tím đỏ.\nLà bạn khâu kim.',NULL,NULL,NULL,NULL),('80','37','27','độc không ngọt','Vá hết làm bạn đập quê đồng đánh.\nThuyền bè đỏ vẽ đang.\nMay ghế năm yêu trăng đánh.',NULL,NULL,NULL,NULL),('81','36','27','giày ghét gì','Đồng được nha cái là hết ờ ghét giết bạn.\nThuyền ngọt đồng được mây chìm đỏ chỉ.\nVẽ á anh tủ tàu ác mượn chìm năm.\nVẽ tô hết ruộng bốn đỏ mười biển nước viết.',NULL,NULL,NULL,NULL),('82','11','28','một áo kim','Việc trăng xanh thích một tàu ghét biết đá nghỉ.',NULL,NULL,NULL,NULL),('83','4','28','chỉ đã khoan','Đánh thuyền mướn tám làm thuyền thuê vẽ thích.',NULL,NULL,NULL,NULL),('84','37','28','tám ruộng quần','Ngọt kim chìm may mượn đang thì.',NULL,NULL,NULL,NULL),('85','8','29','tám độc trời','Việc chìm lỗi tôi đồng.\nGiết thuê hai việc.\nKhâu hết mướn tàu.\nĐá trăng phá hàng ba chín áo yêu.',NULL,NULL,NULL,NULL),('86','46','29','giết biết tôi','Dép hai ừ sáu đỏ áo ghế hết.',NULL,NULL,NULL,NULL),('87','39','29','tủ khoảng ác','Tô thế đang ừ vàng mười năm.\nVá yêu mây quần không bạn tím tô quê cái.\nNgọt đá thôi phá ghét đỏ bè chìm.',NULL,NULL,NULL,NULL),('88','8','30','giết mua được','Việc núi mướn hương đạp quê yêu tàu.\nNghỉ thuyền nghỉ ba nghỉ thương.',NULL,NULL,NULL,NULL),('89','23','30','chín giết việc','Kim leo thương tô thương biển núi trời chìm.\nCon đâu gì.\nGió gió cái.\nĐược á đạp thôi.',NULL,NULL,NULL,NULL),('9','15','3','nước bảy xanh','Được mây chín.\nXe dép thuê tàu áo dép ừ khoảng.\nKhông bảy nước giết á cái năm nha vá vàng.',NULL,NULL,NULL,NULL),('90','36','30','chìm bơi chết','Trăng làm khâu quần.\nHàng đạp biển mười bè.\nỜ áo ờ chìm thế dép nha tui.',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `task_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tasks` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `creator_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tasks_statuses1_idx` (`status_id`),
  KEY `fk_tasks_employees1_idx` (`creator_id`),
  CONSTRAINT `fk_tasks_employees1` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_tasks_statuses1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES ('1','5','25'),('10','9','44'),('11','3','46'),('12','1','10'),('13','1','28'),('14','7','36'),('15','6','20'),('16','2','8'),('17','6','19'),('18','1','3'),('19','6','10'),('2','8','23'),('20','7','11'),('21','7','14'),('22','1','42'),('23','1','31'),('24','7','9'),('25','3','4'),('26','1','11'),('27','4','27'),('28','4','5'),('29','1','37'),('3','2','14'),('30','9','18'),('4','5','23'),('5','8','28'),('6','4','23'),('7','6','25'),('8','2','14'),('9','9','24');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teams` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `team_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`team_id`,`employee_id`),
  KEY `fk_teams_has_employees_employees1_idx` (`employee_id`),
  KEY `fk_teams_has_employees_teams1_idx` (`team_id`),
  CONSTRAINT `fk_teams_has_employees_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_teams_has_employees_teams1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
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

-- Dump completed on 2022-01-03  1:11:35

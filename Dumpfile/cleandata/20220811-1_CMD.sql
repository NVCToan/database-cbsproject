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
  CONSTRAINT `fk_approval_step_details_approval_steps1` FOREIGN KEY (`approval_step_id`) REFERENCES `approval_steps` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_step_details`
--

LOCK TABLES `approval_step_details` WRITE;
/*!40000 ALTER TABLE `approval_step_details` DISABLE KEYS */;
INSERT INTO `approval_step_details` VALUES (1,1,1,-1,-1),(2,1,2,-1,-1),(3,1,3,-1,-1),(4,1,-1,-1,-1),(5,3,20,-1,-1),(6,2,45,-1,-1),(7,3,363,-1,-1);
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
  `approval_step_index` int NOT NULL DEFAULT '1',
  `proposal_type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_approval_steps_proposal_types1_idx` (`proposal_type_id`),
  CONSTRAINT `fk_approval_steps_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_steps`
--

LOCK TABLES `approval_steps` WRITE;
/*!40000 ALTER TABLE `approval_steps` DISABLE KEYS */;
INSERT INTO `approval_steps` VALUES (1,'Phê duyệt',1,1),(2,'Kế toán',1,2),(3,'Kiểm tra',2,1);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'Text'),(2,'Number'),(3,'Date'),(4,'Select'),(5,'Email'),(6,'Password'),(7,'MultiSelect'),(8,'Checkbox'),(9,'Radio'),(10,'Switch'),(11,'Textarea'),(12,'HTML'),(13,'Range');
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
  UNIQUE KEY `id` (`code`),
  KEY `fk_parentDep_idx` (`farther_department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'1','Ban Quản Lý KTX Cỏ May',-1,-1,-1,'2022-03-28','2022-03-28','test',1,1),(2,'2','Đội sửa chữa',1,-1,-1,'2022-03-28','2022-03-28','test',2,5),(3,'3','Tầng 1',2,-1,-1,'2022-03-28','2022-03-28','test',3,7),(4,'4','Tầng 2',2,-1,-1,'2022-03-28','2022-03-28','test',3,10),(5,'5','Tầng 3',2,-1,-1,'2022-03-28','2022-03-28','test',3,13),(6,'6','Tầng trệt',2,-1,-1,'2022-03-28','2022-03-28','test',3,16),(7,'7','Kiểm tra và giám sát sinh viên',1,-1,-1,'2022-03-28','2022-03-28','test',2,19),(8,'8','Tổ chức sự kiện',1,-1,-1,'2022-03-28','2022-03-28','test',2,NULL),(9,'9','Truyền thông',1,-1,-1,'2022-03-28','2022-03-28','test',2,NULL),(10,'10','Sinh viên',1,-1,-1,'2022-03-28','2022-03-28','test',2,NULL),(131,'001','001',6,1,1,'2022-03-28','2022-03-28','test',4,45),(132,'002','002',6,1,1,'2022-03-28','2022-03-28','test',4,47),(133,'003','003',6,1,1,'2022-03-28','2022-03-28','test',4,49),(134,'004','004',6,1,1,'2022-03-28','2022-03-28','test',4,51),(135,'005','005',6,1,1,'2022-03-28','2022-03-28','test',4,53),(136,'006','006',6,1,1,'2022-03-28','2022-03-28','test',4,55),(137,'007','007',6,1,1,'2022-03-28','2022-03-28','test',4,57),(138,'008','008',6,1,1,'2022-03-28','2022-03-28','test',4,59),(139,'009','009',6,1,1,'2022-03-28','2022-03-28','test',4,61),(140,'010','010',6,1,1,'2022-03-28','2022-03-28','test',4,63),(141,'011','011',6,1,1,'2022-03-28','2022-03-28','test',4,65),(142,'012','012',6,1,1,'2022-03-28','2022-03-28','test',4,67),(143,'013','013',6,1,1,'2022-03-28','2022-03-28','test',4,69),(144,'014','014',6,1,1,'2022-03-28','2022-03-28','test',4,71),(145,'015','015',6,1,1,'2022-03-28','2022-03-28','test',4,73),(146,'016','016',6,1,1,'2022-03-28','2022-03-28','test',4,75),(147,'017','017',6,1,1,'2022-03-28','2022-03-28','test',4,77),(148,'018','018',6,1,11,'2022-03-28','2022-03-28','test',4,79),(149,'101','101',3,1,1,'2022-03-28','2022-03-28','test',4,81),(150,'102','102',3,1,1,'2022-03-28','2022-03-28','test',4,83),(151,'103','103',3,1,1,'2022-03-28','2022-03-28','test',4,85),(152,'104','104',3,1,1,'2022-03-28','2022-03-28','test',4,87),(203,'105','105',3,-1,-1,'2022-03-28','2022-03-28','test',4,189),(204,'106','106',3,-1,-1,'2022-03-28','2022-03-28','test',4,191),(205,'107','107',3,-1,-1,'2022-03-28','2022-03-28','test',4,193),(206,'108','108',3,-1,-1,'2022-03-28','2022-03-28','test',4,195),(207,'109','109',3,-1,-1,'2022-03-28','2022-03-28','test',4,197),(208,'110','110',3,-1,-1,'2022-03-28','2022-03-28','test',4,199),(209,'111','111',3,-1,-1,'2022-03-28','2022-03-28','test',4,201),(210,'112','112',3,-1,-1,'2022-03-28','2022-03-28','test',4,203),(211,'113','113',3,-1,-1,'2022-03-28','2022-03-28','test',4,205),(212,'114','114',3,-1,-1,'2022-03-28','2022-03-28','test',4,207),(213,'115','115',3,-1,-1,'2022-03-28','2022-03-28','test',4,209),(214,'116','116',3,-1,-1,'2022-03-28','2022-03-28','test',4,211),(215,'117','117',3,-1,-1,'2022-03-28','2022-03-28','test',4,213),(216,'118','118',3,-1,-1,'2022-03-28','2022-03-28','test',4,215),(217,'201','201',4,-1,-1,'2022-03-28','2022-03-28','test',4,217),(218,'202','202',4,-1,-1,'2022-03-28','2022-03-28','test',4,219),(219,'203','203',4,-1,-1,'2022-03-28','2022-03-28','test',4,221),(220,'204','204',4,-1,-1,'2022-03-28','2022-03-28','test',4,223),(221,'205','205',4,-1,-1,'2022-03-28','2022-03-28','test',4,225),(222,'206','206',4,-1,-1,'2022-03-28','2022-03-28','test',4,227),(223,'207','207',4,-1,-1,'2022-03-28','2022-03-28','test',4,229),(224,'208','208',4,-1,-1,'2022-03-28','2022-03-28','test',4,231),(225,'209','209',4,-1,-1,'2022-03-28','2022-03-28','test',4,233),(226,'210','210',4,-1,-1,'2022-03-28','2022-03-28','test',4,235),(227,'211','211',4,-1,-1,'2022-03-28','2022-03-28','test',4,237),(228,'212','212',4,-1,-1,'2022-03-28','2022-03-28','test',4,239),(229,'213','213',4,-1,-1,'2022-03-28','2022-03-28','test',4,241),(230,'214','214',4,-1,-1,'2022-03-28','2022-03-28','test',4,243),(231,'215','215',4,-1,-1,'2022-03-28','2022-03-28','test',4,245),(232,'216','216',4,-1,-1,'2022-03-28','2022-03-28','test',4,247),(233,'217','217',4,-1,-1,'2022-03-28','2022-03-28','test',4,249),(234,'218','218',4,-1,-1,'2022-03-28','2022-03-28','test',4,251),(235,'301','301',5,-1,-1,'2022-03-28','2022-03-28','test',4,253),(236,'302','302',5,-1,-1,'2022-03-28','2022-03-28','test',4,255),(237,'303','303',5,-1,-1,'2022-03-28','2022-03-28','test',4,257),(238,'304','304',5,-1,-1,'2022-03-28','2022-03-28','test',4,259),(239,'305','305',5,-1,-1,'2022-03-28','2022-03-28','test',4,261),(240,'306','306',5,-1,-1,'2022-03-28','2022-03-28','test',4,263),(241,'307','307',5,-1,-1,'2022-03-28','2022-03-28','test',4,265),(242,'308','308',5,-1,-1,'2022-03-28','2022-03-28','test',4,267),(243,'309','309',5,-1,-1,'2022-03-28','2022-03-28','test',4,269),(244,'310','310',5,-1,-1,'2022-03-28','2022-03-28','test',4,271),(245,'311','311',5,-1,-1,'2022-03-28','2022-03-28','test',4,273),(246,'312','312',5,-1,-1,'2022-03-28','2022-03-28','test',4,275),(247,'313','313',5,-1,-1,'2022-03-28','2022-03-28','test',4,277),(248,'314','314',5,-1,-1,'2022-03-28','2022-03-28','test',4,279),(249,'315','315',5,-1,-1,'2022-03-28','2022-03-28','test',4,281),(250,'316','316',5,-1,-1,'2022-03-28','2022-03-28','test',4,283),(251,'317','317',5,-1,-1,'2022-03-28','2022-03-28','test',4,285),(252,'318','318',5,-1,-1,'2022-03-28','2022-03-28','test',4,287);
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
  KEY `fk_employee_id_idx` (`employee_id`),
  CONSTRAINT `fk_departments_employees` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_employees_departments` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=580 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
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
  `item_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemcode_UNIQUE` (`item_code`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'E','DEPE1','Phòng ban đang được sử dụng'),(2,'E','EMPE1','Không được khóa tài khoản trưởng phòng'),(3,'E','DEPE2','Mã phòng ban này đã tồn tại'),(4,'E','POSE1','Tạo mới chức vụ thất bại'),(5,'E','EMPE2','Không thể xóa nhân viên là trưởng phòng'),(6,'S','EMPS1','Thêm danh sách nhân viên thành công'),(7,'E','EMPE3','Có lỗi xảy ra khi thêm danh sách nhân viên'),(8,'E','EMPE4','Có lỗi xảy ra khi thêm nhân viên!'),(9,'S','EMPS2','Thêm nhân viên thành công!'),(10,'E','DEPE3','Tạo mới phòng ban thất bại'),(12,'E','POSE2','Cập nhật chức vụ thất bại'),(13,'E','DEPE4','Cập nhật  phòng ban thất bại'),(14,'E','TEAME1','Đội nhóm đang được sử dụng'),(15,'E','TEAME2','Thêm đội nhóm thất bại'),(16,'E','TEAME3','Mã đội nhóm đã tồn tại'),(17,'S','TEAMS4','Tạo mới đội nhóm thành công'),(18,'S','TEAMS5','Cập nhật đội nhóm thành công'),(19,'S','TEAMS6','Xóa đội nhóm thành công'),(20,'S','TASKS1','Tạo mới công việc thành công'),(21,'E','TASKE1','Tạo mới công việc thất bại'),(22,'S','TASKS2','Cập nhật công việc thành công'),(23,'S','TASKS3','Hủy công việc thành công'),(24,'E','TASKE3','Cập nhật công việc thất bại'),(25,'S','ROLES1','Tạo mới vai trò thành công'),(26,'E','ROLEE1','Tạo mới vai trò thất bại'),(27,'E','ROLEE2','Vai trò này đang được sử dụng'),(28,'E','ROLEE3','Xóa vai trò thất bại'),(29,'S','ROLES2','Xóa vai trò thành công'),(30,'S','ROLES3','Cập nhật vai trò thành công'),(31,'E','ROLEE4','Cập nhật vai trò thất bại'),(32,'E','LOGINE1','Mật khẩu không chính xác. Vui lòng kiểm tra và thử lại!'),(33,'S','LOGINS1','Đăng nhập thành công'),(34,'E','LOGINE2','Tên đăng nhập không tồn tại. Vui lòng kiểm tra và thử lại!'),(35,'E','EMPE5','Mã nhân viên đã tồn tại!'),(39,'S','EMPS3','Cập nhật nhân viên thành công!'),(41,'E','EMPE6','Có lỗi khi cập nhật thông tin nhân viên!'),(42,'S','EMPS4','Xóa nhân viên thành công!'),(43,'E','EMPE7','Có lỗi xảy ra khi xóa nhân viên!'),(44,'E','EMPE8','Mã nhân viên không tồn tại!'),(45,'E','STAE1','Mã trạng thái không tồn tại!'),(46,'E','DEPE5','Mã phòng ban không được quá 10 kí tự'),(47,'E','EMPE9','Mã nhân viên không được quá 10 kí tự!'),(48,'S','TASKS4','Xóa công việc thành công'),(49,'E','TASKE2','Xóa công việc thất bại!'),(50,'S','POSTS1','Thêm bài viết thành công!'),(51,'E','POSTE1','Thêm bài viết thất bại!'),(52,'S','POSTS2','Cập nhật bài viết thành công!'),(53,'E','POSTE2','Cập nhật bài viết thất bại!'),(54,'S','POSTS3','Xóa bài viết thành công!'),(55,'E','POSTE3','Xóa bài viết thất bại!'),(56,'S','POSS1','Tạo mới chức vụ thành công'),(57,'\"\"','POSS2','Cập nhật chức vụ thành công'),(58,'S','DEPS1','Tạo mới phòng ban thành công!'),(59,'S','DEPS2','Cập nhật phòng ban thành công!'),(60,'E','TASKE4','Cần truyền employeeId cho API này!'),(61,'E','POSTE4','Like bài viết thất bại!'),(62,'S','POSTS4','Like bài viết thành công!'),(63,'E','TASKE5','Công việc đã hoàn thành hoặc đã hủy!'),(64,'S','TASKS5','Cập nhật trạng thái công việc thành công!'),(65,'M','TASKM1','Đã tạo mới công việc'),(66,'M','TASKM2','Đã nhận công việc'),(67,'M','TASKM3','Đã từ chối công việc với lí do:'),(68,'M','TASKM4','Đã xác nhận hoàn thành công việc'),(69,'M','TASKM5','Đã cập nhật công việc'),(70,'M','TASKM6','Đã hoàn thành công việc'),(71,'E','TASKE6','Id công việc không hợp lệ!'),(72,'N','TASKN1','Bạn vừa được giao công việc từ'),(73,'N','TASKN2','Bạn nhận được công việc mới'),(74,'S','NOTIS1','Tất cả thông báo đã được cập nhật'),(75,'E','NOTIE1','Cập nhật thất bại!'),(76,'N','TASKN3','Vừa từ chối công việc'),(77,'N','TASKN4','Công việc vừa bị từ chối'),(78,'N','TASKN5','Xác nhận hoàn thành công việc'),(79,'N','TASKN6','Vui lòng xác nhận hoàn thành cho'),(80,'N','TASKN7','Hoàn thành công việc'),(81,'N','TASKN8','Đã xác nhận hoàn thành công việc'),(82,'E','EMPE10','Tên đăng nhập đã tồn tại');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notify` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify`
--

LOCK TABLES `notify` WRITE;
/*!40000 ALTER TABLE `notify` DISABLE KEYS */;
INSERT INTO `notify` VALUES (5,'Bạn nhận được công việc mới','Bạn vừa được giao công việc từ admin1','363',1),(6,'Bạn nhận được công việc mới','Bạn vừa được giao công việc từ admin1','363',1),(7,'Bạn nhận được công việc mới','Bạn vừa được giao công việc từ admin1','363',1),(8,'Bạn nhận được công việc mới','Bạn vừa được giao công việc từ admin1','363',1),(9,'Công việc vừa bị từ chối','admin1 Vừa từ chối công việc','363',0),(10,'Công việc vừa bị từ chối','admin1 Vừa từ chối công việc','363',0),(11,'Bạn nhận được công việc mới','Bạn vừa được giao công việc từ admin1','363',0),(12,'Hoàn thành công việc','admin1 Đã xác nhận hoàn thành công việc','363',0);
/*!40000 ALTER TABLE `notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_detail`
--

DROP TABLE IF EXISTS `notify_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notify_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `notify_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify_detail`
--

LOCK TABLES `notify_detail` WRITE;
/*!40000 ALTER TABLE `notify_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify_detail` ENABLE KEYS */;
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
  `label` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'task','Công việc'),(2,'proposal','Đề xuất'),(3,'type','Loại đề xuất'),(4,'employee','Nhân viên'),(5,'department','Phòng ban'),(6,'position','Chức vụ'),(7,'inventory','Kho'),(8,'team','Đội nhóm'),(9,'role','Vai trò'),(10,'post','Bài viết');
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
  `label` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'view','Xem'),(2,'create','Tạo'),(3,'update','Sửa'),(4,'delete','Xoá'),(5,'view_all','Xem hết'),(6,'update_all','Sửa hết'),(7,'delete_all','Xoá hết'),(8,'import','Nhập');
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
  KEY `fk_positions_teams1_idx` (`team_id`),
  KEY `fk_role_position_idx` (`role_id`),
  KEY `fk_positions_departments_idx` (`department_id`),
  CONSTRAINT `fk_positions_departments` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_positions_teams1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `fk_role_position` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Thành viên ban quản lý KTX',1,1,-1,-1,'2022-03-28','2022-03-28',NULL,1),(2,'Giám thị',1,0,-1,-1,'2022-03-28','2022-03-28',NULL,2),(3,'Kế toán',1,0,-1,-1,'2022-03-28','2022-03-28',NULL,3),(5,'Đội trưởng',2,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(6,'Thành viên',2,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(7,'Trưởng tầng 1',3,1,-1,-1,'2022-03-28','2022-03-28',NULL,6),(8,'Trưởng phòng sinh viên tầng 1',3,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(9,'Thành viên',3,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(10,'Trưởng tầng 2',4,1,-1,-1,'2022-03-28','2022-03-28',NULL,6),(11,'Trưởng phòng sinh viên tầng 2',4,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(12,'Thành viên',4,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(13,'Trưởng tầng 3',5,1,-1,-1,'2022-03-28','2022-03-28',NULL,6),(14,'Trưởng phòng sinh viên tầng 3',5,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(15,'Thành viên',5,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(16,'Trưởng tầng trệt',6,1,-1,-1,'2022-03-28','2022-03-28',NULL,6),(17,'Trưởng phòng sinh viên tầng trệt',6,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(18,'Thành viên',6,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(19,'Trưởng đội 2',7,1,-1,-1,'2022-03-28','2022-03-28',NULL,7),(20,'Trưởng đội nhạc cụ',NULL,1,363,363,'2022-03-28','2022-03-28',1,5),(21,'Thành viên',NULL,0,363,363,'2022-03-28','2022-03-28',1,5),(22,'Trưởng đội cắm hoa',NULL,1,363,363,'2022-03-28','2022-03-28',2,5),(23,'Trưởng đội bóng đá',NULL,1,363,363,'2022-03-28','2022-03-28',3,5),(24,'Trưởng đội bảo vệ',NULL,1,363,363,'2022-03-28','2022-03-28',4,5),(25,'Trưởng đội thuyết trình',NULL,1,363,363,'2022-03-28','2022-03-28',5,5),(26,'Trưởng ban sự kiện',8,1,-1,-1,'2022-03-28','2022-03-28',NULL,5),(27,'Trưởng ban truyền thông',9,1,-1,-1,'2022-03-28','2022-03-28',NULL,5),(28,'Sinh viên',10,1,-1,-1,'2022-03-28','2022-03-28',NULL,5),(29,'Trưởng đội',NULL,1,363,363,'2022-03-28','2022-03-28',6,1),(30,'Thành viên Đội 1',NULL,0,363,363,'2022-03-28','2022-03-28',6,5),(31,'Trưởng đội 2',NULL,1,363,363,'2022-03-28','2022-03-28',8,1),(32,'Thành viên đội 2',NULL,0,363,363,'2022-03-28','2022-03-28',8,5),(33,'Trưởng CLB cầu long',NULL,1,363,363,'2022-03-28','2022-03-28',9,5),(34,'Thành viên',NULL,0,363,363,'2022-03-28','2022-03-28',9,4),(37,'Admin',1,1,1,1,'2022-03-28','2022-03-28',NULL,8),(38,'Trưởng CLB bóng bàn',NULL,1,363,363,'02-05-2022 12:43:36','02-05-2022 12:43:36',7,5),(39,'Thành viên đội cắm hoa',NULL,0,363,363,'02-05-2022 12:43:36','02-05-2022 12:43:36',2,5),(40,'Thành viên đội bóng đá',NULL,0,363,363,'02-05-2022 12:43:36','02-05-2022 12:43:36',3,5),(41,'Thành viên đội bảo vệ',NULL,0,363,363,'02-05-2022 12:43:36','02-05-2022 12:43:36',4,5),(42,'Thành viên đội thuyết trình',NULL,0,363,363,'02-05-2022 12:43:36','02-05-2022 12:43:36',5,5),(43,'Thành viên CLB cầu long',NULL,0,363,363,'02-05-2022 12:43:36','02-05-2022 12:43:36',9,5),(44,'Thành viên CLB bóng bàn',NULL,0,363,363,'02-05-2022 12:43:36','02-05-2022 12:43:36',7,5),(45,'Trưởng phòng',131,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(46,'Thành viên',131,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(47,'Trưởng phòng',132,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(48,'Thành viên',132,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(49,'Trưởng phòng',133,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(50,'Thành viên',133,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(51,'Trưởng phòng',134,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(52,'Thành viên',134,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(53,'Trưởng phòng',135,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(54,'Thành viên',135,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(55,'Trưởng phòng',136,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(56,'Thành viên',136,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(57,'Trưởng phòng',137,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(58,'Thành viên',137,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(59,'Trưởng phòng',138,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(60,'Thành viên',138,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(61,'Trưởng phòng',139,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(62,'Thành viên',139,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(63,'Trưởng phòng',140,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(64,'Thành viên',140,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(65,'Trưởng phòng',141,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(66,'Thành viên',141,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(67,'Trưởng phòng',142,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(68,'Thành viên',142,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(69,'Trưởng phòng',143,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(70,'Thành viên',143,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(71,'Trưởng phòng',144,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(72,'Thành viên',144,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(73,'Trưởng phòng',145,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(74,'Thành viên',145,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(75,'Trưởng phòng',146,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(76,'Thành viên',146,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(77,'Trưởng phòng',147,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(78,'Thành viên',147,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(79,'Trưởng phòng',148,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(80,'Thành viên',148,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(81,'Trưởng phòng',149,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(82,'Thành viên',149,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(83,'Trưởng phòng',150,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(84,'Thành viên',150,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(85,'Trưởng phòng',151,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(86,'Thành viên',151,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(87,'Trưởng phòng',152,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(88,'Thành viên',152,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(92,'Trưởng phòng',203,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(93,'Thành viên',203,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(94,'Trưởng phòng',204,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(95,'Thành viên',204,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(96,'Trưởng phòng',205,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(97,'Thành viên',205,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(98,'Trưởng phòng',206,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(99,'Thành viên',206,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(100,'Trưởng phòng',207,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(101,'Thành viên',207,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(102,'Trưởng phòng',208,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(103,'Thành viên',208,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(104,'Trưởng phòng',209,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(105,'Thành viên',209,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(106,'Trưởng phòng',210,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(107,'Thành viên',210,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(108,'Trưởng phòng',211,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(109,'Thành viên',211,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(110,'Trưởng phòng',212,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(111,'Thành viên',212,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(112,'Trưởng phòng',213,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(113,'Thành viên',213,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(114,'Trưởng phòng',214,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(115,'Thành viên',214,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(116,'Trưởng phòng',215,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(117,'Thành viên',215,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(118,'Trưởng phòng',216,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(119,'Thành viên',216,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(120,'Trưởng phòng',217,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(121,'Thành viên',217,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(122,'Trưởng phòng',218,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(123,'Thành viên',218,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(124,'Trưởng phòng',219,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(125,'Thành viên',219,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(126,'Trưởng phòng',220,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(127,'Thành viên',220,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(128,'Trưởng phòng',221,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(129,'Thành viên',221,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(130,'Trưởng phòng',222,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(131,'Thành viên',222,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(132,'Trưởng phòng',223,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(133,'Thành viên',223,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(134,'Trưởng phòng',224,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(135,'Thành viên',224,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(136,'Trưởng phòng',225,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(137,'Thành viên',225,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(138,'Trưởng phòng',226,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(139,'Thành viên',226,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(140,'Trưởng phòng',227,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(141,'Thành viên',227,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(142,'Trưởng phòng',228,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(143,'Thành viên',228,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(144,'Trưởng phòng',229,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(145,'Thành viên',229,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(146,'Trưởng phòng',230,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(147,'Thành viên',230,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(148,'Trưởng phòng',231,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(149,'Thành viên',231,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(150,'Trưởng phòng',232,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(151,'Thành viên',232,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(152,'Trưởng phòng',233,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(153,'Thành viên',233,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(154,'Trưởng phòng',234,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(155,'Thành viên',234,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(156,'Trưởng phòng',235,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(157,'Thành viên',235,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(158,'Trưởng phòng',236,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(159,'Thành viên',236,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(160,'Trưởng phòng',237,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(161,'Thành viên',237,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(162,'Trưởng phòng',238,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(163,'Thành viên',238,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(164,'Trưởng phòng',239,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(165,'Thành viên',239,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(166,'Trưởng phòng',240,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(167,'Thành viên',240,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(168,'Trưởng phòng',241,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(169,'Thành viên',241,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(170,'Trưởng phòng',242,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(171,'Thành viên',242,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(172,'Trưởng phòng',243,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(173,'Thành viên',243,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(174,'Trưởng phòng',244,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(175,'Thành viên',244,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(176,'Trưởng phòng',245,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(177,'Thành viên',245,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(178,'Trưởng phòng',246,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(179,'Thành viên',246,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(180,'Trưởng phòng',247,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(181,'Thành viên',247,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(182,'Trưởng phòng',248,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(183,'Thành viên',248,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(184,'Trưởng phòng',249,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(185,'Thành viên',249,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(186,'Trưởng phòng',250,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(187,'Thành viên',250,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(188,'Trưởng phòng',251,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(189,'Thành viên',251,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(190,'Trưởng phòng',252,1,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5),(191,'Thành viên',252,0,-1,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36',NULL,5);
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
  KEY `position_emp_idx` (`position_id`),
  KEY `employee_pos_idx` (`employee_id`),
  CONSTRAINT `employee_pos` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `position_emp` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=687 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_employees`
--

LOCK TABLES `positions_employees` WRITE;
/*!40000 ALTER TABLE `positions_employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `positions_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_favourite`
--

DROP TABLE IF EXISTS `post_favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_favourite` (
  `post_id` int NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`post_id`,`employee_id`),
  KEY `FK_Empl_idx` (`employee_id`),
  CONSTRAINT `FK_Empl` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `FK_Post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_favourite`
--

LOCK TABLES `post_favourite` WRITE;
/*!40000 ALTER TABLE `post_favourite` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_favourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `is_pulished` tinyint DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` int DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `like_total` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Hợp ban quản lý ký túc xá','',1,48,'2022-07-20',363,'2022-07-25 14:42:20',0),(2,'Tieu de bai viet 2 da chinh sua','Đây là review về Củ sạc Ugreen gaN 65W CD244, 2C1A, hỗ trợ nhiều chuẩn sạc PD, PPS, QC2.0, QC3.0,... của mình. Mình mua nó với giá 500K VND. Hi vọng phần review sẽ hữu ích cho bạn nào muốn mua nhé, nếu bạn có câu hỏi gì thì hãy comment vô bài này nha.Thông tin chung về Củ sạc Ugreen gaN 65W CD244, 2C1A, hỗ trợ nhiều chuẩn sạc PD, PPS, QC2.0, QC3.0,... Ugreen là một trong những hãng sản suất linh kiện, củ sạc, sạc dự phòng chất lượng tốt được nhiều người tin tưởng. Cách đây không lâu Ugreen giới thiệu củ sạc gaN 65W (CD244), củ sạc mới chỉ còn 3 cổng 2C+1A, giảm đáng kể kích thước, trọng lượng so với củ sạc gaN 65W trước đây (CD224).',1,363,'2022-07-20 02:46:59',363,'2022-07-20 02:51:48',0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
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
  `field_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '-1',
  `field_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proposal_details_proposals1_idx` (`proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_details`
--

LOCK TABLES `proposal_details` WRITE;
/*!40000 ALTER TABLE `proposal_details` DISABLE KEYS */;
INSERT INTO `proposal_details` VALUES (1,1,'1','Mục đích/Lý do','Ghét kim tám việc.'),(2,1,'2','Tình trạng hư hỏng','Nhà ngọt xuồng tui ghét thích may bạn xanh.\nLỗi mây ghế hóa.\nÁ bốn tủ bè.\nBàn bảy biết.\nLỗi bốn mướn phá núi tủ.'),(3,1,'3','Số phòng','11426'),(4,1,'4','Ghi chú','Quê tủ chỉ.'),(5,2,'1','Mục đích/Lý do','Tàu chỉ làm biển em leo bốn tám.'),(6,2,'2','Tình trạng hư hỏng','Mượn đang xuồng năm đỏ nón.\nTàu đang con bạn đá hết.'),(7,2,'3','Số phòng','24170'),(8,2,'4','Ghi chú','Chết đập được làm quần việc mười bốn thuê.\nQuần tôi khoảng hết ừ bơi xanh thích leo.\nLỗi khoan giày chết núi độc anh nhà yêu.\nTui bàn biết biển dép kim nước ác giết.\nNăm độc sáu chìm đang đá việc chín tôi được.'),(9,3,'1','Mục đích/Lý do','Đồng gió tàu cái khoan khoan nhà.'),(10,3,'2','Tình trạng hư hỏng','Đã đã tủ anh ruộng xe.\nDép thương hóa phá nha ngọt thì thích đập đang.'),(11,3,'3','Số phòng','11018'),(12,3,'4','Ghi chú','Độc ừ mướn con.\nHết bảy chỉ viết.\nGì được kim quần.'),(13,4,'1','Mục đích/Lý do','Độc trời bạn giết giày đã thích.'),(14,4,'2','Tình trạng hư hỏng','Đỏ giày khoan.\nXe là không hết nón xuồng thuê.\nTui bạn ờ đạp làm hóa tám thế nhà bè.\nBảy thuyền chỉ ghế thế.'),(15,4,'3','Số phòng','26117'),(16,4,'4','Ghi chú','Tui khâu là thôi chỉ ghế chín chỉ núi.\nRuộng cửa đập khoảng làm.'),(17,5,'1','Mục đích/Lý do','Thế thế lỗi không không con cửa bốn.'),(18,5,'2','Tình trạng hư hỏng','Thôi chìm ba năm hết gió chết tím nón.\nXanh đạp núi nha hết con nha chìm.'),(19,5,'3','Số phòng','18444'),(20,5,'4','Ghi chú','Đồng hết khoan lầu tui đập vẽ ờ vàng.\nĐã là ruộng mướn tím chết ruộng.\nLàm đang leo năm tô thôi.'),(21,6,'1','Mục đích/Lý do','Khoan mười núi dép may chỉ độc áo.'),(22,6,'2','Tình trạng hư hỏng','Thôi tủ hết kim.\nCửa lầu chỉ thuê quê núi bốn chết khâu vẽ.\nĐược làm giết tui nghỉ trời tủ thì á cửa.'),(23,6,'3','Số phòng','27617'),(24,6,'4','Ghi chú','Cái máy đã.'),(25,7,'1','Mục đích/Lý do','Tám xanh vá biển việc giày leo thế mười đang.'),(26,7,'2','Tình trạng hư hỏng','Ruộng xe đánh kim hết mười.\nMượn vá lỗi á.\nLầu lầu năm thôi núi viết.\nSáu việc mượn ngọt.'),(27,7,'3','Số phòng','28305'),(28,7,'4','Ghi chú','Xuồng đỏ thích á.\nCon tô tàu thôi đá ác trời đồng nha.'),(29,8,'1','Mục đích/Lý do','Yêu đập máy bốn kim biết tàu.'),(30,8,'2','Tình trạng hư hỏng','Độc ruộng thương khoảng được.\nMột leo không.\nMột đã không đỏ giày một hết giày.'),(31,8,'3','Số phòng','27700'),(32,8,'4','Ghi chú','Cái tủ đỏ em đá quê ờ ngọt vàng được.\nTàu chìm thương đỏ.'),(33,9,'1','Mục đích/Lý do','Ờ ghế tủ ờ hàng được hết kim bè chín.'),(34,9,'2','Tình trạng hư hỏng','Anh thế ruộng xe leo năm mua thế thôi.\nNha thương xuồng hương.'),(35,9,'3','Số phòng','24445'),(36,9,'4','Ghi chú','Hết cái leo trời mười thuyền.'),(37,10,'1','Mục đích/Lý do','Chìm gì đang đạp may đỏ được lỗi đâu giết.'),(38,10,'2','Tình trạng hư hỏng','Nước trời xanh.'),(39,10,'3','Số phòng','6437'),(40,10,'4','Ghi chú','Chỉ đập đá áo khoảng tím viết.\nXuồng tôi thích khoan tủ tô đập thuê trời.\nMột thuê năm chìm đá chỉ nha lầu quê hàng.\nHết viết lầu nghỉ nước sáu hai leo đã thế.\nNăm giày đánh nhà xuồng hai ghét.'),(41,11,'1','Mục đích/Lý do','Chỉ thích máy ba xuồng đập.'),(42,11,'2','Tình trạng hư hỏng','Thế ờ được thuyền mướn viết.\nBiển viết bơi đâu yêu yêu áo.\nHết ghét hết ừ đang bè hết mây.'),(43,11,'3','Số phòng','31477'),(44,11,'4','Ghi chú','Khoan thương thích thuê mây giết giết.\nĐồng bốn đang chết leo khoảng.\nCái một bè mượn đỏ ba nha dép tôi.\nĐồng kim giết xe năm ngọt trăng trời ngọt ngọt.\nMười tím ghét thuê một thuê.'),(45,12,'1','Mục đích/Lý do','Ác đâu đập ruộng làm.'),(46,12,'2','Tình trạng hư hỏng','Khâu dép nha đỏ chìm làm.\nĐâu quần con khoảng đỏ thôi.\nXuồng kim bảy là lỗi.'),(47,12,'3','Số phòng','21759'),(48,12,'4','Ghi chú','Thích được chín khoảng ghét em độc mây leo.\nViết con quê vẽ ừ vàng gió.'),(49,13,'1','Mục đích/Lý do','Anh làm chết tô xe chín đang vẽ giết.'),(50,13,'2','Tình trạng hư hỏng','Hai nón mượn núi viết cái.\nGió ghét ruộng chìm tàu mướn thế đập nón.\nKhoảng leo mượn con vàng núi áo một.'),(51,13,'3','Số phòng','12254'),(52,13,'4','Ghi chú','Áo mượn ừ nghỉ đập làm.\nTám xanh chìm mây mây làm núi độc.\nMười tôi chìm đồng khoảng.'),(53,14,'1','Mục đích/Lý do','Nhà xe mười may viết.'),(54,14,'2','Tình trạng hư hỏng','Tôi nước chín em đồng là phá.\nThương hóa tui vàng thuyền núi đang vá xuồng ba.'),(55,14,'3','Số phòng','1573'),(56,14,'4','Ghi chú','Áo năm lỗi tủ viết thôi mười đỏ.\nĐâu gió năm bơi biết bơi gió mười.\nBiết ác mây trăng quê thuyền sáu đạp làm vàng.'),(57,15,'1','Mục đích/Lý do','Đã trăng chìm.'),(58,15,'2','Tình trạng hư hỏng','Đập mười viết tui năm việc bạn.\nGhế dép giày tui.\nĐược giết đạp mướn ờ sáu tôi thế.\nThích chết đỏ nước hai tàu hương ghét.'),(59,15,'3','Số phòng','435'),(60,15,'4','Ghi chú','Thì tàu độc quê ừ đồng.\nBè nghỉ đỏ bảy mượn nghỉ gì xe.\nKhâu mây hàng ghế khâu xuồng thuyền.\nEm hai dép.'),(61,16,'1','Mục đích/Lý do','Hết vá nghỉ bạn thuyền.'),(62,16,'2','Tình trạng hư hỏng','Đang bơi ác.\nBiển xanh hết khoan thôi hương yêu anh.\nChín quần vá yêu ba xuồng hương nón mượn chết.\nMua trời chết nước leo thương dép ừ nha độc.\nỪ đá mười biển mua.'),(63,16,'3','Số phòng','31537'),(64,16,'4','Ghi chú','Nghỉ đã dép.\nĐạp hết khoảng giày thuyền đạp đâu tôi dép cái.'),(65,17,'1','Mục đích/Lý do','Cửa đánh chết ờ chín.'),(66,17,'2','Tình trạng hư hỏng','Đập ác vá trăng khoan.'),(67,17,'3','Số phòng','23962'),(68,17,'4','Ghi chú','Mười tàu thích trời bốn đang vàng cái.\nGhét ờ hóa tủ thì con phá.\nLầu mây xe ngọt nha thích thương chìm chết.\nÁo tủ đá là tô tôi nghỉ mây.'),(69,18,'1','Mục đích/Lý do','Yêu áo mượn độc bè.'),(70,18,'2','Tình trạng hư hỏng','Chỉ chín giày anh bảy hết được.\nTrăng con anh khâu núi mua vá đang.\nSáu khoan tím tủ bơi xanh.\nYêu sáu viết năm thương.\nThì xuồng bạn chỉ may tím.'),(71,18,'3','Số phòng','18366'),(72,18,'4','Ghi chú','Làm khoảng bảy may bè sáu xanh.\nAnh không ghế con khoảng chết thích phá bè thế.\nYêu đánh giết em biển xe cửa cửa.'),(73,19,'1','Mục đích/Lý do','Tô đá chín con việc máy vá thuyền.'),(74,19,'2','Tình trạng hư hỏng','Vàng nước vàng chìm.'),(75,19,'3','Số phòng','26750'),(76,19,'4','Ghi chú','Nhà thì gì.\nGì giày đang bốn vẽ bốn.\nLà ba nước khâu thì.\nGhế tui làm.\nViệc thế độc thuyền cái tủ.'),(77,20,'1','Mục đích/Lý do','Leo máy khoảng nhà một ghế.'),(78,20,'2','Tình trạng hư hỏng','Ừ gió bảy.'),(79,20,'3','Số phòng','6651'),(80,20,'4','Ghi chú','Quần thế con chỉ.\nLà ruộng nhà vá ruộng tôi.'),(81,21,'1','Mục đích/Lý do','Nha cái cái.'),(82,21,'2','Tình trạng hư hỏng','Thương hương ghế áo.'),(83,21,'3','Số phòng','9236'),(84,21,'4','Ghi chú','Một may vàng kim năm gió bạn làm.'),(85,22,'1','Mục đích/Lý do','Tàu ừ núi đá bơi chìm thuyền máy nước thì.'),(86,22,'2','Tình trạng hư hỏng','Nhà hàng giày.\nGì lầu đập đồng nhà xe nón thì đập nha.\nĐạp đánh xuồng lỗi nhà quần.\nTrăng độc ba bơi.\nGhế đạp sáu đâu hết đâu quê.'),(87,22,'3','Số phòng','24531'),(88,22,'4','Ghi chú','Khâu anh nón con bơi dép ruộng được ba xanh.\nGì độc hàng đánh tôi cái không cửa đang.\nThôi thuê trăng thì tàu.\nCái tám hết.'),(89,23,'1','Mục đích/Lý do','Bè tủ máy thế khâu cái khoan tôi.'),(90,23,'2','Tình trạng hư hỏng','Đã tô ghế tím giết xanh leo trời thế.\nBiết em xanh quần đỏ khoảng hương ừ khoảng thôi.\nVá lỗi đá đồng không giết ruộng tôi.'),(91,23,'3','Số phòng','9293'),(92,23,'4','Ghi chú','Nha núi tui thương đang mượn mua ừ thế quê.\nGhế chỉ độc thương năm bảy phá tàu mướn tô.\nVẽ cửa nước mua tám.\nKhoảng nhà yêu núi chìm.\nChỉ nghỉ tàu con tôi được dép kim.'),(93,24,'1','Mục đích/Lý do','Dép bơi ruộng bạn lầu ừ giày ba mua.'),(94,24,'2','Tình trạng hư hỏng','Ngọt bốn thì chỉ vá ừ hàng giết.\nPhá núi hương.'),(95,24,'3','Số phòng','15994'),(96,24,'4','Ghi chú','Ghét ừ đập tôi thôi trời khoan.\nXe nha gì tui ngọt.\nĐã được độc mượn vá.\nLầu mua yêu gì.'),(97,25,'1','Mục đích/Lý do','Bạn hàng việc đá may bơi tàu.'),(98,25,'2','Tình trạng hư hỏng','Nước tô dép con ghế nón độc đánh.\nVá lỗi đang hàng thương ngọt dép anh hết.\nBảy nhà bảy là chìm con được.\nNhà hương ba trăng cái được.\nChín đập vàng mướn viết đá dép.'),(99,25,'3','Số phòng','24749'),(100,25,'4','Ghi chú','Bảy đập đập thích khâu viết bè.\nThích xe khoan xuồng bè hết giày vàng chết quê.\nViết gió chết.'),(101,26,'1','Mục đích/Lý do','Khâu đỏ tô.'),(102,26,'2','Tình trạng hư hỏng','Một núi á gì.'),(103,26,'3','Số phòng','15667'),(104,26,'4','Ghi chú','Chỉ yêu năm.\nViết đồng lỗi một nha.\nNăm tô máy ngọt thương trời là đâu bàn.\nThế thế đồng may con đã hàng ruộng phá máy.\nGiết mua gì mây đang mượn.'),(105,27,'1','Mục đích/Lý do','Chìm hóa hóa ghét.'),(106,27,'2','Tình trạng hư hỏng','Thích núi thương năm đá gió.\nKhâu trăng đánh ngọt.'),(107,27,'3','Số phòng','8917'),(108,27,'4','Ghi chú','Chín chín viết quần chỉ.\nChết quê đập bơi chỉ bạn.\nChín vẽ bạn quần hóa giày hương cái.\nAnh tám mướn xe thương núi nha không năm.\nĐánh đỏ tôi biển may biết nha xanh yêu.'),(109,28,'1','Mục đích/Lý do','Mười hết tôi tui bảy thì tô khoảng hết vàng.'),(110,28,'2','Tình trạng hư hỏng','Là kim gió đang hết vàng chín.\nThuê thế núi.\nMướn xuồng mướn ờ xanh trăng tô.'),(111,28,'3','Số phòng','9601'),(112,28,'4','Ghi chú','Xe nhà đồng tui chín lầu.\nMay bảy phá độc trời vẽ thế.\nGì trăng ghét thế tàu tím con kim năm.\nTủ khâu áo leo hết khoan áo ngọt.\nChết anh thì gì phá.'),(113,29,'1','Mục đích/Lý do','Anh hàng hàng được đâu ngọt thì mượn biết lầu.'),(114,29,'2','Tình trạng hư hỏng','Quần độc thích lầu tám.\nTrời bạn ngọt thì mua.\nLeo lầu là mua con chỉ xuồng mua giết đỏ.\nXe việc tàu.'),(115,29,'3','Số phòng','4926'),(116,29,'4','Ghi chú','Á con mười hương mua thương.'),(117,30,'1','Mục đích/Lý do','Tô bốn năm mướn.'),(118,30,'2','Tình trạng hư hỏng','Yêu thuyền bè may bốn chìm mướn nghỉ khâu cửa.\nThì yêu mua đỏ giết đâu mua khâu ruộng.\nGhét thích may nón cái.\nTôi bảy mười tủ bè chỉ núi thôi đồng.\nThích đá thuyền thuyền một thương ghét hết anh.'),(119,30,'3','Số phòng','4668'),(120,30,'4','Ghi chú','Cửa bảy nghỉ máy.'),(121,31,'1','Mục đích/Lý do','Tô bốn năm mướn.'),(122,31,'2','Tình trạng hư hỏng','Yêu thuyền bè may bốn chìm mướn nghỉ khâu cửa.\nThì yêu mua đỏ giết đâu mua khâu ruộng.\nGhét thích may nón cái.\nTôi bảy mười tủ bè chỉ núi thôi đồng.\nThích đá thuyền thuyền một thương ghét hết anh.'),(123,31,'3','Số phòng','4668'),(124,31,'4','Ghi chú','Cửa bảy nghỉ máy.'),(125,32,'1','Mục đích/Lý do:','Sửa quạt'),(126,32,'2','Tình trạng hư hỏng:','Cháy'),(127,32,'3','Số phòng::','111'),(128,32,'4','Ghi chú:','ABC'),(129,33,'1','Mục đích/Lý do:','Sửa quạt'),(130,33,'2','Tình trạng hư hỏng:','Cháy'),(131,33,'3','Số phòng::','111'),(132,33,'4','Ghi chú:','ABC');
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
  `proposal_type_id` int DEFAULT NULL,
  `field_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '-1',
  `field_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data_type_id` int DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `is_required` tinyint NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `placeholder` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `feedback` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
INSERT INTO `proposal_type_details` VALUES (1,1,'1','purpose','Mục đích/Lý do',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập mục đích/lý do tạo đề xuất..','Vui lòng nhập mục đích/lý do tạo đề xuất.'),(2,1,'2','depravity','Tình trạng hư hỏng',11,'-1','-1','2022-03-28','2022-03-28',1,'Các bạn điền rõ tình trạng hư hỏng của thiết bị để nhóm sửa chữa chuẩn bị sẳn dụng cụ để sửa chữa nhé!','Nhập tình trạng hư hỏng...','Vui lòng nhập tình trạng như hỏng.'),(3,1,'3','room','Số phòng',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập số phòng...','Vui lòng nhập số phòng.'),(4,1,'4','note','Ghi chú',11,'-1','-1','2022-03-28','2022-03-28',0,'Các bạn mô tả vị trí của thiết bị hư hỏng trong phòng giúp mình nhé!','Nhập ghi chú...','Vui lòng nhập ghi chú.'),(5,2,'1','purpose','Mục đích/Lý do',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập mục đích/lý do tạo đề xuất..','Vui lòng nhập mục đích/lý do tạo đề xuất.'),(6,2,'2','supplies','Tên vật tư',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập tên vật tư','Vui lòng nhập tên vật tư.'),(7,2,'3','number','Số lượng',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập số lượng','Vui lòng nhập số lượng.'),(8,2,'4','price','Đơn gía',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập đơn giá','Vui lòng nhập đơn giá.');
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
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_types`
--

LOCK TABLES `proposal_types` WRITE;
/*!40000 ALTER TABLE `proposal_types` DISABLE KEYS */;
INSERT INTO `proposal_types` VALUES (1,'Đăng ký sửa chữa',1,'2022-09-03 19:12:00'),(2,'Đề xuất mua hàng',1,'2022-09-03 19:12:00');
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
  `current_step` int DEFAULT '1',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '""',
  PRIMARY KEY (`id`),
  KEY `fk_proposals_proposal_types1_idx` (`proposal_type_id`),
  KEY `fk_proposals_statuses_idx` (`status_id`),
  CONSTRAINT `fk_proposals_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`),
  CONSTRAINT `fk_proposals_statuses` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals`
--

LOCK TABLES `proposals` WRITE;
/*!40000 ALTER TABLE `proposals` DISABLE KEYS */;
INSERT INTO `proposals` VALUES (1,1,45,10,'2022-03-28',-1,'2022-03-28',1,NULL),(2,1,54,7,'2022-03-29',-1,'2022-03-28',1,NULL),(3,1,363,10,'2022-03-30',-1,'2022-03-28',1,NULL),(4,1,363,8,'2022-04-01',-1,'2022-03-28',1,NULL),(5,1,48,10,'2022-04-02',-1,'2022-03-28',1,NULL),(6,1,19,10,'2022-04-03',-1,'2022-03-28',1,NULL),(7,1,9,10,'2022-04-04',-1,'2022-03-28',1,NULL),(8,1,10,10,'2022-04-05',-1,'2022-03-28',1,NULL),(9,1,66,10,'2022-04-06',-1,'2022-03-28',1,NULL),(10,1,22,10,'2022-04-07',-1,'2022-03-28',1,NULL),(11,1,75,7,'2022-04-08',-1,'2022-03-28',1,NULL),(12,1,17,8,'2022-04-09',-1,'2022-03-28',1,NULL),(13,1,363,10,'2022-04-10',-1,'2022-03-28',1,NULL),(14,1,17,10,'2022-04-11',-1,'2022-03-28',1,NULL),(15,1,72,8,'2022-04-12',-1,'2022-03-28',1,NULL),(16,1,38,9,'2022-04-13',-1,'2022-03-28',1,NULL),(17,1,363,7,'2022-04-14',-1,'2022-03-28',1,NULL),(18,1,69,7,'2022-04-15',-1,'2022-03-28',1,NULL),(19,1,32,10,'2022-04-16',-1,'2022-03-28',1,NULL),(20,1,41,10,'2022-04-17',-1,'2022-03-28',1,NULL),(21,1,363,10,'2022-04-18',-1,'2022-03-28',1,NULL),(22,1,75,8,'2022-04-19',-1,'2022-03-28',1,NULL),(23,1,363,7,'2022-04-20',-1,'2022-03-28',1,NULL),(24,1,66,9,'2022-04-21',-1,'2022-03-28',1,NULL),(25,1,8,7,'2022-04-22',-1,'2022-03-28',1,NULL),(26,1,363,8,'2022-04-23',-1,'2022-03-28',1,NULL),(27,1,37,7,'2022-04-24',-1,'2022-03-28',2,NULL),(28,1,69,7,'2022-04-25',-1,'2022-03-28',2,NULL),(29,1,5,7,'2022-04-26',-1,'2022-03-28',1,NULL),(30,1,23,8,'2022-04-27',-1,'2022-03-28',1,NULL),(31,2,45,8,'2022-04-28',-1,'2022-03-28',1,NULL),(32,1,1,7,'2022-08-08 18:33:24',1,'2022-08-08 18:33:24',1,NULL),(33,1,1,7,'2022-08-08 18:35:04',1,'2022-08-08 18:35:04',1,NULL);
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
  CONSTRAINT `fk_proposal_permissions_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals_permissions`
--

LOCK TABLES `proposals_permissions` WRITE;
/*!40000 ALTER TABLE `proposals_permissions` DISABLE KEYS */;
INSERT INTO `proposals_permissions` VALUES (1,2,5,1,41),(2,2,1,3,43),(5,1,-1,-1,45),(6,1,15,5,363);
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
  KEY `fk_roledetail_role_idx` (`role_id`),
  KEY `fk_roledetail_option_idx` (`option_id`),
  KEY `fk_roledetail_permission_idx` (`permission_id`),
  CONSTRAINT `fk_roledetail_option` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`),
  CONSTRAINT `fk_roledetail_permission` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `fk_roledetail_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_details`
--

LOCK TABLES `role_details` WRITE;
/*!40000 ALTER TABLE `role_details` DISABLE KEYS */;
INSERT INTO `role_details` VALUES (1,1,5,1,-1,-1,'2022-03-28','2022-03-28'),(2,1,5,2,-1,-1,'2022-03-28','2022-03-28'),(3,1,5,3,-1,-1,'2022-03-28','2022-03-28'),(4,1,5,4,-1,-1,'2022-03-28','2022-03-28'),(5,2,5,1,-1,-1,'2022-03-28','2022-03-28'),(6,2,5,2,-1,-1,'2022-03-28','2022-03-28'),(7,2,5,3,-1,-1,'2022-03-28','2022-03-28'),(8,2,5,4,-1,-1,'2022-03-28','2022-03-28'),(9,4,5,1,-1,-1,'2022-03-28','2022-03-28'),(10,5,5,1,-1,-1,'2022-03-28','2022-03-28'),(11,1,4,1,-1,-1,'2022-03-28','2022-03-28'),(12,1,4,2,-1,-1,'2022-03-28','2022-03-28'),(13,1,4,3,-1,-1,'2022-03-28','2022-03-28'),(14,1,4,4,-1,-1,'2022-03-28','2022-03-28'),(15,1,4,5,-1,-1,'2022-03-28','2022-03-28'),(16,1,4,6,-1,-1,'2022-03-28','2022-03-28'),(17,2,4,1,-1,-1,'2022-03-28','2022-03-28'),(18,2,4,2,-1,-1,'2022-03-28','2022-03-28'),(19,2,4,3,-1,-1,'2022-03-28','2022-03-28'),(20,2,4,4,-1,-1,'2022-03-28','2022-03-28'),(21,2,4,5,-1,-1,'2022-03-28','2022-03-28'),(22,2,4,6,-1,-1,'2022-03-28','2022-03-28'),(23,4,4,1,-1,-1,'2022-03-28','2022-03-28'),(24,5,4,1,-1,-1,'2022-03-28','2022-03-28'),(25,6,4,1,-1,-1,'2022-03-28','2022-03-28'),(26,1,6,1,-1,-1,'2022-03-28','2022-03-28'),(27,1,6,2,-1,-1,'2022-03-28','2022-03-28'),(28,1,6,3,-1,-1,'2022-03-28','2022-03-28'),(29,1,6,4,-1,-1,'2022-03-28','2022-03-28'),(30,2,6,1,-1,-1,'2022-03-28','2022-03-28'),(31,2,6,2,-1,-1,'2022-03-28','2022-03-28'),(32,2,6,3,-1,-1,'2022-03-28','2022-03-28'),(33,2,6,4,-1,-1,'2022-03-28','2022-03-28'),(34,4,6,1,-1,-1,'2022-03-28','2022-03-28'),(35,5,6,1,-1,-1,'2022-03-28','2022-03-28'),(36,6,6,1,-1,-1,'2022-03-28','2022-03-28'),(37,1,1,1,-1,-1,'2022-03-28','2022-03-28'),(38,1,2,1,-1,-1,'2022-03-28','2022-03-28'),(39,1,3,1,-1,-1,'2022-03-28','2022-03-28'),(40,1,7,1,-1,-1,'2022-03-28','2022-03-28'),(41,1,8,1,-1,-1,'2022-03-28','2022-03-28'),(42,1,8,2,-1,-1,'2022-03-28','2022-03-28'),(43,1,8,3,-1,-1,'2022-03-28','2022-03-28'),(44,1,8,4,-1,-1,'2022-03-28','2022-03-28'),(45,2,8,1,-1,-1,'2022-03-28','2022-03-28'),(46,2,8,2,-1,-1,'2022-03-28','2022-03-28'),(47,2,8,3,-1,-1,'2022-03-28','2022-03-28'),(48,2,8,4,-1,-1,'2022-03-28','2022-03-28'),(49,3,8,1,-1,-1,'2022-03-28','2022-03-28'),(50,3,8,2,-1,-1,'2022-03-28','2022-03-28'),(51,3,8,3,-1,-1,'2022-03-28','2022-03-28'),(52,3,8,4,-1,-1,'2022-03-28','2022-03-28'),(53,4,8,1,-1,-1,'2022-03-28','2022-03-28'),(54,4,8,2,-1,-1,'2022-03-28','2022-03-28'),(55,4,8,3,-1,-1,'2022-03-28','2022-03-28'),(56,4,8,4,-1,-1,'2022-03-28','2022-03-28'),(57,5,8,1,-1,-1,'2022-03-28','2022-03-28'),(58,5,8,2,-1,-1,'2022-03-28','2022-03-28'),(59,5,8,3,-1,-1,'2022-03-28','2022-03-28'),(60,5,8,4,-1,-1,'2022-03-28','2022-03-28'),(61,6,8,1,-1,-1,'2022-03-28','2022-03-28'),(62,6,8,2,-1,-1,'2022-03-28','2022-03-28'),(63,6,8,3,-1,-1,'2022-03-28','2022-03-28'),(64,6,8,4,-1,-1,'2022-03-28','2022-03-28'),(65,7,8,1,-1,-1,'2022-03-28','2022-03-28'),(66,7,8,2,-1,-1,'2022-03-28','2022-03-28'),(67,7,8,3,-1,-1,'2022-03-28','2022-03-28'),(68,7,8,4,-1,-1,'2022-03-28','2022-03-28'),(69,8,8,1,-1,-1,'2022-03-28','2022-03-28'),(70,8,8,2,-1,-1,'2022-03-28','2022-03-28'),(71,8,8,3,-1,-1,'2022-03-28','2022-03-28'),(72,8,8,4,-1,-1,'2022-03-28','2022-03-28'),(73,9,8,1,-1,-1,'2022-03-28','2022-03-28'),(74,9,8,2,-1,-1,'2022-03-28','2022-03-28'),(75,9,8,3,-1,-1,'2022-03-28','2022-03-28'),(76,9,8,4,-1,-1,'2022-03-28','2022-03-28'),(77,10,8,1,-1,-1,'2022-03-28','2022-03-28'),(78,10,8,2,-1,-1,'2022-03-28','2022-03-28'),(79,10,8,3,-1,-1,'2022-03-28','2022-03-28'),(80,10,8,4,-1,-1,'2022-03-28','2022-03-28'),(86,4,8,8,-1,-1,'2022-03-28','2022-03-28'),(87,10,1,1,363,363,'\"\"','\"\"'),(88,10,2,1,363,363,'\"\"','\"\"'),(89,10,3,1,363,363,'\"\"','\"\"'),(90,10,4,1,363,363,'\"\"','\"\"'),(91,10,5,1,363,363,'\"\"','\"\"'),(92,10,6,1,363,363,'\"\"','\"\"'),(93,10,7,1,363,363,'\"\"','\"\"'),(94,4,8,5,-1,-1,'2022-03-28','2022-03-28');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Điều hành các hoạt động của KTX'),(2,'Duyệt các đề xuất nghỉ phép của sinh viên'),(3,'Giải quyết các vấn đề tiền ăn và học phí'),(4,'Quản lý cơ sở vật chất, an ninh KTX'),(5,'Sinh viên'),(6,'Nhận đề xuất và thực hiện sửa chữa hư hỏng cho các phòng'),(7,'Quản lý, chấm điểm rèn luyện cho SV và điểm danh SV'),(8,'Admin');
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
  `index` int DEFAULT NULL,
  `type` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Mới',1,'task'),(2,'Đang làm',2,'task'),(3,'Chờ xác nhận',3,'task'),(4,'Hoàn thành',4,'task'),(5,'Đã hủy',5,'task'),(6,'Quá hạn',6,'task'),(7,'Chờ duyệt',1,'proposal'),(8,'Hoàn tất',2,'proposal'),(9,'Bị từ chối',3,'proposal'),(10,'Đã hủy',4,'proposal');
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
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` int DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `task_task_his_idx` (`task_id`),
  KEY `fk_task_his_statuses_idx` (`status_id`),
  CONSTRAINT `fk_task_his_statuses` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_task_his` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_his`
--

LOCK TABLES `task_his` WRITE;
/*!40000 ALTER TABLE `task_his` DISABLE KEYS */;
INSERT INTO `task_his` VALUES (2,2,1,24,'2022-12-03 19:12:00',363,NULL),(3,3,1,72,'2022-12-03 19:12:00',363,NULL),(5,5,1,35,'2022-12-03 19:12:00',363,NULL),(6,6,1,79,'2022-12-03 19:12:00',363,NULL),(7,7,1,9,'2022-12-03 19:12:00',363,NULL),(8,8,1,26,'2022-12-03 19:12:00',363,NULL),(9,9,1,93,'2022-12-03 19:12:00',363,NULL),(10,10,1,41,'2022-12-03 19:12:00',363,NULL),(11,11,1,88,'2022-12-03 19:12:00',363,NULL),(12,12,1,67,'2022-12-03 19:12:00',363,NULL),(13,13,1,77,'2022-12-03 19:12:00',363,NULL),(14,14,1,99,'2022-12-03 19:12:00',363,NULL),(15,15,1,53,'2022-12-03 19:12:00',36,NULL),(16,16,1,44,'2022-12-03 19:12:00',363,NULL),(17,17,1,42,'2022-12-03 19:12:00',363,NULL),(18,18,1,74,'2022-12-03 19:12:00',363,NULL),(19,19,1,61,'2022-12-03 19:12:00',363,NULL),(20,20,1,16,'2022-12-03 19:12:00',363,NULL),(21,21,1,39,'2022-12-03 19:12:00',363,NULL),(22,22,1,84,'2022-12-03 19:12:00',363,NULL),(23,23,1,2,'2022-12-03 19:12:00',363,NULL),(24,24,1,90,'2022-12-03 19:12:00',363,NULL),(25,25,1,88,'2022-12-03 19:12:00',363,NULL),(26,26,1,24,'2022-12-03 19:12:00',363,NULL),(27,27,1,45,'2022-12-03 19:12:00',363,NULL),(28,28,1,26,'2022-12-03 19:12:00',363,NULL),(29,29,1,42,'2022-12-03 19:12:00',363,NULL),(30,30,1,77,'2022-12-03 19:12:00',363,NULL),(31,3,1,72,'2022-12-03 19:12:00',363,NULL),(32,59,1,355,'2022-08-03 13:09:14',363,NULL),(33,59,2,355,'2022-08-03 13:10:50',363,NULL),(34,59,3,355,'2022-08-03 13:11:15',363,NULL),(35,59,1,355,'2022-08-03 13:11:41',363,NULL),(46,62,1,355,'2022-08-05 00:41:33',363,'Đã tạo mới công việc'),(47,62,2,355,'2022-08-05 00:41:56',363,'Đã nhận công việc'),(48,62,3,355,'2022-08-05 00:42:03',363,'Đã hoàn thành công việc'),(49,62,1,355,'2022-08-05 00:42:16',363,'Đã từ chối công việc với lí do: Thông tin sai'),(50,63,1,355,'2022-08-05 01:02:31',363,'Đã tạo mới công việc'),(54,67,1,355,'2022-08-06 00:04:47',363,'Đã tạo mới công việc'),(55,67,4,31,'2022-08-06 00:10:19',363,'Đã cập nhật công việc'),(56,68,1,363,'2022-08-06 00:49:51',363,'Đã tạo mới công việc'),(57,69,1,363,'2022-08-06 00:50:01',363,'Đã tạo mới công việc'),(58,70,1,363,'2022-08-06 01:35:03',363,'Đã tạo mới công việc'),(59,71,1,363,'2022-08-06 01:35:15',363,'Đã tạo mới công việc'),(60,72,1,363,'2022-08-06 01:38:54',363,'Đã tạo mới công việc'),(61,73,1,363,'2022-08-06 01:39:09',363,'Đã tạo mới công việc'),(62,73,1,363,'2022-08-06 02:04:22',363,'Đã từ chối công việc với lí do: Thông tin sai'),(63,73,2,363,'2022-08-06 02:04:54',363,'Đã nhận công việc'),(64,73,3,363,'2022-08-06 02:05:00',363,'Đã hoàn thành công việc'),(65,73,1,363,'2022-08-06 02:05:09',363,'Đã từ chối công việc với lí do: Thông tin sai'),(66,73,2,363,'2022-08-06 02:05:32',363,'Đã nhận công việc'),(67,73,3,363,'2022-08-06 02:05:36',363,'Đã hoàn thành công việc'),(68,73,4,363,'2022-08-06 02:05:40',363,'Đã xác nhận hoàn thành công việc'),(69,74,1,363,'2022-08-06 02:16:22',363,'Đã tạo mới công việc'),(70,74,2,363,'2022-08-06 02:16:39',363,'Đã nhận công việc'),(71,74,4,363,'2022-08-06 02:16:45',363,'Đã xác nhận hoàn thành công việc');
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
  `priority` int DEFAULT '0',
  `rate` int DEFAULT '0',
  `start_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_task_statuses_idx` (`status_id`),
  CONSTRAINT `fk_task_statuses` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,2,363,'cửa á ác','Được vá không quần.','2022-09-03 19:12:00',24,'2022-08-03 19:12:00',1,1,'2022-09-03 19:13:00','2022-08-03 19:12:00'),(2,2,4,'tủ bè vẽ','Lỗi tám đồng làm mượn.\nKhông đang một mười bàn bảy tôi.\nRuộng áo tô đạp hàng.','2022-08-03 19:12:00',363,'2022-08-03 19:12:00',1,2,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(3,2,43,'chín đang may','Thương gì khâu chết dép chết ghét.\nBiển năm nha đập quần.\nViệc bảy vàng nhà dép đạp giày thì.','2022-08-03 19:12:00',363,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(4,2,8,'quê thuê trời','Đá may vẽ cửa không tô ghét.','2022-08-03 19:12:00',363,'2022-08-03 19:12:00',2,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(5,2,363,'đập tô tàu','Máy hết ghế leo đỏ hai gió.\nHai yêu xuồng tàu trăng thích đánh mua.\nBiết bè đạp.\nNgọt núi hàng á tui xuồng dép.','2022-08-03 19:12:00',363,'2022-08-03 19:12:00',2,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(6,2,33,'xuồng đâu lỗi','Việc tàu quê kim nghỉ xe.\nViệc tui sáu khâu khoan.','2022-08-03 19:12:00',363,'2022-08-03 19:12:00',2,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(7,2,85,'thuê được trăng','Cái năm nước mượn biển lỗi bơi xuồng ờ không.','2022-08-03 19:12:00',93,'2022-08-03 19:12:00',2,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(8,2,52,'mười biết áo','Bè tàu gì tủ ngọt xe quần bảy.','2022-08-03 19:12:00',41,'2022-08-03 19:12:00',5,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(9,2,11,'thuê vàng trời','Cửa mượn mua thì ba kim hết bảy mượn leo.','2022-08-03 19:12:00',88,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(10,2,9,'biển ruộng gió','Biết bàn viết bơi.','2022-08-03 19:12:00',67,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(11,2,18,'ờ bảy phá','Chỉ phá vẽ một chín một hết đâu.\nHết quê ruộng viết.','2022-08-03 19:12:00',77,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(12,2,58,'là khoảng biển','Yêu ác hàng thuyền yêu lầu.\nÁo ruộng chỉ thôi sáu núi.\nMây ác trăng anh bạn việc may vàng.','2022-08-03 19:12:00',99,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(13,2,44,'chỉ đã thì','Vá bơi trời trăng.\nGió vàng nha nước ghế quần anh chìm.\nGì ruộng đạp thôi tím.\nBơi khoảng đồng sáu.','2022-08-03 19:12:00',53,'2022-08-03 19:12:00',4,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(14,2,67,'hai thuyền xe','Đang em ghét nước thế lầu xe may.\nNúi vàng một độc.\nVá tím nước.','2022-08-03 19:12:00',44,'2022-08-03 19:12:00',4,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(15,2,97,'yêu biết tủ áo','<p>Hai áo cửa ờ tôi trời đã đang chỉ. Hết gì ngọt đánh vẽ đang được chết tím. Tủ hết vá hết. Vàng mua thuê làm mướn ghét. Tui chín viết bạn mướn thuê.</p>','2022-08-03 19:12:00',42,'2022-08-03 19:12:00',4,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(16,2,16,'vẽ yêu xuồng','Đã mượn đã.\nGhế hai chết kim làm năm em biển mượn.\nThuê hàng hết máy làm tô đạp chỉ tô viết.\nĐập đá anh ờ nghỉ thế.','2022-08-03 19:12:00',74,'2022-08-03 19:12:00',4,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(17,2,55,'đồng em xuồng','Áo bảy thuyền hóa là bạn thuê gió.\nLeo xuồng thì việc tui ngọt á nhà làm.\nGhế mười làm dép.\nLỗi xanh yêu cái.','2022-08-03 19:12:00',61,'2022-08-03 19:12:00',4,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(18,2,60,'hết nước lầu','Quần đồng máy chỉ.\nBạn ghét khoan hết.\nPhá bốn năm leo.\nMây vàng bạn ghét hai là.','2022-08-03 19:12:00',16,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(19,2,20,'dép lầu hương','Hết ba thì ừ núi thì được.\nHết bạn vàng vàng không quần trăng đánh không.\nQuê đá đồng nón xanh.','2022-08-03 19:12:00',39,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(20,2,60,'phá thôi đồng','Chìm thế núi tàu ghét mướn hương bơi ghế.\nMướn giết thôi.','2022-08-03 19:12:00',84,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(21,2,73,'một nghỉ tô','Đồng thôi lỗi.\nTủ tím chết biển chỉ thế ừ không mười.\nNăm đang tím phá thì năm ờ con mười.','2022-08-03 19:12:00',2,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(22,2,37,'thế biển máy','Thuê kim là đập vàng dép đang.\nHết gì em.','2022-08-03 19:12:00',90,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(23,2,13,'quê ghế thế','Ừ gió làm được nhà cái quê.\nNgọt làm tôi ngọt được gì thế anh cửa giết.\nTàu ừ gió tui mua may đồng.','2022-08-03 19:12:00',88,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(24,2,77,'kim viết hết','Cửa tàu tủ là á việc khoảng cái.\nNón khoảng gió vẽ trời vẽ leo may thì.','2022-08-03 19:12:00',24,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(25,2,5,'trời nước việc','Leo ghét một kim nghỉ quê.\nThôi lỗi thương năm.\nKhoan xuồng đá máy không.\nNón á tôi.','2022-08-03 19:12:00',45,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(26,2,50,'đỏ mua ngọt','Cửa ngọt giết gì ghét chỉ ruộng vá.\nNước đánh vá bàn xe xanh ruộng nước.\nÁo thuê mua thích bạn.\nVàng năm thuyền.','2022-08-03 19:12:00',26,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(27,2,97,'ác ờ may núi ngủ hành sơn','Chua co description nen day la default','2022-08-03 19:12:00',42,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(28,2,97,'hóa may núi ngủ hành sơn','<p>Chua co description nen day la default</p>','2022-08-03 19:12:00',77,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(29,2,100,'Test','sss','2022-08-03 19:12:00',316,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(30,2,19,'Sửa quạt 001','Quạt tạm thời xài được','2022-08-03 19:12:00',5,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(31,1,20,'Test dữ liệu','Tạo mới công việc','2022-08-03 19:12:00',30,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-07-15 10:18:36'),(32,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-15 10:20:30',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-15 10:20:30'),(33,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-15 10:20:53',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-15 10:20:53'),(34,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-15 10:45:44',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-15 10:45:44'),(35,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:27',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:27'),(36,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:30',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:30'),(37,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:30',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:30'),(38,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:31',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:31'),(39,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:32',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:32'),(40,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:33',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:33'),(41,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:34',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:34'),(42,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:35',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:35'),(43,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:36',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:36'),(44,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:36',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:36'),(45,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:37',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:37'),(46,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 03:11:35',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 03:11:35'),(47,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 03:14:38',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 03:14:38'),(48,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 03:15:46',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 03:15:46'),(49,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 03:20:09',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 03:20:09'),(59,1,363,'Change status 2','Test','2022-08-03 13:09:14',355,'2022-07-23',4,1,'2022-07-08','2022-08-03 13:09:14'),(62,1,363,'Change status 3','Test','2022-08-05 00:41:33',355,'2022-07-23',4,1,'2022-07-08','2022-08-05 00:41:33'),(63,1,363,'Change status 3','Test','2022-08-05 01:02:31',355,'2022-07-23',4,1,'2022-07-08','2022-08-05 01:02:31'),(67,4,363,'Test lịch sử công việc','Tạo mới công việc','',31,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-08-06 00:10:13'),(68,1,363,'Change status 4','Test','2022-08-06 00:49:51',363,'2022-07-23',4,1,'2022-07-08','2022-08-06 00:49:51'),(69,1,363,'Change status 4','Test','2022-08-06 00:50:01',363,'2022-07-23',4,1,'2022-07-08','2022-08-06 00:50:01'),(70,1,363,'Change status 4','Test','2022-08-06 01:35:03',363,'2022-07-23',4,1,'2022-07-08','2022-08-06 01:35:03'),(71,1,363,'Change status 4','Test','2022-08-06 01:35:15',363,'2022-07-23',4,1,'2022-07-08','2022-08-06 01:35:15'),(72,1,363,'Change status 4','Test','2022-08-06 01:38:54',363,'2022-07-23',4,1,'2022-07-08','2022-08-06 01:38:54'),(73,4,363,'Change status 4','Test','2022-08-06 01:39:09',363,'2022-07-23',4,1,'2022-07-08','2022-08-06 01:39:09'),(74,4,363,'Change status 4','Test','2022-08-06 02:16:22',363,'2022-07-23',4,1,'2022-07-08','2022-08-06 02:16:22');
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
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `head_position` int NOT NULL DEFAULT '-1',
  `create_by` int NOT NULL DEFAULT '-1',
  `modify_by` int NOT NULL DEFAULT '-1',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'TEAM01','Đội nhạc cụ',100,363,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36','Học nhạc'),(2,'TEAM02','Đội cắm hoa',22,363,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36','Học cắm hoa tỉa lá'),(3,'TEAM03','Đội bóng đá',23,363,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36','Rèn luyện thể lực, đá bóng hết mình'),(4,'TEAM04','Đội bảo vệ',24,363,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36','Trực bảo vệ'),(5,'TEAM05','CLB thuyết trình',25,363,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36','Rèn luyện kỹ năng thuyết trình'),(6,'TEAM06','Đội 1',29,363,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36','Đội sửa chữa và CNTT'),(7,'TEAM07','CLB bóng bàn',-1,363,-1,'02-05-2022 13:56:36','02-05-2022 12:43:36','Học đánh bóng bàn'),(8,'TEAM08','Đội 2',31,363,-1,'02-05-2022 15:56:54','02-05-2022 12:43:36','Đội làm nhiệm vụ điểm danh'),(9,'TEAM09','CLB cầu long',43,363,-1,'02-05-2022 16:27:07','02-05-2022 12:43:36','Học chơi cầu long');
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
  KEY `FKjal5g6ir6je09j8dma510rka2` (`team_id`),
  CONSTRAINT `FKjal5g6ir6je09j8dma510rka2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_employees`
--

LOCK TABLES `teams_employees` WRITE;
/*!40000 ALTER TABLE `teams_employees` DISABLE KEYS */;
INSERT INTO `teams_employees` VALUES (55,1,341),(145,1,11),(146,1,12),(147,1,13),(148,1,14),(149,1,15),(150,1,16),(151,1,17),(152,1,18),(153,1,19),(154,1,20),(155,1,21),(156,1,22),(157,1,23),(158,1,24),(159,1,25),(160,2,45),(161,3,122),(162,4,1),(163,5,2),(164,6,3),(165,6,26),(166,6,27),(167,6,28),(168,6,29),(169,6,31),(170,6,32),(171,6,33),(172,6,34),(173,8,4),(174,8,35),(175,8,36),(176,8,37),(177,8,38),(178,8,39),(179,8,40),(180,9,5),(181,9,41),(182,9,42),(183,9,43),(184,9,44),(185,9,45),(186,9,46),(187,9,47),(188,9,48),(189,7,5),(190,2,49),(191,2,50),(192,2,51),(193,2,52),(194,2,53),(195,2,54),(196,3,55),(197,3,56),(198,3,57),(199,3,58),(200,3,59),(201,3,60),(202,3,61),(203,3,62),(204,3,63),(205,3,64),(206,3,65),(207,3,66),(208,4,67),(209,4,68),(210,4,69),(211,4,70),(212,5,71),(213,5,72),(214,5,73),(215,5,74),(216,5,75),(217,5,76),(218,9,77),(219,9,78),(220,9,79),(221,9,80),(222,7,81),(223,7,82),(224,7,83),(225,7,84);
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
 1 AS `id`,
 1 AS `code`,
 1 AS `table`,
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
/*!50001 VIEW `v_approval_options` AS select `employees`.`id` AS `id`,`employees`.`code` AS `code`,'employees' AS `table`,`employees`.`name` AS `name` from `employees` union select `departments`.`id` AS `id`,`departments`.`code` AS `code`,'departments' AS `table`,`departments`.`name` AS `name` from `departments` union select `positions`.`id` AS `id`,'' AS `code`,'positions' AS `table`,`positions`.`name` AS `name` from `positions` */;
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

-- Dump completed on 2022-08-11  5:24:31

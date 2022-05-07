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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'1','Ban Quản Lý KTX Cỏ May',-1,-1,-1,'28-03-2022','28-03-2022','test',1,1),(2,'2','Bảo trì - Bảo dưỡng CSVC KTX',1,-1,-1,'28-03-2022','28-03-2022','test',2,4),(3,'3','Đội sửa chữa',2,-1,-1,'28-03-2022','28-03-2022','test',3,5),(4,'4','Tầng 1',2,-1,-1,'28-03-2022','28-03-2022','test',3,7),(5,'5','Tầng 2',2,-1,-1,'28-03-2022','28-03-2022','test',3,10),(6,'6','Tầng 3',2,-1,-1,'28-03-2022','28-03-2022','test',3,13),(7,'7','Tầng trệt',2,-1,-1,'28-03-2022','28-03-2022','test',3,16),(8,'8','Kiểm tra và giám sát sinh viên',1,-1,-1,'28-03-2022','28-03-2022','test',2,19),(9,'9','Tổ chức sự kiện',1,-1,-1,'28-03-2022','28-03-2022','test',2,NULL),(10,'10','Truyền thông',1,-1,-1,'28-03-2022','28-03-2022','test',2,NULL),(11,'11','Sinh viên',1,-1,-1,'28-03-2022','28-03-2022','test',2,NULL),(12,'Test','AAA',-1,-1,-1,'02-05-2022 09:19:28','','dadss',4,-1),(15,'111','111',-1,-1,-1,'02-05-2022 12:57:29','','111',1,-1),(17,'dádadsa','dáđá',0,-1,-1,'02-05-2022 13:15:28','','dáđas',-1,-1),(19,'PB01','Ban quản trị',8,-1,-1,'03-05-2022 19:24:51','','Quản lý thông tin sinh viên',3,-1),(20,'PBF1','Quản trị phòng ban',8,-1,-1,'03-05-2022 19:26:30','','',3,47);
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
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments_employees`
--

LOCK TABLES `departments_employees` WRITE;
/*!40000 ALTER TABLE `departments_employees` DISABLE KEYS */;
INSERT INTO `departments_employees` VALUES (1,7,1),(2,7,2),(3,7,3),(4,7,4),(5,7,5),(6,7,6),(7,7,7),(8,7,8),(9,7,9),(10,7,10),(11,7,11),(12,7,12),(13,7,13),(14,7,14),(15,7,15),(16,4,16),(17,4,17),(18,4,18),(19,4,19),(20,4,20),(21,4,21),(22,4,22),(23,4,23),(24,4,24),(25,4,25),(26,4,26),(27,4,27),(28,4,28),(29,4,29),(30,4,30),(31,5,31),(32,5,32),(33,5,33),(34,5,34),(35,5,35),(36,5,36),(37,5,37),(38,5,38),(39,5,39),(40,5,40),(41,5,41),(42,5,42),(43,5,43),(44,5,44),(45,5,45),(46,6,46),(47,6,47),(48,6,48),(49,6,49),(50,6,50),(51,6,51),(52,6,52),(53,6,53),(54,6,54),(55,6,55),(56,6,56),(57,6,57),(58,6,58),(59,6,59),(60,6,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,3,76),(77,3,77),(78,3,78),(79,3,79),(80,3,80),(81,3,81),(82,3,82),(83,3,83),(84,3,84),(85,3,85),(86,3,86),(87,3,87),(88,3,88),(89,3,89),(90,3,90),(91,8,91),(92,8,92),(93,8,93),(94,8,94),(95,8,95),(96,8,96),(97,8,97),(98,8,98),(99,8,99),(100,1,100),(101,4,1),(102,5,100),(103,5,2),(104,5,60),(117,3,104),(118,7,104),(119,4,105),(120,5,107),(121,7,108),(122,6,109),(123,4,110),(124,6,111),(125,7,112),(126,4,113),(127,4,114),(128,6,115),(129,4,116),(130,6,117),(131,6,118),(132,7,119),(133,6,120),(134,4,121),(136,6,123),(137,6,124),(138,4,125),(139,5,126),(140,7,127),(141,4,128),(142,5,129),(143,6,130),(144,6,131),(145,6,132),(146,7,133),(147,7,134),(148,7,135),(149,7,136),(150,7,137),(151,7,138),(152,6,139),(153,5,140),(154,5,141),(155,7,142),(156,7,143),(157,6,144),(158,6,145),(159,6,146),(160,4,147),(161,7,148),(162,7,149),(163,7,150),(164,4,151),(165,6,152),(166,4,153),(167,6,154),(168,5,155),(169,7,156),(170,5,157),(171,7,158),(172,6,159),(173,7,160),(174,5,161),(175,6,162),(176,7,163),(177,5,164),(178,7,165),(179,7,166),(180,6,167),(181,4,168),(182,7,169),(183,4,170),(184,5,171),(185,4,172),(186,6,173),(187,4,174),(188,6,175),(189,6,176),(190,7,177),(191,7,178),(192,7,179),(193,4,180),(194,5,181),(195,6,182),(196,6,183),(197,6,184),(198,7,185),(199,7,186),(200,4,187),(201,5,188),(202,6,189),(203,6,190),(204,7,191),(205,4,192),(206,4,193),(207,6,194),(208,6,195),(209,6,196),(210,5,197),(211,7,198),(212,4,199),(213,4,200),(214,5,201),(215,7,202),(216,6,203),(217,7,204),(218,6,205),(219,6,206),(220,7,207),(221,7,208),(222,4,209),(223,4,210),(224,5,211),(225,6,212),(226,6,213),(227,7,214),(228,4,215),(229,5,216),(230,6,217),(231,6,218),(232,7,219),(233,7,220),(234,6,221),(235,6,222),(236,4,223),(237,4,224),(238,6,225),(239,7,226),(240,4,227),(241,4,228),(242,4,229),(243,7,230),(244,7,231),(245,6,232),(246,6,233),(247,7,234),(248,4,235),(249,5,236),(250,7,237),(251,7,238),(252,4,239),(253,6,240),(254,5,241),(255,4,242),(256,7,243),(257,6,244),(258,7,245),(259,7,246),(260,6,247),(261,6,248),(262,7,249),(263,6,250),(264,4,251),(265,7,252),(266,4,253),(267,4,254),(268,6,255),(269,7,256),(270,6,257),(271,4,258),(272,5,259),(273,4,260),(274,6,261),(275,4,262),(276,4,263),(277,7,264),(278,7,265),(279,5,266),(280,6,267),(281,6,268),(282,6,269),(283,6,270),(284,7,271),(285,7,272),(286,7,273),(287,7,274),(288,7,275),(289,4,276),(290,5,277),(291,4,278),(292,4,279),(293,5,280),(294,7,281),(295,5,282),(296,4,283),(297,7,284),(298,4,285),(299,6,286),(300,5,287),(301,6,288),(302,7,289),(303,6,290),(304,7,291),(305,7,292),(306,4,293),(307,4,294),(308,4,295),(309,7,296),(310,5,297),(311,6,298),(312,5,299),(313,4,300),(314,5,301),(315,6,302),(316,4,303),(317,6,304),(318,6,305),(319,7,306),(320,5,307),(321,6,308),(322,7,309),(323,6,310),(324,6,311),(325,7,312),(326,5,313),(327,6,314),(328,7,315),(329,5,316),(330,7,317),(331,7,318),(332,7,319),(333,6,320),(334,7,321),(335,7,322),(336,4,323),(337,4,324),(338,6,325),(339,6,326),(340,6,327),(341,5,328),(342,5,329),(343,4,330),(344,6,331),(345,6,332),(346,5,333),(347,6,334),(348,4,335),(349,4,336),(350,5,337),(351,6,338),(352,7,339),(353,7,340),(354,4,341),(355,4,342),(356,6,343),(357,4,344),(358,6,345),(359,4,346),(360,7,347),(361,5,348),(362,6,349),(363,7,350),(364,7,351),(379,1,356),(380,7,356),(381,2,122),(382,1,122),(383,4,122),(384,5,122);
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
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'1','Ðức Chính Đoàn','01-03-2000','ThiHng.Lm77@hotmail.com','0269 0386 9201','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThiHng.Lm77@hotmail.com','cmdcmd',0,1,-1,-1),(2,'2','Đông Nghi Đoàn','01-03-2000','PhngTrinh.Bi26@yahoo.com','0249 6226 0641','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','PhngTrinh.Bi26@yahoo.com','cmdcmd',0,1,-1,-1),(3,'3','Thùy Oanh Mai MD','01-03-2000','KhnhChi60@yahoo.com','0295 3306 3990','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KhnhChi60@yahoo.com','cmdcmd',0,1,-1,-1),(4,'4','Sơn Quyền Hoàng','01-03-2000','ThoQuyn95@yahoo.com','0252 3525 4277','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThoQuyn95@yahoo.com','cmdcmd',0,1,-1,-1),(5,'5','Hoài Thương Phùng','01-03-2000','AnhVit.V@yahoo.com','029 1419 1954','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','AnhVit.V@yahoo.com','cmdcmd',0,1,-1,-1),(6,'6','Miss Ái Linh Phùng','01-03-2000','ThanhKiu27@hotmail.com','020 8540 6847','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThanhKiu27@hotmail.com','cmdcmd',0,1,-1,-1),(7,'7','Ðan Quỳnh Tô','01-03-2000','HongSa15@yahoo.com','023 1443 4607','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HongSa15@yahoo.com','cmdcmd',0,1,-1,-1),(8,'8','Bảo Tín Phùng','01-03-2000','GiangThin_T@gmail.com','021 8246 3839','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','GiangThin_T@gmail.com','cmdcmd',0,1,-1,-1),(9,'9','Phước Bình Phạm','01-03-2000','HongHip_Phm@yahoo.com','0223 8350 5531','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HongHip_Phm@yahoo.com','cmdcmd',0,1,-1,-1),(10,'10','Diễm Trinh Trần','01-03-2000','HongNgn_Nguyn@gmail.com','021 0099 0911','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HongNgn_Nguyn@gmail.com','cmdcmd',0,1,-1,-1),(11,'11','Quang Dương Lý','01-03-2000','XunHiu.Lm@yahoo.com','0239 4500 2897','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','XunHiu.Lm@yahoo.com','cmdcmd',0,1,-1,-1),(12,'12','Dr. Thanh Tuyết Trần','01-03-2000','ThuVit_inh78@yahoo.com','0209 6015 8608','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThuVit_inh78@yahoo.com','cmdcmd',0,1,-1,-1),(13,'13','Hồ Nam Hoàng','01-03-2000','XunQu8@hotmail.com','020 0696 7709','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','XunQu8@hotmail.com','cmdcmd',0,1,-1,-1),(14,'14','Thiếu Anh Đào','01-03-2000','KinBnh89@hotmail.com','0203 1346 1053','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KinBnh89@hotmail.com','cmdcmd',0,1,-1,-1),(15,'15','Minh Mẫn Đoàn','01-03-2000','Hunh.Phan30@yahoo.com','021 4694 2150','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hunh.Phan30@yahoo.com','cmdcmd',0,1,-1,-1),(16,'16','Ðức Quyền Hồ','01-03-2000','VnNhi_Tng@hotmail.com','024 6837 2044','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','VnNhi_Tng@hotmail.com','cmdcmd',0,1,-1,-1),(17,'17','Gia Thiện Đinh','01-03-2000','KimKhuyn.T73@hotmail.com','0283 3870 7783','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KimKhuyn.T73@hotmail.com','cmdcmd',0,1,-1,-1),(18,'18','Quỳnh Lâm Lâm IV','01-03-2000','PhngThanh.Hong@gmail.com','0264 8177 9771','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','PhngThanh.Hong@gmail.com','cmdcmd',0,1,-1,-1),(19,'19','Ms. Việt Huy Mai','01-03-2000','TUyn97@hotmail.com','026 2736 7901','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TUyn97@hotmail.com','cmdcmd',0,1,-1,-1),(20,'20','Thiện Sinh Vũ','01-03-2000','Hut.Trng@hotmail.com','026 7170 5151','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hut.Trng@hotmail.com','cmdcmd',0,1,-1,-1),(21,'21','Hương Mai Tăng','01-03-2000','TunHong40@hotmail.com','0242 4384 0246','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TunHong40@hotmail.com','cmdcmd',0,1,-1,-1),(22,'22','Nam An Trương','01-03-2000','BchTr_Phng11@gmail.com','0272 5099 6423','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','BchTr_Phng11@gmail.com','cmdcmd',0,1,-1,-1),(23,'23','Ái Linh Mai','01-03-2000','KimHng.Mai@gmail.com','0255 6369 3736','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KimHng.Mai@gmail.com','cmdcmd',0,1,-1,-1),(24,'24','Hồng Nhật Trịnh I','01-03-2000','ThinKim94@gmail.com','0214 9858 6417','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThinKim94@gmail.com','cmdcmd',0,1,-1,-1),(25,'25','Bình Dân Vương Sr.','01-03-2000','CngLc_H@gmail.com','0210 9639 2455','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','CngLc_H@gmail.com','cmdcmd',0,1,-1,-1),(26,'26','Lương Thiện Phan','01-03-2000','PhngHoa41@gmail.com','0212 4485 5898','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','PhngHoa41@gmail.com','cmdcmd',0,1,-1,-1),(27,'27','Phú Ân Dương III','01-03-2000','DimMy_Dng15@gmail.com','026 2348 6108','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','DimMy_Dng15@gmail.com','cmdcmd',0,1,-1,-1),(28,'28','Vân Quyên Nguyễn IV','01-03-2000','PhiNhn31@hotmail.com','026 9359 7959','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','PhiNhn31@hotmail.com','cmdcmd',0,1,-1,-1),(29,'29','Thế Tường Hồ','01-03-2000','ChiuPhong_Vng88@hotmail.com','0208 4194 1271','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ChiuPhong_Vng88@hotmail.com','cmdcmd',0,1,-1,-1),(30,'30','Trúc Lam Tăng DDS','01-03-2000','HoMi_H72@yahoo.com','023 0200 9314','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HoMi_H72@yahoo.com','cmdcmd',0,1,-1,-1),(31,'31','Công Bằng Vương','01-03-2000','QucTun.Mai@hotmail.com','023 1408 6450','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','QucTun.Mai@hotmail.com','cmdcmd',0,1,-1,-1),(32,'32','Mrs. Diễm Uyên Tô','01-03-2000','HngQu_Ng@hotmail.com','0265 2843 3246','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HngQu_Ng@hotmail.com','cmdcmd',0,1,-1,-1),(33,'33','Miss Đinh Hương Trịnh','01-03-2000','MHip.Phng21@yahoo.com','029 2829 1524','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','MHip.Phng21@yahoo.com','cmdcmd',0,1,-1,-1),(34,'34','Ðình Dương Đỗ','01-03-2000','ngHi29@yahoo.com','0258 2682 3601','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ngHi29@yahoo.com','cmdcmd',0,1,-1,-1),(35,'35','Mrs. Anh Quân Ngô','01-03-2000','NgcHuy_V69@hotmail.com','022 1982 7498','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','NgcHuy_V69@hotmail.com','cmdcmd',0,1,-1,-1),(36,'36','Nam Thông Lý','01-03-2000','ThcTm11@yahoo.com','020 3561 5187','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThcTm11@yahoo.com','cmdcmd',0,1,-1,-1),(37,'37','Miss Thanh Thúy Vũ','01-03-2000','ThiThi.Dng@yahoo.com','0294 5768 6398','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThiThi.Dng@yahoo.com','cmdcmd',0,1,-1,-1),(38,'38','Ngọc Liên Đào','01-03-2000','ThanhHoa74@gmail.com','0245 3926 0583','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThanhHoa74@gmail.com','cmdcmd',0,1,-1,-1),(39,'39','Ms. Long Vịnh Phùng','01-03-2000','ThuThun_Ng@yahoo.com','027 6713 9007','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThuThun_Ng@yahoo.com','cmdcmd',0,1,-1,-1),(40,'40','Minh Tân Lê','01-03-2000','ThchTho.on@hotmail.com','0222 4191 4468','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThchTho.on@hotmail.com','cmdcmd',0,1,-1,-1),(41,'41','Ngọc Thi Hoàng','01-03-2000','DuyTn_Hong8@yahoo.com','023 3022 5329','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','DuyTn_Hong8@yahoo.com','cmdcmd',0,1,-1,-1),(42,'42','Tuyết Hương Lâm','01-03-2000','ThnhCng55@gmail.com','025 3052 3429','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThnhCng55@gmail.com','cmdcmd',0,1,-1,-1),(43,'43','Xuân Cung Đào','01-03-2000','KimLin70@gmail.com','024 9331 2914','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','KimLin70@gmail.com','cmdcmd',0,1,-1,-1),(44,'44','Bảo Huỳnh Vũ','01-03-2000','HuTon11@hotmail.com','0211 9197 0241','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HuTon11@hotmail.com','cmdcmd',0,1,-1,-1),(45,'45','Nhật Hoàng Lý','01-03-2000','CngHi_T@yahoo.com','0289 7740 2287','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','CngHi_T@yahoo.com','cmdcmd',0,1,-1,-1),(46,'46','Hồng Ðào Phạm','01-03-2000','BuChng.Mai@yahoo.com','0292 9362 5626','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','BuChng.Mai@yahoo.com','cmdcmd',0,1,-1,-1),(47,'47','Tường Vi Lê','01-03-2000','ThyTin77@hotmail.com','0283 1862 5655','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThyTin77@hotmail.com','cmdcmd',0,1,-1,-1),(48,'48','Hữu Hiệp Ngô','01-03-2000','NhtLan.ng@hotmail.com','025 9647 5024','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','NhtLan.ng@hotmail.com','cmdcmd',0,1,-1,-1),(49,'49','Trân Châu Hà','01-03-2000','SongLam.Tng22@hotmail.com','0272 1933 9777','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','SongLam.Tng22@hotmail.com','cmdcmd',0,1,-1,-1),(50,'50','Tuấn Khải Tăng','01-03-2000','HongDu_H16@yahoo.com','0274 0084 2384','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HongDu_H16@yahoo.com','cmdcmd',0,1,-1,-1),(51,'51','Quốc Hoài Phan','01-03-2000','QucHi.Tng72@gmail.com','026 5716 7339','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','QucHi.Tng72@gmail.com','cmdcmd',0,1,-1,-1),(52,'52','Đan Thư Hoàng','01-03-2000','HngChi_Tng14@yahoo.com','024 9037 8913','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HngChi_Tng14@yahoo.com','cmdcmd',0,1,-1,-1),(53,'53','Trung Anh Dương','01-03-2000','nhTrung.o75@hotmail.com','0238 6394 3809','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nhTrung.o75@hotmail.com','cmdcmd',0,1,-1,-1),(54,'54','Hoàng Xuân Đinh','01-03-2000','cTu.Trn78@yahoo.com','0273 5542 8124','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','cTu.Trn78@yahoo.com','cmdcmd',0,1,-1,-1),(55,'55','Hoàng Việt Lâm','01-03-2000','BchChiu33@yahoo.com','0291 0305 8252','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','BchChiu33@yahoo.com','cmdcmd',0,1,-1,-1),(56,'56','Cát Uy Đào Jr.','01-03-2000','TngLinh32@gmail.com','0243 4271 7880','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','TngLinh32@gmail.com','cmdcmd',0,1,-1,-1),(57,'57','Gia Huy Bùi','01-03-2000','KhiTm.Tng26@gmail.com','0239 4644 7267','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','KhiTm.Tng26@gmail.com','cmdcmd',0,1,-1,-1),(58,'58','Thanh Tùng Hồ','01-03-2000','HnhTho97@gmail.com','0200 6241 9910','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HnhTho97@gmail.com','cmdcmd',0,1,-1,-1),(59,'59','Bá Thịnh Hồ','01-03-2000','LongGiang.H@gmail.com','024 0370 9248','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','LongGiang.H@gmail.com','cmdcmd',0,1,-1,-1),(60,'60','Lan Vy Vũ','01-03-2000','ChThnh.Phan@gmail.com','024 0866 1214','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ChThnh.Phan@gmail.com','cmdcmd',0,1,-1,-1),(61,'61','Cẩm Thúy Phan','01-03-2000','ThanhTuyt.Vng@hotmail.com','0285 5317 5830','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThanhTuyt.Vng@hotmail.com','cmdcmd',0,1,-1,-1),(62,'62','Mrs. Xuân Loan Vương','01-03-2000','TrngSinh_L49@gmail.com','025 9684 7733','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','TrngSinh_L49@gmail.com','cmdcmd',0,1,-1,-1),(63,'63','Bạch Yến Lâm','01-03-2000','KhuTrung_Phm@hotmail.com','025 8104 5074','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','KhuTrung_Phm@hotmail.com','cmdcmd',0,1,-1,-1),(64,'64','Hồng Thư Phạm','01-03-2000','ThiDng_H@hotmail.com','0230 2764 7371','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThiDng_H@hotmail.com','cmdcmd',0,1,-1,-1),(65,'65','Công Giang Phùng','01-03-2000','Anho31@gmail.com','026 7227 5725','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Anho31@gmail.com','cmdcmd',0,1,-1,-1),(66,'66','Kim Thu Tô','01-03-2000','Bnh.Bi69@gmail.com','0204 1159 6475','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Bnh.Bi69@gmail.com','cmdcmd',0,1,-1,-1),(67,'67','Xuân Vũ Vương','01-03-2000','ThinThanh16@yahoo.com','0235 1191 3308','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThinThanh16@yahoo.com','cmdcmd',0,1,-1,-1),(68,'68','Việt Khôi Ngô','01-03-2000','CngNgh.ng36@hotmail.com','024 6593 9969','28-03-2022','28-03-2022',1,0,'https://i.imgur.com/bFbOCtQ.jpg','CngNgh.ng36@hotmail.com','cmdcmd',0,1,-1,-1),(69,'69','Kim Hoàng Hồ','01-03-2000','BchDuyn_Ng41@hotmail.com','0235 0962 8878','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','BchDuyn_Ng41@hotmail.com','cmdcmd',0,1,-1,-1),(70,'70','Mai Vy Phạm','01-03-2000','KhiH.Dng59@hotmail.com','024 8400 8120','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KhiH.Dng59@hotmail.com','cmdcmd',0,1,-1,-1),(71,'71','Gia Huấn Hoàng','01-03-2000','XunTho.o0@gmail.com','0216 6095 7658','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','XunTho.o0@gmail.com','cmdcmd',0,1,-1,-1),(72,'72','Mỹ Dung Tô','01-03-2000','NguytH58@yahoo.com','0265 6242 7634','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','NguytH58@yahoo.com','cmdcmd',0,1,-1,-1),(73,'73','Ngọc Lâm Đào','01-03-2000','HipHa.H@hotmail.com','027 0435 7587','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HipHa.H@hotmail.com','cmdcmd',0,1,-1,-1),(74,'74','Hồng Đăng Đào','01-03-2000','ThanhUyn61@yahoo.com','0287 2248 1031','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThanhUyn61@yahoo.com','cmdcmd',0,1,-1,-1),(75,'75','Viễn Thông Bùi','01-03-2000','cSiu.Hong@yahoo.com','022 2068 2796','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','cSiu.Hong@yahoo.com','cmdcmd',0,1,-1,-1),(76,'76','Uyên Minh Dương','01-03-2000','TunDng12@gmail.com','029 7980 6994','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TunDng12@gmail.com','cmdcmd',0,1,-1,-1),(77,'77','Tú Uyên Phạm','01-03-2000','NgcT.Mai@gmail.com','0229 7909 6001','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','NgcT.Mai@gmail.com','cmdcmd',0,1,-1,-1),(78,'78','Tuấn Khanh Mai','01-03-2000','LanTrc89@hotmail.com','0277 8413 0917','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','LanTrc89@hotmail.com','cmdcmd',0,1,-1,-1),(79,'79','Phượng Tiên Bùi','01-03-2000','TunVit_@yahoo.com','020 5928 2380','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TunVit_@yahoo.com','cmdcmd',0,1,-1,-1),(80,'80','Nghi Dung Trịnh','01-03-2000','ChDng.Lm@yahoo.com','0229 8130 7189','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ChDng.Lm@yahoo.com','cmdcmd',0,1,-1,-1),(81,'81','Thy Vân Dương','01-03-2000','QucThng_L@yahoo.com','0295 2213 2383','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','QucThng_L@yahoo.com','cmdcmd',0,1,-1,-1),(82,'82','Bích Hợp Phan','01-03-2000','ThinTin.o@yahoo.com','0294 3870 9672','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThinTin.o@yahoo.com','cmdcmd',0,1,-1,-1),(83,'83','Quốc Hòa Đào','01-03-2000','DimPhc_L@hotmail.com','0246 5833 8953','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','DimPhc_L@hotmail.com','cmdcmd',0,1,-1,-1),(84,'84','Tường Lân Đỗ','01-03-2000','AnhTh_V84@hotmail.com','0287 3004 3561','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','AnhTh_V84@hotmail.com','cmdcmd',0,1,-1,-1),(85,'85','Lâm Tuyền Đặng','01-03-2000','TunLinh_Trn3@yahoo.com','0237 0462 2404','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TunLinh_Trn3@yahoo.com','cmdcmd',0,1,-1,-1),(86,'86','Thanh Vy Tăng','01-03-2000','ThyGiang79@gmail.com','021 9707 3489','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThyGiang79@gmail.com','cmdcmd',0,1,-1,-1),(87,'87','Hiệp Dinh Tô','01-03-2000','ThyNgc63@yahoo.com','029 8274 0835','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThyNgc63@yahoo.com','cmdcmd',0,1,-1,-1),(88,'88','Hoàn Châu Tăng','01-03-2000','HuKhi.V29@gmail.com','0225 7332 3621','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HuKhi.V29@gmail.com','cmdcmd',0,1,-1,-1),(89,'89','Như Ý Hồ','01-03-2000','NgcHnh48@yahoo.com','022 1755 2052','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','NgcHnh48@yahoo.com','cmdcmd',0,1,-1,-1),(90,'90','Huy Lĩnh Vũ DDS','01-03-2000','cTu34@yahoo.com','0269 7288 4811','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','cTu34@yahoo.com','cmdcmd',0,1,-1,-1),(91,'91','Mrs. Duy Hạnh Phan','01-03-2000','HuynAnh.Phm50@yahoo.com','027 4688 3421','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HuynAnh.Phm50@yahoo.com','cmdcmd',0,1,-1,-1),(92,'92','Trúc Phương Lâm','01-03-2000','TSng86@hotmail.com','020 4040 6390','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TSng86@hotmail.com','cmdcmd',0,1,-1,-1),(93,'93','Mrs. Hương Lan Đào','01-03-2000','XunHnh_inh@gmail.com','0212 0465 7976','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','XunHnh_inh@gmail.com','cmdcmd',0,1,-1,-1),(94,'94','Diệu Hiền Lâm','01-03-2000','ThinLam_Trnh@hotmail.com','023 0409 4839','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThinLam_Trnh@hotmail.com','cmdcmd',0,1,-1,-1),(95,'95','Phương Loan Trần','01-03-2000','GiaPhong32@gmail.com','0212 9601 9964','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','GiaPhong32@gmail.com','cmdcmd',0,1,-1,-1),(96,'96','Cường Dũng Tô','01-03-2000','VitKhu20@yahoo.com','0226 6701 9725','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','VitKhu20@yahoo.com','cmdcmd',0,1,-1,-1),(97,'97','Chiêu Dương Ngô','01-03-2000','HngLy_@hotmail.com','028 2471 6127','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HngLy_@hotmail.com','cmdcmd',0,1,-1,-1),(98,'98','Trí Hào Vương','01-03-2000','ThinLng.V8@yahoo.com','020 3229 3891','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThinLng.V8@yahoo.com','cmdcmd',0,1,-1,-1),(99,'99','Ngọc Hạnh Tô','01-03-2000','ThanhHng.Trng@yahoo.com','0259 2042 0175','28-03-2022','28-03-2022',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThanhHng.Trng@yahoo.com','cmdcmd',0,1,-1,-1),(100,'DTDC2Aa2','Nguyễn Văn Trần C','01-12-2020','ThiHng.Lm77@hotmail.com','0269 0386 9201','01-01-2022','16-04-2022 18:39:08',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThiHng.Lm77@hotmail.com','cmdcmd',1,1,1,2),(104,'SV123Edit','Ðức Chính Định Bình','01-01-2013','ThiHng.Lm77@hotmail.com','0269 0386 9201','23-04-2022','24-04-2022 14:02:11',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThiHng.Lm77@hotmail.com','cmdcmd',1,1,0,0),(105,'2021001','NGUYỄN THỊ KIM TUYẾN','16-11-1999','kimtuyen1611199@gmail.com','0395023743','26-04-2022 20:30:47','26-04-2022 20:30:47',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen1611199@gmail.com','cmdcmdcmd',1,1,3,3),(107,'2022001','NGUYỄN THỊ KIM NGA','16-11-1997','kimtuyen16111991@gmail.com','0395023743','26-04-2022 20:37:06','26-04-2022 20:37:06',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen16111991@gmail.com','cmdcmdcmd',1,1,3,3),(108,'2022003','NGUYỄN THỊ KIM NGHI','16/11/1999','kimtuyen16111993@gmail.com','0395023743','26-04-2022 20:37:08','26-04-2022 20:37:08',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen16111993@gmail.com','cmdcmdcmd',1,1,3,3),(109,'2022005','NGUYỄN THỊ KIM DUNG','16/11/1991','kimtuyen16111995@gmail.com','0395023743','26-04-2022 20:37:09','26-04-2022 20:37:09',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen16111995@gmail.com','cmdcmdcmd',1,1,3,3),(110,'2022002','NGUYỄN THỊ KIM NGHE','16/11/1998','kimtuyen16111992@gmail.com','0395023743','26-04-2022 20:37:07','26-04-2022 20:37:07',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen16111992@gmail.com','cmdcmdcmd',1,1,3,3),(111,'2022004','NGUYỄN THỊ KIM TA','16/11/2000','kimtuyen16111994@gmail.com','0395023743','26-04-2022 20:37:08','26-04-2022 20:37:08',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen16111994@gmail.com','cmdcmdcmd',1,1,3,3),(112,'2023198','Nguyễn Thị Băng Châu','15/10/2002','Nguyenthibangchauvn@gmail.com','0907733612','26-04-2022 20:48:24','26-04-2022 20:48:24',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthibangchauvn@gmail.com','cmdcmdcmd',1,1,3,3),(113,'2023049','Lê Văn Ni','16/10/2002','Levannidc@gmail.com','0353504815','26-04-2022 20:47:00','26-04-2022 20:47:00',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Levannidc@gmail.com','cmdcmdcmd',1,1,3,3),(114,'2023033','Trần Thị Ái Liên','20/08/1999','ailien200899@gmail.com','0976439508','26-04-2022 20:46:52','26-04-2022 20:46:52',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ailien200899@gmail.com','cmdcmdcmd',1,1,3,3),(115,'2023161','Lê Hoàng Hương','17/07/2001','Lehoanghuong17@gmail.com','0768153899','26-04-2022 20:48:00','26-04-2022 20:48:00',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Lehoanghuong17@gmail.com','cmdcmdcmd',1,1,3,3),(116,'2023052','Trịnh Thị Thanh Vỷ ','08/06/2002','trinhvy273@gmail.com ','0336601621','26-04-2022 20:47:01','26-04-2022 20:47:01',1,1,'https://i.imgur.com/bFbOCtQ.jpg','trinhvy273@gmail.com ','cmdcmdcmd',1,1,3,3),(117,'2023132','Nguyễn Thị Mỹ Lệ ','05/06/2002','nguyenmyleoh@gmail.com ','0389330803','26-04-2022 20:47:43','26-04-2022 20:47:43',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenmyleoh@gmail.com ','cmdcmdcmd',1,1,3,3),(118,'2023153','Lê Thu Hương','21/01/1999','17123035@st.hcmuaf.edu.vn','0854283608','26-04-2022 20:47:56','26-04-2022 20:47:56',1,0,'https://i.imgur.com/bFbOCtQ.jpg','17123035@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(119,'2023167','Phan Phú Sơn ','21/05/2000','Phanphuson9120142015@gmail.com ','0869239750','26-04-2022 20:48:04','26-04-2022 20:48:04',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Phanphuson9120142015@gmail.com ','cmdcmdcmd',1,1,3,3),(120,'2023096','Nguyễn Thị Vân','08/04/2000','Nguyenvan842000@gmail.com','0973168954','26-04-2022 20:47:24','26-04-2022 20:47:24',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenvan842000@gmail.com','cmdcmdcmd',1,1,3,3),(121,'2023026','Lê Minh Hiếu','25/12/1999','17125089@st.hcmuaf.edu.vn','0344220591','26-04-2022 20:46:49','26-04-2022 20:46:49',1,1,'https://i.imgur.com/bFbOCtQ.jpg','17125089@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(122,'2023236','Trần Thị Yến Ly','2022-05-04','yenlytran19052001@gmail.com','0704873395','26-04-2022 20:48:50','03-05-2022 17:46:49',1,0,'https://i.imgur.com/bFbOCtQ.jpg','yenlytran19052001@gmail.com','cmdcmd',1,1,3,1),(123,'2023142','Trần Thị Hương Thảo','04/07/2000','thaotth18411@st.uel.edu.vn','0343534240','26-04-2022 20:47:49','26-04-2022 20:47:49',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thaotth18411@st.uel.edu.vn','cmdcmdcmd',1,1,3,3),(124,'2023095','Nguyễn Như Anh Thư','23/05/1999','anhthuuht@gmail.com','0778982356','26-04-2022 20:47:23','26-04-2022 20:47:23',1,1,'https://i.imgur.com/bFbOCtQ.jpg','anhthuuht@gmail.com','cmdcmdcmd',1,1,3,3),(125,'2023032','Nguyễ Thị Thùy Trinh','06/06/1999','nthuytrinh1@gmail.com','0393112248','26-04-2022 20:46:52','26-04-2022 20:46:52',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nthuytrinh1@gmail.com','cmdcmdcmd',1,1,3,3),(126,'2023077','Nguyễn Cẩm Như','13/07/2002','nhucam137@gmail.com','0706992532','26-04-2022 20:47:14','26-04-2022 20:47:14',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nhucam137@gmail.com','cmdcmdcmd',1,1,3,3),(127,'2023238','Nguyễn Hoài Bảo','30/04/1999','nguyenbaohg18@gmail.com','0971048424','26-04-2022 20:48:52','26-04-2022 20:48:52',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenbaohg18@gmail.com','cmdcmdcmd',1,1,3,3),(128,'2023002','Hồ Hữu Bình','19/03/2001','binhhuuho19@gmail.com','0395705312','26-04-2022 20:46:37','26-04-2022 20:46:37',1,1,'https://i.imgur.com/bFbOCtQ.jpg','binhhuuho19@gmail.com','cmdcmdcmd',1,1,3,3),(129,'2023058','Nguyễn Hữu Thiết','01/01/2002','nguyenhuuthiet01012002@gmail.com','0333751154','26-04-2022 20:47:04','26-04-2022 20:47:04',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenhuuthiet01012002@gmail.com','cmdcmdcmd',1,1,3,3),(130,'2023112','Nguyễn Thị Mi Mi','03/10/1998','Nguyenmimi0310@gmail.com','0837722728','26-04-2022 20:47:32','26-04-2022 20:47:32',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenmimi0310@gmail.com','cmdcmdcmd',1,1,3,3),(131,'2023143','Trần Thị My My ','06/06/2002','20126310@st.hcmuaf.edu.vn','0837592149','26-04-2022 20:47:50','26-04-2022 20:47:50',1,0,'https://i.imgur.com/bFbOCtQ.jpg','20126310@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(132,'2023134','Trần Thị Tuyết Mai','29/12/2001','maitran.mt148c@gmail.com','0356642146','26-04-2022 20:47:44','26-04-2022 20:47:44',1,0,'https://i.imgur.com/bFbOCtQ.jpg','maitran.mt148c@gmail.com','cmdcmdcmd',1,1,3,3),(133,'2023195','Trương Hải Đăng','07/09/1999','hdang7979@gmail.com','0332362546','26-04-2022 20:48:22','26-04-2022 20:48:22',1,0,'https://i.imgur.com/bFbOCtQ.jpg','hdang7979@gmail.com','cmdcmdcmd',1,1,3,3),(134,'2023210','Huỳnh Thị Kim Tuyền ','26/03/1999','tuyenhuynh260399@gmail.com','0396186430','26-04-2022 20:48:32','26-04-2022 20:48:32',1,0,'https://i.imgur.com/bFbOCtQ.jpg','tuyenhuynh260399@gmail.com','cmdcmdcmd',1,1,3,3),(135,'2023184','Nguyễn Thị Huệ','11/03/1998','nguyenhue9803@gmail.com','0981670578','26-04-2022 20:48:15','26-04-2022 20:48:15',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenhue9803@gmail.com','cmdcmdcmd',1,1,3,3),(136,'2023226','Huỳnh Thị Hài','05/08/2002','haihth2002@gmail.com','0339608880','26-04-2022 20:48:43','26-04-2022 20:48:43',1,0,'https://i.imgur.com/bFbOCtQ.jpg','haihth2002@gmail.com','cmdcmdcmd',1,1,3,3),(137,'2023166','Phạm Thị Huyền','28/02/1999','Phamhuyen010199@gmail.com','0365950784','26-04-2022 20:48:03','26-04-2022 20:48:03',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Phamhuyen010199@gmail.com','cmdcmdcmd',1,1,3,3),(138,'2023168','Nguyễn Thị Kim Diệu ','14/07/2000','kimdieu1407@gmail.com','0329375033','26-04-2022 20:48:04','26-04-2022 20:48:04',1,0,'https://i.imgur.com/bFbOCtQ.jpg','kimdieu1407@gmail.com','cmdcmdcmd',1,1,3,3),(139,'2023165','Võ Thị Thu Hạnh','14/02/2001','hanhvo.140201@gmail.com','0376981064','26-04-2022 20:48:03','26-04-2022 20:48:03',1,0,'https://i.imgur.com/bFbOCtQ.jpg','hanhvo.140201@gmail.com','cmdcmdcmd',1,1,3,3),(140,'2023059','Lê Trần Mỹ Hoa','09/08/2001','hoa.le090801@hcmut.edu.vn','0372351642','26-04-2022 20:47:05','26-04-2022 20:47:05',1,1,'https://i.imgur.com/bFbOCtQ.jpg','hoa.le090801@hcmut.edu.vn','cmdcmdcmd',1,1,3,3),(141,'2023066','Nguyễn Thị Hoài Thương','15/06/1999','hoaithuong99tv@gmail.com','0366059614','26-04-2022 20:47:08','26-04-2022 20:47:08',1,1,'https://i.imgur.com/bFbOCtQ.jpg','hoaithuong99tv@gmail.com','cmdcmdcmd',1,1,3,3),(142,'2023179','Nguyễn Thanh Hoà','18/10/2002','20116200@st.hcmuaf.edu.vn','0812350403','26-04-2022 20:48:11','26-04-2022 20:48:11',1,0,'https://i.imgur.com/bFbOCtQ.jpg','20116200@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(143,'2023212','HUỳnh Thị Thanh Tuyền','24/02/1998','huynhthanhtuyen822@gmail.com','0815397890','26-04-2022 20:48:33','26-04-2022 20:48:33',1,0,'https://i.imgur.com/bFbOCtQ.jpg','huynhthanhtuyen822@gmail.com','cmdcmdcmd',1,1,3,3),(144,'2023126','Lê Xuân Tiến','31/07/2002','lexuantien07@gmail.com','0964712704','26-04-2022 20:47:40','26-04-2022 20:47:40',1,1,'https://i.imgur.com/bFbOCtQ.jpg','lexuantien07@gmail.com','cmdcmdcmd',1,1,3,3),(145,'2023141','Nguyễn Kim Giang','01/06/2001','giangkimnguyen16@gmail.com','0768975267','26-04-2022 20:47:48','26-04-2022 20:47:48',1,0,'https://i.imgur.com/bFbOCtQ.jpg','giangkimnguyen16@gmail.com','cmdcmdcmd',1,1,3,3),(146,'2023155','Lê Bảo Hi','29/08/2001','19125094@st.hcmuaf.edu.vn','0359307736','26-04-2022 20:47:57','26-04-2022 20:47:57',1,0,'https://i.imgur.com/bFbOCtQ.jpg','19125094@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(147,'2023043','Đàng Như Nghĩa','24/01/2000','1854070092nghia@ou.edu.vn','0901260834','26-04-2022 20:46:57','26-04-2022 20:46:57',1,1,'https://i.imgur.com/bFbOCtQ.jpg','1854070092nghia@ou.edu.vn','cmdcmdcmd',1,1,3,3),(148,'2023181','Bùi Văn Hưng','26/11/2002','buihungqb11@gmail.com','0339944401','26-04-2022 20:48:13','26-04-2022 20:48:13',1,0,'https://i.imgur.com/bFbOCtQ.jpg','buihungqb11@gmail.com','cmdcmdcmd',1,1,3,3),(149,'2023233','Phan Kim Khánh','26/07/2002','2056180141@hcmussh.edu.vn','0365329100','26-04-2022 20:48:48','26-04-2022 20:48:48',1,0,'https://i.imgur.com/bFbOCtQ.jpg','2056180141@hcmussh.edu.vn','cmdcmdcmd',1,1,3,3),(150,'2023189','Trần Nguyễn Quỳnh Như ','15/08/2001','quynhnhu1508pcy@gmail.com','0373273170','26-04-2022 20:48:18','26-04-2022 20:48:18',1,0,'https://i.imgur.com/bFbOCtQ.jpg','quynhnhu1508pcy@gmail.com','cmdcmdcmd',1,1,3,3),(151,'2023042','Lê Thành Hậu','20/08/2000','haule0128@gmail.com','0965320373','26-04-2022 20:46:57','26-04-2022 20:46:57',1,1,'https://i.imgur.com/bFbOCtQ.jpg','haule0128@gmail.com','cmdcmdcmd',1,1,3,3),(152,'2023139','Nguyễn Hoài Bảo','30/04/1999','nguyenbaohg18@mail.com','0971048424','26-04-2022 20:47:47','26-04-2022 20:47:47',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenbaohg18@mail.com','cmdcmdcmd',1,1,3,3),(153,'2023012','Lê Hoàng Long','19/06/1999','17117037@st.hcmuaf.edu.vn','0768757403','26-04-2022 20:46:42','26-04-2022 20:46:42',1,1,'https://i.imgur.com/bFbOCtQ.jpg','17117037@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(154,'2023097','Trần Ngọc Quyên','03/08/2001','quyenngoc560@gmail.com','0399550204','26-04-2022 20:47:24','26-04-2022 20:47:24',1,1,'https://i.imgur.com/bFbOCtQ.jpg','quyenngoc560@gmail.com','cmdcmdcmd',1,1,3,3),(155,'2023084','Trần Kiến Nam','15/01/1998','nt43425@gmail.com ','0353029739','26-04-2022 20:47:18','26-04-2022 20:47:18',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nt43425@gmail.com ','cmdcmdcmd',1,1,3,3),(156,'2023216','Trần Thị Thùy Trang','06/10/1999','4t061099@gmail.com','0868189484','26-04-2022 20:48:36','26-04-2022 20:48:36',1,0,'https://i.imgur.com/bFbOCtQ.jpg','4t061099@gmail.com','cmdcmdcmd',1,1,3,3),(157,'2023063','Trần Thị Mỹ Duyên','21/08/1999','Myduyenn218@gmail.com','0979006985','26-04-2022 20:47:07','26-04-2022 20:47:07',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Myduyenn218@gmail.com','cmdcmdcmd',1,1,3,3),(158,'2023186','Lục Thị Tám ','14/08/2001','Luctam2001@gmail.com','0377561594','26-04-2022 20:48:16','26-04-2022 20:48:16',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Luctam2001@gmail.com','cmdcmdcmd',1,1,3,3),(159,'2023102','Lê Thị Lan Mai ','08/04/2000','18155053@st.hcmuaf.edu.vn ','336116547','26-04-2022 20:47:27','26-04-2022 20:47:27',1,1,'https://i.imgur.com/bFbOCtQ.jpg','18155053@st.hcmuaf.edu.vn ','cmdcmdcmd',1,1,3,3),(160,'2023218','Lê Hoàng Mộng Tuyền','15/01/2000','lehoangmongtuyen@gmail.com','0797709545','26-04-2022 20:48:37','26-04-2022 20:48:37',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lehoangmongtuyen@gmail.com','cmdcmdcmd',1,1,3,3),(161,'2023069','PHAN THỊ DIỄM ','29/11/2002','diempt2911@gmail.com ','0373708421','26-04-2022 20:47:10','26-04-2022 20:47:10',1,1,'https://i.imgur.com/bFbOCtQ.jpg','diempt2911@gmail.com ','cmdcmdcmd',1,1,3,3),(162,'2023117','Nguyễn Tấn Tài ','25/08/2002','nguyentantai25082002@gmail.com ','0388472307','26-04-2022 20:47:35','26-04-2022 20:47:35',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyentantai25082002@gmail.com ','cmdcmdcmd',1,1,3,3),(163,'2023208','Lê Thị Minh Thư ','26/07/2001','lethiminhthu26072001@gmail.com ','0842047761','26-04-2022 20:48:30','26-04-2022 20:48:30',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lethiminhthu26072001@gmail.com ','cmdcmdcmd',1,1,3,3),(164,'2023079','Huỳnh Thanh Hiếu','19/03/2000','18137017@st.hcmuaf.edu.vn','0564108602','26-04-2022 20:47:15','26-04-2022 20:47:15',1,1,'https://i.imgur.com/bFbOCtQ.jpg','18137017@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(165,'2023194','Võ Thị Kiều My','03/12/2002','vomy8878@gmail.com','0796669590','26-04-2022 20:48:21','26-04-2022 20:48:21',1,0,'https://i.imgur.com/bFbOCtQ.jpg','vomy8878@gmail.com','cmdcmdcmd',1,1,3,3),(166,'2023188','Nguyễn Thị Kim Ngân','13/08/2000','Nganntk1308@gmail.com','0345183700','26-04-2022 20:48:17','26-04-2022 20:48:17',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Nganntk1308@gmail.com','cmdcmdcmd',1,1,3,3),(167,'2023113','Hồ Huỳnh Tuyết Linh','22/04/2002','Hohuynhtuyetlinh@gmail.com','0924678958','26-04-2022 20:47:33','26-04-2022 20:47:33',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hohuynhtuyetlinh@gmail.com','cmdcmdcmd',1,1,3,3),(168,'2023053','Nguyễn Thị Lan','31/03/1999','ntlanulaw99@gmail.com','0868264085','26-04-2022 20:47:02','26-04-2022 20:47:02',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ntlanulaw99@gmail.com','cmdcmdcmd',1,1,3,3),(169,'2023192','Lê Thị Lan Mai ','08/04/2000','18155053@st.hcmuaf.edu.vn ','336116547','26-04-2022 20:48:20','26-04-2022 20:48:20',1,0,'https://i.imgur.com/bFbOCtQ.jpg','18155053@st.hcmuaf.edu.vn ','cmdcmdcmd',1,1,3,3),(170,'2023025','Lê Thị Mỹ Hân','22/09/2000','han.le229@hcmut.edu.vn','0973802014','26-04-2022 20:46:49','26-04-2022 20:46:49',1,1,'https://i.imgur.com/bFbOCtQ.jpg','han.le229@hcmut.edu.vn','cmdcmdcmd',1,1,3,3),(171,'2023071','NGUYỄN THỊ THẠCH ','04/11/2002','Nguyenthithach943@gmail.com ','0925498990','26-04-2022 20:47:11','26-04-2022 20:47:11',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthithach943@gmail.com ','cmdcmdcmd',1,1,3,3),(172,'2023047','Nguyễn Thị Khánh Linh','05/11/1999','ntklinh511@gmail.com','0974602449','26-04-2022 20:46:59','26-04-2022 20:46:59',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ntklinh511@gmail.com','cmdcmdcmd',1,1,3,3),(173,'2023158','Nguyễn Trường An','11/05/2000','ntruongant1@gmail.com','0708860118','26-04-2022 20:47:59','26-04-2022 20:47:59',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ntruongant1@gmail.com','cmdcmdcmd',1,1,3,3),(174,'2023023','Huỳnh Thị Hài','05/08/2002','haihth2002@gmail.com','0339608880','26-04-2022 20:46:48','26-04-2022 20:46:48',1,1,'https://i.imgur.com/bFbOCtQ.jpg','haihth2002@gmail.com','cmdcmdcmd',1,1,3,3),(175,'2023093','Đinh Văn Cơ','15/04/2001','dinhco1835@gmail.com','0795934432','26-04-2022 20:47:22','26-04-2022 20:47:22',1,1,'https://i.imgur.com/bFbOCtQ.jpg','dinhco1835@gmail.com','cmdcmdcmd',1,1,3,3),(176,'2023124','Tạ Như Huỳnh','13/07/2002','20128032@st.hcmuaf.edu.vn','0925811442','26-04-2022 20:47:38','26-04-2022 20:47:38',1,1,'https://i.imgur.com/bFbOCtQ.jpg','20128032@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(177,'2023240','Trần Lê Hữu Nhân','08/12/2003','nhan6431@gmail.com','0912990949','26-04-2022 20:48:53','26-04-2022 20:48:53',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nhan6431@gmail.com','cmdcmdcmd',1,1,3,3),(178,'2023241','Đặng Thị Phương Thanh','09/02/2003','21126495@st.hcmuaf.edu.vn','0783205929','26-04-2022 20:48:54','26-04-2022 20:48:54',1,0,'https://i.imgur.com/bFbOCtQ.jpg','21126495@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(179,'2023204','Huỳnh Thanh Huyên','09/09/2001','Hth090901@gmail.com','0342929016','26-04-2022 20:48:28','26-04-2022 20:48:28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Hth090901@gmail.com','cmdcmdcmd',1,1,3,3),(180,'2023006','Bùi Nguyễn Huỳnh Như','24/04/1999','nhubui244@gmail.com','0368820207','26-04-2022 20:46:39','26-04-2022 20:46:39',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nhubui244@gmail.com','cmdcmdcmd',1,1,3,3),(181,'2023075','Phạm Quang Minh','13/12/1999','minhphamkg68@gmail.com','0919476132','26-04-2022 20:47:13','26-04-2022 20:47:13',1,1,'https://i.imgur.com/bFbOCtQ.jpg','minhphamkg68@gmail.com','cmdcmdcmd',1,1,3,3),(182,'2023154','Trần Văn Thế','31/05/2002','tranvu.ld.2002@gmail.com','0345820109','26-04-2022 20:47:56','26-04-2022 20:47:56',1,0,'https://i.imgur.com/bFbOCtQ.jpg','tranvu.ld.2002@gmail.com','cmdcmdcmd',1,1,3,3),(183,'2023091','Cổ Trọng Toàn','18/05/2001','trongtoan299@gmail.com','0378093229','26-04-2022 20:47:21','26-04-2022 20:47:21',1,1,'https://i.imgur.com/bFbOCtQ.jpg','trongtoan299@gmail.com','cmdcmdcmd',1,1,3,3),(184,'2023156','Lâm Đức Anh','21/01/1999','lamducanhndgv@gmail.com','0971746351','26-04-2022 20:47:57','26-04-2022 20:47:57',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lamducanhndgv@gmail.com','cmdcmdcmd',1,1,3,3),(185,'2023213','Tô Thị Nhật Nguyệt','20/03/1996','nhatnguyetkk@gmail.com','0968915373','26-04-2022 20:48:34','26-04-2022 20:48:34',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nhatnguyetkk@gmail.com','cmdcmdcmd',1,1,3,3),(186,'2023173','Nguyễn Thị Mỹ Hạ ','05/04/2001','nguyenthimyhact2001@gmail.com ','0915878573','26-04-2022 20:48:08','26-04-2022 20:48:08',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthimyhact2001@gmail.com ','cmdcmdcmd',1,1,3,3),(187,'2023020','Nguyễn Cao Huyên','19/04/2000','Nguyencaohuyen190400@gmail.com','0346834682','26-04-2022 20:46:46','26-04-2022 20:46:46',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Nguyencaohuyen190400@gmail.com','cmdcmdcmd',1,1,3,3),(188,'2023057','Dương Thị Mỹ Hạnh','06/10/1998','duongthimyhanhbuh@gmail.com','0328446818','26-04-2022 20:47:04','26-04-2022 20:47:04',1,1,'https://i.imgur.com/bFbOCtQ.jpg','duongthimyhanhbuh@gmail.com','cmdcmdcmd',1,1,3,3),(189,'2023100','Lê Viết Trọng','05/03/2002','viettrong12tn@gmail.com ','0589185764','26-04-2022 20:47:26','26-04-2022 20:47:26',1,1,'https://i.imgur.com/bFbOCtQ.jpg','viettrong12tn@gmail.com ','cmdcmdcmd',1,1,3,3),(190,'2023130','Danh Thị Bích Ngọc','09/04/2001','ngocdtb19415@st.uel.edu.vn','0385815056','26-04-2022 20:47:42','26-04-2022 20:47:42',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ngocdtb19415@st.uel.edu.vn','cmdcmdcmd',1,1,3,3),(191,'2023223','Trần Thị Thuỳ Trang ','04/09/2002','thuytrang100412@gmail.com','0382642847','26-04-2022 20:48:41','26-04-2022 20:48:41',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thuytrang100412@gmail.com','cmdcmdcmd',1,1,3,3),(192,'2023008','Nguyễn Ngọc Thông','03/03/2002','ngocthong2k2@gmail.com','0911182742','26-04-2022 20:46:40','26-04-2022 20:46:40',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ngocthong2k2@gmail.com','cmdcmdcmd',1,1,3,3),(193,'2023016','Nguyễn Thị Mỹ Hạ ','05/04/2001','nguyenthimyhact2001@gmail.com ','0915878573','26-04-2022 20:46:45','26-04-2022 20:46:45',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthimyhact2001@gmail.com ','cmdcmdcmd',1,1,3,3),(194,'2023127','Nguyễn Tấn Nguyên','17/05/2000','tannguyen1750@gmail.com','0363037467','26-04-2022 20:47:40','26-04-2022 20:47:40',1,1,'https://i.imgur.com/bFbOCtQ.jpg','tannguyen1750@gmail.com','cmdcmdcmd',1,1,3,3),(195,'2023104','Lê Quang Đông','18/10/2002','20521190@gm.uit.edu.vn','0857203105','26-04-2022 20:47:28','26-04-2022 20:47:28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','20521190@gm.uit.edu.vn','cmdcmdcmd',1,1,3,3),(196,'2023115','Nguyễn Thị Trang','06/11/1999','Trangbinhloc@gmail.com','0347587878','26-04-2022 20:47:34','26-04-2022 20:47:34',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Trangbinhloc@gmail.com','cmdcmdcmd',1,1,3,3),(197,'2023073','Phạm Ngọc Nhất','20/10/2002','phamnhat.20102002@gmail.com','0377108229','26-04-2022 20:47:12','26-04-2022 20:47:12',1,1,'https://i.imgur.com/bFbOCtQ.jpg','phamnhat.20102002@gmail.com','cmdcmdcmd',1,1,3,3),(198,'2023175','Phan Thị Thu An ','10/05/2002','phanthithuan105@gmail.com','0387740047','26-04-2022 20:48:09','26-04-2022 20:48:09',1,0,'https://i.imgur.com/bFbOCtQ.jpg','phanthithuan105@gmail.com','cmdcmdcmd',1,1,3,3),(199,'2023029','Lê Văn Huy Hoàng','12/11/2002','huyhoanglvqb121102@gmail.com','0817464867','26-04-2022 20:46:50','26-04-2022 20:46:50',1,1,'https://i.imgur.com/bFbOCtQ.jpg','huyhoanglvqb121102@gmail.com','cmdcmdcmd',1,1,3,3),(200,'2023028','Mã Phượng Thi','14/06/1999','phuongthima@gmail.com','0356377614','26-04-2022 20:46:50','26-04-2022 20:46:50',1,1,'https://i.imgur.com/bFbOCtQ.jpg','phuongthima@gmail.com','cmdcmdcmd',1,1,3,3),(201,'2023074','Nguyễn Thị Như Tuyền','24/07/2001','19128205@st.hcmuaf.edu.vn','0824859459','26-04-2022 20:47:12','26-04-2022 20:47:12',1,1,'https://i.imgur.com/bFbOCtQ.jpg','19128205@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(202,'2023183','Nguyễn Minh Quân','06/05/2002','Quandateh2002@gmail.com','0399637903','26-04-2022 20:48:14','26-04-2022 20:48:14',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Quandateh2002@gmail.com','cmdcmdcmd',1,1,3,3),(203,'2023146','Đặng Thị Phương','14/01/2000','dangphuong140199@gmail.com','0357951291','26-04-2022 20:47:52','26-04-2022 20:47:52',1,0,'https://i.imgur.com/bFbOCtQ.jpg','dangphuong140199@gmail.com','cmdcmdcmd',1,1,3,3),(204,'2023230','Trương Thị Nhi','14/04/2000','thinhi3942@gmail.com','0942063365','26-04-2022 20:48:46','26-04-2022 20:48:46',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thinhi3942@gmail.com','cmdcmdcmd',1,1,3,3),(205,'2023138','Nguyễn Trung Hiếu','25/05/1999','hieutanmy321@gmail.com','0965924083','26-04-2022 20:47:46','26-04-2022 20:47:46',1,0,'https://i.imgur.com/bFbOCtQ.jpg','hieutanmy321@gmail.com','cmdcmdcmd',1,1,3,3),(206,'2023107','Phan Văn Thịnh','03/02/2002','20111295@st.hcmuaf.edu.vn','0397239569','26-04-2022 20:47:30','26-04-2022 20:47:30',1,1,'https://i.imgur.com/bFbOCtQ.jpg','20111295@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(207,'2023201','Phạm Thị Huyền','28/02/1999','Phamhuyen010199@gmail.com','0365950784','26-04-2022 20:48:26','26-04-2022 20:48:26',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Phamhuyen010199@gmail.com','cmdcmdcmd',1,1,3,3),(208,'2023217','Lục Tám','14/08/2001','luctam2001@gmail.com','0377561594','26-04-2022 20:48:36','26-04-2022 20:48:36',1,0,'https://i.imgur.com/bFbOCtQ.jpg','luctam2001@gmail.com','cmdcmdcmd',1,1,3,3),(209,'2023056','Trần Đình Sâm.','25/08/2000','samtran22345@gmail.com','0967493457.','26-04-2022 20:47:03','26-04-2022 20:47:03',1,1,'https://i.imgur.com/bFbOCtQ.jpg','samtran22345@gmail.com','cmdcmdcmd',1,1,3,3),(210,'2023055','Trà Hoàng Kha','11/07/2002','20145119@st.hcmuaf.edu.vn','0374313709','26-04-2022 20:47:03','26-04-2022 20:47:03',1,1,'https://i.imgur.com/bFbOCtQ.jpg','20145119@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(211,'2023078','Nguyễn Thành Mỹ','28/09/1999','17126083@st.hcmuaf.edu.vn','0856487482','26-04-2022 20:47:14','26-04-2022 20:47:14',1,1,'https://i.imgur.com/bFbOCtQ.jpg','17126083@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(212,'2023148','Nguyễn Ngọc Đức','15/07/1999','ngocduc11112001@gmail.com','0797365068','26-04-2022 20:47:53','26-04-2022 20:47:53',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ngocduc11112001@gmail.com','cmdcmdcmd',1,1,3,3),(213,'2023136','Nguyễn Trần Sang ','09/02/2000','Ntsbanda@gmail.com ','0397884572','26-04-2022 20:47:45','26-04-2022 20:47:45',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Ntsbanda@gmail.com ','cmdcmdcmd',1,1,3,3),(214,'2023174','Đỗ Thị Đào','10/11/2001','19112024@st.hcmuaf.edu.vn','0968757930','26-04-2022 20:48:08','26-04-2022 20:48:08',1,0,'https://i.imgur.com/bFbOCtQ.jpg','19112024@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(215,'2023001','NGUYỄN THỊ KIM TUYẾN','16/11/1999','kimtuyen1611199@gmail.com','0395023743','26-04-2022 20:46:36','26-04-2022 20:46:36',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen1611199@gmail.com','cmdcmdcmd',1,1,3,3),(216,'2023072','Trần Văn Tính','13/08/2001','tranvantinh6103@gmail.com','0923036103','26-04-2022 20:47:11','26-04-2022 20:47:11',1,1,'https://i.imgur.com/bFbOCtQ.jpg','tranvantinh6103@gmail.com','cmdcmdcmd',1,1,3,3),(217,'2023162','Lê Hoàng Hương ','17/07/2001','Lehoanghuong17@gmail.com','0768153899','26-04-2022 20:48:01','26-04-2022 20:48:01',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Lehoanghuong17@gmail.com','cmdcmdcmd',1,1,3,3),(218,'2023145','Nguyễn Văn Khánh','05/11/2002','Vankhanhdmx2019@gmail.com','0943675286','26-04-2022 20:47:51','26-04-2022 20:47:51',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Vankhanhdmx2019@gmail.com','cmdcmdcmd',1,1,3,3),(219,'2023234','Nông Thị Thuỷ','03/09/2000','nongthithuy5516@gmail.com','0355502710','26-04-2022 20:48:49','26-04-2022 20:48:49',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nongthithuy5516@gmail.com','cmdcmdcmd',1,1,3,3),(220,'2023211','Nguyễn Thi Lành','30/11/1999','lanhftu2017@gmail.com','0347172301','26-04-2022 20:48:32','26-04-2022 20:48:32',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lanhftu2017@gmail.com','cmdcmdcmd',1,1,3,3),(221,'2023120','NGUYỄN THỊ DIỄM THÚY','02/10/2001','Hoaithuong14102016@gmail.com','0358690738','26-04-2022 20:47:36','26-04-2022 20:47:36',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hoaithuong14102016@gmail.com','cmdcmdcmd',1,1,3,3),(222,'2023147','Vi Thị Thạnh','27/10/2000','thanhthivi27@gmail.com','0356300688','26-04-2022 20:47:52','26-04-2022 20:47:52',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thanhthivi27@gmail.com','cmdcmdcmd',1,1,3,3),(223,'2023045','Hồ Minh Tân','06/06/1999','17111126@st.hcmuaf.edu.vn','0936658749','26-04-2022 20:46:58','26-04-2022 20:46:58',1,1,'https://i.imgur.com/bFbOCtQ.jpg','17111126@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(224,'2023022','Bùi Thị Tuyết Mai','20/01/2002','20125510@st.hcmuaf.edu.vn','0925721201','26-04-2022 20:46:47','26-04-2022 20:46:47',1,1,'https://i.imgur.com/bFbOCtQ.jpg','20125510@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(225,'2023131','Ngô Thị Thiên Thảo','20/12/2000','thienthaouel@gmail.com','0974719931','26-04-2022 20:47:42','26-04-2022 20:47:42',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thienthaouel@gmail.com','cmdcmdcmd',1,1,3,3),(226,'2023205','Trần Minh Thư','30/04/2002','tranminhthu9aa@gmail.com','0375293199','26-04-2022 20:48:28','26-04-2022 20:48:28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','tranminhthu9aa@gmail.com','cmdcmdcmd',1,1,3,3),(227,'2023037','Võ Thị Bích Thuận','21/05/2002','030336200279@st.buh.edu.vn','0325557651','26-04-2022 20:46:54','26-04-2022 20:46:54',1,1,'https://i.imgur.com/bFbOCtQ.jpg','030336200279@st.buh.edu.vn','cmdcmdcmd',1,1,3,3),(228,'2023035','Lê Thị Mỹ Chi','26/11/1999','lethimychi1756010025@gmail.com','0327298958','26-04-2022 20:46:53','26-04-2022 20:46:53',1,1,'https://i.imgur.com/bFbOCtQ.jpg','lethimychi1756010025@gmail.com','cmdcmdcmd',1,1,3,3),(229,'2023044','Mai Công Tuấn Kiệt ','30/04/2002','maicongtuankiet@gmail.com ','0914343990','26-04-2022 20:46:57','26-04-2022 20:46:57',1,1,'https://i.imgur.com/bFbOCtQ.jpg','maicongtuankiet@gmail.com ','cmdcmdcmd',1,1,3,3),(230,'2023221','Bùi Nguyễn Hoàng Trâm','14/01/2001','trambuinguyen.01@gmail.com','0819140101','26-04-2022 20:48:39','26-04-2022 20:48:39',1,0,'https://i.imgur.com/bFbOCtQ.jpg','trambuinguyen.01@gmail.com','cmdcmdcmd',1,1,3,3),(231,'2023237','Nguyễn Lam Trường','12/04/2021','lamtruong.028716@gmail.com','0969028716','26-04-2022 20:48:51','26-04-2022 20:48:51',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lamtruong.028716@gmail.com','cmdcmdcmd',1,1,3,3),(232,'2023144','Nguyễn Thị Mộng Huyền','06/02/2002','20126263@st.hcmuaf.edu.vn','0961531457','26-04-2022 20:47:51','26-04-2022 20:47:51',1,0,'https://i.imgur.com/bFbOCtQ.jpg','20126263@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(233,'2023133','Lê Tuấn Anh','23/09/2002','20154080@st.hcmuaf.edu.vn','0382965624','26-04-2022 20:47:43','26-04-2022 20:47:43',1,0,'https://i.imgur.com/bFbOCtQ.jpg','20154080@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(234,'2023225','Nguyễn Trần Anh Thư','14/06/2002','thutran0523393526@gmail.com','0355946319','26-04-2022 20:48:42','26-04-2022 20:48:42',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thutran0523393526@gmail.com','cmdcmdcmd',1,1,3,3),(235,'2023046','Trương Thị Mỹ Hiệp','10/02/2001','19122055@st.hcmuaf.edu.vn','0329056619','26-04-2022 20:46:58','26-04-2022 20:46:58',1,1,'https://i.imgur.com/bFbOCtQ.jpg','19122055@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(236,'2023080','Nguyễn Thị Huyền Trân','07/08/2000','nguyenthihuyentran07082000@gmail.com','0704844385','26-04-2022 20:47:15','26-04-2022 20:47:15',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthihuyentran07082000@gmail.com','cmdcmdcmd',1,1,3,3),(237,'2023196','Nguyễn Thị Lan Anh','02/10/2001','anhntl19408@st.uel.edu.vn','0967392622','26-04-2022 20:48:22','26-04-2022 20:48:22',1,0,'https://i.imgur.com/bFbOCtQ.jpg','anhntl19408@st.uel.edu.vn','cmdcmdcmd',1,1,3,3),(238,'2023197','Trần Thị Kiều','05/03/1998','tranthikieu050399@gmail.com','0335957611','26-04-2022 20:48:23','26-04-2022 20:48:23',1,0,'https://i.imgur.com/bFbOCtQ.jpg','tranthikieu050399@gmail.com','cmdcmdcmd',1,1,3,3),(239,'2023050','Mai Trúc Phượng','27/08/1998','maitrucphuong98@gmail.com','0332795135','26-04-2022 20:47:00','26-04-2022 20:47:00',1,1,'https://i.imgur.com/bFbOCtQ.jpg','maitrucphuong98@gmail.com','cmdcmdcmd',1,1,3,3),(240,'2023111','Phan Thị Quỳnh Hương ','15/11/1999','Phanthiquynhhuong0192@gmail.com','0867928469','26-04-2022 20:47:32','26-04-2022 20:47:32',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Phanthiquynhhuong0192@gmail.com','cmdcmdcmd',1,1,3,3),(241,'2023076','Trương Thị Nhi','14/04/2000','thinhi3942@gmail.com','0942063365','26-04-2022 20:47:13','26-04-2022 20:47:13',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thinhi3942@gmail.com','cmdcmdcmd',1,1,3,3),(242,'2023030','Nguyễn Văn Khang','08/12/2000','nv.khang0405@gmail.com','0978121304','26-04-2022 20:46:51','26-04-2022 20:46:51',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nv.khang0405@gmail.com','cmdcmdcmd',1,1,3,3),(243,'2023232','Nguyễn Bảo Khuyên ','17/11/2002','Baokhuyen20122002@gmail.com ','0333079607','26-04-2022 20:48:47','26-04-2022 20:48:47',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Baokhuyen20122002@gmail.com ','cmdcmdcmd',1,1,3,3),(244,'2023151','Nguyễn Thị Thanh Thùy ','11/04/2000','thanhthuy1142000@gmail.com ','384999325','26-04-2022 20:47:54','26-04-2022 20:47:54',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thanhthuy1142000@gmail.com ','cmdcmdcmd',1,1,3,3),(245,'2023185','Võ Thành Phú','08/02/2001','thanhphums10@gmail.com','0775074059','26-04-2022 20:48:15','26-04-2022 20:48:15',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thanhphums10@gmail.com','cmdcmdcmd',1,1,3,3),(246,'2023220','Y Đăng Ninh','27/09/2000','dangninh752@gmail.com','0352751784','26-04-2022 20:48:39','26-04-2022 20:48:39',1,0,'https://i.imgur.com/bFbOCtQ.jpg','dangninh752@gmail.com','cmdcmdcmd',1,1,3,3),(247,'2023129','Lê Hoàng Khánh Linh','02/05/2000','18125161@st.hcmuaf.edu.vn','0969875763','26-04-2022 20:47:41','26-04-2022 20:47:41',1,1,'https://i.imgur.com/bFbOCtQ.jpg','18125161@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(248,'2023164','Nguyễn Phan Bảo Trân','09/04/2001','phanbaotrannguyen9401@gmail.com','0933783918','26-04-2022 20:48:02','26-04-2022 20:48:02',1,0,'https://i.imgur.com/bFbOCtQ.jpg','phanbaotrannguyen9401@gmail.com','cmdcmdcmd',1,1,3,3),(249,'2023215','Nguyễn Thanh Ngọc Yến','01/01/2001','nguyenthanhngocyen01012001@gmail.com','0707943094','26-04-2022 20:48:35','26-04-2022 20:48:35',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthanhngocyen01012001@gmail.com','cmdcmdcmd',1,1,3,3),(250,'2023157','Nguyễn Quốc Đông Triều','06/06/1999','dongtrieut2.699@gmail.com','0378537443','26-04-2022 20:47:58','26-04-2022 20:47:58',1,0,'https://i.imgur.com/bFbOCtQ.jpg','dongtrieut2.699@gmail.com','cmdcmdcmd',1,1,3,3),(251,'2023004','Y Đăng Ninh','27/09/2000','dangninh752@gmail.com','0352751784','26-04-2022 20:46:38','26-04-2022 20:46:38',1,1,'https://i.imgur.com/bFbOCtQ.jpg','dangninh752@gmail.com','cmdcmdcmd',1,1,3,3),(252,'2023229','Nguyễn Thị Hợp','20/04/2000','thihop187@gmail.com','0375802180','26-04-2022 20:48:45','26-04-2022 20:48:45',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thihop187@gmail.com','cmdcmdcmd',1,1,3,3),(253,'2023024','Võ Thành Cao Nhơn','19/05/2000','Caonhon12@gmail.com','0374869321','26-04-2022 20:46:48','26-04-2022 20:46:48',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Caonhon12@gmail.com','cmdcmdcmd',1,1,3,3),(254,'2023036','Võ Ngọc Phương Uyên','08/02/2002','uyenlun0802@gmail.com ','0961072417','26-04-2022 20:46:54','26-04-2022 20:46:54',1,1,'https://i.imgur.com/bFbOCtQ.jpg','uyenlun0802@gmail.com ','cmdcmdcmd',1,1,3,3),(255,'2023150','Nông Thị Thuỷ','03/09/2000','nongthithuy5516@gmail.com','0355502710','26-04-2022 20:47:54','26-04-2022 20:47:54',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nongthithuy5516@gmail.com','cmdcmdcmd',1,1,3,3),(256,'2023228','Trần Thanh Trọng','25/05/2002','Thanhtrongag67@gmail.com','0337573719','26-04-2022 20:48:44','26-04-2022 20:48:44',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Thanhtrongag67@gmail.com','cmdcmdcmd',1,1,3,3),(257,'2023122','NGUYỄN THỊ MINH HOA','14/08/1999','nguyenthiminhhoa14@gmail.com','0782898030','26-04-2022 20:47:38','26-04-2022 20:47:38',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthiminhhoa14@gmail.com','cmdcmdcmd',1,1,3,3),(258,'2023018','Nguyễn Thị Thuý Diễm','30/04/2002','diemn3531@gmail.com','0585812629','26-04-2022 20:46:46','26-04-2022 20:46:46',1,1,'https://i.imgur.com/bFbOCtQ.jpg','diemn3531@gmail.com','cmdcmdcmd',1,1,3,3),(259,'2023089','Nguyễn Y Phụng','01/07/1999','nguyenyphung17@gmail.com','0326229351','26-04-2022 20:47:20','26-04-2022 20:47:20',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenyphung17@gmail.com','cmdcmdcmd',1,1,3,3),(260,'2023041','Võ Thị Bích Thuận','21/05/2002','030336200279@st.buh.edu.vn','0325557651','26-04-2022 20:46:56','26-04-2022 20:46:56',1,1,'https://i.imgur.com/bFbOCtQ.jpg','030336200279@st.buh.edu.vn','cmdcmdcmd',1,1,3,3),(261,'2023116','Lê Minh Như Nguyệt','04/10/2002','nguyetle763@gmail.com','0705109277','26-04-2022 20:47:34','26-04-2022 20:47:34',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyetle763@gmail.com','cmdcmdcmd',1,1,3,3),(262,'2023039','Nguyễn Tiến Phúc','24/12/2001','tienphuc22113@gmail.com','0866834181','26-04-2022 20:46:55','26-04-2022 20:46:55',1,1,'https://i.imgur.com/bFbOCtQ.jpg','tienphuc22113@gmail.com','cmdcmdcmd',1,1,3,3),(263,'2023048','Dương Thế Bích','20/02/2001','thebichpham@gmail.com','0398026884','26-04-2022 20:46:59','26-04-2022 20:46:59',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thebichpham@gmail.com','cmdcmdcmd',1,1,3,3),(264,'2023182','Nguyễn Đình Quốc','03/02/2002','quocnguyen322002@gmail.com','0337131900','26-04-2022 20:48:13','26-04-2022 20:48:13',1,0,'https://i.imgur.com/bFbOCtQ.jpg','quocnguyen322002@gmail.com','cmdcmdcmd',1,1,3,3),(265,'2023193','Nguyễn Thị Mỹ Lệ','05/06/2002','nguyenmyleoh@gmail.com','0389330803','26-04-2022 20:48:21','26-04-2022 20:48:21',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenmyleoh@gmail.com','cmdcmdcmd',1,1,3,3),(266,'2023082','PHAN THỊ HỒNG SANG','10/05/2002','Hongsang365s@gmail.com','0392387408','26-04-2022 20:47:16','26-04-2022 20:47:16',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hongsang365s@gmail.com','cmdcmdcmd',1,1,3,3),(267,'2023092','Trịnh Thị Thu sương ','30/09/2002','minx1648@gmail.com ','0776243320','26-04-2022 20:47:22','26-04-2022 20:47:22',1,1,'https://i.imgur.com/bFbOCtQ.jpg','minx1648@gmail.com ','cmdcmdcmd',1,1,3,3),(268,'2023098','Hồ Huy Luật','02/01/2001','hohuyluat1@gmail.com','0789456948','26-04-2022 20:47:25','26-04-2022 20:47:25',1,1,'https://i.imgur.com/bFbOCtQ.jpg','hohuyluat1@gmail.com','cmdcmdcmd',1,1,3,3),(269,'2023105','Lăng Bảo Khanh','30/12/2000','khanhlb18410@st.uel.edu.vn','0962643609','26-04-2022 20:47:28','26-04-2022 20:47:28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','khanhlb18410@st.uel.edu.vn','cmdcmdcmd',1,1,3,3),(270,'2023101','Võ Thu Uyên ','10/11/1999','thuuyenvo99@gmail.com','0777935167','26-04-2022 20:47:26','26-04-2022 20:47:26',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thuuyenvo99@gmail.com','cmdcmdcmd',1,1,3,3),(271,'2023203','Bùi Trương Kim Hồng','05/03/2002','xmkms99@gmail.com','0772123664','26-04-2022 20:48:27','26-04-2022 20:48:27',1,0,'https://i.imgur.com/bFbOCtQ.jpg','xmkms99@gmail.com','cmdcmdcmd',1,1,3,3),(272,'2023180','Bùi Trương Kim Hồng','05/03/2002','xmkms99@gmail.com','0772123664','26-04-2022 20:48:12','26-04-2022 20:48:12',1,0,'https://i.imgur.com/bFbOCtQ.jpg','xmkms99@gmail.com','cmdcmdcmd',1,1,3,3),(273,'2023222','Trương Thị Mỹ Hiệp ','10/02/2001','19122055@st.hcmuaf.edu.vn','0329056619','26-04-2022 20:48:40','26-04-2022 20:48:40',1,0,'https://i.imgur.com/bFbOCtQ.jpg','19122055@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(274,'2023187','Lê Hoàng Hương','17/07/2001','lehoanghuong17@gmail.com','0768153899','26-04-2022 20:48:16','26-04-2022 20:48:16',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lehoanghuong17@gmail.com','cmdcmdcmd',1,1,3,3),(275,'2023206','Phan Văn Thịnh','03/02/2002','thanhthoai10a2@gmail.com','0397239569','26-04-2022 20:48:29','26-04-2022 20:48:29',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thanhthoai10a2@gmail.com','cmdcmdcmd',1,1,3,3),(276,'2023051','Đỗ Hoàng Nam','01/01/2002','dohoangnamsadec@gmail.com','0899042920','26-04-2022 20:47:01','26-04-2022 20:47:01',1,1,'https://i.imgur.com/bFbOCtQ.jpg','dohoangnamsadec@gmail.com','cmdcmdcmd',1,1,3,3),(277,'2023090','Vy Viết Kim Ngân','08/07/2001','kellykey29940@gmail.com','0346342238','26-04-2022 20:47:21','26-04-2022 20:47:21',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kellykey29940@gmail.com','cmdcmdcmd',1,1,3,3),(278,'2023021','Nguyễn Thị Thanh Nhàn','23/02/2001','thanhnhanbuh0101@gmail.com','0984239201','26-04-2022 20:46:47','26-04-2022 20:46:47',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thanhnhanbuh0101@gmail.com','cmdcmdcmd',1,1,3,3),(279,'2023011','Lâm Thị Ngọc Nhi','02/05/2001','lamngocnhi0205@gmail.com','0352108938','26-04-2022 20:46:42','26-04-2022 20:46:42',1,1,'https://i.imgur.com/bFbOCtQ.jpg','lamngocnhi0205@gmail.com','cmdcmdcmd',1,1,3,3),(280,'2023081','Lê Thị Mỹ Linh','13/01/2002','mylinh01677281441@gmail.com','0868656874','26-04-2022 20:47:16','26-04-2022 20:47:16',1,1,'https://i.imgur.com/bFbOCtQ.jpg','mylinh01677281441@gmail.com','cmdcmdcmd',1,1,3,3),(281,'2023199','Bùi Thị Tuyết Mai','20/01/2002','20125510@st.hcmuaf.edu.vn','0925721201','26-04-2022 20:48:24','26-04-2022 20:48:24',1,0,'https://i.imgur.com/bFbOCtQ.jpg','20125510@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(282,'2023088','Đặng Tuấn Khanh','12/06/2002','tuankhanh12d1@gmail.com','0903660634','26-04-2022 20:47:20','26-04-2022 20:47:20',1,1,'https://i.imgur.com/bFbOCtQ.jpg','tuankhanh12d1@gmail.com','cmdcmdcmd',1,1,3,3),(283,'2023027','Lê Thị Hợp','23/02/2000','lehop.buh@gmail.com','0868881048','26-04-2022 20:46:50','26-04-2022 20:46:50',1,1,'https://i.imgur.com/bFbOCtQ.jpg','lehop.buh@gmail.com','cmdcmdcmd',1,1,3,3),(284,'2023224','Vũ Khánh Băng ','21/09/2002','vukhanhbang2002@gmail.com ','0765709335','26-04-2022 20:48:41','26-04-2022 20:48:41',1,0,'https://i.imgur.com/bFbOCtQ.jpg','vukhanhbang2002@gmail.com ','cmdcmdcmd',1,1,3,3),(285,'2023013','Trịnh Thị Hoài Lam ','09/01/2000','trinhthihoailam.0901@gmail.com','0339273691','26-04-2022 20:46:43','26-04-2022 20:46:43',1,1,'https://i.imgur.com/bFbOCtQ.jpg','trinhthihoailam.0901@gmail.com','cmdcmdcmd',1,1,3,3),(286,'2023118','Đặng Thị Thanh Tuyền','06/04/2001','thanhtuyen060401@gmail.com','0332011434','26-04-2022 20:47:35','26-04-2022 20:47:35',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thanhtuyen060401@gmail.com','cmdcmdcmd',1,1,3,3),(287,'2023067','Đinh Thị Ngọc Ánh','07/08/1999','anhdinh0708@gmail.com','0981744381','26-04-2022 20:47:09','26-04-2022 20:47:09',1,1,'https://i.imgur.com/bFbOCtQ.jpg','anhdinh0708@gmail.com','cmdcmdcmd',1,1,3,3),(288,'2023140','Lê Hoàng Mộng Tuyền','15/01/2000','lehoangmongtuyen@gmail.com','0797709545','26-04-2022 20:47:48','26-04-2022 20:47:48',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lehoangmongtuyen@gmail.com','cmdcmdcmd',1,1,3,3),(289,'2023200','Nguyễn Thị Ngọc Bích','25/11/1999','ngocbichnguyena3@gmail.com','0383855346','26-04-2022 20:48:25','26-04-2022 20:48:25',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ngocbichnguyena3@gmail.com','cmdcmdcmd',1,1,3,3),(290,'2023128','Nguyễn Thị Liễu ','10/01/1999','17113092@st.hcmuaf.edu.vn','0377736405','26-04-2022 20:47:41','26-04-2022 20:47:41',1,1,'https://i.imgur.com/bFbOCtQ.jpg','17113092@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(291,'2023209','Trịnh Thị Huyền Trang','17/04/2000','18112227@st.hcmuaf.edu.vn','0365696581','26-04-2022 20:48:31','26-04-2022 20:48:31',1,0,'https://i.imgur.com/bFbOCtQ.jpg','18112227@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(292,'2023170','Nguyễn Bảo Khuyên ','17/11/2002','Baokhuyen20122002@gmail.com ','0333079607','26-04-2022 20:48:06','26-04-2022 20:48:06',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Baokhuyen20122002@gmail.com ','cmdcmdcmd',1,1,3,3),(293,'2023005','Nguyễn Thị Ngọc Linh ','13/05/2002','Nguyenthingoclinhkt02@gmail.com ','0365036807','26-04-2022 20:46:38','26-04-2022 20:46:38',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthingoclinhkt02@gmail.com ','cmdcmdcmd',1,1,3,3),(294,'2023015','Nguyễn Thị Mỹ Hạ ','05/04/2001','nguyenthimyhact2001@gmail.com ','0915878573','26-04-2022 20:46:44','26-04-2022 20:46:44',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthimyhact2001@gmail.com ','cmdcmdcmd',1,1,3,3),(295,'2023009','Trương Lâm Quế Trâm','10/02/2002','2301ttt@gmail.com','0935457054','26-04-2022 20:46:41','26-04-2022 20:46:41',1,1,'https://i.imgur.com/bFbOCtQ.jpg','2301ttt@gmail.com','cmdcmdcmd',1,1,3,3),(296,'2023171','Nguyễn Lương Quỳnh Như ','14/10/2002','nhu0979003760@gmail.com ','0979003760','26-04-2022 20:48:06','26-04-2022 20:48:06',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nhu0979003760@gmail.com ','cmdcmdcmd',1,1,3,3),(297,'2023062','Nguyễn Thị Bảo Hân','08/03/2000','baohan.8320@gmail.com','0347434635','26-04-2022 20:47:06','26-04-2022 20:47:06',1,1,'https://i.imgur.com/bFbOCtQ.jpg','baohan.8320@gmail.com','cmdcmdcmd',1,1,3,3),(298,'2023152','Võ Thị Mỹ Châu','28/01/2000','mychauvothi02@gmail.com','0373729197','26-04-2022 20:47:55','26-04-2022 20:47:55',1,0,'https://i.imgur.com/bFbOCtQ.jpg','mychauvothi02@gmail.com','cmdcmdcmd',1,1,3,3),(299,'2023060','Nguyễn Thị Kim Ngân','16/05/2002','nguyenthikimngan10088@gmail.com','0946398429','26-04-2022 20:47:05','26-04-2022 20:47:05',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthikimngan10088@gmail.com','cmdcmdcmd',1,1,3,3),(300,'2023038','Nguyễn Đình Quốc','03/02/2002','quocnguyen322002@gmail.com','0337131900','26-04-2022 20:46:55','26-04-2022 20:46:55',1,1,'https://i.imgur.com/bFbOCtQ.jpg','quocnguyen322002@gmail.com','cmdcmdcmd',1,1,3,3),(301,'2023068','Nguyễn Thị Lệ Ngân','13/03/2001','lenganyg01@gmail.com','0335324418','26-04-2022 20:47:09','26-04-2022 20:47:09',1,1,'https://i.imgur.com/bFbOCtQ.jpg','lenganyg01@gmail.com','cmdcmdcmd',1,1,3,3),(302,'2023137','Nguyễn Thị Xuân Mai','31/07/2002','xuanmaitm317@gmail.com','0973942940','26-04-2022 20:47:46','26-04-2022 20:47:46',1,0,'https://i.imgur.com/bFbOCtQ.jpg','xuanmaitm317@gmail.com','cmdcmdcmd',1,1,3,3),(303,'2023003','Ngô Nguyễn Anh Khoa','21/07/2000','18113065@st.hcmuaf.edu.vn','0947667224','26-04-2022 20:46:37','26-04-2022 20:46:37',1,1,'https://i.imgur.com/bFbOCtQ.jpg','18113065@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(304,'2023109','Lê Thị Mỹ Hân','22/09/2000','han.le229@hcmut.edu.vn','0973802014','26-04-2022 20:47:31','26-04-2022 20:47:31',1,1,'https://i.imgur.com/bFbOCtQ.jpg','han.le229@hcmut.edu.vn','cmdcmdcmd',1,1,3,3),(305,'2023099','Danh thị bích vân','03/09/1998','bichvannh28@gmail.com','0356808544','26-04-2022 20:47:25','26-04-2022 20:47:25',1,1,'https://i.imgur.com/bFbOCtQ.jpg','bichvannh28@gmail.com','cmdcmdcmd',1,1,3,3),(306,'2023172','Nguyễn Thị Xuân Mai','01/01/2001','Maidd115@gmail.com','0972990830','26-04-2022 20:48:07','26-04-2022 20:48:07',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Maidd115@gmail.com','cmdcmdcmd',1,1,3,3),(307,'2023087','Lê Thị Mỹ Hạnh ','07/07/2000','Myhanh3248@gmail.com','0901343248','26-04-2022 20:47:19','26-04-2022 20:47:19',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Myhanh3248@gmail.com','cmdcmdcmd',1,1,3,3),(308,'2023108','Nguyễn Lương Hoài Thương ','04/11/2002','hoaithuong.nguyen.041102@gmail.com ','344125058','26-04-2022 20:47:30','26-04-2022 20:47:30',1,1,'https://i.imgur.com/bFbOCtQ.jpg','hoaithuong.nguyen.041102@gmail.com ','cmdcmdcmd',1,1,3,3),(309,'2023169','Nguyễn Thị Lưu Luyến ','06/06/2002','20125506@st.hcmuaf.edu.vn','0384987063','26-04-2022 20:48:05','26-04-2022 20:48:05',1,0,'https://i.imgur.com/bFbOCtQ.jpg','20125506@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(310,'2023103','Thái Thanh Sơn','16/09/2001','sownthasi@gmail.com','0816146300','26-04-2022 20:47:27','26-04-2022 20:47:27',1,1,'https://i.imgur.com/bFbOCtQ.jpg','sownthasi@gmail.com','cmdcmdcmd',1,1,3,3),(311,'2023125','Trần Thị Mỹ Lệ','14/09/2001','tranthimyle.tk3@gmail.com','0336633717','26-04-2022 20:47:39','26-04-2022 20:47:39',1,1,'https://i.imgur.com/bFbOCtQ.jpg','tranthimyle.tk3@gmail.com','cmdcmdcmd',1,1,3,3),(312,'2023202','Trần Kiến Nam ','15/01/1998','nt43425@gmail.com ','0353029739','26-04-2022 20:48:26','26-04-2022 20:48:26',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nt43425@gmail.com ','cmdcmdcmd',1,1,3,3),(313,'2023061','Võ Thị Nguyên','09/12/2002','vo189928@gmail.com','0388202652','26-04-2022 20:47:06','26-04-2022 20:47:06',1,1,'https://i.imgur.com/bFbOCtQ.jpg','vo189928@gmail.com','cmdcmdcmd',1,1,3,3),(314,'2023163','Nguyễn Thị Ngọc Linh ','13/05/2002','Nguyenthingoclinhkt02@gmail.com ','0365036807','26-04-2022 20:48:02','26-04-2022 20:48:02',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthingoclinhkt02@gmail.com ','cmdcmdcmd',1,1,3,3),(315,'2023227','Nguyễn Kim Giang','01/06/2001','giangkimnguyen16@gmail.com','0768975267','26-04-2022 20:48:43','26-04-2022 20:48:43',1,0,'https://i.imgur.com/bFbOCtQ.jpg','giangkimnguyen16@gmail.com','cmdcmdcmd',1,1,3,3),(316,'2023064','Nguyễn Gia Trung','04/08/2002','ngt040802@gmail.com','0562719530','26-04-2022 20:47:07','26-04-2022 20:47:07',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ngt040802@gmail.com','cmdcmdcmd',1,1,3,3),(317,'2023178','Hồ Thị Thúy Hiền','07/01/2000','thuyhiensehun@gmail.com','0386325714','26-04-2022 20:48:11','26-04-2022 20:48:11',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thuyhiensehun@gmail.com','cmdcmdcmd',1,1,3,3),(318,'2023177','Nguyễn Thị Vân Anh','05/10/1999','ngth.vananh99@gmail.com','0395046627','26-04-2022 20:48:10','26-04-2022 20:48:10',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ngth.vananh99@gmail.com','cmdcmdcmd',1,1,3,3),(319,'2023176','Nguyễn Nhựt Minh','25/11/2001','minhnn19407@st.uel.edu.vn','0387841567','26-04-2022 20:48:10','26-04-2022 20:48:10',1,0,'https://i.imgur.com/bFbOCtQ.jpg','minhnn19407@st.uel.edu.vn','cmdcmdcmd',1,1,3,3),(320,'2023159','Nguyễn Thị Lan Anh','02/10/2001','anhntl19408@st.uel.edu.vn','0967392622','26-04-2022 20:47:59','26-04-2022 20:47:59',1,0,'https://i.imgur.com/bFbOCtQ.jpg','anhntl19408@st.uel.edu.vn','cmdcmdcmd',1,1,3,3),(321,'2023231','Nguyễn Thị Trang','06/11/1999','Trangbinhloc@gmail.com','0347587878','26-04-2022 20:48:46','26-04-2022 20:48:46',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Trangbinhloc@gmail.com','cmdcmdcmd',1,1,3,3),(322,'2023191','Nguyễn Thị Hà Giang','12/04/2002','hagianng1704@gmail.com','0943657511','26-04-2022 20:48:19','26-04-2022 20:48:19',1,0,'https://i.imgur.com/bFbOCtQ.jpg','hagianng1704@gmail.com','cmdcmdcmd',1,1,3,3),(323,'2023007','Trương Trí Hào','21/09/2002','truongtrihao21@gmail.com','0336896494','26-04-2022 20:46:39','26-04-2022 20:46:39',1,1,'https://i.imgur.com/bFbOCtQ.jpg','truongtrihao21@gmail.com','cmdcmdcmd',1,1,3,3),(324,'2023034','Huỳnh Thị Kim Nhung ','15/04/2000','htknhung2019@gmail.com ','0378374615','26-04-2022 20:46:53','26-04-2022 20:46:53',1,1,'https://i.imgur.com/bFbOCtQ.jpg','htknhung2019@gmail.com ','cmdcmdcmd',1,1,3,3),(325,'2023114','Huỳnh Thị Trúc Linh','19/01/2000','phuongmiu191@gmail.com','0363302171','26-04-2022 20:47:33','26-04-2022 20:47:33',1,1,'https://i.imgur.com/bFbOCtQ.jpg','phuongmiu191@gmail.com','cmdcmdcmd',1,1,3,3),(326,'2023160','Kiều Ái Vi','14/01/2002','kieuaivi2k2@gmail.com','0327937312','26-04-2022 20:48:00','26-04-2022 20:48:00',1,0,'https://i.imgur.com/bFbOCtQ.jpg','kieuaivi2k2@gmail.com','cmdcmdcmd',1,1,3,3),(327,'2023121','Nguyễn Thị Lan Châu','18/05/2000','nguyenthilanchau1805@gmail.com','0367345109','26-04-2022 20:47:37','26-04-2022 20:47:37',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthilanchau1805@gmail.com','cmdcmdcmd',1,1,3,3),(328,'2023085','Nguyễn Thị Huyền Trân','30/05/2000','huyentran30520@gmail.com','0981769443','26-04-2022 20:47:18','26-04-2022 20:47:18',1,1,'https://i.imgur.com/bFbOCtQ.jpg','huyentran30520@gmail.com','cmdcmdcmd',1,1,3,3),(329,'2023070','Mai Thị Khánh Huyền','17/08/2001','maikhanhhuyen91@gmail.com','0988496076','26-04-2022 20:47:10','26-04-2022 20:47:10',1,1,'https://i.imgur.com/bFbOCtQ.jpg','maikhanhhuyen91@gmail.com','cmdcmdcmd',1,1,3,3),(330,'2023040','Võ Thị Mỹ Oanh','21/10/2001','19112143@st.hcmuaf.edu.vn','0395655783','26-04-2022 20:46:56','26-04-2022 20:46:56',1,1,'https://i.imgur.com/bFbOCtQ.jpg','19112143@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(331,'2023094','Nguyễn Dĩ Khang','22/10/2001','nguyendikhang369@gmail.com','0336860720','26-04-2022 20:47:23','26-04-2022 20:47:23',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyendikhang369@gmail.com','cmdcmdcmd',1,1,3,3),(332,'2023106','Nguyễn Minh Thiện Tâm','29/04/2001','minhthien3004mt@gmail.com','0827957526','26-04-2022 20:47:29','26-04-2022 20:47:29',1,1,'https://i.imgur.com/bFbOCtQ.jpg','minhthien3004mt@gmail.com','cmdcmdcmd',1,1,3,3),(333,'2023086','Nguyễn Thị Thủy Tiên','15/03/2000','thuytienthuytien@gmail.com','0385087900','26-04-2022 20:47:19','26-04-2022 20:47:19',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thuytienthuytien@gmail.com','cmdcmdcmd',1,1,3,3),(334,'2023135','Nguyễn Linh Tâm','15/05/2000','nguyenlinhtam1505200@gmail.com','0942073618','26-04-2022 20:47:45','26-04-2022 20:47:45',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenlinhtam1505200@gmail.com','cmdcmdcmd',1,1,3,3),(335,'2023054','Lê Thị Hồng Gấm ','24/01/1999','lethihonggam1011999@gmail.com ','0398997446','26-04-2022 20:47:02','26-04-2022 20:47:02',1,1,'https://i.imgur.com/bFbOCtQ.jpg','lethihonggam1011999@gmail.com ','cmdcmdcmd',1,1,3,3),(336,'2023010','Nguyễn Thị Ngọc Ánh','03/08/2001','ngocanh01299@gmail.com','0364264697','26-04-2022 20:46:41','26-04-2022 20:46:41',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ngocanh01299@gmail.com','cmdcmdcmd',1,1,3,3),(337,'2023083','Nguyễn Bình An','12/02/1999','Ngbinhan30@gmail.com','0329863884','26-04-2022 20:47:17','26-04-2022 20:47:17',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Ngbinhan30@gmail.com','cmdcmdcmd',1,1,3,3),(338,'2023149','Nguyễn Thị Như Quỳnh ','29/06/2000','nhuquynhbp12345@gmail.com ','0866945743','26-04-2022 20:47:53','26-04-2022 20:47:53',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nhuquynhbp12345@gmail.com ','cmdcmdcmd',1,1,3,3),(339,'2023190','Nguyễn Thị Thanh Nhàn','23/02/2001','thanhnhanbuh0101@gmail.com','0984239201','26-04-2022 20:48:18','26-04-2022 20:48:18',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thanhnhanbuh0101@gmail.com','cmdcmdcmd',1,1,3,3),(340,'2023219','Trần Thị Kim Trinh','18/08/2002','ktrinh2k2@gmail.com','0337102076','26-04-2022 20:48:38','26-04-2022 20:48:38',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ktrinh2k2@gmail.com','cmdcmdcmd',1,1,3,3),(341,'2023017','Sử Thị Thanh Lan','07/11/2001','thanhlan07112001@gmail.com','0969670256','26-04-2022 20:46:45','26-04-2022 20:46:45',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thanhlan07112001@gmail.com','cmdcmdcmd',1,1,3,3),(342,'2023031','Hoàng Thị Quỳnh Anh','26/03/2001','Hoangthiquynhanh2631@gmail.com','0946645297','26-04-2022 20:46:51','26-04-2022 20:46:51',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hoangthiquynhanh2631@gmail.com','cmdcmdcmd',1,1,3,3),(343,'2023110','Nguyễn Thị Ái Liên','22/04/1999','Ailienmax09@gmail.com','0848525289','26-04-2022 20:47:31','26-04-2022 20:47:31',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Ailienmax09@gmail.com','cmdcmdcmd',1,1,3,3),(344,'2023014','Trần Nguyễn Quỳnh Như ','15/08/2001','quynhnhu1508pcy@gmail.com','0373273170','26-04-2022 20:46:43','26-04-2022 20:46:43',1,1,'https://i.imgur.com/bFbOCtQ.jpg','quynhnhu1508pcy@gmail.com','cmdcmdcmd',1,1,3,3),(345,'2023123','Trương Thanh Tiền','02/07/2002','truongthanhtien272002@gmail.com','0777943269','26-04-2022 20:47:38','26-04-2022 20:47:38',1,1,'https://i.imgur.com/bFbOCtQ.jpg','truongthanhtien272002@gmail.com','cmdcmdcmd',1,1,3,3),(346,'2023019','Nguyễn Thanh Ngọc Yến','01/01/2001','nguyenthanhngocyen01012001@gmail.com','0707943094','26-04-2022 20:46:46','26-04-2022 20:46:46',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthanhngocyen01012001@gmail.com','cmdcmdcmd',1,1,3,3),(347,'2023207','Lê Minh Như Nguyệt','04/10/2002','nguyetle763@gmail.com','0705109277','26-04-2022 20:48:30','26-04-2022 20:48:30',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyetle763@gmail.com','cmdcmdcmd',1,1,3,3),(348,'2023065','Nguyễn Lê Công Quý','28/04/2002','nguyenlecongquy@gmail.com','0834827907','26-04-2022 20:47:08','26-04-2022 20:47:08',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenlecongquy@gmail.com','cmdcmdcmd',1,1,3,3),(349,'2023119','Nguyễn Thị Hồng Yến ','10/03/2000','18117087@st.hcmuaf.edu.vn','0346499442','26-04-2022 20:47:36','26-04-2022 20:47:36',1,1,'https://i.imgur.com/bFbOCtQ.jpg','18117087@st.hcmuaf.edu.vn','cmdcmdcmd',1,1,3,3),(350,'2023235','Nguyễn Thị Hồng Yến ','10/03/2000','Kaynguyen442928@gmail.com ','0346499442','26-04-2022 20:48:49','26-04-2022 20:48:49',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Kaynguyen442928@gmail.com ','cmdcmdcmd',1,1,3,3),(351,'2023214','Võ Thị Trọng','24/09/2002','votrong173@gmail.com','0374576026','26-04-2022 20:48:34','26-04-2022 20:48:34',1,0,'https://i.imgur.com/bFbOCtQ.jpg','votrong173@gmail.com','cmdcmdcmd',1,1,3,3),(352,'2023239','Nguyễn Thị Băng Châu','2002-11-29','Nguyenthibangchauvn@gmail.com','0907733612','26-04-2022 20:48:52','02-05-2022 16:23:08',0,0,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthibangchauvn@gmail.com','cmdcmd',1,0,3,1),(353,'NV20133097','Nguyễn Võ Song Toàn','2002-11-29','adamwilling.2002@gmail.com','0369572542','02-05-2022 14:02:38','02-05-2022 16:18:29',0,1,'','adamwilling.2002@gmail.com','cmdcmd',1,0,1,1),(354,'20133097','Nguyễn Võ Song Toàn','2002-11-29','20133097@student.hcmute.edu.vn','0369572542','02-05-2022 14:34:42','02-05-2022 15:50:56',0,1,'','','cmdcmd',1,0,1,1),(355,'Admin','Administrator','1998-01-01','admin@ktxcomay.com.vn','123456787','02-05-2022 15:59:40','02-05-2022 16:16:57',1,1,'','','cmdcmd',1,1,1,1),(356,'SV20133097','Nguyễn Võ Song Toàn','2002-11-29','adamwilling.2002@gmail.com','0369572542','02-05-2022 16:33:48','02-05-2022 16:33:48',1,1,'','adamwilling.2002@gmail.com','cmdcmd',1,1,1,1),(357,'NVCT22','Nguyễn Võ Công Toàn','2000-05-05','toan6463@gmail.com','0987467364','03-05-2022 18:10:55','03-05-2022 19:22:48',0,1,'','toan6463@gmail.com','cmdcmd',1,0,1,1);
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
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemcode_UNIQUE` (`item_code`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'E','DEPE1','Phòng ban đang được sử dụng'),(2,'E','EMPE1','Không được khóa tài khoản trưởng phòng'),(3,'E','DEPE2','Mã phòng ban này đã tồn tại'),(4,'E','POSE1','Tạo mới chức vụ thất bại'),(5,'E','EMPE2','Không thể xóa nhân viên là trưởng phòng'),(6,'S','EMPS1','Thêm danh sách nhân viên thành công'),(7,'E','EMPE3','Có lỗi xảy ra khi thêm danh sách nhân viên'),(8,'E','EMPE4','Có lỗi xảy ra khi thêm nhân viên'),(9,'S','EMPS2','Tạo mới nhân viên thành công'),(10,'E','DEPE3','Tạo mới phòng ban thất bại'),(12,'E','POSE2','Cập nhật chức vụ thất bại'),(13,'E','DEPE4','Cập nhật  phòng ban thất bại'),(14,'E','TEAME1','Đội nhóm đang được sử dụng'),(15,'E','TEAME2','Thêm đội nhóm thất bại'),(16,'E','TEAME3','Mã đội nhóm đã tồn tại'),(17,'S','TEAMS4','Tạo mới đội nhóm thành công'),(18,'S','TEAMS5','Cập nhật đội nhóm thành công'),(19,'S','TEAMS6','Xóa đội nhóm thành công'),(20,'S','TASKS1','Tạo mới công việc thành công'),(21,'E','TASKE1','Tạo mới công việc thất bại'),(22,'S','TASKS2','Cập nhật công việc thành công'),(23,'S','TASKS3','Hủy công việc thành công'),(24,'E','TASKE3','Cập nhật công việc thất bại'),(25,'S','ROLES1','Tạo mới vai trò thành công'),(26,'E','ROLEE1','Tạo mới vai trò thất bại'),(27,'E','ROLEE2','Vai trò này đang được sử dụng'),(28,'E','ROLEE3','Xóa vai trò thất bại'),(29,'S','ROLES2','Xóa vai trò thành công'),(30,'S','ROLES3','Cập nhật vai trò thành công'),(31,'E','ROLEE4','Cập nhật vai trò thất bại');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mytable`
--

DROP TABLE IF EXISTS `mytable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mytable` (
  `id` int NOT NULL,
  `status_id` int NOT NULL,
  `creator_id` int NOT NULL,
  `title` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(154) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_date` varchar(19) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `receiver_id` int NOT NULL,
  `finish_date` varchar(19) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mytable`
--

LOCK TABLES `mytable` WRITE;
/*!40000 ALTER TABLE `mytable` DISABLE KEYS */;
INSERT INTO `mytable` VALUES (2,2,57,'cửa á ác','Được vá không quần.','28-03-2022 19:12:00',24,'28-03-2022 19:12:00'),(3,5,4,'tủ bè vẽ','Lỗi tám đồng làm mượn.\nKhông đang một mười bàn bảy tôi.\nRuộng áo tô đạp hàng.','28-03-2022 19:12:00',72,'28-03-2022 19:12:00'),(5,4,43,'chín đang may','Thương gì khâu chết dép chết ghét.\nBiển năm nha đập quần.\nViệc bảy vàng nhà dép đạp giày thì.','28-03-2022 19:12:00',35,'28-03-2022 19:12:00'),(6,8,8,'quê thuê trời','Đá may vẽ cửa không tô ghét.','28-03-2022 19:12:00',79,'28-03-2022 19:12:00'),(7,4,88,'đập tô tàu','Máy hết ghế leo đỏ hai gió.\nHai yêu xuồng tàu trăng thích đánh mua.\nBiết bè đạp.\nNgọt núi hàng á tui xuồng dép.','28-03-2022 19:12:00',9,'28-03-2022 19:12:00'),(8,8,33,'xuồng đâu lỗi','Việc tàu quê kim nghỉ xe.\nViệc tui sáu khâu khoan.','28-03-2022 19:12:00',26,'28-03-2022 19:12:00'),(9,7,85,'thuê được trăng','Cái năm nước mượn biển lỗi bơi xuồng ờ không.','28-03-2022 19:12:00',93,'28-03-2022 19:12:00'),(10,4,52,'mười biết áo','Bè tàu gì tủ ngọt xe quần bảy.','28-03-2022 19:12:00',41,'28-03-2022 19:12:00'),(11,4,11,'thuê vàng trời','Cửa mượn mua thì ba kim hết bảy mượn leo.','28-03-2022 19:12:00',88,'28-03-2022 19:12:00'),(12,5,9,'biển ruộng gió','Biết bàn viết bơi.','28-03-2022 19:12:00',67,'28-03-2022 19:12:00'),(13,7,18,'ờ bảy phá','Chỉ phá vẽ một chín một hết đâu.\nHết quê ruộng viết.','28-03-2022 19:12:00',77,'28-03-2022 19:12:00'),(14,9,58,'là khoảng biển','Yêu ác hàng thuyền yêu lầu.\nÁo ruộng chỉ thôi sáu núi.\nMây ác trăng anh bạn việc may vàng.','28-03-2022 19:12:00',99,'28-03-2022 19:12:00'),(15,8,44,'chỉ đã thì','Vá bơi trời trăng.\nGió vàng nha nước ghế quần anh chìm.\nGì ruộng đạp thôi tím.\nBơi khoảng đồng sáu.','28-03-2022 19:12:00',53,'28-03-2022 19:12:00'),(16,9,67,'hai thuyền xe','Đang em ghét nước thế lầu xe may.\nNúi vàng một độc.\nVá tím nước.','28-03-2022 19:12:00',44,'28-03-2022 19:12:00'),(17,1,97,'yêu biết tủ áo','<p>Hai áo cửa ờ tôi trời đã đang chỉ. Hết gì ngọt đánh vẽ đang được chết tím. Tủ hết vá hết. Vàng mua thuê làm mướn ghét. Tui chín viết bạn mướn thuê.</p>','28-03-2022 19:12:00',42,'28-03-2022 19:12:00'),(18,6,16,'vẽ yêu xuồng','Đã mượn đã.\nGhế hai chết kim làm năm em biển mượn.\nThuê hàng hết máy làm tô đạp chỉ tô viết.\nĐập đá anh ờ nghỉ thế.','28-03-2022 19:12:00',74,'28-03-2022 19:12:00'),(19,5,55,'đồng em xuồng','Áo bảy thuyền hóa là bạn thuê gió.\nLeo xuồng thì việc tui ngọt á nhà làm.\nGhế mười làm dép.\nLỗi xanh yêu cái.','28-03-2022 19:12:00',61,'28-03-2022 19:12:00'),(20,3,60,'hết nước lầu','Quần đồng máy chỉ.\nBạn ghét khoan hết.\nPhá bốn năm leo.\nMây vàng bạn ghét hai là.','28-03-2022 19:12:00',16,'28-03-2022 19:12:00'),(21,9,20,'dép lầu hương','Hết ba thì ừ núi thì được.\nHết bạn vàng vàng không quần trăng đánh không.\nQuê đá đồng nón xanh.','28-03-2022 19:12:00',39,'28-03-2022 19:12:00'),(22,9,60,'phá thôi đồng','Chìm thế núi tàu ghét mướn hương bơi ghế.\nMướn giết thôi.','28-03-2022 19:12:00',84,'28-03-2022 19:12:00'),(23,2,73,'một nghỉ tô','Đồng thôi lỗi.\nTủ tím chết biển chỉ thế ừ không mười.\nNăm đang tím phá thì năm ờ con mười.','28-03-2022 19:12:00',2,'28-03-2022 19:12:00'),(24,4,37,'thế biển máy','Thuê kim là đập vàng dép đang.\nHết gì em.','28-03-2022 19:12:00',90,'28-03-2022 19:12:00'),(25,8,13,'quê ghế thế','Ừ gió làm được nhà cái quê.\nNgọt làm tôi ngọt được gì thế anh cửa giết.\nTàu ừ gió tui mua may đồng.','28-03-2022 19:12:00',88,'28-03-2022 19:12:00'),(26,5,77,'kim viết hết','Cửa tàu tủ là á việc khoảng cái.\nNón khoảng gió vẽ trời vẽ leo may thì.','28-03-2022 19:12:00',24,'28-03-2022 19:12:00'),(27,1,5,'trời nước việc','Leo ghét một kim nghỉ quê.\nThôi lỗi thương năm.\nKhoan xuồng đá máy không.\nNón á tôi.','28-03-2022 19:12:00',45,'28-03-2022 19:12:00'),(28,6,50,'đỏ mua ngọt','Cửa ngọt giết gì ghét chỉ ruộng vá.\nNước đánh vá bàn xe xanh ruộng nước.\nÁo thuê mua thích bạn.\nVàng năm thuyền.','28-03-2022 19:12:00',26,'28-03-2022 19:12:00'),(29,1,97,'ác ờ may núi ngủ hành sơn','Chua co description nen day la default','28-03-2022 19:12:00',42,'28-03-2022 19:12:00'),(30,1,97,'hóa may núi ngủ hành sơn','<p>Chua co description nen day la default</p>','28-03-2022 19:12:00',77,'28-03-2022 19:12:00'),(33,4,100,'Test','sss','03-05-2022 19:32:10',316,'03-05-2022 19:32:10');
/*!40000 ALTER TABLE `mytable` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'todolist','Công việc'),(2,'request','Đề xuất'),(3,'type','Loại đề xuất'),(4,'employee','Nhân viên'),(5,'department','Phòng ban'),(6,'position','Chức vụ'),(7,'inventory','Kho'),(8,'team','Đội nhóm');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'view','Xem'),(2,'create','Tạo'),(3,'update','Sửa'),(4,'delete','Xoá'),(5,'view_all','Xem hết'),(6,'update_all','Sửa hết'),(7,'delete_all','Xoá hết');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Thành viên ban quản lý KTX',1,1,-1,-1,'28-03-2022','28-03-2022',NULL,1),(2,'Giám thị',1,0,-1,-1,'28-03-2022','28-03-2022',NULL,2),(3,'Kế toán',1,0,-1,-1,'28-03-2022','28-03-2022',NULL,3),(4,'Trưởng đội 1',2,1,-1,-1,'28-03-2022','28-03-2022',NULL,4),(5,'Đội trưởng',3,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(6,'Thành viên',4,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(7,'Trưởng tầng 1',4,1,-1,-1,'28-03-2022','28-03-2022',NULL,6),(8,'Trưởng phòng sinh viên tầng 1',4,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(9,'Thành viên',5,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(10,'Trưởng tầng 2',5,1,-1,-1,'28-03-2022','28-03-2022',NULL,6),(11,'Trưởng phòng sinh viên tầng 2',5,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(12,'Thành viên',6,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(13,'Trưởng tầng 3',6,1,-1,-1,'28-03-2022','28-03-2022',NULL,6),(14,'Trưởng phòng sinh viên tầng 3',6,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(15,'Thành viên',7,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(16,'Trưởng tầng trệt',7,1,-1,-1,'28-03-2022','28-03-2022',NULL,6),(17,'Trưởng phòng sinh viên tầng trệt',7,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(18,'Thành viên',8,0,-1,-1,'28-03-2022','28-03-2022',NULL,5),(19,'Trưởng đội 2',8,1,-1,-1,'28-03-2022','28-03-2022',NULL,7),(20,'Trưởng đội nhạc cụ',NULL,1,-1,-1,'28-03-2022','28-03-2022',1,5),(21,'Thành viên',NULL,0,-1,-1,'28-03-2022','28-03-2022',1,5),(22,'Trưởng đội cắm hoa',NULL,1,-1,-1,'28-03-2022','28-03-2022',2,5),(23,'Trưởng đội bóng đá',NULL,1,-1,-1,'28-03-2022','28-03-2022',3,5),(24,'Trưởng đội bảo vệ',NULL,1,-1,-1,'28-03-2022','28-03-2022',4,5),(25,'Trưởng đội thuyết trình',NULL,1,-1,-1,'28-03-2022','28-03-2022',5,5),(26,'Trưởng ban sự kiện',9,1,-1,-1,'28-03-2022','28-03-2022',NULL,5),(27,'Trưởng ban truyền thông',10,1,-1,-1,'28-03-2022','28-03-2022',NULL,5),(28,'Sinh viên',11,1,-1,-1,'28-03-2022','28-03-2022',NULL,5),(33,'Trưởng đội',NULL,1,-1,-1,'02-05-2022 12:43:36','',6,1),(34,'Thành viên Đội 1',NULL,0,-1,-1,'02-05-2022 12:43:36','',6,5),(38,'Trưởng đội 2',NULL,1,-1,-1,'02-05-2022 15:56:54','',8,1),(39,'Thành viên',NULL,0,-1,-1,'02-05-2022 15:56:54','',8,5),(43,'dádsdsa',NULL,1,-1,-1,'02-05-2022 16:27:07','',9,5),(44,'dádsấd',NULL,0,-1,-1,'02-05-2022 16:27:07','',9,4),(45,'dâsdsadsda',NULL,0,-1,-1,'02-05-2022 16:27:07','',9,5),(47,'Trưởng',20,1,-1,-1,'03-05-2022 19:26:30','',NULL,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_employees`
--

LOCK TABLES `positions_employees` WRITE;
/*!40000 ALTER TABLE `positions_employees` DISABLE KEYS */;
INSERT INTO `positions_employees` VALUES (1,1,15),(2,2,15),(3,3,15),(4,4,15),(5,5,16),(6,6,15),(7,7,15),(8,8,15),(9,9,15),(10,10,15),(11,11,15),(12,12,15),(13,13,15),(14,14,15),(15,15,15),(16,16,7),(17,17,6),(18,18,6),(19,19,6),(20,20,6),(21,21,6),(22,22,6),(23,23,6),(24,24,6),(25,25,6),(26,26,6),(27,27,6),(28,28,6),(29,29,6),(30,30,6),(31,31,10),(32,32,9),(33,33,9),(34,34,9),(35,35,9),(36,36,9),(37,37,9),(38,38,9),(39,39,9),(40,40,9),(41,41,9),(42,42,9),(43,43,9),(44,44,9),(45,45,9),(46,46,13),(47,47,12),(48,48,12),(49,49,12),(50,50,12),(51,51,12),(52,52,12),(53,53,12),(54,54,12),(55,55,12),(56,56,12),(57,57,12),(58,58,12),(59,59,12),(60,60,12),(61,61,1),(62,62,2),(63,63,2),(64,64,2),(65,65,2),(66,66,2),(67,67,2),(68,68,2),(69,69,2),(70,70,2),(71,71,2),(72,72,2),(73,73,2),(74,74,2),(75,75,2),(76,76,4),(77,77,5),(78,78,5),(79,79,5),(80,80,5),(81,81,5),(82,82,5),(83,83,5),(84,84,5),(85,85,5),(86,86,5),(87,87,5),(88,88,5),(89,89,5),(90,90,5),(91,91,19),(92,92,6),(93,93,6),(94,94,6),(95,95,6),(96,96,6),(97,97,6),(98,98,6),(99,99,6),(115,100,6),(131,104,5),(132,104,21),(133,104,17),(134,105,6),(135,107,9),(136,108,15),(137,109,12),(138,110,6),(139,111,12),(140,112,15),(141,113,6),(142,114,6),(143,115,12),(144,116,6),(145,117,12),(146,118,12),(147,119,15),(148,120,12),(149,121,6),(151,123,12),(152,124,12),(153,125,6),(154,126,9),(155,127,15),(156,128,6),(157,129,9),(158,130,12),(159,131,12),(160,132,12),(161,133,15),(162,134,15),(163,135,15),(164,136,15),(165,137,15),(166,138,15),(167,139,12),(168,140,9),(169,141,9),(170,142,15),(171,143,15),(172,144,12),(173,145,12),(174,146,12),(175,147,6),(176,148,15),(177,149,15),(178,150,15),(179,151,6),(180,152,12),(181,153,6),(182,154,12),(183,155,9),(184,156,15),(185,157,9),(186,158,15),(187,159,12),(188,160,15),(189,161,9),(190,162,12),(191,163,15),(192,164,9),(193,165,15),(194,166,15),(195,167,12),(196,168,6),(197,169,15),(198,170,6),(199,171,9),(200,172,6),(201,173,12),(202,174,6),(203,175,12),(204,176,12),(205,177,15),(206,178,15),(207,179,15),(208,180,6),(209,181,9),(210,182,12),(211,183,12),(212,184,12),(213,185,15),(214,186,15),(215,187,6),(216,188,9),(217,189,12),(218,190,12),(219,191,15),(220,192,6),(221,193,6),(222,194,12),(223,195,12),(224,196,12),(225,197,9),(226,198,15),(227,199,6),(228,200,6),(229,201,9),(230,202,15),(231,203,12),(232,204,15),(233,205,12),(234,206,12),(235,207,15),(236,208,15),(237,209,6),(238,210,6),(239,211,9),(240,212,12),(241,213,12),(242,214,15),(243,215,6),(244,216,9),(245,217,12),(246,218,12),(247,219,15),(248,220,15),(249,221,12),(250,222,12),(251,223,6),(252,224,6),(253,225,12),(254,226,15),(255,227,6),(256,228,6),(257,229,6),(258,230,15),(259,231,15),(260,232,12),(261,233,12),(262,234,15),(263,235,6),(264,236,9),(265,237,15),(266,238,15),(267,239,6),(268,240,12),(269,241,9),(270,242,6),(271,243,15),(272,244,12),(273,245,15),(274,246,15),(275,247,12),(276,248,12),(277,249,15),(278,250,12),(279,251,6),(280,252,15),(281,253,6),(282,254,6),(283,255,12),(284,256,15),(285,257,12),(286,258,6),(287,259,9),(288,260,6),(289,261,12),(290,262,6),(291,263,6),(292,264,15),(293,265,15),(294,266,9),(295,267,12),(296,268,12),(297,269,12),(298,270,12),(299,271,15),(300,272,15),(301,273,15),(302,274,15),(303,275,15),(304,276,6),(305,277,9),(306,278,6),(307,279,6),(308,280,9),(309,281,15),(310,282,9),(311,283,6),(312,284,15),(313,285,6),(314,286,12),(315,287,9),(316,288,12),(317,289,15),(318,290,12),(319,291,15),(320,292,15),(321,293,6),(322,294,6),(323,295,6),(324,296,15),(325,297,9),(326,298,12),(327,299,9),(328,300,6),(329,301,9),(330,302,12),(331,303,6),(332,304,12),(333,305,12),(334,306,15),(335,307,9),(336,308,12),(337,309,15),(338,310,12),(339,311,12),(340,312,15),(341,313,9),(342,314,12),(343,315,15),(344,316,9),(345,317,15),(346,318,15),(347,319,15),(348,320,12),(349,321,15),(350,322,15),(351,323,6),(352,324,6),(353,325,12),(354,326,12),(355,327,12),(356,328,9),(357,329,9),(358,330,6),(359,331,12),(360,332,12),(361,333,9),(362,334,12),(363,335,6),(364,336,6),(365,337,9),(366,338,12),(367,339,15),(368,340,15),(369,341,6),(370,342,6),(371,343,12),(372,344,6),(373,345,12),(374,346,6),(375,347,15),(376,348,9),(377,349,12),(378,350,15),(379,351,15),(401,356,34),(402,356,1),(403,356,17),(404,122,4),(405,122,1),(406,122,8),(407,122,9);
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
  KEY `fk_role_details_permissions1_idx` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_details`
--

LOCK TABLES `role_details` WRITE;
/*!40000 ALTER TABLE `role_details` DISABLE KEYS */;
INSERT INTO `role_details` VALUES (1,1,5,1,-1,-1,'28-03-2022','28-03-2022'),(2,1,5,2,-1,-1,'28-03-2022','28-03-2022'),(3,1,5,3,-1,-1,'28-03-2022','28-03-2022'),(4,1,5,4,-1,-1,'28-03-2022','28-03-2022'),(5,2,5,1,-1,-1,'28-03-2022','28-03-2022'),(6,2,5,2,-1,-1,'28-03-2022','28-03-2022'),(7,2,5,3,-1,-1,'28-03-2022','28-03-2022'),(8,2,5,4,-1,-1,'28-03-2022','28-03-2022'),(9,4,5,1,-1,-1,'28-03-2022','28-03-2022'),(10,5,5,1,-1,-1,'28-03-2022','28-03-2022'),(11,1,4,1,-1,-1,'28-03-2022','28-03-2022'),(12,1,4,2,-1,-1,'28-03-2022','28-03-2022'),(13,1,4,3,-1,-1,'28-03-2022','28-03-2022'),(14,1,4,4,-1,-1,'28-03-2022','28-03-2022'),(15,1,4,5,-1,-1,'28-03-2022','28-03-2022'),(16,1,4,6,-1,-1,'28-03-2022','28-03-2022'),(17,2,4,1,-1,-1,'28-03-2022','28-03-2022'),(18,2,4,2,-1,-1,'28-03-2022','28-03-2022'),(19,2,4,3,-1,-1,'28-03-2022','28-03-2022'),(20,2,4,4,-1,-1,'28-03-2022','28-03-2022'),(21,2,4,5,-1,-1,'28-03-2022','28-03-2022'),(22,2,4,6,-1,-1,'28-03-2022','28-03-2022'),(23,4,4,1,-1,-1,'28-03-2022','28-03-2022'),(24,5,4,1,-1,-1,'28-03-2022','28-03-2022'),(25,6,4,1,-1,-1,'28-03-2022','28-03-2022'),(26,1,6,1,-1,-1,'28-03-2022','28-03-2022'),(27,1,6,2,-1,-1,'28-03-2022','28-03-2022'),(28,1,6,3,-1,-1,'28-03-2022','28-03-2022'),(29,1,6,4,-1,-1,'28-03-2022','28-03-2022'),(30,2,6,1,-1,-1,'28-03-2022','28-03-2022'),(31,2,6,2,-1,-1,'28-03-2022','28-03-2022'),(32,2,6,3,-1,-1,'28-03-2022','28-03-2022'),(33,2,6,4,-1,-1,'28-03-2022','28-03-2022'),(34,4,6,1,-1,-1,'28-03-2022','28-03-2022'),(35,5,6,1,-1,-1,'28-03-2022','28-03-2022'),(36,6,6,1,-1,-1,'28-03-2022','28-03-2022'),(37,1,1,1,-1,-1,'28-03-2022','28-03-2022'),(38,1,2,1,-1,-1,'28-03-2022','28-03-2022'),(39,1,3,1,-1,-1,'28-03-2022','28-03-2022'),(40,1,7,1,-1,-1,'28-03-2022','28-03-2022');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (2,2,57,'cửa á ác','Được vá không quần.','28-03-2022 19:12:00',24,'28-03-2022 19:12:00'),(3,5,4,'tủ bè vẽ','Lỗi tám đồng làm mượn.\nKhông đang một mười bàn bảy tôi.\nRuộng áo tô đạp hàng.','28-03-2022 19:12:00',72,'28-03-2022 19:12:00'),(5,4,43,'chín đang may','Thương gì khâu chết dép chết ghét.\nBiển năm nha đập quần.\nViệc bảy vàng nhà dép đạp giày thì.','28-03-2022 19:12:00',35,'28-03-2022 19:12:00'),(6,8,8,'quê thuê trời','Đá may vẽ cửa không tô ghét.','28-03-2022 19:12:00',79,'28-03-2022 19:12:00'),(7,4,88,'đập tô tàu','Máy hết ghế leo đỏ hai gió.\nHai yêu xuồng tàu trăng thích đánh mua.\nBiết bè đạp.\nNgọt núi hàng á tui xuồng dép.','28-03-2022 19:12:00',9,'28-03-2022 19:12:00'),(8,8,33,'xuồng đâu lỗi','Việc tàu quê kim nghỉ xe.\nViệc tui sáu khâu khoan.','28-03-2022 19:12:00',26,'28-03-2022 19:12:00'),(9,7,85,'thuê được trăng','Cái năm nước mượn biển lỗi bơi xuồng ờ không.','28-03-2022 19:12:00',93,'28-03-2022 19:12:00'),(10,4,52,'mười biết áo','Bè tàu gì tủ ngọt xe quần bảy.','28-03-2022 19:12:00',41,'28-03-2022 19:12:00'),(11,4,11,'thuê vàng trời','Cửa mượn mua thì ba kim hết bảy mượn leo.','28-03-2022 19:12:00',88,'28-03-2022 19:12:00'),(12,5,9,'biển ruộng gió','Biết bàn viết bơi.','28-03-2022 19:12:00',67,'28-03-2022 19:12:00'),(13,7,18,'ờ bảy phá','Chỉ phá vẽ một chín một hết đâu.\nHết quê ruộng viết.','28-03-2022 19:12:00',77,'28-03-2022 19:12:00'),(14,9,58,'là khoảng biển','Yêu ác hàng thuyền yêu lầu.\nÁo ruộng chỉ thôi sáu núi.\nMây ác trăng anh bạn việc may vàng.','28-03-2022 19:12:00',99,'28-03-2022 19:12:00'),(15,8,44,'chỉ đã thì','Vá bơi trời trăng.\nGió vàng nha nước ghế quần anh chìm.\nGì ruộng đạp thôi tím.\nBơi khoảng đồng sáu.','28-03-2022 19:12:00',53,'28-03-2022 19:12:00'),(16,9,67,'hai thuyền xe','Đang em ghét nước thế lầu xe may.\nNúi vàng một độc.\nVá tím nước.','28-03-2022 19:12:00',44,'28-03-2022 19:12:00'),(17,1,97,'yêu biết tủ áo','<p>Hai áo cửa ờ tôi trời đã đang chỉ. Hết gì ngọt đánh vẽ đang được chết tím. Tủ hết vá hết. Vàng mua thuê làm mướn ghét. Tui chín viết bạn mướn thuê.</p>','28-03-2022 19:12:00',42,'28-03-2022 19:12:00'),(18,6,16,'vẽ yêu xuồng','Đã mượn đã.\nGhế hai chết kim làm năm em biển mượn.\nThuê hàng hết máy làm tô đạp chỉ tô viết.\nĐập đá anh ờ nghỉ thế.','28-03-2022 19:12:00',74,'28-03-2022 19:12:00'),(19,5,55,'đồng em xuồng','Áo bảy thuyền hóa là bạn thuê gió.\nLeo xuồng thì việc tui ngọt á nhà làm.\nGhế mười làm dép.\nLỗi xanh yêu cái.','28-03-2022 19:12:00',61,'28-03-2022 19:12:00'),(20,3,60,'hết nước lầu','Quần đồng máy chỉ.\nBạn ghét khoan hết.\nPhá bốn năm leo.\nMây vàng bạn ghét hai là.','28-03-2022 19:12:00',16,'28-03-2022 19:12:00'),(21,9,20,'dép lầu hương','Hết ba thì ừ núi thì được.\nHết bạn vàng vàng không quần trăng đánh không.\nQuê đá đồng nón xanh.','28-03-2022 19:12:00',39,'28-03-2022 19:12:00'),(22,9,60,'phá thôi đồng','Chìm thế núi tàu ghét mướn hương bơi ghế.\nMướn giết thôi.','28-03-2022 19:12:00',84,'28-03-2022 19:12:00'),(23,2,73,'một nghỉ tô','Đồng thôi lỗi.\nTủ tím chết biển chỉ thế ừ không mười.\nNăm đang tím phá thì năm ờ con mười.','28-03-2022 19:12:00',2,'28-03-2022 19:12:00'),(24,4,37,'thế biển máy','Thuê kim là đập vàng dép đang.\nHết gì em.','28-03-2022 19:12:00',90,'28-03-2022 19:12:00'),(25,8,13,'quê ghế thế','Ừ gió làm được nhà cái quê.\nNgọt làm tôi ngọt được gì thế anh cửa giết.\nTàu ừ gió tui mua may đồng.','28-03-2022 19:12:00',88,'28-03-2022 19:12:00'),(26,5,77,'kim viết hết','Cửa tàu tủ là á việc khoảng cái.\nNón khoảng gió vẽ trời vẽ leo may thì.','28-03-2022 19:12:00',24,'28-03-2022 19:12:00'),(27,1,5,'trời nước việc','Leo ghét một kim nghỉ quê.\nThôi lỗi thương năm.\nKhoan xuồng đá máy không.\nNón á tôi.','28-03-2022 19:12:00',45,'28-03-2022 19:12:00'),(28,6,50,'đỏ mua ngọt','Cửa ngọt giết gì ghét chỉ ruộng vá.\nNước đánh vá bàn xe xanh ruộng nước.\nÁo thuê mua thích bạn.\nVàng năm thuyền.','28-03-2022 19:12:00',26,'28-03-2022 19:12:00'),(29,1,97,'ác ờ may núi ngủ hành sơn','Chua co description nen day la default','28-03-2022 19:12:00',42,'28-03-2022 19:12:00'),(30,1,97,'hóa may núi ngủ hành sơn','<p>Chua co description nen day la default</p>','28-03-2022 19:12:00',77,'28-03-2022 19:12:00'),(33,4,100,'Test','sss','03-05-2022 19:32:10',316,'03-05-2022 19:32:10'),(35,1,19,'Sửa quạt 001','Quạt tạm thời xài được','24-04-2022 21:10:54',5,'');
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
INSERT INTO `teams` VALUES (1,'\"\"','Đội nhạc cụ',100,-1,-1,'10-11-2022','10-11-2022','10-11-2022'),(2,'\"\"','Đội cắm hoa',100,-1,-1,'10-11-2022','10-11-2022','10-11-2022'),(3,'\"\"','Đội bóng đá',-1,-1,-1,'10-11-2022','10-11-2022','10-11-2022'),(4,'\"\"','Đội bảo vệ',-1,-1,-1,'10-11-2022','10-11-2022','10-11-2022'),(5,'\"\"','CLB thuyết trình',-1,-1,-1,'10-11-2022','10-11-2022','10-11-2022'),(6,'TEAM01','Đội 1',33,-1,-1,'02-05-2022 12:43:36','','Đội sửa chữa và CNTT'),(7,'dadsấ','dsadsads',-1,-1,-1,'02-05-2022 13:56:36','','dádáds'),(8,'TEAM02','Đội 2',38,-1,-1,'02-05-2022 15:56:54','','Đội làm nhiệm vụ điểm danh'),(9,'dád','dádsadsấd',43,-1,-1,'02-05-2022 16:27:07','','dádsấdsadsda');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_employees`
--

LOCK TABLES `teams_employees` WRITE;
/*!40000 ALTER TABLE `teams_employees` DISABLE KEYS */;
INSERT INTO `teams_employees` VALUES (55,1,104),(63,6,356);
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

-- Dump completed on 2022-05-07 18:32:43

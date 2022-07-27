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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approval_step_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_approval_step_details_approval_steps1_idx` (`approval_step_id`),
  CONSTRAINT `fk_approval_step_details_approval_steps1` FOREIGN KEY (`approval_step_id`) REFERENCES `approval_steps` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_step_details`
--

LOCK TABLES `approval_step_details` WRITE;
/*!40000 ALTER TABLE `approval_step_details` DISABLE KEYS */;
INSERT INTO `approval_step_details` VALUES (1,1,1,3,16),(2,1,2,1,7),(3,1,3,-1,10),(4,1,-1,4,13),(5,3,45,-1,-1),(6,2,45,-1,-1);
/*!40000 ALTER TABLE `approval_step_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approval_steps`
--

DROP TABLE IF EXISTS `approval_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `approval_steps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approval_step_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `approval_step_index` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `proposal_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_approval_steps_proposal_types1_idx` (`proposal_type_id`),
  CONSTRAINT `fk_approval_steps_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_steps`
--

LOCK TABLES `approval_steps` WRITE;
/*!40000 ALTER TABLE `approval_steps` DISABLE KEYS */;
INSERT INTO `approval_steps` VALUES (1,'Phê duyệt','1',1),(2,'Kế toán','1',2),(3,'Kiểm tra','2',1);
/*!40000 ALTER TABLE `approval_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `permission` tinyint(4) NOT NULL DEFAULT '0',
  `active_flag` tinyint(4) NOT NULL DEFAULT '0',
  `create_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `update_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'Textarea'),(2,'Dropdown'),(3,'Radio'),(4,'Checkbox'),(5,'Number'),(6,'Calculator'),(7,'Relation'),(8,'Attachment'),(9,'Datetime'),(10,'Repeater'),(11,'Label');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `farther_department_id` int(11) NOT NULL DEFAULT '-1',
  `create_by` int(11) NOT NULL DEFAULT '-1',
  `modify_by` int(11) NOT NULL DEFAULT '-1',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `level` int(11) NOT NULL,
  `head_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`code`),
  KEY `fk_parentDep_idx` (`farther_department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'1','Ban Quản Lý KTX Cỏ May',-1,-1,-1,'2022-03-28','2022-03-28','test',1,1),(2,'2','Đội sửa chữa',2,-1,-1,'2022-03-28','2022-03-28','test',3,5),(3,'3','Tầng 1',2,-1,-1,'2022-03-28','2022-03-28','test',3,7),(4,'4','Tầng 2',2,-1,-1,'2022-03-28','2022-03-28','test',3,10),(5,'5','Tầng 3',2,-1,-1,'2022-03-28','2022-03-28','test',3,13),(6,'6','Tầng trệt',2,-1,-1,'2022-03-28','2022-03-28','test',3,16),(7,'7','Kiểm tra và giám sát sinh viên',1,-1,-1,'2022-03-28','2022-03-28','test',2,19),(8,'8','Tổ chức sự kiện',1,-1,-1,'2022-03-28','2022-03-28','test',2,NULL),(9,'9','Truyền thông',1,-1,-1,'2022-03-28','2022-03-28','test',2,NULL),(10,'10','Sinh viên',1,-1,-1,'2022-03-28','2022-03-28','test',2,NULL),(11,'Test','AAA',-1,-1,-1,'2022-03-28','2022-03-28','dadss',4,-1),(12,'111','111',-1,-1,-1,'2022-03-28','2022-03-28','111',1,-1),(13,'dádadsa','dáđá',0,-1,-1,'2022-03-28','2022-03-28','dáđas',-1,-1),(14,'PB01','Ban quản trị',8,-1,-1,'2022-03-28','2022-03-28','Quản lý thông tin sinh viên',3,-1),(15,'PBF1','Quản trị phòng ban',8,-1,-1,'2022-03-28','2022-03-28','',3,47),(16,'DH865','Đội điều hành 1',-1,-1,-1,'2022-07-16 02:04:52','','Điều hành giám sát hoạt động ra vào ktx',-1,-1),(17,'DH8651','Đội điều hành 1',2,-1,-1,'2022-07-16 02:06:39','','Điều hành giám sát hoạt động ra vào ktx',-1,-1),(18,'DH86511','Đội điều hành 1',0,-1,-1,'2022-07-16 02:09:44','','Điều hành giám sát hoạt động ra vào ktx',-1,-1),(19,'DH865111','Đội điều hành 1',-1,-1,-1,'2022-07-16 02:09:55','','Điều hành giám sát hoạt động ra vào ktx',-1,-1),(20,'DH865121','Đội điều hành 1',0,-1,-1,'2022-07-16 02:10:19','','Điều hành giám sát hoạt động ra vào ktx',-1,-1);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments_employees`
--

DROP TABLE IF EXISTS `departments_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `departments_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_department_id_idx` (`department_id`),
  KEY `fk_employee_id_idx` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=470 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments_employees`
--

LOCK TABLES `departments_employees` WRITE;
/*!40000 ALTER TABLE `departments_employees` DISABLE KEYS */;
INSERT INTO `departments_employees` VALUES (1,7,1),(2,7,2),(3,7,3),(4,7,4),(5,7,5),(6,7,6),(7,7,7),(8,7,8),(9,7,9),(10,7,10),(11,7,11),(12,7,12),(13,7,13),(14,7,14),(15,7,15),(16,4,16),(17,4,17),(18,4,18),(19,4,19),(20,4,20),(21,4,21),(22,4,22),(23,4,23),(24,4,24),(25,4,25),(26,4,26),(27,4,27),(28,4,28),(29,4,29),(30,4,30),(31,5,31),(32,5,32),(33,5,33),(34,5,34),(35,5,35),(36,5,36),(37,5,37),(38,5,38),(39,5,39),(40,5,40),(41,5,41),(42,5,42),(43,5,43),(44,5,44),(45,5,45),(46,6,46),(47,6,47),(48,6,48),(49,6,49),(50,6,50),(51,6,51),(52,6,52),(53,6,53),(54,6,54),(55,6,55),(56,6,56),(57,6,57),(58,6,58),(59,6,59),(60,6,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,3,76),(77,3,77),(78,3,78),(79,3,79),(80,3,80),(81,3,81),(82,3,82),(83,3,83),(84,3,84),(85,3,85),(86,3,86),(87,3,87),(88,3,88),(89,3,89),(90,3,90),(91,8,91),(92,8,92),(93,8,93),(94,8,94),(95,8,95),(96,8,96),(97,8,97),(98,8,98),(99,8,99),(100,1,100),(101,4,1),(102,5,100),(103,5,2),(104,5,60),(117,3,104),(118,7,104),(119,4,105),(120,5,107),(121,7,108),(122,6,109),(123,4,110),(124,6,111),(125,7,112),(126,4,113),(127,4,114),(128,6,115),(129,4,116),(130,6,117),(131,6,118),(132,7,119),(133,6,120),(134,4,121),(136,6,123),(137,6,124),(138,4,125),(139,5,126),(140,7,127),(141,4,128),(142,5,129),(143,6,130),(144,6,131),(145,6,132),(146,7,133),(147,7,134),(148,7,135),(149,7,136),(150,7,137),(151,7,138),(152,6,139),(153,5,140),(154,5,141),(155,7,142),(156,7,143),(157,6,144),(158,6,145),(159,6,146),(160,4,147),(161,7,148),(162,7,149),(163,7,150),(164,4,151),(165,6,152),(166,4,153),(167,6,154),(168,5,155),(169,7,156),(170,5,157),(171,7,158),(172,6,159),(173,7,160),(174,5,161),(175,6,162),(176,7,163),(177,5,164),(178,7,165),(179,7,166),(180,6,167),(181,4,168),(182,7,169),(183,4,170),(184,5,171),(185,4,172),(186,6,173),(187,4,174),(188,6,175),(189,6,176),(190,7,177),(191,7,178),(192,7,179),(193,4,180),(194,5,181),(195,6,182),(196,6,183),(197,6,184),(198,7,185),(199,7,186),(200,4,187),(201,5,188),(202,6,189),(203,6,190),(204,7,191),(205,4,192),(206,4,193),(207,6,194),(208,6,195),(209,6,196),(210,5,197),(211,7,198),(212,4,199),(213,4,200),(214,5,201),(215,7,202),(216,6,203),(217,7,204),(218,6,205),(219,6,206),(220,7,207),(221,7,208),(222,4,209),(223,4,210),(224,5,211),(225,6,212),(226,6,213),(227,7,214),(228,4,215),(229,5,216),(230,6,217),(231,6,218),(232,7,219),(233,7,220),(234,6,221),(235,6,222),(236,4,223),(237,4,224),(238,6,225),(239,7,226),(240,4,227),(241,4,228),(242,4,229),(243,7,230),(244,7,231),(245,6,232),(246,6,233),(247,7,234),(248,4,235),(249,5,236),(250,7,237),(251,7,238),(252,4,239),(253,6,240),(254,5,241),(255,4,242),(256,7,243),(257,6,244),(258,7,245),(259,7,246),(260,6,247),(261,6,248),(262,7,249),(263,6,250),(264,4,251),(265,7,252),(266,4,253),(267,4,254),(268,6,255),(269,7,256),(270,6,257),(271,4,258),(272,5,259),(273,4,260),(274,6,261),(275,4,262),(276,4,263),(277,7,264),(278,7,265),(279,5,266),(280,6,267),(281,6,268),(282,6,269),(283,6,270),(284,7,271),(285,7,272),(286,7,273),(287,7,274),(288,7,275),(289,4,276),(290,5,277),(291,4,278),(292,4,279),(293,5,280),(294,7,281),(295,5,282),(296,4,283),(297,7,284),(298,4,285),(299,6,286),(300,5,287),(301,6,288),(302,7,289),(303,6,290),(304,7,291),(305,7,292),(306,4,293),(307,4,294),(308,4,295),(309,7,296),(310,5,297),(311,6,298),(312,5,299),(313,4,300),(314,5,301),(315,6,302),(316,4,303),(317,6,304),(318,6,305),(319,7,306),(320,5,307),(321,6,308),(322,7,309),(323,6,310),(324,6,311),(325,7,312),(326,5,313),(327,6,314),(328,7,315),(329,5,316),(330,7,317),(331,7,318),(332,7,319),(333,6,320),(334,7,321),(335,7,322),(336,4,323),(337,4,324),(338,6,325),(339,6,326),(340,6,327),(341,5,328),(342,5,329),(343,4,330),(344,6,331),(345,6,332),(346,5,333),(347,6,334),(348,4,335),(349,4,336),(350,5,337),(351,6,338),(352,7,339),(353,7,340),(354,4,341),(355,4,342),(356,6,343),(357,4,344),(358,6,345),(359,4,346),(360,7,347),(361,5,348),(362,6,349),(363,7,350),(364,7,351),(382,1,122),(383,4,122),(384,5,122),(464,7,356),(465,4,356),(466,7,365),(467,4,365),(468,7,366),(469,4,366);
/*!40000 ALTER TABLE `departments_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `date_of_birth` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `phone_number` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `active_flag` tinyint(4) NOT NULL DEFAULT '1',
  `gender` int(11) NOT NULL DEFAULT '0' COMMENT '"M" or "F"',
  `avatar` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `password` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `enable_login` tinyint(4) NOT NULL DEFAULT '0',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `create_by` int(11) NOT NULL DEFAULT '-1',
  `modify_by` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'1','Ðức Chính Đoàn','2022-03-01','nvctoan@gmail.com','0269 0386 9201','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nvctoan@gmail.com','$2a$10$QZxi..iXw2qJvDnyOA132.ry.4HC333acpDfY9s24ZTMHJ9bMCTkO',0,1,-1,-1),(2,'2','Đông Nghi Đoàn','2022-03-01','PhngTrinh.Bi26@yahoo.com','0249 6226 0641','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','PhngTrinh.Bi26@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(3,'3','Thùy Oanh Mai MD','2022-03-01','KhnhChi60@yahoo.com','0295 3306 3990','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KhnhChi60@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(4,'4','Sơn Quyền Hoàng','2022-03-01','ThoQuyn95@yahoo.com','0252 3525 4277','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThoQuyn95@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(5,'5','Hoài Thương Phùng','2022-03-01','AnhVit.V@yahoo.com','029 1419 1954','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','AnhVit.V@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(6,'6','Miss Ái Linh Phùng','2022-03-01','ThanhKiu27@hotmail.com','020 8540 6847','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThanhKiu27@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(7,'7','Ðan Quỳnh Tô','2022-03-01','HongSa15@yahoo.com','023 1443 4607','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HongSa15@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(8,'8','Bảo Tín Phùng','2022-03-01','GiangThin_T@gmail.com','021 8246 3839','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','GiangThin_T@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(9,'9','Phước Bình Phạm','2022-03-01','HongHip_Phm@yahoo.com','0223 8350 5531','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HongHip_Phm@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(10,'10','Diễm Trinh Trần','2022-03-01','HongNgn_Nguyn@gmail.com','021 0099 0911','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HongNgn_Nguyn@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(11,'11','Quang Dương Lý','2022-03-01','XunHiu.Lm@yahoo.com','0239 4500 2897','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','XunHiu.Lm@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(12,'12','Dr. Thanh Tuyết Trần','2022-03-01','ThuVit_inh78@yahoo.com','0209 6015 8608','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThuVit_inh78@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(13,'13','Hồ Nam Hoàng','2022-03-01','XunQu8@hotmail.com','020 0696 7709','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','XunQu8@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(14,'14','Thiếu Anh Đào','2022-03-01','KinBnh89@hotmail.com','0203 1346 1053','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KinBnh89@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(15,'15','Minh Mẫn Đoàn','2022-03-01','Hunh.Phan30@yahoo.com','021 4694 2150','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hunh.Phan30@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(16,'16','Ðức Quyền Hồ','2022-03-01','VnNhi_Tng@hotmail.com','024 6837 2044','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','VnNhi_Tng@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(17,'17','Gia Thiện Đinh','2022-03-01','KimKhuyn.T73@hotmail.com','0283 3870 7783','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KimKhuyn.T73@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(18,'18','Quỳnh Lâm Lâm IV','2022-03-01','PhngThanh.Hong@gmail.com','0264 8177 9771','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','PhngThanh.Hong@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(19,'19','Ms. Việt Huy Mai','2022-03-01','TUyn97@hotmail.com','026 2736 7901','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TUyn97@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(20,'20','Thiện Sinh Vũ','2022-03-01','Hut.Trng@hotmail.com','026 7170 5151','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hut.Trng@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(21,'21','Hương Mai Tăng','2022-03-01','TunHong40@hotmail.com','0242 4384 0246','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TunHong40@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(22,'22','Nam An Trương','2022-03-01','BchTr_Phng11@gmail.com','0272 5099 6423','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','BchTr_Phng11@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(23,'23','Ái Linh Mai','2022-03-01','KimHng.Mai@gmail.com','0255 6369 3736','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KimHng.Mai@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(24,'24','Hồng Nhật Trịnh I','2022-03-01','ThinKim94@gmail.com','0214 9858 6417','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThinKim94@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(25,'25','Bình Dân Vương Sr.','2022-03-01','CngLc_H@gmail.com','0210 9639 2455','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','CngLc_H@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(26,'26','Lương Thiện Phan','2022-03-01','PhngHoa41@gmail.com','0212 4485 5898','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','PhngHoa41@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(27,'27','Phú Ân Dương III','2022-03-01','DimMy_Dng15@gmail.com','026 2348 6108','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','DimMy_Dng15@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(28,'28','Vân Quyên Nguyễn IV','2022-03-01','PhiNhn31@hotmail.com','026 9359 7959','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','PhiNhn31@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(29,'29','Thế Tường Hồ','2022-03-01','ChiuPhong_Vng88@hotmail.com','0208 4194 1271','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ChiuPhong_Vng88@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(30,'30','Trúc Lam Tăng DDS','2022-03-01','HoMi_H72@yahoo.com','023 0200 9314','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HoMi_H72@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(31,'31','Công Bằng Vương','2022-03-01','QucTun.Mai@hotmail.com','023 1408 6450','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','QucTun.Mai@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(32,'32','Mrs. Diễm Uyên Tô','2022-03-01','HngQu_Ng@hotmail.com','0265 2843 3246','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HngQu_Ng@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(33,'33','Miss Đinh Hương Trịnh','2022-03-01','MHip.Phng21@yahoo.com','029 2829 1524','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','MHip.Phng21@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(34,'34','Ðình Dương Đỗ','2022-03-01','ngHi29@yahoo.com','0258 2682 3601','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ngHi29@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(35,'35','Mrs. Anh Quân Ngô','2022-03-01','NgcHuy_V69@hotmail.com','022 1982 7498','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','NgcHuy_V69@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(36,'36','Nam Thông Lý','2022-03-01','ThcTm11@yahoo.com','020 3561 5187','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThcTm11@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(37,'37','Miss Thanh Thúy Vũ','2022-03-01','ThiThi.Dng@yahoo.com','0294 5768 6398','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThiThi.Dng@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(38,'38','Ngọc Liên Đào','2022-03-01','ThanhHoa74@gmail.com','0245 3926 0583','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThanhHoa74@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(39,'39','Ms. Long Vịnh Phùng','2022-03-01','ThuThun_Ng@yahoo.com','027 6713 9007','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThuThun_Ng@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(40,'40','Minh Tân Lê','2022-03-01','ThchTho.on@hotmail.com','0222 4191 4468','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThchTho.on@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(41,'41','Ngọc Thi Hoàng','2022-03-01','DuyTn_Hong8@yahoo.com','023 3022 5329','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','DuyTn_Hong8@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(42,'42','Tuyết Hương Lâm','2022-03-01','ThnhCng55@gmail.com','025 3052 3429','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThnhCng55@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(43,'43','Xuân Cung Đào','2022-03-01','KimLin70@gmail.com','024 9331 2914','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','KimLin70@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(44,'44','Bảo Huỳnh Vũ','2022-03-01','HuTon11@hotmail.com','0211 9197 0241','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HuTon11@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(45,'45','Nhật Hoàng Lý','2022-03-01','CngHi_T@yahoo.com','0289 7740 2287','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','CngHi_T@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(46,'46','Hồng Ðào Phạm','2022-03-01','BuChng.Mai@yahoo.com','0292 9362 5626','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','BuChng.Mai@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(47,'47','Tường Vi Lê','2022-03-01','ThyTin77@hotmail.com','0283 1862 5655','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThyTin77@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(48,'48','Hữu Hiệp Ngô','2022-03-01','NhtLan.ng@hotmail.com','025 9647 5024','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','NhtLan.ng@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(49,'49','Trân Châu Hà','2022-03-01','SongLam.Tng22@hotmail.com','0272 1933 9777','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','SongLam.Tng22@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(50,'50','Tuấn Khải Tăng','2022-03-01','HongDu_H16@yahoo.com','0274 0084 2384','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HongDu_H16@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(51,'51','Quốc Hoài Phan','2022-03-01','QucHi.Tng72@gmail.com','026 5716 7339','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','QucHi.Tng72@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(52,'52','Đan Thư Hoàng','2022-03-01','HngChi_Tng14@yahoo.com','024 9037 8913','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HngChi_Tng14@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(53,'53','Trung Anh Dương','2022-03-01','nhTrung.o75@hotmail.com','0238 6394 3809','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nhTrung.o75@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(54,'54','Hoàng Xuân Đinh','2022-03-01','cTu.Trn78@yahoo.com','0273 5542 8124','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','cTu.Trn78@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(55,'55','Hoàng Việt Lâm','2022-03-01','BchChiu33@yahoo.com','0291 0305 8252','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','BchChiu33@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(56,'56','Cát Uy Đào Jr.','2022-03-01','TngLinh32@gmail.com','0243 4271 7880','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','TngLinh32@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(57,'57','Gia Huy Bùi','2022-03-01','KhiTm.Tng26@gmail.com','0239 4644 7267','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','KhiTm.Tng26@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(58,'58','Thanh Tùng Hồ','2022-03-01','HnhTho97@gmail.com','0200 6241 9910','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','HnhTho97@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(59,'59','Bá Thịnh Hồ','2022-03-01','LongGiang.H@gmail.com','024 0370 9248','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','LongGiang.H@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(60,'60','Lan Vy Vũ','2022-03-01','ChThnh.Phan@gmail.com','024 0866 1214','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ChThnh.Phan@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(61,'61','Cẩm Thúy Phan','2022-03-01','ThanhTuyt.Vng@hotmail.com','0285 5317 5830','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThanhTuyt.Vng@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(62,'62','Mrs. Xuân Loan Vương','2022-03-01','TrngSinh_L49@gmail.com','025 9684 7733','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','TrngSinh_L49@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(63,'63','Bạch Yến Lâm','2022-03-01','KhuTrung_Phm@hotmail.com','025 8104 5074','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','KhuTrung_Phm@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(64,'64','Hồng Thư Phạm','2022-03-01','ThiDng_H@hotmail.com','0230 2764 7371','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThiDng_H@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(65,'65','Công Giang Phùng','2022-03-01','Anho31@gmail.com','026 7227 5725','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Anho31@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(66,'66','Kim Thu Tô','2022-03-01','Bnh.Bi69@gmail.com','0204 1159 6475','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Bnh.Bi69@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(67,'67','Xuân Vũ Vương','2022-03-01','ThinThanh16@yahoo.com','0235 1191 3308','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ThinThanh16@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(68,'68','Việt Khôi Ngô','2022-03-01','CngNgh.ng36@hotmail.com','024 6593 9969','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','CngNgh.ng36@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(69,'69','Kim Hoàng Hồ','2022-03-01','BchDuyn_Ng41@hotmail.com','0235 0962 8878','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','BchDuyn_Ng41@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(70,'70','Mai Vy Phạm','2022-03-01','KhiH.Dng59@hotmail.com','024 8400 8120','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','KhiH.Dng59@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(71,'71','Gia Huấn Hoàng','2022-03-01','XunTho.o0@gmail.com','0216 6095 7658','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','XunTho.o0@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(72,'72','Mỹ Dung Tô','2022-03-01','NguytH58@yahoo.com','0265 6242 7634','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','NguytH58@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(73,'73','Ngọc Lâm Đào','2022-03-01','HipHa.H@hotmail.com','027 0435 7587','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HipHa.H@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(74,'74','Hồng Đăng Đào','2022-03-01','ThanhUyn61@yahoo.com','0287 2248 1031','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThanhUyn61@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(75,'75','Viễn Thông Bùi','2022-03-01','cSiu.Hong@yahoo.com','022 2068 2796','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','cSiu.Hong@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(76,'76','Uyên Minh Dương','2022-03-01','TunDng12@gmail.com','029 7980 6994','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TunDng12@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(77,'77','Tú Uyên Phạm','2022-03-01','NgcT.Mai@gmail.com','0229 7909 6001','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','NgcT.Mai@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(78,'78','Tuấn Khanh Mai','2022-03-01','LanTrc89@hotmail.com','0277 8413 0917','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','LanTrc89@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(79,'79','Phượng Tiên Bùi','2022-03-01','TunVit_@yahoo.com','020 5928 2380','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TunVit_@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(80,'80','Nghi Dung Trịnh','2022-03-01','ChDng.Lm@yahoo.com','0229 8130 7189','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ChDng.Lm@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(81,'81','Thy Vân Dương','2022-03-01','QucThng_L@yahoo.com','0295 2213 2383','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','QucThng_L@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(82,'82','Bích Hợp Phan','2022-03-01','ThinTin.o@yahoo.com','0294 3870 9672','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThinTin.o@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(83,'83','Quốc Hòa Đào','2022-03-01','DimPhc_L@hotmail.com','0246 5833 8953','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','DimPhc_L@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(84,'84','Tường Lân Đỗ','2022-03-01','AnhTh_V84@hotmail.com','0287 3004 3561','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','AnhTh_V84@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(85,'85','Lâm Tuyền Đặng','2022-03-01','TunLinh_Trn3@yahoo.com','0237 0462 2404','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TunLinh_Trn3@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(86,'86','Thanh Vy Tăng','2022-03-01','ThyGiang79@gmail.com','021 9707 3489','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThyGiang79@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(87,'87','Hiệp Dinh Tô','2022-03-01','ThyNgc63@yahoo.com','029 8274 0835','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThyNgc63@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(88,'88','Hoàn Châu Tăng','2022-03-01','HuKhi.V29@gmail.com','0225 7332 3621','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HuKhi.V29@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(89,'89','Như Ý Hồ','2022-03-01','NgcHnh48@yahoo.com','022 1755 2052','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','NgcHnh48@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(90,'90','Huy Lĩnh Vũ DDS','2022-03-01','cTu34@yahoo.com','0269 7288 4811','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','cTu34@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(91,'91','Mrs. Duy Hạnh Phan','2022-03-01','HuynAnh.Phm50@yahoo.com','027 4688 3421','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HuynAnh.Phm50@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(92,'92','Trúc Phương Lâm','2022-03-01','TSng86@hotmail.com','020 4040 6390','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','TSng86@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(93,'93','Mrs. Hương Lan Đào','2022-03-01','XunHnh_inh@gmail.com','0212 0465 7976','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','XunHnh_inh@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(94,'94','Diệu Hiền Lâm','2022-03-01','ThinLam_Trnh@hotmail.com','023 0409 4839','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThinLam_Trnh@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(95,'95','Phương Loan Trần','2022-03-01','GiaPhong32@gmail.com','0212 9601 9964','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','GiaPhong32@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(96,'96','Cường Dũng Tô','2022-03-01','VitKhu20@yahoo.com','0226 6701 9725','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','VitKhu20@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(97,'97','Chiêu Dương Ngô','2022-03-01','HngLy_@hotmail.com','028 2471 6127','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','HngLy_@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(98,'98','Trí Hào Vương','2022-03-01','ThinLng.V8@yahoo.com','020 3229 3891','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThinLng.V8@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(99,'99','Ngọc Hạnh Tô','2022-03-01','ThanhHng.Trng@yahoo.com','0259 2042 0175','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThanhHng.Trng@yahoo.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',0,1,-1,-1),(100,'DTDC2Aa2','Nguyễn Văn Trần C','2022-03-01','ThiHng.Lm77@hotmail.com','0269 0386 9201','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThiHng.Lm77@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,1,2),(104,'SV123Edit','Ðức Chính Định Bình','2022-03-01','ThiHng.Lm77@hotmail.com','0269 0386 9201','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ThiHng.Lm77@hotmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,0,0),(105,'2021001','NGUYỄN THỊ KIM TUYẾN','2022-03-01','kimtuyen1611199@gmail.com','0395023743','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen1611199@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(107,'2022001','NGUYỄN THỊ KIM NGA','2022-03-01','kimtuyen16111991@gmail.com','0395023743','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen16111991@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(108,'2022003','NGUYỄN THỊ KIM NGHI','2022-03-01','kimtuyen16111993@gmail.com','0395023743','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen16111993@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(109,'2022005','NGUYỄN THỊ KIM DUNG','2022-03-01','kimtuyen16111995@gmail.com','0395023743','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen16111995@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(110,'2022002','NGUYỄN THỊ KIM NGHE','2022-03-01','kimtuyen16111992@gmail.com','0395023743','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen16111992@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(111,'2022004','NGUYỄN THỊ KIM TA','2022-03-01','kimtuyen16111994@gmail.com','0395023743','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen16111994@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(112,'2023198','Nguyễn Thị Băng Châu','2022-03-01','Nguyenthibangchauvn@gmail.com','0907733612','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthibangchauvn@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(113,'2023049','Lê Văn Ni','2022-03-01','Levannidc@gmail.com','0353504815','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Levannidc@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(114,'2023033','Trần Thị Ái Liên','2022-03-01','ailien200899@gmail.com','0976439508','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ailien200899@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(115,'2023161','Lê Hoàng Hương','2022-03-01','Lehoanghuong17@gmail.com','0768153899','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Lehoanghuong17@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(116,'2023052','Trịnh Thị Thanh Vỷ ','2022-03-01','trinhvy273@gmail.com ','0336601621','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','trinhvy273@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(117,'2023132','Nguyễn Thị Mỹ Lệ ','2022-03-01','nguyenmyleoh@gmail.com ','0389330803','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenmyleoh@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(118,'2023153','Lê Thu Hương','2022-03-01','17123035@st.hcmuaf.edu.vn','0854283608','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','17123035@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(119,'2023167','Phan Phú Sơn ','2022-03-01','Phanphuson9120142015@gmail.com ','0869239750','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Phanphuson9120142015@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(120,'2023096','Nguyễn Thị Vân','2022-03-01','Nguyenvan842000@gmail.com','0973168954','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenvan842000@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(121,'2023026','Lê Minh Hiếu','2022-03-01','17125089@st.hcmuaf.edu.vn','0344220591','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','17125089@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(122,'2023236','Trần Thị Yến Ly','2022-03-01','yenlytran19052001@gmail.com','0704873395','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','yenlytran19052001@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,1),(123,'2023142','Trần Thị Hương Thảo','2022-03-01','thaotth18411@st.uel.edu.vn','0343534240','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thaotth18411@st.uel.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(124,'2023095','Nguyễn Như Anh Thư','2022-03-01','anhthuuht@gmail.com','0778982356','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','anhthuuht@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(125,'2023032','Nguyễ Thị Thùy Trinh','2022-03-01','nthuytrinh1@gmail.com','0393112248','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nthuytrinh1@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(126,'2023077','Nguyễn Cẩm Như','2022-03-01','nhucam137@gmail.com','0706992532','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nhucam137@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(127,'2023238','Nguyễn Hoài Bảo','2022-03-01','nguyenbaohg18@gmail.com','0971048424','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenbaohg18@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(128,'2023002','Hồ Hữu Bình','2022-03-01','binhhuuho19@gmail.com','0395705312','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','binhhuuho19@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(129,'2023058','Nguyễn Hữu Thiết','2022-03-01','nguyenhuuthiet01012002@gmail.com','0333751154','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenhuuthiet01012002@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(130,'2023112','Nguyễn Thị Mi Mi','2022-03-01','Nguyenmimi0310@gmail.com','0837722728','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenmimi0310@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(131,'2023143','Trần Thị My My ','2022-03-01','20126310@st.hcmuaf.edu.vn','0837592149','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','20126310@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(132,'2023134','Trần Thị Tuyết Mai','2022-03-01','maitran.mt148c@gmail.com','0356642146','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','maitran.mt148c@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(133,'2023195','Trương Hải Đăng','2022-03-01','hdang7979@gmail.com','0332362546','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','hdang7979@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(134,'2023210','Huỳnh Thị Kim Tuyền ','2022-03-01','tuyenhuynh260399@gmail.com','0396186430','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','tuyenhuynh260399@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(135,'2023184','Nguyễn Thị Huệ','2022-03-01','nguyenhue9803@gmail.com','0981670578','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenhue9803@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(136,'2023226','Huỳnh Thị Hài','2022-03-01','haihth2002@gmail.com','0339608880','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','haihth2002@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(137,'2023166','Phạm Thị Huyền','2022-03-01','Phamhuyen010199@gmail.com','0365950784','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Phamhuyen010199@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(138,'2023168','Nguyễn Thị Kim Diệu ','2022-03-01','kimdieu1407@gmail.com','0329375033','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','kimdieu1407@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(139,'2023165','Võ Thị Thu Hạnh','2022-03-01','hanhvo.140201@gmail.com','0376981064','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','hanhvo.140201@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(140,'2023059','Lê Trần Mỹ Hoa','2022-03-01','hoa.le090801@hcmut.edu.vn','0372351642','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','hoa.le090801@hcmut.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(141,'2023066','Nguyễn Thị Hoài Thương','2022-03-01','hoaithuong99tv@gmail.com','0366059614','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','hoaithuong99tv@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(142,'2023179','Nguyễn Thanh Hoà','2022-03-01','20116200@st.hcmuaf.edu.vn','0812350403','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','20116200@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(143,'2023212','HUỳnh Thị Thanh Tuyền','2022-03-01','huynhthanhtuyen822@gmail.com','0815397890','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','huynhthanhtuyen822@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(144,'2023126','Lê Xuân Tiến','2022-03-01','lexuantien07@gmail.com','0964712704','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','lexuantien07@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(145,'2023141','Nguyễn Kim Giang','2022-03-01','giangkimnguyen16@gmail.com','0768975267','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','giangkimnguyen16@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(146,'2023155','Lê Bảo Hi','2022-03-01','19125094@st.hcmuaf.edu.vn','0359307736','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','19125094@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(147,'2023043','Đàng Như Nghĩa','2022-03-01','1854070092nghia@ou.edu.vn','0901260834','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','1854070092nghia@ou.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(148,'2023181','Bùi Văn Hưng','2022-03-01','buihungqb11@gmail.com','0339944401','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','buihungqb11@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(149,'2023233','Phan Kim Khánh','2022-03-01','2056180141@hcmussh.edu.vn','0365329100','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','2056180141@hcmussh.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(150,'2023189','Trần Nguyễn Quỳnh Như ','2022-03-01','quynhnhu1508pcy@gmail.com','0373273170','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','quynhnhu1508pcy@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(151,'2023042','Lê Thành Hậu','2022-03-01','haule0128@gmail.com','0965320373','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','haule0128@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(152,'2023139','Nguyễn Hoài Bảo','2022-03-01','nguyenbaohg18@mail.com','0971048424','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenbaohg18@mail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(153,'2023012','Lê Hoàng Long','2022-03-01','17117037@st.hcmuaf.edu.vn','0768757403','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','17117037@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(154,'2023097','Trần Ngọc Quyên','2022-03-01','quyenngoc560@gmail.com','0399550204','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','quyenngoc560@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(155,'2023084','Trần Kiến Nam','2022-03-01','nt43425@gmail.com ','0353029739','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nt43425@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(156,'2023216','Trần Thị Thùy Trang','2022-03-01','4t061099@gmail.com','0868189484','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','4t061099@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(157,'2023063','Trần Thị Mỹ Duyên','2022-03-01','Myduyenn218@gmail.com','0979006985','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Myduyenn218@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(158,'2023186','Lục Thị Tám ','2022-03-01','Luctam2001@gmail.com','0377561594','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Luctam2001@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(159,'2023102','Lê Thị Lan Mai ','2022-03-01','18155053@st.hcmuaf.edu.vn ','336116547','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','18155053@st.hcmuaf.edu.vn ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(160,'2023218','Lê Hoàng Mộng Tuyền','2022-03-01','lehoangmongtuyen@gmail.com','0797709545','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lehoangmongtuyen@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(161,'2023069','PHAN THỊ DIỄM ','2022-03-01','diempt2911@gmail.com ','0373708421','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','diempt2911@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(162,'2023117','Nguyễn Tấn Tài ','2022-03-01','nguyentantai25082002@gmail.com ','0388472307','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyentantai25082002@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(163,'2023208','Lê Thị Minh Thư ','2022-03-01','lethiminhthu26072001@gmail.com ','0842047761','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lethiminhthu26072001@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(164,'2023079','Huỳnh Thanh Hiếu','2022-03-01','18137017@st.hcmuaf.edu.vn','0564108602','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','18137017@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(165,'2023194','Võ Thị Kiều My','2022-03-01','vomy8878@gmail.com','0796669590','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','vomy8878@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(166,'2023188','Nguyễn Thị Kim Ngân','2022-03-01','Nganntk1308@gmail.com','0345183700','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Nganntk1308@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(167,'2023113','Hồ Huỳnh Tuyết Linh','2022-03-01','Hohuynhtuyetlinh@gmail.com','0924678958','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hohuynhtuyetlinh@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(168,'2023053','Nguyễn Thị Lan','2022-03-01','ntlanulaw99@gmail.com','0868264085','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ntlanulaw99@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(169,'2023192','Lê Thị Lan Mai ','2022-03-01','18155053@st.hcmuaf.edu.vn ','336116547','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','18155053@st.hcmuaf.edu.vn ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(170,'2023025','Lê Thị Mỹ Hân','2022-03-01','han.le229@hcmut.edu.vn','0973802014','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','han.le229@hcmut.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(171,'2023071','NGUYỄN THỊ THẠCH ','2022-03-01','Nguyenthithach943@gmail.com ','0925498990','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthithach943@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(172,'2023047','Nguyễn Thị Khánh Linh','2022-03-01','ntklinh511@gmail.com','0974602449','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ntklinh511@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(173,'2023158','Nguyễn Trường An','2022-03-01','ntruongant1@gmail.com','0708860118','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ntruongant1@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(174,'2023023','Huỳnh Thị Hài','2022-03-01','haihth2002@gmail.com','0339608880','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','haihth2002@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(175,'2023093','Đinh Văn Cơ','2022-03-01','dinhco1835@gmail.com','0795934432','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','dinhco1835@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(176,'2023124','Tạ Như Huỳnh','2022-03-01','20128032@st.hcmuaf.edu.vn','0925811442','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','20128032@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(177,'2023240','Trần Lê Hữu Nhân','2022-03-01','nhan6431@gmail.com','0912990949','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nhan6431@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(178,'2023241','Đặng Thị Phương Thanh','2022-03-01','21126495@st.hcmuaf.edu.vn','0783205929','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','21126495@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(179,'2023204','Huỳnh Thanh Huyên','2022-03-01','Hth090901@gmail.com','0342929016','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Hth090901@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(180,'2023006','Bùi Nguyễn Huỳnh Như','2022-03-01','nhubui244@gmail.com','0368820207','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nhubui244@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(181,'2023075','Phạm Quang Minh','2022-03-01','minhphamkg68@gmail.com','0919476132','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','minhphamkg68@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(182,'2023154','Trần Văn Thế','2022-03-01','tranvu.ld.2002@gmail.com','0345820109','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','tranvu.ld.2002@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(183,'2023091','Cổ Trọng Toàn','2022-03-01','trongtoan299@gmail.com','0378093229','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','trongtoan299@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(184,'2023156','Lâm Đức Anh','2022-03-01','lamducanhndgv@gmail.com','0971746351','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lamducanhndgv@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(185,'2023213','Tô Thị Nhật Nguyệt','2022-03-01','nhatnguyetkk@gmail.com','0968915373','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nhatnguyetkk@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(186,'2023173','Nguyễn Thị Mỹ Hạ ','2022-03-01','nguyenthimyhact2001@gmail.com ','0915878573','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthimyhact2001@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(187,'2023020','Nguyễn Cao Huyên','2022-03-01','Nguyencaohuyen190400@gmail.com','0346834682','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Nguyencaohuyen190400@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(188,'2023057','Dương Thị Mỹ Hạnh','2022-03-01','duongthimyhanhbuh@gmail.com','0328446818','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','duongthimyhanhbuh@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(189,'2023100','Lê Viết Trọng','2022-03-01','viettrong12tn@gmail.com ','0589185764','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','viettrong12tn@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(190,'2023130','Danh Thị Bích Ngọc','2022-03-01','ngocdtb19415@st.uel.edu.vn','0385815056','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ngocdtb19415@st.uel.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(191,'2023223','Trần Thị Thuỳ Trang ','2022-03-01','thuytrang100412@gmail.com','0382642847','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thuytrang100412@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(192,'2023008','Nguyễn Ngọc Thông','2022-03-01','ngocthong2k2@gmail.com','0911182742','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ngocthong2k2@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(193,'2023016','Nguyễn Thị Mỹ Hạ ','2022-03-01','nguyenthimyhact2001@gmail.com ','0915878573','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthimyhact2001@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(194,'2023127','Nguyễn Tấn Nguyên','2022-03-01','tannguyen1750@gmail.com','0363037467','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','tannguyen1750@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(195,'2023104','Lê Quang Đông','2022-03-01','20521190@gm.uit.edu.vn','0857203105','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','20521190@gm.uit.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(196,'2023115','Nguyễn Thị Trang','2022-03-01','Trangbinhloc@gmail.com','0347587878','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Trangbinhloc@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(197,'2023073','Phạm Ngọc Nhất','2022-03-01','phamnhat.20102002@gmail.com','0377108229','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','phamnhat.20102002@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(198,'2023175','Phan Thị Thu An ','2022-03-01','phanthithuan105@gmail.com','0387740047','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','phanthithuan105@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(199,'2023029','Lê Văn Huy Hoàng','2022-03-01','huyhoanglvqb121102@gmail.com','0817464867','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','huyhoanglvqb121102@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(200,'2023028','Mã Phượng Thi','2022-03-01','phuongthima@gmail.com','0356377614','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','phuongthima@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(201,'2023074','Nguyễn Thị Như Tuyền','2022-03-01','19128205@st.hcmuaf.edu.vn','0824859459','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','19128205@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(202,'2023183','Nguyễn Minh Quân','2022-03-01','Quandateh2002@gmail.com','0399637903','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Quandateh2002@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(203,'2023146','Đặng Thị Phương','2022-03-01','dangphuong140199@gmail.com','0357951291','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','dangphuong140199@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(204,'2023230','Trương Thị Nhi','2022-03-01','thinhi3942@gmail.com','0942063365','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thinhi3942@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(205,'2023138','Nguyễn Trung Hiếu','2022-03-01','hieutanmy321@gmail.com','0965924083','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','hieutanmy321@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(206,'2023107','Phan Văn Thịnh','2022-03-01','20111295@st.hcmuaf.edu.vn','0397239569','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','20111295@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(207,'2023201','Phạm Thị Huyền','2022-03-01','Phamhuyen010199@gmail.com','0365950784','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Phamhuyen010199@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(208,'2023217','Lục Tám','2022-03-01','luctam2001@gmail.com','0377561594','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','luctam2001@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(209,'2023056','Trần Đình Sâm.','2022-03-01','samtran22345@gmail.com','0967493457.','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','samtran22345@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(210,'2023055','Trà Hoàng Kha','2022-03-01','20145119@st.hcmuaf.edu.vn','0374313709','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','20145119@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(211,'2023078','Nguyễn Thành Mỹ','2022-03-01','17126083@st.hcmuaf.edu.vn','0856487482','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','17126083@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(212,'2023148','Nguyễn Ngọc Đức','2022-03-01','ngocduc11112001@gmail.com','0797365068','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ngocduc11112001@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(213,'2023136','Nguyễn Trần Sang ','2022-03-01','Ntsbanda@gmail.com ','0397884572','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Ntsbanda@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(214,'2023174','Đỗ Thị Đào','2022-03-01','19112024@st.hcmuaf.edu.vn','0968757930','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','19112024@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(215,'2023001','NGUYỄN THỊ KIM TUYẾN','2022-03-01','kimtuyen1611199@gmail.com','0395023743','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kimtuyen1611199@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(216,'2023072','Trần Văn Tính','2022-03-01','tranvantinh6103@gmail.com','0923036103','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','tranvantinh6103@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(217,'2023162','Lê Hoàng Hương ','2022-03-01','Lehoanghuong17@gmail.com','0768153899','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Lehoanghuong17@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(218,'2023145','Nguyễn Văn Khánh','2022-03-01','Vankhanhdmx2019@gmail.com','0943675286','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Vankhanhdmx2019@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(219,'2023234','Nông Thị Thuỷ','2022-03-01','nongthithuy5516@gmail.com','0355502710','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nongthithuy5516@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(220,'2023211','Nguyễn Thi Lành','2022-03-01','lanhftu2017@gmail.com','0347172301','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lanhftu2017@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(221,'2023120','NGUYỄN THỊ DIỄM THÚY','2022-03-01','Hoaithuong14102016@gmail.com','0358690738','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hoaithuong14102016@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(222,'2023147','Vi Thị Thạnh','2022-03-01','thanhthivi27@gmail.com','0356300688','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thanhthivi27@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(223,'2023045','Hồ Minh Tân','2022-03-01','17111126@st.hcmuaf.edu.vn','0936658749','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','17111126@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(224,'2023022','Bùi Thị Tuyết Mai','2022-03-01','20125510@st.hcmuaf.edu.vn','0925721201','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','20125510@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(225,'2023131','Ngô Thị Thiên Thảo','2022-03-01','thienthaouel@gmail.com','0974719931','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thienthaouel@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(226,'2023205','Trần Minh Thư','2022-03-01','tranminhthu9aa@gmail.com','0375293199','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','tranminhthu9aa@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(227,'2023037','Võ Thị Bích Thuận','2022-03-01','030336200279@st.buh.edu.vn','0325557651','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','030336200279@st.buh.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(228,'2023035','Lê Thị Mỹ Chi','2022-03-01','lethimychi1756010025@gmail.com','0327298958','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','lethimychi1756010025@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(229,'2023044','Mai Công Tuấn Kiệt ','2022-03-01','maicongtuankiet@gmail.com ','0914343990','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','maicongtuankiet@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(230,'2023221','Bùi Nguyễn Hoàng Trâm','2022-03-01','trambuinguyen.01@gmail.com','0819140101','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','trambuinguyen.01@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(231,'2023237','Nguyễn Lam Trường','2022-03-01','lamtruong.028716@gmail.com','0969028716','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lamtruong.028716@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(232,'2023144','Nguyễn Thị Mộng Huyền','2022-03-01','20126263@st.hcmuaf.edu.vn','0961531457','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','20126263@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(233,'2023133','Lê Tuấn Anh','2022-03-01','20154080@st.hcmuaf.edu.vn','0382965624','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','20154080@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(234,'2023225','Nguyễn Trần Anh Thư','2022-03-01','thutran0523393526@gmail.com','0355946319','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thutran0523393526@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(235,'2023046','Trương Thị Mỹ Hiệp','2022-03-01','19122055@st.hcmuaf.edu.vn','0329056619','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','19122055@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(236,'2023080','Nguyễn Thị Huyền Trân','2022-03-01','nguyenthihuyentran07082000@gmail.com','0704844385','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthihuyentran07082000@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(237,'2023196','Nguyễn Thị Lan Anh','2022-03-01','anhntl19408@st.uel.edu.vn','0967392622','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','anhntl19408@st.uel.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(238,'2023197','Trần Thị Kiều','2022-03-01','tranthikieu050399@gmail.com','0335957611','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','tranthikieu050399@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(239,'2023050','Mai Trúc Phượng','2022-03-01','maitrucphuong98@gmail.com','0332795135','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','maitrucphuong98@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(240,'2023111','Phan Thị Quỳnh Hương ','2022-03-01','Phanthiquynhhuong0192@gmail.com','0867928469','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Phanthiquynhhuong0192@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(241,'2023076','Trương Thị Nhi','2022-03-01','thinhi3942@gmail.com','0942063365','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thinhi3942@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(242,'2023030','Nguyễn Văn Khang','2022-03-01','nv.khang0405@gmail.com','0978121304','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nv.khang0405@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(243,'2023232','Nguyễn Bảo Khuyên ','2022-03-01','Baokhuyen20122002@gmail.com ','0333079607','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Baokhuyen20122002@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(244,'2023151','Nguyễn Thị Thanh Thùy ','2022-03-01','thanhthuy1142000@gmail.com ','384999325','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thanhthuy1142000@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(245,'2023185','Võ Thành Phú','2022-03-01','thanhphums10@gmail.com','0775074059','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thanhphums10@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(246,'2023220','Y Đăng Ninh','2022-03-01','dangninh752@gmail.com','0352751784','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','dangninh752@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(247,'2023129','Lê Hoàng Khánh Linh','2022-03-01','18125161@st.hcmuaf.edu.vn','0969875763','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','18125161@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(248,'2023164','Nguyễn Phan Bảo Trân','2022-03-01','phanbaotrannguyen9401@gmail.com','0933783918','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','phanbaotrannguyen9401@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(249,'2023215','Nguyễn Thanh Ngọc Yến','2022-03-01','nguyenthanhngocyen01012001@gmail.com','0707943094','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthanhngocyen01012001@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(250,'2023157','Nguyễn Quốc Đông Triều','2022-03-01','dongtrieut2.699@gmail.com','0378537443','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','dongtrieut2.699@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(251,'2023004','Y Đăng Ninh','2022-03-01','dangninh752@gmail.com','0352751784','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','dangninh752@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(252,'2023229','Nguyễn Thị Hợp','2022-03-01','thihop187@gmail.com','0375802180','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thihop187@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(253,'2023024','Võ Thành Cao Nhơn','2022-03-01','Caonhon12@gmail.com','0374869321','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Caonhon12@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(254,'2023036','Võ Ngọc Phương Uyên','2022-03-01','uyenlun0802@gmail.com ','0961072417','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','uyenlun0802@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(255,'2023150','Nông Thị Thuỷ','2022-03-01','nongthithuy5516@gmail.com','0355502710','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nongthithuy5516@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(256,'2023228','Trần Thanh Trọng','2022-03-01','Thanhtrongag67@gmail.com','0337573719','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Thanhtrongag67@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(257,'2023122','NGUYỄN THỊ MINH HOA','2022-03-01','nguyenthiminhhoa14@gmail.com','0782898030','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthiminhhoa14@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(258,'2023018','Nguyễn Thị Thuý Diễm','2022-03-01','diemn3531@gmail.com','0585812629','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','diemn3531@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(259,'2023089','Nguyễn Y Phụng','2022-03-01','nguyenyphung17@gmail.com','0326229351','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenyphung17@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(260,'2023041','Võ Thị Bích Thuận','2022-03-01','030336200279@st.buh.edu.vn','0325557651','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','030336200279@st.buh.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(261,'2023116','Lê Minh Như Nguyệt','2022-03-01','nguyetle763@gmail.com','0705109277','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyetle763@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(262,'2023039','Nguyễn Tiến Phúc','2022-03-01','tienphuc22113@gmail.com','0866834181','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','tienphuc22113@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(263,'2023048','Dương Thế Bích','2022-03-01','thebichpham@gmail.com','0398026884','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thebichpham@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(264,'2023182','Nguyễn Đình Quốc','2022-03-01','quocnguyen322002@gmail.com','0337131900','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','quocnguyen322002@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(265,'2023193','Nguyễn Thị Mỹ Lệ','2022-03-01','nguyenmyleoh@gmail.com','0389330803','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenmyleoh@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(266,'2023082','PHAN THỊ HỒNG SANG','2022-03-01','Hongsang365s@gmail.com','0392387408','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hongsang365s@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(267,'2023092','Trịnh Thị Thu sương ','2022-03-01','minx1648@gmail.com ','0776243320','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','minx1648@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(268,'2023098','Hồ Huy Luật','2022-03-01','hohuyluat1@gmail.com','0789456948','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','hohuyluat1@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(269,'2023105','Lăng Bảo Khanh','2022-03-01','khanhlb18410@st.uel.edu.vn','0962643609','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','khanhlb18410@st.uel.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(270,'2023101','Võ Thu Uyên ','2022-03-01','thuuyenvo99@gmail.com','0777935167','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thuuyenvo99@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(271,'2023203','Bùi Trương Kim Hồng','2022-03-01','xmkms99@gmail.com','0772123664','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','xmkms99@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(272,'2023180','Bùi Trương Kim Hồng','2022-03-01','xmkms99@gmail.com','0772123664','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','xmkms99@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(273,'2023222','Trương Thị Mỹ Hiệp ','2022-03-01','19122055@st.hcmuaf.edu.vn','0329056619','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','19122055@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(274,'2023187','Lê Hoàng Hương','2022-03-01','lehoanghuong17@gmail.com','0768153899','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lehoanghuong17@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(275,'2023206','Phan Văn Thịnh','2022-03-01','thanhthoai10a2@gmail.com','0397239569','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thanhthoai10a2@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(276,'2023051','Đỗ Hoàng Nam','2022-03-01','dohoangnamsadec@gmail.com','0899042920','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','dohoangnamsadec@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(277,'2023090','Vy Viết Kim Ngân','2022-03-01','kellykey29940@gmail.com','0346342238','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','kellykey29940@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(278,'2023021','Nguyễn Thị Thanh Nhàn','2022-03-01','thanhnhanbuh0101@gmail.com','0984239201','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thanhnhanbuh0101@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(279,'2023011','Lâm Thị Ngọc Nhi','2022-03-01','lamngocnhi0205@gmail.com','0352108938','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','lamngocnhi0205@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(280,'2023081','Lê Thị Mỹ Linh','2022-03-01','mylinh01677281441@gmail.com','0868656874','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','mylinh01677281441@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(281,'2023199','Bùi Thị Tuyết Mai','2022-03-01','20125510@st.hcmuaf.edu.vn','0925721201','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','20125510@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(282,'2023088','Đặng Tuấn Khanh','2022-03-01','tuankhanh12d1@gmail.com','0903660634','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','tuankhanh12d1@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(283,'2023027','Lê Thị Hợp','2022-03-01','lehop.buh@gmail.com','0868881048','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','lehop.buh@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(284,'2023224','Vũ Khánh Băng ','2022-03-01','vukhanhbang2002@gmail.com ','0765709335','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','vukhanhbang2002@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(285,'2023013','Trịnh Thị Hoài Lam ','2022-03-01','trinhthihoailam.0901@gmail.com','0339273691','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','trinhthihoailam.0901@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(286,'2023118','Đặng Thị Thanh Tuyền','2022-03-01','thanhtuyen060401@gmail.com','0332011434','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thanhtuyen060401@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(287,'2023067','Đinh Thị Ngọc Ánh','2022-03-01','anhdinh0708@gmail.com','0981744381','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','anhdinh0708@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(288,'2023140','Lê Hoàng Mộng Tuyền','2022-03-01','lehoangmongtuyen@gmail.com','0797709545','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','lehoangmongtuyen@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(289,'2023200','Nguyễn Thị Ngọc Bích','2022-03-01','ngocbichnguyena3@gmail.com','0383855346','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ngocbichnguyena3@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(290,'2023128','Nguyễn Thị Liễu ','2022-03-01','17113092@st.hcmuaf.edu.vn','0377736405','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','17113092@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(291,'2023209','Trịnh Thị Huyền Trang','2022-03-01','18112227@st.hcmuaf.edu.vn','0365696581','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','18112227@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(292,'2023170','Nguyễn Bảo Khuyên ','2022-03-01','Baokhuyen20122002@gmail.com ','0333079607','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Baokhuyen20122002@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(293,'2023005','Nguyễn Thị Ngọc Linh ','2022-03-01','Nguyenthingoclinhkt02@gmail.com ','0365036807','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthingoclinhkt02@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(294,'2023015','Nguyễn Thị Mỹ Hạ ','2022-03-01','nguyenthimyhact2001@gmail.com ','0915878573','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthimyhact2001@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(295,'2023009','Trương Lâm Quế Trâm','2022-03-01','2301ttt@gmail.com','0935457054','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','2301ttt@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(296,'2023171','Nguyễn Lương Quỳnh Như ','2022-03-01','nhu0979003760@gmail.com ','0979003760','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nhu0979003760@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(297,'2023062','Nguyễn Thị Bảo Hân','2022-03-01','baohan.8320@gmail.com','0347434635','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','baohan.8320@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(298,'2023152','Võ Thị Mỹ Châu','2022-03-01','mychauvothi02@gmail.com','0373729197','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','mychauvothi02@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(299,'2023060','Nguyễn Thị Kim Ngân','2022-03-01','nguyenthikimngan10088@gmail.com','0946398429','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthikimngan10088@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(300,'2023038','Nguyễn Đình Quốc','2022-03-01','quocnguyen322002@gmail.com','0337131900','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','quocnguyen322002@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(301,'2023068','Nguyễn Thị Lệ Ngân','2022-03-01','lenganyg01@gmail.com','0335324418','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','lenganyg01@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(302,'2023137','Nguyễn Thị Xuân Mai','2022-03-01','xuanmaitm317@gmail.com','0973942940','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','xuanmaitm317@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(303,'2023003','Ngô Nguyễn Anh Khoa','2022-03-01','18113065@st.hcmuaf.edu.vn','0947667224','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','18113065@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(304,'2023109','Lê Thị Mỹ Hân','2022-03-01','han.le229@hcmut.edu.vn','0973802014','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','han.le229@hcmut.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(305,'2023099','Danh thị bích vân','2022-03-01','bichvannh28@gmail.com','0356808544','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','bichvannh28@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(306,'2023172','Nguyễn Thị Xuân Mai','2022-03-01','Maidd115@gmail.com','0972990830','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Maidd115@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(307,'2023087','Lê Thị Mỹ Hạnh ','2022-03-01','Myhanh3248@gmail.com','0901343248','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Myhanh3248@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(308,'2023108','Nguyễn Lương Hoài Thương ','2022-03-01','hoaithuong.nguyen.041102@gmail.com ','344125058','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','hoaithuong.nguyen.041102@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(309,'2023169','Nguyễn Thị Lưu Luyến ','2022-03-01','20125506@st.hcmuaf.edu.vn','0384987063','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','20125506@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(310,'2023103','Thái Thanh Sơn','2022-03-01','sownthasi@gmail.com','0816146300','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','sownthasi@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(311,'2023125','Trần Thị Mỹ Lệ','2022-03-01','tranthimyle.tk3@gmail.com','0336633717','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','tranthimyle.tk3@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(312,'2023202','Trần Kiến Nam ','2022-03-01','nt43425@gmail.com ','0353029739','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nt43425@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(313,'2023061','Võ Thị Nguyên','2022-03-01','vo189928@gmail.com','0388202652','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','vo189928@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(314,'2023163','Nguyễn Thị Ngọc Linh ','2022-03-01','Nguyenthingoclinhkt02@gmail.com ','0365036807','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthingoclinhkt02@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(315,'2023227','Nguyễn Kim Giang','2022-03-01','giangkimnguyen16@gmail.com','0768975267','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','giangkimnguyen16@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(316,'2023064','Nguyễn Gia Trung','2022-03-01','ngt040802@gmail.com','0562719530','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ngt040802@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(317,'2023178','Hồ Thị Thúy Hiền','2022-03-01','thuyhiensehun@gmail.com','0386325714','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thuyhiensehun@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(318,'2023177','Nguyễn Thị Vân Anh','2022-03-01','ngth.vananh99@gmail.com','0395046627','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ngth.vananh99@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(319,'2023176','Nguyễn Nhựt Minh','2022-03-01','minhnn19407@st.uel.edu.vn','0387841567','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','minhnn19407@st.uel.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(320,'2023159','Nguyễn Thị Lan Anh','2022-03-01','anhntl19408@st.uel.edu.vn','0967392622','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','anhntl19408@st.uel.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(321,'2023231','Nguyễn Thị Trang','2022-03-01','Trangbinhloc@gmail.com','0347587878','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Trangbinhloc@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(322,'2023191','Nguyễn Thị Hà Giang','2022-03-01','hagianng1704@gmail.com','0943657511','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','hagianng1704@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(323,'2023007','Trương Trí Hào','2022-03-01','truongtrihao21@gmail.com','0336896494','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','truongtrihao21@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(324,'2023034','Huỳnh Thị Kim Nhung ','2022-03-01','htknhung2019@gmail.com ','0378374615','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','htknhung2019@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(325,'2023114','Huỳnh Thị Trúc Linh','2022-03-01','phuongmiu191@gmail.com','0363302171','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','phuongmiu191@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(326,'2023160','Kiều Ái Vi','2022-03-01','kieuaivi2k2@gmail.com','0327937312','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','kieuaivi2k2@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(327,'2023121','Nguyễn Thị Lan Châu','2022-03-01','nguyenthilanchau1805@gmail.com','0367345109','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthilanchau1805@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(328,'2023085','Nguyễn Thị Huyền Trân','2022-03-01','huyentran30520@gmail.com','0981769443','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','huyentran30520@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(329,'2023070','Mai Thị Khánh Huyền','2022-03-01','maikhanhhuyen91@gmail.com','0988496076','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','maikhanhhuyen91@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(330,'2023040','Võ Thị Mỹ Oanh','2022-03-01','19112143@st.hcmuaf.edu.vn','0395655783','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','19112143@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(331,'2023094','Nguyễn Dĩ Khang','2022-03-01','nguyendikhang369@gmail.com','0336860720','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyendikhang369@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(332,'2023106','Nguyễn Minh Thiện Tâm','2022-03-01','minhthien3004mt@gmail.com','0827957526','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','minhthien3004mt@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(333,'2023086','Nguyễn Thị Thủy Tiên','2022-03-01','thuytienthuytien@gmail.com','0385087900','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thuytienthuytien@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(334,'2023135','Nguyễn Linh Tâm','2022-03-01','nguyenlinhtam1505200@gmail.com','0942073618','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyenlinhtam1505200@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(335,'2023054','Lê Thị Hồng Gấm ','2022-03-01','lethihonggam1011999@gmail.com ','0398997446','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','lethihonggam1011999@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(336,'2023010','Nguyễn Thị Ngọc Ánh','2022-03-01','ngocanh01299@gmail.com','0364264697','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','ngocanh01299@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(337,'2023083','Nguyễn Bình An','2022-03-01','Ngbinhan30@gmail.com','0329863884','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Ngbinhan30@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(338,'2023149','Nguyễn Thị Như Quỳnh ','2022-03-01','nhuquynhbp12345@gmail.com ','0866945743','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nhuquynhbp12345@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(339,'2023190','Nguyễn Thị Thanh Nhàn','2022-03-01','thanhnhanbuh0101@gmail.com','0984239201','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','thanhnhanbuh0101@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(340,'2023219','Trần Thị Kim Trinh','2022-03-01','ktrinh2k2@gmail.com','0337102076','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','ktrinh2k2@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(341,'2023017','Sử Thị Thanh Lan','2022-03-01','thanhlan07112001@gmail.com','0969670256','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','thanhlan07112001@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(342,'2023031','Hoàng Thị Quỳnh Anh','2022-03-01','Hoangthiquynhanh2631@gmail.com','0946645297','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Hoangthiquynhanh2631@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(343,'2023110','Nguyễn Thị Ái Liên','2022-03-01','Ailienmax09@gmail.com','0848525289','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','Ailienmax09@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(344,'2023014','Trần Nguyễn Quỳnh Như ','2022-03-01','quynhnhu1508pcy@gmail.com','0373273170','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','quynhnhu1508pcy@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(345,'2023123','Trương Thanh Tiền','2022-03-01','truongthanhtien272002@gmail.com','0777943269','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','truongthanhtien272002@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(346,'2023019','Nguyễn Thanh Ngọc Yến','2022-03-01','nguyenthanhngocyen01012001@gmail.com','0707943094','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenthanhngocyen01012001@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(347,'2023207','Lê Minh Như Nguyệt','2022-03-01','nguyetle763@gmail.com','0705109277','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','nguyetle763@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(348,'2023065','Nguyễn Lê Công Quý','2022-03-01','nguyenlecongquy@gmail.com','0834827907','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','nguyenlecongquy@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(349,'2023119','Nguyễn Thị Hồng Yến ','2022-03-01','18117087@st.hcmuaf.edu.vn','0346499442','2022-03-28','2022-03-28',1,1,'https://i.imgur.com/bFbOCtQ.jpg','18117087@st.hcmuaf.edu.vn','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(350,'2023235','Nguyễn Thị Hồng Yến ','2022-03-01','Kaynguyen442928@gmail.com ','0346499442','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Kaynguyen442928@gmail.com ','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(351,'2023214','Võ Thị Trọng','2022-03-01','votrong173@gmail.com','0374576026','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','votrong173@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,3,3),(352,'2023239','Nguyễn Thị Băng Châu','2022-03-01','Nguyenthibangchauvn@gmail.com','0907733612','2022-03-28','2022-03-28',0,0,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthibangchauvn@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,0,3,1),(353,'NV20133097','Nguyễn Võ Song Toàn','2022-03-01','adamwilling.2002@gmail.com','0369572542','2022-03-28','2022-03-28',0,1,'','adamwilling.2002@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,0,1,1),(354,'20133097','Nguyễn Võ Song Toàn','2022-03-01','20133097@student.hcmute.edu.vn','0369572542','2022-03-28','2022-03-28',0,1,'','','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,0,1,1),(355,'Admin','Administrator','2022-03-01','admin@ktxcomay.com.vn','123456787','2022-03-28','2022-03-28',1,1,'','','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,1,1),(356,'d42s343','Nguyễn Toan','2022-03-01','Nguyenthibangchauvn@gmail.com','0907733612','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthibangchauvn@gmail.com','cmdcmdcmd',1,1,3,3),(357,'NVCT22','Nguyễn Võ Công Toàn','2022-03-01','toan6463@gmail.com','0987467364','2022-03-28','2022-03-28',0,1,'','toan6463@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,0,1,1),(363,'admin1','admin1','2022-03-01','admin@gmail.com','0987467364','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','admin@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,1,1),(364,'DM','Trưởng phòng của người tạo','2022-03-01','\"\"','-1','2022-03-28','2022-03-28',0,0,'https://i.imgur.com/bFbOCtQ.jpg','admin@gmail.com','$2a$10$mLK.rrdlvx9DCFb6Eck1t.TlltnGulepXnov3bBp5T2TloO1MYj52',1,1,1,1),(365,'dsda','Nguyễn Thị Băng Châu Bui','2022-03-01','Nguyenthibangchauvn@gmail.com','0907733612','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthibangchauvn@gmail.com','cmdcmdcmd',1,1,3,3),(366,'dsda2','Nguyễn Thị Băng Châu Bui','2022-03-01','Nguyenthibangchauvn@gmail.com','0907733612','2022-03-28','2022-03-28',1,0,'https://i.imgur.com/bFbOCtQ.jpg','Nguyenthibangchauvn@gmail.com','cmdcmdcmd',1,1,3,3);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `order_index` int(11) NOT NULL DEFAULT '-1',
  `create_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `update_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
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
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mss_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `item_code` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`),
  UNIQUE KEY `itemcode_UNIQUE` (`item_code`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'E','DEPE1','Phòng ban đang được sử dụng'),(2,'E','EMPE1','Không được khóa tài khoản trưởng phòng'),(3,'E','DEPE2','Mã phòng ban này đã tồn tại'),(4,'E','POSE1','Tạo mới chức vụ thất bại'),(5,'E','EMPE2','Không thể xóa nhân viên là trưởng phòng'),(6,'S','EMPS1','Thêm danh sách nhân viên thành công'),(7,'E','EMPE3','Có lỗi xảy ra khi thêm danh sách nhân viên'),(8,'E','EMPE4','Có lỗi xảy ra khi thêm nhân viên!'),(9,'S','EMPS2','Thêm nhân viên thành công!'),(10,'E','DEPE3','Tạo mới phòng ban thất bại'),(12,'E','POSE2','Cập nhật chức vụ thất bại'),(13,'E','DEPE4','Cập nhật  phòng ban thất bại'),(14,'E','TEAME1','Đội nhóm đang được sử dụng'),(15,'E','TEAME2','Thêm đội nhóm thất bại'),(16,'E','TEAME3','Mã đội nhóm đã tồn tại'),(17,'S','TEAMS4','Tạo mới đội nhóm thành công'),(18,'S','TEAMS5','Cập nhật đội nhóm thành công'),(19,'S','TEAMS6','Xóa đội nhóm thành công'),(20,'S','TASKS1','Tạo mới công việc thành công'),(21,'E','TASKE1','Tạo mới công việc thất bại'),(22,'S','TASKS2','Cập nhật công việc thành công'),(23,'S','TASKS3','Hủy công việc thành công'),(24,'E','TASKE3','Cập nhật công việc thất bại'),(25,'S','ROLES1','Tạo mới vai trò thành công'),(26,'E','ROLEE1','Tạo mới vai trò thất bại'),(27,'E','ROLEE2','Vai trò này đang được sử dụng'),(28,'E','ROLEE3','Xóa vai trò thất bại'),(29,'S','ROLES2','Xóa vai trò thành công'),(30,'S','ROLES3','Cập nhật vai trò thành công'),(31,'E','ROLEE4','Cập nhật vai trò thất bại'),(32,'E','LOGINE1','Mật khẩu không chính xác. Vui lòng kiểm tra và thử lại!'),(33,'S','LOGINS1','Đăng nhập thành công'),(34,'E','LOGINE2','Tên đăng nhập không tồn tại. Vui lòng kiểm tra và thử lại!'),(35,'E','EMPE5','Mã nhân viên đã tồn tại!'),(39,'S','EMPS3','Cập nhật nhân viên thành công!'),(41,'E','EMPE6','Có lỗi khi cập nhật thông tin nhân viên!'),(42,'S','EMPS4','Xóa nhân viên thành công!'),(43,'E','EMPE7','Có lỗi xảy ra khi xóa nhân viên!'),(44,'E','EMPE8','Mã nhân viên không tồn tại!'),(45,'E','STAE1','Mã trạng thái không tồn tại!'),(46,'E','DEPE5','Mã phòng ban không được quá 10 kí tự'),(47,'E','EMPE9','Mã nhân viên không được quá 10 kí tự!'),(48,'S','TASKS4','Xóa công việc thành công'),(49,'E','TASKE2','Xóa công việc thất bại!'),(50,'S','POSTS1','Thêm bài viết thành công!'),(51,'E','POSTE1','Thêm bài viết thất bại!'),(52,'S','POSTS2','Cập nhật bài viết thành công!'),(53,'E','POSTE2','Cập nhật bài viết thất bại!'),(54,'S','POSTS3','Xóa bài viết thành công!'),(55,'E','POSTE3','Xóa bài viết thất bại!'),(56,'S','POSS1','Tạo mới chức vụ thành công'),(57,'\"\"','POSS2','Cập nhật chức vụ thành công'),(58,'S','DEPS1','Tạo mới phòng ban thành công!'),(59,'S','DEPS2','Cập nhật phòng ban thành công!'),(60,'E','TASKE4','Cần truyền employeeId cho API này!'),(61,'E','POSTE4','Like bài viết thất bại!'),(62,'S','POSTS4','Like bài viết thành công!');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify`
--

LOCK TABLES `notify` WRITE;
/*!40000 ALTER TABLE `notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify_detail`
--

DROP TABLE IF EXISTS `notify_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notify_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notify_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `label` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'task','Công việc'),(2,'proposal','Đề xuất'),(3,'type','Loại đề xuất'),(4,'employee','Nhân viên'),(5,'department','Phòng ban'),(6,'position','Chức vụ'),(7,'inventory','Kho'),(8,'team','Đội nhóm'),(9,'role','Vai trò'),(10,'post','Bài viết'),(11,'import','Thêm sinh viên bằng file excel');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `label` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `department_id` int(11) DEFAULT NULL,
  `is_manager` tinyint(4) NOT NULL DEFAULT '0',
  `create_by` int(11) NOT NULL DEFAULT '-1',
  `modify_by` int(11) NOT NULL DEFAULT '-1',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `team_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_positions_teams1_idx` (`team_id`),
  KEY `fk_role_position_idx` (`role_id`),
  CONSTRAINT `fk_positions_teams1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `fk_role_position` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'Thành viên ban quản lý KTX',1,1,-1,-1,'2022-03-28','2022-03-28',NULL,1),(2,'Giám thị',1,0,-1,-1,'2022-03-28','2022-03-28',NULL,2),(3,'Kế toán',1,0,-1,-1,'2022-03-28','2022-03-28',NULL,3),(5,'Đội trưởng',2,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(6,'Thành viên',2,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(7,'Trưởng tầng 1',3,1,-1,-1,'2022-03-28','2022-03-28',NULL,6),(8,'Trưởng phòng sinh viên tầng 1',3,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(9,'Thành viên',3,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(10,'Trưởng tầng 2',4,1,-1,-1,'2022-03-28','2022-03-28',NULL,6),(11,'Trưởng phòng sinh viên tầng 2',4,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(12,'Thành viên',4,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(13,'Trưởng tầng 3',5,1,-1,-1,'2022-03-28','2022-03-28',NULL,6),(14,'Trưởng phòng sinh viên tầng 3',5,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(15,'Thành viên',5,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(16,'Trưởng tầng trệt',6,1,-1,-1,'2022-03-28','2022-03-28',NULL,6),(17,'Trưởng phòng sinh viên tầng trệt',6,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(18,'Thành viên',6,0,-1,-1,'2022-03-28','2022-03-28',NULL,5),(19,'Trưởng đội 2',7,1,-1,-1,'2022-03-28','2022-03-28',NULL,7),(20,'Trưởng đội nhạc cụ',NULL,1,-1,-1,'2022-03-28','2022-03-28',1,5),(21,'Thành viên',NULL,0,-1,-1,'2022-03-28','2022-03-28',1,5),(22,'Trưởng đội cắm hoa',NULL,1,-1,-1,'2022-03-28','2022-03-28',2,5),(23,'Trưởng đội bóng đá',NULL,1,-1,-1,'2022-03-28','2022-03-28',3,5),(24,'Trưởng đội bảo vệ',NULL,1,-1,-1,'2022-03-28','2022-03-28',4,5),(25,'Trưởng đội thuyết trình',NULL,1,-1,-1,'2022-03-28','2022-03-28',5,5),(26,'Trưởng ban sự kiện',8,1,-1,-1,'2022-03-28','2022-03-28',NULL,5),(27,'Trưởng ban truyền thông',9,1,-1,-1,'2022-03-28','2022-03-28',NULL,5),(28,'Sinh viên',10,1,-1,-1,'2022-03-28','2022-03-28',NULL,5),(29,'Trưởng đội',NULL,1,-1,-1,'2022-03-28','2022-03-28',6,1),(30,'Thành viên Đội 1',NULL,0,-1,-1,'2022-03-28','2022-03-28',6,5),(31,'Trưởng đội 2',NULL,1,-1,-1,'2022-03-28','2022-03-28',8,1),(32,'Thành viên',NULL,0,-1,-1,'2022-03-28','2022-03-28',8,5),(33,'dádsdsa',NULL,1,-1,-1,'2022-03-28','2022-03-28',9,5),(34,'dádsấd',NULL,0,-1,-1,'2022-03-28','2022-03-28',9,4),(35,'dâsdsadsda',NULL,0,-1,-1,'2022-03-28','2022-03-28',9,5),(36,'Trưởng',14,1,-1,-1,'2022-03-28','2022-03-28',NULL,5),(37,'Admin',1,1,1,1,'2022-03-28','2022-03-28',NULL,8);
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_employees`
--

DROP TABLE IF EXISTS `positions_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `positions_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `position_emp_idx` (`position_id`),
  KEY `employee_pos_idx` (`employee_id`),
  CONSTRAINT `employee_pos` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `position_emp` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_employees`
--

LOCK TABLES `positions_employees` WRITE;
/*!40000 ALTER TABLE `positions_employees` DISABLE KEYS */;
INSERT INTO `positions_employees` VALUES (1,1,15),(2,2,15),(3,3,15),(4,4,15),(5,5,16),(6,6,15),(7,7,15),(8,8,15),(9,9,15),(10,10,15),(11,11,15),(12,12,15),(13,13,15),(14,14,15),(15,15,15),(16,16,7),(17,17,6),(18,18,6),(19,19,6),(20,20,6),(21,21,6),(22,22,6),(23,23,6),(24,24,6),(25,25,6),(26,26,6),(27,27,6),(28,28,6),(29,29,6),(30,30,6),(31,31,10),(32,32,9),(33,33,9),(34,34,9),(35,35,9),(36,36,9),(37,37,9),(38,38,9),(39,39,9),(40,40,9),(41,41,9),(42,42,9),(43,43,9),(44,44,9),(45,45,9),(46,46,13),(47,47,12),(48,48,12),(49,49,12),(50,50,12),(51,51,12),(52,52,12),(53,53,12),(54,54,12),(55,55,12),(56,56,12),(57,57,12),(58,58,12),(59,59,12),(60,60,12),(61,61,1),(62,62,2),(63,63,2),(64,64,2),(65,65,2),(66,66,2),(67,67,2),(68,68,2),(69,69,2),(70,70,2),(71,71,2),(72,72,2),(73,73,2),(74,74,2),(75,75,2),(77,77,5),(78,78,5),(79,79,5),(80,80,5),(81,81,5),(82,82,5),(83,83,5),(84,84,5),(85,85,5),(86,86,5),(87,87,5),(88,88,5),(89,89,5),(90,90,5),(91,91,19),(92,92,6),(93,93,6),(94,94,6),(95,95,6),(96,96,6),(97,97,6),(98,98,6),(99,99,6),(115,100,6),(131,104,5),(132,104,21),(133,104,17),(134,105,6),(135,107,9),(136,108,15),(137,109,12),(138,110,6),(139,111,12),(140,112,15),(141,113,6),(142,114,6),(143,115,12),(144,116,6),(145,117,12),(146,118,12),(147,119,15),(148,120,12),(149,121,6),(151,123,12),(152,124,12),(153,125,6),(154,126,9),(155,127,15),(156,128,6),(157,129,9),(158,130,12),(159,131,12),(160,132,12),(161,133,15),(162,134,15),(163,135,15),(164,136,15),(165,137,15),(166,138,15),(167,139,12),(168,140,9),(169,141,9),(170,142,15),(171,143,15),(172,144,12),(173,145,12),(174,146,12),(175,147,6),(176,148,15),(177,149,15),(178,150,15),(179,151,6),(180,152,12),(181,153,6),(182,154,12),(183,155,9),(184,156,15),(185,157,9),(186,158,15),(187,159,12),(188,160,15),(189,161,9),(190,162,12),(191,163,15),(192,164,9),(193,165,15),(194,166,15),(195,167,12),(196,168,6),(197,169,15),(198,170,6),(199,171,9),(200,172,6),(201,173,12),(202,174,6),(203,175,12),(204,176,12),(205,177,15),(206,178,15),(207,179,15),(208,180,6),(209,181,9),(210,182,12),(211,183,12),(212,184,12),(213,185,15),(214,186,15),(215,187,6),(216,188,9),(217,189,12),(218,190,12),(219,191,15),(220,192,6),(221,193,6),(222,194,12),(223,195,12),(224,196,12),(225,197,9),(226,198,15),(227,199,6),(228,200,6),(229,201,9),(230,202,15),(231,203,12),(232,204,15),(233,205,12),(234,206,12),(235,207,15),(236,208,15),(237,209,6),(238,210,6),(239,211,9),(240,212,12),(241,213,12),(242,214,15),(243,215,6),(244,216,9),(245,217,12),(246,218,12),(247,219,15),(248,220,15),(249,221,12),(250,222,12),(251,223,6),(252,224,6),(253,225,12),(254,226,15),(255,227,6),(256,228,6),(257,229,6),(258,230,15),(259,231,15),(260,232,12),(261,233,12),(262,234,15),(263,235,6),(264,236,9),(265,237,15),(266,238,15),(267,239,6),(268,240,12),(269,241,9),(270,242,6),(271,243,15),(272,244,12),(273,245,15),(274,246,15),(275,247,12),(276,248,12),(277,249,15),(278,250,12),(279,251,6),(280,252,15),(281,253,6),(282,254,6),(283,255,12),(284,256,15),(285,257,12),(286,258,6),(287,259,9),(288,260,6),(289,261,12),(290,262,6),(291,263,6),(292,264,15),(293,265,15),(294,266,9),(295,267,12),(296,268,12),(297,269,12),(298,270,12),(299,271,15),(300,272,15),(301,273,15),(302,274,15),(303,275,15),(304,276,6),(305,277,9),(306,278,6),(307,279,6),(308,280,9),(309,281,15),(310,282,9),(311,283,6),(312,284,15),(313,285,6),(314,286,12),(315,287,9),(316,288,12),(317,289,15),(318,290,12),(319,291,15),(320,292,15),(321,293,6),(322,294,6),(323,295,6),(324,296,15),(325,297,9),(326,298,12),(327,299,9),(328,300,6),(329,301,9),(330,302,12),(331,303,6),(332,304,12),(333,305,12),(334,306,15),(335,307,9),(336,308,12),(337,309,15),(338,310,12),(339,311,12),(340,312,15),(341,313,9),(342,314,12),(343,315,15),(344,316,9),(345,317,15),(346,318,15),(347,319,15),(348,320,12),(349,321,15),(350,322,15),(351,323,6),(352,324,6),(353,325,12),(354,326,12),(355,327,12),(356,328,9),(357,329,9),(358,330,6),(359,331,12),(360,332,12),(361,333,9),(362,334,12),(363,335,6),(364,336,6),(365,337,9),(366,338,12),(367,339,15),(368,340,15),(369,341,6),(370,342,6),(371,343,12),(372,344,6),(373,345,12),(374,346,6),(375,347,15),(376,348,9),(377,349,12),(378,350,15),(379,351,15),(405,122,1),(406,122,8),(407,122,9),(413,363,37),(488,356,15),(489,356,7),(490,365,15),(491,365,7),(492,366,15),(493,366,7),(494,45,37),(495,75,37);
/*!40000 ALTER TABLE `positions_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_favourite`
--

DROP TABLE IF EXISTS `post_favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post_favourite` (
  `post_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`employee_id`),
  KEY `FK_Empl_idx` (`employee_id`),
  CONSTRAINT `FK_Empl` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `FK_Post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `is_pulished` tinyint(4) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `like_total` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `creator_id_idx` (`create_by`),
  KEY `editor_id_idx` (`modify_by`),
  CONSTRAINT `creator_id` FOREIGN KEY (`create_by`) REFERENCES `employees` (`id`),
  CONSTRAINT `editor_id` FOREIGN KEY (`modify_by`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_id` int(11) NOT NULL DEFAULT '-1',
  `field_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '-1',
  `field_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proposal_details_proposals1_idx` (`proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_details`
--

LOCK TABLES `proposal_details` WRITE;
/*!40000 ALTER TABLE `proposal_details` DISABLE KEYS */;
INSERT INTO `proposal_details` VALUES (1,1,'1','Mục đích/Lý do','Ghét kim tám việc.'),(2,1,'2','Tình trạng hư hỏng','Nhà ngọt xuồng tui ghét thích may bạn xanh.\nLỗi mây ghế hóa.\nÁ bốn tủ bè.\nBàn bảy biết.\nLỗi bốn mướn phá núi tủ.'),(3,1,'3','Số phòng','11426'),(4,1,'4','Ghi chú','Quê tủ chỉ.'),(5,2,'1','Mục đích/Lý do','Tàu chỉ làm biển em leo bốn tám.'),(6,2,'2','Tình trạng hư hỏng','Mượn đang xuồng năm đỏ nón.\nTàu đang con bạn đá hết.'),(7,2,'3','Số phòng','24170'),(8,2,'4','Ghi chú','Chết đập được làm quần việc mười bốn thuê.\nQuần tôi khoảng hết ừ bơi xanh thích leo.\nLỗi khoan giày chết núi độc anh nhà yêu.\nTui bàn biết biển dép kim nước ác giết.\nNăm độc sáu chìm đang đá việc chín tôi được.'),(9,3,'1','Mục đích/Lý do','Đồng gió tàu cái khoan khoan nhà.'),(10,3,'2','Tình trạng hư hỏng','Đã đã tủ anh ruộng xe.\nDép thương hóa phá nha ngọt thì thích đập đang.'),(11,3,'3','Số phòng','11018'),(12,3,'4','Ghi chú','Độc ừ mướn con.\nHết bảy chỉ viết.\nGì được kim quần.'),(13,4,'1','Mục đích/Lý do','Độc trời bạn giết giày đã thích.'),(14,4,'2','Tình trạng hư hỏng','Đỏ giày khoan.\nXe là không hết nón xuồng thuê.\nTui bạn ờ đạp làm hóa tám thế nhà bè.\nBảy thuyền chỉ ghế thế.'),(15,4,'3','Số phòng','26117'),(16,4,'4','Ghi chú','Tui khâu là thôi chỉ ghế chín chỉ núi.\nRuộng cửa đập khoảng làm.'),(17,5,'1','Mục đích/Lý do','Thế thế lỗi không không con cửa bốn.'),(18,5,'2','Tình trạng hư hỏng','Thôi chìm ba năm hết gió chết tím nón.\nXanh đạp núi nha hết con nha chìm.'),(19,5,'3','Số phòng','18444'),(20,5,'4','Ghi chú','Đồng hết khoan lầu tui đập vẽ ờ vàng.\nĐã là ruộng mướn tím chết ruộng.\nLàm đang leo năm tô thôi.'),(21,6,'1','Mục đích/Lý do','Khoan mười núi dép may chỉ độc áo.'),(22,6,'2','Tình trạng hư hỏng','Thôi tủ hết kim.\nCửa lầu chỉ thuê quê núi bốn chết khâu vẽ.\nĐược làm giết tui nghỉ trời tủ thì á cửa.'),(23,6,'3','Số phòng','27617'),(24,6,'4','Ghi chú','Cái máy đã.'),(25,7,'1','Mục đích/Lý do','Tám xanh vá biển việc giày leo thế mười đang.'),(26,7,'2','Tình trạng hư hỏng','Ruộng xe đánh kim hết mười.\nMượn vá lỗi á.\nLầu lầu năm thôi núi viết.\nSáu việc mượn ngọt.'),(27,7,'3','Số phòng','28305'),(28,7,'4','Ghi chú','Xuồng đỏ thích á.\nCon tô tàu thôi đá ác trời đồng nha.'),(29,8,'1','Mục đích/Lý do','Yêu đập máy bốn kim biết tàu.'),(30,8,'2','Tình trạng hư hỏng','Độc ruộng thương khoảng được.\nMột leo không.\nMột đã không đỏ giày một hết giày.'),(31,8,'3','Số phòng','27700'),(32,8,'4','Ghi chú','Cái tủ đỏ em đá quê ờ ngọt vàng được.\nTàu chìm thương đỏ.'),(33,9,'1','Mục đích/Lý do','Ờ ghế tủ ờ hàng được hết kim bè chín.'),(34,9,'2','Tình trạng hư hỏng','Anh thế ruộng xe leo năm mua thế thôi.\nNha thương xuồng hương.'),(35,9,'3','Số phòng','24445'),(36,9,'4','Ghi chú','Hết cái leo trời mười thuyền.'),(37,10,'1','Mục đích/Lý do','Chìm gì đang đạp may đỏ được lỗi đâu giết.'),(38,10,'2','Tình trạng hư hỏng','Nước trời xanh.'),(39,10,'3','Số phòng','6437'),(40,10,'4','Ghi chú','Chỉ đập đá áo khoảng tím viết.\nXuồng tôi thích khoan tủ tô đập thuê trời.\nMột thuê năm chìm đá chỉ nha lầu quê hàng.\nHết viết lầu nghỉ nước sáu hai leo đã thế.\nNăm giày đánh nhà xuồng hai ghét.'),(41,11,'1','Mục đích/Lý do','Chỉ thích máy ba xuồng đập.'),(42,11,'2','Tình trạng hư hỏng','Thế ờ được thuyền mướn viết.\nBiển viết bơi đâu yêu yêu áo.\nHết ghét hết ừ đang bè hết mây.'),(43,11,'3','Số phòng','31477'),(44,11,'4','Ghi chú','Khoan thương thích thuê mây giết giết.\nĐồng bốn đang chết leo khoảng.\nCái một bè mượn đỏ ba nha dép tôi.\nĐồng kim giết xe năm ngọt trăng trời ngọt ngọt.\nMười tím ghét thuê một thuê.'),(45,12,'1','Mục đích/Lý do','Ác đâu đập ruộng làm.'),(46,12,'2','Tình trạng hư hỏng','Khâu dép nha đỏ chìm làm.\nĐâu quần con khoảng đỏ thôi.\nXuồng kim bảy là lỗi.'),(47,12,'3','Số phòng','21759'),(48,12,'4','Ghi chú','Thích được chín khoảng ghét em độc mây leo.\nViết con quê vẽ ừ vàng gió.'),(49,13,'1','Mục đích/Lý do','Anh làm chết tô xe chín đang vẽ giết.'),(50,13,'2','Tình trạng hư hỏng','Hai nón mượn núi viết cái.\nGió ghét ruộng chìm tàu mướn thế đập nón.\nKhoảng leo mượn con vàng núi áo một.'),(51,13,'3','Số phòng','12254'),(52,13,'4','Ghi chú','Áo mượn ừ nghỉ đập làm.\nTám xanh chìm mây mây làm núi độc.\nMười tôi chìm đồng khoảng.'),(53,14,'1','Mục đích/Lý do','Nhà xe mười may viết.'),(54,14,'2','Tình trạng hư hỏng','Tôi nước chín em đồng là phá.\nThương hóa tui vàng thuyền núi đang vá xuồng ba.'),(55,14,'3','Số phòng','1573'),(56,14,'4','Ghi chú','Áo năm lỗi tủ viết thôi mười đỏ.\nĐâu gió năm bơi biết bơi gió mười.\nBiết ác mây trăng quê thuyền sáu đạp làm vàng.'),(57,15,'1','Mục đích/Lý do','Đã trăng chìm.'),(58,15,'2','Tình trạng hư hỏng','Đập mười viết tui năm việc bạn.\nGhế dép giày tui.\nĐược giết đạp mướn ờ sáu tôi thế.\nThích chết đỏ nước hai tàu hương ghét.'),(59,15,'3','Số phòng','435'),(60,15,'4','Ghi chú','Thì tàu độc quê ừ đồng.\nBè nghỉ đỏ bảy mượn nghỉ gì xe.\nKhâu mây hàng ghế khâu xuồng thuyền.\nEm hai dép.'),(61,16,'1','Mục đích/Lý do','Hết vá nghỉ bạn thuyền.'),(62,16,'2','Tình trạng hư hỏng','Đang bơi ác.\nBiển xanh hết khoan thôi hương yêu anh.\nChín quần vá yêu ba xuồng hương nón mượn chết.\nMua trời chết nước leo thương dép ừ nha độc.\nỪ đá mười biển mua.'),(63,16,'3','Số phòng','31537'),(64,16,'4','Ghi chú','Nghỉ đã dép.\nĐạp hết khoảng giày thuyền đạp đâu tôi dép cái.'),(65,17,'1','Mục đích/Lý do','Cửa đánh chết ờ chín.'),(66,17,'2','Tình trạng hư hỏng','Đập ác vá trăng khoan.'),(67,17,'3','Số phòng','23962'),(68,17,'4','Ghi chú','Mười tàu thích trời bốn đang vàng cái.\nGhét ờ hóa tủ thì con phá.\nLầu mây xe ngọt nha thích thương chìm chết.\nÁo tủ đá là tô tôi nghỉ mây.'),(69,18,'1','Mục đích/Lý do','Yêu áo mượn độc bè.'),(70,18,'2','Tình trạng hư hỏng','Chỉ chín giày anh bảy hết được.\nTrăng con anh khâu núi mua vá đang.\nSáu khoan tím tủ bơi xanh.\nYêu sáu viết năm thương.\nThì xuồng bạn chỉ may tím.'),(71,18,'3','Số phòng','18366'),(72,18,'4','Ghi chú','Làm khoảng bảy may bè sáu xanh.\nAnh không ghế con khoảng chết thích phá bè thế.\nYêu đánh giết em biển xe cửa cửa.'),(73,19,'1','Mục đích/Lý do','Tô đá chín con việc máy vá thuyền.'),(74,19,'2','Tình trạng hư hỏng','Vàng nước vàng chìm.'),(75,19,'3','Số phòng','26750'),(76,19,'4','Ghi chú','Nhà thì gì.\nGì giày đang bốn vẽ bốn.\nLà ba nước khâu thì.\nGhế tui làm.\nViệc thế độc thuyền cái tủ.'),(77,20,'1','Mục đích/Lý do','Leo máy khoảng nhà một ghế.'),(78,20,'2','Tình trạng hư hỏng','Ừ gió bảy.'),(79,20,'3','Số phòng','6651'),(80,20,'4','Ghi chú','Quần thế con chỉ.\nLà ruộng nhà vá ruộng tôi.'),(81,21,'1','Mục đích/Lý do','Nha cái cái.'),(82,21,'2','Tình trạng hư hỏng','Thương hương ghế áo.'),(83,21,'3','Số phòng','9236'),(84,21,'4','Ghi chú','Một may vàng kim năm gió bạn làm.'),(85,22,'1','Mục đích/Lý do','Tàu ừ núi đá bơi chìm thuyền máy nước thì.'),(86,22,'2','Tình trạng hư hỏng','Nhà hàng giày.\nGì lầu đập đồng nhà xe nón thì đập nha.\nĐạp đánh xuồng lỗi nhà quần.\nTrăng độc ba bơi.\nGhế đạp sáu đâu hết đâu quê.'),(87,22,'3','Số phòng','24531'),(88,22,'4','Ghi chú','Khâu anh nón con bơi dép ruộng được ba xanh.\nGì độc hàng đánh tôi cái không cửa đang.\nThôi thuê trăng thì tàu.\nCái tám hết.'),(89,23,'1','Mục đích/Lý do','Bè tủ máy thế khâu cái khoan tôi.'),(90,23,'2','Tình trạng hư hỏng','Đã tô ghế tím giết xanh leo trời thế.\nBiết em xanh quần đỏ khoảng hương ừ khoảng thôi.\nVá lỗi đá đồng không giết ruộng tôi.'),(91,23,'3','Số phòng','9293'),(92,23,'4','Ghi chú','Nha núi tui thương đang mượn mua ừ thế quê.\nGhế chỉ độc thương năm bảy phá tàu mướn tô.\nVẽ cửa nước mua tám.\nKhoảng nhà yêu núi chìm.\nChỉ nghỉ tàu con tôi được dép kim.'),(93,24,'1','Mục đích/Lý do','Dép bơi ruộng bạn lầu ừ giày ba mua.'),(94,24,'2','Tình trạng hư hỏng','Ngọt bốn thì chỉ vá ừ hàng giết.\nPhá núi hương.'),(95,24,'3','Số phòng','15994'),(96,24,'4','Ghi chú','Ghét ừ đập tôi thôi trời khoan.\nXe nha gì tui ngọt.\nĐã được độc mượn vá.\nLầu mua yêu gì.'),(97,25,'1','Mục đích/Lý do','Bạn hàng việc đá may bơi tàu.'),(98,25,'2','Tình trạng hư hỏng','Nước tô dép con ghế nón độc đánh.\nVá lỗi đang hàng thương ngọt dép anh hết.\nBảy nhà bảy là chìm con được.\nNhà hương ba trăng cái được.\nChín đập vàng mướn viết đá dép.'),(99,25,'3','Số phòng','24749'),(100,25,'4','Ghi chú','Bảy đập đập thích khâu viết bè.\nThích xe khoan xuồng bè hết giày vàng chết quê.\nViết gió chết.'),(101,26,'1','Mục đích/Lý do','Khâu đỏ tô.'),(102,26,'2','Tình trạng hư hỏng','Một núi á gì.'),(103,26,'3','Số phòng','15667'),(104,26,'4','Ghi chú','Chỉ yêu năm.\nViết đồng lỗi một nha.\nNăm tô máy ngọt thương trời là đâu bàn.\nThế thế đồng may con đã hàng ruộng phá máy.\nGiết mua gì mây đang mượn.'),(105,27,'1','Mục đích/Lý do','Chìm hóa hóa ghét.'),(106,27,'2','Tình trạng hư hỏng','Thích núi thương năm đá gió.\nKhâu trăng đánh ngọt.'),(107,27,'3','Số phòng','8917'),(108,27,'4','Ghi chú','Chín chín viết quần chỉ.\nChết quê đập bơi chỉ bạn.\nChín vẽ bạn quần hóa giày hương cái.\nAnh tám mướn xe thương núi nha không năm.\nĐánh đỏ tôi biển may biết nha xanh yêu.'),(109,28,'1','Mục đích/Lý do','Mười hết tôi tui bảy thì tô khoảng hết vàng.'),(110,28,'2','Tình trạng hư hỏng','Là kim gió đang hết vàng chín.\nThuê thế núi.\nMướn xuồng mướn ờ xanh trăng tô.'),(111,28,'3','Số phòng','9601'),(112,28,'4','Ghi chú','Xe nhà đồng tui chín lầu.\nMay bảy phá độc trời vẽ thế.\nGì trăng ghét thế tàu tím con kim năm.\nTủ khâu áo leo hết khoan áo ngọt.\nChết anh thì gì phá.'),(113,29,'1','Mục đích/Lý do','Anh hàng hàng được đâu ngọt thì mượn biết lầu.'),(114,29,'2','Tình trạng hư hỏng','Quần độc thích lầu tám.\nTrời bạn ngọt thì mua.\nLeo lầu là mua con chỉ xuồng mua giết đỏ.\nXe việc tàu.'),(115,29,'3','Số phòng','4926'),(116,29,'4','Ghi chú','Á con mười hương mua thương.'),(117,30,'1','Mục đích/Lý do','Tô bốn năm mướn.'),(118,30,'2','Tình trạng hư hỏng','Yêu thuyền bè may bốn chìm mướn nghỉ khâu cửa.\nThì yêu mua đỏ giết đâu mua khâu ruộng.\nGhét thích may nón cái.\nTôi bảy mười tủ bè chỉ núi thôi đồng.\nThích đá thuyền thuyền một thương ghét hết anh.'),(119,30,'3','Số phòng','4668'),(120,30,'4','Ghi chú','Cửa bảy nghỉ máy.'),(121,31,'1','Mục đích/Lý do','Tô bốn năm mướn.'),(122,31,'2','Tình trạng hư hỏng','Yêu thuyền bè may bốn chìm mướn nghỉ khâu cửa.\nThì yêu mua đỏ giết đâu mua khâu ruộng.\nGhét thích may nón cái.\nTôi bảy mười tủ bè chỉ núi thôi đồng.\nThích đá thuyền thuyền một thương ghét hết anh.'),(123,31,'3','Số phòng','4668'),(124,31,'4','Ghi chú','Cửa bảy nghỉ máy.');
/*!40000 ALTER TABLE `proposal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_type_details`
--

DROP TABLE IF EXISTS `proposal_type_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal_type_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_type_id` int(11) DEFAULT NULL,
  `field_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '-1',
  `field_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data_type_id` int(11) DEFAULT NULL,
  `create_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_by` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `is_required` tinyint(4) NOT NULL DEFAULT '0',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `placeholder` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `feedback` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_type_details_data_types1_idx` (`data_type_id`),
  KEY `FKdvba7s6h0uitxnu1rh5vm2r1r` (`proposal_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposal_type_details`
--

LOCK TABLES `proposal_type_details` WRITE;
/*!40000 ALTER TABLE `proposal_type_details` DISABLE KEYS */;
INSERT INTO `proposal_type_details` VALUES (1,1,'1','purpose','Mục đích/Lý do',1,'-1','-1','2022-03-28','2022-03-28',1,'\"\'','Nhập mục đích/lý do tạo đề xuất..','Vui lòng nhập mục đích/lý do tạo đề xuất.'),(2,1,'2','depravity','Tình trạng hư hỏng',2,'-1','-1','2022-03-28','2022-03-28',1,'Các bạn điền rõ tình trạng hư hỏng của thiết bị để nhóm sửa chữa chuẩn bị sẳn dụng cụ để sửa chữa nhé!','Nhập tình trạng hư hỏng...','Vui lòng nhập tình trạng như hỏng.'),(3,1,'3','room','Số phòng',1,'-1','-1','2022-03-28','2022-03-28',1,'\"\"','Nhập số phòng...','Vui lòng nhập số phòng.'),(4,1,'4','note','Ghi chú',2,'-1','-1','2022-03-28','2022-03-28',0,'Các bạn mô tả vị trí của thiết bị hư hỏng trong phòng giúp mình nhé!','Nhập ghi chú...','Vui lòng nhập ghi chú.'),(5,2,'1','purpose','Mục đích/Lý do',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập mục đích/lý do tạo đề xuất..','Vui lòng nhập mục đích/lý do tạo đề xuất.'),(6,2,'2','supplies','Tên vật tư',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập tên vật tư','Vui lòng nhập tên vật tư.'),(7,2,'3','number','Số lượng',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập số lượng','Vui lòng nhập số lượng.'),(8,2,'4','price','Đơn gía',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập đơn giá','Vui lòng nhập đơn giá.');
/*!40000 ALTER TABLE `proposal_type_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposal_types`
--

DROP TABLE IF EXISTS `proposal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposal_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `active_flag` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_type_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT '-1',
  `status_id` int(11) DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_by` int(11) NOT NULL DEFAULT '-1',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `validflag` tinyint(4) DEFAULT NULL,
  `current_step` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_dexuat_TrangThai1_idx` (`status_id`),
  KEY `fk_proposals_proposal_types1_idx` (`proposal_type_id`),
  KEY `fk_proposals_employees1_idx` (`creator_id`),
  CONSTRAINT `fk_proposals_employees1` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_proposals_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals`
--

LOCK TABLES `proposals` WRITE;
/*!40000 ALTER TABLE `proposals` DISABLE KEYS */;
INSERT INTO `proposals` VALUES (1,1,45,1,10,'2022-03-28',-1,'2022-03-28',NULL,'1'),(2,1,54,2,10,'2022-03-29',-1,'2022-03-28',NULL,'1'),(3,1,75,3,10,'2022-03-30',-1,'2022-03-28',NULL,'1'),(4,1,15,4,10,'2022-04-01',-1,'2022-03-28',NULL,'1'),(5,1,48,3,10,'2022-04-02',-1,'2022-03-28',NULL,'1'),(6,1,19,4,10,'2022-04-03',-1,'2022-03-28',NULL,'1'),(7,1,9,6,10,'2022-04-04',-1,'2022-03-28',NULL,'1'),(8,1,10,60,10,'2022-04-05',-1,'2022-03-28',NULL,'1'),(9,1,66,33,10,'2022-04-06',-1,'2022-03-28',NULL,'1'),(10,1,22,23,10,'2022-04-07',-1,'2022-03-28',NULL,'1'),(11,1,75,12,10,'2022-04-08',-1,'2022-03-28',NULL,'1'),(12,1,17,65,10,'2022-04-09',-1,'2022-03-28',NULL,'1'),(13,1,10,43,10,'2022-04-10',-1,'2022-03-28',NULL,'1'),(14,1,17,11,10,'2022-04-11',-1,'2022-03-28',NULL,'1'),(15,1,72,8,10,'2022-04-12',-1,'2022-03-28',NULL,'1'),(16,1,38,9,10,'2022-04-13',-1,'2022-03-28',NULL,'1'),(17,1,47,35,10,'2022-04-14',-1,'2022-03-28',NULL,'1'),(18,1,69,37,10,'2022-04-15',-1,'2022-03-28',NULL,'1'),(19,1,32,89,10,'2022-04-16',-1,'2022-03-28',NULL,'1'),(20,1,41,150,10,'2022-04-17',-1,'2022-03-28',NULL,'1'),(21,1,19,1,1,'2022-04-18',-1,'2022-03-28',NULL,'1'),(22,1,75,2,1,'2022-04-19',-1,'2022-03-28',NULL,'1'),(23,1,75,3,1,'2022-04-20',-1,'2022-03-28',NULL,'1'),(24,1,66,4,1,'2022-04-21',-1,'2022-03-28',NULL,'1'),(25,1,8,5,1,'2022-04-22',-1,'2022-03-28',NULL,'1'),(26,1,47,6,1,'2022-04-23',-1,'2022-03-28',NULL,'1'),(27,1,37,7,1,'2022-04-24',-1,'2022-03-28',NULL,'2'),(28,1,69,8,1,'2022-04-25',-1,'2022-03-28',NULL,'2'),(29,1,5,9,1,'2022-04-26',-1,'2022-03-28',NULL,'1'),(30,1,23,19,1,'2022-04-27',-1,'2022-03-28',NULL,'1'),(31,2,45,20,1,'2022-04-28',-1,'2022-03-28',NULL,'1');
/*!40000 ALTER TABLE `proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proposals_permissions`
--

DROP TABLE IF EXISTS `proposals_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposals_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_type_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_proposal_permissions_proposal_types1_idx` (`proposal_type_id`),
  KEY `fk_proposal_permissions_departments1_idx` (`department_id`),
  KEY `fk_proposal_permissions_positions1_idx` (`position_id`),
  KEY `fk_proposal_permissions_employees1_idx` (`employee_id`),
  CONSTRAINT `fk_proposal_permissions_departments1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_proposal_permissions_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_proposal_permissions_positions1` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `fk_proposal_permissions_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `create_by` int(11) NOT NULL DEFAULT '-1',
  `modify_by` int(11) NOT NULL DEFAULT '-1',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`),
  KEY `fk_role_details_permissions1_idx` (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_details`
--

LOCK TABLES `role_details` WRITE;
/*!40000 ALTER TABLE `role_details` DISABLE KEYS */;
INSERT INTO `role_details` VALUES (1,1,5,1,-1,-1,'2022-03-28','2022-03-28'),(2,1,5,2,-1,-1,'2022-03-28','2022-03-28'),(3,1,5,3,-1,-1,'2022-03-28','2022-03-28'),(4,1,5,4,-1,-1,'2022-03-28','2022-03-28'),(5,2,5,1,-1,-1,'2022-03-28','2022-03-28'),(6,2,5,2,-1,-1,'2022-03-28','2022-03-28'),(7,2,5,3,-1,-1,'2022-03-28','2022-03-28'),(8,2,5,4,-1,-1,'2022-03-28','2022-03-28'),(9,4,5,1,-1,-1,'2022-03-28','2022-03-28'),(10,5,5,1,-1,-1,'2022-03-28','2022-03-28'),(11,1,4,1,-1,-1,'2022-03-28','2022-03-28'),(12,1,4,2,-1,-1,'2022-03-28','2022-03-28'),(13,1,4,3,-1,-1,'2022-03-28','2022-03-28'),(14,1,4,4,-1,-1,'2022-03-28','2022-03-28'),(15,1,4,5,-1,-1,'2022-03-28','2022-03-28'),(16,1,4,6,-1,-1,'2022-03-28','2022-03-28'),(17,2,4,1,-1,-1,'2022-03-28','2022-03-28'),(18,2,4,2,-1,-1,'2022-03-28','2022-03-28'),(19,2,4,3,-1,-1,'2022-03-28','2022-03-28'),(20,2,4,4,-1,-1,'2022-03-28','2022-03-28'),(21,2,4,5,-1,-1,'2022-03-28','2022-03-28'),(22,2,4,6,-1,-1,'2022-03-28','2022-03-28'),(23,4,4,1,-1,-1,'2022-03-28','2022-03-28'),(24,5,4,1,-1,-1,'2022-03-28','2022-03-28'),(25,6,4,1,-1,-1,'2022-03-28','2022-03-28'),(26,1,6,1,-1,-1,'2022-03-28','2022-03-28'),(27,1,6,2,-1,-1,'2022-03-28','2022-03-28'),(28,1,6,3,-1,-1,'2022-03-28','2022-03-28'),(29,1,6,4,-1,-1,'2022-03-28','2022-03-28'),(30,2,6,1,-1,-1,'2022-03-28','2022-03-28'),(31,2,6,2,-1,-1,'2022-03-28','2022-03-28'),(32,2,6,3,-1,-1,'2022-03-28','2022-03-28'),(33,2,6,4,-1,-1,'2022-03-28','2022-03-28'),(34,4,6,1,-1,-1,'2022-03-28','2022-03-28'),(35,5,6,1,-1,-1,'2022-03-28','2022-03-28'),(36,6,6,1,-1,-1,'2022-03-28','2022-03-28'),(37,1,1,1,-1,-1,'2022-03-28','2022-03-28'),(38,1,2,1,-1,-1,'2022-03-28','2022-03-28'),(39,1,3,1,-1,-1,'2022-03-28','2022-03-28'),(40,1,7,1,-1,-1,'2022-03-28','2022-03-28'),(41,1,8,1,-1,-1,'2022-03-28','2022-03-28'),(42,1,8,2,-1,-1,'2022-03-28','2022-03-28'),(43,1,8,3,-1,-1,'2022-03-28','2022-03-28'),(44,1,8,4,-1,-1,'2022-03-28','2022-03-28'),(45,2,8,1,-1,-1,'2022-03-28','2022-03-28'),(46,2,8,2,-1,-1,'2022-03-28','2022-03-28'),(47,2,8,3,-1,-1,'2022-03-28','2022-03-28'),(48,2,8,4,-1,-1,'2022-03-28','2022-03-28'),(49,3,8,1,-1,-1,'2022-03-28','2022-03-28'),(50,3,8,2,-1,-1,'2022-03-28','2022-03-28'),(51,3,8,3,-1,-1,'2022-03-28','2022-03-28'),(52,3,8,4,-1,-1,'2022-03-28','2022-03-28'),(53,4,8,1,-1,-1,'2022-03-28','2022-03-28'),(54,4,8,2,-1,-1,'2022-03-28','2022-03-28'),(55,4,8,3,-1,-1,'2022-03-28','2022-03-28'),(56,4,8,4,-1,-1,'2022-03-28','2022-03-28'),(57,5,8,1,-1,-1,'2022-03-28','2022-03-28'),(58,5,8,2,-1,-1,'2022-03-28','2022-03-28'),(59,5,8,3,-1,-1,'2022-03-28','2022-03-28'),(60,5,8,4,-1,-1,'2022-03-28','2022-03-28'),(61,6,8,1,-1,-1,'2022-03-28','2022-03-28'),(62,6,8,2,-1,-1,'2022-03-28','2022-03-28'),(63,6,8,3,-1,-1,'2022-03-28','2022-03-28'),(64,6,8,4,-1,-1,'2022-03-28','2022-03-28'),(65,7,8,1,-1,-1,'2022-03-28','2022-03-28'),(66,7,8,2,-1,-1,'2022-03-28','2022-03-28'),(67,7,8,3,-1,-1,'2022-03-28','2022-03-28'),(68,7,8,4,-1,-1,'2022-03-28','2022-03-28'),(69,8,8,1,-1,-1,'2022-03-28','2022-03-28'),(70,8,8,2,-1,-1,'2022-03-28','2022-03-28'),(71,8,8,3,-1,-1,'2022-03-28','2022-03-28'),(72,8,8,4,-1,-1,'2022-03-28','2022-03-28'),(73,9,8,1,-1,-1,'2022-03-28','2022-03-28'),(74,9,8,2,-1,-1,'2022-03-28','2022-03-28'),(75,9,8,3,-1,-1,'2022-03-28','2022-03-28'),(76,9,8,4,-1,-1,'2022-03-28','2022-03-28'),(77,10,8,1,-1,-1,'2022-03-28','2022-03-28'),(78,10,8,2,-1,-1,'2022-03-28','2022-03-28'),(79,10,8,3,-1,-1,'2022-03-28','2022-03-28'),(80,10,8,4,-1,-1,'2022-03-28','2022-03-28'),(81,11,8,1,-1,-1,'2022-03-28','2022-03-28'),(82,11,8,2,-1,-1,'2022-03-28','2022-03-28'),(83,11,8,3,-1,-1,'2022-03-28','2022-03-28'),(84,11,8,4,-1,-1,'2022-03-28','2022-03-28');
/*!40000 ALTER TABLE `role_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Hoàn tất'),(2,'Bị từ chối'),(3,'Đã huỷ'),(4,'Mới'),(5,'Đang làm'),(6,'Chờ xác nhận'),(7,'Hoàn thành'),(8,'Quá hạn'),(9,'Chờ'),(10,'Chờ duyệt');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_his`
--

DROP TABLE IF EXISTS `task_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_status_task_his_idx` (`status_id`),
  KEY `fk_emp_task_his_idx` (`receiver_id`),
  KEY `task_task_his_idx` (`task_id`),
  CONSTRAINT `fk_emp_task_his` FOREIGN KEY (`receiver_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_status_task_his` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_task_his` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_his`
--

LOCK TABLES `task_his` WRITE;
/*!40000 ALTER TABLE `task_his` DISABLE KEYS */;
INSERT INTO `task_his` VALUES (2,2,2,24,'2022-12-03 19:12:00'),(3,3,4,72,'2022-12-03 19:12:00'),(5,5,4,35,'2022-12-03 19:12:00'),(6,6,8,79,'2022-12-03 19:12:00'),(7,7,4,9,'2022-12-03 19:12:00'),(8,8,8,26,'2022-12-03 19:12:00'),(9,9,7,93,'2022-12-03 19:12:00'),(10,10,4,41,'2022-12-03 19:12:00'),(11,11,4,88,'2022-12-03 19:12:00'),(12,12,5,67,'2022-12-03 19:12:00'),(13,13,7,77,'2022-12-03 19:12:00'),(14,14,9,99,'2022-12-03 19:12:00'),(15,15,8,53,'2022-12-03 19:12:00'),(16,16,9,44,'2022-12-03 19:12:00'),(17,17,4,42,'2022-12-03 19:12:00'),(18,18,6,74,'2022-12-03 19:12:00'),(19,19,5,61,'2022-12-03 19:12:00'),(20,20,3,16,'2022-12-03 19:12:00'),(21,21,9,39,'2022-12-03 19:12:00'),(22,22,9,84,'2022-12-03 19:12:00'),(23,23,2,2,'2022-12-03 19:12:00'),(24,24,4,90,'2022-12-03 19:12:00'),(25,25,8,88,'2022-12-03 19:12:00'),(26,26,5,24,'2022-12-03 19:12:00'),(27,27,1,45,'2022-12-03 19:12:00'),(28,28,6,26,'2022-12-03 19:12:00'),(29,29,3,42,'2022-12-03 19:12:00'),(30,30,9,77,'2022-12-03 19:12:00'),(31,3,5,72,'2022-12-03 19:12:00');
/*!40000 ALTER TABLE `task_his` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `receiver_id` int(11) DEFAULT NULL,
  `finish_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `priority` int(11) DEFAULT '0',
  `rate` int(11) DEFAULT '0',
  `start_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tasks_statuses1_idx` (`status_id`),
  KEY `fk_tasks_employees1_idx` (`creator_id`),
  KEY `fk_tasks_employees2_idx` (`receiver_id`),
  CONSTRAINT `fk_tasks_employees1` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_tasks_employees2` FOREIGN KEY (`receiver_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_tasks_statuses1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,2,57,'cửa á ác','Được vá không quần.','2022-09-03 19:12:00',24,'2022-08-03 19:12:00',1,1,'2022-09-03 19:13:00','2022-08-03 19:12:00'),(2,2,4,'tủ bè vẽ','Lỗi tám đồng làm mượn.\nKhông đang một mười bàn bảy tôi.\nRuộng áo tô đạp hàng.','2022-08-03 19:12:00',57,'2022-08-03 19:12:00',1,2,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(3,2,43,'chín đang may','Thương gì khâu chết dép chết ghét.\nBiển năm nha đập quần.\nViệc bảy vàng nhà dép đạp giày thì.','2022-08-03 19:12:00',57,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(4,8,8,'quê thuê trời','Đá may vẽ cửa không tô ghét.','2022-08-03 19:12:00',57,'2022-08-03 19:12:00',2,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(5,4,88,'đập tô tàu','Máy hết ghế leo đỏ hai gió.\nHai yêu xuồng tàu trăng thích đánh mua.\nBiết bè đạp.\nNgọt núi hàng á tui xuồng dép.','2022-08-03 19:12:00',57,'2022-08-03 19:12:00',2,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(6,8,33,'xuồng đâu lỗi','Việc tàu quê kim nghỉ xe.\nViệc tui sáu khâu khoan.','2022-08-03 19:12:00',26,'2022-08-03 19:12:00',2,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(7,7,85,'thuê được trăng','Cái năm nước mượn biển lỗi bơi xuồng ờ không.','2022-08-03 19:12:00',93,'2022-08-03 19:12:00',2,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(8,4,52,'mười biết áo','Bè tàu gì tủ ngọt xe quần bảy.','2022-08-03 19:12:00',41,'2022-08-03 19:12:00',5,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(9,4,11,'thuê vàng trời','Cửa mượn mua thì ba kim hết bảy mượn leo.','2022-08-03 19:12:00',88,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(10,5,9,'biển ruộng gió','Biết bàn viết bơi.','2022-08-03 19:12:00',67,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(11,7,18,'ờ bảy phá','Chỉ phá vẽ một chín một hết đâu.\nHết quê ruộng viết.','2022-08-03 19:12:00',77,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(12,9,58,'là khoảng biển','Yêu ác hàng thuyền yêu lầu.\nÁo ruộng chỉ thôi sáu núi.\nMây ác trăng anh bạn việc may vàng.','2022-08-03 19:12:00',99,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(13,8,44,'chỉ đã thì','Vá bơi trời trăng.\nGió vàng nha nước ghế quần anh chìm.\nGì ruộng đạp thôi tím.\nBơi khoảng đồng sáu.','2022-08-03 19:12:00',53,'2022-08-03 19:12:00',4,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(14,9,67,'hai thuyền xe','Đang em ghét nước thế lầu xe may.\nNúi vàng một độc.\nVá tím nước.','2022-08-03 19:12:00',44,'2022-08-03 19:12:00',4,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(15,1,97,'yêu biết tủ áo','<p>Hai áo cửa ờ tôi trời đã đang chỉ. Hết gì ngọt đánh vẽ đang được chết tím. Tủ hết vá hết. Vàng mua thuê làm mướn ghét. Tui chín viết bạn mướn thuê.</p>','2022-08-03 19:12:00',42,'2022-08-03 19:12:00',4,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(16,6,16,'vẽ yêu xuồng','Đã mượn đã.\nGhế hai chết kim làm năm em biển mượn.\nThuê hàng hết máy làm tô đạp chỉ tô viết.\nĐập đá anh ờ nghỉ thế.','2022-08-03 19:12:00',74,'2022-08-03 19:12:00',4,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(17,5,55,'đồng em xuồng','Áo bảy thuyền hóa là bạn thuê gió.\nLeo xuồng thì việc tui ngọt á nhà làm.\nGhế mười làm dép.\nLỗi xanh yêu cái.','2022-08-03 19:12:00',61,'2022-08-03 19:12:00',4,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(18,3,60,'hết nước lầu','Quần đồng máy chỉ.\nBạn ghét khoan hết.\nPhá bốn năm leo.\nMây vàng bạn ghét hai là.','2022-08-03 19:12:00',16,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(19,9,20,'dép lầu hương','Hết ba thì ừ núi thì được.\nHết bạn vàng vàng không quần trăng đánh không.\nQuê đá đồng nón xanh.','2022-08-03 19:12:00',39,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(20,9,60,'phá thôi đồng','Chìm thế núi tàu ghét mướn hương bơi ghế.\nMướn giết thôi.','2022-08-03 19:12:00',84,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(21,2,73,'một nghỉ tô','Đồng thôi lỗi.\nTủ tím chết biển chỉ thế ừ không mười.\nNăm đang tím phá thì năm ờ con mười.','2022-08-03 19:12:00',2,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(22,4,37,'thế biển máy','Thuê kim là đập vàng dép đang.\nHết gì em.','2022-08-03 19:12:00',90,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(23,8,13,'quê ghế thế','Ừ gió làm được nhà cái quê.\nNgọt làm tôi ngọt được gì thế anh cửa giết.\nTàu ừ gió tui mua may đồng.','2022-08-03 19:12:00',88,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(24,5,77,'kim viết hết','Cửa tàu tủ là á việc khoảng cái.\nNón khoảng gió vẽ trời vẽ leo may thì.','2022-08-03 19:12:00',24,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(25,1,5,'trời nước việc','Leo ghét một kim nghỉ quê.\nThôi lỗi thương năm.\nKhoan xuồng đá máy không.\nNón á tôi.','2022-08-03 19:12:00',45,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(26,6,50,'đỏ mua ngọt','Cửa ngọt giết gì ghét chỉ ruộng vá.\nNước đánh vá bàn xe xanh ruộng nước.\nÁo thuê mua thích bạn.\nVàng năm thuyền.','2022-08-03 19:12:00',26,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(27,1,97,'ác ờ may núi ngủ hành sơn','Chua co description nen day la default','2022-08-03 19:12:00',42,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(28,1,97,'hóa may núi ngủ hành sơn','<p>Chua co description nen day la default</p>','2022-08-03 19:12:00',77,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(29,4,100,'Test','sss','2022-08-03 19:12:00',316,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(30,1,19,'Sửa quạt 001','Quạt tạm thời xài được','2022-08-03 19:12:00',5,'2022-08-03 19:12:00',3,1,'2022-08-03 19:12:00','2022-08-03 19:12:00'),(31,1,20,'Test dữ liệu','Tạo mới công việc','2022-08-03 19:12:00',30,'2022-08-03 19:12:00',1,1,'2022-08-03 19:12:00','2022-07-15 10:18:36'),(32,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-15 10:20:30',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-15 10:20:30'),(33,9,20,'Test dữ liệu','Tạo mới công việc','2022-07-15 10:20:53',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-15 10:20:53'),(34,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-15 10:45:44',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-15 10:45:44'),(35,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:27',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:27'),(36,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:30',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:30'),(37,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:30',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:30'),(38,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:31',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:31'),(39,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:32',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:32'),(40,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:33',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:33'),(41,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:34',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:34'),(42,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:35',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:35'),(43,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:36',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:36'),(44,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:36',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:36'),(45,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:37',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 01:29:37'),(46,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 03:11:35',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 03:11:35'),(47,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 03:14:38',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 03:14:38'),(48,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 03:15:46',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 03:15:46'),(49,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 03:20:09',30,'2022-03-20 10:18:36',1,1,'2022-03-18 10:18:36','2022-07-16 03:20:09');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `head_position` int(11) NOT NULL DEFAULT '-1',
  `create_by` int(11) NOT NULL DEFAULT '-1',
  `modify_by` int(11) NOT NULL DEFAULT '-1',
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teams_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgqu2h8g8dkywvn6hdswglpcgc` (`employee_id`),
  KEY `FKjal5g6ir6je09j8dma510rka2` (`team_id`),
  CONSTRAINT `FKgqu2h8g8dkywvn6hdswglpcgc` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `FKjal5g6ir6je09j8dma510rka2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
SET character_set_client = utf8mb4;
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

-- Dump completed on 2022-07-27 21:21:46

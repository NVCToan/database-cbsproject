-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: cmd
-- ------------------------------------------------------
-- Server version	8.0.13
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approval_step_details`
--

LOCK TABLES `approval_step_details` WRITE;
/*!40000 ALTER TABLE `approval_step_details` DISABLE KEYS */;
INSERT INTO `approval_step_details` VALUES (1,1,1,-1,-1),(2,1,2,-1,-1),(3,1,3,-1,-1),(4,1,-1,-1,-1),(5,3,20,-1,-1),(6,2,45,-1,-1),(7,3,1,-1,-1);
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
  `approval_step_index` int(11) NOT NULL DEFAULT '1',
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
INSERT INTO `approval_steps` VALUES (1,'Phê duyệt',1,1),(2,'Kế toán',1,2),(3,'Kiểm tra',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'1','Ban Quản Lý KTX Cỏ May',-1,-1,-1,'2022-03-28','2022-03-28','test',1,1),(2,'2','Đội sửa chữa',1,-1,-1,'2022-03-28','2022-03-28','test',2,5),(3,'3','Tầng 1',2,-1,-1,'2022-03-28','2022-03-28','test',3,7),(4,'4','Tầng 2',2,-1,-1,'2022-03-28','2022-03-28','test',3,10),(5,'5','Tầng 3',2,-1,-1,'2022-03-28','2022-03-28','test',3,13),(6,'6','Tầng trệt',2,-1,-1,'2022-03-28','2022-03-28','test',3,16),(7,'7','Kiểm tra và giám sát sinh viên',1,-1,-1,'2022-03-28','2022-03-28','test',2,19),(8,'8','Tổ chức sự kiện',1,-1,-1,'2022-03-28','2022-03-28','test',2,-1),(9,'9','Truyền thông',1,-1,-1,'2022-03-28','2022-03-28','test',2,-1),(10,'10','Sinh viên',1,-1,-1,'2022-03-28','2022-03-28','test',2,-1),(131,'001','001',6,1,1,'2022-03-28','2022-03-28','test',4,45),(132,'002','002',6,1,1,'2022-03-28','2022-03-28','test',4,47),(133,'003','003',6,1,1,'2022-03-28','2022-03-28','test',4,49),(134,'004','004',6,1,1,'2022-03-28','2022-03-28','test',4,51),(135,'005','005',6,1,1,'2022-03-28','2022-03-28','test',4,53),(136,'006','006',6,1,1,'2022-03-28','2022-03-28','test',4,55),(137,'007','007',6,1,1,'2022-03-28','2022-03-28','test',4,57),(138,'008','008',6,1,1,'2022-03-28','2022-03-28','test',4,59),(139,'009','009',6,1,1,'2022-03-28','2022-03-28','test',4,61),(140,'010','010',6,1,1,'2022-03-28','2022-03-28','test',4,63),(141,'011','011',6,1,1,'2022-03-28','2022-03-28','test',4,65),(142,'012','012',6,1,1,'2022-03-28','2022-03-28','test',4,67),(143,'013','013',6,1,1,'2022-03-28','2022-03-28','test',4,69),(144,'014','014',6,1,1,'2022-03-28','2022-03-28','test',4,71),(145,'015','015',6,1,1,'2022-03-28','2022-03-28','test',4,73),(146,'016','016',6,1,1,'2022-03-28','2022-03-28','test',4,75),(147,'017','017',6,1,1,'2022-03-28','2022-03-28','test',4,77),(148,'018','018',6,1,11,'2022-03-28','2022-03-28','test',4,79),(149,'101','101',3,1,1,'2022-03-28','2022-03-28','test',4,81),(150,'102','102',3,1,1,'2022-03-28','2022-03-28','test',4,83),(151,'103','103',3,1,1,'2022-03-28','2022-03-28','test',4,85),(152,'104','104',3,1,1,'2022-03-28','2022-03-28','test',4,87),(203,'105','105',3,-1,-1,'2022-03-28','2022-03-28','test',4,92),(204,'106','106',3,-1,-1,'2022-03-28','2022-03-28','test',4,94),(205,'107','107',3,-1,-1,'2022-03-28','2022-03-28','test',4,96),(206,'108','108',3,-1,-1,'2022-03-28','2022-03-28','test',4,98),(207,'109','109',3,-1,-1,'2022-03-28','2022-03-28','test',4,100),(208,'110','110',3,-1,-1,'2022-03-28','2022-03-28','test',4,102),(209,'111','111',3,-1,-1,'2022-03-28','2022-03-28','test',4,104),(210,'112','112',3,-1,-1,'2022-03-28','2022-03-28','test',4,106),(211,'113','113',3,-1,-1,'2022-03-28','2022-03-28','test',4,108),(212,'114','114',3,-1,-1,'2022-03-28','2022-03-28','test',4,110),(213,'115','115',3,-1,-1,'2022-03-28','2022-03-28','test',4,112),(214,'116','116',3,-1,-1,'2022-03-28','2022-03-28','test',4,114),(215,'117','117',3,-1,-1,'2022-03-28','2022-03-28','test',4,116),(216,'118','118',3,-1,-1,'2022-03-28','2022-03-28','test',4,118),(217,'201','201',4,-1,-1,'2022-03-28','2022-03-28','test',4,120),(218,'202','202',4,-1,-1,'2022-03-28','2022-03-28','test',4,122),(219,'203','203',4,-1,-1,'2022-03-28','2022-03-28','test',4,124),(220,'204','204',4,-1,-1,'2022-03-28','2022-03-28','test',4,126),(221,'205','205',4,-1,-1,'2022-03-28','2022-03-28','test',4,128),(222,'206','206',4,-1,-1,'2022-03-28','2022-03-28','test',4,130),(223,'207','207',4,-1,-1,'2022-03-28','2022-03-28','test',4,132),(224,'208','208',4,-1,-1,'2022-03-28','2022-03-28','test',4,134),(225,'209','209',4,-1,-1,'2022-03-28','2022-03-28','test',4,136),(226,'210','210',4,-1,-1,'2022-03-28','2022-03-28','test',4,138),(227,'211','211',4,-1,-1,'2022-03-28','2022-03-28','test',4,140),(228,'212','212',4,-1,-1,'2022-03-28','2022-03-28','test',4,142),(229,'213','213',4,-1,-1,'2022-03-28','2022-03-28','test',4,144),(230,'214','214',4,-1,-1,'2022-03-28','2022-03-28','test',4,146),(231,'215','215',4,-1,-1,'2022-03-28','2022-03-28','test',4,148),(232,'216','216',4,-1,-1,'2022-03-28','2022-03-28','test',4,150),(233,'217','217',4,-1,-1,'2022-03-28','2022-03-28','test',4,152),(234,'218','218',4,-1,-1,'2022-03-28','2022-03-28','test',4,154),(235,'301','301',5,-1,-1,'2022-03-28','2022-03-28','test',4,156),(236,'302','302',5,-1,-1,'2022-03-28','2022-03-28','test',4,158),(237,'303','303',5,-1,-1,'2022-03-28','2022-03-28','test',4,160),(238,'304','304',5,-1,-1,'2022-03-28','2022-03-28','test',4,162),(239,'305','305',5,-1,-1,'2022-03-28','2022-03-28','test',4,164),(240,'306','306',5,-1,-1,'2022-03-28','2022-03-28','test',4,166),(241,'307','307',5,-1,-1,'2022-03-28','2022-03-28','test',4,168),(242,'308','308',5,-1,-1,'2022-03-28','2022-03-28','test',4,170),(243,'309','309',5,-1,-1,'2022-03-28','2022-03-28','test',4,172),(244,'310','310',5,-1,-1,'2022-03-28','2022-03-28','test',4,174),(245,'311','311',5,-1,-1,'2022-03-28','2022-03-28','test',4,176),(246,'312','312',5,-1,-1,'2022-03-28','2022-03-28','test',4,178),(247,'313','313',5,-1,-1,'2022-03-28','2022-03-28','test',4,180),(248,'314','314',5,-1,-1,'2022-03-28','2022-03-28','test',4,182),(249,'315','315',5,-1,-1,'2022-03-28','2022-03-28','test',4,184),(250,'316','316',5,-1,-1,'2022-03-28','2022-03-28','test',4,186),(251,'317','317',5,-1,-1,'2022-03-28','2022-03-28','test',4,188),(252,'318','318',5,-1,-1,'2022-03-28','2022-03-28','test',4,190);
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
  KEY `fk_employee_id_idx` (`employee_id`),
  CONSTRAINT `fk_departments_employees` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_employees_departments` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments_employees`
--

LOCK TABLES `departments_employees` WRITE;
/*!40000 ALTER TABLE `departments_employees` DISABLE KEYS */;
INSERT INTO `departments_employees` VALUES (7,210,7),(9,239,9),(10,234,10),(12,212,12),(13,214,13),(14,238,14),(15,232,15),(16,223,16),(17,240,17),(18,215,18),(19,218,19),(21,217,21),(23,222,23),(24,237,24),(25,216,25),(27,208,27),(28,229,28),(29,241,29),(32,208,32),(33,203,33),(34,206,34),(35,203,35),(36,226,36),(37,235,37),(38,149,38),(39,203,39),(40,212,40),(41,149,41),(42,230,42),(43,236,43),(44,246,44),(45,151,45),(46,246,46),(47,211,47),(48,235,48),(49,213,49),(50,241,50),(51,209,51),(52,247,52),(53,218,53),(54,226,54),(55,231,55),(56,230,56),(57,220,57),(58,239,58),(59,149,59),(60,238,60),(61,205,61),(62,205,62),(63,217,63),(64,241,64),(65,206,65),(66,214,66),(67,209,67),(68,250,68),(69,224,69),(70,213,70),(71,204,71),(72,203,72),(73,215,73),(74,223,74),(75,233,75),(76,235,76),(77,207,77),(78,215,78),(79,207,79),(80,245,80),(81,229,81),(82,213,82),(83,149,83),(84,227,84),(85,204,85),(86,238,86),(87,208,87),(88,222,88),(89,206,89),(90,237,90),(91,218,91),(92,214,92),(93,242,93),(94,214,94),(95,212,95),(96,207,96),(97,224,97),(98,152,98),(99,235,99),(100,244,100),(101,150,101),(102,152,102),(103,213,103),(104,152,104),(105,248,105),(106,149,106),(107,236,107),(108,243,108),(109,231,109),(110,221,110),(111,149,111),(112,250,112),(113,204,113),(114,209,114),(115,238,115),(116,236,116),(117,241,117),(118,246,118),(119,208,119),(120,214,120),(121,207,121),(122,217,122),(123,243,123),(124,217,124),(125,210,125),(126,212,126),(127,212,127),(128,149,128),(129,213,129),(130,219,130),(131,205,131),(132,239,132),(133,222,133),(134,149,134),(135,204,135),(136,151,136),(137,224,137),(138,219,138),(139,215,139),(140,211,140),(141,234,141),(142,211,142),(143,242,143),(144,206,144),(145,227,145),(146,239,146),(147,216,147),(148,244,148),(149,249,149),(150,242,150),(151,229,151),(152,152,152),(153,223,153),(154,233,154),(155,240,155),(156,225,156),(157,240,157),(158,217,158),(159,228,159),(160,247,160),(161,212,161),(162,249,162),(163,151,163),(164,204,164),(165,216,165),(166,214,166),(167,150,167),(168,228,168),(169,151,169),(170,226,170),(171,150,171),(172,248,172),(173,230,173),(174,151,174),(175,152,175),(176,209,176),(177,229,177),(178,244,178),(179,205,179),(180,216,180),(181,245,181),(182,204,182),(183,237,183),(184,210,184),(185,221,185),(186,237,186),(187,214,187),(188,235,188),(189,206,189),(190,211,190),(191,230,191),(207,1,1),(208,210,206),(209,221,205),(210,232,8),(211,211,204),(212,215,203),(213,225,202),(214,208,201),(215,205,200),(216,213,5),(217,233,2),(218,150,4),(219,240,6),(220,214,3),(221,227,31),(222,151,22),(223,210,30),(224,210,20),(225,219,11),(226,203,199),(227,207,198),(228,220,197),(229,218,196),(230,220,194),(231,207,193),(232,225,192),(233,208,195);
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
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'admin1','admin1','01-03-2000','admin@gmail.com','0990884433','2022-08-11','2022-08-12 11:04:31',1,1,'http://222.255.238.159:9090/api/get-image/2022-08-12-110431_1jLDZ.jpg','admin@gmail.com','$2a$10$9st0OaMmdbjWjn6i6Jzcp.VZ0.kFJJsX3mezXl6.72nGpd/G/cWIa',1,1,1,1),(2,'2022068','Lan Vy Vũ','01-03-2000','ChThnh.Phan@gmail.com','024 0866 1214','2022-08-11 06:06:02','2022-08-12 11:20:10',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112010_wJodT.JPG','ChThnh.Phan@gmail.com','$2a$10$iFGdDiqAAmEfvEuIHOjuXuBwrUzEfkzfZ.vnDgedaLOR5Mswis9C2',1,1,1,1),(3,'2022256','Nguyễn Thị Thanh Thùy ','01-03-2000','thanhthuy1142000@gmail.com ','384999325','2022-08-11 06:05:58','2022-08-12 11:22:11',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112211_e7aWG.JPG','thanhthuy1142000@gmail.com ','$2a$10$2L8xgRaApESFz3fep/g8Bei2eA4DROzxZJDObSMswoQtO41CR7JbC',1,1,1,1),(4,'2022161','Mai Trúc Phượng','01-03-2000','maitrucphuong98@gmail.com','332795135','2022-08-11 06:05:53','2022-08-12 11:20:44',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112044_iaxTO.jpg','maitrucphuong98@gmail.com','$2a$10$RSRsAY3h4BjGgwJnJCAqpOYLzMw4cJ6ptdFwMvAcEqktJ4N9AWGuO',1,1,1,1),(5,'2022244','Trân Châu Hà','01-03-2000','SongLam.Tng22@hotmail.com','0272 1933 9777','2022-08-11 06:05:58','2022-08-12 11:19:24',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-111924_SBIs7.JPG','SongLam.Tng22@hotmail.com','$2a$10$XXZlIKWgMCkDdCCF61ZRFushaw2rrSC6A/suJMvUBwZypif2OgO8C',1,1,1,1),(6,'2022234','Huỳnh Thị Trúc Linh','01-03-2000','phuongmiu191@gmail.com','363302171','2022-08-11 06:06:04','2022-08-12 11:21:40',1,1,'http://222.255.238.159:9090/api/get-image/2022-08-12-112140_FwIz7.JPG','phuongmiu191@gmail.com','$2a$10$QH0bI/oEa7nMnyDMmg.DbO8ws6DfEwM.4RFgiy8cn0P/2x2vvZn3W',1,1,1,1),(7,'2022222','Ðức Chính Đoàn','01-03-2000','nvctoan@gmail.com','0269 0386 9201','2022-08-11 06:05:56','2022-08-11 06:05:56',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nvctoan@gmail.com','$2a$10$n2cQfGs0zkNIyrs6.VaAquTUUS5fu2pTx/camlsU5HWDjy0gsdWOK',1,1,1,1),(8,'2022060','Danh thị bích vân','01-03-2000','bichvannh28@gmail.com','356808544','2022-08-11 06:06:02','2022-08-12 11:16:17',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-111617_AZn6y.JPG','bichvannh28@gmail.com','$2a$10$r/2wQaIg6KU0eyZib/cfy.ZzD9IveGwFOsJJlhYHEMC45Skvs72SO',1,1,1,1),(9,'2022223','Phạm Thị Huyền','01-03-2000','Phamhuyen010199@gmail.com','365950784','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Phamhuyen010199@gmail.com','$2a$10$nOabT4./jr7L7VdrZTRjieXXfwWB2BnHAiGBcVmMj9fifN4pvaBVq',1,1,1,1),(10,'2022087','Phương Loan Trần','01-03-2000','GiaPhong32@gmail.com','0212 9601 9964','2022-08-11 06:06:02','2022-08-11 06:06:02',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','GiaPhong32@gmail.com','$2a$10$yhNSd9HrjCVS.X3kUGzEaOW9W1HPmgdKa78Odzg7AyfyfS8u0SNL6',1,1,1,1),(11,'2022286','Tường Vi Lê','01-03-2000','ThyTin77@hotmail.com','0283 1862 5655','2022-08-11 06:05:59','2022-08-12 11:25:10',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112510_FVTIP.JPG','ThyTin77@hotmail.com','$2a$10$wyfmyN6C4KJiZqIj1PVB/OxoxBukShOTXUXGXa..13Yz4SLj6YO/m',1,1,1,1),(12,'2022241','Trần Ngọc Quyên','01-03-2000','quyenngoc560@gmail.com','399550204','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','quyenngoc560@gmail.com','$2a$10$N5z3FaSnHvqWr2Vt0UFpfeP6v76mZwRZpWKnr1J03hhhv.tpPD5x6',1,1,1,1),(13,'2022252','Nguyễn Thị Thanh Nhàn','01-03-2000','thanhnhanbuh0101@gmail.com','984239201','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thanhnhanbuh0101@gmail.com','$2a$10$hyyZvaoRmSG6glHPcgAQ6eo.ggDAT7XZICE0cl7bComuGIJZ8CFCu',1,1,1,1),(14,'2022189','Nguyễn Linh Tâm','01-03-2000','nguyenlinhtam1505200@gmail.com','942073618','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nguyenlinhtam1505200@gmail.com','$2a$10$SlLJ.LxlBAiicJYKg/fbjeX0TcnuKo15tg/dpQkfTfDGLTxBZTCYG',1,1,1,1),(15,'2022063','Hồng Ðào Phạm','01-03-2000','BuChng.Mai@yahoo.com','0292 9362 5626','2022-08-11 06:06:02','2022-08-11 06:06:02',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','BuChng.Mai@yahoo.com','$2a$10$phfxNE4bNhDCWXX7MDiU6OSgkUm2h3t2J.Ty8PR1mDcd40HJjUiEu',1,1,1,1),(16,'2022309','Võ Ngọc Phương Uyên','01-03-2000','uyenlun0802@gmail.com ','961072417','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','uyenlun0802@gmail.com ','$2a$10$c.15V.dRguAnFUAcfXqDcucmynylkvmNuS6i2VfFT64pM7cFma5SC',1,1,1,1),(17,'2022239','Công Bằng Vương','01-03-2000','QucTun.Mai@hotmail.com','023 1408 6450','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','QucTun.Mai@hotmail.com','$2a$10$Qzi0LUk07nmNjp6FcDULe.3d3id9vB0Ep2nRbjl280gbjrD0mfOWW',1,1,1,1),(18,'2022264','Dương Thế Bích','01-03-2000','thebichpham@gmail.com','398026884','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thebichpham@gmail.com','$2a$10$gwDd3/WGYHLooQVljLwE8Oo7SLOdgu7WuU4iA4PkuPl.GkeUdbjKC',1,1,1,1),(19,'2022285','Hiệp Dinh Tô','01-03-2000','ThyNgc63@yahoo.com','029 8274 0835','2022-08-11 06:05:59','2022-08-11 06:05:59',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThyNgc63@yahoo.com','$2a$10$UHCudXpwmtv2RovEOoBVJe1zLYZMZZDhFOfHeMZ8/ALVWYsq9T48S',1,1,1,1),(20,'2022224','Phạm Ngọc Nhất','01-03-2000','phamnhat.20102002@gmail.com','377108229','2022-08-11 06:05:56','2022-08-12 11:24:35',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112435_qE8Vy.JPG','phamnhat.20102002@gmail.com','$2a$10$3jpSp4XaNegA1S/OfX9rbuiSIErOloItKmMhiKIcsI/AW39FodAI2',1,1,1,1),(21,'2022278','Nguyễn Trần Anh Thư','01-03-2000','thutran0523393526@gmail.com','355946319','2022-08-11 06:05:59','2022-08-11 06:05:59',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thutran0523393526@gmail.com','$2a$10$oZMkY6UuHCPo.RjnbuWcq.xLY6MuSEvW1Xxcpffh.haN3qGDTdJvy',1,1,1,1),(22,'2022165','Nguyễn Minh Thiện Tâm','01-03-2000','minhthien3004mt@gmail.com','827957526','2022-08-11 06:05:53','2022-08-12 11:23:17',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112317_ZYX5M.JPG','minhthien3004mt@gmail.com','$2a$10$llijI.s9.hw4m6MywJzxlOfOjP/AFBBhm4Vq.aCOQYZkwh5Y7vIjm',1,1,1,1),(23,'2022301','Trương Trí Hào','01-03-2000','truongtrihao21@gmail.com','336896494','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','truongtrihao21@gmail.com','$2a$10$DYIaPRHsjvxpk2eW5BqfjOabClPCosC3QC4FKjibOd6zmlYngjCSm',1,1,1,1),(24,'2022184','Nguyễn Cao Huyên','01-03-2000','Nguyencaohuyen190400@gmail.com','346834682','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Nguyencaohuyen190400@gmail.com','$2a$10$2WQQXDUuGlXiVCqAJ64JFeR2xLOktUQMYdGWKAZh/zY0Wx4W5QpXi',1,1,1,1),(25,'2022268','Trương Thị Nhi','01-03-2000','thinhi3942@gmail.com','942063365','2022-08-11 06:05:59','2022-08-11 06:05:59',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thinhi3942@gmail.com','$2a$10$vFTvYQI8GEU0IsBIp.oNROUfmnqOOBl7uqiFzDz1qy9WYOIl66M9S',1,1,1,1),(27,'2022216','Nguyễ Thị Thùy Trinh','01-03-2000','nthuytrinh1@gmail.com','393112248','2022-08-11 06:05:55','2022-08-11 06:05:55',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nthuytrinh1@gmail.com','$2a$10$B9NrHVZxzHS2NDglQ89WF.0fGEn00lV1hgqUzsf0dEaHWRBHNu4bO',1,1,1,1),(28,'2022024','Bùi Thị Tuyết Mai','01-03-2000','20125510@st.hcmuaf.edu.vn','925721201','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','20125510@st.hcmuaf.edu.vn','$2a$10$WoXRy4gjrsWd6qi7zlfXReSDEVHmAMyZrYryvU7Bfi.uz.OF7g2yy',1,1,1,1),(29,'2022253','Võ Thành Phú','01-03-2000','thanhphums10@gmail.com','775074059','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thanhphums10@gmail.com','$2a$10$cDj8Yo1HO0AJdWTKKA4BWedoXgWwLymzaULcD3aEfhtK2M5pwIGUm',1,1,1,1),(30,'2022226','Nguyễn Phan Bảo Trân','01-03-2000','phanbaotrannguyen9401@gmail.com','933783918','2022-08-11 06:05:56','2022-08-12 11:23:46',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112346_IwMnL.JPG','phanbaotrannguyen9401@gmail.com','$2a$10$NRA.JeRthdTVBepGsjvOgu4WEBToqMztS4rL103rZ.aJ9.H8bblhq',1,1,1,1),(31,'2022008','Nguyễn Thành Mỹ','01-03-2000','17126083@st.hcmuaf.edu.vn','856487482','2022-08-11 06:06:01','2022-08-12 11:22:44',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112244_dSeja.JPG','17126083@st.hcmuaf.edu.vn','$2a$10$P3UQH54xgISWUCMgNyxM2e8GddOPZIw6n0bezique8oSaoRik66Xi',1,1,1,1),(32,'2022212','Nông Thị Thuỷ','01-03-2000','nongthithuy5516@gmail.com','355502710','2022-08-11 06:05:56','2022-08-11 06:05:56',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nongthithuy5516@gmail.com','$2a$10$tJaO4iVshOMJCV6kJjGJoeGF95ehy7tKoXOK2ThFwmG8rGoZ7x0Wa',1,1,1,1),(33,'2022180','Nguyễn Ngọc Thông','01-03-2000','ngocthong2k2@gmail.com','911182742','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ngocthong2k2@gmail.com','$2a$10$8TTjmFkWB3AwBUK1wXFASuMhci5USohN7lmc7FOg0Bkow.ku5ca1W',1,1,1,1),(34,'2022200','Nguyễn Thị Vân','01-03-2000','Nguyenvan842000@gmail.com','973168954','2022-08-11 06:05:55','2022-08-11 06:05:55',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Nguyenvan842000@gmail.com','$2a$10$GPdd70tNDuGlIKpMhUO28ulgYYujeXG4Yavw6BqubtU8MEULkor4S',1,1,1,1),(35,'2022175','Tú Uyên Phạm','01-03-2000','NgcT.Mai@gmail.com','0229 7909 6001','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','NgcT.Mai@gmail.com','$2a$10$V776cN9YxJJC4HtLYTWIjO3WPsWFgTlRURxYd52eQCbJX3zK9wWe2',1,1,1,1),(36,'2022321','Mrs. Hương Lan Đào','01-03-2000','XunHnh_inh@gmail.com','0212 0465 7976','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','XunHnh_inh@gmail.com','$2a$10$9QkHemwjsIiA/uEfUhXgI.ByNcegC3W2sxqEIBCPMSDCrISmF0Gsi',1,1,1,1),(37,'2022112','PHAN THỊ HỒNG SANG','01-03-2000','Hongsang365s@gmail.com','392387408','2022-08-11 06:06:02','2022-08-11 06:06:02',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Hongsang365s@gmail.com','$2a$10$f.tllzXF/nkfZXXDODEewuIWKBPn6Gi7XOuZcx9LNvBH//OwzyMOG',1,1,1,1),(38,'2022149','Nguyễn Thị Lệ Ngân','01-03-2000','lenganyg01@gmail.com','335324418','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','lenganyg01@gmail.com','$2a$10$VJm4I0jis3FEWnds.7aezuMNlsvoKVqPWdX1ke71SRumFmhTRxSSK',1,1,1,1),(39,'2022178','Danh Thị Bích Ngọc','01-03-2000','ngocdtb19415@st.uel.edu.vn','385815056','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ngocdtb19415@st.uel.edu.vn','$2a$10$Vz5d0YpSR7Q1ngx69m0ADe2BYe2h/xM1fxPgFbHqLaTh/d1RDXIKC',1,1,1,1),(40,'2022236','Nguyễn Minh Quân','01-03-2000','Quandateh2002@gmail.com','399637903','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Quandateh2002@gmail.com','$2a$10$qOQ/r68J19QhPSEe1cx5HOuaBAaefORFiaan09EuMtGYl0acpotjS',1,1,1,1),(41,'2022156','Lục Tám','01-03-2000','luctam2001@gmail.com','377561594','2022-08-11 06:05:52','2022-08-11 06:05:52',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','luctam2001@gmail.com','$2a$10$0rvPjNVM0UfR0Az5XDvwWOie7sr4EuoVlidy4/V3NXmLy6xS/8OU2',1,1,1,1),(42,'2022036','Nguyễn Minh Dũng','01-03-2000','abcd1@gmail.com','763934399','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','abcd1@gmail.com','$2a$10$3/z2L/txMkOxE4iPXQpPX.XisWVo24/P0L27D5PncnYVoNhuecz86',1,1,1,1),(43,'2022150','Lê Thị Hồng Gấm ','01-03-2000','lethihonggam1011999@gmail.com ','398997446','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','lethihonggam1011999@gmail.com ','$2a$10$sXreUpoCaBZ7/jk5Rf3LwOd.QYUPSyaicnP7IEp0aTdXpK2XNJEIe',1,1,1,1),(44,'2022296','Trịnh Thị Hoài Lam ','01-03-2000','trinhthihoailam.0901@gmail.com','339273691','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','trinhthihoailam.0901@gmail.com','$2a$10$jopHkAYE9.GzEN7G5pHOa.MSttAtCGofU1yg1uOuYmmHGedlYbM4W',1,1,1,1),(45,'2022167','Võ Thị Mỹ Châu','01-03-2000','mychauvothi02@gmail.com','373729197','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','mychauvothi02@gmail.com','$2a$10$fE54meOZ4K87.6m6NoLW3u4p3HAVLZFFrWtD..P22vdZDbIQGIiVy',1,1,1,1),(46,'2022302','Trúc Phương Lâm','01-03-2000','TSng86@hotmail.com','020 4040 6390','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','TSng86@hotmail.com','$2a$10$rVhcMXT8czCK5vVqNgHBueXlrCVVXd5zW3HtumQpSdBuiY4dqtRY2',1,1,1,1),(47,'2022233','Đông Nghi Đoàn','01-03-2000','PhngTrinh.Bi26@yahoo.com','0249 6226 0641','2022-08-11 06:05:56','2022-08-11 06:05:56',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','PhngTrinh.Bi26@yahoo.com','$2a$10$qrn6DYUOqAp88brI6R1mY.wnYPy4H/p9T6Wpu94YOM4ZyVOgjhDYq',1,1,1,1),(48,'2022096','Đan Thư Hoàng','01-03-2000','HngChi_Tng14@yahoo.com','024 9037 8913','2022-08-11 06:06:02','2022-08-11 06:06:02',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','HngChi_Tng14@yahoo.com','$2a$10$jGnXkrD1NiiBLipZdUR2yeYK7IHDyPwMDyyrfaqulQ7VMePU3tD5W',1,1,1,1),(49,'2022248','Ngọc Hạnh Tô','01-03-2000','ThanhHng.Trng@yahoo.com','0259 2042 0175','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThanhHng.Trng@yahoo.com','$2a$10$ORXTSIYVVpcP/Pne0lE7f.glRd5xCHjBXd4sKg0HbGx5m8swsM8pK',1,1,1,1),(50,'2022255','Phan Văn Thịnh','01-03-2000','thanhthoai10a2@gmail.com','397239569','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thanhthoai10a2@gmail.com','$2a$10$cUuvolabkBfws2dS2Z7Oq.mpwK9FiyE6ghW0./GV9FNhNtoNpbiRu',1,1,1,1),(51,'2022218','Nguyễn Thị Lan','01-03-2000','ntlanulaw99@gmail.com','868264085','2022-08-11 06:05:56','2022-08-11 06:05:56',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ntlanulaw99@gmail.com','$2a$10$ds1ShmVaAkp7kOa7NihbQegvLOS8FfD3OWqdVPWoVQDM07Krgh2FC',1,1,1,1),(52,'2022305','Lâm Tuyền Đặng','01-03-2000','TunLinh_Trn3@yahoo.com','0237 0462 2404','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','TunLinh_Trn3@yahoo.com','$2a$10$xSbtclS.V4QDwYsK8tyMAeaPtD1zecnBgxFnTK/q0Ll4hWPexjtTe',1,1,1,1),(53,'2022280','Dr. Thanh Tuyết Trần','01-03-2000','ThuVit_inh78@yahoo.com','0209 6015 8608','2022-08-11 06:05:59','2022-08-11 06:05:59',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThuVit_inh78@yahoo.com','$2a$10$tfulI4Djpvrc1QmOLx75mO1ssfIAOP1BDejYqQ9.AigpS0Mc3sP26',1,1,1,1),(54,'2022324','Trần Thị Yến Ly','01-03-2000','yenlytran19052001@gmail.com','704873395','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','yenlytran19052001@gmail.com','$2a$10$3H/VwkMqsByyLX8W9W7eTuv9UWr.oOHskmpMLfCaSf7xjHEmTz.a.',1,1,1,1),(55,'2022052','Tường Lân Đỗ','01-03-2000','AnhTh_V84@hotmail.com','0287 3004 3561','2022-08-11 06:06:02','2022-08-11 06:06:02',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','AnhTh_V84@hotmail.com','$2a$10$fybutmv9D39u7bv2G57mn.YrS33zrI2XYtivayxrijzVLAqKLu1zW',1,1,1,1),(56,'2022028','Tạ Như Huỳnh','01-03-2000','20128032@st.hcmuaf.edu.vn','925811442','2022-08-11 06:06:02','2022-08-11 06:06:02',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','20128032@st.hcmuaf.edu.vn','$2a$10$./ix7PHUhxVdb/BZSXJHUe5LtxLXIhjeShl4EwUDa51nnIcmje1I2',1,1,1,1),(57,'2022293','Trần Thị Mỹ Lệ','01-03-2000','tranthimyle.tk3@gmail.com','336633717','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','tranthimyle.tk3@gmail.com','$2a$10$lKKaDX9Ev4J/Lvzk.LffN.8OLBvw.0gsUnI4ZutJ5GwwzsuBDaid2',1,1,1,1),(58,'2022219','Nguyễn Trường An','01-03-2000','ntruongant1@gmail.com','708860118','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ntruongant1@gmail.com','$2a$10$mHxp5GxK.tJ5vgQqSgtnO.FTymOLmoQt.GOCoEFtJ2RKiWSOpFhCa',1,1,1,1),(59,'2022157','Lục Thị Tám ','01-03-2000','Luctam2001@gmail.com','377561594','2022-08-11 06:05:52','2022-08-11 06:05:52',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Luctam2001@gmail.com','$2a$10$umO6hGCM1zU2cCgUySyfTuSVtBhngcfHLvRrNAQiiUm8NqjFsVA62',1,1,1,1),(60,'2022196','NGUYỄN THỊ MINH HOA','01-03-2000','nguyenthiminhhoa14@gmail.com','782898030','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nguyenthiminhhoa14@gmail.com','$2a$10$t8rK93GQmXSQ1D8oVgG13uNByvj0BoZbeL8S8jVpXcgC2xfs9dCSG',1,1,1,1),(61,'2022193','Nguyễn Thanh Ngọc Yến','01-03-2000','nguyenthanhngocyen01012001@gmail.com','707943094','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nguyenthanhngocyen01012001@gmail.com','$2a$10$6kKOAGqaLKoilOC3vXBaPuU83Zf/avTRehE42ffcOxVxMQqZwKBBa',1,1,1,1),(62,'2022191','Nguyễn Thị Mỹ Lệ ','01-03-2000','nguyenmyleoh@gmail.com ','389330803','2022-08-11 06:05:55','2022-08-11 06:05:55',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nguyenmyleoh@gmail.com ','$2a$10$U96jcc5/26NPXrJ7.qSieOFEM2HM5mH/ziJaJtrL194Nt9WoQpm/C',1,1,1,1),(63,'2022277','Ms. Long Vịnh Phùng','01-03-2000','ThuThun_Ng@yahoo.com','027 6713 9007','2022-08-11 06:05:59','2022-08-11 06:05:59',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThuThun_Ng@yahoo.com','$2a$10$9zLYE/ayIF5/RUwhFOzJh.uMH2zCCSGllePTigygsRDVqed4XNFZa',1,1,1,1),(64,'2022245','Thái Thanh Sơn','01-03-2000','sownthasi@gmail.com','816146300','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','sownthasi@gmail.com','$2a$10$1rai1/zuUoPToQInzNgW.em2nXzKb3a4vPsf1.x0zkPXRheFpvMTS',1,1,1,1),(65,'2022195','Nguyễn Thị Lan Châu','01-03-2000','nguyenthilanchau1805@gmail.com','367345109','2022-08-11 06:05:55','2022-08-11 06:05:55',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nguyenthilanchau1805@gmail.com','$2a$10$DdUuh.2USAj9l2WBRr0yX.oYgsrJznfzkibAZ71QRrVy..BhmLBi6',1,1,1,1),(66,'2022258','Đặng Thị Thanh Tuyền','01-03-2000','thanhtuyen060401@gmail.com','332011434','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thanhtuyen060401@gmail.com','$2a$10$GnLLNuwuCR6xAeLvc81/Lu.1Ll/76Dg0kddH3U/ykzL2N/ryJFf8m',1,1,1,1),(67,'2022221','Nguyễn Văn Khang','01-03-2000','nv.khang0405@gmail.com','978121304','2022-08-11 06:05:56','2022-08-11 06:05:56',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nv.khang0405@gmail.com','$2a$10$qevBm5d8AYKR8p7Xm.k60uwwwsJLmZHjWW0j4vkosw5H5z6t0Xisy',1,1,1,1),(68,'2022322','Hồ Nam Hoàng','01-03-2000','XunQu8@hotmail.com','020 0696 7709','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','XunQu8@hotmail.com','$2a$10$1hTgXdsNOD9P0kW/uKRbzulMKo0mTO5bQdNYYHjenkAw2OIZcJkjG',1,1,1,1),(69,'2022310','Nguyễn Văn Khánh','01-03-2000','Vankhanhdmx2019@gmail.com','943675286','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Vankhanhdmx2019@gmail.com','$2a$10$BiW.6jVIydHVhm66VO2/hei67kdAPeVZ.zL2cx0ZiiWr9ICLACqvW',1,1,1,1),(70,'2022246','Nguyễn Tấn Nguyên','01-03-2000','tannguyen1750@gmail.com','363037467','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','tannguyen1750@gmail.com','$2a$10$GmkWjRTYcfTr1r4qFdzR5eArFLpYM88YXWDdof8B7B4t1KYADJVOO',1,1,1,1),(71,'2022187','Nguyễn Hữu Thiết','01-03-2000','nguyenhuuthiet01012002@gmail.com','333751154','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nguyenhuuthiet01012002@gmail.com','$2a$10$mtddjugpWBESB5Is.A8xvu0iNWVPFOGHZoJOqsfFH5hXOaQ7ZYaXq',1,1,1,1),(72,'2022179','Nguyễn Ngọc Đức','01-03-2000','ngocduc11112001@gmail.com','797365068','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ngocduc11112001@gmail.com','$2a$10$wqAqoZW.h.dUQwQjpWdZied9VzffwWo1IQ7pAYV7BjhZC2h.lMdHW',1,1,1,1),(73,'2022262','Minh Tân Lê','01-03-2000','ThchTho.on@hotmail.com','0222 4191 4468','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThchTho.on@hotmail.com','$2a$10$YMrChcEEZojmDJCQ.rL38uetWEO7E1Ry6RESE8hO/x3soal63MGEO',1,1,1,1),(74,'2022306','Phượng Tiên Bùi','01-03-2000','TunVit_@yahoo.com','020 5928 2380','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','TunVit_@yahoo.com','$2a$10$Y1MpD7qnGFRyKTgF21uwvuklUBAafFtjI4RhXbgJDE48dSMe.9EeC',1,1,1,1),(75,'2022086','Bảo Tín Phùng','01-03-2000','GiangThin_T@gmail.com','021 8246 3839','2022-08-11 06:06:02','2022-08-11 06:06:02',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','GiangThin_T@gmail.com','$2a$10$CAIfD1TejlS81CPiQUZM3Od.xmXGt0W1HwcYreLvypTEuj.uagdn.',1,1,1,1),(76,'2022107','Trúc Lam Tăng DDS','01-03-2000','HoMi_H72@yahoo.com','023 0200 9314','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','HoMi_H72@yahoo.com','$2a$10$rbQ9svtlfuxeoNvk6XWA8O6qPcXpUW.rVK120Rd7v2pxb/EConEKe',1,1,1,1),(77,'2022206','Hữu Hiệp Ngô','01-03-2000','NhtLan.ng@hotmail.com','025 9647 5024','2022-08-11 06:05:55','2022-08-11 06:05:55',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','NhtLan.ng@hotmail.com','$2a$10$rSZ.QkmPjqSKHOVFRFOhOujvkMFBH/NScVvXAgpiqtFKKN/yZSJsK',1,1,1,1),(78,'2022266','Ngô Thị Thiên Thảo','01-03-2000','thienthaouel@gmail.com','974719931','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thienthaouel@gmail.com','$2a$10$ZFxAvXaZoh0J5hAfF2s/Neoow4ZcGdKXuQfJi8Of8cFAyEQckhghi',1,1,1,1),(79,'2022205','Tô Thị Nhật Nguyệt','01-03-2000','nhatnguyetkk@gmail.com','968915373','2022-08-11 06:05:55','2022-08-11 06:05:55',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nhatnguyetkk@gmail.com','$2a$10$w3dvBhTdjjFW.zD8YX/G1OD7dGjl6UUIghoDgiuF4n83Uh9UkhDRy',1,1,1,1),(80,'2022294','Trần Văn Tính','01-03-2000','tranvantinh6103@gmail.com','923036103','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','tranvantinh6103@gmail.com','$2a$10$tU1FyUPMBxi9GnEdJSl2SOrXfoMPMrV74wA.rsyDo699AuU4mdTLS',1,1,1,1),(81,'2022023','Nguyễn Thị Lưu Luyến ','01-03-2000','20125506@st.hcmuaf.edu.vn','384987063','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','20125506@st.hcmuaf.edu.vn','$2a$10$vgE/zhGS.Ej9SOTgZXPp.OO7mMpiJH7UGHjLVvgP.tbmQ.XDfzlom',1,1,1,1),(82,'2022251','Sử Thị Thanh Lan','01-03-2000','thanhlan07112001@gmail.com','969670256','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thanhlan07112001@gmail.com','$2a$10$rVtRqZGFVGDIIScP1UhKuePkC6YpfjfDixEF2U7oWYsen4ghRhvIW',1,1,1,1),(83,'2022154','Lê Xuân Tiến','01-03-2000','lexuantien07@gmail.com','964712704','2022-08-11 06:05:52','2022-08-11 06:05:52',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','lexuantien07@gmail.com','$2a$10$rkJbWPvGrC1e4ixTC31C3OwQJ24i/1X6mb.D3sRDcsmF9wpRi4P4C',1,1,1,1),(84,'2022004','Nguyễn Thị Liễu ','01-03-2000','17113092@st.hcmuaf.edu.vn','377736405','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','17113092@st.hcmuaf.edu.vn','$2a$10$0dzUefS7GdmN6pRBbI4zPehPxjDUAr8nHSmJzklpI5Rt5.futYzBm',1,1,1,1),(85,'2022185','Nguyễn Dĩ Khang','01-03-2000','nguyendikhang369@gmail.com','336860720','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nguyendikhang369@gmail.com','$2a$10$ZOi0qxU202nBEpgZzTDE/et0R0s2QBEXkHlu5/O4LzXDecwYfzRFS',1,1,1,1),(86,'2022201','Nguyễn Y Phụng','01-03-2000','nguyenyphung17@gmail.com','326229351','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nguyenyphung17@gmail.com','$2a$10$FemM3PFngSFBg2pTfiHmQ.duspYgXmb5f969iYj9N8XB8.gjcoGAu',1,1,1,1),(87,'2022210','Nguyễn Cẩm Như','01-03-2000','nhucam137@gmail.com','706992532','2022-08-11 06:05:55','2022-08-11 06:05:55',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nhucam137@gmail.com','$2a$10$vEP3uxfisjkxcHdCGRaDWeJ8dw9Sw2.NepgS1CgyG7d1wejBrxrTK',1,1,1,1),(88,'2022304','Hương Mai Tăng','01-03-2000','TunHong40@hotmail.com','0242 4384 0246','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','TunHong40@hotmail.com','$2a$10$/i1Tar2K.Lj/6PVK2BpnfeMamQk3bpaNvxfRA4e3DGdmuD9WjKnq2',1,1,1,1),(89,'2022197','Nguyễn Thị Mỹ Hạ ','01-03-2000','nguyenthimyhact2001@gmail.com ','915878573','2022-08-11 06:05:55','2022-08-11 06:05:55',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nguyenthimyhact2001@gmail.com ','$2a$10$oKi4yr2MyELrjvxR9SFvjegr.uS5d9BeAzS1JI7LhSLt6VhztlAX.',1,1,1,1),(90,'2022164','Phạm Quang Minh','01-03-2000','minhphamkg68@gmail.com','919476132','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','minhphamkg68@gmail.com','$2a$10$ZR90wutK1qMo/QOEvHjsw.0q4BuNNqACn5bdymZkJuN4h9JTYmvXG',1,1,1,1),(91,'2022284','Thanh Vy Tăng','01-03-2000','ThyGiang79@gmail.com','021 9707 3489','2022-08-11 06:05:59','2022-08-11 06:05:59',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThyGiang79@gmail.com','$2a$10$WynAZm2R2miW2SfdnLRnieXhglJcJn.Atu5/uJc7pdJ5aLflyBXrG',1,1,1,1),(92,'2022254','Vi Thị Thạnh','01-03-2000','thanhthivi27@gmail.com','356300688','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thanhthivi27@gmail.com','$2a$10$BIZ43NTTTrv2EGm.Eh2VfuYhLIjQ9u4qW1dF7iUuwHMCMgqaVfopi',1,1,1,1),(93,'2022274','Miss Thanh Thúy Vũ','01-03-2000','ThiThi.Dng@yahoo.com','0294 5768 6398','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThiThi.Dng@yahoo.com','$2a$10$isyDGg.cmAeKG3G5xxYjGOF6DZ.JKimPecA52x2DUlF5kvEjXGeiu',1,1,1,1),(94,'2022257','Trần Thanh Trọng','01-03-2000','Thanhtrongag67@gmail.com','337573719','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Thanhtrongag67@gmail.com','$2a$10$/Ee/fhxiwlK/UG2vF6qUvO.b7ozXSF6M29Ij57JqlAJDMZ6T6JBpy',1,1,1,1),(95,'2022243','Trần Đình Sâm.','01-03-2000','samtran22345@gmail.com','967493457','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','samtran22345@gmail.com','$2a$10$1udBXLVrD3XUsvCjpxgTCeXFu08m51uC8vQ6mO8G4mcflOBnCS17W',1,1,1,1),(96,'2022207','Trung Anh Dương','01-03-2000','nhTrung.o75@hotmail.com','0238 6394 3809','2022-08-11 06:05:55','2022-08-11 06:05:55',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nhTrung.o75@hotmail.com','$2a$10$6zxlXxtQ5hQDR737yDyfxecyFV1si0c3VdSPpp1MidVzYb8SsLrEC',1,1,1,1),(97,'2022312','Cường Dũng Tô','01-03-2000','VitKhu20@yahoo.com','0226 6701 9725','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','VitKhu20@yahoo.com','$2a$10$9dO6IwlEvrLf9iGtIhKZleOKKrhqRi7/MWdzQgZhwQSDcyCg9HdRq',1,1,1,1),(98,'2022173','Như Ý Hồ','01-03-2000','NgcHnh48@yahoo.com','022 1755 2052','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','NgcHnh48@yahoo.com','$2a$10$eTVos5OhwDJNsI5MzHxepOCkR3ouuujc9ltRY9DVvy0/zn5WD6FJ2',1,1,1,1),(99,'2022094','Nguyễn Trung Hiếu','01-03-2000','hieutanmy321@gmail.com','965924083','2022-08-11 06:06:02','2022-08-11 06:06:02',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','hieutanmy321@gmail.com','$2a$10$71ZHy.F0Rd.DbIAlVTQH/eINtGggA6FYXbka/8QuCeeVBo//CvOpq',1,1,1,1),(100,'2022282','Nguyễn Thị Thủy Tiên','01-03-2000','thuytienthuytien@gmail.com','385087900','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thuytienthuytien@gmail.com','$2a$10$OS8PFSQSbnxIlukgY2j6y.hpupFQQygWhZwu5cuAGbrENtiC8LECS',1,1,1,1),(101,'2022158','Mai Công Tuấn Kiệt ','01-03-2000','maicongtuankiet@gmail.com ','914343990','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','maicongtuankiet@gmail.com ','$2a$10$pjYp0zWjy.hu7eSdXS4QketCA/kx.AAEW./4WdKeKGKManccQubSu',1,1,1,1),(102,'2022170','Lê Thị Mỹ Linh','01-03-2000','mylinh01677281441@gmail.com','868656874','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','mylinh01677281441@gmail.com','$2a$10$nGq3ijdSmamzjQBDdj.hsuuR155uyh6nlgFY5pBPsZ8cSuraXJb1u',1,1,1,1),(103,'2022247','Nguyễn Văn Trần C','01-03-2000','Th3iHng.Lm77@hotmail.com','0269 0386 9201','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Th3iHng.Lm77@hotmail.com','$2a$10$rd/zkVIUGqxatGNvbgSexuOhcA6O9JLloBuRGd8sKFDM7HBQaArQe',1,1,1,1),(104,'2022171','Nguyễn Thị Kim Ngân','01-03-2000','Nganntk1308@gmail.com','345183700','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Nganntk1308@gmail.com','$2a$10$sGHmUHQgNiE79mi9xlfYE.Vw3fdsoK.sCca56rW/.lRjlFxvawUfO',1,1,1,1),(105,'2022311','Lê Viết Trọng','01-03-2000','viettrong12tn@gmail.com ','589185764','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','viettrong12tn@gmail.com ','$2a$10$nBTEY6R0lny4Xk2eYYurk.hssRia120nTaUV3XPBobrTrLqdVJ2Ta',1,1,1,1),(106,'2022155','Bá Thịnh Hồ','01-03-2000','LongGiang.H@gmail.com','024 0370 9248','2022-08-11 06:05:51','2022-08-11 06:05:51',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','LongGiang.H@gmail.com','$2a$10$S2XYQ2xQGzcAU3tRb/nweOyBJJW8kXtMMnNgiVRm6ELaAgbbM748W',1,1,1,1),(107,'2022137','NGUYỄN THỊ KIM TA','01-03-2000','kimtuyen16111994@gmail.com','395023743','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','kimtuyen16111994@gmail.com','$2a$10$xchb4BFxuzr8kKzPUkDlfO7w/s9Q5xKYPzNCqlpwb6.eNZsbKDolO',1,1,1,1),(108,'2022281','Hồ Thị Thúy Hiền','01-03-2000','thuyhiensehun@gmail.com','386325714','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thuyhiensehun@gmail.com','$2a$10$pbfUtwsesYtw7ngnnsHvduOqBN1VKdBkEw3d/WkC5ifXV0rtmwj..',1,1,1,1),(109,'2022054','Hoài Thương Phùng','01-03-2000','AnhVit.V@yahoo.com','029 1419 1954','2022-08-11 06:06:02','2022-08-11 06:06:02',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','AnhVit.V@yahoo.com','$2a$10$ukRMejd9k6a0rH2jRv5Ld.Jvk4X8QToEqVqeVCYZdfyYv1Go9MlrW',1,1,1,1),(110,'2022299','Cổ Trọng Toàn','01-03-2000','trongtoan299@gmail.com','378093229','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','trongtoan299@gmail.com','$2a$10$PU1X0Y.27WimZ43tSM3w3ebO7lCF.n3R4qrieEqZUJvuOH2Rnv5Fy',1,1,1,1),(111,'2022153','Lê Văn Ni','01-03-2000','Levannidc@gmail.com','353504815','2022-08-11 06:05:52','2022-08-11 06:05:52',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Levannidc@gmail.com','$2a$10$F3.asBNdc2rXO4vjdBa7WeIPSjFiLQozP8Yyl1F5Wf6BG1/29X1ae',1,1,1,1),(112,'2022320','Quang Dương Lý','01-03-2000','XunHiu.Lm@yahoo.com','0239 4500 2897','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','XunHiu.Lm@yahoo.com','$2a$10$svDcCaGkAXHpa6HmBa8NNeduJZf/CRPUtY3isoTv4mAP88oA352ry',1,1,1,1),(113,'2022183','Nguyễn Hoài Bảo','01-03-2000','nguyenbaohg18@gmail.com','971048424','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nguyenbaohg18@gmail.com','$2a$10$SQryJKzNZB5XI10XPNWI1uAZaCcIoCl/zG7s0QbYB2VC2NPzIe1EG',1,1,1,1),(114,'2022217','Nguyễn Thị Khánh Linh','01-03-2000','ntklinh511@gmail.com','974602449','2022-08-11 06:05:56','2022-08-11 06:05:56',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','ntklinh511@gmail.com','$2a$10$V7Vva/V2UA9MtH78iMDhDuqxx9obLk35ZKK4tDK1/.Bd7WyQeIyU6',1,1,1,1),(115,'2022192','Nguyễn Tấn Tài ','01-03-2000','nguyentantai25082002@gmail.com ','388472307','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','nguyentantai25082002@gmail.com ','$2a$10$EEKBCvjFWd5eQ0DSVsW0Cefv42c2XRW3QLlQ1hhA7kdgMd7kSqAUa',1,1,1,1),(116,'2022145','Tuấn Khanh Mai','01-03-2000','LanTrc89@hotmail.com','0277 8413 0917','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','LanTrc89@hotmail.com','$2a$10$.mkO4QxpHdqCrG0PIO5mEOdYlfmqx.SA5AqOtr0vg7cVWsuG1IEAC',1,1,1,1),(117,'2022250','Miss Ái Linh Phùng','01-03-2000','ThanhKiu27@hotmail.com','020 8540 6847','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','ThanhKiu27@hotmail.com','$2a$10$hKI7WySc6m3FQBysKNHDAOxLErQAPZgQHaE7O45DKguL7rcWo0GbC',1,1,1,1),(118,'2022300','Trương Thanh Tiền','01-03-2000','truongthanhtien272002@gmail.com','777943269','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','truongthanhtien272002@gmail.com','$2a$10$XBLIFV1q2heozTiQvAsEXOF3LMzY.EFcXROAECEY4w/D.dOTh83A6',1,1,1,1),(119,'2022211','Nguyễn Thị Như Quỳnh ','01-03-2000','nhuquynhbp12345@gmail.com ','866945743','2022-08-11 06:05:56','2022-08-11 06:05:56',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nhuquynhbp12345@gmail.com ','$2a$10$dNKtg4Qdj192fS1chEokdOF3r8w9z9LEQm7yui085atMs2QKRZrJS',1,1,1,1),(120,'2022259','Cẩm Thúy Phan','01-03-2000','ThanhTuyt.Vng@hotmail.com','0285 5317 5830','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThanhTuyt.Vng@hotmail.com','$2a$10$49lLU.x3i07SuN3SBQjLYe0l5gNkrWg8y.pxzHAT1It9w5SmEwzRG',1,1,1,1),(121,'2022204','Trần Lê Hữu Nhân','01-03-2000','nhan6431@gmail.com','912990949','2022-08-11 06:05:55','2022-08-11 06:05:55',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nhan6431@gmail.com','$2a$10$G0WcVGf28y1QSbrNJdB3JOL1LV8Em2VVEUtpd1KjkwDcnAiXVNaj.',1,1,1,1),(122,'2022276','Sơn Quyền Hoàng','01-03-2000','ThoQuyn95@yahoo.com','0252 3525 4277','2022-08-11 06:05:59','2022-08-11 06:05:59',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThoQuyn95@yahoo.com','$2a$10$gCjE55Q9TeRNNlAYYdsBLuvEZXOaNbfuCevjhWNVgctYFgMLw33fe',1,1,1,1),(123,'2022279','Võ Thu Uyên ','01-03-2000','thuuyenvo99@gmail.com','777935167','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','thuuyenvo99@gmail.com','$2a$10$52bUo0Pd/yuw2eQF2qL0OeiadNq.RJ/0zNc9UZQRRfj4aJoxslxqi',1,1,1,1),(124,'2022273','Bích Hợp Phan','01-03-2000','ThinTin.o@yahoo.com','0294 3870 9672','2022-08-11 06:05:59','2022-08-11 06:05:59',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThinTin.o@yahoo.com','$2a$10$tzxFlIVP8vqKXTlpf73zkuUlrLbM6idyXU/6RjG2pJXD6d609N7RG',1,1,1,1),(125,'2022227','Phan Phú Sơn ','01-03-2000','Phanphuson9120142015@gmail.com ','869239750','2022-08-11 06:05:56','2022-08-11 06:05:56',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Phanphuson9120142015@gmail.com ','$2a$10$2fC7Cj3WfMMn15Xfy7/tG.YS/r2E12KPycD76fmUsKooT1SpkZdTS',1,1,1,1),(126,'2022242','Trần Nguyễn Quỳnh Như ','01-03-2000','quynhnhu1508pcy@gmail.com','373273170','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','quynhnhu1508pcy@gmail.com','$2a$10$ME1OAJjCey4eCju7gGpDduQ00Fe6pZr8dRigTD6ik3HXgieUeZtLm',1,1,1,1),(127,'2022238','Thy Vân Dương','01-03-2000','QucThng_L@yahoo.com','0295 2213 2383','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','QucThng_L@yahoo.com','$2a$10$ERG/lXcXBrKaiNUSYBY.XuNygDN3xCbfG9Q9xSu0BwEr7VlOYJRwa',1,1,1,1),(128,'2022151','Lê Thị Minh Thư ','01-03-2000','lethiminhthu26072001@gmail.com ','842047761','2022-08-11 06:05:52','2022-08-11 06:05:52',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','lethiminhthu26072001@gmail.com ','$2a$10$6ctGhlgthx5AvK/1MfoLV.BhscdaFl14fLeQ.KUOWlNHT5IEWrW2G',1,1,1,1),(129,'2022249','Ngọc Liên Đào','01-03-2000','ThanhHoa74@gmail.com','0245 3926 0583','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThanhHoa74@gmail.com','$2a$10$rGGcGMkQWT6cP81h0/bf3.UzMwAhksHeMgDSbnTvrOPcClIm2Vtby',1,1,1,1),(130,'2022290','Nguyễn Thị Trang','01-03-2000','Trangbinhloc@gmail.com','347587878','2022-08-11 06:05:59','2022-08-11 06:05:59',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Trangbinhloc@gmail.com','$2a$10$Hee2.PO0AxmU.BRIW5vF4OnDa/xiq0./hdrPuLqr56xdDXqmqSd7W',1,1,1,1),(131,'2022190','Nguyễn Thị Mi Mi','01-03-2000','Nguyenmimi0310@gmail.com','837722728','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Nguyenmimi0310@gmail.com','$2a$10$iB.9ztEnHQvUeLzqKn7jUuLaAl0CTOTFEAvh103ZNJyeVnwztLAKW',1,1,1,1),(132,'2022208','Nguyễn Lương Quỳnh Như ','01-03-2000','nhu0979003760@gmail.com ','979003760','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nhu0979003760@gmail.com ','$2a$10$kkwnnZh5e.ALxhkrkzZhreWa6zeD/QCuzZckfZoB667I2uTWxtKeq',1,1,1,1),(133,'2022303','Đặng Tuấn Khanh','01-03-2000','tuankhanh12d1@gmail.com','903660634','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','tuankhanh12d1@gmail.com','$2a$10$uOv7w7VC8yiBhN8bxbBJCOObOdLLGfTBq.d95ZVS07NA0aaj56.Ea',1,1,1,1),(134,'2022152','Lê Thị Mỹ Chi','01-03-2000','lethimychi1756010025@gmail.com','327298958','2022-08-11 06:05:52','2022-08-11 06:05:52',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','lethimychi1756010025@gmail.com','$2a$10$QpQ20Z7lgOQG3ggqu4Y2QO51x7UW4kJpMOgmemWAHM4qweLWJyWvG',1,1,1,1),(135,'2022182','Nguyễn Thị Vân Anh','01-03-2000','ngth.vananh99@gmail.com','395046627','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ngth.vananh99@gmail.com','$2a$10$75tpqlqBTZoUDnsyDWd00eSktcdOvK3gbB58gIHm/hJxPSiFJylla',1,1,1,1),(136,'2022169','Lê Thị Mỹ Hạnh ','01-03-2000','Myhanh3248@gmail.com','901343248','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Myhanh3248@gmail.com','$2a$10$AuYJwsaPZacmaka.p1MBZ.rGb3X5fxzAUzMTVrUz0cFt3NauAYZam',1,1,1,1),(137,'2022313','Ðức Quyền Hồ','01-03-2000','VnNhi_Tng@hotmail.com','024 6837 2044','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','VnNhi_Tng@hotmail.com','$2a$10$dC.3lDil1sHZf1LWJPQ2N.MkWCTUqR61gpLbxCXwKWZoL2e9eAPQy',1,1,1,1),(138,'2022288','Cát Uy Đào Jr.','01-03-2000','TngLinh32@gmail.com','0243 4271 7880','2022-08-11 06:05:59','2022-08-11 06:05:59',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','TngLinh32@gmail.com','$2a$10$2e5UTwNlMeP26eu425PYVeu1kayANPnCOyupMQdZ4ITxQ7x80MJFm',1,1,1,1),(139,'2022265','Hồng Thư Phạm','01-03-2000','ThiDng_H@hotmail.com','0230 2764 7371','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThiDng_H@hotmail.com','$2a$10$JDvdGdqL4OHRFAUBtDwbyez0TzhE.rGLaCYUC8ZgPe.XHmDYIHz0O',1,1,1,1),(140,'2022230','Vân Quyên Nguyễn IV','01-03-2000','PhiNhn31@hotmail.com','026 9359 7959','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','PhiNhn31@hotmail.com','$2a$10$xWhIY67hGHjFXbKY03uKZeG5hR989E5LdALxpYUdI1tNxmwh5rF1S',1,1,1,1),(141,'2022089','Huỳnh Thị Hài','01-03-2000','haihth2002@gmail.com','339608880','2022-08-11 06:06:02','2022-08-11 06:06:02',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','haihth2002@gmail.com','$2a$10$lvHb8Pk.cMjtdZDFotcjNOPqVLQ3PR3PpRrkBQxVL/19NmadZxtgy',1,1,1,1),(142,'2022232','Quỳnh Lâm Lâm IV','01-03-2000','PhngThanh.Hong@gmail.com','0264 8177 9771','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','PhngThanh.Hong@gmail.com','$2a$10$ztn2wwHSOQHxoEL/5yZOh.UuFJ3iZQKBSZ7xzwsTL2mUR.2KHQZZy',1,1,1,1),(143,'2022269','Hồng Nhật Trịnh I','01-03-2000','ThinKim94@gmail.com','0214 9858 6417','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThinKim94@gmail.com','$2a$10$mC2lo2fhnH0Uauo90wbTa.K0nCIaSx/0xp2ytqfiSXdn2S2/T1FuG',1,1,1,1),(144,'2022198','Nguyễn Thị Ngọc Linh ','01-03-2000','Nguyenthingoclinhkt02@gmail.com ','365036807','2022-08-11 06:05:55','2022-08-11 06:05:55',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Nguyenthingoclinhkt02@gmail.com ','$2a$10$A84rFmqDc1g3wMnVKt3mEuhYSp0UpzqhPVh/8PUnRTqlNrO/ScET.',1,1,1,1),(145,'2022005','Lê Hoàng Long','01-03-2000','17117037@st.hcmuaf.edu.vn','768757403','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','17117037@st.hcmuaf.edu.vn','$2a$10$nhdxnWt40mOP1NZFFVBgWu.HC/YZGGaTmqdCIuzLgUDc49PoVSOrC',1,1,1,1),(146,'2022213','Nông Thị Thuỷ','01-03-2000','nongthithuy5516@gmail.com','355502710','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nongthithuy5516@gmail.com','$2a$10$nq0fWWuykDx5Y4DCp6mhtu9QsdlTO30x7MezKSuji/1.xuGnPKPcS',1,1,1,1),(147,'2022270','Diệu Hiền Lâm','01-03-2000','ThinLam_Trnh@hotmail.com','023 0409 4839','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThinLam_Trnh@hotmail.com','$2a$10$aWygFA8QGSTA6DO7vcZigeRum4gnDeyhoj.KGi1cTt0XsQ3TFeqCy',1,1,1,1),(148,'2022289','Bùi Nguyễn Hoàng Trâm','01-03-2000','trambuinguyen.01@gmail.com','819140101','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','trambuinguyen.01@gmail.com','$2a$10$mHcq5OuBLSBfs8DPavsqeO6lqzmjvz5ZJh9HAErzEIqHPZKS1Tj8K',1,1,1,1),(149,'2022315','Võ Thị Kiều My','01-03-2000','vomy8878@gmail.com','796669590','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','vomy8878@gmail.com','$2a$10$r89bc7YV9tSIYgRq24CWBuwatR0eWoK0QVhSoVv5JdYVx4Tfc0L2G',1,1,1,1),(150,'2022263','Nam Thông Lý','01-03-2000','ThcTm11@yahoo.com','020 3561 5187','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','ThcTm11@yahoo.com','$2a$10$nlU.i4lTRIw98UPcXPYNs.cH6oJH9tGAsC0DA94Og3ETy5hcMMHe6',1,1,1,1),(151,'2022020','Nguyễn Thị Như Tuyền','01-03-2000','19128205@st.hcmuaf.edu.vn','824859459','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','19128205@st.hcmuaf.edu.vn','$2a$10$eOEgyNd44lKcwYAPYizv0.Mi1j52HBQ76J4swOiPGKUlbkstV22Pq',1,1,1,1),(152,'2022172','Nguyễn Bình An','01-03-2000','Ngbinhan30@gmail.com','329863884','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Ngbinhan30@gmail.com','$2a$10$5PBAk/kg1nusDiuY4cGl9.rukgN4LdVYohMfejYULG17W.X4jT5na',1,1,1,1),(153,'2022308','Ms. Việt Huy Mai','01-03-2000','TUyn97@hotmail.com','026 2736 7901','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','TUyn97@hotmail.com','$2a$10$59S42oyEOMs2608h4Qo.tugjaAh0qqMclGdmCTZ2HlcyokDoT/I1G',1,1,1,1),(154,'2022070','Bình Dân Vương Sr.','01-03-2000','CngLc_H@gmail.com','0210 9639 2455','2022-08-11 06:06:02','2022-08-11 06:06:02',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','CngLc_H@gmail.com','$2a$10$8bbJPFHmpKtcnKM1z6G5K.eM0trNhckQwn984dm9rG/gDFKazrdQ2',1,1,1,1),(155,'2022229','Phan Thị Thu An ','01-03-2000','phanthithuan105@gmail.com','387740047','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','phanthithuan105@gmail.com','$2a$10$aJ9Q6qpcOVbOXImMrseZPu7LmmONNaN1Za/xjojhXqQW7/gDeb6I.',1,1,1,1),(156,'2022318','Bùi Trương Kim Hồng','01-03-2000','xmkms99@gmail.com','772123664','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','xmkms99@gmail.com','$2a$10$XdXwkn36ToO.F/bSQrlkweTtFRUSibPW8THuspNRfRgDizHUTbRly',1,1,1,1),(157,'2022237','Quốc Hoài Phan','01-03-2000','QucHi.Tng72@gmail.com','026 5716 7339','2022-08-11 06:06:04','2022-08-11 06:06:04',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','QucHi.Tng72@gmail.com','$2a$10$nBaV2fAY93CEMrT2E/NKkOSwy3loQXkKRO0vZcCXLpLL9nFBfPmTu',1,1,1,1),(158,'2022275','Tuyết Hương Lâm','01-03-2000','ThnhCng55@gmail.com','025 3052 3429','2022-08-11 06:05:59','2022-08-11 06:05:59',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThnhCng55@gmail.com','$2a$10$SV8PN9J7s2Zpw/SFDv2/tua0DTYMgadqQhUk2utm/USFM5JuEdEzq',1,1,1,1),(159,'2022013','Huỳnh Thanh Hiếu','01-03-2000','18137017@st.hcmuaf.edu.vn','564108602','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','18137017@st.hcmuaf.edu.vn','$2a$10$9w1A42dPP1B/nl0BFSh9Oeoh82q0TxDM9Z56jpNEF/P6Ai6QphglO',1,1,1,1),(160,'2022307','Huỳnh Thị Kim Tuyền ','01-03-2000','tuyenhuynh260399@gmail.com','396186430','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','tuyenhuynh260399@gmail.com','$2a$10$ssiAUBHZ.PDa5tWxSdNPU.UdBvstqaRBQCFAMnoNtXieVnc7KaKe2',1,1,1,1),(161,'2022240','Nguyễn Đình Quốc','01-03-2000','quocnguyen322002@gmail.com','337131900','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','quocnguyen322002@gmail.com','$2a$10$kOpF4szxp3.mvw.zV7Ev0OqMRyIjdcd4vkeAyLzi3hbs8sqrS4es2',1,1,1,1),(162,'2022319','Nguyễn Thị Xuân Mai','01-03-2000','xuanmaitm317@gmail.com','973942940','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','xuanmaitm317@gmail.com','$2a$10$Y9zl3OZL790lQGe/2Ob5Reia8p1bAeQKFkB7iTG4e0kl8blrrkpaS',1,1,1,1),(163,'2022163','Nguyễn Nhựt Minh','01-03-2000','minhnn19407@st.uel.edu.vn','387841567','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','minhnn19407@st.uel.edu.vn','$2a$10$B.lgWFIlF8LorzdKO0OrD.xkq7bMZaCmTe.Hxnfnqxpdqlmna3sPG',1,1,1,1),(164,'2022181','Nguyễn Gia Trung','01-03-2000','ngt040802@gmail.com','562719530','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ngt040802@gmail.com','$2a$10$Jc3R6xQh5jMaHsmHD9Ccz.l/hX992.BcJuErTIIE/GrWu2xvvMvVS',1,1,1,1),(165,'2022272','Xuân Vũ Vương','01-03-2000','ThinThanh16@yahoo.com','0235 1191 3308','2022-08-11 06:05:59','2022-08-11 06:05:59',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThinThanh16@yahoo.com','$2a$10$1Zl4Gen85Pvr3cTfl8rlEOC6J38bpD2kzHbnVndzyaVOzHvMi7jUO',1,1,1,1),(166,'2022260','Hồng Đăng Đào','01-03-2000','ThanhUyn61@yahoo.com','0287 2248 1031','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThanhUyn61@yahoo.com','$2a$10$ogaVTrwapidNWnNrgd9Fsexi1.QeAYrPAASlsDMuU9eaHwWJEs30W',1,1,1,1),(167,'2022160','Trần Thị Tuyết Mai','01-03-2000','maitran.mt148c@gmail.com','356642146','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','maitran.mt148c@gmail.com','$2a$10$/daDh2LLc5/ghhNtWnHhCu.FSapl0PcgEdH4O6OkVuxVTic0344Yu',1,1,1,1),(168,'2022015','Đàng Như Nghĩa','01-03-2000','1854070092nghia@ou.edu.vn','901260834','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','1854070092nghia@ou.edu.vn','$2a$10$7osDYJUB8OGsQZefLhmpPe737DdKxz8R.qs4lCjCHxZ/VTYPRLaaC',1,1,1,1),(169,'2022168','Trần Thị Mỹ Duyên','01-03-2000','Myduyenn218@gmail.com','979006985','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','Myduyenn218@gmail.com','$2a$10$wgZqD0051dvoRb/CXTIi..NZLlwoU6li0DA2YsSKiQZDFwG2dL80m',1,1,1,1),(170,'2022323','Gia Huấn Hoàng','01-03-2000','XunTho.o0@gmail.com','0216 6095 7658','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','XunTho.o0@gmail.com','$2a$10$jAIr/SpuGcJhSxwWlXM2w.vyiFBaBq165pvgjA8EWKKK70qzLLp4m',1,1,1,1),(171,'2022162','Miss Đinh Hương Trịnh','01-03-2000','MHip.Phng21@yahoo.com','029 2829 1524','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','MHip.Phng21@yahoo.com','$2a$10$otBHHG.n2J1QBO8aTvhEHO1Oer2aWwJqLSsOBJuEJpur6uY317BJ6',1,1,1,1),(172,'2022314','Võ Thị Nguyên','01-03-2000','vo189928@gmail.com','388202652','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','vo189928@gmail.com','$2a$10$XqZ2OKyPZDTo8i9KZrLANuOInU7V/EhJGaD1jhgENPvpypV8azsEq',1,1,1,1),(173,'2022040','Trần Thị Lý','01-03-2000','abcd3@gmail.com','763934401','2022-08-11 06:06:02','2022-08-11 06:06:02',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','abcd3@gmail.com','$2a$10$xeCunq8hPMACaNnepPB37uENO9y8lUD4C0GduePghHuaBaL.ifd8G',1,1,1,1),(174,'2022166','Trịnh Thị Thu sương ','01-03-2000','minx1648@gmail.com ','776243320','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','minx1648@gmail.com ','$2a$10$HeP5QL7IKV.IfrivMTrbE.vrk06Xof00bK9lW7Pakm2feDl8ae0.W',1,1,1,1),(175,'2022174','Mrs. Anh Quân Ngô','01-03-2000','NgcHuy_V69@hotmail.com','022 1982 7498','2022-08-11 06:05:53','2022-08-11 06:05:53',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','NgcHuy_V69@hotmail.com','$2a$10$cvBSpUTWYklw06YulcenQu4AAY0mZCpE77z3SUnrNHT228S.hdm7y',1,1,1,1),(176,'2022220','Nguyễn Trần Sang ','01-03-2000','Ntsbanda@gmail.com ','397884572','2022-08-11 06:05:56','2022-08-11 06:05:56',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','Ntsbanda@gmail.com ','$2a$10$FSrVIYfxXkBdkbBY5v.HMue47ghIQnbev4S6ZcsHCzlZ/gNBY8u/a',1,1,1,1),(177,'2022031','Lê Quang Đông','01-03-2000','20521190@gm.uit.edu.vn','857203105','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','20521190@gm.uit.edu.vn','$2a$10$hYa6LFwDaLdd9Iv4Lk.hSe1IjaIbAnduLSXOAZyYQbLIP2/4hujxe',1,1,1,1),(178,'2022287','Nguyễn Tiến Phúc','01-03-2000','tienphuc22113@gmail.com','866834181','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','tienphuc22113@gmail.com','$2a$10$ldJVWgGSzKnKvD4byRKhjOM/LJBcmakn2J8fPMWuOPCyRkv/2RT.W',1,1,1,1),(179,'2022188','Nguyễn Lê Công Quý','01-03-2000','nguyenlecongquy@gmail.com','834827907','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','nguyenlecongquy@gmail.com','$2a$10$iig.TCRt4V8KkHgFp3sNdeVllM9kJ2WnaXNywNQtAN956Y.OmW/F.',1,1,1,1),(180,'2022271','Trí Hào Vương','01-03-2000','ThinLng.V8@yahoo.com','020 3229 3891','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','ThinLng.V8@yahoo.com','$2a$10$t1vZ4lNutteiY45qlXL.iekZ0Ls.e6ME5SzifSYHFXQJEmwQL.cFm',1,1,1,1),(181,'2022292','Trần Thị Kiều','01-03-2000','tranthikieu050399@gmail.com','335957611','2022-08-11 06:06:05','2022-08-11 06:06:05',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','tranthikieu050399@gmail.com','$2a$10$RrMMA/1VBLYl2iCiFYXS8OTsq0qj9Tl/ERfCn3Ow/pkC90koZJVFO',1,1,1,1),(182,'2022186','Nguyễn Thị Huệ','01-03-2000','nguyenhue9803@gmail.com','981670578','2022-08-11 06:05:54','2022-08-11 06:05:54',1,0,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','nguyenhue9803@gmail.com','$2a$10$lEIoXxyleVkzl7MjqinaoOfjEzhRoFOP2ILvH2I3Ir7gc15WsuqzC',1,1,1,1),(183,'2022159','Mai Thị Khánh Huyền','01-03-2000','maikhanhhuyen91@gmail.com','988496076','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/default-avatar.jpg','maikhanhhuyen91@gmail.com','$2a$10$ANFdaZ7hHW/SZe29HNmHA.jZThe4.FPGIWzLVnt5vNa/0j1jRB4Qu',1,1,1,1),(184,'2022228','Phan Thị Quỳnh Hương ','01-03-2000','Phanthiquynhhuong0192@gmail.com','867928469','2022-08-11 06:05:56','2022-08-11 06:05:56',1,0,'http:/222.255.238.159:9090/api/get-image/2022-08-12-112906_ahRbs.JPG','Phanthiquynhhuong0192@gmail.com','$2a$10$h91I/eDKBR0ijkAGZgFieO8LWajiibDEHgwwO0rNX8BmQ97cVms/6',1,1,1,1),(185,'2022298','Mrs. Xuân Loan Vương','01-03-2000','TrngSinh_L49@gmail.com','025 9684 7733','2022-08-11 06:06:00','2022-08-11 06:06:00',1,0,'http:/222.255.238.159:9090/api/get-image/2022-08-12-112906_ahRbs.JPG','TrngSinh_L49@gmail.com','$2a$10$iAhy306EbrlRdp24sDUBe.xQsvnCACYoRIichuvVU8DXO9SNjBsMa',1,1,1,1),(186,'2022177','Nguyễn Thị Ngọc Ánh','01-03-2000','ngocanh01299@gmail.com','364264697','2022-08-11 06:06:03','2022-08-11 06:06:03',1,1,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','ngocanh01299@gmail.com','$2a$10$Md1lPSz9KzSICn6mOqtfgu0hHWM925Vy3iTn9gIQDBgv.MfPkABdS',1,1,1,1),(187,'2022261','Trần Thị Hương Thảo','01-03-2000','thaotth18411@st.uel.edu.vn','343534240','2022-08-11 06:05:58','2022-08-11 06:05:58',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','thaotth18411@st.uel.edu.vn','$2a$10$ofOkDbga8g68.27j7HMikeVA5uaBWoUNvh/0xwrdxzhOsqqecMQXO',1,1,1,1),(188,'2022123','Lăng Bảo Khanh','01-03-2000','khanhlb18410@st.uel.edu.vn','962643609','2022-08-11 06:06:02','2022-08-11 06:06:02',1,1,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','khanhlb18410@st.uel.edu.vn','$2a$10$CDKIYOUe6gsU2kgw57ou4uzFBt2tVrUnDE2tyn/MLSlRnl30l6Tge',1,1,1,1),(189,'2022199','NGUYỄN THỊ THẠCH ','01-03-2000','Nguyenthithach943@gmail.com ','925498990','2022-08-11 06:05:55','2022-08-11 06:05:55',1,0,'http:/222.255.238.159:9090/api/get-image/2022-08-12-112906_ahRbs.JPG','Nguyenthithach943@gmail.com ','$2a$10$PLtlWasBXJdirsIXM7BsI.Rg/fSh2F5oU4ByXfirNZxpU68wHRPCq',1,1,1,1),(190,'2022235','Mã Phượng Thi','01-03-2000','phuongthima@gmail.com','356377614','2022-08-11 06:05:57','2022-08-11 06:05:57',1,0,'http:/222.255.238.159:9090/api/get-image/2022-08-12-112906_ahRbs.JPG','phuongthima@gmail.com','$2a$10$BUxgGwOCdobVx47gTDKXPezk0RVkIoyxrBL4yI5k/4/hUgKOj.K9G',1,1,1,1),(191,'2022042','Lý Minh Hòa','01-03-2000','abcd6@gmail.com','763934404','2022-08-11 06:06:01','2022-08-11 06:06:01',1,0,'http:/222.255.238.159:9090/api/get-image/2022-08-12-112906_ahRbs.JPG','abcd6@gmail.com','$2a$10$yw.YDuVSwxWcllMGRi.Lj.k1H3nZxdp6HaYeV4OD4206mXXHpdwFy',1,1,1,1),(192,'2022316','Võ Thị Trọng','01-03-2000','votrong173@gmail.com','374576026','2022-08-11 06:06:01','2022-08-12 11:29:38',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','votrong173@gmail.com','$2a$10$s0FWDLlr/h5bkOeyYc1rAOKcjST/9z/N3eIprxt0/HH2mCVlz8gry',1,1,1,1),(193,'2022202','Lê Minh Như Nguyệt','01-03-2000','nguyetle763@gmail.com','705109277','2022-08-11 06:05:55','2022-08-12 11:29:06',1,0,'http:/222.255.238.159:9090/api/get-image/2022-08-12-112906_ahRbs.JPG','nguyetle763@gmail.com','$2a$10$JRk/Z9CmHCsvzNnGvpNkWOFqLUoQq3nZGyTuxJqWZ7Cetm5IoG/dK',1,1,1,1),(194,'2022295','Trần Văn Thế','01-03-2000','tranvu.ld.2002@gmail.com','345820109','2022-08-11 06:06:00','2022-08-12 11:28:34',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112834_IlovP.JPG','tranvu.ld.2002@gmail.com','$2a$10$G9DR5S7Or86wx7yiZGZw7u9Yrj0QJDSHB/MmVfNQBLuOf5/DhQf02',1,1,1,1),(195,'2022215','Trần Kiến Nam ','01-03-2000','nt43425@gmail.com ','353029739','2022-08-11 06:05:56','2022-08-12 11:34:22',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-113422_dCaI0.JPG','nt43425@gmail.com ','$2a$10$QW2/AA7btXpMs8AmXQG6Rur6CE/ZulM09QcogblfIyOwquhTRl/CG',1,1,1,1),(196,'2022283','Trần Thị Thuỳ Trang ','01-03-2000','thuytrang100412@gmail.com','382642847','2022-08-11 06:05:59','2022-08-12 11:27:08',1,0,'http:/222.255.238.159:9090/api/get-image/2022-08-12-112708_f5uJH.jpg','thuytrang100412@gmail.com','$2a$10$HoTW.T816Gaz1XfFDKX.Zeu4wMPgzssf3sbQ0mlBULRGAZLNBMThW',1,1,1,1),(197,'2022291','Trần Minh Thư','01-03-2000','tranminhthu9aa@gmail.com','375293199','2022-08-11 06:05:59','2022-08-12 11:26:38',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112637_PKx45.jpg','tranminhthu9aa@gmail.com','$2a$10$YwRIN1V0bDN.KhOQkDYj5eSH70F1flWGWUGpLQIOWykcLabC62H4.',1,1,1,1),(198,'2022203','Mỹ Dung Tô','01-03-2000','NguytH58@yahoo.com','0265 6242 7634','2022-08-11 06:05:55','2022-08-12 11:26:11',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112611_KSNJW.JPG','NguytH58@yahoo.com','$2a$10$4hGe0Nu3ltqW.FnAIuidsekA3CiMdW3/Iq6xEmKLrTxaIii5cIKlS',1,1,1,1),(199,'2022176','Ðình Dương Đỗ','01-03-2000','ngHi29@yahoo.com','0258 2682 3601','2022-08-11 06:05:54','2022-08-12 11:25:38',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112637_PKx45.jpg','ngHi29@yahoo.com','$2a$10$pUIJ4H6PigMrh9PfN85vkuXK8OJU./yCL9s8e0TeuClc5c9gPpOJu',1,1,1,1),(200,'2022194','Nguyễn Thị Huyền Trân','01-03-2000','nguyenthihuyentran07082000@gmail.com','704844385','2022-08-11 06:05:54','2022-08-12 11:18:36',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','nguyenthihuyentran07082000@gmail.com','$2a$10$qYxSEwLU.1tTdKw/LKiWgu349J6ggGvgvkvdAN9SudMelEw5kok42',1,1,1,1),(201,'2022209','Bùi Nguyễn Huỳnh Như','01-03-2000','nhubui244@gmail.com','368820207','2022-08-11 06:05:55','2022-08-12 11:18:04',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-110431_1jLDZ.jpg','nhubui244@gmail.com','$2a$10$.uFdZrvx1ChL.cgimr14buTMrWOfSL8IGKppzCC61JxkEH6/54HnK',1,1,1,1),(202,'2022317','Vũ Khánh Băng ','01-03-2000','vukhanhbang2002@gmail.com ','765709335','2022-08-11 06:06:01','2022-08-12 11:17:35',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','vukhanhbang2002@gmail.com ','$2a$10$TMjbxg7JwJ0OduR.Q7mTpufquwZ8m2tZnBk6oHFfpb.jT6iiZ7hXu',1,1,1,1),(203,'2022267','Nguyễn Thị Hợp','01-03-2000','thihop187@gmail.com','375802180','2022-08-11 06:05:58','2022-08-12 11:17:08',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','thihop187@gmail.com','$2a$10$bpzDhnFyvxYmK/gU/u0YJuxmplO4DNfRrqpXbIeUsVwXYeY6mH4Ka',1,1,1,1),(204,'2022231','Lương Thiện Phan','01-03-2000','PhngHoa41@gmail.com','0212 4485 5898','2022-08-11 06:05:57','2022-08-12 11:16:42',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-112938_bw4yY.JPG','PhngHoa41@gmail.com','$2a$10$jb507orI.2inj1EcZUOsVeDQQmjnKpxI63WbybnvDN1NtpPwqUbVS',1,1,1,1),(205,'2022297','Trịnh Thị Thanh Vỷ ','01-03-2000','trinhvy273@gmail.com ','336601621','2022-08-11 06:06:00','2022-08-12 11:11:59',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-110431_1jLDZ.jpg','trinhvy273@gmail.com ','$2a$10$nJRv63cFDJ2Yoyg717H.OuOKvzjKxNd9Qp88FnKaOvgeYm03zcQFa',1,1,1,1),(206,'2022225','Phạm Thị Huyền','01-03-2000','Phamw3huyen010199@gmail.com','365950784','2022-08-11 06:05:56','2022-08-12 11:11:33',1,0,'http://222.255.238.159:9090/api/get-image/2022-08-12-110431_1jLDZ.jpg','Phamw3huyen010199@gmail.com','$2a$10$wf8YWwnwfrhCusALq6/nb.mDMn/Sjd.IHHcGZynyR9WAiRuV5Bth.',1,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
INSERT INTO `options` VALUES (1,'task','Công việc'),(2,'proposal','Đề xuất'),(3,'type','Loại đề xuất'),(4,'employee','Nhân viên'),(5,'department','Phòng ban'),(6,'position','Chức vụ'),(7,'inventory','Kho'),(8,'team','Đội nhóm'),(9,'role','Vai trò'),(10,'post','Bài viết');
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
INSERT INTO `permissions` VALUES (1,'view','Xem'),(2,'create','Tạo'),(3,'update','Sửa'),(4,'delete','Xoá'),(5,'view_all','Xem hết'),(6,'update_all','Sửa hết'),(7,'delete_all','Xoá hết'),(8,'import','Nhập');
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
  KEY `fk_positions_departments_idx` (`department_id`),
  CONSTRAINT `fk_positions_departments` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `fk_positions_teams1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `fk_role_position` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_employees`
--

LOCK TABLES `positions_employees` WRITE;
/*!40000 ALTER TABLE `positions_employees` DISABLE KEYS */;
INSERT INTO `positions_employees` VALUES (7,7,106),(9,9,165),(10,10,154),(12,12,111),(13,13,114),(14,14,162),(15,15,151),(16,16,133),(17,17,167),(18,18,117),(19,19,123),(21,21,121),(23,23,130),(24,24,161),(25,25,119),(27,27,103),(28,28,145),(29,29,169),(32,32,103),(33,33,93),(34,34,99),(35,35,92),(36,36,138),(37,37,157),(38,38,81),(39,39,93),(40,40,110),(41,41,82),(42,42,147),(43,43,159),(44,44,178),(45,45,86),(46,46,179),(47,47,109),(48,48,157),(49,49,113),(50,50,169),(51,51,105),(52,52,180),(53,53,122),(54,54,139),(55,55,148),(56,56,146),(57,57,127),(58,58,165),(59,59,82),(60,60,163),(61,61,97),(62,62,97),(63,63,121),(64,64,168),(65,65,98),(66,66,115),(67,67,105),(68,68,187),(69,69,134),(70,70,113),(71,71,95),(72,72,93),(73,73,116),(74,74,132),(75,75,153),(76,76,157),(77,77,101),(78,78,117),(79,79,101),(80,80,177),(81,81,145),(82,82,113),(83,83,82),(84,84,140),(85,85,95),(86,86,163),(87,87,103),(88,88,131),(89,89,99),(90,90,161),(91,91,123),(92,92,115),(93,93,171),(94,94,115),(95,95,111),(96,96,101),(97,97,135),(98,98,88),(99,99,156),(100,100,174),(101,101,83),(102,102,87),(103,103,113),(104,104,88),(105,105,182),(106,106,82),(107,107,158),(108,108,173),(109,109,149),(110,110,129),(111,111,82),(112,112,186),(113,113,95),(114,114,104),(115,115,163),(116,116,159),(117,117,169),(118,118,179),(119,119,103),(120,120,115),(121,121,101),(122,122,121),(123,123,172),(124,124,120),(125,125,107),(126,126,111),(127,127,111),(128,128,82),(129,129,113),(130,130,125),(131,131,97),(132,132,164),(133,133,131),(134,134,82),(135,135,95),(136,136,86),(137,137,135),(138,138,125),(139,139,117),(140,140,108),(141,141,155),(142,142,109),(143,143,171),(144,144,99),(145,145,141),(146,146,165),(147,147,118),(148,148,175),(149,149,184),(150,150,170),(151,151,144),(152,152,88),(153,153,133),(154,154,153),(155,155,166),(156,156,137),(157,157,167),(158,158,121),(159,159,142),(160,160,181),(161,161,111),(162,162,185),(163,163,85),(164,164,94),(165,165,119),(166,166,115),(167,167,84),(168,168,143),(169,169,86),(170,170,139),(171,171,84),(172,172,183),(173,173,147),(174,174,86),(175,175,88),(176,176,105),(177,177,145),(178,178,175),(179,179,96),(180,180,119),(181,181,176),(182,182,95),(183,183,160),(184,184,107),(185,185,129),(186,186,161),(187,187,115),(188,188,157),(189,189,99),(190,190,109),(191,191,147),(207,1,37),(208,206,107),(209,205,128),(210,8,150),(211,204,109),(212,203,117),(213,202,137),(214,201,102),(215,200,97),(216,5,112),(217,2,152),(218,4,84),(219,6,167),(220,3,115),(221,31,141),(222,22,86),(223,30,107),(224,20,107),(225,11,124),(226,199,93),(227,198,101),(228,197,126),(229,196,123),(230,194,127),(231,193,100),(232,192,136),(233,195,103);
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
  KEY `create_by_idx` (`create_by`),
  CONSTRAINT `create_by` FOREIGN KEY (`create_by`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Hợp ban quản lý ký túc xá','',1,48,'2022-07-20 02:46:59',1,'2022-07-25 14:42:20',0),(2,'Tieu de bai viet 2 da chinh sua','Đây là review về Củ sạc Ugreen gaN 65W CD244, 2C1A, hỗ trợ nhiều chuẩn sạc PD, PPS, QC2.0, QC3.0,... của mình. Mình mua nó với giá 500K VND. Hi vọng phần review sẽ hữu ích cho bạn nào muốn mua nhé, nếu bạn có câu hỏi gì thì hãy comment vô bài này nha.Thông tin chung về Củ sạc Ugreen gaN 65W CD244, 2C1A, hỗ trợ nhiều chuẩn sạc PD, PPS, QC2.0, QC3.0,... Ugreen là một trong những hãng sản suất linh kiện, củ sạc, sạc dự phòng chất lượng tốt được nhiều người tin tưởng. Cách đây không lâu Ugreen giới thiệu củ sạc gaN 65W (CD244), củ sạc mới chỉ còn 3 cổng 2C+1A, giảm đáng kể kích thước, trọng lượng so với củ sạc gaN 65W trước đây (CD224).',1,1,'2022-07-20 02:46:59',1,'2022-07-20 02:51:48',0),(4,'Bé heo xin chào mọi người','<figure class=\"image\"><img src=\"http://localhost:9090/api/get-image/2022-08-12-110442_NddkU.jpg\"></figure>',1,1,'2022-08-12 11:05:13',1,'2022-08-12 11:05:13',NULL),(5,'Tuyển sinh khóa 7','<p><strong>THÔNG BÁO</strong></p><p><strong>&nbsp;XÉT CHỌN SINH VIÊN VÀO KÝ TÚC XÁ CỎ MAY</strong></p><p><strong>NĂM HỌC: 2022-2023</strong></p><p>&nbsp;</p><p>Ký Túc Xá Cỏ May <strong>“Tiếp bước sinh viên nghèo- Học giỏi”</strong> do doanh nhân Phạm văn Bên chủ DNTN Cỏ May đã xây dựng và đi vào hoạt động từ năm 2016 đến nay. Năm 2022&nbsp;là năm thứ bảy&nbsp;tiếp tục xét chọn nhằm giúp sinh viên có gia cảnh khó khăn học giỏi, mồ côi cha hoặc mẹ, không có điều kiện để tiếp tục con đường học vấn hoàn thành bậc đại học, trở thành những công dân ưu tú vừa có tâm, có tài góp phần xây dựng đất nước.</p><p>Với mục đích và ý nghĩa trên Công ty TNHH Cỏ May Lai Vung – Ký túc xá Cỏ May thông báo xét chọn sinh viên cho năm học mới 2022&nbsp;– 2023&nbsp;như sau:</p><p>I. SỐ LƯỢNG VÀ ĐIỀU KIỆN XÉT TUYỂN:<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1.&nbsp;&nbsp; &nbsp;Dự kiến số lượng cho 100 sinh viên trúng tuyển vào các trường đại học công lập TP.Hồ Chí Minh và các tỉnh lân cận năm học 2022 - 2023.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2.&nbsp;&nbsp; &nbsp;Điều kiện xét tuyển:&nbsp;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - Gia cảnh nghèo, khó khăn, mồ côi cha hoặc mẹ không có đủ tài chính để tiếp tục việc học&nbsp;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - Học sinh giỏi cấp III, ưu tiên học sinh giỏi cấp huyện, tỉnh, thành phố.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - Điểm thi Tốt nghiệp PTTH Quốc gia trên 21 điểm.&nbsp;<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; - Có kết quả cao trong kỳ thi đánh giá năng lực ĐHQG TP. Hồ Chí Minh(nếu có).<br>II. HỒ SƠ XÉT CHỌN BAO GỒM:<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1.&nbsp;&nbsp; &nbsp;Đơn xin xét chọn vào ký túc xá Cỏ May theo mẫu, sinh viên in ra từ website (www.ktxcomay.com.vn)<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2.&nbsp;&nbsp; &nbsp;Học bạ THPT (Cấp III) bản photocopy.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 3.&nbsp;&nbsp; &nbsp;Thành tích học tập: bằng khen, giấy khen, giải thưởng.(bản photocopy).<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 4.&nbsp;&nbsp; &nbsp;Sổ hộ nghèo, giấy xác nhận hộ cân nghèo. Giấy xác nhận hoàn cảnh gia đình thật sự khó khăn của địa phương.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 5.&nbsp;&nbsp; &nbsp;Giấy báo nhập học của Trường đại học năm học 2022-2023.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 6.&nbsp;&nbsp; &nbsp;Giấy báo điểm kỳ thi đánh giá năng lực của trường hoặc của ĐHQG(nếu có).<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 7.&nbsp;&nbsp; &nbsp;Lý lịch cá nhân có dán ảnh và đóng dấu xác nhận của địa phương.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 8.&nbsp;&nbsp; &nbsp;Nộp 03 bản CMND hoặc CCCD photocopy có chứng thực.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 9.&nbsp;&nbsp; &nbsp;Nộp 03 tấm ảnh 4x6 cm , ghi rõ thông tin bao gồm họ tên, năm sinh phía sau ảnh.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;10. Nộp 01 tấm hình căn nhà đang ở (kích thước ảnh 15 x 20 cm).<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * Lưu ý: Tất cả thí sinh phải viết bài văn tự luận về bản thân, gia đình và ước mơ trong Đơn xin.<br>III. THỜI GIAN VÀ ĐỊA ĐIỂM NỘP HỒ SƠ<br>&nbsp;&nbsp;&nbsp; &nbsp;* Bước 1: Đăng ký trên Internet điền đầy đủ thông tin hướng dẫn theo mẫu trên link: <a href=\"http://bit.ly/KTXCMTUYENSINH2022\">\"bit.ly/KTXCMTUYENSINH2022</a>\"&nbsp;Thời gian từ 15/7/2022 đến 20/8/2022<br>&nbsp; &nbsp; &nbsp; &nbsp;* Bước 2: Nộp hồ sơ giấy tại Văn phòng Ký túc xá Cỏ May hoặc qua bưu điện trên túi đựng hồ sơ ghi đầy đủ giấy tờ hồ sơ (tính thời gian theo dấu bưu điện).<br>Địa chỉ : Ký túc xá Cỏ May Đường số 4, Khu phố 6, Phường Linh Trung. TP Thủ Đức TPHCM(trong khuôn viên ĐH Nông Lâm TP.Hồ Chí Minh)<br>&nbsp; &nbsp; &nbsp; &nbsp;* Điện thoại: 028 6684 3039 – Hotline: 0913887055.&nbsp;<br>&nbsp; &nbsp; &nbsp; &nbsp;* Thời gian nhận hồ sơ :<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;- Ngày 20/07/2022 - 20/08/2022: Đăng ký trên máy vi tính theo link và nộp hồ sơ dự tuyển cho KTX Cỏ May.<br>&nbsp; &nbsp; &nbsp; &nbsp; - Thời gian Thông báo kết quả danh sách đạt vào ký túc xá: ngày 30/8/2022.<br>&nbsp; &nbsp; &nbsp; &nbsp; - Thời gian đăng ký thủ tục vào ở: ngày 04/9/2022.<br>IV. CHÍNH SÁCH HỖ TRỢ CỦA KÝ TÚC XÁ<br>&nbsp; &nbsp; &nbsp; &nbsp; 1. Ở miễn phí<br>&nbsp; &nbsp; &nbsp; &nbsp; 2. Được hỗ trợ tiền ăn cấp theo tuần, không hỗ trợ tiền ăn trong tháng hè, tết, đi học quân sự, đi thực tập.<br>&nbsp; &nbsp; &nbsp; &nbsp; 3. Cấp học bổng toàn bộ học phí hệ đài trà, cho năm học đầu tiên. Để duy trì được cấp học bổng cho học kỳ tiếp theo sinh viên có điểm kết quả học tập điểm trung bình học kỳ đạt sinh viên giỏi 8 điểm ( thang điểm 10), hay 3,5 điểm ( tháng điểm 4), hoặc được nhận xét trong top 10% khá giỏi của khoa, ngành học<br>&nbsp; &nbsp; &nbsp; &nbsp;4. Hỗ trợ học ngoại ngữ, tin học bằng hình thức đóng học phí tại các Trung tâm Ngoại ngữ, Tin học trong trường sinh viên đang học.&nbsp;<br>&nbsp; &nbsp; &nbsp; &nbsp;5. Được học tập kỹ năng mềm, sinh hoạt ngoại khoá.<br>&nbsp; &nbsp; &nbsp; &nbsp;6. Hỗ trợ Bảo hiểm tai nạn , Bảo hiểm y tế năm đầu tiên, xét cấp năm kế tiếp tính theo điểm học tập.<br>&nbsp; &nbsp; &nbsp; &nbsp; Tuy nhiên sinh viên học giỏi nhưng thiếu ý thức rèn luyện các nhân, đạo đức sẽ bị mời ra khỏi Ký túc xá hoặc sinh viên có thể bị giảm chính sách hỗ trợ nếu không đạt tiêu chí về học tập.<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Rất mong các cơ quan chức năng, đơn vị trường học các cơ quan báo chí tuyên truyền rộng rãi đến các học sinh, sinh viên có hoàn cảnh khó khăn có thể tiếp cận Thông báo này và được vào Ký túc xá Cỏ May trong năm học mới 2022-2023.<img src=\"https://canhbaosom.com/storage/app/uploads/user_968/20220615063649-FILE_20220614_121016_Th%C3%B4ng%20b%C3%A1o%20x%C3%A9t%20ch%E1%BB%8Dn%20sinh%20vi%C3%AAn-1.png\"></p><p><img src=\"https://canhbaosom.com/storage/app/uploads/user_968/20220615063907-FILE_20220614_121016_Th%C3%B4ng%20b%C3%A1o%20x%C3%A9t%20ch%E1%BB%8Dn%20sinh%20vi%C3%AAn-2.png\"></p><p><img src=\"https://canhbaosom.com/storage/app/uploads/user_968/20220615063938-FILE_20220614_121016_Th%C3%B4ng%20b%C3%A1o%20x%C3%A9t%20ch%E1%BB%8Dn%20sinh%20vi%C3%AAn-3.png\"><i>Nơi nhận:&nbsp;</i></p><p>- Ban Giám hiệu ĐH Nông Lâm Tp.HCM;</p><p>- Ban giám đốc công ty;</p><p>- Các Trường ĐH công lập.</p><p>-&nbsp; TT Hỗ trợ SV TP.HCM;</p><p>- Hôi SV&nbsp;các trường ĐH Công lập;</p><p>- P.HCNS: lưu;</p>',1,1,'2022-08-12 11:06:49',1,'2022-08-12 11:06:49',NULL),(6,'CHÍNH THỨC MỞ FORM ĐĂNG KÍ XÉT TUYỂN TÂN SINH VIÊN KHÓA 7','<figure class=\"image\"><img src=\"https://ktxcomay.com.vn/storage/app/uploads/public/62d/0e2/320/62d0e23207210259279888.jpg\" alt=\"Blog Single\"></figure><p>CHÍNH THỨC MỞ FORM ĐĂNG KÍ XÉT TUYỂN TÂN SINH VIÊN KHÓA 7</p><p>Ngày 15/7/2022, KTX chính thức mở Link: (\"<a href=\"https://bit.ly/KTXCMTUYENSINH2022\">bit.ly/KTXCMTUYENSINH2022</a>\") cho tân sinh viên đăng kí xét tuyển online tại KTX. Theo đó, từ nay đến ngày 20/8/2022, TSV có nguyện vọng đăng ký xét vào ở tại KTX sẽ tham gia điền Link đăng ký.</p><p>Sau đó chuẩn hồ sơ giấy đầy đủ và gửi về địa chỉ: Ký túc xá Cỏ May Đường số 4, Khu phố 6, Phường Linh Trung. TP Thủ Đức TP HCM (trong khuôn viên trường ĐH Nông Lâm TP HCM)&nbsp;</p><p>Điện thoại: 028 6684 3039 – Hotline: 0913 887 055.</p><p>Hồ sơ xét tuyển bao gồm:</p><p>1. Đơn xin xét chọn vào ký túc xá Cỏ May theo mẫu, sinh viên in ra từ website (www.ktxcomay.com.vn).</p><p>2. Học bạ THPT (Cấp III) bản photocopy.</p><p>3. Thành tích học tập: bằng khen, giấy khen, giải thưởng (bản photocopy).</p><p>4. Sổ hộ nghèo, giấy xác nhận hộ cân nghèo, giấy xác nhận hoàn cảnh gia đình thật sự khó khăn của địa phương.</p><p>5. Giấy báo nhập học của trường đại học năm học 2022 - 2023.</p><p>6. Giấy báo điểm kỳ thi đánh giá năng lực của trường hoặc của ĐHQG (nếu có).</p><p>7. Lý lịch cá nhân có dán ảnh và đóng dấu của địa phương.</p><p>8. Nộp 03 CMND hoặc CCCD photocopy có công chứng.</p><p>9. Nộp 03 ảnh 4x6, ghi rõ thông tin phía sau ảnh.</p><p>10. Nộp 01 ảnh căn nhà đang ở (kích thước ảnh 15 x 20 cm).</p><p>* Lưu ý: Tất cả thí sinh phải viết bài tự luận về bản thân, gia đình và ước mơ trong đơn xin.</p><p>Tân sinh viên lưu ý các mốc thời gian để đăng kí gửi hồ sơ lưu trú đúng quy định.</p><p>Thông tin chi tiết về việc tuyển sinh tại KTX năm học 2022 -2023 xem tại đây&nbsp;<a href=\"https://ktxcomay.com.vn/post/268\">https://ktxcomay.com.vn/post/268</a></p>',1,1,'2022-08-12 11:07:38',1,'2022-08-12 11:07:38',NULL),(7,'THÔNG BÁO CỦA BAN QUẢN LÝ KÝ TÚC XÁ CỎ MAY GỬI ĐẾN SINH VIÊN','<figure class=\"image\"><img src=\"https://ktxcomay.com.vn/storage/app/uploads/public/615/9aa/09f/6159aa09f0b54685421458.jpg\" alt=\"Blog Single\"></figure><p>Theo Bộ y tế, dịch bệnh COVID- 19 còn diễn biến phức tạp, khó lường. Chúng ta đang tăng cường thực hiện các biện pháp để kiểm soát. Hiện tại KTX Cỏ May vẫn còn làm bệnh viện dã chiến; vậy BQL KTX thông báo như sau :</p><p>*ĐỐI VỚI SINH VIÊN KHOÁ 3,4 và 5:</p><p>Hiện nay đa số các trường đại học đào tạo theo phương thức trực tuyến , online , cho đến hết học kỳ I , vậy sinh viên tiếp tục ở nhà không vào KTX khi chưa có thông báo chính thức của KTX .</p><p>Trong thời gian này, sinh viên tuân thủ việc tiêm chích ngừa COVID-19 tại trường hoặc tại địa phương; cố gắng tiêm được 2 mũi để đủ điều kiện đi lại các tỉnh thành và được vào KTX .</p><p>ĐỐI VỚI SINH VIÊN KHOÁ 2 :</p><p>Trong ký túc xá hiện nay còn một số đồ đạc của sinh viên khoá 2 , đề nghị khi có thông báo sinh viên về KTX để thu dọn theo đúng thời gian quy định và nâng cao cảnh giác, thực hiện biện pháp “5K và tiêm vắc xin” để bảo vệ sức khỏe, tính mạng của bản thân và cộng đồng .</p><p>ĐỐI VỚI CÁC BẠN TÂN SINH VIÊN ĐĂNG KÝ XÉT TUYỂN VÀO KTX CM</p><p>Các thí sinh đã đăng ký online , tiếp tục hoàn thiện hồ sơ giấy và sẽ nộp cho KTX với địa chỉ trong thông báo qua đường bưu điện kể từ ngày 15/10/21</p><p>Kết quả xét chọn sẽ thông báo sau .</p><p>Rất mong sinh viên thực hiện thông báo trên và chấp hành quy định về phòng chống dịch.</p><p>Chúc các bạn sinh viên nhiều sức khỏe, đạt kết quả tốt trong năm học mới .</p><p>BQL KTX Cỏ May</p>',1,1,'2022-08-12 11:08:24',1,'2022-08-12 11:08:24',NULL),(8,'\"BƯỚC CHÂN\" TÂN SINH VIÊN KHÓA 6 ĐẦU TIÊN VÀO VỚI ĐẠI GIA ĐÌNH CỎ MAY','<figure class=\"image\"><img src=\"https://ktxcomay.com.vn/storage/app/uploads/public/621/b5d/887/621b5d8873fcb467371334.jpg\" alt=\"Blog Single\"></figure><p>\"BƯỚC CHÂN\" TÂN SINH VIÊN KHÓA 6 ĐẦU TIÊN VÀO VỚI ĐẠI GIA ĐÌNH CỎ MAY</p><p>Sáng 27/2, KTX Cỏ May bắt đầu đón tân sinh viên khóa 6 vào lưu trú.</p><p>Tại đây, các bạn tân sinh viên được các anh chị tình nguyện viên là sinh viên khóa 3, 4, 5 hướng dẫn làm thủ tục: nộp hồ sơ, làm thẻ ATM, chụp ảnh thẻ ra/ vào KTX, điền phiếu tự bạch, hướng dẫn đăng ký tạm trú, nhận vật dụng cá nhân: chiếu, mền, gối, mùng…</p><p>Các bạn tân sinh viên ơi,</p><p>chúc mừng</p><p>tất cả các bạn đã trở thành một thành viên trong Đại gia đình KTX Cỏ May&nbsp;</p><p>Và các bạn sinh viên khóa cũ trong KTX Cỏ May, nếu các bạn bị mất/hư thẻ ra vào KTX, các bạn hãy xuống sảnh để chụp lại ảnh làm thẻ mới luôn nhé!</p><p>Thực hiện: Đội truyền thông KTX Cỏ May</p><p><img src=\"https://canhbaosom.com/storage/app/uploads/user_968/20220227111530-274825112_689556348717886_4688936573085927391_n.jpg\" alt=\"\"><img src=\"https://canhbaosom.com/storage/app/uploads/user_968/20220227111605-274857859_689556325384555_7752146992626329418_n.jpg\" alt=\"\"><img src=\"https://canhbaosom.com/storage/app/uploads/user_968/20220227111619-274917448_689556365384551_849326541599674638_n.jpg\" alt=\"\"></p>',1,1,'2022-08-12 11:09:41',1,'2022-08-12 11:09:41',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
INSERT INTO `proposal_type_details` VALUES (1,1,'1','purpose','Mục đích/Lý do',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập mục đích/lý do tạo đề xuất..','Vui lòng nhập mục đích/lý do tạo đề xuất.'),(2,1,'2','depravity','Tình trạng hư hỏng',11,'-1','-1','2022-03-28','2022-03-28',1,'Các bạn điền rõ tình trạng hư hỏng của thiết bị để nhóm sửa chữa chuẩn bị sẳn dụng cụ để sửa chữa nhé!','Nhập tình trạng hư hỏng...','Vui lòng nhập tình trạng như hỏng.'),(3,1,'3','room','Số phòng',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập số phòng...','Vui lòng nhập số phòng.'),(4,1,'4','note','Ghi chú',11,'-1','-1','2022-03-28','2022-03-28',0,'Các bạn mô tả vị trí của thiết bị hư hỏng trong phòng giúp mình nhé!','Nhập ghi chú...','Vui lòng nhập ghi chú.'),(5,2,'1','purpose','Mục đích/Lý do',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập mục đích/lý do tạo đề xuất..','Vui lòng nhập mục đích/lý do tạo đề xuất.'),(6,2,'2','supplies','Tên vật tư',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập tên vật tư','Vui lòng nhập tên vật tư.'),(7,2,'3','number','Số lượng',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập số lượng','Vui lòng nhập số lượng.'),(8,2,'4','price','Đơn gía',1,'-1','-1','2022-03-28','2022-03-28',1,NULL,'Nhập đơn giá','Vui lòng nhập đơn giá.');
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
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proposals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proposal_type_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `create_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `modify_by` int(11) NOT NULL DEFAULT '-1',
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '""',
  `current_step` int(11) DEFAULT '1',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '""',
  PRIMARY KEY (`id`),
  KEY `fk_proposals_proposal_types1_idx` (`proposal_type_id`),
  KEY `fk_proposals_statuses_idx` (`status_id`),
  CONSTRAINT `fk_proposals_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`),
  CONSTRAINT `fk_proposals_statuses` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals`
--

LOCK TABLES `proposals` WRITE;
/*!40000 ALTER TABLE `proposals` DISABLE KEYS */;
INSERT INTO `proposals` VALUES (1,1,45,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(2,1,54,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(3,1,1,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(4,1,1,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(5,1,48,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(6,1,19,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(7,1,9,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(8,1,10,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(9,1,66,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(10,1,22,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(11,1,75,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(12,1,17,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(13,1,1,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(14,1,17,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(15,1,72,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(16,1,38,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(17,1,1,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(18,1,69,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(19,1,32,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(20,1,41,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(21,1,1,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(22,1,75,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(23,1,1,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(24,1,66,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(25,1,8,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(26,1,1,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(27,1,37,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(28,1,69,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(29,1,5,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(30,1,23,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(31,2,45,7,'2022-08-08 18:33:24',-1,'2022-08-08 18:33:24',1,NULL),(32,1,1,7,'2022-08-08 18:33:24',1,'2022-08-08 18:33:24',1,NULL),(33,1,1,7,'2022-08-08 18:33:24',1,'2022-08-08 18:33:24',1,NULL);
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
  CONSTRAINT `fk_proposal_permissions_proposal_types1` FOREIGN KEY (`proposal_type_id`) REFERENCES `proposal_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proposals_permissions`
--

LOCK TABLES `proposals_permissions` WRITE;
/*!40000 ALTER TABLE `proposals_permissions` DISABLE KEYS */;
INSERT INTO `proposals_permissions` VALUES (1,2,-1,-1,41),(2,2,-1,-1,43),(5,1,-1,-1,45),(6,1,-1,-1,1);
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
  KEY `fk_roledetail_role_idx` (`role_id`),
  KEY `fk_roledetail_option_idx` (`option_id`),
  KEY `fk_roledetail_permission_idx` (`permission_id`),
  CONSTRAINT `fk_roledetail_option` FOREIGN KEY (`option_id`) REFERENCES `options` (`id`),
  CONSTRAINT `fk_roledetail_permission` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `fk_roledetail_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_details`
--

LOCK TABLES `role_details` WRITE;
/*!40000 ALTER TABLE `role_details` DISABLE KEYS */;
INSERT INTO `role_details` VALUES (11,1,4,1,-1,-1,'2022-03-28','2022-03-28'),(12,1,4,2,-1,-1,'2022-03-28','2022-03-28'),(13,1,4,3,-1,-1,'2022-03-28','2022-03-28'),(14,1,4,4,-1,-1,'2022-03-28','2022-03-28'),(15,1,4,5,-1,-1,'2022-03-28','2022-03-28'),(16,1,4,6,-1,-1,'2022-03-28','2022-03-28'),(17,2,4,1,-1,-1,'2022-03-28','2022-03-28'),(18,2,4,2,-1,-1,'2022-03-28','2022-03-28'),(19,2,4,3,-1,-1,'2022-03-28','2022-03-28'),(20,2,4,4,-1,-1,'2022-03-28','2022-03-28'),(21,2,4,5,-1,-1,'2022-03-28','2022-03-28'),(22,2,4,6,-1,-1,'2022-03-28','2022-03-28'),(23,4,4,1,-1,-1,'2022-03-28','2022-03-28'),(24,5,4,1,-1,-1,'2022-03-28','2022-03-28'),(25,6,4,1,-1,-1,'2022-03-28','2022-03-28'),(26,1,6,1,-1,-1,'2022-03-28','2022-03-28'),(27,1,6,2,-1,-1,'2022-03-28','2022-03-28'),(28,1,6,3,-1,-1,'2022-03-28','2022-03-28'),(29,1,6,4,-1,-1,'2022-03-28','2022-03-28'),(30,2,6,1,-1,-1,'2022-03-28','2022-03-28'),(31,2,6,2,-1,-1,'2022-03-28','2022-03-28'),(32,2,6,3,-1,-1,'2022-03-28','2022-03-28'),(33,2,6,4,-1,-1,'2022-03-28','2022-03-28'),(34,4,6,1,-1,-1,'2022-03-28','2022-03-28'),(35,5,6,1,-1,-1,'2022-03-28','2022-03-28'),(36,6,6,1,-1,-1,'2022-03-28','2022-03-28'),(37,1,1,1,-1,-1,'2022-03-28','2022-03-28'),(38,1,2,1,-1,-1,'2022-03-28','2022-03-28'),(39,1,3,1,-1,-1,'2022-03-28','2022-03-28'),(40,1,7,1,-1,-1,'2022-03-28','2022-03-28'),(41,1,8,1,-1,-1,'2022-03-28','2022-03-28'),(42,1,8,2,-1,-1,'2022-03-28','2022-03-28'),(43,1,8,3,-1,-1,'2022-03-28','2022-03-28'),(44,1,8,4,-1,-1,'2022-03-28','2022-03-28'),(45,2,8,1,-1,-1,'2022-03-28','2022-03-28'),(46,2,8,2,-1,-1,'2022-03-28','2022-03-28'),(47,2,8,3,-1,-1,'2022-03-28','2022-03-28'),(48,2,8,4,-1,-1,'2022-03-28','2022-03-28'),(49,3,8,1,-1,-1,'2022-03-28','2022-03-28'),(50,3,8,2,-1,-1,'2022-03-28','2022-03-28'),(51,3,8,3,-1,-1,'2022-03-28','2022-03-28'),(52,3,8,4,-1,-1,'2022-03-28','2022-03-28'),(53,4,8,1,-1,-1,'2022-03-28','2022-03-28'),(54,4,8,2,-1,-1,'2022-03-28','2022-03-28'),(55,4,8,3,-1,-1,'2022-03-28','2022-03-28'),(56,4,8,4,-1,-1,'2022-03-28','2022-03-28'),(57,5,8,1,-1,-1,'2022-03-28','2022-03-28'),(58,5,8,2,-1,-1,'2022-03-28','2022-03-28'),(59,5,8,3,-1,-1,'2022-03-28','2022-03-28'),(60,5,8,4,-1,-1,'2022-03-28','2022-03-28'),(61,6,8,1,-1,-1,'2022-03-28','2022-03-28'),(62,6,8,2,-1,-1,'2022-03-28','2022-03-28'),(63,6,8,3,-1,-1,'2022-03-28','2022-03-28'),(64,6,8,4,-1,-1,'2022-03-28','2022-03-28'),(65,7,8,1,-1,-1,'2022-03-28','2022-03-28'),(66,7,8,2,-1,-1,'2022-03-28','2022-03-28'),(67,7,8,3,-1,-1,'2022-03-28','2022-03-28'),(68,7,8,4,-1,-1,'2022-03-28','2022-03-28'),(69,8,8,1,-1,-1,'2022-03-28','2022-03-28'),(70,8,8,2,-1,-1,'2022-03-28','2022-03-28'),(71,8,8,3,-1,-1,'2022-03-28','2022-03-28'),(72,8,8,4,-1,-1,'2022-03-28','2022-03-28'),(73,9,8,1,-1,-1,'2022-03-28','2022-03-28'),(74,9,8,2,-1,-1,'2022-03-28','2022-03-28'),(75,9,8,3,-1,-1,'2022-03-28','2022-03-28'),(76,9,8,4,-1,-1,'2022-03-28','2022-03-28'),(77,10,8,1,-1,-1,'2022-03-28','2022-03-28'),(78,10,8,2,-1,-1,'2022-03-28','2022-03-28'),(79,10,8,3,-1,-1,'2022-03-28','2022-03-28'),(80,10,8,4,-1,-1,'2022-03-28','2022-03-28'),(86,4,8,8,-1,-1,'2022-03-28','2022-03-28'),(87,10,1,1,363,363,'\"\"','\"\"'),(88,10,2,1,363,363,'\"\"','\"\"'),(89,10,3,1,363,363,'\"\"','\"\"'),(90,10,4,1,363,363,'\"\"','\"\"'),(92,10,6,1,363,363,'\"\"','\"\"'),(93,10,7,1,363,363,'\"\"','\"\"'),(94,4,8,5,-1,-1,'2022-03-28','2022-03-28'),(107,1,5,1,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(108,1,5,2,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(109,1,5,3,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(110,1,5,4,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(111,2,5,1,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(112,2,5,2,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(113,2,5,3,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(114,2,5,4,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(115,4,5,1,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(116,4,5,2,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(117,4,5,3,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(118,4,5,4,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(119,4,5,5,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(120,4,5,6,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(121,4,5,7,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(122,4,5,8,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(123,5,5,1,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23'),(124,10,5,1,1,1,'2022-08-12 11:15:23','2022-08-12 11:15:23');
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
  `index` int(11) DEFAULT NULL,
  `type` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `modify_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_by` int(11) DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `task_task_his_idx` (`task_id`),
  KEY `fk_task_his_statuses_idx` (`status_id`),
  KEY `receiver_id_idxs` (`receiver_id`),
  CONSTRAINT `fk_receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_task_his_statuses` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_task_his` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  KEY `fk_task_statuses_idx` (`status_id`),
  KEY `creator_id_idx` (`creator_id`),
  KEY `receiver_id_idx` (`receiver_id`),
  CONSTRAINT `creator_id` FOREIGN KEY (`creator_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `fk_task_statuses` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `receiver_id` FOREIGN KEY (`receiver_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,1,1,'cửa á ác','Được vá không quần.','2022-09-03 19:12:00',24,'2022-08-12',1,1,'2022-07-08','2022-08-03 19:12:00'),(2,1,4,'tủ bè vẽ','Lỗi tám đồng làm mượn.\nKhông đang một mười bàn bảy tôi.\nRuộng áo tô đạp hàng.','2022-08-03 19:12:00',34,'2022-08-12',1,2,'2022-07-08','2022-08-03 19:12:00'),(3,1,43,'chín đang may','Thương gì khâu chết dép chết ghét.\nBiển năm nha đập quần.\nViệc bảy vàng nhà dép đạp giày thì.','2022-08-03 19:12:00',3,'2022-08-12',1,1,'2022-07-08','2022-08-03 19:12:00'),(4,1,8,'quê thuê trời','Đá may vẽ cửa không tô ghét.','2022-08-03 19:12:00',77,'2022-08-12',2,1,'2022-07-08','2022-08-03 19:12:00'),(5,1,1,'đập tô tàu','Máy hết ghế leo đỏ hai gió.\nHai yêu xuồng tàu trăng thích đánh mua.\nBiết bè đạp.\nNgọt núi hàng á tui xuồng dép.','2022-08-03 19:12:00',35,'2022-08-12',2,1,'2022-07-08','2022-08-03 19:12:00'),(6,1,33,'xuồng đâu lỗi','Việc tàu quê kim nghỉ xe.\nViệc tui sáu khâu khoan.','2022-08-03 19:12:00',5,'2022-08-12',2,1,'2022-07-08','2022-08-03 19:12:00'),(7,1,85,'thuê được trăng','Cái năm nước mượn biển lỗi bơi xuồng ờ không.','2022-08-03 19:12:00',93,'2022-08-12',2,1,'2022-07-08','2022-08-03 19:12:00'),(8,1,52,'mười biết áo','Bè tàu gì tủ ngọt xe quần bảy.','2022-08-03 19:12:00',41,'2022-08-12',5,1,'2022-07-08','2022-08-03 19:12:00'),(9,1,11,'thuê vàng trời','Cửa mượn mua thì ba kim hết bảy mượn leo.','2022-08-03 19:12:00',88,'2022-08-12',1,1,'2022-07-08','2022-08-03 19:12:00'),(10,1,9,'biển ruộng gió','Biết bàn viết bơi.','2022-08-03 19:12:00',67,'2022-08-12',1,1,'2022-07-08','2022-08-03 19:12:00'),(11,1,18,'ờ bảy phá','Chỉ phá vẽ một chín một hết đâu.\nHết quê ruộng viết.','2022-08-03 19:12:00',77,'2022-08-12',1,1,'2022-07-08','2022-08-03 19:12:00'),(12,1,58,'là khoảng biển','Yêu ác hàng thuyền yêu lầu.\nÁo ruộng chỉ thôi sáu núi.\nMây ác trăng anh bạn việc may vàng.','2022-08-03 19:12:00',99,'2022-08-12',1,1,'2022-07-08','2022-08-03 19:12:00'),(13,1,44,'chỉ đã thì','Vá bơi trời trăng.\nGió vàng nha nước ghế quần anh chìm.\nGì ruộng đạp thôi tím.\nBơi khoảng đồng sáu.','2022-08-03 19:12:00',53,'2022-08-12',4,1,'2022-07-08','2022-08-03 19:12:00'),(14,1,67,'hai thuyền xe','Đang em ghét nước thế lầu xe may.\nNúi vàng một độc.\nVá tím nước.','2022-08-03 19:12:00',44,'2022-08-12',4,1,'2022-07-08','2022-08-03 19:12:00'),(15,1,97,'yêu biết tủ áo','<p>Hai áo cửa ờ tôi trời đã đang chỉ. Hết gì ngọt đánh vẽ đang được chết tím. Tủ hết vá hết. Vàng mua thuê làm mướn ghét. Tui chín viết bạn mướn thuê.</p>','2022-08-03 19:12:00',42,'2022-08-12',4,1,'2022-07-08','2022-08-03 19:12:00'),(16,1,16,'vẽ yêu xuồng','Đã mượn đã.\nGhế hai chết kim làm năm em biển mượn.\nThuê hàng hết máy làm tô đạp chỉ tô viết.\nĐập đá anh ờ nghỉ thế.','2022-08-03 19:12:00',74,'2022-08-12',4,1,'2022-07-08','2022-08-03 19:12:00'),(17,1,55,'đồng em xuồng','Áo bảy thuyền hóa là bạn thuê gió.\nLeo xuồng thì việc tui ngọt á nhà làm.\nGhế mười làm dép.\nLỗi xanh yêu cái.','2022-08-03 19:12:00',61,'2022-08-12',4,1,'2022-07-08','2022-08-03 19:12:00'),(18,1,60,'hết nước lầu','Quần đồng máy chỉ.\nBạn ghét khoan hết.\nPhá bốn năm leo.\nMây vàng bạn ghét hai là.','2022-08-03 19:12:00',16,'2022-08-12',1,1,'2022-07-08','2022-08-03 19:12:00'),(19,1,20,'dép lầu hương','Hết ba thì ừ núi thì được.\nHết bạn vàng vàng không quần trăng đánh không.\nQuê đá đồng nón xanh.','2022-08-03 19:12:00',39,'2022-08-12',1,1,'2022-07-08','2022-08-03 19:12:00'),(20,1,60,'phá thôi đồng','Chìm thế núi tàu ghét mướn hương bơi ghế.\nMướn giết thôi.','2022-08-03 19:12:00',84,'2022-08-12',1,1,'2022-07-08','2022-08-03 19:12:00'),(21,1,73,'một nghỉ tô','Đồng thôi lỗi.\nTủ tím chết biển chỉ thế ừ không mười.\nNăm đang tím phá thì năm ờ con mười.','2022-08-03 19:12:00',22,'2022-08-12',1,1,'2022-07-08','2022-08-03 19:12:00'),(22,1,37,'thế biển máy','Thuê kim là đập vàng dép đang.\nHết gì em.','2022-08-03 19:12:00',90,'2022-08-12',1,1,'2022-07-08','2022-08-03 19:12:00'),(23,1,13,'quê ghế thế','Ừ gió làm được nhà cái quê.\nNgọt làm tôi ngọt được gì thế anh cửa giết.\nTàu ừ gió tui mua may đồng.','2022-08-03 19:12:00',88,'2022-08-12',3,1,'2022-07-08','2022-08-03 19:12:00'),(24,1,77,'kim viết hết','Cửa tàu tủ là á việc khoảng cái.\nNón khoảng gió vẽ trời vẽ leo may thì.','2022-08-03 19:12:00',24,'2022-08-12',3,1,'2022-07-08','2022-08-03 19:12:00'),(25,1,5,'trời nước việc','Leo ghét một kim nghỉ quê.\nThôi lỗi thương năm.\nKhoan xuồng đá máy không.\nNón á tôi.','2022-08-03 19:12:00',45,'2022-08-12',3,1,'2022-07-08','2022-08-03 19:12:00'),(27,1,97,'ác ờ may núi ngủ hành sơn','Chua co description nen day la default','2022-08-03 19:12:00',42,'2022-08-12',3,1,'2022-07-08','2022-08-03 19:12:00'),(28,1,97,'hóa may núi ngủ hành sơn','<p>Chua co description nen day la default</p>','2022-08-03 19:12:00',77,'2022-08-12',3,1,'2022-07-08','2022-08-03 19:12:00'),(29,1,100,'Test','sss','2022-08-03 19:12:00',200,'2022-08-12',3,1,'2022-07-08','2022-08-03 19:12:00'),(30,1,19,'Sửa quạt 001','Quạt tạm thời xài được','2022-08-03 19:12:00',5,'2022-08-12',3,1,'2022-07-08','2022-08-03 19:12:00'),(31,1,20,'Test dữ liệu','Tạo mới công việc','2022-08-03 19:12:00',30,'2022-08-12',1,1,'2022-07-08','2022-07-15 10:18:36'),(32,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-15 10:20:30',30,'2022-08-12',1,1,'2022-07-08','2022-07-15 10:20:30'),(33,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-15 10:20:53',30,'2022-08-12',1,1,'2022-07-08','2022-07-15 10:20:53'),(34,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-15 10:45:44',30,'2022-08-12',1,1,'2022-07-08','2022-07-15 10:45:44'),(35,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:27',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 01:29:27'),(36,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:30',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 01:29:30'),(37,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:30',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 01:29:30'),(38,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:31',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 01:29:31'),(39,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:32',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 01:29:32'),(40,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:33',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 01:29:33'),(41,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:34',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 01:29:34'),(42,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:35',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 01:29:35'),(43,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:36',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 01:29:36'),(44,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:36',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 01:29:36'),(45,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 01:29:37',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 01:29:37'),(46,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 03:11:35',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 03:11:35'),(47,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 03:14:38',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 03:14:38'),(48,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 03:15:46',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 03:15:46'),(49,1,20,'Test dữ liệu','Tạo mới công việc','2022-07-16 03:20:09',30,'2022-08-12',1,1,'2022-07-08','2022-07-16 03:20:09'),(59,1,1,'Test dữ liệu','Test','2022-08-03 13:09:14',2,'2022-08-12',4,1,'2022-07-08','2022-08-03 13:09:14'),(62,1,1,'Test dữ liệu','Test','2022-08-05 00:41:33',5,'2022-08-12',4,1,'2022-07-08','2022-08-05 00:41:33'),(63,1,1,'Test dữ liệu','Test','2022-08-05 01:02:31',22,'2022-08-12',4,1,'2022-07-08','2022-08-05 01:02:31'),(67,1,1,'Test lịch sử công việc','Tạo mới công việc','2022-08-05 01:02:31',31,'2022-08-12',1,1,'2022-07-08','2022-08-06 00:10:13'),(68,1,1,'Test dữ liệu','Test','2022-08-06 00:49:51',6,'2022-08-12',4,1,'2022-07-08','2022-08-06 00:49:51'),(69,1,1,'Test dữ liệu','Test','2022-08-06 00:50:01',3,'2022-08-12',4,1,'2022-07-08','2022-08-06 00:50:01'),(70,1,1,'Test dữ liệu','Test','2022-08-06 01:35:03',6,'2022-08-12',4,1,'2022-07-08','2022-08-06 01:35:03'),(71,1,1,'Test dữ liệu','Test','2022-08-06 01:35:15',4,'2022-08-12',4,1,'2022-07-08','2022-08-06 01:35:15'),(72,1,1,'Test dữ liệu','Test','2022-08-06 01:38:54',2,'2022-08-12',4,1,'2022-07-08','2022-08-06 01:38:54'),(73,1,1,'Test dữ liệu','Test','2022-08-06 01:39:09',5,'2022-08-12',4,1,'2022-07-08','2022-08-06 01:39:09'),(74,1,11,'Test dữ liệu','Test','2022-08-06 02:16:22',8,'2022-08-12',4,1,'2022-07-08','2022-08-06 02:16:22');
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
INSERT INTO `teams` VALUES (1,'TEAM01','Đội nhạc cụ',100,363,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36','Học nhạc'),(2,'TEAM02','Đội cắm hoa',22,363,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36','Học cắm hoa tỉa lá'),(3,'TEAM03','Đội bóng đá',23,363,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36','Rèn luyện thể lực, đá bóng hết mình'),(4,'TEAM04','Đội bảo vệ',24,363,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36','Trực bảo vệ'),(5,'TEAM05','CLB thuyết trình',25,363,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36','Rèn luyện kỹ năng thuyết trình'),(6,'TEAM06','Đội 1',29,363,-1,'02-05-2022 12:43:36','02-05-2022 12:43:36','Đội sửa chữa và CNTT'),(7,'TEAM07','CLB bóng bàn',-1,363,-1,'02-05-2022 13:56:36','02-05-2022 12:43:36','Học đánh bóng bàn'),(8,'TEAM08','Đội 2',31,363,-1,'02-05-2022 15:56:54','02-05-2022 12:43:36','Đội làm nhiệm vụ điểm danh'),(9,'TEAM09','CLB cầu long',43,363,-1,'02-05-2022 16:27:07','02-05-2022 12:43:36','Học chơi cầu long');
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
  KEY `FKjal5g6ir6je09j8dma510rka2` (`team_id`),
  KEY `employee_id_idx` (`employee_id`),
  CONSTRAINT `FKjal5g6ir6je09j8dma510rka2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_employees`
--

LOCK TABLES `teams_employees` WRITE;
/*!40000 ALTER TABLE `teams_employees` DISABLE KEYS */;
INSERT INTO `teams_employees` VALUES (146,1,12),(147,1,13),(148,1,14),(149,1,15),(150,1,16),(151,1,17),(152,1,18),(153,1,19),(155,1,21),(157,1,23),(158,1,24),(159,1,25),(160,2,45),(161,3,122),(166,6,27),(167,6,28),(168,6,29),(170,6,32),(171,6,33),(172,6,34),(174,8,35),(175,8,36),(176,8,37),(177,8,38),(178,8,39),(179,8,40),(181,9,41),(182,9,42),(183,9,43),(184,9,44),(185,9,45),(186,9,46),(187,9,47),(188,9,48),(190,2,49),(191,2,50),(192,2,51),(193,2,52),(194,2,53),(195,2,54),(196,3,55),(197,3,56),(198,3,57),(199,3,58),(200,3,59),(201,3,60),(202,3,61),(203,3,62),(204,3,63),(205,3,64),(206,3,65),(207,3,66),(208,4,67),(209,4,68),(210,4,69),(211,4,70),(212,5,71),(213,5,72),(214,5,73),(215,5,74),(216,5,75),(217,5,76),(218,9,77),(219,9,78),(220,9,79),(221,9,80),(222,7,81),(223,7,82),(224,7,83),(225,7,84);
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
-- Dumping routines for database 'cmd'
--

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
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-12 12:07:22

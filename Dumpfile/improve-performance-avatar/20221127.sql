-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: webdb
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
-- Current Database: `webdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `webdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `webdb`;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Tin tức','2022-09-19 19:13:38','2022-09-19 19:13:38'),(2,'Thông báo','2022-09-19 19:13:38','2022-09-19 19:13:38'),(11,'abc','2022-09-21 09:41:38','2022-09-21 09:41:38'),(12,'abc','2022-09-21 09:59:01','2022-09-21 09:59:01');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colleges`
--

DROP TABLE IF EXISTS `colleges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colleges` (
  `college_id` int NOT NULL AUTO_INCREMENT,
  `college_name` varchar(45) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`college_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colleges`
--

LOCK TABLES `colleges` WRITE;
/*!40000 ALTER TABLE `colleges` DISABLE KEYS */;
INSERT INTO `colleges` VALUES (1,'Đại học Nông Lâm','2022-09-19 19:20:41','2022-09-19 19:20:41'),(6,'Đại học Khoa Học Tự Nhiên TPHCM','2022-09-19 19:21:31','2022-09-19 19:21:31'),(7,'Đại học Công Nghệ Thông Tin TPHCM','2022-09-19 19:21:31','2022-09-19 19:21:31'),(8,'Đại học Quốc Tế TPHCM','2022-09-19 19:21:31','2022-09-19 19:21:31'),(9,'Đại học Y Dược TPHCM','2022-09-19 19:21:31','2022-09-19 19:21:31');
/*!40000 ALTER TABLE `colleges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent_types`
--

DROP TABLE IF EXISTS `dependent_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent_types` (
  `dependent_type_id` int NOT NULL AUTO_INCREMENT,
  `dependent_type_name` varchar(45) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dependent_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent_types`
--

LOCK TABLES `dependent_types` WRITE;
/*!40000 ALTER TABLE `dependent_types` DISABLE KEYS */;
INSERT INTO `dependent_types` VALUES (1,'Cha','2022-09-19 19:23:46','2022-09-19 19:23:46'),(2,'Mẹ','2022-09-19 19:23:46','2022-09-19 19:23:46'),(3,'Anh/Chị','2022-09-19 19:23:46','2022-09-19 19:23:46'),(4,'Cô/Dì/Chú/Bác','2022-09-19 19:23:46','2022-09-19 19:23:46'),(5,'Ông/Bà','2022-09-19 19:23:46','2022-09-19 19:23:46');
/*!40000 ALTER TABLE `dependent_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependents`
--

DROP TABLE IF EXISTS `dependents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependents` (
  `dependent_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `dependent_type_id` int DEFAULT NULL,
  `dependent_name` varchar(100) DEFAULT NULL,
  `year_of_birth` datetime DEFAULT NULL,
  `current_job` varchar(100) DEFAULT NULL,
  `salary` varchar(15) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `place_of_work` varchar(100) DEFAULT NULL,
  `place_of_residence` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dependent_id`),
  KEY `student_idx` (`student_id`),
  KEY `dependent_type_idx` (`dependent_type_id`),
  CONSTRAINT `dependent_type` FOREIGN KEY (`dependent_type_id`) REFERENCES `dependent_types` (`dependent_type_id`),
  CONSTRAINT `student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependents`
--

LOCK TABLES `dependents` WRITE;
/*!40000 ALTER TABLE `dependents` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_upload`
--

DROP TABLE IF EXISTS `files_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_upload` (
  `files_upload` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `pdf_application_form` mediumtext,
  `school_record` mediumtext,
  `photo_34` mediumtext,
  `photo_id_card` mediumtext,
  `photo_house` mediumtext,
  `pdf_resume` mediumtext,
  `pdf_DGNL` mediumtext,
  `pdf_admission_notice` mediumtext,
  `context_certification` mediumtext,
  `achievement` mediumtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`files_upload`),
  KEY `studentid_idx` (`student_id`),
  CONSTRAINT `studentid` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_upload`
--

LOCK TABLES `files_upload` WRITE;
/*!40000 ALTER TABLE `files_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `files_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (17);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_types`
--

DROP TABLE IF EXISTS `image_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_types` (
  `image_type_id` int NOT NULL AUTO_INCREMENT,
  `image_type_name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_types`
--

LOCK TABLES `image_types` WRITE;
/*!40000 ALTER TABLE `image_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `image_type_id` int NOT NULL,
  `image_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `image_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `image_type_idx` (`image_type_id`),
  CONSTRAINT `image_type` FOREIGN KEY (`image_type_id`) REFERENCES `image_types` (`image_type_id`),
  CONSTRAINT `user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objects` (
  `object_id` int NOT NULL AUTO_INCREMENT,
  `object_name` varchar(45) DEFAULT NULL,
  `priority` float DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,'Hộ Nghèo',1,'2022-09-19 19:29:31','2022-09-19 19:29:31'),(2,'Cận Nghèo',2,'2022-09-19 19:29:31','2022-09-19 19:29:31'),(3,'Gia Đình Khó Khăn',3,'2022-09-19 19:29:31','2022-09-19 19:29:31'),(4,'Khuyết Tật',1,'2022-09-19 19:29:31','2022-09-19 19:29:31'),(5,'Chất Độc Màu Da Cam',1,'2022-09-19 19:29:31','2022-09-19 19:29:31'),(6,'Mồ Côi',1,'2022-09-19 19:29:44','2022-09-19 19:29:44');
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `option_id` int NOT NULL AUTO_INCREMENT,
  `option_name` varchar(45) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,'Post','2022-09-19 19:37:28','2022-09-19 19:37:28'),(2,'User','2022-09-19 19:37:28','2022-09-19 19:37:28'),(3,'Student','2022-09-19 19:37:28','2022-09-19 19:37:28'),(4,'Dependent','2022-09-19 19:38:46','2022-09-19 19:38:46'),(5,'College','2022-09-19 19:38:46','2022-09-19 19:38:46'),(6,'Category','2022-09-19 19:38:46','2022-09-19 19:51:45'),(7,'Role','2022-09-19 19:38:46','2022-09-19 19:51:45'),(8,'Tag','2022-09-19 19:51:56','2022-09-19 19:51:56');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(45) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'Create','2022-09-19 19:33:25','2022-09-19 19:33:25'),(2,'Update','2022-09-19 19:33:25','2022-09-19 19:33:25'),(3,'Delete','2022-09-19 19:33:25','2022-09-19 19:33:25');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `small_picture_id` varchar(10) DEFAULT NULL,
  `content` longtext,
  `is_published` tinyint DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `summary` mediumtext,
  PRIMARY KEY (`post_id`),
  KEY `category_id_idx` (`category_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (3,16,2,'Sửa title',NULL,'MacBook Air M2 vì để đạt được độ mỏng cần thiết nên phải dùng giải pháp tản nhiệt thụ động, thay vì có thêm quạt làm mát như trên MacBook Pro M2. Điều này khiến cho nhiệt độ hoạt động của máy lên hơn 100 độ C rất nhanh, gây ra hiện tượng throttling, giảm xung, giảm hiệu năng. Khối tản nhiệt chính của các thành phần bên trong rõ ràng là không đủ sức đáp ứng lượng nhiệt tỏa ra, và với thermal pad, chúng có nhiệm vụ liên kết, truyền nhiệt ra phần vỏ kim loại bên ngoài (mặt dưới). Nhờ tận dụng được diện tích tiếp xúc lớn với không khí, giải pháp không chính thức này phần nào hạn chế nhiệt độ lên quá cao, vừa đảm bảo hiệu năng hoạt động, vừa tăng cường tuổi thọ cho linh kiện.',1,NULL,'2022-11-17 20:01:40','2022-11-17 20:29:53','MacBook Air M2 vì để đạt được độ mỏng cần thiết nên phải dùng giải pháp tản nhiệt thụ động, thay vì có thêm quạt làm mát như trên MacBook Pro M2'),(4,16,2,'Chỉ cần vài trăm nghìn đồng để giải quyết nhiệt độ quá nóng trên MacBook Air M2',NULL,'MacBook Air M2 vì để đạt được độ mỏng cần thiết nên phải dùng giải pháp tản nhiệt thụ động, thay vì có thêm quạt làm mát như trên MacBook Pro M2. Điều này khiến cho nhiệt độ hoạt động của máy lên hơn 100 độ C rất nhanh, gây ra hiện tượng throttling, giảm xung, giảm hiệu năng. Khối tản nhiệt chính của các thành phần bên trong rõ ràng là không đủ sức đáp ứng lượng nhiệt tỏa ra, và với thermal pad, chúng có nhiệm vụ liên kết, truyền nhiệt ra phần vỏ kim loại bên ngoài (mặt dưới). Nhờ tận dụng được diện tích tiếp xúc lớn với không khí, giải pháp không chính thức này phần nào hạn chế nhiệt độ lên quá cao, vừa đảm bảo hiệu năng hoạt động, vừa tăng cường tuổi thọ cho linh kiện.',1,NULL,'2022-11-17 20:03:14','2022-11-17 20:03:14','MacBook Air M2 vì để đạt được độ mỏng cần thiết nên phải dùng giải pháp tản nhiệt thụ động, thay vì có thêm quạt làm mát như trên MacBook Pro M2'),(5,16,2,'Chỉ cần vài trăm nghìn đồng để giải quyết nhiệt độ quá nóng trên MacBook Air M2',NULL,'MacBook Air M2 vì để đạt được độ mỏng cần thiết nên phải dùng giải pháp tản nhiệt thụ động, thay vì có thêm quạt làm mát như trên MacBook Pro M2. Điều này khiến cho nhiệt độ hoạt động của máy lên hơn 100 độ C rất nhanh, gây ra hiện tượng throttling, giảm xung, giảm hiệu năng. Khối tản nhiệt chính của các thành phần bên trong rõ ràng là không đủ sức đáp ứng lượng nhiệt tỏa ra, và với thermal pad, chúng có nhiệm vụ liên kết, truyền nhiệt ra phần vỏ kim loại bên ngoài (mặt dưới). Nhờ tận dụng được diện tích tiếp xúc lớn với không khí, giải pháp không chính thức này phần nào hạn chế nhiệt độ lên quá cao, vừa đảm bảo hiệu năng hoạt động, vừa tăng cường tuổi thọ cho linh kiện.',1,NULL,'2022-11-17 20:09:58','2022-11-17 20:09:58','MacBook Air M2 vì để đạt được độ mỏng cần thiết nên phải dùng giải pháp tản nhiệt thụ động, thay vì có thêm quạt làm mát như trên MacBook Pro M2');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_tags` (
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `tag_id_idx` (`tag_id`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_details`
--

DROP TABLE IF EXISTS `role_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_details` (
  `permission_id` int NOT NULL,
  `role_id` int NOT NULL,
  `option_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`permission_id`,`role_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_details`
--

LOCK TABLES `role_details` WRITE;
/*!40000 ALTER TABLE `role_details` DISABLE KEYS */;
INSERT INTO `role_details` VALUES (1,1,1,'2022-11-17 19:11:03','2022-11-17 19:11:03'),(1,1,2,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(1,1,4,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(1,1,5,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(1,1,6,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(1,1,7,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(1,1,8,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(2,1,1,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(2,1,2,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(2,1,3,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(2,1,4,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(2,1,5,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(2,1,6,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(2,1,7,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(2,1,8,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(3,1,1,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(3,1,2,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(3,1,3,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(3,1,4,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(3,1,5,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(3,1,6,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(3,1,7,'2022-09-28 19:01:47','2022-09-28 19:01:47'),(3,1,8,'2022-09-28 19:01:47','2022-09-28 19:01:47');
/*!40000 ALTER TABLE `role_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','admin','2022-09-17 10:31:31','2022-09-19 19:57:16');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `is_draft` tinyint DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `nation` varchar(45) DEFAULT NULL,
  `religion` varchar(45) DEFAULT NULL,
  `place_of_issue` varchar(45) DEFAULT NULL,
  `place_of_origin` varchar(45) DEFAULT NULL,
  `place_of_residence` varchar(45) DEFAULT NULL,
  `citizen_id_card` varchar(45) DEFAULT NULL,
  `date_of_issude` varchar(45) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `college_id` int DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `point` float DEFAULT NULL,
  `direct_entry` float DEFAULT NULL,
  `AVG_5_terms` float DEFAULT NULL,
  `GPA_10` float DEFAULT NULL,
  `GPA_11` float DEFAULT NULL,
  `GPA_12` float DEFAULT NULL,
  `DGNL` int DEFAULT NULL,
  `family_circumstances` longtext,
  `dream` mediumtext,
  `total` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_id`),
  KEY `college_id_idx` (`college_id`),
  CONSTRAINT `college_id` FOREIGN KEY (`college_id`) REFERENCES `colleges` (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students_object`
--

DROP TABLE IF EXISTS `students_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students_object` (
  `student_id` int NOT NULL,
  `object_id` int NOT NULL,
  PRIMARY KEY (`student_id`,`object_id`),
  KEY `object_id_idx` (`object_id`),
  CONSTRAINT `object_id` FOREIGN KEY (`object_id`) REFERENCES `objects` (`object_id`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students_object`
--

LOCK TABLES `students_object` WRITE;
/*!40000 ALTER TABLE `students_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `students_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (5,'Trang chủ','2022-09-19 16:17:05','2022-09-19 16:17:05'),(6,'Giới Thiệu','2022-09-19 16:17:33','2022-09-19 16:17:33'),(7,'Thông Báo','2022-09-19 16:17:33','2022-09-19 16:17:33'),(8,'Biểu mẫu','2022-09-19 16:17:33','2022-09-19 16:17:33'),(9,'Tin Tức','2022-09-19 16:17:33','2022-09-19 16:17:33');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `citizen_id` varchar(12) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_role_idx` (`role_id`),
  CONSTRAINT `FK_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (16,'admin','','','','admin@gmail.com','$2a$10$tQWsNtVrBzL.e85wvSqxOuv5DW//Nm4p.9LWO/CkP0gH3HA67yzQW','2022-09-28 22:20:30','2022-09-28 22:23:28',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 22:52:29

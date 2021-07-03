-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `admin_user_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `communities_name_idx` (`name`),
  KEY `admin_user_id` (`admin_user_id`),
  CONSTRAINT `communities_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'eius',101),(2,'est',102),(3,'quia',103),(4,'officiis',104),(7,'ut',107),(8,'magnam',109),(10,'sint',113),(12,'optio',115),(13,'odio',116),(14,'laborum',118),(15,'in',119),(16,'quo',120),(17,'animi',122),(18,'reprehenderit',123),(19,'corrupti',125),(20,'error',127),(21,'maxime',128),(22,'et',129),(23,'veritatis',130),(24,'at',135),(25,'sapiente',136),(26,'dolor',139),(27,'qui',141),(28,'aut',145),(29,'libero',146),(30,'aut',147),(31,'iusto',148),(32,'aut',153),(33,'qui',156),(34,'voluptatem',157),(35,'vel',162),(36,'accusantium',163),(37,'consectetur',165),(38,'omnis',167),(39,'consequatur',170),(40,'et',171),(41,'minus',172),(42,'ab',175),(43,'exercitationem',177),(44,'et',179),(45,'maiores',180),(46,'eos',185),(47,'aut',186),(48,'deleniti',187),(49,'fugit',188),(50,'corporis',191),(51,'nihil',192),(52,'harum',194),(53,'vero',195),(54,'dolorem',196),(55,'quibusdam',197),(56,'praesentium',198),(57,'in',199),(58,'doloribus',101),(59,'officia',102),(60,'cum',103),(61,'praesentium',104),(64,'non',107),(65,'est',109),(67,'omnis',113),(69,'ducimus',115),(70,'iusto',116),(71,'repellendus',118),(72,'quo',119),(73,'sed',120),(74,'voluptatem',122),(75,'iste',123),(76,'nam',125),(77,'ut',127),(78,'et',128),(79,'est',129),(80,'deserunt',130),(81,'iste',135),(82,'ut',136),(83,'delectus',139),(84,'et',141),(85,'sequi',145),(86,'earum',146),(87,'quia',147),(88,'velit',148),(89,'praesentium',153),(90,'expedita',156),(91,'libero',157),(92,'quia',162),(93,'aut',163),(94,'aliquam',165),(95,'dolores',167),(96,'voluptatem',170),(97,'quia',171),(98,'quam',172),(99,'nam',175),(100,'quo',177);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend_requests` (
  `initiator_user_id` bigint unsigned NOT NULL,
  `target_user_id` bigint unsigned NOT NULL,
  `status` enum('requested','approved','declined','unfriended') DEFAULT NULL,
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`initiator_user_id`,`target_user_id`),
  KEY `target_user_id` (`target_user_id`),
  CONSTRAINT `friend_requests_ibfk_1` FOREIGN KEY (`initiator_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_ibfk_2` FOREIGN KEY (`target_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `friend_requests_chk_2` CHECK ((`initiator_user_id` <> `target_user_id`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (101,102,'requested','2009-10-01 10:43:39','2006-02-11 23:51:49'),(102,103,'declined','1991-07-07 00:47:26','1979-03-05 05:03:29'),(103,104,'unfriended','2007-11-10 09:59:15','1976-10-19 15:36:09'),(115,116,'declined','1981-04-24 08:21:35','2004-09-05 06:57:28'),(116,118,'requested','1970-03-02 01:26:37','2011-12-01 19:33:34'),(118,119,'requested','1986-07-23 07:41:17','1996-03-11 05:11:18'),(119,120,'unfriended','2015-02-23 21:08:07','1980-06-21 18:23:52'),(120,122,'declined','1985-04-11 02:38:37','1997-01-25 00:46:58'),(122,123,'approved','1978-08-15 03:33:05','2021-02-07 11:39:30'),(123,125,'approved','1994-08-18 09:43:28','2010-10-10 14:37:03'),(125,127,'unfriended','1992-10-08 23:19:48','2019-03-20 14:47:27'),(127,128,'unfriended','2000-04-02 23:34:01','1986-05-24 22:07:22'),(128,129,'requested','1985-03-10 19:56:51','2009-08-31 01:12:03'),(129,135,'approved','2010-10-17 11:39:43','2016-09-03 17:07:57'),(130,135,'declined','2005-08-19 01:52:54','1971-03-18 07:31:34'),(135,136,'declined','2017-01-27 14:06:04','2001-07-19 13:11:16'),(136,139,'declined','1979-06-08 04:31:47','1977-09-25 23:28:46'),(139,141,'declined','2009-09-04 06:52:55','1992-06-16 02:14:27'),(141,145,'unfriended','1972-10-30 15:30:40','2021-05-31 18:21:03'),(145,146,'declined','2002-11-24 12:09:59','1984-04-06 10:06:40'),(146,147,'unfriended','2013-10-12 14:20:26','2015-04-29 11:41:45'),(147,148,'requested','2005-04-03 20:42:25','2016-04-27 14:40:51'),(148,153,'declined','1985-06-23 08:35:36','1978-09-05 12:38:38'),(153,156,'requested','2020-10-01 05:02:32','2018-02-22 06:57:22'),(156,157,'approved','2000-08-09 11:34:36','1975-07-23 08:05:48'),(157,162,'approved','1973-07-04 10:53:25','1976-03-15 06:24:32'),(162,163,'approved','2005-05-26 12:36:06','2016-10-08 16:33:21'),(163,165,'unfriended','1977-09-15 02:00:18','1998-07-03 17:30:10'),(165,167,'approved','1978-07-16 21:38:12','1972-09-26 18:05:44'),(167,170,'approved','2013-10-17 17:27:18','1984-02-03 08:45:25'),(170,171,'requested','1976-03-31 14:37:06','1981-04-03 23:07:48'),(171,172,'unfriended','2002-05-11 20:06:44','1985-06-05 14:55:26'),(172,175,'requested','1982-10-12 23:41:27','1994-07-29 12:40:03'),(175,177,'requested','2011-10-25 15:42:37','2001-08-31 08:56:38'),(177,179,'approved','1983-01-11 20:41:12','2018-04-25 19:22:02'),(179,180,'declined','2005-08-20 04:57:08','1979-10-19 00:41:28'),(180,185,'requested','1989-01-27 14:50:51','2020-08-27 18:22:15'),(185,186,'requested','2000-06-02 13:20:41','2014-06-18 17:34:26'),(186,187,'requested','1997-05-15 03:52:14','1988-10-24 09:17:18'),(187,188,'requested','2011-06-02 18:19:46','2001-01-02 04:23:01'),(188,191,'approved','1984-06-23 18:02:13','1976-03-10 13:17:54'),(191,192,'approved','1997-02-23 13:59:23','2016-01-16 16:20:09'),(192,194,'declined','2012-06-18 06:15:19','2006-08-21 22:06:26'),(194,195,'unfriended','2019-12-01 12:34:47','2020-08-27 12:53:20'),(195,196,'approved','1987-04-20 10:09:13','2018-03-22 16:27:09'),(196,197,'requested','2008-02-08 12:18:57','2001-01-16 16:07:25'),(197,198,'approved','2000-03-05 16:29:19','2010-12-28 00:48:12'),(198,199,'declined','1991-03-23 12:00:33','1970-06-22 21:29:04'),(199,101,'unfriended','2008-12-14 03:08:50','1981-03-07 03:08:35');
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_messages`
--

DROP TABLE IF EXISTS `like_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_messages` (
  `user_id` bigint unsigned NOT NULL,
  `messages_id` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`messages_id`),
  KEY `like_fk_2` (`messages_id`),
  CONSTRAINT `like_fk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `like_fk_2` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_messages`
--

LOCK TABLES `like_messages` WRITE;
/*!40000 ALTER TABLE `like_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_photos`
--

DROP TABLE IF EXISTS `like_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_photos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `photos_id` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `photos_id` (`photos_id`),
  CONSTRAINT `like_photos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `like_photos_ibfk_2` FOREIGN KEY (`photos_id`) REFERENCES `photos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_photos`
--

LOCK TABLES `like_photos` WRITE;
/*!40000 ALTER TABLE `like_photos` DISABLE KEYS */;
INSERT INTO `like_photos` VALUES (1,101,2,'1976-12-31 15:13:54'),(3,103,4,'2021-06-07 16:58:20'),(4,104,10,'2021-06-07 19:12:53');
/*!40000 ALTER TABLE `like_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_profiles`
--

DROP TABLE IF EXISTS `like_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_profiles` (
  `user_id` bigint unsigned NOT NULL,
  `profile_id` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`profile_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `profile_id` (`profile_id`),
  CONSTRAINT `like_fk_10` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `like_fk_20` FOREIGN KEY (`profile_id`) REFERENCES `profiles` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_profiles`
--

LOCK TABLES `like_profiles` WRITE;
/*!40000 ALTER TABLE `like_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `media_id` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `likes_fk` (`media_id`),
  KEY `likes_fk_1` (`user_id`),
  CONSTRAINT `likes_fk` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `likes_fk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,101,1,'1976-12-31 15:13:54'),(2,102,2,'2018-04-30 07:00:21'),(3,103,3,'1984-04-06 13:36:44'),(4,104,4,'2011-02-12 11:01:06'),(7,107,7,'2000-11-05 15:55:35'),(8,109,8,'2016-08-20 16:09:32'),(10,113,10,'2010-01-26 22:24:21'),(12,115,12,'1996-02-22 07:31:06'),(13,116,13,'1997-08-31 17:38:48'),(14,118,14,'2005-07-05 21:32:42'),(15,119,15,'1973-06-24 00:35:14'),(16,120,16,'1983-03-08 11:34:31'),(17,122,17,'1989-06-30 13:17:57'),(18,123,18,'1995-09-08 11:40:35'),(19,125,19,'2014-10-09 15:06:49'),(20,127,20,'1999-12-03 01:50:38'),(21,128,21,'2004-03-23 18:46:12'),(22,129,22,'1975-01-18 21:56:57'),(23,130,23,'2001-11-25 05:54:05'),(24,135,24,'2018-12-09 02:51:01'),(25,136,25,'1989-01-02 17:16:08'),(26,139,26,'1994-01-02 00:23:17'),(27,141,27,'1981-08-20 15:46:45'),(28,145,28,'1985-04-05 01:59:09'),(29,146,29,'1979-12-14 09:57:03'),(30,147,30,'2014-02-19 15:04:27'),(31,148,31,'2009-05-19 21:10:51'),(32,153,32,'1987-03-07 19:10:24'),(33,156,33,'1981-04-16 19:01:46'),(34,157,34,'2014-11-25 13:13:53'),(35,162,35,'2016-10-22 19:09:38'),(36,163,36,'2012-02-05 07:01:12'),(37,165,37,'2012-04-26 14:30:00'),(38,167,38,'2017-08-11 14:34:00'),(39,170,39,'2012-12-31 17:48:17'),(40,171,40,'2017-10-07 12:22:09'),(41,172,41,'1970-12-11 22:40:18'),(42,175,42,'1987-03-22 20:56:15'),(43,177,43,'2002-02-20 21:16:05'),(44,179,44,'1981-01-31 14:39:56'),(45,180,45,'2019-11-22 13:21:56'),(46,185,46,'2015-04-17 12:34:02'),(47,186,47,'1974-11-16 16:02:16'),(48,187,48,'2018-06-24 01:00:44'),(49,188,49,'1979-12-26 03:31:44'),(50,191,50,'1988-11-06 14:27:22'),(51,192,51,'1995-12-25 14:59:58'),(52,194,52,'1988-11-18 21:14:08'),(53,195,53,'1983-11-03 21:23:13'),(54,196,54,'1991-11-20 23:31:31'),(55,197,55,'1993-06-29 03:37:43'),(56,198,56,'2007-11-15 08:28:32'),(57,199,57,'1988-01-17 16:22:43'),(58,101,58,'1996-06-26 07:41:11'),(59,102,59,'2007-08-17 15:37:46'),(60,103,60,'1971-09-01 22:37:02'),(61,104,61,'1994-02-14 07:18:37'),(64,107,64,'1993-08-11 06:06:18'),(65,109,65,'1991-06-22 14:18:16'),(67,113,67,'1984-06-17 01:53:31'),(69,115,69,'2018-02-02 04:21:47'),(70,116,70,'2017-05-21 15:04:17'),(71,118,71,'1998-05-22 04:12:44'),(72,119,72,'2001-02-20 01:23:43'),(73,120,73,'2004-06-23 20:11:45'),(74,122,74,'2007-05-09 18:07:11'),(75,123,75,'2016-04-07 19:50:55'),(76,125,76,'1970-09-18 02:56:48'),(77,127,77,'2009-08-18 21:40:01'),(78,128,78,'1994-11-22 09:59:29'),(79,129,79,'2013-05-31 09:50:13'),(80,130,80,'2008-01-10 15:06:33'),(81,135,81,'1992-12-20 06:48:16'),(82,136,82,'1992-08-12 16:32:25'),(83,139,83,'1991-08-28 15:03:52'),(84,141,84,'2021-02-23 19:00:10'),(85,145,85,'2004-10-29 17:07:01'),(86,146,86,'1983-06-08 14:00:26'),(87,147,87,'2014-12-09 10:55:41'),(88,148,88,'1974-11-26 05:18:31'),(89,153,89,'1993-09-01 02:13:05'),(90,156,90,'1999-01-21 02:00:50'),(91,157,91,'1978-04-12 18:22:32'),(92,162,92,'1984-12-27 00:05:14'),(93,163,93,'1993-06-29 12:13:23'),(94,165,94,'1990-11-01 03:00:25'),(95,167,95,'2019-10-18 14:43:58'),(96,170,96,'1983-02-12 05:40:11'),(97,171,97,'1995-02-12 12:40:42'),(98,172,98,'1990-10-11 07:00:53'),(99,175,99,'1977-06-05 22:23:13'),(100,177,100,'2008-07-08 21:01:46');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `body` text,
  `filename` varchar(255) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  KEY `media_type_id` (`media_type_id`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `media_ibfk_2` FOREIGN KEY (`media_type_id`) REFERENCES `media_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,101,'Ut eveniet ipsum blanditiis excepturi repudiandae vitae doloremque libero. Ea distinctio possimus et consectetur veniam. Consequatur harum quae id ut et molestias dolor ut. Accusamus placeat occaecati voluptatem est et dolor. Quia ut perspiciatis repellat magnam repudiandae dicta ut.','quia',80741184,NULL,'1992-01-22 06:19:04','2013-07-04 00:04:52'),(2,2,102,'Quia cumque officiis accusamus enim quae. Beatae amet similique itaque minima. Molestias aperiam possimus et veritatis natus placeat. Exercitationem quos id quasi et harum.','incidunt',66315476,NULL,'1989-09-11 19:40:50','1983-10-14 01:53:22'),(3,3,103,'Dolores omnis porro illum ex similique nulla. Eaque error adipisci quasi dolor dolorum unde. Neque hic ducimus ullam accusamus. Quos iste et provident aspernatur repellendus voluptate.','est',73309322,NULL,'1971-04-03 15:05:11','2008-12-18 04:06:42'),(4,4,104,'Est vel perferendis non. Qui ad enim quis et et nostrum. Quo praesentium quas sit aut reiciendis dignissimos. Aliquam hic repudiandae rerum et est sapiente laborum.','aut',5194,NULL,'1997-03-10 16:52:12','2021-02-15 12:25:33'),(7,3,107,'Sed eos consequatur est illo consectetur. Exercitationem velit est non unde et eius unde. Iusto sunt provident eos magnam qui magni ab.','possimus',553709270,NULL,'1985-06-08 23:18:21','2001-08-11 18:54:59'),(8,4,109,'Blanditiis excepturi ab dignissimos et omnis id laboriosam. Eos consequatur et quia voluptatibus aut facere nesciunt. Porro illo dolores omnis molestiae. Possimus laudantium maiores veniam labore nihil.','doloremque',96562336,NULL,'1996-12-17 21:53:28','1989-10-27 18:48:54'),(10,2,113,'Consectetur quis distinctio delectus et et. Omnis et ipsum natus nostrum deleniti hic est. Rem corporis autem quod rem. Amet accusamus est dolore eos deleniti.','molestiae',3,NULL,'1995-02-22 17:57:26','2012-10-15 06:39:35'),(12,4,115,'Placeat et fuga hic. Sapiente enim doloremque totam non quibusdam placeat. Quam officia aut fugiat libero.','facilis',710,NULL,'2014-07-22 18:11:01','2009-09-29 17:12:21'),(13,1,116,'Quia illum quasi et et et labore debitis. Aut doloremque aut ab dolor occaecati. Impedit mollitia vel perspiciatis cum eum magnam voluptatem.','et',14362,NULL,'1970-02-18 02:16:04','1982-02-15 11:37:22'),(14,2,118,'Consequatur dolor et tempore dolores. Dolorum sequi accusamus hic et et mollitia. Blanditiis rerum ratione doloribus autem nihil. Rerum et libero non impedit. Est non voluptas culpa.','et',50359099,NULL,'1987-05-17 13:54:18','1972-02-28 04:03:20'),(15,3,119,'Autem velit rem dolor deleniti et dicta. Est quidem voluptatem eius aut reprehenderit error non. Aliquam velit sequi aut non soluta ut.','alias',8228,NULL,'1974-11-12 14:40:19','1974-08-07 19:39:20'),(16,4,120,'Ea repellendus et repellat nemo amet sint repudiandae. Aut aliquam dolores ut iusto. Optio sapiente amet eius impedit cum.','ut',9311994,NULL,'2020-02-23 11:36:00','2017-02-09 01:30:30'),(17,1,122,'Fuga asperiores eveniet autem quo quibusdam asperiores. Facere velit laudantium beatae distinctio dolor et. Ut consequatur quis tenetur quis. Debitis voluptas ut voluptas aut molestiae itaque.','ut',5,NULL,'2010-01-29 03:19:22','1981-06-06 08:24:46'),(18,2,123,'Ratione eaque ea quibusdam error ex veniam dolorem. Est ut odit reprehenderit voluptate. Error earum nihil in tempore totam. Deleniti nemo nulla est quibusdam eum esse molestiae.','dolore',976,NULL,'1972-02-23 08:18:16','1979-08-24 21:23:04'),(19,3,125,'Rem veniam aut dolorem perferendis soluta soluta voluptas. Voluptas molestiae laborum eos sit. Fugiat nihil impedit praesentium eius.','non',68,NULL,'2007-12-23 14:32:59','1988-11-20 06:29:53'),(20,4,127,'Blanditiis asperiores voluptatem soluta et sunt labore sapiente. Unde suscipit in aliquid eos minus excepturi ullam. Provident ut velit non repudiandae.','velit',10167,NULL,'2010-06-20 17:08:49','1991-01-05 11:24:59'),(21,1,128,'Tempora eos et distinctio sed illum ullam rerum. Amet voluptatem quam dicta saepe consequatur. Consequatur consectetur qui placeat non dolorum harum sit.','ipsa',711,NULL,'1980-03-16 04:15:11','1972-11-23 01:37:05'),(22,2,129,'Explicabo mollitia accusantium ducimus consequatur nisi. Sunt sequi molestiae cum ea quia. Pariatur cumque qui non sunt optio eaque. Omnis autem dicta repudiandae et.','facilis',676104,NULL,'1992-10-25 07:56:16','2006-03-31 13:56:33'),(23,3,130,'Animi et ut temporibus sequi. Omnis non voluptas voluptas aliquam sequi quia non est. Quis sunt laudantium quaerat quis molestias ducimus qui officiis.','quidem',4,NULL,'1970-10-28 00:40:58','2002-12-17 20:50:11'),(24,4,135,'Tempora doloremque debitis et. Amet eius et aspernatur totam voluptas praesentium.','ut',46,NULL,'1979-01-02 14:41:16','1987-04-29 02:35:02'),(25,1,136,'Culpa dolorem in totam aliquam quia expedita aut quo. Et aut aspernatur temporibus rerum.','dolor',5381630,NULL,'1992-09-04 23:54:13','1976-11-11 00:34:11'),(26,2,139,'Velit corrupti deserunt et expedita harum deserunt rerum. Iure cumque dolores quibusdam et nobis dolorum illo et. Eum et ut minima mollitia. Asperiores tempora est veritatis saepe aliquam sapiente.','vel',12058,NULL,'2021-04-02 09:45:04','1997-02-10 16:58:30'),(27,3,141,'Natus et quas eos et. Dignissimos ut nemo ducimus aut enim ducimus qui. Nostrum fugit odit eveniet voluptas reiciendis modi rem. Culpa rerum molestias cupiditate sint nemo laudantium voluptatum.','molestiae',30,NULL,'1978-06-16 16:51:36','2005-07-21 19:30:15'),(28,4,145,'Incidunt sed nihil corrupti ut ipsa. Iusto architecto sed dolores atque in. Ea molestiae adipisci corporis rerum corrupti asperiores. Quam voluptates suscipit eos et porro eius.','dignissimos',24512700,NULL,'1998-01-12 12:09:00','2010-10-24 06:49:12'),(29,1,146,'Voluptas voluptatibus quia necessitatibus neque illo. Et error perferendis est magni doloremque. Et vel autem ut dicta.','saepe',1,NULL,'1990-06-02 15:26:48','1993-08-19 10:16:00'),(30,2,147,'Dolor eaque rerum distinctio exercitationem voluptas dolorem illo. Reprehenderit sed asperiores pariatur consequatur dolores. Iure suscipit atque modi est odit.','mollitia',6,NULL,'1981-07-08 06:56:29','1972-03-08 04:38:25'),(31,3,148,'Explicabo repudiandae ab vel mollitia eum. Aperiam quaerat fugit unde quia. Inventore est omnis enim quod. Corrupti nesciunt laborum minus consequatur.','magnam',0,NULL,'1997-03-05 11:05:29','2018-04-06 14:37:39'),(32,4,153,'Asperiores sit alias ipsam. Omnis optio nemo quo architecto.','fugiat',551048167,NULL,'1985-11-21 20:05:31','2013-01-23 13:49:22'),(33,1,156,'Optio minus quae quibusdam perspiciatis. Voluptatem qui ipsum aut culpa consectetur. Amet sit quidem repudiandae eaque et. Voluptas totam incidunt tempore et qui sit.','autem',453,NULL,'1995-09-01 17:00:50','1991-01-07 22:05:01'),(34,2,157,'Non officiis qui deserunt quod. Omnis eum temporibus dolore aut eaque rerum enim. Et aut inventore qui occaecati praesentium quo.','et',75983,NULL,'2001-10-02 06:44:21','1980-06-04 11:14:40'),(35,3,162,'Eius quidem exercitationem soluta suscipit est sit. Omnis dolorum vel autem illum. Repellendus et eum mollitia molestiae magnam consequuntur autem. Amet sequi hic inventore harum.','officiis',23,NULL,'1979-12-23 10:13:39','2003-01-15 16:10:32'),(36,4,163,'Quis omnis dignissimos consequatur adipisci. Placeat quos error excepturi facere perferendis quia quia. Voluptas quis non nobis quidem quisquam.','fugit',0,NULL,'1978-09-22 20:17:42','2018-07-21 02:52:22'),(37,1,165,'Maxime asperiores et officia ut sunt ut quasi. Eaque sapiente est ut explicabo dolores. Voluptas rerum est atque sapiente assumenda.','deserunt',7561193,NULL,'1976-02-01 00:37:28','2011-07-29 21:15:17'),(38,2,167,'Est enim dolores incidunt consequatur molestiae. Est consectetur dolores necessitatibus et. Impedit officia est eos eligendi officiis et reprehenderit enim.','voluptas',2629,NULL,'1970-12-19 15:09:11','2010-12-11 23:33:38'),(39,3,170,'Corporis cum fugit soluta. Et sed earum sint quos aperiam.','dignissimos',62393365,NULL,'1998-09-14 19:24:00','1974-11-27 08:24:40'),(40,4,171,'Quasi aut et officiis aperiam praesentium. Autem et rerum nihil.','voluptates',0,NULL,'2003-08-24 13:56:20','1991-04-27 16:23:42'),(41,1,172,'Dolorem adipisci et sed est. Autem est tempore minus fugiat dolores quia. Velit unde omnis similique placeat dolorem.','aut',525,NULL,'1977-05-11 06:23:44','2011-12-11 04:10:01'),(42,2,175,'Delectus quae officia ea labore rerum minima eum molestiae. Expedita quis non id repellat. Numquam sed et et.','quos',894,NULL,'2007-10-28 12:12:26','1974-09-30 18:59:06'),(43,3,177,'Dolorum necessitatibus vitae quis. Quae voluptas reiciendis quia id minima. Eum quo nihil velit facere.','rem',8810690,NULL,'1991-06-27 07:19:40','2001-07-22 09:21:55'),(44,4,179,'Iusto eum et distinctio quasi odio iste quas. Quisquam fuga tempore voluptatem voluptatibus culpa. Repellendus corporis assumenda consequatur soluta sint. Autem repellendus quos sed ipsum ipsum similique.','ut',73,NULL,'1971-03-09 03:54:46','2018-09-13 11:43:43'),(45,1,180,'Et earum sequi sint est. In quae non repellat et reiciendis blanditiis. Nihil sit ea rerum ut itaque ullam.','aut',788263461,NULL,'1995-10-24 13:49:45','2011-07-07 23:06:15'),(46,2,185,'Dolores dolores dolor id repudiandae inventore. Ut repudiandae optio ut nesciunt ut id nemo. Ex necessitatibus enim repellendus doloremque natus aut. Dolor ex omnis tempore voluptates.','nobis',448452,NULL,'2000-05-22 11:42:19','2013-11-23 11:21:02'),(47,3,186,'Ipsa nihil qui cumque sit adipisci. Assumenda temporibus illo porro. Ab quam enim exercitationem omnis aliquid. Deserunt earum quas voluptatem ea consequuntur.','dolor',9,NULL,'2004-02-04 12:48:07','2020-07-16 13:34:16'),(48,4,187,'Voluptate natus rem sit iusto facilis qui. Et quis placeat nihil corrupti. Accusamus sed excepturi veritatis. Et veniam ea totam.','repellat',980317752,NULL,'2003-07-21 13:56:34','2009-11-14 17:32:58'),(49,1,188,'Voluptas doloremque quibusdam voluptatem nobis incidunt doloribus excepturi. Molestias impedit fugiat praesentium quae.','dolorum',858845,NULL,'1976-02-17 05:27:03','2009-05-29 18:26:53'),(50,2,191,'Autem sunt provident maxime necessitatibus ut quidem vel. Unde nam est voluptatibus doloremque et culpa voluptatum. Molestiae placeat non sint ratione sed. Itaque quas consequatur laborum adipisci officiis.','est',373200281,NULL,'1988-01-17 14:34:14','1995-01-30 12:09:14'),(51,3,192,'Laborum aut dignissimos rerum quaerat. Consequuntur dignissimos a necessitatibus dolores veritatis quibusdam voluptates ad.','numquam',1336,NULL,'2020-06-06 04:25:21','2009-06-07 11:59:23'),(52,4,194,'Amet amet at nam. Qui iste sed doloremque et omnis recusandae consectetur commodi. Qui inventore nihil iste est optio eos ipsam. Sit doloribus magnam est quo ut iste.','non',529152,NULL,'2007-11-09 16:35:08','1999-03-26 22:12:14'),(53,1,195,'In optio dolorum provident. Repellat voluptas aut dolores. Id dicta ut tenetur illo mollitia expedita iste atque.','voluptate',381683226,NULL,'2009-01-05 22:13:14','1986-07-17 03:13:20'),(54,2,196,'Est enim placeat consequatur repellat tenetur voluptas. Est itaque aut tempora neque corrupti similique quia. Voluptatem autem aut fugiat ut deleniti autem earum. Enim blanditiis est voluptatem non eos.','est',0,NULL,'1971-01-10 17:09:28','1995-05-24 03:08:08'),(55,3,197,'Sunt et placeat porro labore ipsam facilis. Delectus nobis et aperiam veritatis repellendus est. Ut aut consectetur officia non velit non.','omnis',5,NULL,'2004-10-03 21:39:07','2016-11-01 18:57:05'),(56,4,198,'Nulla ipsum officia reiciendis aliquam. Ut id consequatur ex ea sapiente cupiditate. Qui id odit at iste recusandae qui ut.','rerum',850015612,NULL,'1974-04-08 18:14:11','1970-11-05 09:34:18'),(57,1,199,'Vel quibusdam ea facere ut. Libero exercitationem et rerum. At et incidunt similique esse saepe omnis dolorum sequi.','officiis',60040858,NULL,'1995-10-24 20:54:16','1990-04-18 07:25:58'),(58,2,101,'Nisi aut necessitatibus est fuga. Aliquid similique commodi aut placeat cupiditate. Rem voluptatem deserunt veritatis libero deserunt corporis asperiores. Sequi non cupiditate omnis pariatur consectetur.','nam',26,NULL,'1975-07-19 02:16:17','1981-07-02 08:39:45'),(59,3,102,'Quos sed deserunt a et minima non aspernatur. Nesciunt reiciendis asperiores qui quis voluptas unde dolor. Ipsum minus qui temporibus et libero.','sit',0,NULL,'1985-06-11 12:50:13','1973-05-23 05:34:19'),(60,4,103,'Quia et odit qui veniam pariatur. Aliquid modi illum eius dolorem. Iste rerum qui repellat et sed reiciendis totam qui. Perferendis eum odit commodi beatae.','est',289209,NULL,'2017-04-23 16:44:07','2010-05-25 07:44:14'),(61,1,104,'Nobis harum odio dolorem. Quis cum sit quidem in. Quibusdam accusantium at possimus enim pariatur in explicabo.','hic',637278375,NULL,'1991-02-14 11:34:39','1976-10-16 17:45:20'),(64,4,107,'Neque inventore sint ea aut consequatur quis reiciendis. Sapiente eaque magnam similique qui voluptatum debitis natus. Omnis molestias quaerat voluptas. Veritatis aut blanditiis minima impedit eveniet.','soluta',968,NULL,'1992-02-01 11:17:47','1995-11-22 22:13:43'),(65,1,109,'Perferendis sunt iusto qui ut. Voluptatibus sit ut quisquam et. In quam dolorem eveniet. Rem consectetur voluptatibus reiciendis eum unde.','magni',4889517,NULL,'1971-01-01 05:56:01','1970-12-29 18:16:26'),(67,3,113,'Veniam vel qui est et et illo tempora. Deserunt alias et modi expedita quia expedita voluptatum. Velit pariatur numquam vel maiores animi enim et.','sunt',565,NULL,'2017-04-15 08:14:19','2015-10-27 09:01:24'),(69,1,115,'Aspernatur eum est quod architecto ut voluptatem provident. Est voluptas dolor vel iure est veniam minus. Nesciunt accusamus unde sit occaecati.','ut',13236,NULL,'1971-11-15 21:10:50','1981-07-02 16:29:42'),(70,2,116,'Sint quos enim ratione dolorem asperiores dignissimos et tenetur. Nesciunt laudantium nesciunt eum a qui aut ut velit.','aut',3858,NULL,'2014-08-14 10:00:10','2012-01-06 23:04:24'),(71,3,118,'Laboriosam omnis quia unde voluptatibus nam accusantium iure nulla. Recusandae voluptatum quia quis consequatur. Maxime sed autem iusto consequatur.','voluptates',41,NULL,'1987-10-25 20:11:41','2007-08-19 11:23:30'),(72,4,119,'Aspernatur perferendis accusantium aut necessitatibus dolores. Rerum placeat at officiis esse voluptatibus et fuga.','nemo',545,NULL,'1972-09-28 14:23:04','1979-02-11 14:54:36'),(73,1,120,'Et repudiandae dolore quas totam error quia rerum. Voluptatibus tenetur dolorum voluptas et ut consequatur reiciendis. Labore eum explicabo sequi neque. Voluptatum sit eveniet ratione tempore quidem deserunt maxime.','corporis',0,NULL,'1982-11-22 21:44:12','1987-09-12 22:38:27'),(74,2,122,'Cupiditate qui reprehenderit tempore odit praesentium repellat culpa. Dolores architecto est porro et repellendus incidunt. Sit at quia aperiam quod maxime harum omnis fuga. Illum officiis similique est iusto quia.','et',306451,NULL,'1982-11-17 04:20:43','2003-10-04 14:32:28'),(75,3,123,'Et ut reprehenderit voluptatem laborum nam. Vel reiciendis non impedit est placeat fuga. Voluptatem est at qui voluptatem veniam repellat.','consequatur',2051,NULL,'1991-05-20 11:39:18','1997-09-08 14:44:56'),(76,4,125,'Fugit eum dolorem minima qui voluptatem fuga. Maiores libero est culpa et assumenda repellendus. Doloremque accusamus est corrupti asperiores velit voluptate in.','fugit',67,NULL,'1983-06-02 11:42:46','2006-01-02 17:13:08'),(77,1,127,'Sunt excepturi dolores ea dolorum esse ea. Et illum earum incidunt vel occaecati libero cum. Ratione dolores porro eum nobis aspernatur. Voluptatem et aspernatur ipsa non veniam maxime.','explicabo',20222,NULL,'2005-02-13 17:45:56','2008-07-26 14:32:31'),(78,2,128,'Dolorum ipsum quas dolore enim et esse. Aspernatur doloribus hic tempore quis enim. Asperiores neque qui quaerat eaque non. Similique repudiandae ut aperiam fuga nam vero. Deserunt dignissimos nobis iste natus aut cum ut.','recusandae',80457,NULL,'2001-03-20 10:47:41','2012-03-04 06:01:41'),(79,3,129,'Non sint nesciunt maxime sequi. Quos veniam voluptatem magnam rerum aspernatur officia tempore. In illo quo quam qui necessitatibus minima. Esse dolorem qui dolor commodi ut voluptatum modi delectus.','in',5449654,NULL,'2003-01-25 11:57:14','1973-11-18 00:18:16'),(80,4,130,'Harum dicta vel expedita ipsum ad iusto. Nulla nisi vel accusantium quia enim. Voluptas ut soluta et enim rerum et aut. Excepturi ea ex accusantium eos ut impedit similique cumque.','voluptates',52864,NULL,'2001-05-29 02:08:09','2015-12-19 15:35:10'),(81,1,135,'Itaque facilis voluptate praesentium reiciendis dignissimos dolorem aut. Omnis et modi totam iusto ducimus. Velit aliquid illum laborum omnis cumque iusto. Id suscipit aliquam voluptas repudiandae provident repellat laudantium.','veritatis',706,NULL,'2003-12-10 12:54:08','1996-08-07 02:38:58'),(82,2,136,'Sit dolorem et est qui earum provident. Aspernatur atque tempora et qui. Quos nostrum sed ut. Voluptas maxime quod placeat. Cupiditate et iste qui aut.','dolore',41748243,NULL,'2003-02-15 13:29:11','2020-02-15 05:36:28'),(83,3,139,'Velit cumque porro maxime. Ut molestiae provident ipsam iusto repellat quidem autem. Dolorem qui voluptas cum et sed. Ea rerum voluptas possimus dolorem est.','ut',9043284,NULL,'2020-06-19 14:57:57','1972-06-23 13:36:21'),(84,4,141,'Repudiandae et amet velit odit dolor ex. Possimus et voluptas error id sed non ut voluptas. Doloribus fugiat quia ad.','praesentium',87617964,NULL,'2000-02-25 21:03:15','2009-07-21 11:54:23'),(85,1,145,'Natus provident enim voluptatibus et unde et. Debitis laborum aliquam corporis placeat sed beatae dolorem. Quis cupiditate perferendis neque fugit et. Et voluptates debitis est rerum explicabo nobis.','asperiores',496,NULL,'2008-07-22 18:57:47','1988-03-31 08:29:46'),(86,2,146,'Veniam fugiat sed sit et. Et quaerat odio voluptate enim nesciunt enim iure earum. Quia velit reprehenderit nam.','veniam',728818,NULL,'2020-10-24 23:27:24','1985-09-15 18:11:24'),(87,3,147,'Quia non animi aliquam rerum. Molestias sint sint mollitia quae. Aliquid nesciunt dolorum et consequatur est a. Facere aut saepe fugit dolorem eligendi aspernatur numquam. Hic dicta earum temporibus illo explicabo.','maxime',60156999,NULL,'2005-05-06 02:06:35','1975-08-02 23:05:24'),(88,4,148,'Quisquam est eum non quidem quos ea. Quia sunt ut quia non quaerat. Quia a perspiciatis vel quae quia velit.','dolor',0,NULL,'2016-09-08 07:05:44','1970-07-18 00:14:44'),(89,1,153,'Qui vel dolorem id autem veritatis. Recusandae reprehenderit est ratione et in recusandae facere inventore.','voluptatem',57419833,NULL,'2013-07-19 08:50:33','1995-03-03 06:27:36'),(90,2,156,'Vitae deleniti fugit modi recusandae modi quos rerum cupiditate. Aut dolore ut repellendus aperiam eum tempore cumque. Ex ex nihil incidunt asperiores.','doloremque',515655587,NULL,'2017-11-28 16:50:44','1997-04-27 10:08:13'),(91,3,157,'Eaque et sequi architecto illum et cumque nobis. Ut aut doloribus sed vel explicabo. Nesciunt possimus provident rem iste.','perferendis',40,NULL,'2002-02-17 21:00:38','1986-06-12 17:51:01'),(92,4,162,'Atque sequi possimus atque reprehenderit corporis. Voluptatem qui nesciunt eos rerum debitis quia veniam. Fuga ratione voluptatem necessitatibus unde corporis dolorum. Blanditiis praesentium occaecati et et asperiores et.','consequatur',942,NULL,'2016-12-24 19:24:34','1996-04-15 12:30:49'),(93,1,163,'Cum esse nemo minus vitae perspiciatis est nostrum. Doloremque laudantium ratione aut nesciunt. Facere totam quia aut quia.','nostrum',509816349,NULL,'1990-11-10 03:48:44','1981-02-01 19:10:30'),(94,2,165,'Provident magnam veritatis facilis nesciunt dolorum et. Et voluptatibus voluptatibus quia animi quos inventore. Nihil natus ratione maiores.','quis',69,NULL,'1973-12-26 22:17:28','1985-06-22 07:35:45'),(95,3,167,'Aperiam atque consequatur nisi unde minus incidunt velit. Ut voluptatibus autem ea deleniti. In ipsum quo inventore soluta.','voluptatum',27,NULL,'2020-01-14 21:25:30','1978-01-29 09:15:09'),(96,4,170,'Et neque in nihil velit ducimus error. Impedit maxime accusamus totam autem harum. Veritatis culpa non enim nam voluptatem rem.','totam',9741,NULL,'2016-11-27 14:33:19','1988-10-25 08:13:18'),(97,1,171,'Enim aut sequi reprehenderit quidem voluptatem. Alias doloribus rerum ullam id. Molestias cupiditate velit porro expedita impedit. Et qui reprehenderit laborum ut nam qui quod. Occaecati voluptas vel velit occaecati doloremque.','est',68123713,NULL,'1990-03-12 06:31:02','2004-12-04 08:17:42'),(98,2,172,'Labore est provident dolor. Repellat veritatis nisi ratione voluptas illo est magnam quia. Numquam qui nulla earum debitis id possimus qui.','molestiae',34,NULL,'2010-04-25 16:33:28','1971-09-22 22:52:07'),(99,3,175,'Reprehenderit eum dolorem optio corrupti ad. Commodi temporibus iste velit quod est.','assumenda',0,NULL,'1994-08-13 22:12:25','1998-04-25 16:04:28'),(100,4,177,'Corrupti voluptatum omnis omnis et qui est in. Occaecati ullam delectus voluptates natus eum corrupti numquam. Fugiat et deserunt ut. Doloremque aut vel earum ad.','inventore',909,NULL,'1991-02-18 21:35:45','1997-08-12 21:11:29');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'aut','1986-06-06 09:21:47','1995-07-15 00:41:56'),(2,'rerum','2000-11-01 14:29:36','1996-08-24 11:23:03'),(3,'qui','2018-07-02 18:20:08','2008-05-17 18:57:50'),(4,'corporis','2004-09-18 17:11:25','2007-05-30 14:40:54');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `body` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,101,101,'Est rerum eius doloribus ut itaque ut dolor. Distinctio illo reprehenderit hic architecto. Rerum eligendi est non id facere officia ratione quidem. Modi sed et recusandae voluptatibus perferendis et atque dolores.','2007-11-09 00:12:50'),(2,102,102,'Consequuntur dolore sed ea deserunt eligendi. Consequuntur minus vel quibusdam pariatur aut ut deleniti. Esse omnis distinctio modi alias dolor.','1987-10-28 22:55:46'),(3,103,103,'Suscipit ut assumenda id vel fugit sunt rem ipsum. Et exercitationem ex saepe et quibusdam dolorem. Molestiae tenetur quam quis ut ipsa ratione.','2000-06-20 08:44:23'),(4,104,104,'Vitae quibusdam quos dolore veniam in odit odit. Ut similique occaecati voluptas numquam. Delectus quis corporis modi quisquam aspernatur aliquam vero.','1983-07-13 03:55:43'),(7,107,107,'Aut illo iste officiis ut occaecati quidem. Dolorem sint doloremque officia esse consequatur. Quisquam consequuntur amet necessitatibus rem. Culpa pariatur repudiandae enim officia officiis accusamus aut et.','1970-06-01 02:38:23'),(8,109,109,'Adipisci non dolorem quod consequatur. Temporibus rerum reiciendis expedita autem hic placeat facilis. Enim quia fugit temporibus eum vel.','2016-04-11 23:19:47'),(10,113,113,'Sed aliquam officiis deserunt consequatur velit. Esse accusamus neque velit voluptas est non. Laudantium officiis tempore voluptatem porro iste saepe eius.','1998-09-28 09:51:12'),(12,115,115,'Est facilis et inventore est est. Sapiente laborum saepe aut atque eum. Alias animi perspiciatis architecto fuga odio. Qui odio ratione omnis voluptas in dolorum quos.','1980-05-26 13:53:16'),(13,116,116,'Et dolores dolorem ipsum occaecati aut et fugit. Voluptatum nesciunt molestias fugiat quo in expedita accusantium blanditiis. Harum ut occaecati velit odit.','1971-12-12 18:39:36'),(14,118,118,'Sunt aperiam distinctio qui similique voluptatem suscipit. Sed qui officiis eos nostrum laudantium sit rerum. Sed qui minima in ea voluptas id. Voluptates sunt placeat ipsam facilis.','1983-05-27 22:04:09'),(15,119,119,'Recusandae illum est repellat debitis ut. Voluptate omnis aut dolor laudantium labore dolorem aut. Ipsa alias nobis quia eveniet asperiores molestias.','1998-12-20 01:32:56'),(16,120,120,'Beatae doloremque sunt velit sit unde commodi nobis debitis. Vel ut saepe ad voluptatem itaque. Nobis qui quasi et voluptas eos ut qui sed. Quo error aliquid doloremque suscipit dignissimos error.','2008-12-06 20:48:08'),(17,122,122,'Nulla eveniet qui nemo amet sunt voluptatum omnis architecto. Aut sint assumenda architecto omnis nulla est. Et ea enim libero fugit est porro est incidunt.','2006-04-06 04:20:01'),(18,123,123,'Harum optio omnis id quisquam. Ut ut a aut possimus nemo molestiae alias. Mollitia rerum in eum in possimus. Dolores eius minima sint vel natus et saepe cumque.','2009-03-13 02:03:54'),(19,125,125,'Qui qui quas neque animi. Consequatur deleniti ut natus qui laboriosam velit. Quia eius est quidem iusto eius odio illum. Ab ut aut totam eveniet nisi. Iusto sed animi et odit ut necessitatibus.','1976-12-02 09:11:19'),(20,127,127,'Nisi ea laboriosam ea consequatur quis praesentium. Ducimus sint ut temporibus quia ipsam. Veritatis commodi dolore et repellat ex asperiores sit.','1998-07-25 13:47:02'),(21,128,128,'Facere culpa nobis modi ut ea aut ex sed. Dolor voluptatibus illo aut iure dolore nesciunt. Sunt ratione atque harum tenetur voluptatum numquam sit. Sit in ut explicabo in ratione.','1992-10-02 18:53:55'),(22,129,129,'Rem voluptate facilis quae aut velit. Non aut doloribus ut ipsam. Dolores omnis aut ea nemo.','2002-06-08 07:48:07'),(23,130,130,'Nesciunt iure nostrum est ipsam voluptate. Perferendis sint voluptatem laboriosam voluptas alias eaque rerum aut. Dolor error odit excepturi. Sint aliquid aut quia id dolorum sed illum.','1993-03-26 11:35:52'),(24,135,135,'Similique nemo vel nostrum sint. Aut aliquam ut sit. Consectetur occaecati velit ea id quod maxime ut.','1994-05-20 04:05:06'),(25,136,136,'Ex rerum voluptas accusantium et repellat suscipit vitae. Aspernatur voluptatem laudantium temporibus id nemo et. Dolorem adipisci illum repellendus. Repudiandae eveniet vitae a voluptatem aut culpa. Tenetur sit ducimus inventore sunt aut optio aut.','2003-09-02 14:59:45'),(26,139,139,'Pariatur ducimus temporibus aliquam placeat quis. Voluptate minus dignissimos et saepe sapiente accusantium. Occaecati exercitationem tenetur autem ut exercitationem neque voluptas ex. Necessitatibus qui modi perspiciatis perferendis.','2000-01-04 01:57:45'),(27,141,141,'Voluptatibus delectus ut rerum. Odit aut reprehenderit voluptas veniam molestias et quo laudantium. Deserunt minima recusandae excepturi in libero odit. Suscipit aut temporibus dicta qui.','1997-08-25 08:59:10'),(28,145,145,'Aperiam quia eum sit quae. Velit sint labore omnis quis blanditiis nam iure. Voluptas porro id autem quisquam eos temporibus libero.','2007-08-28 23:56:47'),(29,146,146,'Totam omnis ab inventore facilis. Modi placeat ut ad non. Eum est non eveniet sequi.','1985-05-05 20:01:02'),(30,147,147,'In eaque quia aliquam aperiam sit id nostrum. Voluptatem architecto id quia ut eum rerum. Quo ipsum ad quam sunt quos saepe ut.','2007-01-02 23:20:36'),(31,148,148,'Provident perspiciatis aut officiis. Eos ipsum inventore et quas sit ipsam. Assumenda possimus optio nisi. Doloribus consequatur aspernatur odit nihil ut non.','1981-03-02 07:58:30'),(32,153,153,'Qui quo voluptatem porro officiis. Aut ut ut dolore velit possimus.','2013-04-18 02:41:58'),(33,156,156,'Nam suscipit possimus quas incidunt dolores iusto fugit. Tempore est distinctio corporis rem quia. Harum qui voluptatum molestiae doloribus. Rerum ut voluptas quia tenetur.','2000-09-27 04:16:36'),(34,157,157,'Alias reiciendis atque quisquam ipsa autem ea eveniet. Suscipit in molestiae sunt beatae. Reiciendis consequatur veniam distinctio architecto. Sunt incidunt rerum et sunt. Similique inventore sed voluptatum illo suscipit quia quaerat.','2006-07-30 20:36:08'),(35,162,162,'Eveniet nesciunt repudiandae at veritatis et. Tenetur et cum reprehenderit non enim. Et voluptatibus aliquam id eius repudiandae ut ab non.','1989-06-18 01:57:29'),(36,163,163,'Et sed vero nam labore repellendus. Qui omnis veritatis vel qui et. Modi sapiente quo quasi non dignissimos vel ullam.','1980-07-30 19:55:53'),(37,165,165,'Ab blanditiis ut fugit molestias dolores. Et et ut provident incidunt in voluptatibus corrupti consequuntur. Repellat voluptatem impedit consequuntur ut dolore qui. Dolorem blanditiis sapiente nobis ea occaecati ullam. Cumque aspernatur voluptates eveniet cumque esse.','1989-12-05 04:24:30'),(38,167,167,'Quos quo dolores porro omnis quam. Consectetur aperiam omnis voluptatem voluptatem eos architecto. Sint veniam esse voluptatem et sapiente nobis.','2019-02-21 00:12:23'),(39,170,170,'Saepe asperiores dolorem possimus est deserunt minima rerum accusantium. A ea velit adipisci deserunt quia. Eum dicta accusamus distinctio ut accusamus earum saepe. Velit itaque eius neque suscipit dolor.','1978-10-24 00:25:59'),(40,171,171,'Ea et et voluptatem facilis velit perferendis voluptatem. Et mollitia beatae molestiae dolores delectus ab. Neque nulla repellendus nihil sed corporis dolor.','1997-07-03 01:45:27'),(41,172,172,'Natus dolor quidem sit quia libero quam. Molestiae possimus fugit quaerat beatae. Similique nulla voluptatibus eligendi harum cupiditate.','1970-11-02 12:30:09'),(42,175,175,'Alias qui ullam perspiciatis ipsum nobis omnis eum. Autem non porro soluta nisi non et aliquam. Et deserunt sapiente est quos omnis iusto recusandae.','1975-08-11 13:38:07'),(43,177,177,'Quod ut blanditiis sed. Ut eligendi eius quod et rem error qui neque. Quo culpa fugit et omnis a magnam qui. Ut aspernatur libero nihil facere. Sit consectetur quis iste sapiente dicta odio.','1970-05-28 02:43:20'),(44,179,179,'Aperiam veritatis non reprehenderit quia. Placeat in culpa magnam error consequuntur ut. Beatae aspernatur nam necessitatibus ipsa. Error blanditiis itaque molestiae assumenda repudiandae atque repellat.','1991-10-07 09:26:24'),(45,180,180,'Nemo rerum illo sapiente accusantium officia error consequuntur. Unde accusantium ab voluptatem dolore. Et dolorem ab impedit nostrum. Quos deserunt laboriosam perferendis voluptatem.','1970-05-09 19:49:38'),(46,185,185,'Blanditiis ea possimus iusto facilis provident vel debitis. Minima labore sequi earum corrupti qui sed sunt fugiat. Distinctio odio eum aut aut qui voluptatem. Voluptatum a et dolore iste eos.','2000-01-21 06:43:03'),(47,186,186,'Rerum unde commodi omnis. Neque consequatur dolor nulla quos dicta et eius. Sunt qui veniam odio magni ut aliquam officiis et. Totam molestias ut est et a non.','1973-05-04 16:17:10'),(48,187,187,'Facilis adipisci quaerat qui soluta possimus. Voluptatem aliquam est earum.','1988-02-01 03:23:40'),(49,188,188,'Voluptate suscipit ex harum eius corrupti nihil quasi. Vel ut repellat non officia quaerat sit. Culpa dolores cumque neque eius dolore maxime accusantium architecto. Corporis aliquam libero et. Qui voluptate atque quia consequuntur voluptas aliquam maxime.','1989-09-04 22:11:08'),(50,191,191,'Eum exercitationem ipsum velit et. Saepe veritatis reiciendis ut ut deleniti pariatur.','1991-08-28 07:39:26'),(51,192,192,'Ut possimus repudiandae mollitia sed illum voluptatem voluptates. Nihil consequuntur temporibus sequi ratione quis totam. Eaque quasi a nihil illum. Repellendus enim facilis sed aut repellat autem.','1994-10-06 19:24:33'),(52,194,194,'Aut debitis ea incidunt. Non nisi voluptatem libero aut quod doloremque debitis qui. Neque sapiente aut omnis autem soluta dolorem. Quos molestias hic eveniet qui iste. Reiciendis ut qui aspernatur est nihil molestiae non et.','1999-02-21 01:53:02'),(53,195,195,'Corporis voluptas veniam est placeat voluptas. Molestiae vel omnis accusantium ut corrupti quidem.','1988-11-19 10:46:03'),(54,196,196,'Quod saepe et nulla amet repellendus. Est quisquam incidunt rem eveniet qui. Quae voluptatem modi aspernatur odit occaecati eius cum.','1981-12-24 11:36:10'),(55,197,197,'Sint ut ut exercitationem ratione ut et. Vel debitis ut rem officiis. Sed laudantium quos sed ut quia. Autem magnam distinctio qui eveniet sit.','1979-03-25 10:50:24'),(56,198,198,'Ab mollitia incidunt fugiat inventore neque dolor sapiente. Expedita ex qui adipisci excepturi sit atque. Et nesciunt dolor sit harum.','2014-03-26 08:01:17'),(57,199,199,'Id natus eum ratione qui qui reiciendis corporis. Et non sed dolores eum iusto. Dolor est consequuntur voluptatem et.','2004-05-01 16:21:57'),(58,101,101,'Et et doloremque quis et. Velit dolorum qui ab reiciendis voluptate culpa. Consequatur ut ad rem sed iste quam dolorem.','1983-11-26 11:39:00'),(59,102,102,'Libero quis beatae iusto sapiente. Quasi repellendus dolorum atque. Cupiditate et nostrum minima perspiciatis.','2007-04-07 21:09:00'),(60,103,103,'Quo aut distinctio saepe necessitatibus neque sequi quae. Eos nihil sed maxime reprehenderit eum rerum ipsa quo. Magnam minima at error nihil illum et qui natus.','1999-07-17 22:15:01'),(61,104,104,'Omnis molestiae nihil saepe quia possimus fuga. Ipsa assumenda similique dolor nemo. Provident consequuntur nostrum et eum inventore nam omnis. Atque deserunt consequatur quia expedita nihil.','1990-02-03 20:58:12'),(64,107,107,'Est quisquam quo consectetur assumenda. Sed autem praesentium et commodi consequatur quis. Laudantium dicta magnam non cupiditate illum molestias nostrum.','2013-10-08 12:12:01'),(65,109,109,'Autem necessitatibus iusto quos officiis in eaque. Modi totam maxime est odio blanditiis ut error aut. Consequuntur corrupti consequatur magni placeat minus autem soluta.','1998-01-20 15:12:27'),(67,113,113,'Nihil natus reiciendis quis quia. Quae occaecati qui animi cupiditate. Ut quia autem maiores dolorem laudantium dicta aut. Exercitationem maxime debitis enim sit magnam.','1980-10-01 06:18:39'),(69,115,115,'Reprehenderit nesciunt aut incidunt ipsam aut aut placeat et. Modi sit quia nihil voluptate aut. Praesentium totam non suscipit et.','2007-07-01 16:09:00'),(70,116,116,'Ducimus deleniti alias exercitationem tempora totam totam quaerat. Ut odio cum nesciunt sint perspiciatis earum expedita minima. Voluptatem voluptatem vel voluptatibus tempora numquam repellat doloremque. Ea facilis tempore fuga velit.','2001-12-09 06:13:18'),(71,118,118,'Officia itaque error qui. Est dolor quis est. Laborum voluptates harum eos corrupti. Ab laudantium sed et sit beatae qui odio molestiae.','1991-07-12 00:24:41'),(72,119,119,'Minus veniam cumque vel deserunt quia perferendis error. Et est magnam quam unde est. Voluptatem dicta et alias in velit libero. Dolorem fugit qui autem illum libero temporibus ullam corrupti.','2019-07-18 19:54:06'),(73,120,120,'Animi laborum totam est alias eius. Cumque ullam minima mollitia dolor nemo veritatis et consectetur. Sit fuga quisquam tempora.','1989-12-26 15:35:11'),(74,122,122,'Sit ad unde rerum pariatur exercitationem aliquam. Ea enim at est quibusdam et quia voluptas. Nihil placeat quibusdam non est.','2005-07-10 11:47:31'),(75,123,123,'Odit magni enim et ab. Sequi corporis qui est aut. Eum quia animi ullam commodi commodi ullam est sapiente.','2005-02-23 15:59:21'),(76,125,125,'Eum dicta facere dolorum nostrum eos inventore commodi. Eaque minima et commodi quae omnis totam. Hic adipisci tempore esse ut aut. Impedit illo consectetur consequuntur sed.','1976-06-02 09:09:47'),(77,127,127,'Tenetur sed qui fugiat aut. Facere minus inventore deleniti ipsam. Sed quos aut totam sint. Commodi incidunt sed velit aut accusantium eveniet.','1981-09-12 05:04:30'),(78,128,128,'Mollitia id consectetur animi nemo ad. Sapiente ab enim nobis in ratione. Repudiandae necessitatibus modi qui numquam id. Nulla ad eligendi facere.','1997-10-20 14:13:30'),(79,129,129,'Et voluptatem quia quisquam magnam quidem. Quisquam eum voluptates omnis non magni debitis eaque. Possimus voluptatem at illum asperiores repudiandae aut.','2002-08-17 17:29:12'),(80,130,130,'Soluta culpa voluptatum voluptatibus assumenda ab. Odit asperiores consectetur enim facilis laboriosam. Quibusdam ab consequatur molestiae aut. Error deserunt est iste laboriosam laudantium.','1978-10-30 18:11:35'),(81,135,135,'Esse qui id qui minus explicabo laborum. Quibusdam ut quisquam ut. Quo est necessitatibus animi modi inventore asperiores.','1975-06-20 18:15:14'),(82,136,136,'Numquam quis dolorum praesentium voluptatum. Consequatur eaque quos ut doloribus officiis tempora. Dolores nihil voluptas asperiores dicta exercitationem voluptatibus. In et autem velit rerum earum distinctio sed hic.','1998-01-28 11:00:22'),(83,139,139,'Ut debitis aspernatur vel et repellat vel ut. Minus omnis et laborum repudiandae harum expedita qui voluptatem. Ut recusandae in qui exercitationem.','1976-02-26 11:01:31'),(84,141,141,'Vel rem et nam est et cumque cupiditate. Pariatur quibusdam sit expedita ex nihil provident. Quia id molestias eum possimus laborum sed quia.','2014-03-26 13:08:58'),(85,145,145,'Ut quae et consequatur voluptatem velit sint. Qui ad voluptatum et sit facilis. Nemo esse recusandae nihil eos quibusdam delectus.','1996-09-15 11:09:09'),(86,146,146,'Velit a aspernatur magni ea quam minima maiores. Minima temporibus molestiae inventore iste perferendis. Omnis molestias voluptatibus perspiciatis. Aut vitae est facilis est nemo. Molestiae id ex eos illo voluptas voluptas et.','2003-07-22 04:25:53'),(87,147,147,'Animi reiciendis magni eum deserunt. Error omnis laborum et aut necessitatibus dolor. Aut culpa corrupti quia impedit. Atque quasi nihil excepturi aperiam. Occaecati ut assumenda dolores non voluptate saepe ad.','2018-03-27 07:22:06'),(88,148,148,'Error in voluptate doloribus voluptatem beatae. Impedit rerum dolores eaque laudantium corporis perspiciatis vero. Quo reiciendis voluptatibus voluptas nostrum non praesentium esse.','1989-06-20 04:57:08'),(89,153,153,'Ut facilis est consequatur maiores beatae quaerat soluta. Est adipisci voluptas quia commodi nihil sit sunt. Modi blanditiis culpa nemo.','1972-03-13 10:38:13'),(90,156,156,'Velit et neque alias deleniti ad perspiciatis distinctio. Et possimus commodi rerum et voluptate vero autem ratione. Eligendi doloribus incidunt magni placeat quia doloribus ipsa voluptatem. Est consequuntur nisi fugit omnis.','2012-11-26 07:00:14'),(91,157,157,'Cumque tempora illum est voluptatibus eveniet. Autem amet autem ad. Ut itaque totam qui aliquam.','2004-12-16 20:52:12'),(92,162,162,'Quaerat a nesciunt et repellat. Deleniti inventore culpa voluptas sit porro. Aut iure est voluptatum neque qui. Velit dolor modi vel aut ipsa beatae.','1980-03-18 22:37:25'),(93,163,163,'Totam sed velit tempore et at quam modi quisquam. Dolores error dolorum consequatur quae enim delectus sequi similique. Praesentium eos consequatur eos voluptatem dolore. Et voluptate id debitis consequuntur. Quia voluptate illum ut voluptas cum.','1972-05-01 00:15:05'),(94,165,165,'Et ducimus praesentium eligendi beatae. Sunt eligendi sed distinctio. Cum iste delectus impedit repudiandae. Ut autem voluptas itaque vel asperiores rerum quia.','2006-01-11 18:40:14'),(95,167,167,'Ut adipisci non aut animi. Necessitatibus eos nemo et aut numquam nihil quod. Quia animi et distinctio culpa quia officiis provident. Odit excepturi molestiae praesentium quam accusamus doloremque.','2004-06-04 16:54:08'),(96,170,170,'Libero quis error repellat eligendi nulla enim voluptatem. Omnis et et amet beatae. Porro sed molestiae saepe cupiditate.','1976-02-10 11:38:24'),(97,171,171,'Ex recusandae suscipit possimus est sequi. Sequi in doloribus temporibus incidunt. Possimus deleniti iure error et voluptas aliquam. Error non ut iure corrupti dignissimos.','1972-04-24 20:35:19'),(98,172,172,'Id sequi qui labore nostrum molestiae. Dolor officia accusamus iste fuga alias ut. Voluptas magnam non vel deleniti voluptas exercitationem odit illo. Explicabo commodi animi veniam architecto aspernatur.','1977-10-21 21:58:45'),(99,175,175,'Porro pariatur unde minus nulla accusamus culpa et. Molestiae id magnam doloribus voluptatem porro. Magnam error voluptates occaecati dicta consequatur tenetur. Corporis rerum nihil qui enim.','2009-06-06 15:33:36'),(100,177,177,'Aliquid est qui non animi accusantium eveniet eius. Velit labore totam harum ipsam. Iure aut voluptatem eos minus eos iusto. Soluta voluptatem voluptatem sint unde.','1979-10-28 05:46:46');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_albums` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `photo_albums_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'quo',101),(2,'architecto',102),(3,'eligendi',103),(4,'odio',104),(7,'vel',107),(8,'placeat',109),(10,'temporibus',113),(12,'aut',115),(13,'fugiat',116),(14,'harum',118),(15,'cupiditate',119),(16,'sunt',120),(17,'tempore',122),(18,'nihil',123),(19,'perferendis',125),(20,'porro',127),(21,'magnam',128),(22,'autem',129),(23,'quibusdam',130),(24,'nobis',135),(25,'et',136),(26,'asperiores',139),(27,'nesciunt',141),(28,'aut',145),(29,'illo',146),(30,'ut',147),(31,'veritatis',148),(32,'et',153),(33,'sit',156),(34,'omnis',157),(35,'delectus',162),(36,'quia',163),(37,'laudantium',165),(38,'voluptate',167),(39,'aut',170),(40,'quasi',171),(41,'quo',172),(42,'et',175),(43,'amet',177),(44,'quas',179),(45,'et',180),(46,'amet',185),(47,'quibusdam',186),(48,'et',187),(49,'nemo',188),(50,'magnam',191),(51,'qui',192),(52,'ut',194),(53,'eum',195),(54,'est',196),(55,'impedit',197),(56,'perspiciatis',198),(57,'officia',199),(58,'similique',101),(59,'rerum',102),(60,'non',103),(61,'vitae',104),(64,'rerum',107),(65,'reiciendis',109),(67,'cum',113),(69,'sunt',115),(70,'vero',116),(71,'sit',118),(72,'in',119),(73,'fugiat',120),(74,'non',122),(75,'similique',123),(76,'inventore',125),(77,'praesentium',127),(78,'dolor',128),(79,'qui',129),(80,'fugit',130),(81,'ipsa',135),(82,'vero',136),(83,'voluptatem',139),(84,'eos',141),(85,'laboriosam',145),(86,'esse',146),(87,'consequatur',147),(88,'rerum',148),(89,'consequatur',153),(90,'nemo',156),(91,'sit',157),(92,'nostrum',162),(93,'recusandae',163),(94,'sed',165),(95,'molestias',167),(96,'et',170),(97,'rerum',171),(98,'alias',172),(99,'ipsa',175),(100,'vitae',177);
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint unsigned DEFAULT NULL,
  `media_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `album_id` (`album_id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `photos_fk_1` FOREIGN KEY (`id`) REFERENCES `profiles` (`photo_id`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `photo_albums` (`id`),
  CONSTRAINT `photos_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(7,7,7),(8,8,8),(10,10,10),(12,12,12),(13,13,13),(14,14,14),(15,15,15),(16,16,16),(17,17,17),(18,18,18),(19,19,19),(20,20,20),(21,21,21),(22,22,22),(23,23,23),(24,24,24),(25,25,25),(26,26,26),(27,27,27),(28,28,28),(29,29,29),(30,30,30),(31,31,31),(32,32,32),(33,33,33),(34,34,34),(35,35,35),(36,36,36),(37,37,37),(38,38,38),(39,39,39),(40,40,40),(41,41,41),(42,42,42),(43,43,43),(44,44,44),(45,45,45),(46,46,46),(47,47,47),(48,48,48),(49,49,49),(50,50,50),(51,51,51),(52,52,52),(53,53,53),(54,54,54),(55,55,55),(56,56,56),(57,57,57);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `photo_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `hometown` varchar(100) DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  KEY `profiles_fk_2` (`photo_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `profiles_fk_1` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`),
  CONSTRAINT `profiles_fk_2` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (101,'f','1995-03-08',1,'2006-06-09 21:19:27',NULL),(102,'f','1981-01-14',2,'1976-09-11 16:18:30',NULL),(103,'f','2009-10-27',3,'1993-10-11 06:01:22',NULL),(104,'m','1985-03-22',4,'2017-09-01 21:07:41',NULL),(107,'m','1975-05-24',7,'1970-12-21 04:42:04',NULL),(109,'f','1971-01-12',8,'2001-10-19 01:25:09',NULL),(113,'f','2007-04-12',10,'2021-04-13 03:02:51',NULL),(115,'f','1989-05-22',12,'1976-07-03 16:07:39',NULL),(116,'f','2020-02-11',13,'2007-08-31 03:31:49',NULL),(118,'f','2015-03-25',14,'1979-09-18 07:50:22',NULL),(119,'m','2008-10-01',15,'2006-10-03 19:51:22',NULL),(120,'f','2019-01-02',16,'1992-10-04 21:43:25',NULL),(122,'m','1988-09-22',17,'1972-05-09 14:06:34',NULL),(123,'m','1986-12-21',18,'1993-10-06 12:45:31',NULL),(125,'f','1988-03-26',19,'2002-09-09 20:57:55',NULL),(127,'f','2003-10-15',20,'2013-06-11 23:50:00',NULL),(128,'f','1983-11-30',21,'1996-03-11 23:03:11',NULL),(129,'f','1977-01-05',22,'1972-06-13 10:25:06',NULL),(130,'m','1998-12-06',23,'1985-01-29 16:37:28',NULL),(135,'m','1992-04-08',24,'2006-11-14 13:43:00',NULL),(136,'m','2021-03-08',25,'2009-11-06 17:17:44',NULL),(139,'m','1974-08-03',26,'1998-04-02 07:17:32',NULL),(141,'f','1970-05-15',27,'2019-09-20 20:12:49',NULL),(145,'m','2019-12-01',28,'2005-02-16 05:25:46',NULL),(146,'m','2020-07-16',29,'1982-09-12 01:19:57',NULL),(147,'m','1998-08-09',30,'2009-09-01 19:59:08',NULL),(148,'f','2012-03-16',31,'1987-01-28 03:43:47',NULL),(153,'f','2009-02-18',32,'1981-07-04 19:32:23',NULL),(156,'m','2013-03-26',33,'1977-07-22 17:11:55',NULL),(157,'m','1991-12-28',34,'1993-06-21 22:32:29',NULL),(162,'f','1982-10-01',35,'1972-04-03 01:25:56',NULL),(163,'m','1970-03-25',36,'1981-08-15 09:44:19',NULL),(165,'f','1998-07-05',37,'2001-07-01 23:15:24',NULL),(167,'f','2016-11-26',38,'2001-11-30 20:55:11',NULL),(170,'f','1992-02-09',39,'2011-05-04 19:31:50',NULL),(171,'m','1972-12-11',40,'1975-08-29 11:18:32',NULL),(172,'m','2005-07-07',41,'1994-10-09 19:25:42',NULL),(175,'m','2005-07-18',42,'1976-08-27 21:48:58',NULL),(177,'f','2014-09-02',43,'1982-02-28 10:25:53',NULL),(179,'f','1985-08-28',44,'1999-02-17 17:23:40',NULL),(180,'f','2001-06-26',45,'2014-04-18 03:27:26',NULL),(185,'m','2018-10-25',46,'1972-09-29 11:45:14',NULL),(186,'f','2006-12-01',47,'2008-10-12 01:12:48',NULL),(187,'f','1977-05-10',48,'2021-03-12 22:52:22',NULL),(188,'m','2018-02-02',49,'2001-11-14 14:30:17',NULL),(191,'m','1995-04-27',50,'2004-12-29 17:44:58',NULL),(192,'f','1976-06-19',51,'1987-08-08 16:54:53',NULL),(194,'m','2006-02-11',52,'1975-10-16 12:10:48',NULL),(195,'f','1970-09-26',53,'1987-08-20 02:14:48',NULL),(196,'m','2007-05-01',54,'1974-06-03 08:17:34',NULL),(197,'m','1991-09-27',55,'1992-02-26 07:34:24',NULL),(198,'f','2018-01-18',56,'2007-04-23 14:48:21',NULL),(199,'m','1983-12-10',57,'1994-03-02 01:06:23',NULL);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL COMMENT 'surname',
  `email` varchar(120) DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL,
  `phone` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (101,'Bethany','Collier','rath.oma@example.net','c93b76434b7bd07df8251372243648b700202e15',827),(102,'Sister','Fritsch','smarks@example.com','0344a00e8ed7cef50ffc7e8f1aa3bd83c2524073',0),(103,'Vernie','Larson','terry.raynor@example.net','c4a611d0c5ceccaeb7c898ec55305f834518a17d',143),(104,'Elouise','Jast','timmy27@example.com','f51f457e5299a18d4b3145c313b2e8fdf11ced15',6990222203),(107,'Jeff','Harber','fkutch@example.com','10be7ae6fb1346596274208ad0f6ee08460cc797',214),(109,'Leonardo','Kohler','andy.boyle@example.net','4f4e2ff31385f73b5fbec04169153b5fe788bbfb',78),(113,'Kathryne','Labadie','lharber@example.org','c97526f89c705066ed8448154abfdfeeb82ff402',204),(115,'Buford','Romaguera','bryon26@example.org','97cdbfec5c1d3252dd27ce8dc9114afa89566b9f',949),(116,'Marcelle','Ritchie','eloy.bauch@example.org','6f7d04d0d251034832e007b64605b90ee8e5dfe6',57),(118,'Mallory','Kozey','tracy.beatty@example.com','6f228eece68605bf2512d71753422ecacd661957',373),(119,'Tony','Deckow','xjenkins@example.net','d70c1ac5927e891bd9c8ca38e527ae226ec1d6b0',33),(120,'Ressie','Connelly','fisher.freeman@example.org','68572b7f6723b76bb5a41de4d6284852516bf307',30),(122,'Muhammad','Schneider','wehner.lew@example.com','f9dc58b3eb69b3d79892c5a1efc69fe91f35ed2b',393797),(123,'Leslie','Raynor','sophie.olson@example.org','1a7098b1de396b880e43ad004b0c511b709b5d86',839255),(125,'Reva','Bernier','zena33@example.net','59695a6fc9de26b6d2aa44ea55d8c6383a5a54d5',322),(127,'America','Fahey','dillon95@example.net','6c829cf7affc82ce1fba6ac5038a4dfda83048d6',362495),(128,'Faustino','Koss','emmie52@example.com','def56380672fae4c17f6ad495250c81a094ed622',525),(129,'Thelma','Cruickshank','hickle.chelsea@example.com','b20161b9617637efbbe8ff436d4ca496d24ec4a5',596),(130,'Aubrey','Monahan','kamron.runte@example.com','dff4a0e209571c17e068a5171691240c6ae8b649',52),(135,'Bobbie','Senger','acrona@example.com','979ea09f0f7bd415d766f9c505569903fd6d5cea',964),(136,'Manley','McCullough','timothy34@example.com','94c0b2cd4c40a7fdd18e31327b23894f5e0e78c2',298316),(139,'Maymie','Lynch','nthompson@example.org','5af885143c9060e57e6d1a04485a82ddb153105f',229330),(141,'Mossie','Runte','jerald57@example.net','d66c0d576de75e767a72f8f06d5e62aa16811cf3',133208),(145,'Adrianna','Rau','freddy37@example.net','2f9c210bc2fd727bda17aa81dcbeed95a826415c',4321482120),(146,'Easton','Hermann','hegmann.betsy@example.net','a76a2a9a8cc9b161df7ce921ed588cb6f21ad0ff',688028),(147,'Bo','Nitzsche','toy.alexane@example.net','9e4406dd0020880107acaf69d05f70156aeac5a9',9484784606),(148,'Sandrine','Langosh','ppadberg@example.net','8250fd26e21c61badbaf680f745438ea5d7d76d3',925823),(153,'Anastasia','Sipes','angelo84@example.com','1e4cc08342c91a85efe5fc0a3e8a29940b986b8d',8633670499),(156,'Filomena','Bednar','libbie93@example.com','0bda7ad4f43212a12984bea42688a621687a88de',87),(157,'Santos','Witting','drake.reilly@example.net','1eafa8d0a1c490a77d5e1b17f65b6328774f8b65',665),(162,'Irma','Schowalter','willms.kasey@example.org','303fe8c3fa054dbd1d05552aaa418c3bc9a17497',674),(163,'Elissa','Turner','ahmad.nader@example.net','83bcffb477d323d0c02867a851e8ff30e0667650',904),(165,'Francis','Stehr','yesenia.frami@example.org','4411bfd779f03704bf6dc20d03d0baf06ffc7fa2',963),(167,'Juston','Gislason','napoleon95@example.org','cee75b80f917cc9114933f243b257c408cbddf6b',472346),(170,'Percival','Heller','william00@example.com','23425848320c681396b9c60780648386f3454427',749),(171,'Johann','Reichert','thaddeus.pfannerstill@example.org','f2e12f0168813fa1495357dcaf8c68c0cf73e085',741032),(172,'Coy','Keeling','jameson23@example.net','42ed77b4c5d95b26fbea72848c83b82f71fd6482',693168),(175,'Elfrieda','Veum','stephan.upton@example.com','4ed5523c1d15018a100a7a9e0ceebca82bc431d1',44),(177,'Uriah','Marvin','nlowe@example.org','57bc35fb88c4d22943303f00d4dcab9748943db5',680756),(179,'Paul','Vandervort','nikolaus.derek@example.net','88ab9f24e35f9a9e1eb89a8511c492b22f3733f4',70034),(180,'Bradley','D\'Amore','gbernhard@example.com','6d934a865f892b52b9a01bbcaf3296e265fd8ce9',655),(185,'Floyd','Kertzmann','ihowell@example.net','ed9a35af7ec1a090da1acaaef6b386f6994f6ee6',17682216),(186,'Virginie','Swift','kallie.harvey@example.com','d1156626ffbc246b8c3b1e5dd55d62f724804e62',196444),(187,'Greyson','Kris','beatty.breanna@example.com','c07baff952a20c545ebe3182d3c646fdb30333f7',641),(188,'Geovanny','Kirlin','yrosenbaum@example.com','fa256fe886976793c5928063a235b4e4fa22aaae',9460823180),(191,'Hanna','Pagac','graham.graciela@example.net','96cf80d74b548bea0843baf096e70aa404e67268',478),(192,'Madisen','Gleason','hildegard78@example.com','394fd952bdc54248571cddfcc5a29c58a5c5e9c0',577344),(194,'Toy','Miller','moore.oran@example.com','658202f8b04c88bf633c5c0d4f988829f2185a3e',433),(195,'Winston','Waelchi','yhowe@example.net','630ae194ef5f30883c1b8daefd463ce601c20246',428),(196,'Derrick','Littel','kurtis09@example.net','fc2f0113ed8c8379cc9f39ac93a7047c062cc769',416),(197,'Kristy','Abbott','demetris70@example.net','adb0d69f51d81aab7c5b634e15908d52b3a66cc9',84),(198,'Kurtis','Hoeger','qfranecki@example.net','e7a641a5b1f5c1ba630401d2e44f7ed44abce2b6',2402282116),(199,'Joshua','Bergstrom','ole70@example.net','891c2648d619b5ea2c2ca92def32f8432fd156d5',116919);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_communities` (
  `user_id` bigint unsigned NOT NULL,
  `community_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `community_id` (`community_id`),
  CONSTRAINT `users_communities_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_communities_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (101,1),(102,2),(103,3),(104,4),(107,7),(109,8),(113,10),(115,12),(116,13),(118,14),(119,15),(120,16),(122,17),(123,18),(125,19),(127,20),(128,21),(129,22),(130,23),(135,24),(136,25),(139,26),(141,27),(145,28),(146,29),(147,30),(148,31),(153,32),(156,33),(157,34),(162,35),(163,36),(165,37),(167,38),(170,39),(171,40),(172,41),(175,42),(177,43),(179,44),(180,45),(185,46),(186,47),(187,48),(188,49),(191,50),(192,51),(194,52),(195,53),(196,54),(197,55),(198,56),(199,57),(101,58),(102,59),(103,60),(104,61),(107,64),(109,65),(113,67),(115,69),(116,70),(118,71),(119,72),(120,73),(122,74),(123,75),(125,76),(127,77),(128,78),(129,79),(130,80),(135,81),(136,82),(139,83),(141,84),(145,85),(146,86),(147,87),(148,88),(153,89),(156,90),(157,91),(162,92),(163,93),(165,94),(167,95),(170,96),(171,97),(172,98),(175,99),(177,100);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-08 19:01:53

CREATE DATABASE  IF NOT EXISTS `webapde` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `webapde`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webapde
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_username` varchar(45) NOT NULL,
  `photo_title` varchar(45) NOT NULL,
  `photo_description` varchar(45) DEFAULT NULL,
  `photo_uploadDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `photo_url` tinytext NOT NULL,
  `photo_privacy` enum('private','public') NOT NULL,
  PRIMARY KEY (`photo_id`,`user_username`),
  KEY `user_username_idx` (`user_username`),
  CONSTRAINT `user_username` FOREIGN KEY (`user_username`) REFERENCES `users` (`users_username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,'Claude','Claude\'s Photo','Claude\'s first upload!','2017-08-12 07:24:56','img/private/1.jpg','private'),(2,'Jess','Jess\' Photo','Jess\' first photo!','2017-08-12 07:24:56','img/public/1.jpg','public'),(3,'Alex','Alex\'s Photo','Alex\'s first photo!','2017-08-12 07:24:56','img/private/2.jpg','private'),(5,'Jess','Jess\' Second Photo','Jess\' second photo!','2017-08-12 07:24:56','img/public/2.jpg','public'),(6,'Jess','Jess\' Third Photo','Jess\' Third photo!','2017-08-12 07:24:56','img/private/3.jpg','private'),(7,'Claude','Claude\'s 2nd photo','Claude\'s Second Photo!','2017-08-12 07:24:56','img/public/3.jpg','public'),(8,'Claude','Claude\'s 3rd photo','Claude\'s third Photo!','2017-08-12 07:24:56','img/private/4.jpg','private'),(9,'Claude','Claude\'s 4th photo','xd','2017-08-12 07:34:05','img/public/4.jpg','public'),(10,'Kent','ha','lmao','2017-08-12 07:24:56','img/private/5.jpg','private'),(11,'Kent','he','hi','2017-08-12 07:34:05','img/public/5.jpg','public'),(12,'Kent','asd','asd','2017-08-12 07:37:27','img/private/6.jpg','private'),(13,'Luigi','asd','xd','2017-08-12 07:34:05','img/public/6.jpg','public'),(14,'Luigi','asd','xd','2017-08-12 07:34:05','img/private/7.jpg','private'),(15,'Gab','asd','asd','2017-08-12 07:34:05','img/public/7.jpg','public'),(16,'Gab','asd','sdf','2017-08-12 07:34:05','img/private/8.jpg','private'),(17,'Gab','df','sdf','2017-08-12 07:34:05','img/public/8.jpg','public'),(18,'Gab','qwe','qwe','2017-08-12 07:34:05','img/public/9.jpg','public'),(19,'Tim','ert','ert','2017-08-12 07:34:05','img/public/10.jpg','public'),(20,'Tim','dfg','dfg','2017-08-12 07:37:27','img/private/9.jpg','private'),(21,'Eric','dfg','fgh','2017-08-12 07:34:05','img/private/10.jpg','private'),(22,'Eric','asd','asd','2017-08-12 07:36:42','img/public/11.jpg','public'),(23,'Eric','zxc','zxc','2017-08-12 07:36:42','img/public/12.jpg','public'),(24,'Eric','zxc','zxc','2017-08-12 07:36:42','img/public/13.jpg','public'),(25,'Tim','qwe','qwe','2017-08-12 07:38:16','img/public/14.jpg','public'),(26,'Tim','cvb','cvb','2017-08-12 07:38:16','img/public/15.jpg','public');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_photos`
--

DROP TABLE IF EXISTS `shared_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_photos` (
  `photo_id` int(11) NOT NULL,
  `shared_user_username` varchar(20) NOT NULL,
  PRIMARY KEY (`photo_id`,`shared_user_username`),
  KEY `user_username_idx` (`shared_user_username`),
  KEY `shared_photo_username_idx` (`shared_user_username`),
  CONSTRAINT `shared_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shared_photo_username` FOREIGN KEY (`shared_user_username`) REFERENCES `users` (`users_username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_photos`
--

LOCK TABLES `shared_photos` WRITE;
/*!40000 ALTER TABLE `shared_photos` DISABLE KEYS */;
INSERT INTO `shared_photos` VALUES (2,'Alex'),(2,'Claude'),(3,'Claude');
/*!40000 ALTER TABLE `shared_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'outdoors'),(2,'games'),(3,'family'),(4,'school'),(5,'travel'),(48,'computer science'),(49,'c');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_photo_relation`
--

DROP TABLE IF EXISTS `tag_photo_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_photo_relation` (
  `tag_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`,`photo_id`),
  KEY `photo_id_idx` (`photo_id`),
  CONSTRAINT `photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`photo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_photo_relation`
--

LOCK TABLES `tag_photo_relation` WRITE;
/*!40000 ALTER TABLE `tag_photo_relation` DISABLE KEYS */;
INSERT INTO `tag_photo_relation` VALUES (2,1),(3,1),(1,2),(2,2);
/*!40000 ALTER TABLE `tag_photo_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `users_username` varchar(20) NOT NULL,
  `users_password` varchar(30) NOT NULL,
  `users_shortdescription` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`users_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','nyeam','xd'),('Alex','password','i\'m the second user'),('Claude','password','i\'m the first user'),('Eric','asd','asd'),('Gab','asd','asd'),('Jess','password','i\'m the third user'),('Kent','1234','i\'m the 4th user'),('Luigi','asd','asd'),('Tim','asd','asd');
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

-- Dump completed on 2017-08-13 23:08:33

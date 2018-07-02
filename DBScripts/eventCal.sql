-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `fid` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL,
  `rid` int(10) DEFAULT NULL,
  `feedback` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fid`),
  KEY `uid` (`uid`),
  KEY `rid` (`rid`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `resort` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,2,1,'yaar bhut ganda hai tmlog kbhimat karwana event inse'),(2,3,2,'yaar bhut achaa hai hmsha karwana event inse'),(3,5,2,'yaar bhut achaa hai hmsha karwana event inse');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hall`
--

DROP TABLE IF EXISTS `hall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hall` (
  `hallid` int(10) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `hname` varchar(20) DEFAULT NULL,
  `capacity` int(5) DEFAULT NULL,
  `cost` int(6) DEFAULT NULL,
  PRIMARY KEY (`hallid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hall`
--

LOCK TABLES `hall` WRITE;
/*!40000 ALTER TABLE `hall` DISABLE KEYS */;
INSERT INTO `hall` VALUES (1,1,'Hall1',500,15000),(2,1,'Hall2',800,30000),(3,2,'Hall1',1800,300000),(4,6,'h1',1000,15000),(5,6,'h2',800,10000),(6,7,'Hall1',2000,20000),(7,7,'Hall2',1500,17000),(8,7,'Hall3',1000,15000),(9,8,'HallName1',500,5000),(10,8,'HallName2',700,7000),(11,9,'HallN1',1000,10000),(12,9,'HallN2',800,13000),(13,9,'HallN3',1100,15000),(14,10,'Hall 1',1500,150000),(15,10,'Hall 2 ',400,4000),(16,15,'Hall 1',1500,15000),(17,15,'Hall 2 ',4000,40000),(18,18,'amaltaash',1500,150000),(19,19,'jaha ',1500,150000),(20,20,'Hall 1',1500,150000),(21,21,'Hall 1',1500,150000),(22,23,'Hall 1',1500,150000),(23,24,'h1',100,25000),(24,24,'h2',500,100000),(25,25,'ad1',200,1000),(26,25,'ad2',500,2000),(27,26,'w1',100,50000),(28,26,'w2',500,100000),(29,27,'k1',200,20000),(30,27,'k2',500,50000),(31,28,'h1',1500,1500),(32,29,'g1',100,25000),(33,30,'HAll1',1500,15000),(34,31,'Hall1',200,15000),(35,37,'sdfghj',150,1500),(36,38,'xcvbnm',150,1500),(37,39,'sdfghj',2345,150),(38,40,'asdfgh',150,150),(39,41,'asdfghj',150,1500),(40,43,'sdf',150,1500),(41,44,'xcfgh',150,1500),(42,45,'sdfghj',234,567),(43,46,'Hall 1 ',1500,15000),(44,47,'Hall 1',150,1500),(45,48,'Hello',150,1500),(46,49,'sdfgh',150,1500),(47,50,'sdfgjk',1000,10000);
/*!40000 ALTER TABLE `hall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hallbooking`
--

DROP TABLE IF EXISTS `hallbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hallbooking` (
  `uid` int(10) NOT NULL,
  `hallid` int(10) NOT NULL,
  `hold` tinyint(1) DEFAULT NULL,
  `cancel` tinyint(1) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expirydate` datetime DEFAULT NULL,
  `funcstart` datetime DEFAULT NULL,
  `funcenddate` datetime DEFAULT NULL,
  `counttowait` int(10) DEFAULT NULL,
  `bookingid` int(10) NOT NULL AUTO_INCREMENT,
  `confirm` tinyint(1) DEFAULT NULL,
  `cancelbyuser` tinyint(1) DEFAULT NULL,
  `cancelbyowner` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `fk_hallbooking` (`uid`),
  KEY `hallid` (`hallid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hallbooking`
--

LOCK TABLES `hallbooking` WRITE;
/*!40000 ALTER TABLE `hallbooking` DISABLE KEYS */;
INSERT INTO `hallbooking` VALUES (2,1,1,0,'2017-07-07 06:14:57','2017-06-06 12:42:58','2017-12-24 01:00:00','2017-12-24 02:00:00',0,2,0,NULL,1),(2,1,1,0,'2017-07-07 06:14:57','2017-06-09 11:45:25','2017-12-24 01:00:00','2017-12-24 02:00:00',0,5,0,NULL,1),(3,2,1,0,'2017-07-07 06:14:57','2017-06-11 11:47:47','2017-08-24 01:00:00','2017-08-24 02:00:00',0,6,0,NULL,1),(5,2,1,0,'2017-07-07 06:14:57','2017-06-11 11:48:28','2017-08-24 01:00:00','2017-08-24 02:00:00',0,7,0,NULL,1),(3,2,1,0,'2017-07-07 06:14:57','2017-07-04 20:01:30','2017-12-15 10:00:00','2017-12-15 18:00:00',0,8,0,NULL,1),(5,18,1,0,'2017-07-07 06:14:57','2017-07-07 12:37:54','2017-07-26 09:45:00','2017-07-26 09:45:00',0,9,0,NULL,1),(5,21,1,0,'2017-07-07 06:14:57','2017-07-07 12:41:49','2017-07-14 09:45:00','2017-07-14 09:45:00',0,10,0,NULL,1),(5,21,1,0,'2017-07-07 06:14:57','2017-07-07 12:43:30','2017-07-14 09:45:00','2017-07-14 09:45:00',0,11,0,NULL,1),(5,21,1,0,'2017-07-07 06:14:57','2017-07-07 12:43:52','2017-07-14 09:45:00','2017-07-14 09:45:00',0,12,0,NULL,1),(5,21,1,0,'2017-07-07 06:14:57','2017-07-07 12:46:19','2017-07-14 09:45:00','2017-07-14 09:45:00',0,13,0,NULL,1),(5,2,0,0,'2017-07-07 08:08:03','2017-07-07 13:43:07','2017-07-07 10:45:00','2017-07-07 10:45:00',0,14,1,NULL,1),(21,2,1,0,'2017-07-07 08:38:38','2017-07-07 13:43:44','2017-07-19 10:15:00','2017-07-19 22:15:00',0,15,0,NULL,0),(5,18,0,1,'2017-07-07 09:07:12','2017-07-07 17:15:41','2017-07-11 14:15:00','2017-07-11 14:15:00',0,16,0,NULL,1),(3,18,0,1,'2017-07-07 09:14:29','2017-07-07 17:24:26','2017-07-07 14:30:00','2017-07-07 14:30:00',0,17,0,NULL,1),(3,19,0,1,'2017-07-07 09:21:52','2017-07-07 17:50:04','2017-07-07 15:00:00','2017-07-07 15:00:00',0,18,0,NULL,1),(27,19,0,1,'2017-07-07 09:36:18','2017-07-07 18:06:11','2017-07-26 15:15:00','2017-07-26 15:15:00',0,19,0,NULL,1),(3,18,1,0,'2017-07-07 10:28:24','2017-07-07 18:58:24','2017-07-27 16:00:00','2017-07-27 16:00:00',0,20,0,NULL,NULL),(3,19,1,0,'2017-07-07 11:52:09','2017-07-07 20:22:09','2017-07-11 17:30:00','2017-07-11 17:30:00',0,21,0,NULL,NULL),(5,24,0,1,'2017-07-07 22:15:08','2017-07-08 05:35:04','2017-07-08 02:45:00','2017-07-08 02:45:00',0,22,0,NULL,1),(5,24,0,1,'2017-07-07 21:18:48','2017-07-08 05:41:58','2017-07-15 02:45:00','2017-07-15 02:45:00',0,23,0,1,NULL),(5,24,0,1,'2017-07-07 22:11:34','2017-07-08 05:49:49','2017-07-08 03:00:00','2017-07-08 03:00:00',0,24,0,NULL,1),(5,24,0,1,'2017-07-07 22:11:37','2017-07-08 05:52:09','2017-07-08 03:00:00','2017-07-08 03:00:00',0,25,0,NULL,1),(5,18,0,1,'2017-07-07 22:21:20','2017-07-08 06:50:24','2017-07-08 04:00:00','2017-07-08 04:00:00',0,26,0,1,NULL),(5,18,0,1,'2017-07-07 22:21:18','2017-07-08 06:50:54','2017-07-08 04:00:00','2017-07-08 04:00:00',0,27,0,1,NULL),(5,18,0,1,'2017-07-07 22:22:00','2017-07-08 06:51:44','2017-07-08 04:00:00','2017-07-08 04:00:00',0,28,0,1,NULL),(5,18,0,0,'2017-07-07 23:04:36','2017-07-08 06:52:36','2017-07-08 04:00:00','2017-07-08 04:00:00',0,29,1,NULL,NULL),(5,18,0,0,'2017-07-07 23:04:13','2017-07-08 07:04:39','2017-07-08 04:15:00','2017-07-08 04:15:00',0,30,1,NULL,NULL),(5,18,0,1,'2017-07-07 23:02:06','2017-07-08 07:19:06','2017-07-08 04:30:00','2017-07-08 04:30:00',0,31,0,1,NULL),(5,18,0,1,'2017-07-07 22:56:18','2017-07-08 07:19:49','2017-07-08 04:30:00','2017-07-08 04:30:00',0,32,0,1,NULL),(5,18,0,1,'2017-07-07 22:52:56','2017-07-08 07:20:44','2017-07-08 04:30:00','2017-07-08 04:30:00',0,33,0,1,NULL),(5,18,0,1,'2017-07-07 23:04:42','2017-07-08 07:21:21','2017-07-08 04:30:00','2017-07-08 04:30:00',0,34,0,NULL,1),(5,18,0,1,'2017-07-07 23:03:11','2017-07-08 07:32:42','2017-07-08 04:45:00','2017-07-08 04:45:00',0,35,0,1,NULL),(5,18,0,0,'2017-07-07 23:04:33','2017-07-08 07:33:03','2017-07-08 04:45:00','2017-07-08 04:45:00',0,36,1,NULL,NULL),(5,18,1,0,'2017-07-08 03:24:24','2017-07-08 11:54:24','2017-07-18 09:00:00','2017-07-18 09:00:00',0,37,0,NULL,NULL),(5,23,0,1,'2017-07-08 05:37:24','2017-07-08 13:47:42','2017-07-08 11:00:00','2017-07-08 11:00:00',0,38,0,NULL,1),(5,21,1,0,'2017-07-08 05:34:12','2017-07-08 14:04:12','2017-07-08 11:15:00','2017-07-08 11:15:00',0,39,0,NULL,NULL),(30,30,0,0,'2017-07-08 05:40:01','2017-07-08 14:06:37','2017-07-08 11:15:00','2017-07-08 14:15:00',0,40,1,NULL,NULL),(31,30,0,0,'2017-07-08 05:44:59','2017-07-08 14:14:20','2017-07-19 11:30:00','2017-07-19 11:30:00',0,41,1,NULL,NULL),(3,31,1,0,'2017-07-08 05:44:47','2017-07-08 14:14:47','2017-07-08 11:15:00','2017-07-08 11:15:00',0,42,0,NULL,NULL),(3,31,0,0,'2017-07-08 05:48:57','2017-07-08 14:15:21','2017-07-08 23:15:00','2017-07-08 11:15:00',0,43,1,NULL,NULL),(5,30,0,0,'2017-07-08 05:51:37','2017-07-08 14:20:52','2017-07-20 11:30:00','2017-07-20 11:30:00',0,44,1,NULL,NULL),(5,32,0,1,'2017-07-08 06:00:31','2017-07-08 14:24:16','2017-07-20 11:30:00','2017-07-20 11:30:00',0,45,0,1,NULL),(5,32,1,0,'2017-07-08 05:58:44','2017-07-08 14:28:44','2017-12-20 11:30:00','2017-12-20 11:30:00',0,46,0,NULL,NULL),(3,29,0,1,'2017-07-08 06:02:32','2017-07-08 14:32:13','2017-07-08 11:45:00','2017-07-08 11:45:00',0,47,0,1,NULL),(5,19,1,0,'2017-07-08 06:03:28','2017-07-08 14:33:28','2017-07-08 11:45:00','2017-07-08 11:45:00',0,48,0,NULL,NULL),(5,25,0,1,'2017-07-08 06:06:20','2017-07-08 14:34:48','2017-07-08 11:45:00','2017-07-08 11:45:00',0,49,0,1,NULL),(5,25,0,1,'2017-07-08 06:10:00','2017-07-08 14:35:06','2017-07-08 11:45:00','2017-07-08 11:45:00',0,50,0,1,NULL),(5,25,0,1,'2017-07-08 07:18:39','2017-07-08 14:35:24','2017-07-08 11:45:00','2017-07-08 11:45:00',0,51,0,NULL,1),(5,25,0,1,'2017-07-08 07:18:39','2017-07-08 14:35:43','2017-07-08 11:45:00','2017-07-08 11:45:00',0,52,0,NULL,1),(5,25,0,1,'2017-07-08 07:18:39','2017-07-08 14:50:14','2017-07-08 12:00:00','2017-07-08 12:00:00',0,53,0,NULL,1),(5,25,0,1,'2017-07-08 07:18:39','2017-07-08 14:50:41','2017-07-08 12:00:00','2017-07-08 12:00:00',0,54,0,NULL,1),(5,25,0,1,'2017-07-08 07:18:39','2017-07-08 14:52:15','2017-07-08 12:00:00','2017-07-08 12:00:00',0,55,0,NULL,1),(5,25,0,1,'2017-07-08 07:18:39','2017-07-08 14:52:30','2017-07-08 12:00:00','2017-07-08 12:00:00',0,56,0,NULL,1),(5,25,0,0,'2017-07-08 07:18:39','2017-07-08 14:52:42','2017-07-08 12:00:00','2017-07-08 12:00:00',0,57,1,NULL,NULL),(5,25,0,1,'2017-07-08 07:13:53','2017-07-08 15:31:33','2017-07-08 12:45:00','2017-07-08 12:45:00',0,58,0,1,NULL),(5,25,0,1,'2017-07-08 07:14:34','2017-07-08 15:31:49','2017-07-08 12:45:00','2017-07-08 12:45:00',0,59,0,1,NULL),(5,25,0,1,'2017-07-08 07:18:39','2017-07-08 15:32:05','2017-07-08 12:45:00','2017-07-08 12:45:00',0,60,0,NULL,1),(5,33,0,0,'2017-07-08 09:29:33','2017-07-08 16:37:18','2017-07-08 13:45:00','2017-07-08 13:45:00',0,61,1,NULL,NULL),(5,21,0,0,'2017-07-08 11:00:12','2017-07-08 16:37:44','2017-07-13 13:45:00','2017-07-13 13:45:00',0,62,1,NULL,NULL),(5,19,1,0,'2017-07-08 08:09:48','2017-07-08 16:39:48','2017-07-06 13:45:00','2017-07-06 13:45:00',0,63,0,NULL,NULL),(5,30,1,0,'2017-07-08 08:26:52','2017-07-08 16:56:52','2017-07-11 14:00:00','2017-07-11 14:00:00',0,64,0,NULL,NULL),(37,32,1,0,'2017-07-08 09:01:19','2017-07-08 17:31:19','2017-07-08 14:45:00','2017-07-08 14:45:00',0,65,0,NULL,NULL),(38,33,0,0,'2017-07-08 09:29:29','2017-07-08 17:35:28','2017-07-16 14:45:00','2017-07-16 14:45:00',0,66,1,NULL,NULL),(37,32,1,0,'2017-07-08 09:05:55','2017-07-08 17:35:55','2017-07-08 14:45:00','2017-07-08 14:45:00',1,67,0,NULL,NULL),(5,21,1,0,'2017-07-08 10:41:08','2017-07-08 19:11:08','2017-07-10 16:15:00','2017-07-10 16:15:00',0,68,0,NULL,NULL),(1,21,1,0,'2017-07-08 10:59:26','2017-07-08 19:29:26','2017-07-26 04:30:00','2017-07-26 16:30:00',0,69,0,NULL,NULL),(3,18,0,0,'2017-07-10 05:13:48','2017-07-10 13:42:51','2017-07-11 10:45:00','2017-07-11 10:45:00',0,70,1,NULL,NULL),(15,33,1,0,'2017-07-10 06:21:45','2017-07-10 14:51:45','2017-07-10 12:00:00','2017-07-10 12:00:00',0,71,0,NULL,NULL),(15,33,1,0,'2017-07-10 06:27:33','2017-07-10 14:57:33','2017-07-10 12:00:00','2017-07-10 12:00:00',1,72,0,NULL,NULL),(5,33,0,0,'2017-07-13 04:15:56','2017-07-13 12:45:12','2017-07-13 19:00:00','2017-07-13 00:00:00',0,73,1,NULL,NULL);
/*!40000 ALTER TABLE `hallbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `mid` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL,
  `hallid` int(10) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `hallid` (`hallid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'happy.mp4',2,'video'),(2,'wedding vid.jpg',2,'image'),(3,'sangeet.mp3',3,'other'),(4,'party.jpeg',3,'image'),(5,NULL,5,'image'),(6,'facebook.png',5,'image'),(7,'/static/images/upload_6e3a10038d147f516d7f37c3508ccde9',18,'image'),(8,'/static/images/upload_d490d704fb6a4ffcd2193409299b71c3',19,'image'),(9,'/static/images/upload_9d700d044de5efef9fcbd5d373705573',20,'image'),(10,'/static/images/upload_f6647d3d35fed46d2421430ed24b09cb',21,'image'),(11,'/static/images/upload_de334191db86e63972f0e96386922456',22,'image'),(12,'/static/images/upload_d3beb9fd315372db16abce972d3e6cb9',23,'image'),(13,'/static/images/upload_b45b74e7c9ebddc705f24ae1b81d372c',24,'image'),(14,'/static/images/upload_978d8552dfdf06ae2635f520c4ac3f1a',25,'image'),(15,'/static/images/upload_6fcdd1142fd1bd649ef5a8c029e802bf',26,'image'),(16,'/static/images/upload_4cf3f5eb9e7b61eff7e6d09eb62f4239',27,'image'),(17,'/static/images/upload_6979910a04d53b48d99ebe9c3181113a',28,'image'),(18,'/static/images/upload_c30c57d2225c6e16bfe776dfa4776564',29,'image'),(19,'/static/images/upload_094f2712ec16c21d111c4d885acbfc63',30,'image'),(20,'/static/images/upload_e2586b95b20838198af542dfb1da6d7c',31,'image'),(21,'/static/images/upload_e636553268f8806ced549556aa987c53',32,'image'),(22,'/static/images/upload_676aefa88376812fa4307f65b49fbb16',33,'image'),(23,'/static/images/upload_9296a16e52665ba572539b0a975e6b9b',34,'image'),(24,'0',37,'image'),(25,'http://localhost:30009',38,'image'),(26,'http://localhost:3000staticstaticimagesupload_b4843d641e13ff6dcd7be7c2cd483d8f',39,'image'),(27,'http://localhost:3000/static/images/upload_77779a5f7ecc5ddebf681ca631d0d6eb',40,'image'),(28,'/static/images/upload_d327e4391a39a8b2d4aea97754de2f31',41,'image'),(29,'/static/images/upload_6072c0976c9fe2d0cdac59f140bd23c1',44,'image'),(30,'/static/images/upload_9edde6bc111fe73dac58edf77bb9b130',45,'image'),(31,'/static/images/upload_2abbd36ecd39414bffe7b4d1c2f3fe64',46,'image'),(32,'/static/images/upload_033abf5139c34aafb70af4c021183f96',47,'image');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `mobile` bigint(12) DEFAULT NULL,
  `resort_name` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES ('Harshita ','harshital@gmail.com',8755265126,'highway resort','awesome place'),('Divyansh','div1@gmail.com',9754268228,'Gkp resort','yahoooooooooooooooooooooooooooooooooooooooooooooooo'),('Divyansh ','div1@gmail.com',9455727912,'Gkp resort','haha haha haha hshsv haGshsgsh'),('amit agrawal','amit@gmail.com',9627000000,'royal palace','fantastic palace'),('Pratishtha Dixit','pratishtha.dixit_cs15@gla.ac.in',7055280280,'Welcome Resorts','abcdefgh');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resort`
--

DROP TABLE IF EXISTS `resort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resort` (
  `rid` int(10) NOT NULL AUTO_INCREMENT,
  `rname` varchar(70) DEFAULT NULL,
  `loc` varchar(20) DEFAULT NULL,
  `nhalls` int(10) DEFAULT NULL,
  `ctimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` int(10) NOT NULL,
  `resortaddress` varchar(100) DEFAULT NULL,
  `description` varchar(3000) DEFAULT NULL,
  `tagline` varchar(250) DEFAULT NULL,
  `resortnumber` bigint(15) DEFAULT NULL,
  `rating` int(5) DEFAULT NULL,
  `ac` tinyint(1) DEFAULT NULL,
  `parking` tinyint(1) DEFAULT NULL,
  `wifi` tinyint(1) DEFAULT NULL,
  `DJ` tinyint(1) DEFAULT NULL,
  `flowerdecor` tinyint(1) DEFAULT NULL,
  `catering` tinyint(1) DEFAULT NULL,
  `rooms` tinyint(1) DEFAULT NULL,
  `nonveg` tinyint(1) DEFAULT NULL,
  `liquor` tinyint(1) DEFAULT NULL,
  `remove` tinyint(1) DEFAULT '0',
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `termsconditions` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  UNIQUE KEY `makeUnique` (`rname`,`loc`,`resortaddress`,`resortnumber`),
  KEY `fk_resort` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resort`
--

LOCK TABLES `resort` WRITE;
/*!40000 ALTER TABLE `resort` DISABLE KEYS */;
INSERT INTO `resort` VALUES (1,'Hochi Resorts','Mathura',2,'2017-07-07 20:23:45',1,'choumuha','Opt for staying in Vrindavan than in Mathura. Its one of the economical places. Not near to station but near to all sight seeing points. Hotel rooms are on first floor n restaurant on ground floor',NULL,9506748326,0,1,1,1,NULL,NULL,NULL,1,NULL,1,1,NULL,NULL,NULL),(2,'dream Destination','Mathura',1,'2017-07-07 20:23:45',4,'Krishnanagar','nice place...there r so many things for entertainment as there is gym swimming pool etc....and also hv clean rooms n very cooperative ',NULL,9506748326,0,1,1,NULL,NULL,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL),(6,'Kadamb Resort','Vrindavan',2,'2017-07-07 20:23:14',15,'Vrindavan,Mathura','After booking hotke they had provided me bad rooms as if like i have not payed for it. Will not suggest to anyone plz choose some other property as this is thw rong place which you are looking for',NULL,NULL,1,1,1,NULL,NULL,1,1,1,NULL,NULL,1,NULL,NULL,NULL),(7,'MagSons Resort','Kosi',3,'2017-07-07 20:23:14',16,'Kosi,Mathura','After booking hotke they had provided me bad rooms as if like i have not payed for it. Will not suggest to anyone plz choose some other property as this is thw rong place which you are looking for',NULL,NULL,1,1,1,NULL,NULL,1,1,1,NULL,NULL,1,NULL,NULL,NULL),(8,'Ananda Resort Rrrrs','Chatikara',2,'2017-07-07 20:23:45',17,'undefined','After booking hotke they had provided me bad rooms as if like i have not payed for it. Will not suggest to anyone plz choose some other property as this is thw rong place which you are looking for','null',8745291136,2,1,1,NULL,NULL,1,1,1,NULL,NULL,1,5.3,5.3,NULL),(9,'Shri Radha Resort','Goverdhan',3,'2017-07-07 20:23:45',18,'undefined','Opt for staying in Vrindavan than in Mathura. Its one of the economical places. Not near to station but near to all sight seeing points. Hotel rooms are on first floor n restaurant on ground floor.','null',155211,2,1,1,NULL,NULL,NULL,NULL,1,1,1,1,255.55,1245.5,NULL),(10,'Brij Vasundhara','undefined',NULL,'2017-07-07 20:23:45',15,'Aanyor, Govardhan Parikrama Marg,Mathura,Uttar Pradesh, 281502','Guests liked the large , clean rooms, though some commented maintenance could be improved. Guests liked the quiet rooms.,no smoking, no voilence, no non-veg','Jai shree Radhe !',7500278777,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(15,'Hotel Brijwasi Royal','undefined',NULL,'2017-07-07 20:23:45',16,'Near mathura train station','just 2.2 km away from ,pay at checkout ','hahahahaha hahaja haha',8722416523,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(18,'Hotel mera Jahaaaan','Mathura',1,'2017-07-12 03:40:41',15,'At Krishnanagar, near Govardhan chouraha,Mathura','Bhut acha h you can come an organise an event on same day wihin matter of few hours.','radhe radhe',7844624636,4,1,1,1,1,1,1,1,0,0,1,NULL,NULL,'Smoking and drinking striclty prohibhited.\r\nNon- veg not allowed on Tuesdys and Fridays.\r\nDJ and music available but with extra charges.'),(19,'jahan yahan resort','undefined',1,'2017-07-07 20:25:08',15,'sarakti buiding,Sarakti gali, chinchpokli,mathura','aaooooo yahaa aooooo','radhe radhe',5554548526,3,1,1,1,1,1,1,1,1,1,0,NULL,NULL,'No terms and conditions. Only happy event..'),(20,'my Resort','Mathura',1,'2017-07-07 20:23:45',15,'hme ni pta','hme ni pta','hme ni pta',7846215666,4,1,0,0,1,1,1,1,0,0,1,NULL,NULL,NULL),(21,'Brij Vasudha','Mathura',1,'2017-07-07 20:23:45',15,'Near Syndicate bank,oppsite sanghralaya, Mathura','nice place for your event. Beautiful view here.','radhe radhe',7486932125,4,1,1,0,0,1,1,1,0,1,0,NULL,NULL,'We dont have any terms and conditions. thank you'),(23,'Brij Vasudhaaaaaa','Mathura',1,'2017-07-12 03:57:16',15,'Near Govardhan Parikrama, at gokul dham chaouraha, Mathura','m bani teri radha','m bani teri radha',7486932125,3,0,1,0,0,1,1,1,1,1,1,NULL,NULL,'No terms and conditons'),(24,'Highway Resort','Mathura',2,'2017-07-08 07:22:25',4,'krishna nagar, Mathura','good palace','radhe radhe',565255004,4,1,1,1,1,0,0,0,0,1,1,NULL,NULL,'There must be 20% payment submitted before your event.'),(25,'Halllvine','Mathura',2,'2017-07-08 07:22:46',1,'In front of Yamuna ghat, Holi Gate Market, Mathura','One of the best resort of mathura and one of the finest','Lets have Fun',9455727394,5,1,0,1,0,0,1,1,1,0,1,44.5,44.5,'We take complete payment in advance.'),(26,'Wingston','Mathura',2,'2017-07-08 05:03:04',1,'Masani Chouraha,MATHURA ','Tasty food, helpful staff and better rooms','Hare Krishna',565255000,NULL,1,1,1,0,0,1,1,0,0,1,NULL,NULL,' '),(27,'Goverdhan Resort','Mathura',2,'2017-07-08 05:02:54',1,'Narholi Chauraha','','',562566464,NULL,1,1,1,0,1,0,0,0,0,0,NULL,NULL,'Located just 1.6 km from janambhumi,   provides a 24-hour front desk for the convenience of the guests. Free WiFi access  etc '),(28,'Brij Kanha','mathura',1,'2017-07-08 05:42:54',16,'238-jj mathura','a very good resort','nothing like anything',7415512544,NULL,1,0,0,1,0,0,0,1,0,0,NULL,NULL,'no liquor\r\nno non-veg'),(29,'Guru Kripa  Bhavan','Mathura',1,'2017-07-08 05:50:05',1,' Dholi Pyau Mathura',' Good Palace in Mathura','atithi devo bhava',565255823,NULL,1,1,1,0,1,1,1,0,0,0,NULL,NULL,'no liquor'),(30,'Brij Kahnayia','Mathura',1,'2017-07-08 08:05:42',3,'32554/jdhbd','A very good resort to have fun','nothing',12452556225,NULL,0,0,1,0,1,0,0,1,1,0,NULL,NULL,'not such restrictions'),(31,'Wingston Resort','Mathura',1,'2017-07-10 06:57:58',3,'Delhi-Masani Bypass Road | Link Road, Mathura 281001, India','We very well appreciate the expectations of people visiting Mathura. The Wingston Hotel, Mathura is fully equipped to live up to everyones expectations. A real representative of Mathura, every part and every aspect of Wingston Mathura is infused with splendor, luxury and spiritual air. Utmost care has been taken to standardize every aspect of the hotel with the best international standards. The luxurious bedrooms with elegant furnishings provide you a stay that you cherish in your memory for ever. The Wyanjan Dining Place, is a lovely cozy dining space having very intimate seating arrangement and creates a very comfortable friendly almosphere. Completely true to every sense of the term, which serves you with such delightfully delectable dishes, based on the most relishing cuisine of all the regions of India and all kinds of perfect continental cuisine. Special care is taken about the healty nourishment as well as taste of the meals creating the best homely ambience with exceptional personalized service. We appreciate your liking for keeping up your appearance and thats why we provide you World Class Salon services.','',9359530910,NULL,1,1,0,1,0,1,1,1,0,0,NULL,NULL,'According to government regulations, a valid Photo ID has to be carried by every person above the age of 18 staying at the hotel. The identification proofs accepted are Drivers License, Voters Card, Passport, Ration Card. Without valid ID the guest will not be allowed to check in.\r\n\r\nThe primary guest checking in to the hotel must be at least 18 years of age. Children accompanying adults must be between 1-12 years.\r\n\r\nThe inclusion of extra bed with a booking is facilitated with a folding cot or a mattress as an extra bed.\r\n\r\nEarly check-in or late check-out is subject to availability and may be chargeable by the hotel. The standard check-in time is 12 PM and the standard check-out time is 12 PM. After booking you will be sent an email confirmation with hotel phone number. You can contact the hotel directly for early check-in or late check-out.\r\n\r\nThe room tariff includes all taxes. The amount paid for the room does not include charges for optional services and facilities (such as room service, mini bar, snacks or telephone calls). These will be charged at the time of check-out.'),(32,'wesrtfgyhujikl','asdfghjkl',1,'2017-07-10 07:28:56',3,'sdfgbnm','awsedfgbsdfgbas\r\ndfghfg','iojueorejgosjtoe',8451968781,NULL,0,0,1,0,0,0,0,0,0,0,NULL,NULL,'dhwiofsiugsvoand f nfhwekf uw wifhwkf uwfwejhj'),(34,'wes','asdfghjkl',1,'2017-07-10 07:31:22',3,'sdfgbnm','awsedfgbsdfgbas\r\ndfghfg','iojueorejgosjtoe',8451968781,NULL,0,0,1,0,0,0,0,0,1,0,NULL,NULL,'dhwiofsiugsvoand f nfhwekf uw wifhwkf uwfwejhj'),(35,'asdfghjk','asdfghjk',0,'2017-07-10 07:34:12',3,'sdfghjk','scvbnm','fbhjkl',1234567890,NULL,0,0,0,0,0,0,0,0,0,0,NULL,NULL,'dfghj'),(37,'zxcvbnmasdfghj','asdfghjk',1,'2017-07-12 04:09:32',3,'sdfghjk','scvbnm','fbhjkl',1234567890,NULL,1,0,1,0,0,0,0,0,0,1,NULL,NULL,'dfghj'),(38,'asdfghjdecvbn','asdfghjk',1,'2017-07-12 03:41:10',3,'sdfghjk','scvbnm','fbhjkl',1234567890,NULL,1,0,1,0,0,0,0,0,0,1,NULL,NULL,'dfghj'),(39,'nimeshhhhhhh','asdfghjk',1,'2017-07-12 04:09:45',3,'sdfghjk','scvbnm','fbhjkl',1234567890,NULL,1,0,1,0,0,0,0,0,0,1,NULL,NULL,'dfghj'),(40,'nimeshjfjf','asdfghjk',1,'2017-07-12 04:09:52',3,'sdfghjk','scvbnm','fbhjkl',1234567890,NULL,1,0,1,0,0,0,0,0,0,1,NULL,NULL,'dfghj'),(41,'nimeshhjkgl','asdfghjk',1,'2017-07-12 04:09:39',3,'sdfghjk','scvbnm','fbhjkl',1234567890,NULL,1,0,1,0,0,0,0,0,0,1,NULL,NULL,'dfghj'),(42,'nimeshhhjlnjkmnj','asdfghjk',1,'2017-07-10 08:45:01',3,'sdfghjk','scvbnm','fbhjkl',1234567890,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,'dfghj'),(43,'Harshsdfghj','asdfghjk',1,'2017-07-12 03:53:47',3,'sdfghjk','scvbnm','fbhjkl',1234567890,NULL,1,0,1,0,0,0,0,0,0,1,NULL,NULL,'dfghj'),(44,'mnbvcxz','ghjk',1,'2017-07-12 03:51:03',3,'xcvhj','fghjk','vhjk',12345668422,NULL,0,1,0,0,0,0,1,0,0,1,NULL,NULL,'dsfgj'),(45,'mnbvcxzuu','ghjk',1,'2017-07-12 03:41:00',3,'xcvhj','fghjk','vhjk',12345668422,NULL,0,1,0,0,0,0,1,0,0,1,NULL,NULL,'dsfgj'),(46,'harshi','Mathura',1,'2017-07-12 03:40:51',3,'N-252, Aashiyana Colony, Lucknow','It^s the best place to go. It^s my favourite destination ever.','',78455931123,NULL,1,0,1,0,0,0,0,0,0,1,NULL,NULL,'No such restrictions.'),(47,'harshii','Mathura',1,'2017-07-11 18:37:10',3,'N-252, aashiyana colony,mathura','It^s best place. It^s my favorite destination.','',87452136933,NULL,0,0,1,0,0,0,0,0,0,1,NULL,NULL,'no such restrictions'),(48,'Hello','MAthura',1,'2017-07-12 04:09:14',3,'HEllo','You don^t want to become guilty of plagiarism by letting someone else^s words get inadvertently mixed in with your own. If you do feel the need to paste in a block of research while you^re writing, be sure to highlight the copied text in a different color so you can go back and remove or rewrite it entirely later.\r\nRead more at: https://www.brainyquote.com/quotes/keywords/text.html','hello^s',1234567892,NULL,0,1,1,0,0,0,1,0,0,1,NULL,NULL,'You don^t want to become guilty of plagiarism by letting someone else^s words get inadvertently mixed in with your own. If you do feel the need to paste in a block of research while you^re writing, be sure to highlight the copied text in a different color so you can go back and remove or rewrite it entirely later.\r\n'),(49,'asdfghj','sdfghj',1,'2017-07-12 06:47:48',3,'sdfghjk','sdfghjk','sdfghjk',1234567890,NULL,0,1,0,0,0,0,1,0,0,1,NULL,NULL,'asdfghjnbvcxzxhjkjhasdfvbnbvcxz'),(50,'abcd','Mathura',1,'2017-07-12 06:47:35',4,'dcfvgbnjmertyuiolcvbnm','wertyuisxdcfvgbnjmkzxcvbnm','sdfrgtyui',1837392919,NULL,1,1,1,1,0,0,1,0,1,1,NULL,NULL,'wertyukisdfgjkxc vbnm');
/*!40000 ALTER TABLE `resort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleid` int(10) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'customer'),(2,'owner'),(3,'admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `mno` bigint(15) DEFAULT NULL,
  `mail` varchar(70) DEFAULT NULL,
  `useraddress` varchar(100) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `city` varchar(20) DEFAULT NULL,
  `remove` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'divyansh',950641255,'divyansh@gmail.com','121-ad gko','meranamhochi','2017-07-06 15:03:37','gorakhpur',0),(2,'prashant',950641124,'prashant@gmail.com','121 krishnaNagar mtj','meranampintu','2017-07-06 15:03:37','Mathura',0),(3,'Nimesh',9506412475,'nimesh@gmail.com','127 aliganj lko','meranamnimesh','2017-07-06 15:03:37','lucknow',0),(4,'pratishtha',950641455,'pratishtha@gmail.com','1272 Htj','meranampari','2017-07-06 15:03:37','Hathras',0),(5,'Harshita',9506124725,'harshita@gmail.com','Ashiyana Colony lko','meranampogo','2017-07-06 15:03:37','Lucknow',0),(14,'PiyushSir',95061212480,'piyush@gmail.com','Krishananagar mtj','Piyush','2017-07-06 15:03:37','Mathura',0),(15,'Gaurav',9506721423,'gaurav@gmail.com','1489-78 allahabad','Gaurav','2017-07-06 15:03:37','Allahabad',0),(16,'Divyanshu',9558456836,'divyanshu@gmail.com','1df Banaras','Divyanshu','2017-07-06 15:03:37','Banaras',0),(17,'undefined',9558554536,'undefined','24 sector-c kursi road Lko','Manish','2017-07-08 09:31:06','Lucknow',1),(18,'Rishabh',9558555856,'rishabh@gmail.com','1024  kursi road knp','Rishabh','2017-07-06 15:03:37','Kanpur',0),(19,'Ashish',95585559788,'Ashish@gmail.com','Krishna nagar mtj','Ashish','2017-07-06 15:03:37','Mathura',0),(20,'Yash',9558555832,'Yash@gmail.com','Holy Gate mtj','yash','2017-07-07 04:39:43','Mathura',0),(21,'Divyansh  Gupta',9455727912,'div1@gmail.com','Glad Mathura','aaaaa','2017-07-07 04:39:43','Mathura',0),(22,'Tanya Agrawal',7500723909,'tanya@gmail.com','Sunsaan gali','tanya','2017-07-07 11:08:15','Etawa',1),(23,'megha zindabad',7843823214,'megha@rediff.com','sarakti gali sarakti building chinchpokli','megha','2017-07-07 04:39:43','Mathura',0),(24,'Dhinchak Pooja',8745236124,'pooja@gmail.com','dhik chik road dhinchak city , chinchpokli','123','2017-07-07 04:43:51','Mathura',0),(25,'Pintu Agrawal',9458463969,'pintu@gmail.com','Sunsaan gali','pintu','2017-07-07 04:46:01','Mathura',0),(26,'Johnyy baba',8547426215,'john@gmail.com','vishakhapatnam','12','2017-07-07 04:48:14','vishakhapatnam',0),(27,'nimesh',7845120521,'bauwa@gmail.com','chicnhcpokli','','2017-07-07 09:36:11',NULL,NULL),(28,'Pratishtha Dixit',7055280280,'pratishtha.dixit_cs15@gla.ac.in','Hathras','abcd','2017-07-07 10:34:54','Hathras',0),(29,'dfgjk',23456789,'dcfvbgnj@gmail.com','wertyuisdfgjk','','2017-07-08 05:32:38',NULL,NULL),(30,'dfgjk',12346789,'sdfgjk@gmail.com','wertyuidfgjk','','2017-07-08 05:36:37',NULL,NULL),(31,'nimesh',950641124,'meranamnimesh','rtyufvg','','2017-07-08 05:44:20',NULL,NULL),(33,'singh gaurav',1111111111,'shubham@gla.ac.in','fghjkl','1111111111','2017-07-08 08:31:23','mathura',0),(34,'Div Gupta',9856565656,'d22@gmail.com','d22@gmail.com','22222','2017-07-08 09:31:24','Mathura',1),(35,'harsh sharma',9506797355,'harsh1@gmail.com','2365/lko','harsh','2017-07-08 08:39:12','Lucknow',0),(36,'piyush khnadelwal',1234567890,'sdfghj@gmail.com','dfgh','123456789','2017-07-08 09:31:41','fghj',1),(37,'Manish Rana',1234567890,'manish@gmail.com','23/xcvbnm','1234567890','2017-07-08 09:00:53','xcvbnm',0),(38,'gau sk',8400000000,'g@mail.com','sjm','1111111111','2017-07-08 09:31:55','s',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userrole` (
  `roleid` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  KEY `fk_role` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (2,1),(2,4),(3,2),(2,3),(1,5),(3,14),(2,15),(2,16),(2,17),(2,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(3,25),(1,26),(1,28),(1,32),(1,33),(1,34),(1,35),(1,36),(1,37),(1,38);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-13 10:04:09

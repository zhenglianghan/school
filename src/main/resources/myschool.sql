-- MySQL dump 10.16  Distrib 10.2.13-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: myschool
-- ------------------------------------------------------
-- Server version	10.2.13-MariaDB

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creatTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `updateTime` datetime DEFAULT NULL,
  `grade_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8kqb1g3amrdpganapfoqw5wgs` (`grade_id`),
  KEY `FKqwmcv0fcio215pf0ypi6ft96x` (`teacher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,NULL,'11',NULL,111,'English',0,NULL,1,2,NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_file`
--

DROP TABLE IF EXISTS `course_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `courseUnit_id` int(11) DEFAULT NULL,
  `size` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtgjh9tq4n408uwoi5xttcgne9` (`courseUnit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_file`
--

LOCK TABLES `course_file` WRITE;
/*!40000 ALTER TABLE `course_file` DISABLE KEYS */;
INSERT INTO `course_file` VALUES (28,1,0,NULL,'2','/upload/1522127801359.png',1,1.09),(32,1,0,'2018-03-28 07:04:38','qwer','/upload/1522191878925.png',1,1.09);
/*!40000 ALTER TABLE `course_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_unit`
--

DROP TABLE IF EXISTS `course_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text DEFAULT 'NULL',
  `spendTime` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqx9j2vqcpjecnjw9rgv5x0byl` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_unit`
--

LOCK TABLES `course_unit` WRITE;
/*!40000 ALTER TABLE `course_unit` DISABLE KEYS */;
INSERT INTO `course_unit` VALUES (1,'124','124','124',NULL,1,NULL);
/*!40000 ALTER TABLE `course_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `beginTime` datetime DEFAULT NULL,
  `courseId` int(11) NOT NULL,
  `endTime` datetime DEFAULT NULL,
  `percent` double NOT NULL,
  `score` double NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (2,NULL,1,NULL,12,0,'121',0),(3,NULL,1,NULL,22,0,'22',0);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examId` int(11) NOT NULL,
  `itemScore` double NOT NULL,
  `questionId` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES (2,2,0,2,0),(3,3,100,2,0),(4,3,100,3,0),(5,3,11,4,0);
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_result`
--

DROP TABLE IF EXISTS `exam_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL,
  `score` double NOT NULL,
  `status` int(11) NOT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmblvyjlk9x7rrm7mvqtbedycc` (`exam_id`),
  KEY `FK9l2eacpio7fo7sa8wy4clxf1r` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result`
--

LOCK TABLES `exam_result` WRITE;
/*!40000 ALTER TABLE `exam_result` DISABLE KEYS */;
INSERT INTO `exam_result` VALUES (3,1,18,2,'2018-03-29 01:06:09',1,3),(6,1,0,1,'2018-03-29 01:26:01',1,2),(8,1,0,2,'2018-03-29 03:29:42',1,3),(9,1,0,1,'2018-03-29 03:29:47',1,3);
/*!40000 ALTER TABLE `exam_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_result_question`
--

DROP TABLE IF EXISTS `exam_result_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_result_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `isRight` bit(1) DEFAULT NULL,
  `itemScore` double NOT NULL,
  `user_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `examResult_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7hfn092wpha52p28inq34i1xk` (`exam_id`),
  KEY `FKmqky74grastjnrhv0fqx7u784` (`examResult_id`),
  KEY `FKsbejvkmejga9gx8m6hdidiox5` (`question_id`),
  KEY `FK97sl59pefq1iog0oox8jurvis` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result_question`
--

LOCK TABLES `exam_result_question` WRITE;
/*!40000 ALTER TABLE `exam_result_question` DISABLE KEYS */;
INSERT INTO `exam_result_question` VALUES (1,'B','\0',0,1,3,1,2),(2,'A','\0',0,1,3,1,3),(3,'333',NULL,0,1,3,1,4),(4,'A','',0,1,3,2,2),(5,'B','',0,1,3,2,3),(6,'11',NULL,0,1,3,2,4),(7,'D','\0',0,1,3,3,2),(8,'C','\0',0,1,3,3,3),(9,'22',NULL,0,1,3,3,4),(10,'D','\0',0,1,2,4,2),(11,'A','',0,1,2,5,2),(12,'A','',0,1,2,6,2),(13,'A','',0,1,3,7,2),(14,'B','',0,1,3,7,3),(15,'2',NULL,0,1,3,7,4);
/*!40000 ALTER TABLE `exam_result_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creatTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `gradeName` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,NULL,NULL,NULL,'grade9',NULL),(2,NULL,NULL,NULL,'grade10',NULL),(3,NULL,NULL,NULL,'grade11',NULL);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg`
--

DROP TABLE IF EXISTS `msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text DEFAULT 'NULL',
  `createTime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7872if9jwy25tb0k4d6c8emo1` (`receiver_id`),
  KEY `FKqhu21brep39wplrramgxvl6gc` (`sender_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg`
--

LOCK TABLES `msg` WRITE;
/*!40000 ALTER TABLE `msg` DISABLE KEYS */;
INSERT INTO `msg` VALUES (1,'                      \r\n                      <h1><u>Heading Of Message</u></h1>\r\n                      <h4>Subheading</h4>\r\n                      <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain\r\n                        was born and I will give you a complete account of the system, and expound the actual teachings\r\n                        of the great explorer of the truth, the master-builder of human happiness. No one rejects,\r\n                        dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know\r\n                        how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again\r\n                        is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain,\r\n                        but because occasionally circumstances occur in which toil and pain can procure him some great\r\n                        pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise,\r\n                        except to obtain some advantage from it? But who has any right to find fault with a man who\r\n                        chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that\r\n                        produces no resultant pleasure? On the other hand, we denounce with righteous indignation and\r\n                        dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so\r\n                        blinded by desire, that they cannot foresee</p>\r\n                      <ul>\r\n                        <li>List item one</li>\r\n                        <li>List item two</li>\r\n                        <li>List item three</li>\r\n                        <li>List item four</li>\r\n                      </ul>\r\n                      <p>Thank you,</p>\r\n                      <p>John Doe</p>\r\n                    ','2018-03-30 00:32:05',0,'11144',1,1),(2,'                      \r\n\r\n                    414141241414','2018-03-30 00:42:48',0,'1144',1,1);
/*!40000 ALTER TABLE `msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `courseId` int(11) NOT NULL,
  `creatTime` datetime DEFAULT NULL,
  `optiona` varchar(255) DEFAULT NULL,
  `optionb` varchar(255) DEFAULT NULL,
  `optionc` varchar(255) DEFAULT NULL,
  `optiond` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `courseUnit_id` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd7jkggq0m2c41vk9fabrhx9bg` (`courseUnit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (2,'A',1,NULL,'13','13','33','33',NULL,'122',1,1,NULL),(3,'A',1,NULL,'134','333','333','333',NULL,'222',1,1,NULL),(4,'adfd',1,NULL,NULL,NULL,NULL,NULL,NULL,'333',2,1,NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `creatTime` datetime DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `msgNum` int(11) DEFAULT 0,
  `password` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT 0,
  `sex` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `updateTime` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,'111@gmail.com',NULL,NULL,NULL,0,'111',NULL,NULL,NULL,1,0,1,NULL,'111@gmail.com',NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,'222@gmail.com',NULL,NULL,NULL,0,'222',NULL,NULL,NULL,2,0,1,NULL,'222@gmail.com',NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,'333@gmail.com',NULL,NULL,NULL,0,'333',NULL,NULL,NULL,3,0,1,NULL,'333@gmail.com',NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,0,1,NULL,NULL,NULL),(5,'1',NULL,NULL,'','2018-03-22 20:20:36',NULL,'444@gmail.com',NULL,NULL,'444',0,NULL,NULL,'1',NULL,1,1,0,NULL,'444',NULL),(6,NULL,NULL,NULL,NULL,NULL,NULL,'555@gmail.com',NULL,NULL,NULL,0,'555',NULL,NULL,NULL,1,0,0,NULL,'555@gmail.com','2018-03-24 15:43:58');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_course`
--

DROP TABLE IF EXISTS `user_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_course`
--

LOCK TABLES `user_course` WRITE;
/*!40000 ALTER TABLE `user_course` DISABLE KEYS */;
INSERT INTO `user_course` VALUES (1,1,2),(3,1,1);
/*!40000 ALTER TABLE `user_course` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-30  9:12:12

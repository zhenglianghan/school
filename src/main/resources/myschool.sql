-- MySQL dump 10.16  Distrib 10.2.14-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: myschool
-- ------------------------------------------------------
-- Server version	10.2.14-MariaDB

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
  `description` varchar(600) DEFAULT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (10,'Python  is an object-oriented interpretive computer programming language. It was invented by the Dutch Guido van Rossum in 1989 and the first public release was issued in 1991.',NULL,60,'Python',0,NULL,1,2,NULL),(11,'C++ is the inheritance of the C language, which can not only carry out the process programming of the C language, but also carry out the object based program design characterized by the abstract data type, and can also carry out the object-oriented programming with the characteristics of inheritance and polymorphism.',NULL,70,'C++',0,NULL,1,2,NULL),(12,'Java is an object oriented programming language, which not only absorbs the various advantages of the C++ language, but also abandons the concepts of multiple inheritance and pointer, which is difficult to understand in C++. So the Java language has two features, which are powerful and easy to use. The Java language, as a representative of the static object-oriented programming language, is an excellent implementation of object-oriented theory, allowing programmers to perform complex programming in an elegant way of thinking.',NULL,50,'Java',0,NULL,1,16,NULL),(14,'This is C# description',NULL,50,'C#',0,NULL,2,2,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_file`
--

LOCK TABLES `course_file` WRITE;
/*!40000 ALTER TABLE `course_file` DISABLE KEYS */;
INSERT INTO `course_file` VALUES (41,11,0,'2018-04-08 18:46:08','file1','/upload/1523184367657.docx',12,0.01),(42,12,0,'2018-04-09 12:02:04','1','/school/upload/1523246524772.docx',14,0.01),(43,11,0,'2018-05-29 14:08:55','1','/upload/1527574135109.jpg',12,0.04),(44,11,0,'2018-06-07 11:23:25','2','/upload/1528341805206.jpg',12,0.04),(45,11,0,'2018-06-07 11:23:49','4','/upload/1528341829529.pdf',12,3.92),(46,11,0,'2018-06-07 15:23:19','3','/upload/1528356199273.docx',13,0.03);
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
  `description` text DEFAULT NULL,
  `spendTime` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqx9j2vqcpjecnjw9rgv5x0byl` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_unit`
--

LOCK TABLES `course_unit` WRITE;
/*!40000 ALTER TABLE `course_unit` DISABLE KEYS */;
INSERT INTO `course_unit` VALUES (11,'<p>55</p>\r\n','55.0','55',NULL,9,NULL,1),(12,'<p>In the mid 1970s, Bjarne Stroustrup worked in the computer center of University of Cambridge. He has used Simula and ALGOL, and has been in contact with C.</p>\r\n','2.0','Unit 1   C++ knowledge point',NULL,11,NULL,1),(13,'<p>In object oriented programming, functions of data and lawful operation of data are encapsulated together as a class definition. The object is described as a variable with a given class. The objects of each given class contain some private members, public members and protection members specified by this class. Once a well defined class is established, it can be regarded as a fully encapsulated entity, and can be used as a whole unit.</p>\r\n','4.0','Unit 2 A simple output program',NULL,11,NULL,2),(38,'<p>2</p>\r\n','2.0','2','2018-06-02 19:54:55',14,'2018-06-02 19:54:55',1),(40,'<p>tr</p>\r\n',NULL,'fhd','2018-06-04 14:40:11',14,'2018-06-04 14:40:11',2);
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
  `createTime` datetime DEFAULT NULL,
  `time` double DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (63,NULL,11,'2018-06-07 00:00:00',1,0,'1',0,'2018-06-07 10:04:46',1,0),(61,NULL,11,'2018-06-13 00:00:00',1,0,'sadf',0,'2018-06-04 17:41:45',1,0),(62,NULL,14,'2018-06-07 00:00:00',1,0,'1',0,'2018-06-07 10:03:11',1,0),(64,NULL,11,'2018-06-08 00:00:00',1,0,'1',0,'2018-06-07 10:27:21',1,0);
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
  `sort` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhence37m8dce4mwluboy8vabx` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES (95,61,50,0,24),(94,61,50,0,21),(96,62,100,0,26),(97,63,100,0,21),(98,64,100,0,21);
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
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result`
--

LOCK TABLES `exam_result` WRITE;
/*!40000 ALTER TABLE `exam_result` DISABLE KEYS */;
INSERT INTO `exam_result` VALUES (68,11,0,1,'2018-06-04 17:43:29',6,61);
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
  `comment` varbinary(999) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7hfn092wpha52p28inq34i1xk` (`exam_id`),
  KEY `FKmqky74grastjnrhv0fqx7u784` (`examResult_id`),
  KEY `FKsbejvkmejga9gx8m6hdidiox5` (`question_id`),
  KEY `FK97sl59pefq1iog0oox8jurvis` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result_question`
--

LOCK TABLES `exam_result_question` WRITE;
/*!40000 ALTER TABLE `exam_result_question` DISABLE KEYS */;
INSERT INTO `exam_result_question` VALUES (86,'',NULL,0,6,61,68,24,NULL),(85,NULL,'\0',0,6,61,68,21,NULL);
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
  `content` text DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7872if9jwy25tb0k4d6c8emo1` (`receiver_id`),
  KEY `FKqhu21brep39wplrramgxvl6gc` (`sender_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg`
--

LOCK TABLES `msg` WRITE;
/*!40000 ALTER TABLE `msg` DISABLE KEYS */;
INSERT INTO `msg` VALUES (7,'    11','2018-05-29 08:54:54',0,'1144',17,2),(8,'    1','2018-06-03 10:53:19',0,'1',16,2),(9,'    1','2018-06-03 10:53:40',0,'1',6,2),(10,'    1','2018-06-04 17:28:07',0,'1',2,2),(11,'    1','2018-06-07 09:38:20',0,'1',NULL,2),(12,'    1','2018-06-07 09:41:33',0,'1',NULL,2),(13,'    2','2018-06-07 15:21:38',0,'1',NULL,2);
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
  `status` int(11) DEFAULT 0 COMMENT '0为正常，1为删除',
  PRIMARY KEY (`id`),
  KEY `FKd7jkggq0m2c41vk9fabrhx9bg` (`courseUnit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (21,'A',11,NULL,'Bjame Sgoustrup','Tom','Jack','God',NULL,'<p>Who invented C++?</p>\r\n',1,12,NULL,0),(22,'B',11,NULL,'1800','1983','2018','2017',NULL,'<p>When was the C++ invented</p>\r\n',1,12,NULL,0),(23,'<p>He can say any IDE</p>\r\n',11,NULL,NULL,NULL,NULL,NULL,NULL,'<p>Which IDE is your favourite?</p>\r\n',2,13,NULL,0),(24,'<p>any answer is ok</p>\r\n',11,NULL,NULL,NULL,NULL,NULL,NULL,'<p>What do you think of the development of C++?</p>\r\n',2,12,NULL,0),(26,'A',14,NULL,'1','1','1','1',NULL,'<p>1</p>\r\n',1,38,NULL,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (3,NULL,NULL,NULL,NULL,NULL,NULL,'Admin@gmail.com',NULL,NULL,NULL,0,'b2d59514ca0e0e39ee0adfb2fb7f19e8',NULL,NULL,NULL,3,0,1,NULL,'Admin',NULL),(6,'',NULL,NULL,'',NULL,NULL,'Tom@gmail.com','tom','zhang','',0,'cd73502828457d15655bbd7a63fb0bc8','/school/upload/1523256713362.jpg','',NULL,1,1,0,NULL,'Tom','2018-03-24 15:43:58'),(2,'11',NULL,NULL,'11',NULL,NULL,'Jack@gmail.com','111','111','151515',0,'8d788385431273d11e8b43bb78f3aa41','/school/upload/1523255881276.jpg','11',NULL,2,1,1,NULL,'Jack',NULL),(17,'Wuhan',NULL,NULL,'China',NULL,NULL,'Tom2@gmail.com',NULL,NULL,'156478945',0,'cd73502828457d15655bbd7a63fb0bc8',NULL,'430200',NULL,1,1,0,NULL,'Tom2','2018-04-08 17:39:54'),(16,'Beijing',NULL,NULL,NULL,NULL,NULL,'Jack2@gmail.com',NULL,NULL,'15826547894',0,'8d788385431273d11e8b43bb78f3aa41',NULL,NULL,NULL,2,1,0,NULL,'Jack2','2018-04-08 17:33:13');
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
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_course`
--

LOCK TABLES `user_course` WRITE;
/*!40000 ALTER TABLE `user_course` DISABLE KEYS */;
INSERT INTO `user_course` VALUES (22,10,2),(23,11,2),(24,12,16),(26,14,2),(27,11,6),(28,12,6);
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

-- Dump completed on 2018-06-08 11:22:08

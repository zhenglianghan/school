/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50634
Source Host           : localhost:3306
Source Database       : school

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2018-10-17 16:28:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('11', 'Python  is an object-oriented interpretive computer programming language. It was invented by the Dutch Guido van Rossum in 1989 and the first public release was issued in 1991.', null, '60', 'Python', '0', null, '1', '2', null);
INSERT INTO `course` VALUES ('13', 'C++ is the inheritance of the C language, which can not only carry out the process programming of the C language, but also carry out the object based program design characterized by the abstract data type, and can also carry out the object-oriented programming with the characteristics of inheritance and polymorphism.', null, '70', 'C++', '0', null, '1', '2', null);
INSERT INTO `course` VALUES ('12', 'Java is an object oriented programming language, which not only absorbs the various advantages of the C++ language, but also abandons the concepts of multiple inheritance and pointer, which is difficult to understand in C++. So the Java language has two features, which are powerful and easy to use. The Java language, as a representative of the static object-oriented programming language, is an excellent implementation of object-oriented theory, allowing programmers to perform complex programming in an elegant way of thinking.', null, '50', 'Java', '0', null, '1', '16', null);
INSERT INTO `course` VALUES ('14', 'This is C# description', null, '50', 'C#', '0', null, '2', '2', null);
INSERT INTO `course` VALUES ('15', '666', null, '100', 'NetWork Engineer', '0', null, '2', '2', null);

-- ----------------------------
-- Table structure for `course_file`
-- ----------------------------
DROP TABLE IF EXISTS `course_file`;
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
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_file
-- ----------------------------
INSERT INTO `course_file` VALUES ('42', '13', '0', '2018-04-09 12:02:04', '1', '/school/upload/1523246524772.docx', '14', '0.01');
INSERT INTO `course_file` VALUES ('65', '13', '0', '2018-10-13 20:15:42', 'Last', '/upload/1539432942476.ppt', '42', '0.2');
INSERT INTO `course_file` VALUES ('64', '13', '0', '2018-10-13 20:15:21', 'A little test', '/upload/1539432920554.ppt', '13', '0.63');
INSERT INTO `course_file` VALUES ('59', '13', '0', '2018-10-12 23:04:32', 'Task 1', '/upload/1539356672002.pdf', '38', '1.37');
INSERT INTO `course_file` VALUES ('63', '13', '0', '2018-10-13 20:14:47', 'C++ introduction', '/upload/1539432887346.pdf', '12', '1.82');
INSERT INTO `course_file` VALUES ('66', '15', '0', '2018-10-16 23:02:57', 'The first File', '/upload/1539702177158.pdf', '44', '1.82');
INSERT INTO `course_file` VALUES ('67', '15', '0', '2018-10-16 23:03:28', 'The second File', '/upload/1539702207604.net.png', '44', '0');
INSERT INTO `course_file` VALUES ('68', '15', '0', '2018-10-16 23:03:50', 'The third File', '/upload/1539702229991.net.png', '44', '0');
INSERT INTO `course_file` VALUES ('69', '15', '0', '2018-10-16 23:04:13', 'OK', '/upload/1539702253151.png', '45', '0.01');

-- ----------------------------
-- Table structure for `course_unit`
-- ----------------------------
DROP TABLE IF EXISTS `course_unit`;
CREATE TABLE `course_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `spendTime` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqx9j2vqcpjecnjw9rgv5x0byl` (`course_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_unit
-- ----------------------------
INSERT INTO `course_unit` VALUES ('38', '<p>Some introductions about C#</p>\r\n', '1.0', 'C# introduction', '2018-10-12 22:55:06', '13', '2018-06-02 19:54:55', '1');
INSERT INTO `course_unit` VALUES ('40', '<p>Null</p>\r\n', '2.0', 'A little test', '2018-10-12 22:54:15', '13', '2018-06-04 14:40:11', '4');
INSERT INTO `course_unit` VALUES ('42', '<p>About&nbsp; C++</p>\r\n', '1.0', 'Unit 3', '2018-10-13 15:16:06', '13', '2018-10-13 15:16:06', '6');
INSERT INTO `course_unit` VALUES ('43', '', '1.0', 'AAA', '2018-10-16 15:09:04', '13', '2018-10-16 15:09:04', '5');
INSERT INTO `course_unit` VALUES ('44', '<p>IP Address&nbsp; &#39;s description</p>\r\n', '2.0', 'IP Address', '2018-10-16 23:00:51', '15', '2018-10-16 23:00:51', '1');
INSERT INTO `course_unit` VALUES ('45', '<p>some description</p>\r\n', '1.0', 'ARP', '2018-10-16 23:01:21', '15', '2018-10-16 23:01:21', '2');
INSERT INTO `course_unit` VALUES ('46', '<p>descriptions</p>\r\n', '2.0', 'UDP  ', '2018-10-16 23:02:08', '15', '2018-10-16 23:02:08', '3');

-- ----------------------------
-- Table structure for `exam`
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
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
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('69', null, '11', '2018-06-23 00:00:00', '5', '0', '1217', '0', '2018-06-10 12:17:25', '45', '0');
INSERT INTO `exam` VALUES ('61', null, '11', '2018-06-09 00:00:00', '1', '0', 'sadf', '0', '2018-06-04 17:41:45', '1', '0');
INSERT INTO `exam` VALUES ('62', null, '14', '2018-06-07 00:00:00', '1', '0', '1', '0', '2018-06-07 10:03:11', '1', '0');
INSERT INTO `exam` VALUES ('64', null, '11', '2018-06-11 00:00:00', '1', '0', '1', '0', '2018-06-07 10:27:21', '1', '0');
INSERT INTO `exam` VALUES ('65', null, '0', '2018-06-22 00:00:00', '1', '0', '1', '0', null, null, '0');
INSERT INTO `exam` VALUES ('66', null, '0', '2018-06-22 00:00:00', '1', '0', '1', '0', null, null, '0');
INSERT INTO `exam` VALUES ('68', null, '11', '2018-06-14 00:00:00', '5', '0', '1139', '0', '2018-06-10 11:40:10', '45', '0');

-- ----------------------------
-- Table structure for `exam_question`
-- ----------------------------
DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examId` int(11) NOT NULL,
  `itemScore` double NOT NULL,
  `sort` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhence37m8dce4mwluboy8vabx` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_question
-- ----------------------------
INSERT INTO `exam_question` VALUES ('95', '61', '50', '0', '24');
INSERT INTO `exam_question` VALUES ('94', '61', '50', '0', '21');
INSERT INTO `exam_question` VALUES ('96', '62', '100', '0', '26');
INSERT INTO `exam_question` VALUES ('98', '64', '100', '0', '21');
INSERT INTO `exam_question` VALUES ('100', '68', '100', '0', '21');
INSERT INTO `exam_question` VALUES ('101', '69', '50', '0', '21');
INSERT INTO `exam_question` VALUES ('102', '69', '50', '0', '23');

-- ----------------------------
-- Table structure for `exam_result`
-- ----------------------------
DROP TABLE IF EXISTS `exam_result`;
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
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_result
-- ----------------------------
INSERT INTO `exam_result` VALUES ('68', '11', '2', '2', '2018-06-04 17:43:29', '6', '61');
INSERT INTO `exam_result` VALUES ('69', '11', '0', '1', '2018-06-10 11:38:59', '6', '64');
INSERT INTO `exam_result` VALUES ('70', '11', '20', '2', '2018-06-10 12:17:52', '6', '69');

-- ----------------------------
-- Table structure for `exam_result_question`
-- ----------------------------
DROP TABLE IF EXISTS `exam_result_question`;
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
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exam_result_question
-- ----------------------------
INSERT INTO `exam_result_question` VALUES ('86', '', null, '2', '6', '61', '68', '24', 0x7665727920676F6F64);
INSERT INTO `exam_result_question` VALUES ('85', null, '', '0', '6', '61', '68', '21', null);
INSERT INTO `exam_result_question` VALUES ('87', null, '', '0', '6', '64', '69', '21', null);
INSERT INTO `exam_result_question` VALUES ('88', 'B', null, '0', '6', '69', '70', '21', null);
INSERT INTO `exam_result_question` VALUES ('89', '<p>12</p>\r\n', null, '20', '6', '69', '70', '23', 0x7665727920766572792076657279207665727920766572792076657279207665727920766572792076657279207665727920766572792076657279207665727920766572792076657279207665727920766572792076657279207665727920766572792076657279207665727920766572792076657279207665727920766572792076657279207665727920766572792076657279207665727920766572792076657279207665727920766572792076657279207665727920766572792076657279207665727920766572792020676F6F64);

-- ----------------------------
-- Table structure for `file_time`
-- ----------------------------
DROP TABLE IF EXISTS `file_time`;
CREATE TABLE `file_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `unitId` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `second` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_time
-- ----------------------------
INSERT INTO `file_time` VALUES ('1', '6', '44', '0', '0');
INSERT INTO `file_time` VALUES ('2', '6', '45', '0', '0');
INSERT INTO `file_time` VALUES ('3', '6', '46', '0', '0');

-- ----------------------------
-- Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creatTime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `gradeName` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('1', null, null, null, 'grade9', null);
INSERT INTO `grade` VALUES ('2', null, null, null, 'grade10', null);
INSERT INTO `grade` VALUES ('3', null, null, null, 'grade11', null);

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `role` varchar(11) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT NULL,
  `logoutTime` timestamp NULL DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('8', 'Tom', 'student', '2018-10-09 20:00:40', '2018-10-09 20:03:52', '0h3min');
INSERT INTO `log` VALUES ('9', 'Jack', 'teacher', '2018-10-09 20:03:58', '2018-10-09 20:17:28', '0h13min');
INSERT INTO `log` VALUES ('10', 'Jack', 'teacher', '2018-10-12 22:52:12', '2018-10-12 23:05:51', '0h 13min');
INSERT INTO `log` VALUES ('11', 'Tom', 'student', '2018-10-12 23:05:56', '2018-10-12 23:10:18', '0h 4min');
INSERT INTO `log` VALUES ('12', 'Jack', 'teacher', '2018-10-12 23:10:22', '2018-10-12 23:26:02', '0h 15min');
INSERT INTO `log` VALUES ('13', 'Jack', 'teacher', '2018-10-12 23:14:06', '2018-10-12 23:56:41', '0h 42min');
INSERT INTO `log` VALUES ('14', 'Tom', 'student', '2018-10-12 23:27:11', '2018-10-13 00:10:42', '0h 43min');
INSERT INTO `log` VALUES ('15', 'Jack', 'teacher', '2018-10-13 14:56:34', '2018-10-13 15:00:12', '0h 3min');
INSERT INTO `log` VALUES ('16', 'Jack', 'teacher', '2018-10-13 15:14:19', '2018-10-13 15:17:04', '0h 2min');
INSERT INTO `log` VALUES ('17', 'Tom', 'student', '2018-10-13 15:17:08', '2018-10-13 15:44:31', '0h 27min');
INSERT INTO `log` VALUES ('18', 'Tom', 'student', '2018-10-13 19:11:11', '2018-10-13 19:53:49', '0h 42min');
INSERT INTO `log` VALUES ('19', 'Tom', 'student', '2018-10-13 20:12:36', '2018-10-13 20:12:44', '0h 0min');
INSERT INTO `log` VALUES ('20', 'Jack', 'teacher', '2018-10-13 20:13:31', '2018-10-13 20:16:21', '0h 2min');
INSERT INTO `log` VALUES ('21', 'Tom', 'student', '2018-10-13 20:16:26', '2018-10-13 20:46:52', '0h 30min');
INSERT INTO `log` VALUES ('22', 'Tom', 'student', '2018-10-16 15:01:49', '2018-10-16 15:07:21', '0h 5min');
INSERT INTO `log` VALUES ('23', 'Jack', 'teacher', '2018-10-16 15:07:27', '2018-10-16 15:38:40', '0h 31min');
INSERT INTO `log` VALUES ('24', 'Tom', 'student', '2018-10-16 15:38:45', '2018-10-16 16:09:13', '0h 30min');
INSERT INTO `log` VALUES ('25', 'Tom', 'student', '2018-10-16 16:47:49', '2018-10-16 16:52:07', '0h 4min');
INSERT INTO `log` VALUES ('26', 'Tom', 'student', '2018-10-16 16:52:10', '2018-10-16 17:05:31', '0h 13min');
INSERT INTO `log` VALUES ('27', 'Tom', 'student', '2018-10-16 22:38:35', '2018-10-16 22:45:45', '0h 7min');
INSERT INTO `log` VALUES ('28', 'Tom', 'student', '2018-10-16 22:45:49', '2018-10-16 22:47:58', '0h 2min');
INSERT INTO `log` VALUES ('29', 'Jack', 'teacher', '2018-10-16 22:48:04', '2018-10-16 22:48:57', '0h 0min');
INSERT INTO `log` VALUES ('30', 'Jack', 'teacher', '2018-10-16 22:49:46', '2018-10-16 22:58:01', '0h 8min');
INSERT INTO `log` VALUES ('31', 'Jack', 'teacher', '2018-10-16 22:59:38', '2018-10-16 23:04:18', '0h 4min');
INSERT INTO `log` VALUES ('32', 'Tom', 'student', '2018-10-16 23:04:23', '2018-10-16 23:04:45', '0h 0min');
INSERT INTO `log` VALUES ('33', 'Jack', 'teacher', '2018-10-16 23:05:13', '2018-10-16 23:05:55', '0h 0min');
INSERT INTO `log` VALUES ('34', 'Tom', 'student', '2018-10-16 23:05:59', '2018-10-16 23:54:22', '0h 48min');
INSERT INTO `log` VALUES ('35', 'Jack', 'teacher', '2018-10-17 09:53:35', '2018-10-17 09:53:38', '0h 0min');
INSERT INTO `log` VALUES ('36', 'Tom', 'student', '2018-10-17 10:13:45', '2018-10-17 10:45:11', '0h 31min');
INSERT INTO `log` VALUES ('37', 'Tom', 'student', '2018-10-17 10:40:33', '2018-10-17 11:11:13', '0h 30min');

-- ----------------------------
-- Table structure for `msg`
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `createTime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7872if9jwy25tb0k4d6c8emo1` (`receiver_id`),
  KEY `FKqhu21brep39wplrramgxvl6gc` (`sender_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES ('7', '    11', '2018-05-29 08:54:54', '0', '1144', '17', '2');
INSERT INTO `msg` VALUES ('8', '    1', '2018-06-03 10:53:19', '0', '1', '16', '2');
INSERT INTO `msg` VALUES ('9', '    1', '2018-06-03 10:53:40', '0', '1', '6', '2');
INSERT INTO `msg` VALUES ('10', '    1', '2018-06-04 17:28:07', '0', '1', '2', '2');
INSERT INTO `msg` VALUES ('11', '    1', '2018-06-07 09:38:20', '0', '1', null, '2');
INSERT INTO `msg` VALUES ('12', '    1', '2018-06-07 09:41:33', '0', '1', null, '2');
INSERT INTO `msg` VALUES ('13', '    2', '2018-06-07 15:21:38', '0', '1', null, '2');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
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
  `status` int(11) DEFAULT '0' COMMENT '0为正常，1为删除',
  PRIMARY KEY (`id`),
  KEY `FKd7jkggq0m2c41vk9fabrhx9bg` (`courseUnit_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('21', 'A', '11', null, 'Bjame Sgoustrup', 'Tom', 'Jack', 'God', null, '<p>Who invented C++?</p>\r\n', '1', '12', null, '0');
INSERT INTO `question` VALUES ('22', 'B', '11', null, '1800', '1983', '2018', '2017', null, '<p>When was the C++ invented</p>\r\n', '1', '12', null, '0');
INSERT INTO `question` VALUES ('23', '<p>He can say any IDE</p>\r\n', '11', null, null, null, null, null, null, '<p>Which IDE is your favourite?</p>\r\n', '2', '13', null, '0');
INSERT INTO `question` VALUES ('24', '<p>any answer is ok</p>\r\n', '11', null, null, null, null, null, null, '<p>What do you think of the development of C++?</p>\r\n', '2', '12', null, '0');
INSERT INTO `question` VALUES ('26', 'A', '14', null, '1', '1', '1', '1', null, '<p>1</p>\r\n', '1', '38', null, '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
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
  `msgNum` int(11) DEFAULT '0',
  `password` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT '0',
  `sex` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `updateTime` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', null, null, null, null, null, null, 'Admin@gmail.com', null, null, null, '0', 'b2d59514ca0e0e39ee0adfb2fb7f19e8', null, null, null, '3', '0', '1', null, 'Admin', null);
INSERT INTO `user` VALUES ('6', '', null, null, '', null, null, 'Tom@gmail.com', 'tom', 'zhang', '', '0', 'cd73502828457d15655bbd7a63fb0bc8', '/upload/1539356982113.png', '', null, '1', '1', '0', null, 'Tom', '2018-03-24 15:43:58');
INSERT INTO `user` VALUES ('2', '11', null, null, '11', null, null, 'Jack@gmail.com', '111', '111', '151515', '0', '8d788385431273d11e8b43bb78f3aa41', '/upload/1539356146823.png', '11', null, '2', '1', '1', null, 'Jack', null);
INSERT INTO `user` VALUES ('17', 'Wuhan', null, null, 'China', null, null, 'Tom2@gmail.com', null, null, '156478945', '0', 'cd73502828457d15655bbd7a63fb0bc8', null, '430200', null, '1', '1', '0', null, 'Tom2', '2018-04-08 17:39:54');
INSERT INTO `user` VALUES ('16', 'Beijing', null, null, null, null, null, 'Jack2@gmail.com', null, null, '15826547894', '0', '8d788385431273d11e8b43bb78f3aa41', null, null, null, '2', '1', '0', null, 'Jack2', '2018-04-08 17:33:13');
INSERT INTO `user` VALUES ('18', null, null, null, null, null, null, 'CoCo@gmail.com', null, null, null, '0', 'ac0ddf9e65d57b6a56b2453386cd5db5', null, null, null, '3', '0', '0', null, 'CoCo', '2018-10-09 16:02:13');

-- ----------------------------
-- Table structure for `user_course`
-- ----------------------------
DROP TABLE IF EXISTS `user_course`;
CREATE TABLE `user_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_course
-- ----------------------------
INSERT INTO `user_course` VALUES ('22', '10', '2');
INSERT INTO `user_course` VALUES ('23', '11', '2');
INSERT INTO `user_course` VALUES ('24', '12', '16');
INSERT INTO `user_course` VALUES ('26', '14', '2');
INSERT INTO `user_course` VALUES ('27', '13', '6');
INSERT INTO `user_course` VALUES ('28', '12', '6');
INSERT INTO `user_course` VALUES ('29', '15', '6');

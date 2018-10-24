/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50634
Source Host           : localhost:3306
Source Database       : myschool

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2018-10-24 10:23:15
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
INSERT INTO `course` VALUES ('15', '666', null, '100', 'NetWork Engineer', '0', null, '1', '2', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_file
-- ----------------------------
INSERT INTO `course_file` VALUES ('65', '13', '0', '2018-10-13 20:15:42', 'Last', '/upload/1539432942476.ppt', '42', '0.2');
INSERT INTO `course_file` VALUES ('59', '13', '0', '2018-10-12 23:04:32', 'Task 1', '/upload/1539356672002.pdf', '38', '1.37');
INSERT INTO `course_file` VALUES ('66', '15', '0', '2018-10-16 23:02:57', 'The first File', '/upload/1539702177158.pdf', '44', '1.82');
INSERT INTO `course_file` VALUES ('67', '15', '0', '2018-10-16 23:03:28', 'The second File', '/upload/1539702207604.net.png', '44', '0');
INSERT INTO `course_file` VALUES ('68', '15', '0', '2018-10-16 23:03:50', 'The third File', '/upload/1539702229991.net.png', '44', '0');
INSERT INTO `course_file` VALUES ('69', '15', '0', '2018-10-16 23:04:13', 'OK', '/upload/1539702253151.png', '45', '0.01');
INSERT INTO `course_file` VALUES ('70', '11', '0', '2018-10-23 21:04:41', 'File1', '/upload/1540299881209.png', '47', '0.28');
INSERT INTO `course_file` VALUES ('71', '14', '0', '2018-10-23 21:08:49', 'File1', '/upload/1540300129289.png', '48', '0.28');
INSERT INTO `course_file` VALUES ('72', '11', '0', '2018-10-23 21:25:58', 'Fiel2', '/upload/1540301157612.jpg', '47', '0.16');

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
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

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
INSERT INTO `course_unit` VALUES ('47', '<p>OK</p>\r\n', '1.0', 'Good', '2018-10-23 21:05:08', '11', '2018-10-23 21:05:08', '1');
INSERT INTO `course_unit` VALUES ('48', '<p>11</p>\r\n', '1.0', '11', '2018-10-23 21:08:30', '14', '2018-10-23 21:08:30', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file_time
-- ----------------------------
INSERT INTO `file_time` VALUES ('19', '6', '46', '0', '11');
INSERT INTO `file_time` VALUES ('21', '6', '45', '0', '20');
INSERT INTO `file_time` VALUES ('24', '6', '44', '3', '55');
INSERT INTO `file_time` VALUES ('25', '6', '38', '0', '7');

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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

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
INSERT INTO `log` VALUES ('38', 'Tom', 'student', '2018-10-17 16:39:22', '2018-10-17 16:39:54', '0h 0min');
INSERT INTO `log` VALUES ('39', 'Jack', 'teacher', '2018-10-17 16:39:59', '2018-10-17 16:40:40', '0h 0min');
INSERT INTO `log` VALUES ('40', 'Tom', 'student', '2018-10-17 16:40:45', '2018-10-17 16:41:46', '0h 1min');
INSERT INTO `log` VALUES ('41', 'Tom', 'student', '2018-10-17 16:41:50', '2018-10-17 16:47:46', '0h 5min');
INSERT INTO `log` VALUES ('42', 'Tom', 'student', '2018-10-17 16:57:34', '2018-10-17 17:29:26', '0h 31min');
INSERT INTO `log` VALUES ('43', 'Tom', 'student', '2018-10-17 22:57:02', '2018-10-17 22:57:27', '0h 0min');
INSERT INTO `log` VALUES ('44', 'Tom', 'student', '2018-10-17 22:57:31', '2018-10-17 22:59:15', '0h 1min');
INSERT INTO `log` VALUES ('45', 'Tom', 'student', '2018-10-17 22:59:21', '2018-10-17 23:09:53', '0h 10min');
INSERT INTO `log` VALUES ('46', 'Tom', 'student', '2018-10-17 23:16:22', '2018-10-17 23:20:04', '0h 3min');
INSERT INTO `log` VALUES ('47', 'Tom', 'student', '2018-10-17 23:20:08', '2018-10-17 23:28:11', '0h 8min');
INSERT INTO `log` VALUES ('48', 'Tom', 'student', '2018-10-18 00:01:19', '2018-10-18 00:01:39', '0h 0min');
INSERT INTO `log` VALUES ('49', 'Tom', 'student', '2018-10-18 16:38:33', '2018-10-18 16:45:41', '0h 7min');
INSERT INTO `log` VALUES ('50', 'Tom', 'student', '2018-10-18 17:03:15', '2018-10-18 17:04:01', '0h 0min');
INSERT INTO `log` VALUES ('51', 'Tom', 'student', '2018-10-18 17:12:31', '2018-10-18 17:13:09', '0h 0min');
INSERT INTO `log` VALUES ('52', 'Tom', 'student', '2018-10-18 17:23:46', '2018-10-18 17:25:23', '0h 1min');
INSERT INTO `log` VALUES ('53', 'Tom', 'student', '2018-10-18 17:34:41', '2018-10-18 17:35:31', '0h 0min');
INSERT INTO `log` VALUES ('54', 'Tom', 'student', '2018-10-18 17:36:58', '2018-10-18 17:37:10', '0h 0min');
INSERT INTO `log` VALUES ('55', 'Tom', 'student', '2018-10-18 19:27:48', '2018-10-18 19:29:01', '0h 1min');
INSERT INTO `log` VALUES ('56', 'Tom', 'student', '2018-10-18 19:29:19', '2018-10-18 19:33:02', '0h 3min');
INSERT INTO `log` VALUES ('57', 'Tom', 'student', '2018-10-18 19:33:29', '2018-10-18 19:33:50', '0h 0min');
INSERT INTO `log` VALUES ('58', 'Tom', 'student', '2018-10-18 19:35:52', '2018-10-18 19:50:04', '0h 14min');
INSERT INTO `log` VALUES ('59', 'Tom', 'student', '2018-10-18 19:57:01', '2018-10-18 19:58:26', '0h 1min');
INSERT INTO `log` VALUES ('60', 'Tom', 'student', '2018-10-18 20:05:40', '2018-10-18 20:07:04', '0h 1min');
INSERT INTO `log` VALUES ('61', 'Tom', 'student', '2018-10-18 20:20:46', '2018-10-18 20:21:57', '0h 1min');
INSERT INTO `log` VALUES ('62', 'Tom', 'student', '2018-10-18 20:22:08', '2018-10-18 20:23:59', '0h 1min');
INSERT INTO `log` VALUES ('63', 'Tom', 'student', '2018-10-18 20:24:38', '2018-10-18 20:28:53', '0h 4min');
INSERT INTO `log` VALUES ('64', 'Tom', 'student', '2018-10-18 20:31:24', '2018-10-18 20:31:49', '0h 0min');
INSERT INTO `log` VALUES ('65', 'Tom', 'student', '2018-10-18 20:38:48', '2018-10-18 20:39:53', '0h 1min');
INSERT INTO `log` VALUES ('66', 'Tom', 'student', '2018-10-18 20:48:05', '2018-10-18 20:49:22', '0h 1min');
INSERT INTO `log` VALUES ('67', 'Tom', 'student', '2018-10-18 21:12:53', '2018-10-18 21:13:44', '0h 0min');
INSERT INTO `log` VALUES ('68', 'Tom', 'student', '2018-10-18 21:19:10', '2018-10-18 21:22:15', '0h 3min');
INSERT INTO `log` VALUES ('69', 'Tom', 'student', '2018-10-18 21:30:26', '2018-10-18 21:31:10', '0h 0min');
INSERT INTO `log` VALUES ('70', 'Tom', 'student', '2018-10-18 21:31:22', '2018-10-18 21:32:05', '0h 0min');
INSERT INTO `log` VALUES ('71', 'Tom', 'student', '2018-10-18 21:32:08', '2018-10-18 21:32:53', '0h 0min');
INSERT INTO `log` VALUES ('72', 'Tom', 'student', '2018-10-18 21:32:58', '2018-10-18 21:33:21', '0h 0min');
INSERT INTO `log` VALUES ('73', 'Tom', 'student', '2018-10-18 21:33:56', '2018-10-18 21:34:15', '0h 0min');
INSERT INTO `log` VALUES ('74', 'Tom', 'student', '2018-10-18 21:34:28', '2018-10-18 21:34:58', '0h 0min');
INSERT INTO `log` VALUES ('75', 'Tom', 'student', '2018-10-18 21:35:01', '2018-10-18 21:35:17', '0h 0min');
INSERT INTO `log` VALUES ('76', 'Tom', 'student', '2018-10-19 21:10:56', '2018-10-19 21:11:59', '0h 1min');
INSERT INTO `log` VALUES ('77', 'Tom', 'student', '2018-10-19 21:12:18', '2018-10-19 21:13:24', '0h 1min');
INSERT INTO `log` VALUES ('78', 'Tom', 'student', '2018-10-19 21:13:37', '2018-10-19 21:14:07', '0h 0min');
INSERT INTO `log` VALUES ('79', 'Tom', 'student', '2018-10-19 21:57:52', '2018-10-19 21:58:11', '0h 0min');
INSERT INTO `log` VALUES ('80', 'Tom', 'student', '2018-10-19 22:11:58', '2018-10-19 22:13:21', '0h 1min');
INSERT INTO `log` VALUES ('81', 'Tom', 'student', '2018-10-19 22:15:50', '2018-10-19 22:16:20', '0h 0min');
INSERT INTO `log` VALUES ('82', 'Tom', 'student', '2018-10-19 22:29:31', '2018-10-19 22:31:16', '0h 1min');
INSERT INTO `log` VALUES ('83', 'Tom', 'student', '2018-10-19 22:38:07', '2018-10-19 22:38:30', '0h 0min');
INSERT INTO `log` VALUES ('84', 'Tom', 'student', '2018-10-19 22:54:00', '2018-10-19 22:54:19', '0h 0min');
INSERT INTO `log` VALUES ('85', 'Tom', 'student', '2018-10-19 22:54:54', '2018-10-19 22:55:08', '0h 0min');
INSERT INTO `log` VALUES ('86', 'Tom', 'student', '2018-10-19 23:06:45', '2018-10-19 23:07:05', '0h 0min');
INSERT INTO `log` VALUES ('87', 'Tom', 'student', '2018-10-19 23:14:02', '2018-10-19 23:14:31', '0h 0min');
INSERT INTO `log` VALUES ('88', 'Tom', 'student', '2018-10-19 23:18:53', '2018-10-19 23:19:10', '0h 0min');
INSERT INTO `log` VALUES ('89', 'Tom', 'student', '2018-10-19 23:37:54', '2018-10-19 23:39:31', '0h 1min');
INSERT INTO `log` VALUES ('90', 'Tom', 'student', '2018-10-19 23:45:56', '2018-10-19 23:46:21', '0h 0min');
INSERT INTO `log` VALUES ('91', 'Tom', 'student', '2018-10-19 23:46:32', '2018-10-19 23:46:45', '0h 0min');
INSERT INTO `log` VALUES ('92', 'Tom', 'student', '2018-10-20 22:27:16', '2018-10-20 22:31:41', '0h 4min');
INSERT INTO `log` VALUES ('93', 'Tom', 'student', '2018-10-20 22:31:44', '2018-10-20 22:33:45', '0h 2min');
INSERT INTO `log` VALUES ('94', 'Tom', 'student', '2018-10-20 22:51:26', '2018-10-20 22:53:59', '0h 2min');
INSERT INTO `log` VALUES ('95', 'Jack', 'teacher', '2018-10-21 15:15:27', '2018-10-21 15:24:45', '0h 9min');
INSERT INTO `log` VALUES ('96', 'Tom', 'student', '2018-10-21 17:36:49', '2018-10-21 20:24:29', '2h 47min');
INSERT INTO `log` VALUES ('97', 'Tom', 'student', '2018-10-23 21:01:49', '2018-10-23 21:02:11', '0h 0min');
INSERT INTO `log` VALUES ('98', 'Tom', 'student', '2018-10-23 21:02:14', '2018-10-23 21:03:54', '0h 1min');
INSERT INTO `log` VALUES ('99', 'Tom', 'student', '2018-10-23 21:03:57', '2018-10-23 21:03:58', '0h 0min');
INSERT INTO `log` VALUES ('100', 'Jack', 'teacher', '2018-10-23 21:04:03', '2018-10-23 21:05:30', '0h 1min');
INSERT INTO `log` VALUES ('101', 'Jack', 'teacher', '2018-10-23 21:05:33', '2018-10-23 21:08:58', '0h 3min');
INSERT INTO `log` VALUES ('102', 'Jack', 'teacher', '2018-10-23 21:09:01', '2018-10-23 21:32:53', '0h 23min');
INSERT INTO `log` VALUES ('103', 'Jack', 'teacher', '2018-10-23 21:32:56', '2018-10-23 21:32:59', '0h 0min');
INSERT INTO `log` VALUES ('104', 'Tom', 'student', '2018-10-23 21:33:04', '2018-10-23 21:33:40', '0h 0min');
INSERT INTO `log` VALUES ('105', 'Jack2', 'teacher', '2018-10-24 09:31:20', '2018-10-24 09:31:31', '0h 0min');
INSERT INTO `log` VALUES ('106', 'Tom', 'student', '2018-10-24 09:31:38', '2018-10-24 09:42:45', '0h 11min');
INSERT INTO `log` VALUES ('107', 'Jack', 'teacher', '2018-10-24 09:46:22', '2018-10-24 09:58:04', '0h 11min');
INSERT INTO `log` VALUES ('108', 'Tom', 'student', '2018-10-24 10:21:33', '2018-10-24 10:22:10', '0h 0min');

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
INSERT INTO `user` VALUES ('6', '', null, null, '', null, null, 'Tom@gmail.com', 'tom', 'zhang', '', '0', 'cd73502828457d15655bbd7a63fb0bc8', '/upload/1540301598247.png', '', null, '1', '1', '0', null, 'Tom', '2018-03-24 15:43:58');
INSERT INTO `user` VALUES ('2', '11', null, null, '11', null, null, 'Jack@gmail.com', '111', '111', '151515', '0', '8d788385431273d11e8b43bb78f3aa41', '/upload/1540301563033.jpg', '11', null, '2', '1', '1', null, 'Jack', null);
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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

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
INSERT INTO `user_course` VALUES ('30', '15', '2');

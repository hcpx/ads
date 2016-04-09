/*
Navicat MySQL Data Transfer

Source Server         : localMysql
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : db_ads

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2016-04-09 14:41:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_ggdd`
-- ----------------------------
DROP TABLE IF EXISTS `t_ggdd`;
CREATE TABLE `t_ggdd` (
  `c_id` varchar(32) NOT NULL default '',
  `c_khlxr` varchar(300) default NULL,
  `c_khlxdh` varchar(300) default NULL,
  `d_kssj` date default NULL,
  `d_jssj` date default NULL,
  `n_count` int(11) default NULL,
  `c_xsry` varchar(300) default NULL,
  `c_ggpid` varchar(300) default NULL,
  `d_ddsj` date default NULL,
  PRIMARY KEY  (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ggdd
-- ----------------------------

-- ----------------------------
-- Table structure for `t_ggp`
-- ----------------------------
DROP TABLE IF EXISTS `t_ggp`;
CREATE TABLE `t_ggp` (
  `c_id` varchar(32) NOT NULL,
  `c_lx` varchar(32) NOT NULL,
  `c_ms` varchar(300) default NULL,
  `n_jg` int(11) default NULL,
  `n_zt` int(11) default NULL,
  `c_tjry` varchar(32) default NULL,
  PRIMARY KEY  (`c_id`),
  KEY `c_lx` (`c_lx`),
  CONSTRAINT `t_ggp_ibfk_1` FOREIGN KEY (`c_lx`) REFERENCES `t_ggplx` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ggp
-- ----------------------------

-- ----------------------------
-- Table structure for `t_ggplx`
-- ----------------------------
DROP TABLE IF EXISTS `t_ggplx`;
CREATE TABLE `t_ggplx` (
  `c_id` varchar(32) NOT NULL,
  `c_mc` varchar(300) default NULL,
  `c_ms` varchar(300) NOT NULL,
  PRIMARY KEY  (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ggplx
-- ----------------------------

-- ----------------------------
-- Table structure for `t_ggptp`
-- ----------------------------
DROP TABLE IF EXISTS `t_ggptp`;
CREATE TABLE `t_ggptp` (
  `c_id` varchar(32) NOT NULL default '',
  `c_ggpid` varchar(32) default NULL,
  `c_url` varchar(300) default NULL,
  PRIMARY KEY  (`c_id`),
  KEY `c_ggpid` (`c_ggpid`),
  CONSTRAINT `t_ggptp_ibfk_1` FOREIGN KEY (`c_ggpid`) REFERENCES `t_ggp` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ggptp
-- ----------------------------

-- ----------------------------
-- Table structure for `t_ry`
-- ----------------------------
DROP TABLE IF EXISTS `t_ry`;
CREATE TABLE `t_ry` (
  `c_id` varchar(32) NOT NULL default '',
  `c_name` varchar(300) default NULL,
  `n_type` int(11) default NULL,
  `c_username` varchar(300) default NULL,
  `c_password` varchar(300) default NULL,
  PRIMARY KEY  (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ry
-- ----------------------------
INSERT INTO `t_ry` VALUES ('02868fd4e93045eb949d07ce070adae4', 'sfhj', '1', 'jjhjkhjk', 'hjkhjkhj');
INSERT INTO `t_ry` VALUES ('3d9adfac8b664822b2ba8ad74c240967', 'wjc', '1', 'lonelyboywjc', '111222');
INSERT INTO `t_ry` VALUES ('48fff654fdfc4ae2a05a6387471029b9', 'sdasd', '2', 'asdasdas', 'asdasda');
INSERT INTO `t_ry` VALUES ('887e645dc904412fa1c879c8e64e081f', 'sdasd', '1', 'asdasd', 'asdasd');
INSERT INTO `t_ry` VALUES ('8ddd2b9157c24fabb7f07995bd636ce5', null, '1', null, null);
INSERT INTO `t_ry` VALUES ('fb74455218654f2f8bd60f64c403a9be', 'asdasd', '1', 'fasfasfdsfsdf', 'asdasd');
INSERT INTO `t_ry` VALUES ('sssss', 'tx', '1', null, null);

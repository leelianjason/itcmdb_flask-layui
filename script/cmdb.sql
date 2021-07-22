/*
Navicat MySQL Data Transfer

Source Server         : cmdb
Source Server Version : 50732
Source Host           : 192.168.1.80:3306
Source Database       : cmdb

Target Server Type    : MYSQL
Target Server Version : 50732
File Encoding         : 65001

Date: 2021-06-21 16:11:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for itdata
-- ----------------------------
DROP TABLE IF EXISTS `itdata`;
CREATE TABLE `itdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `num` varchar(255) DEFAULT NULL,
  `project` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `isdel` int(1) DEFAULT NULL,
  `buytime` varchar(255) DEFAULT NULL,
  `droptime` varchar(255) DEFAULT '',
  `cpu` varchar(255) DEFAULT NULL,
  `mb` varchar(255) DEFAULT NULL,
  `gpu` varchar(255) DEFAULT NULL,
  `mem` varchar(255) DEFAULT NULL,
  `maindisk` varchar(255) DEFAULT NULL,
  `slavedisk` varchar(255) DEFAULT NULL,
  `maindisplay` varchar(255) DEFAULT NULL,
  `slavedisplay` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itdata
-- ----------------------------
INSERT INTO `itdata` VALUES ('1', 'pc-001', '行政', '小红', '使用中', '兼容机', '0', '2021年04月05日', '', '9900k', '微星 B250M PRO-V', 'Nvidia GeForce GTX 1050 ( 2 GB / 华硕 )', '16 GB', '240G_SSD', '1T', 'testXS_P2317H_021', 'testXS_P2317H_021', '测试1');
INSERT INTO `itdata` VALUES ('2', 'pc-002', '行政', '小红', '使用中', '兼容机', '0', '2021年04月06日', '2021年05月10日', '9901k', '微星 B251M PRO-V', 'Nvidia GeForce GTX 1050 ( 3 GB / 华硕 )', '17 GB', '241G_SSD', '2T', 'testXS_P2317H_022', 'testXS_P2317H_022', '测试2');
INSERT INTO `itdata` VALUES ('3', 'pc-003', '行政', '小白', '工位闲置', '笔记本', '0', '2021年04月07日', '', '9902k', '微星 B252M PRO-V', 'Nvidia GeForce GTX 1050 ( 4 GB / 华硕 )', '18 GB', '242G_SSD', '3T', 'testXS_P2317H_023', 'testXS_P2317H_023', '测试3');
INSERT INTO `itdata` VALUES ('4', 'pc-004', '行政', '小蓝', '工位闲置', '兼容机', '1', '2021年04月08日', '', '9903k', '微星 B253M PRO-V', 'Nvidia GeForce GTX 1050 ( 5 GB / 华硕 )', '19 GB', '243G_SSD', '4T', 'testXS_P2317H_024', 'testXS_P2317H_024', '测试4');
INSERT INTO `itdata` VALUES ('5', 'pc-005', '行政', '小蓝', '库房闲置', 'iMac', '0', '2021年04月09日', '', '9904k', '微星 B254M PRO-V', 'Nvidia GeForce GTX 1050 ( 6 GB / 华硕 )', '20 GB', '244G_SSD', '5T', 'testXS_P2317H_025', 'testXS_P2317H_025', '测试5');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `delete_flag` int(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES ('1', '资产管理', null, '-1', '0', '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES ('2', '资产管理', '/servers/it', '1', '0', '2021-05-13 00:00:00', '2019-01-09 14:08:37');
INSERT INTO `resource` VALUES ('3', '平台管理', '', '-1', '0', '2021-05-13 00:00:00', '2019-01-09 14:09:06');
INSERT INTO `resource` VALUES ('4', '平台管理', '/servers/plat', '3', '0', '2021-05-13 00:00:00', '2019-01-09 14:09:30');
INSERT INTO `resource` VALUES ('5', '系统管理', '', '-1', '0', '2021-05-13 00:00:00', '2019-01-09 14:10:02');
INSERT INTO `resource` VALUES ('6', '用户管理', '/system/user', '5', '0', '2021-05-13 00:00:00', '2019-01-14 13:50:26');
INSERT INTO `resource` VALUES ('7', '角色管理', '/system/role', '5', '0', '2021-05-13 00:00:00', '2019-01-14 13:50:24');
INSERT INTO `resource` VALUES ('8', '添加资产', '/servers/addit', '1', '0', '2021-05-13 00:00:00', '2019-01-14 13:50:24');
INSERT INTO `resource` VALUES ('9', 'Excel导入', '/servers/excel', '1', '0', '2021-05-13 00:00:00', '2019-01-14 13:50:24');
INSERT INTO `resource` VALUES ('10', '回收站', '/servers/recycle', '1', '0', '2021-05-14 16:28:11', '2021-05-14 16:28:14');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_des` varchar(255) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', '超级管理员', '0', '2019-01-09 16:09:27', '2021-05-14 16:30:24');
INSERT INTO `role` VALUES ('2', 'staff', '普通用户', '0', '2021-05-10 17:02:44', '2021-06-21 15:42:22');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`pk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES ('140', '1', '2', '2021-05-14 16:30:24', '2021-05-14 16:30:24');
INSERT INTO `role_resource` VALUES ('141', '1', '8', '2021-05-14 16:30:24', '2021-05-14 16:30:24');
INSERT INTO `role_resource` VALUES ('142', '1', '9', '2021-05-14 16:30:24', '2021-05-14 16:30:24');
INSERT INTO `role_resource` VALUES ('143', '1', '10', '2021-05-14 16:30:24', '2021-05-14 16:30:24');
INSERT INTO `role_resource` VALUES ('144', '1', '4', '2021-05-14 16:30:24', '2021-05-14 16:30:24');
INSERT INTO `role_resource` VALUES ('145', '1', '6', '2021-05-14 16:30:24', '2021-05-14 16:30:24');
INSERT INTO `role_resource` VALUES ('146', '1', '7', '2021-05-14 16:30:24', '2021-05-14 16:30:24');
INSERT INTO `role_resource` VALUES ('155', '6', '2', '2021-06-21 14:09:27', '2021-06-21 14:09:27');
INSERT INTO `role_resource` VALUES ('156', '4', '2', '2021-06-21 15:42:22', '2021-06-21 15:42:22');
INSERT INTO `role_resource` VALUES ('157', '4', '8', '2021-06-21 15:42:22', '2021-06-21 15:42:22');
INSERT INTO `role_resource` VALUES ('158', '4', '9', '2021-06-21 15:42:22', '2021-06-21 15:42:22');
INSERT INTO `role_resource` VALUES ('159', '4', '10', '2021-06-21 15:42:22', '2021-06-21 15:42:22');
INSERT INTO `role_resource` VALUES ('160', '4', '4', '2021-06-21 15:42:22', '2021-06-21 15:42:22');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `extra_resource` varchar(255) DEFAULT '',
  `forbidden_resource` varchar(255) DEFAULT '',
  `delete_flag` int(255) DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `fk_roleid` (`role_id`),
  CONSTRAINT `fk_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`pk_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '1', '', '', '0', '2021-05-10 14:45:55', '2021-05-10 14:46:17');
INSERT INTO `user` VALUES ('2', 'staff', 'e10adc3949ba59abbe56e057f20f883e', '普通用户', '2', '', '', '0', '2021-05-10 18:29:58', '2021-06-21 15:42:16');

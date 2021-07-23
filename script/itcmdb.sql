/*
 Navicat Premium Data Transfer

 Source Server         : 1.80
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : 192.168.1.80:3306
 Source Schema         : itcmdb

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 23/07/2021 14:41:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cmdb_display
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_display`;
CREATE TABLE `cmdb_display`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usepc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isdel` int(1) NULL DEFAULT NULL,
  `buytime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `droptime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `num`(`num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmdb_display
-- ----------------------------
INSERT INTO `cmdb_display` VALUES (1, 'PHL-243V5-001', 'PHL-243V5', 'YW', 'PC-MSI-B250M-LB-002', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (2, 'AOC-2270W-002', 'AOC-2270W', 'YW', '', '空闲', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (3, 'AOC-2470W-003', 'AOC-2470W', 'YW', 'PC-MSI-B250M-LB-003', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (4, 'DELL-SP2318H-004', 'DELL-SP2318H', 'JY', 'PC-MSI-B250M-LB-004', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (5, 'DELL-P2317H-005', 'DELL-P2317H', 'JY', 'PC-MSI-B250M-LB-005', '使用中', 0, '2020/01/01', '', '');

-- ----------------------------
-- Table structure for cmdb_pc
-- ----------------------------
DROP TABLE IF EXISTS `cmdb_pc`;
CREATE TABLE `cmdb_pc`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主机编号',
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `project` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isdel` int(1) NULL DEFAULT NULL,
  `buytime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `droptime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cpu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gpu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maindisk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `slavedisk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maindisplay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主显示器编号',
  `slavedisplay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '次显示器编号',
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `num`) USING BTREE,
  INDEX `maindisplay_fk`(`maindisplay`) USING BTREE,
  INDEX `slavedisplay_fk`(`slavedisplay`) USING BTREE,
  CONSTRAINT `maindisplay_fk` FOREIGN KEY (`maindisplay`) REFERENCES `cmdb_display` (`num`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `slavedisplay_fk` FOREIGN KEY (`slavedisplay`) REFERENCES `cmdb_display` (`num`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmdb_pc
-- ----------------------------
INSERT INTO `cmdb_pc` VALUES (1, 'PC-MSI H110-LC-001', '测试1', '职能', '人事', 'JY', '使用中', 'PC', 0, '2021/07/22', '', 'LC', '英特尔Corei3-7100', 'MSI H110', '集成显卡', '8GB', '金士顿500G(固态)', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (2, 'PC-MSI-B250M-LB-002', '测试2', '职能', '财务', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', '集成显卡', '8GB', '金士顿500G(固态)', '金士顿240G(固态)', 'PHL-243V5-001', NULL, '');
INSERT INTO `cmdb_pc` VALUES (3, 'PC-MSI-B250M-LB-003', '测试3', '职能', '财务', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', '集成显卡', '8GB', '金士顿500G(固态)', '西数1T(机械)', 'AOC-2470W-003', NULL, '');
INSERT INTO `cmdb_pc` VALUES (4, 'PC-MSI-B250M-LB-004', '测试4', '职能', '人事', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', '集成显卡', '8GB+8GB', '金士顿500G(固态)', '无', 'DELL-SP2318H-004', 'DELL-P2317H-005', '');
INSERT INTO `cmdb_pc` VALUES (5, 'PC-MSI-B250M-LB-005', '测试5', '职能', '人事', 'YW', '使用中', 'PC', 1, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB', '金士顿500G(固态)', '无', NULL, NULL, '');

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent` int(11) NULL DEFAULT NULL,
  `delete_flag` int(255) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, '资产管理', '', -1, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES (2, '资产管理', '/itdata/manageit', 1, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES (3, '资产添加', '/itdata/addit', 1, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES (4, 'Excel导入', '/itdata/excel', 1, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES (5, '资产回收', '/itdata/recycle', 1, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES (6, '显示器管理', '', -1, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES (7, '显示器管理', '/display/showdisplay', 6, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES (8, '显示器回收', '/display/recycledisplay', 6, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES (9, '平台管理', '', -1, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES (10, '平台管理', '/itdata/plat', 9, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES (11, '系统管理', '', -1, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES (12, '用户管理', '/system/user', 11, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');
INSERT INTO `resource` VALUES (13, '角色管理', '/system/role', 11, 0, '2021-05-13 00:00:00', '2021-05-13 00:00:00');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delete_flag` int(11) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', '超级管理员', 0, '2019-01-09 16:09:27', '2021-07-16 14:33:49');
INSERT INTO `role` VALUES (2, 'staff', '普通用户', 0, '2021-05-10 17:02:44', '2021-07-23 11:20:37');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`  (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL,
  `resource_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (2, 1, 2, '2021-07-16 14:33:49', '2021-07-16 14:33:49');
INSERT INTO `role_resource` VALUES (3, 1, 3, '2021-07-16 14:33:49', '2021-07-16 14:33:49');
INSERT INTO `role_resource` VALUES (4, 1, 4, '2021-07-16 14:33:49', '2021-07-16 14:33:49');
INSERT INTO `role_resource` VALUES (5, 1, 5, '2021-07-16 14:33:49', '2021-07-16 14:33:49');
INSERT INTO `role_resource` VALUES (6, 1, 7, '2021-07-16 14:33:49', '2021-07-16 14:33:49');
INSERT INTO `role_resource` VALUES (7, 1, 8, '2021-07-16 14:33:49', '2021-07-16 14:33:49');
INSERT INTO `role_resource` VALUES (8, 1, 10, '2021-07-16 14:33:49', '2021-07-16 14:33:49');
INSERT INTO `role_resource` VALUES (9, 1, 12, '2021-07-16 14:33:49', '2021-07-16 14:33:49');
INSERT INTO `role_resource` VALUES (10, 1, 13, '2021-07-16 14:33:49', '2021-07-16 14:33:49');
INSERT INTO `role_resource` VALUES (20, 2, 2, '2021-07-23 11:20:37', '2021-07-23 11:20:37');
INSERT INTO `role_resource` VALUES (21, 2, 3, '2021-07-23 11:20:37', '2021-07-23 11:20:37');
INSERT INTO `role_resource` VALUES (22, 2, 4, '2021-07-23 11:20:37', '2021-07-23 11:20:37');
INSERT INTO `role_resource` VALUES (23, 2, 5, '2021-07-23 11:20:37', '2021-07-23 11:20:37');
INSERT INTO `role_resource` VALUES (24, 2, 7, '2021-07-23 11:20:37', '2021-07-23 11:20:37');
INSERT INTO `role_resource` VALUES (25, 2, 8, '2021-07-23 11:20:37', '2021-07-23 11:20:37');
INSERT INTO `role_resource` VALUES (26, 2, 10, '2021-07-23 11:20:37', '2021-07-23 11:20:37');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `pk_id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  `extra_resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `forbidden_resource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `delete_flag` int(255) NULL DEFAULT 0,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`pk_id`) USING BTREE,
  INDEX `fk_roleid`(`role_id`) USING BTREE,
  CONSTRAINT `fk_roleid` FOREIGN KEY (`role_id`) REFERENCES `role` (`pk_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 1, '', '', 0, '2021-05-10 14:45:55', '2021-05-10 14:46:17');
INSERT INTO `user` VALUES (2, 'staff', 'e10adc3949ba59abbe56e057f20f883e', '普通用户', 2, '', '', 0, '2021-05-10 18:29:58', '2021-07-23 11:07:58');

SET FOREIGN_KEY_CHECKS = 1;

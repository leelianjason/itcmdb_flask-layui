/*
 Navicat Premium Data Transfer

 Source Server         : 1.80李测试服
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : 192.168.1.80:3306
 Source Schema         : cmdb_test

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 23/07/2021 10:22:05
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
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmdb_display
-- ----------------------------
INSERT INTO `cmdb_display` VALUES (1, 'YW-PHL-243V5-001', 'PHL-243V5', 'YW', 'YW-PC-MSI-B250M-LB-002', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (2, 'YW-AOC-2270W-002', 'AOC-2270W', 'YW', '', '空闲', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (3, 'YW-AOC-2470W-003', 'AOC-2470W', 'YW', 'YW-PC-MSI-B250M-LB-003', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (4, 'JY-DELL-SP2318H-004', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-004', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (5, 'JY-DELL-P2317H-005', 'DELL-P2317H', 'JY', 'YW-PC-MSI-B250M-LB-005', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (6, 'JY-DELL-P2317H-006', 'DELL-P2317H', 'JY', 'JY-PC-MSI-B250M-LB-006', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (7, 'WF-DELL-P2417H-007', 'DELL-P2417H', 'WF', 'WF-PC-MSI-B250M-LB-007', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (8, 'WF-DELL-SP2318H-079', 'DELL-SP2318H', 'WF', 'WF-PC-MSI-B250M-LB-007', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (9, 'JY-DELL-SP2318H-008', 'DELL-SP2318H', 'JY', 'WF-PC-MSI-B250M-LB-009', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (10, 'WF-DELL-P2217H-009', 'DELL-P2217H', 'WF', 'JY-PC-MSI-B250M-LB-010', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (11, 'JY-DELL-P2419H-010', 'DELL-P2419H', 'JY', 'WF-PC-MSI-B250M-LB-011', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (12, 'JY-DELL-P2419H-011', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-012', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (13, 'JY-DELL-P2217H-012', 'DELL-P2217H', 'JY', 'JY-PC-MSI-B250M-LB-013', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (14, 'JY-DELL-P2317H-013', 'DELL-P2317H', 'JY', 'JY-PC-MSI-B250M-LB-014', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (15, 'JY-DELL-P2217H-014', 'DELL-P2217H', 'JY', 'JY-PC-MSI-B250M-LB-015', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (16, 'JY-DELL-SP2318H-080', 'DELL-SP2318H', 'JY', 'WF-PC-MSI-B250M-LB-009', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (17, 'WF-DELL-P2217H-081', 'DELL-P2217H', 'WF', 'JY-PC-MSI-B250M-LB-010', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (18, 'YW-DELL-SE2416HM-082', 'DELL-SE2416HM', 'YW', 'WF-PC-MSI-B250M-LB-011', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (19, 'JY-DELL-P2419H-083', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-012', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (20, 'WF-DELL-P2217H-084', 'DELL-P2217H', 'WF', 'JY-PC-MSI-B250M-LB-013', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (21, 'JY-DELL-P2317H-085', 'DELL-P2317H', 'JY', 'JY-PC-MSI-B250M-LB-014', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (22, 'JY-DELL-P2217H-086', 'DELL-P2217H', 'JY', 'JY-PC-MSI-B250M-LB-015', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (23, 'YW-DELL-SE2416HM-015', 'DELL-SE2416HM', 'YW', 'JY-PC-MSI-B250M-LB-016', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (24, 'YW-PHL-243V5-016', 'PHL-243V5', 'YW', 'YW-PC-MSI-B250M-LB-017', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (25, 'JY-DELL-SP2318H-017', 'DELL-SP2318H', 'JY', 'YW-PC-MSI-B250M-LB-018', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (26, 'JY-DELL-SP2318H-018', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-019', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (27, 'JY-DELL-SP2318H-019', 'DELL-SP2318H', 'JY', 'YW-PC-MSI-B250M-LB-020', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (28, 'JY-DELL-P2317H-020', 'DELL-P2317H', 'JY', 'WF-PC-MSI-B250M-LB-021', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (29, 'JY-DELL-P2317H-021', 'DELL-P2317H', 'JY', 'WF-PC-MSI-B250M-LB-022', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (30, 'JY-DELL-SP2318H-087', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-019', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (31, 'JY-DELL-SP2318H-088', 'DELL-SP2318H', 'JY', 'YW-PC-MSI-B250M-LB-020', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (32, 'JY-DELL-SP2318H-089', 'DELL-SP2318H', 'JY', 'WF-PC-MSI-B250M-LB-021', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (33, 'WF-DELL-P2217H-090', 'DELL-P2217H', 'WF', 'WF-PC-MSI-B250M-LB-022', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (34, 'JY-DELL-P2419H-022', 'DELL-P2419H', 'JY', 'WF-PC-MSI-B250M-LB-023', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (35, 'JY-DELL-P2419H-023', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-024', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (36, 'JY-DELL-SP2318H-024', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-025', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (37, 'JY-DELL-P2317H-025', 'DELL-P2317H', 'JY', 'JY-PC-MSI-B250M-LB-026', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (38, 'WF-DELL-P2419H-026', 'DELL-P2419H', 'WF', 'YW-PC-MSI-B250M-LB-027', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (39, 'JY-DELL-SP2318H-027', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-028', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (40, 'JY-DELL-P2422H-028', 'DELL-P2422H', 'JY', 'JY-PC-ASUS-H310M-LB-029', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (41, 'WF-DELL-P2217H-029', 'DELL-P2217H', 'WF', 'WF-PC-MSI-B250M-LB-030', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (42, 'WF-DELL-P2317H-030', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-031', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (43, 'WF-DELL-P2317H-031', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-032', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (44, 'WF-DELL-P2217H-032', 'DELL-P2217H', 'WF', 'WF-PC-MSI-B250M-LB-033', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (45, 'WF-DELL-P2317H-033', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-034', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (46, 'WF-DELL-P2317H-034', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-035', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (47, 'WF-DELL-P2217H-035', 'DELL-P2217H', 'WF', 'JY-PC-MSI-B250M-LB-036', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (48, 'WF-DELL-SP2318H-036', 'DELL-SP2318H', 'WF', 'WF-PC-MSI-B250M-LB-037', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (49, 'JY-DELL-P2419H-037', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-038', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (50, 'WF-DELL-P2317H-038', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-039', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (51, 'WF-DELL-P2317H-039', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-040', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (52, 'WF-DELL-P2317H-040', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-041', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (53, 'WF-DELL-P2317H-041', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-042', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (54, 'JY-DELL-P2317H-042', 'DELL-P2317H', 'JY', 'JY-PC-MSI-B250M-LB-043', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (55, 'WF-DELL-P2217H-043', 'DELL-P2217H', 'WF', 'WF-PC-MSI-B250M-LB-044', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (56, 'JY-DELL-SP2318H-044', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-045', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (57, 'JY-DELL-P2419H-045', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-046', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (58, 'JY-DELL-P2419H-046', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-047', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (59, 'JY-DELL-SP2318H-047', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-048', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (60, 'WF-DELL-P2217H-048', 'DELL-P2217H', 'WF', 'JY-PC-MSI-B250M-LB-049', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (61, 'JY-DELL-P2419H-049', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-050', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (62, 'JY-DELL-P2319H-050', 'DELL-P2319H', 'JY', 'JY-PC-ASUS-H310M-LB-051', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (63, 'JY-DELL-P2419H-051', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-052', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (64, 'WF-DELL-SP2318H-052', 'DELL-SP2318H', 'WF', 'JY-PC-ASUS-H310M-LB-053', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (65, 'JY-DELL-P2317H-053', 'DELL-P2317H', 'JY', 'WF-PC-MSI-B250M-LB-054', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (66, 'JY-DELL-P2419H-054', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-055', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (67, 'JY-DELL-P2419H-055', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-056', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (68, 'JY-DELL-P2317H-091', 'DELL-P2317H', 'JY', 'JY-PC-MSI-B250M-LB-025', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (69, 'JY-DELL-SP2318H-092', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-026', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (70, 'JY-DELL-P2317H-093', 'DELL-P2317H', 'JY', 'YW-PC-MSI-B250M-LB-027', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (71, 'JY-DELL-SP2318H-094', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-028', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (72, 'JY-DELL-P2422H-095', 'DELL-P2422H', 'JY', 'JY-PC-ASUS-H310M-LB-029', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (73, 'WF-DELL-P2217H-096', 'DELL-P2217H', 'WF', 'WF-PC-MSI-B250M-LB-030', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (74, 'WF-DELL-P2317H-097', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-031', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (75, 'WF-DELL-P2317H-098', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-032', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (76, 'WF-DELL-P2217H-099', 'DELL-P2217H', 'WF', 'WF-PC-MSI-B250M-LB-033', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (77, 'JY-DELL-SP2318H-100', 'DELL-SP2318H', 'JY', 'WF-PC-MSI-B250M-LB-034', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (78, 'WF-DELL-P2217H-101', 'DELL-P2217H', 'WF', 'WF-PC-MSI-B250M-LB-035', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (79, 'WF-DELL-P2417H-102', 'DELL-P2417H', 'WF', 'JY-PC-MSI-B250M-LB-036', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (80, 'WF-DELL-P2317H-103', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-037', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (81, 'JY-DELL-P2419H-104', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-038', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (82, 'WF-DELL-P2317H-105', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-039', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (83, 'WF-DELL-P2317H-106', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-040', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (84, 'WF-DELL-P2317H-107', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-041', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (85, 'WF-DELL-P2317H-108', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-042', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (86, 'YW-DELL-SP2318H-109', 'DELL-SP2318H', 'YW', 'JY-PC-MSI-B250M-LB-043', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (87, 'WF-DELL-SP2318H-110', 'DELL-SP2318H', 'WF', 'WF-PC-MSI-B250M-LB-044', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (88, 'JY-DELL-SP2318H-111', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-045', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (89, 'JY-DELL-P2419H-112', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-046', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (90, 'JY-DELL-P2419H-113', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-047', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (91, 'JY-DELL-SP2318H-114', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-048', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (92, 'YW-DELL-SP2318H-115', 'DELL-SP2318H', 'YW', 'JY-PC-MSI-B250M-LB-049', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (93, 'JY-DELL-P2419H-116', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-050', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (94, 'JY-DELL-P2319H-117', 'DELL-P2319H', 'JY', 'JY-PC-ASUS-H310M-LB-051', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (95, 'JY-DELL-P2419H-118', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-052', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (96, 'WF-DELL-P2417H-119', 'DELL-P2417H', 'WF', 'JY-PC-ASUS-H310M-LB-053', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (97, 'WF-DELL-P2217H-120', 'DELL-P2217H', 'WF', 'WF-PC-MSI-B250M-LB-054', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (98, 'JY-DELL-P2419H-121', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-055', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (99, 'JY-DELL-P2419H-122', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-056', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (100, 'JY-DELL-P2419H-056', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-057', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (101, 'JY-DELL-P2419H-057', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-058', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (102, 'JY-DELL-P2419H-058', 'DELL-P2419H', 'JY', 'YW-PC-MSI-B250M-LB-059', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (103, 'JY-DELL-P2419H-059', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-060', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (104, 'JY-DELL-P2317H-060', 'DELL-P2317H', 'JY', 'JY-PC-ASUS-B250M-LB-061', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (105, 'JY-DELL-P2419H-061', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-062', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (106, 'JY-DELL-P2419H-062', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-063', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (107, 'JY-DELL-P2419H-063', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-064', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (108, 'JY-DELL-P2419H-064', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-065', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (109, 'JY-DELL-P2317H-065', 'DELL-P2317H', 'JY', 'JY-PC-ASUS-B46M-LA-99', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (110, 'JY-DELL-SP2318H-066', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-067', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (111, 'JY-DELL-P2419H-067', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-068', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (112, 'JY-DELL-P2419H-068', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-069', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (113, 'JY-DELL-P2419H-069', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-070', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (114, 'JY-DELL-P2419H-070', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-071', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (115, 'JY-DELL-P2419H-071', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-072', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (116, 'JY-DELL-P2419H-072', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-073', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (117, 'JY-DELL-P2419H-073', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-074', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (118, 'JY-DELL-P2419H-074', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-075', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (119, 'JY-DELL-P2317H-075', 'DELL-P2317H', 'JY', 'WF-PC-MSI-B250M-LB-076', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (120, 'JY-DELL-P2419H-076', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-077', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (121, 'JY-DELL-P2419H-077', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-078', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (122, 'JY-DELL-P2419H-123', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-058', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (123, 'JY-DELL-P2419H-124', 'DELL-P2419H', 'JY', 'YW-PC-MSI-B250M-LB-059', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (124, 'JY-DELL-P2419H-125', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-060', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (125, 'JY-DELL-P2317H-126', 'DELL-P2317H', 'JY', 'JY-PC-ASUS-B250M-LB-061', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (126, 'JY-DELL-P2419H-127', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-062', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (127, 'JY-DELL-P2419H-128', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-063', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (128, 'JY-DELL-P2419H-129', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-064', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (129, 'JY-DELL-P2419H-130', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-065', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (130, 'JY-DELL-SP2318H-131', 'DELL-SP2318H', 'JY', 'JY-PC-ASUS-B46M-LA-99', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (131, 'JY-DELL-SP2318H-132', 'DELL-SP2318H', 'JY', 'JY-PC-MSI-B250M-LB-067', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (132, 'JY-DELL-P2419H-133', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-068', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (133, 'JY-DELL-P2419H-134', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-069', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (134, 'JY-DELL-P2419H-135', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-070', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (135, 'JY-DELL-P2419H-136', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-071', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (136, 'JY-DELL-P2419H-137', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-072', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (137, 'JY-DELL-P2419H-138', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-073', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (138, 'JY-DELL-P2419H-139', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-074', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (139, 'JY-DELL-P2419H-140', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-075', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (140, 'WF-DELL-P2317H-141', 'DELL-P2317H', 'WF', 'WF-PC-MSI-B250M-LB-076', '使用中', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (141, 'JY-DELL-P2419H-142', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-077', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (142, 'JY-DELL-P2419H-143', 'DELL-P2419H', 'JY', 'JY-PC-ASUS-H310M-LB-078', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (143, 'JY-DELL-P2419H-078', 'DELL-P2419H', 'JY', 'YW-PC-MSI-B250M-LB-079', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (144, 'YW-DELL-SE2416HM-144', 'DELL-SE2416HM', 'YW', 'JY-SVR-DELL-R420-LA-088', '使用中', 0, '2021/01/01', '', '机房显示器');
INSERT INTO `cmdb_display` VALUES (145, 'YW-DELL-SE2416HM-145', 'DELL-SE2416HM', 'YW', 'JY-PC-MSI H110-LC-001', '使用中', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (146, 'YW-DELL-SE2416HM-146', 'DELL-SE2416HM', 'YW', '', '空闲', 0, '2021/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (147, 'YW-AOC-215LM-147', 'AOC-215LM', 'YW', '', '空闲', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (148, 'YW-AOC-215LM-148', 'AOC-215LM', 'YW', '', '空闲', 0, '2020/01/01', '', '');
INSERT INTO `cmdb_display` VALUES (149, 'YW-AOC-215LM-149', 'AOC-215LM', 'YW', '', '空闲', 0, '2020/01/01', '', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cmdb_pc
-- ----------------------------
INSERT INTO `cmdb_pc` VALUES (1, 'JY-PC-MSI H110-LC-001', '前台', '职能', '人事', 'JY', '使用中', 'PC', 0, '2021/07/22', '', 'LC', '英特尔Corei3-7100', 'MSI H110', '集成显卡', '8GB', '希捷1T(机械)', '无', 'YW-DELL-SE2416HM-145', NULL, '');
INSERT INTO `cmdb_pc` VALUES (2, 'YW-PC-MSI-B250M-LB-002', '出纳', '职能', '财务', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', '集成显卡', '8GB', '金士顿120G(固态)', '金士顿240G(固态)', 'YW-PHL-243V5-001', NULL, '');
INSERT INTO `cmdb_pc` VALUES (3, 'YW-PC-MSI-B250M-LB-003', '李娜', '职能', '财务', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', '集成显卡', '8GB', '金士顿120G(固态)', '西数1T(机械)', 'YW-AOC-2470W-003', NULL, '');
INSERT INTO `cmdb_pc` VALUES (4, 'JY-PC-MSI-B250M-LB-004', '孙璐', '职能', '人事', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', '集成显卡', '8GB+8GB', '希捷1T(机械)', '无', 'JY-DELL-SP2318H-004', NULL, '');
INSERT INTO `cmdb_pc` VALUES (5, 'YW-PC-MSI-B250M-LB-005', '张芳', '职能', '人事', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB', '希捷1T(机械)', '无', 'JY-DELL-P2317H-005', NULL, '');
INSERT INTO `cmdb_pc` VALUES (6, 'JY-PC-MSI-B250M-LB-006', '李文秀', '职能', '人事', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', '集成显卡', '8GB+8GB', '希捷1T(机械)', '无', 'JY-DELL-P2317H-006', NULL, '');
INSERT INTO `cmdb_pc` VALUES (7, 'WF-PC-MSI-B250M-LB-007', '李炼', '运维', '运维', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', 'NvidiaGTX1050(2GB)', '8GB+8GB', '希捷1T(机械)', '金士顿240G(固态)', 'WF-DELL-P2417H-007', 'WF-DELL-SP2318H-079', '');
INSERT INTO `cmdb_pc` VALUES (8, 'JY-PC-MSI-B250M-LB-008', '会议室', '公共资源', '公共资源', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB', '希捷3T(机械)', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (9, 'WF-PC-MSI-B250M-LB-009', '刘清勇', 'P01', '测试', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB+8GB', '金士顿240G(固态)', '希捷1T(机械)', 'JY-DELL-SP2318H-008', 'JY-DELL-SP2318H-080', '');
INSERT INTO `cmdb_pc` VALUES (10, 'JY-PC-MSI-B250M-LB-010', '周万良', 'P01', '测试', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB+8GB', '希捷1T(机械)', '无', 'WF-DELL-P2217H-009', 'WF-DELL-P2217H-081', '');
INSERT INTO `cmdb_pc` VALUES (11, 'WF-PC-MSI-B250M-LB-011', '张璀璀', 'P01', '测试', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '希捷1T(机械)', '三星256G(M2)', 'JY-DELL-P2419H-010', 'YW-DELL-SE2416HM-082', '');
INSERT INTO `cmdb_pc` VALUES (12, 'JY-PC-ASUS-H310M-LB-012', '李佳明', 'P01', '测试', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/Nvidia)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-011', 'JY-DELL-P2419H-083', '');
INSERT INTO `cmdb_pc` VALUES (13, 'JY-PC-MSI-B250M-LB-013', '王鸿飞', 'P01', '测试', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '希捷1T(机械)', '三星256G(M2)', 'JY-DELL-P2217H-012', 'WF-DELL-P2217H-084', '');
INSERT INTO `cmdb_pc` VALUES (14, 'JY-PC-MSI-B250M-LB-014', '阮邦武', 'P01', '测试', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB+8GB', '金士顿240G(固态)', '希捷1T(机械)', 'JY-DELL-P2317H-013', 'JY-DELL-P2317H-085', '');
INSERT INTO `cmdb_pc` VALUES (15, 'JY-PC-MSI-B250M-LB-015', '饶佳浩', 'P01', '测试', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB+8GB', '金士顿240G(固态)', '希捷1T(机械)', 'JY-DELL-P2217H-014', 'JY-DELL-P2217H-086', '');
INSERT INTO `cmdb_pc` VALUES (16, 'JY-PC-MSI-B250M-LB-016', '打包机', 'P01', '策划', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', '集成显卡', '8GB+8GB', '希捷1T(机械)', '无', 'YW-DELL-SE2416HM-015', NULL, '');
INSERT INTO `cmdb_pc` VALUES (17, 'YW-PC-MSI-B250M-LB-017', '尹乐', 'P01', '策划', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '金士顿240G(固态)', '无', 'YW-PHL-243V5-016', NULL, '');
INSERT INTO `cmdb_pc` VALUES (18, 'YW-PC-MSI-B250M-LB-018', '刘杰', 'P01', '策划', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '希捷3T(机械)', '金士顿240G(固态)', 'JY-DELL-SP2318H-017', NULL, '');
INSERT INTO `cmdb_pc` VALUES (19, 'JY-PC-MSI-B250M-LB-019', '敬茂春', 'P01', '策划', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/Nvidia)', '8GB+8GB', '西数120G(固态)', '西数1T(机械)', 'JY-DELL-SP2318H-018', 'JY-DELL-SP2318H-087', '');
INSERT INTO `cmdb_pc` VALUES (20, 'YW-PC-MSI-B250M-LB-020', '李扬', 'P01', '策划', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '16GB', '希捷3T(机械)', '三星256G(M2)', 'JY-DELL-SP2318H-019', 'JY-DELL-SP2318H-088', '');
INSERT INTO `cmdb_pc` VALUES (21, 'WF-PC-MSI-B250M-LB-021', '李正知', 'P01', '策划', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050Ti(4GB/七彩虹)', '8GB+8GB', '希捷1T(机械)', '无', 'JY-DELL-P2317H-020', 'JY-DELL-SP2318H-089', '');
INSERT INTO `cmdb_pc` VALUES (22, 'WF-PC-MSI-B250M-LB-022', '雷磊', 'P01', '策划', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/影驰)', '8GB', '希捷1T(机械)', '无', 'JY-DELL-P2317H-021', 'WF-DELL-P2217H-090', '');
INSERT INTO `cmdb_pc` VALUES (23, 'WF-PC-MSI-B250M-LB-023', '张惜璇', 'P01', '产品', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB', '希捷3T(机械)', '无', 'JY-DELL-P2419H-022', NULL, '');
INSERT INTO `cmdb_pc` VALUES (24, 'JY-PC-ASUS-H310M-LB-024', '魏虎', 'P01', '产品', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/耕昇)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-023', NULL, '');
INSERT INTO `cmdb_pc` VALUES (25, 'JY-PC-MSI-B250M-LB-025', '李元昊', 'P01', '服务器', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '希捷1T(机械)', '无', 'JY-DELL-SP2318H-024', 'JY-DELL-P2317H-091', '');
INSERT INTO `cmdb_pc` VALUES (26, 'JY-PC-MSI-B250M-LB-026', '李明松', 'P01', '服务器', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', 'NvidiaGTX1050(2GB/影驰)', '8GB+8GB', '金士顿240G(固态)', '希捷1T(机械)', 'JY-DELL-P2317H-025', 'JY-DELL-SP2318H-092', '');
INSERT INTO `cmdb_pc` VALUES (27, 'YW-PC-MSI-B250M-LB-027', '杨镔', 'P01', '服务器', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '金士顿240G(固态)', '无', 'WF-DELL-P2419H-026', 'JY-DELL-P2317H-093', '');
INSERT INTO `cmdb_pc` VALUES (28, 'JY-PC-MSI-B250M-LB-028', '魏孟欢', 'P01', '服务器', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB+8GB', '希捷1T(机械)', '西数240G(固态)', 'JY-DELL-SP2318H-027', 'JY-DELL-SP2318H-094', '');
INSERT INTO `cmdb_pc` VALUES (29, 'JY-PC-ASUS-H310M-LB-029', '马小龙', 'P01', '服务器', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1050TI(4GB/七彩虹)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2422H-028', 'JY-DELL-P2422H-095', '');
INSERT INTO `cmdb_pc` VALUES (30, 'WF-PC-MSI-B250M-LB-030', '张创创', 'P01', '美术', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050Ti(4GB/七彩虹)', '8GB+8GB', '希捷1T(机械)', '无', 'WF-DELL-P2217H-029', 'WF-DELL-P2217H-096', '');
INSERT INTO `cmdb_pc` VALUES (31, 'WF-PC-MSI-B250M-LB-031', '张喆', 'P01', '美术', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB+16GB', '希捷1T(机械)', '金士顿240G(固态)', 'WF-DELL-P2317H-030', 'WF-DELL-P2317H-097', '');
INSERT INTO `cmdb_pc` VALUES (32, 'WF-PC-MSI-B250M-LB-032', '彭显艺', 'P01', '美术', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '16GB+16GB', '希捷1T(机械)', '金士顿240G(固态)', 'WF-DELL-P2317H-031', 'WF-DELL-P2317H-098', '');
INSERT INTO `cmdb_pc` VALUES (33, 'WF-PC-MSI-B250M-LB-033', '李为', 'P01', '美术', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB+16GB', '希捷1T(机械)', '金士顿240G(固态)', 'WF-DELL-P2217H-032', 'WF-DELL-P2217H-099', '');
INSERT INTO `cmdb_pc` VALUES (34, 'WF-PC-MSI-B250M-LB-034', '王仕成', 'P01', '美术', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', 'NvidiaGTX1050(2GB/华硕)', '8GB+8GB', '希捷1T(机械)', '无', 'WF-DELL-P2317H-033', 'JY-DELL-SP2318H-100', '');
INSERT INTO `cmdb_pc` VALUES (35, 'WF-PC-MSI-B250M-LB-035', '王文君', 'P01', '美术', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '希捷3T(机械)', '无', 'WF-DELL-P2317H-034', 'WF-DELL-P2217H-101', '');
INSERT INTO `cmdb_pc` VALUES (36, 'JY-PC-MSI-B250M-LB-036', '秦迎天', 'P01', '美术', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/影驰)', '16GB+16GB', '希捷1T(机械)', '希捷1T(机械)', 'WF-DELL-P2217H-035', 'WF-DELL-P2417H-102', '');
INSERT INTO `cmdb_pc` VALUES (37, 'WF-PC-MSI-B250M-LB-037', '肖婷', 'P01', '美术', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '希捷3T(机械)', '无', 'WF-DELL-SP2318H-036', 'WF-DELL-P2317H-103', '');
INSERT INTO `cmdb_pc` VALUES (38, 'JY-PC-ASUS-H310M-LB-038', '补约约呷', 'P01', '美术', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/华硕)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-037', 'JY-DELL-P2419H-104', '');
INSERT INTO `cmdb_pc` VALUES (39, 'WF-PC-MSI-B250M-LB-039', '袁博伦离职闲置', 'P01', '美术', 'WF', '闲置', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+16GB', '希捷3T(机械)', '金士顿240G(固态)', 'WF-DELL-P2317H-038', 'WF-DELL-P2317H-105', '');
INSERT INTO `cmdb_pc` VALUES (40, 'WF-PC-MSI-B250M-LB-040', '颜安', 'P01', '美术', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB+16GB', '希捷1T(机械)', '金士顿240G(固态)', 'WF-DELL-P2317H-039', 'WF-DELL-P2317H-106', '');
INSERT INTO `cmdb_pc` VALUES (41, 'WF-PC-MSI-B250M-LB-041', '黄铃琳', 'P01', '美术', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '16GB+16GB', '希捷1T(机械)', '金士顿240G(固态)', 'WF-DELL-P2317H-040', 'WF-DELL-P2317H-107', '');
INSERT INTO `cmdb_pc` VALUES (42, 'WF-PC-MSI-B250M-LB-042', '黎湛波', 'P01', '美术', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+16GB', '希捷1T(机械)', '三星256G(M2)', 'WF-DELL-P2317H-041', 'WF-DELL-P2317H-108', '');
INSERT INTO `cmdb_pc` VALUES (43, 'JY-PC-MSI-B250M-LB-043', '刘国超', 'P01', '平台', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB+8GB', '希捷1T(机械)', '无', 'JY-DELL-P2317H-042', 'YW-DELL-SP2318H-109', '');
INSERT INTO `cmdb_pc` VALUES (44, 'WF-PC-MSI-B250M-LB-044', '冯浩', 'P01', '客户端', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '16GB', '希捷3T(机械)', '无', 'WF-DELL-P2217H-043', 'WF-DELL-SP2318H-110', '');
INSERT INTO `cmdb_pc` VALUES (45, 'JY-PC-MSI-B250M-LB-045', '曾欣', 'P01', '客户端', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei7-7700', 'MSI-B250M', 'NvidiaGTX1050(2GB/影驰)', '8GB+8GB', '金士顿240G(固态)', '希捷1T(机械)', 'JY-DELL-SP2318H-044', 'JY-DELL-SP2318H-111', '');
INSERT INTO `cmdb_pc` VALUES (46, 'JY-PC-ASUS-H310M-LB-046', '李渊博', 'P01', '客户端', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/华硕)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-045', 'JY-DELL-P2419H-112', '');
INSERT INTO `cmdb_pc` VALUES (47, 'JY-PC-ASUS-H310M-LB-047', '杨健', 'P01', '客户端', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/华硕)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-046', 'JY-DELL-P2419H-113', '');
INSERT INTO `cmdb_pc` VALUES (48, 'JY-PC-MSI-B250M-LB-048', '董云龙', 'P01', '客户端', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '16GB', '金士顿240G(固态)', '希捷1T(机械)', 'JY-DELL-SP2318H-047', 'JY-DELL-SP2318H-114', '');
INSERT INTO `cmdb_pc` VALUES (49, 'JY-PC-MSI-B250M-LB-049', '谢文', 'P01', '客户端', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB+8GB', '希捷1T(机械)', '金士顿240G(固态)', 'WF-DELL-P2217H-048', 'YW-DELL-SP2318H-115', '');
INSERT INTO `cmdb_pc` VALUES (50, 'JY-PC-ASUS-H310M-LB-050', '侯天昊', 'P11', '测试', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1050Ti(4GB/Nvidia)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-049', 'JY-DELL-P2419H-116', '');
INSERT INTO `cmdb_pc` VALUES (51, 'JY-PC-ASUS-H310M-LB-051', '张波', 'P11', '测试', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/Nvidia)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2319H-050', 'JY-DELL-P2319H-117', '');
INSERT INTO `cmdb_pc` VALUES (52, 'JY-PC-ASUS-H310M-LB-052', '朱珺成', 'P11', '测试', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/华硕)', '8GB+8GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-051', 'JY-DELL-P2419H-118', '');
INSERT INTO `cmdb_pc` VALUES (53, 'JY-PC-ASUS-H310M-LB-053', '牟泉林', 'P11', '测试', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/华硕)', '16GB', '希捷1T(机械)', '西数240G(固态)', 'WF-DELL-SP2318H-052', 'WF-DELL-P2417H-119', '');
INSERT INTO `cmdb_pc` VALUES (54, 'WF-PC-MSI-B250M-LB-054', '任杰', 'P11', '策划', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '希捷1T(机械)', '无', 'JY-DELL-P2317H-053', 'WF-DELL-P2217H-120', '');
INSERT INTO `cmdb_pc` VALUES (55, 'JY-PC-ASUS-H310M-LB-055', '包永杰', 'P11', '策划', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/七彩虹)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-054', 'JY-DELL-P2419H-121', '');
INSERT INTO `cmdb_pc` VALUES (56, 'JY-PC-ASUS-H310M-LB-056', '朱恒', 'P11', '策划', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/耕昇)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-055', 'JY-DELL-P2419H-122', '');
INSERT INTO `cmdb_pc` VALUES (57, 'JY-PC-ASUS-H310M-LB-057', '王未婉', 'P11', '策划', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/七彩虹)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-056', NULL, '');
INSERT INTO `cmdb_pc` VALUES (58, 'JY-PC-ASUS-H310M-LB-058', '余毕桦', 'P11', '程序', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/Nvidia)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-057', 'JY-DELL-P2419H-123', '');
INSERT INTO `cmdb_pc` VALUES (59, 'YW-PC-MSI-B250M-LB-059', '崔斌', 'P11', '程序', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '希捷3T(机械)', '无', 'JY-DELL-P2419H-058', 'JY-DELL-P2419H-124', '');
INSERT INTO `cmdb_pc` VALUES (60, 'JY-PC-ASUS-H310M-LB-060', '曾小帆', 'P11', '程序', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1050Ti(4GB/Nvidia)', '16GB', '希捷1T(机械)', '西数240G(固态)', 'JY-DELL-P2419H-059', 'JY-DELL-P2419H-125', '');
INSERT INTO `cmdb_pc` VALUES (61, 'JY-PC-ASUS-B250M-LB-061', '毛波', 'P11', '程序', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei7-7700', 'ASUS-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB+8GB', '希捷2T(机械)', '金士顿240G(固态)', 'JY-DELL-P2317H-060', 'JY-DELL-P2317H-126', '');
INSERT INTO `cmdb_pc` VALUES (62, 'JY-PC-ASUS-H310M-LB-062', '罗小龙', 'P11', '程序', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/耕昇)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-061', 'JY-DELL-P2419H-127', '');
INSERT INTO `cmdb_pc` VALUES (63, 'JY-PC-ASUS-H310M-LB-063', '许毅', 'P11', '程序', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/七彩虹)', '16GB', '希捷1T(机械)', '西数240G(固态)', 'JY-DELL-P2419H-062', 'JY-DELL-P2419H-128', '');
INSERT INTO `cmdb_pc` VALUES (64, 'JY-PC-ASUS-H310M-LB-064', '赵恩恩', 'P11', '程序', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/Nvidia)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-063', 'JY-DELL-P2419H-129', '');
INSERT INTO `cmdb_pc` VALUES (65, 'JY-PC-ASUS-H310M-LB-065', '金瑀', 'P11', '程序', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/七彩虹)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-064', 'JY-DELL-P2419H-130', '');
INSERT INTO `cmdb_pc` VALUES (66, 'JY-PC-MSI-B250M-LB-066', '陈文聪闲置', '无', '无', 'JY', '闲置', 'PC', 0, '2021/07/22', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', 'NvidiaGTX1050(2GB/索泰)', '8GB+8GB', '希捷1T(机械)', '无', NULL, NULL, '陈文聪置换的旧机器');
INSERT INTO `cmdb_pc` VALUES (67, 'JY-PC-MSI-B250M-LB-067', '龚明东', 'P11', '程序', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '16GB', '金士顿240G(固态)', '希捷1T(机械)', 'JY-DELL-SP2318H-066', 'JY-DELL-SP2318H-132', '');
INSERT INTO `cmdb_pc` VALUES (68, 'JY-PC-ASUS-H310M-LB-068', '刘鳌', 'P11', '美术', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/耕昇)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-067', 'JY-DELL-P2419H-133', '');
INSERT INTO `cmdb_pc` VALUES (69, 'JY-PC-ASUS-H310M-LB-069', '卢放', 'P11', '美术', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/七彩虹)', '16GB+16GB', '希捷1T(机械)', '西数240G(固态)', 'JY-DELL-P2419H-068', 'JY-DELL-P2419H-134', '');
INSERT INTO `cmdb_pc` VALUES (70, 'JY-PC-ASUS-H310M-LB-070', '周覃', 'P11', '美术', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/华硕)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-069', 'JY-DELL-P2419H-135', '');
INSERT INTO `cmdb_pc` VALUES (71, 'JY-PC-ASUS-H310M-LB-071', '唐婷婷', 'P11', '美术', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1050Ti(4GB/索泰)', '8GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-070', 'JY-DELL-P2419H-136', '');
INSERT INTO `cmdb_pc` VALUES (72, 'JY-PC-ASUS-H310M-LB-072', '孙雷', 'P11', '美术', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/Nvidia)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-071', 'JY-DELL-P2419H-137', '');
INSERT INTO `cmdb_pc` VALUES (73, 'JY-PC-ASUS-H310M-LB-073', '张诗雨', 'P11', '美术', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/华硕)', '16GB+16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-072', 'JY-DELL-P2419H-138', '');
INSERT INTO `cmdb_pc` VALUES (74, 'JY-PC-ASUS-H310M-LB-074', '戴宇行', 'P11', '美术', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/华硕)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-073', 'JY-DELL-P2419H-139', '');
INSERT INTO `cmdb_pc` VALUES (75, 'JY-PC-ASUS-H310M-LB-075', '林剑', 'P11', '美术', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/华硕)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-074', 'JY-DELL-P2419H-140', '');
INSERT INTO `cmdb_pc` VALUES (76, 'WF-PC-MSI-B250M-LB-076', '殷雨晴', 'P11', '美术', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '希捷3T(机械)', '无', 'JY-DELL-P2317H-075', 'WF-DELL-P2317H-141', '');
INSERT INTO `cmdb_pc` VALUES (77, 'JY-PC-ASUS-H310M-LB-077', '王飞', 'P11', '美术', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/华硕)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-076', 'JY-DELL-P2419H-142', '');
INSERT INTO `cmdb_pc` VALUES (78, 'JY-PC-ASUS-H310M-LB-078', '魏玉春', 'P11', '美术', 'JY', '使用中', 'PC', 0, '2021/01/01', '', 'LB', '英特尔Corei5-9400F', 'ASUS-H310M', 'NvidiaGTX1650(4GB/Nvidia)', '16GB', '西数240G(固态)', '希捷1T(机械)', 'JY-DELL-P2419H-077', 'JY-DELL-P2419H-143', '');
INSERT INTO `cmdb_pc` VALUES (79, 'YW-PC-MSI-B250M-LB-079', '外包01', 'P11', '外包', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '希捷1T(机械)', '金士顿120G(固态)', 'JY-DELL-P2419H-078', NULL, '');
INSERT INTO `cmdb_pc` VALUES (80, 'YW-PC-MSI-B250M-LB-080', '外包02', 'P11', '外包', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'NvidiaGTX1050(2GB/七彩虹)', '8GB+8GB', '金士顿240G(固态)', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (81, 'JY-PC-ASUS-H110M -LC-081', '闲置', '无', '无', 'JY', '闲置', 'PC', 0, '2020/01/01 ', '', 'LC', '英特尔Corei3-7100', 'ASUS-H110M ', '集成显卡', '无', '无', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (82, 'JY-PC-ASUS-H110M -LC-082', '闲置', '无', '无', 'JY', '闲置', 'PC', 0, '2020/01/01 ', '', 'LC', '英特尔Corei3-7100', 'ASUS-H110M ', '集成显卡', '无', '无', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (83, 'JY-PC-ASUS-H110M -LC-083', '闲置', '无', '无', 'JY', '闲置', 'PC', 0, '2020/01/01 ', '', 'LC', '英特尔Corei3-7100', 'ASUS-H110M ', 'GeForceGTX750(1G)', '无', '无', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (84, 'JY-PC-ASUS-B85-LB-084', '李炼测试机', '运维', '运维', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-4440', 'ASUS-B85', '集成显卡', '无', '无', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (85, 'YW-PC-MSI-B250M-LB-085', '约玩保留', '运维', '运维', 'YW', '保留', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', 'GeForceGTX750(1G)', '无', '金士顿120G(固态)', '希捷1T(机械)', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (86, 'JY-PC-MSI-B250M-LB-086', '旧共享保留', '运维', '运维', 'JY', '保留', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', '集成显卡', '无', '希捷2T(机械)', '希捷2T(机械)', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (87, 'JY-PC-MSI-B250M-LB-087', 'NS保留', '运维', '运维', 'JY', '保留', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', '集成显卡', '无', '希捷1T(机械)', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (88, 'JY-SVR-DELL-R420-LA-088', 'Samba服务器(OMV)', '运维', '运维', 'JY', '使用中', 'SVR', 0, '2020/01/01 ', '', 'LA', 'E5-2420v2', 'DELL-R420', '集成显卡', '32GB', '300G', '7T', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (89, 'JY-PC-MSI-B250M-LB-089', '备份SVN机器', '运维', '运维', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', '集成显卡', '8GB', '希捷1T(机械)', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (90, 'JY-PC-MSI-B250M-LB-090', 'SVN机器', '运维', '运维', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', '集成显卡', '16GB', '希捷1T(机械)', '2T', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (91, 'JY-PC-ASUS-Z390-LA-091', 'P01安卓打包机', 'P01', '客户端', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LA', '英特尔Corei9-9900k', 'ASUS-Z390', '集成显卡', '32GB', '1TSSD', '1TSSD', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (92, 'JY-PC-MSI-B250M-LB-092', 'P11测试机', 'P11', '程序', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', '集成显卡', '16GB', '希捷1T(机械)', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (93, 'JY-PC-MSI-B250M-LB-093', 'p01jenkins打包机', 'P01', '服务器', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', '集成显卡', '16GB', '希捷1T(机械)', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (94, 'JY-PC-MSI-B250M-LB-094', 'p01登录服测试', 'P01', '服务器', 'JY', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7400', 'MSI-B250M', '集成显卡', '16GB', '240G(固态)', '希捷1T(机械)', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (95, 'WF-PC-MSI-B250M-LB-095', 'p03测试', 'P11', '客户端', 'WF', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei5-7500', 'MSI-B250M', '集成显卡', '16GB', '希捷1T(机械)', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (96, 'YW-PC-TS250-LB-096', 'OA服务器', '运维', '运维', 'YW', '使用中', 'PC', 0, '2020/01/01 ', '', 'LB', '英特尔Corei3-7100', 'TS250', '集成显卡', '12GB', '希捷2T(机械)', '希捷2T(机械)', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (97, 'JY-SVR-DELL-T430-LA-097', 'p01内网测试服', 'P01', '服务器', 'JY', '使用中', 'SVR', 0, '2020/01/01 ', '', 'LA', 'E5-2603 v4', 'DELL-T430', '集成显卡', '16GB', '希捷1T(机械)', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (98, 'JY-SVR-MacMini-LB-098', 'p01IOS打包机', 'P01', '客户端', 'JY', '使用中', 'SVR', 0, '2020/01/01 ', '', 'LB', '英特尔Core i7', 'MacMini', '集成显卡', '32GB', '希捷1T(机械)', '无', NULL, NULL, '');
INSERT INTO `cmdb_pc` VALUES (99, 'JY-PC-ASUS-B46M-LA-99', '陈文聪', 'P11', '程序', 'JY', '使用中', 'PC', 0, '2021/7/20', '', 'LA', '英特尔Corei5-10600KF', 'ASUS-B460M', 'NvidiaGTX1650( 4 GB/技嘉 )', '16GB+16GB', '金士顿500G(固态)', '无', 'JY-DELL-P2317H-065', 'JY-DELL-SP2318H-131', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', '超级管理员', 0, '2019-01-09 16:09:27', '2021-07-16 14:33:49');
INSERT INTO `role` VALUES (2, 'staff', '普通用户', 0, '2021-05-10 17:02:44', '2021-07-16 11:48:15');
INSERT INTO `role` VALUES (3, 'test', '111', 1, '2021-07-16 14:54:39', '2021-07-16 14:54:39');

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 1, '', '', 0, '2021-05-10 14:45:55', '2021-05-10 14:46:17');
INSERT INTO `user` VALUES (2, 'staff', 'e10adc3949ba59abbe56e057f20f883e', '普通用户', 2, '', '', 0, '2021-05-10 18:29:58', '2021-06-21 15:42:16');

SET FOREIGN_KEY_CHECKS = 1;

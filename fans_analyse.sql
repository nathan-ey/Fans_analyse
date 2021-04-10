/*
 Navicat Premium Data Transfer

 Source Server         : fans数据分析
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : 8.134.62.33:3306
 Source Schema         : fans_analyse

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 07/04/2021 19:32:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_type
-- ----------------------------
DROP TABLE IF EXISTS `admin_type`;
CREATE TABLE `admin_type`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(1) NULL DEFAULT NULL COMMENT '0管理员  可乐只能创建管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin_type
-- ----------------------------
INSERT INTO `admin_type` VALUES (0, '超级管理员', 'superAdmin', 0);
INSERT INTO `admin_type` VALUES (1, '购粉管理员', 'shopAdmin', 0);
INSERT INTO `admin_type` VALUES (2, '接待管理员', 'realizationAdmin', 0);
INSERT INTO `admin_type` VALUES (3, '变现管理员', 'receptionAdmin', 0);
INSERT INTO `admin_type` VALUES (4, '接待成员', 'realizationUser', 2);
INSERT INTO `admin_type` VALUES (5, '变现成员', 'receptionUser', 3);

-- ----------------------------
-- Table structure for channel
-- ----------------------------
DROP TABLE IF EXISTS `channel`;
CREATE TABLE `channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(1) NULL DEFAULT 1,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of channel
-- ----------------------------

-- ----------------------------
-- Table structure for devices
-- ----------------------------
DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `status` int(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of devices
-- ----------------------------

-- ----------------------------
-- Table structure for devices_type
-- ----------------------------
DROP TABLE IF EXISTS `devices_type`;
CREATE TABLE `devices_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `status` int(1) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of devices_type
-- ----------------------------
INSERT INTO `devices_type` VALUES (1, '微信', 0, 0, 1);
INSERT INTO `devices_type` VALUES (2, '抖音', 0, 0, 1);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logLevel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 572 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, '可乐', '登录成功', 'debug', '1617274890');
INSERT INTO `log` VALUES (2, '可乐', '登录成功', 'debug', '1617276412');
INSERT INTO `log` VALUES (3, '可乐', '登录成功', 'debug', '1617276415');
INSERT INTO `log` VALUES (4, '可乐', '登录成功', 'debug', '1617276469');
INSERT INTO `log` VALUES (5, '可乐', '登录成功', 'debug', '1617276482');
INSERT INTO `log` VALUES (6, '可乐', '登录成功', 'debug', '1617276567');
INSERT INTO `log` VALUES (7, '可乐', '登录成功', 'debug', '1617276604');
INSERT INTO `log` VALUES (8, '可乐', '登录成功', 'debug', '1617276731');
INSERT INTO `log` VALUES (9, '可乐', '登录成功', 'debug', '1617276805');
INSERT INTO `log` VALUES (10, '可乐', '登录成功', 'debug', '1617276835');
INSERT INTO `log` VALUES (11, '可乐', '登录成功', 'debug', '1617276868');
INSERT INTO `log` VALUES (12, '可乐', '登录成功', 'debug', '1617276919');
INSERT INTO `log` VALUES (13, '可乐', '登录成功', 'debug', '1617276930');
INSERT INTO `log` VALUES (14, '可乐', '登录成功', 'debug', '1617276939');
INSERT INTO `log` VALUES (15, '可乐', '登录成功', 'debug', '1617276943');
INSERT INTO `log` VALUES (16, '可乐', '登录成功', 'debug', '1617276995');
INSERT INTO `log` VALUES (17, '可乐', '登录成功', 'debug', '1617278260');
INSERT INTO `log` VALUES (18, '可乐', '登录成功', 'debug', '1617278262');
INSERT INTO `log` VALUES (19, '可乐', '登录成功', 'debug', '1617278573');
INSERT INTO `log` VALUES (20, '可乐', '登录成功', 'debug', '1617278733');
INSERT INTO `log` VALUES (21, '可乐', '登录成功', 'debug', '1617278781');
INSERT INTO `log` VALUES (22, '可乐', '登录成功', 'debug', '1617278791');
INSERT INTO `log` VALUES (23, '可乐', '登录成功', 'debug', '1617278828');
INSERT INTO `log` VALUES (24, '可乐', '登录成功', 'debug', '1617284607');
INSERT INTO `log` VALUES (25, '可乐', '登录成功', 'debug', '1617342081');
INSERT INTO `log` VALUES (26, '可乐', '登录成功', 'debug', '1617342683');
INSERT INTO `log` VALUES (27, '可乐', '登录成功', 'debug', '1617342721');
INSERT INTO `log` VALUES (28, '可乐', '登录成功', 'debug', '1617342826');
INSERT INTO `log` VALUES (29, '可乐', '登录成功', 'debug', '1617342850');
INSERT INTO `log` VALUES (30, '可乐', '登录成功', 'debug', '1617343189');
INSERT INTO `log` VALUES (31, '可乐', '登录成功', 'debug', '1617343321');
INSERT INTO `log` VALUES (32, '可乐', '登录成功', 'debug', '1617343563');
INSERT INTO `log` VALUES (33, '可乐', '登录成功', 'debug', '1617343830');
INSERT INTO `log` VALUES (34, '可乐', '登录成功', 'debug', '1617343883');
INSERT INTO `log` VALUES (35, '可乐', '登录成功', 'debug', '1617344103');
INSERT INTO `log` VALUES (36, '可乐', '登录成功', 'debug', '1617344305');
INSERT INTO `log` VALUES (37, '可乐', '登录成功', 'debug', '1617344372');
INSERT INTO `log` VALUES (38, '可乐', '登录成功', 'debug', '1617344445');
INSERT INTO `log` VALUES (39, '可乐', '登录成功', 'debug', '1617344489');
INSERT INTO `log` VALUES (40, '可乐', '登录成功', 'debug', '1617344544');
INSERT INTO `log` VALUES (41, '可乐', '登录成功', 'debug', '1617344566');
INSERT INTO `log` VALUES (42, '可乐', '登录成功', 'debug', '1617344728');
INSERT INTO `log` VALUES (43, '可乐', '登录成功', 'debug', '1617344888');
INSERT INTO `log` VALUES (44, '可乐', '登录成功', 'debug', '1617345152');
INSERT INTO `log` VALUES (45, '可乐', '登录成功', 'debug', '1617609180');
INSERT INTO `log` VALUES (46, '可乐', '登录成功', 'debug', '1617609251');
INSERT INTO `log` VALUES (47, '可乐', '登录成功', 'debug', '1617609262');
INSERT INTO `log` VALUES (48, '可乐', '登录成功', 'debug', '1617609282');
INSERT INTO `log` VALUES (49, '可乐', '登录成功', 'debug', '1617609323');
INSERT INTO `log` VALUES (50, '可乐', '登录成功', 'debug', '1617609380');
INSERT INTO `log` VALUES (51, '可乐', '登录成功', 'debug', '1617609399');
INSERT INTO `log` VALUES (52, '可乐', '登录成功', 'debug', '1617609410');
INSERT INTO `log` VALUES (53, '可乐', '登录成功', 'debug', '1617609419');
INSERT INTO `log` VALUES (54, '可乐', '登录成功', 'debug', '1617609427');
INSERT INTO `log` VALUES (55, '可乐', '登录成功', 'debug', '1617609651');
INSERT INTO `log` VALUES (56, '可乐', '登录成功', 'debug', '1617609910');
INSERT INTO `log` VALUES (57, '可乐', '登录成功', 'debug', '1617609966');
INSERT INTO `log` VALUES (58, '可乐', '登录成功', 'debug', '1617610011');
INSERT INTO `log` VALUES (59, '可乐', '登录成功', 'debug', '1617610024');
INSERT INTO `log` VALUES (60, '可乐', '登录成功', 'debug', '1617610033');
INSERT INTO `log` VALUES (61, '可乐', '登录成功', 'debug', '1617610387');
INSERT INTO `log` VALUES (62, '可乐', '登录成功', 'debug', '1617611473');
INSERT INTO `log` VALUES (63, '可乐', '登录成功', 'debug', '1617611517');
INSERT INTO `log` VALUES (64, '可乐', '登录成功', 'debug', '1617611680');
INSERT INTO `log` VALUES (65, '可乐', '登录成功', 'debug', '1617614272');
INSERT INTO `log` VALUES (66, '可乐', '登录成功', 'debug', '1617614569');
INSERT INTO `log` VALUES (67, '可乐', '登录成功', 'debug', '1617616088');
INSERT INTO `log` VALUES (68, '可乐', '登录成功', 'debug', '1617616246');
INSERT INTO `log` VALUES (69, '可乐', '登录成功', 'debug', '1617616386');
INSERT INTO `log` VALUES (70, '可乐', '登录成功', 'debug', '1617616403');
INSERT INTO `log` VALUES (71, '可乐', '登录成功', 'debug', '1617616703');
INSERT INTO `log` VALUES (72, '可乐', '登录成功', 'debug', '1617616911');
INSERT INTO `log` VALUES (73, '可乐', '登录成功', 'debug', '1617616978');
INSERT INTO `log` VALUES (74, '可乐', '登录成功', 'debug', '1617617138');
INSERT INTO `log` VALUES (75, '可乐', '登录成功', 'debug', '1617617193');
INSERT INTO `log` VALUES (76, '可乐', '登录成功', 'debug', '1617617334');
INSERT INTO `log` VALUES (77, '可乐', '登录成功', 'debug', '1617617396');
INSERT INTO `log` VALUES (78, '可乐', '登录成功', 'debug', '1617617634');
INSERT INTO `log` VALUES (79, '可乐', '登录成功', 'debug', '1617618151');
INSERT INTO `log` VALUES (80, '可乐', '登录成功', 'debug', '1617618254');
INSERT INTO `log` VALUES (81, '可乐', '登录成功', 'debug', '1617618338');
INSERT INTO `log` VALUES (82, '可乐', '登录成功', 'debug', '1617618547');
INSERT INTO `log` VALUES (83, '可乐', '登录成功', 'debug', '1617618610');
INSERT INTO `log` VALUES (84, 'admin', '超级管理员 添加管理员:1', 'notice', '1617618615');
INSERT INTO `log` VALUES (85, 'admin', '超级管理员 添加管理员:2', 'notice', '1617618647');
INSERT INTO `log` VALUES (86, 'admin', '超级管理员 添加管理员:', 'notice', '1617618924');
INSERT INTO `log` VALUES (87, 'admin', '超级管理员 添加管理员:3', 'notice', '1617618992');
INSERT INTO `log` VALUES (88, 'admin', '超级管理员 添加管理员:4', 'notice', '1617619043');
INSERT INTO `log` VALUES (89, 'admin', '超级管理员 添加管理员:5', 'notice', '1617619081');
INSERT INTO `log` VALUES (90, '可乐', '登录成功', 'debug', '1617619854');
INSERT INTO `log` VALUES (91, '可乐', '登录成功', 'debug', '1617619924');
INSERT INTO `log` VALUES (92, '可乐', '登录成功', 'debug', '1617620000');
INSERT INTO `log` VALUES (93, '可乐', '登录成功', 'debug', '1617620107');
INSERT INTO `log` VALUES (94, 'admin', '超级管理员 添加管理员:6', 'notice', '1617620120');
INSERT INTO `log` VALUES (95, '可乐', '登录成功', 'debug', '1617621025');
INSERT INTO `log` VALUES (96, '可乐', '登录成功', 'debug', '1617621119');
INSERT INTO `log` VALUES (97, '可乐', '登录成功', 'debug', '1617621190');
INSERT INTO `log` VALUES (98, '可乐', '登录成功', 'debug', '1617621265');
INSERT INTO `log` VALUES (99, '可乐', '登录成功', 'debug', '1617621427');
INSERT INTO `log` VALUES (100, '可乐', '登录成功', 'debug', '1617621468');
INSERT INTO `log` VALUES (101, '可乐', '登录成功', 'debug', '1617621529');
INSERT INTO `log` VALUES (102, '可乐', '登录成功', 'debug', '1617621707');
INSERT INTO `log` VALUES (103, '可乐', '登录成功', 'debug', '1617621766');
INSERT INTO `log` VALUES (104, 'admin', '超级管理员 添加管理员:gfadmin', 'notice', '1617621855');
INSERT INTO `log` VALUES (105, 'admin', '超级管理员 添加管理员:jdadmin', 'notice', '1617621883');
INSERT INTO `log` VALUES (106, '可乐', '登录成功', 'debug', '1617621916');
INSERT INTO `log` VALUES (107, '可乐', '登录成功', 'debug', '1617622213');
INSERT INTO `log` VALUES (108, 'admin', '超级管理员 添加管理员:bxadmin', 'notice', '1617622288');
INSERT INTO `log` VALUES (109, '可乐', '登录成功', 'debug', '1617622298');
INSERT INTO `log` VALUES (110, '可乐', '登录成功', 'debug', '1617622357');
INSERT INTO `log` VALUES (111, 'admin', '超级管理员 添加管理员:2', 'notice', '1617622375');
INSERT INTO `log` VALUES (112, '可乐', '登录成功', 'debug', '1617622466');
INSERT INTO `log` VALUES (113, '可乐', '登录成功', 'debug', '1617622682');
INSERT INTO `log` VALUES (114, '可乐', '登录成功', 'debug', '1617622810');
INSERT INTO `log` VALUES (115, '可乐', '登录成功', 'debug', '1617622866');
INSERT INTO `log` VALUES (116, '可乐', '登录成功', 'debug', '1617622942');
INSERT INTO `log` VALUES (117, '可乐', '登录成功', 'debug', '1617623016');
INSERT INTO `log` VALUES (118, '可乐', '登录成功', 'debug', '1617623506');
INSERT INTO `log` VALUES (119, '可乐', '登录成功', 'debug', '1617623654');
INSERT INTO `log` VALUES (120, '可乐', '登录成功', 'debug', '1617623936');
INSERT INTO `log` VALUES (121, '可乐', '登录成功', 'debug', '1617623974');
INSERT INTO `log` VALUES (122, '可乐', '登录成功', 'debug', '1617624218');
INSERT INTO `log` VALUES (123, '可乐', '登录成功', 'debug', '1617624284');
INSERT INTO `log` VALUES (124, '可乐', '登录成功', 'debug', '1617624472');
INSERT INTO `log` VALUES (125, '可乐', '登录成功', 'debug', '1617624493');
INSERT INTO `log` VALUES (126, '可乐', '登录成功', 'debug', '1617624709');
INSERT INTO `log` VALUES (127, '可乐', '登录成功', 'debug', '1617624830');
INSERT INTO `log` VALUES (128, '可乐', '登录成功', 'debug', '1617624883');
INSERT INTO `log` VALUES (129, '可乐', '登录成功', 'debug', '1617624934');
INSERT INTO `log` VALUES (130, '可乐', '登录成功', 'debug', '1617625609');
INSERT INTO `log` VALUES (131, '可乐', '登录成功', 'debug', '1617625671');
INSERT INTO `log` VALUES (132, '可乐', '登录成功', 'debug', '1617625994');
INSERT INTO `log` VALUES (133, '可乐', '登录成功', 'debug', '1617626475');
INSERT INTO `log` VALUES (134, '可乐', '登录成功', 'debug', '1617626593');
INSERT INTO `log` VALUES (135, '可乐', '登录成功', 'debug', '1617626650');
INSERT INTO `log` VALUES (136, '可乐', '登录成功', 'debug', '1617626797');
INSERT INTO `log` VALUES (137, '可乐', '登录成功', 'debug', '1617626858');
INSERT INTO `log` VALUES (138, '可乐', '登录成功', 'debug', '1617626996');
INSERT INTO `log` VALUES (139, '可乐', '登录成功', 'debug', '1617627044');
INSERT INTO `log` VALUES (140, 'admin', '超级管理员 添加管理员:admin_shop', 'notice', '1617627270');
INSERT INTO `log` VALUES (141, 'admin_shop', '登录成功', 'debug', '1617627290');
INSERT INTO `log` VALUES (142, '可乐', '登录成功', 'debug', '1617627574');
INSERT INTO `log` VALUES (143, '可乐', '登录成功', 'debug', '1617627713');
INSERT INTO `log` VALUES (144, 'admin', '超级管理员 添加管理员:1', 'notice', '1617627784');
INSERT INTO `log` VALUES (145, 'admin', '超级管理员 添加管理员:2', 'notice', '1617627917');
INSERT INTO `log` VALUES (146, '可乐', '登录成功', 'debug', '1617628056');
INSERT INTO `log` VALUES (147, '可乐', '登录成功', 'debug', '1617628329');
INSERT INTO `log` VALUES (148, 'admin_shop', '登录成功', 'debug', '1617628893');
INSERT INTO `log` VALUES (149, 'admin_shop', '登录成功', 'debug', '1617629747');
INSERT INTO `log` VALUES (150, 'admin_shop', '登录成功', 'debug', '1617629842');
INSERT INTO `log` VALUES (151, 'admin_shop', '登录成功', 'debug', '1617629895');
INSERT INTO `log` VALUES (152, 'admin_shop', '登录成功', 'debug', '1617630124');
INSERT INTO `log` VALUES (153, 'admin_shop', '登录成功', 'debug', '1617630218');
INSERT INTO `log` VALUES (154, 'admin_shop', '登录成功', 'debug', '1617630273');
INSERT INTO `log` VALUES (155, 'admin_shop', '登录成功', 'debug', '1617630357');
INSERT INTO `log` VALUES (156, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617630763');
INSERT INTO `log` VALUES (157, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617630775');
INSERT INTO `log` VALUES (158, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617630780');
INSERT INTO `log` VALUES (159, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617630786');
INSERT INTO `log` VALUES (160, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617630791');
INSERT INTO `log` VALUES (161, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617630796');
INSERT INTO `log` VALUES (162, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617630801');
INSERT INTO `log` VALUES (163, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617630808');
INSERT INTO `log` VALUES (164, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617630815');
INSERT INTO `log` VALUES (165, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617630821');
INSERT INTO `log` VALUES (166, 'admin_shop', '登录成功', 'debug', '1617631334');
INSERT INTO `log` VALUES (167, 'admin_shop', '登录成功', 'debug', '1617631925');
INSERT INTO `log` VALUES (168, 'admin_shop', '登录成功', 'debug', '1617632004');
INSERT INTO `log` VALUES (169, 'admin_shop', '登录成功', 'debug', '1617632236');
INSERT INTO `log` VALUES (170, 'admin_shop', '登录成功', 'debug', '1617633503');
INSERT INTO `log` VALUES (171, 'admin_shop', '登录成功', 'debug', '1617633844');
INSERT INTO `log` VALUES (172, '可乐', '登录成功', 'debug', '1617633868');
INSERT INTO `log` VALUES (173, 'admin_shop', '登录成功', 'debug', '1617635621');
INSERT INTO `log` VALUES (174, '可乐', '登录成功', 'debug', '1617635716');
INSERT INTO `log` VALUES (175, 'admin_shop', '登录成功', 'debug', '1617635843');
INSERT INTO `log` VALUES (176, 'admin_shop', '登录成功', 'debug', '1617636216');
INSERT INTO `log` VALUES (177, '可乐', '登录成功', 'debug', '1617637903');
INSERT INTO `log` VALUES (178, '可乐', '登录成功', 'debug', '1617637937');
INSERT INTO `log` VALUES (179, 'admin_shop', '登录成功', 'debug', '1617639100');
INSERT INTO `log` VALUES (180, '可乐', '登录成功', 'debug', '1617639245');
INSERT INTO `log` VALUES (181, '可乐', '登录成功', 'debug', '1617639584');
INSERT INTO `log` VALUES (182, 'admin_shop', '登录成功', 'debug', '1617639874');
INSERT INTO `log` VALUES (183, '可乐', '登录成功', 'debug', '1617640613');
INSERT INTO `log` VALUES (184, 'admin_shop', '登录成功', 'debug', '1617640642');
INSERT INTO `log` VALUES (185, 'admin_shop', '登录成功', 'debug', '1617640684');
INSERT INTO `log` VALUES (186, 'admin_shop', '登录成功', 'debug', '1617641115');
INSERT INTO `log` VALUES (187, 'admin_shop', '登录成功', 'debug', '1617685314');
INSERT INTO `log` VALUES (188, 'admin_shop', '登录成功', 'debug', '1617685929');
INSERT INTO `log` VALUES (189, 'admin_shop', '登录成功', 'debug', '1617686030');
INSERT INTO `log` VALUES (190, 'admin_shop', '登录成功', 'debug', '1617687895');
INSERT INTO `log` VALUES (191, 'admin_shop', '登录成功', 'debug', '1617688433');
INSERT INTO `log` VALUES (192, 'admin_shop', '登录成功', 'debug', '1617688514');
INSERT INTO `log` VALUES (193, 'admin_shop', '登录成功', 'debug', '1617688942');
INSERT INTO `log` VALUES (194, 'admin_shop', '登录成功', 'debug', '1617689072');
INSERT INTO `log` VALUES (195, 'admin_shop', '登录成功', 'debug', '1617689102');
INSERT INTO `log` VALUES (196, 'admin_shop', '登录成功', 'debug', '1617689156');
INSERT INTO `log` VALUES (197, 'admin_shop', '登录成功', 'debug', '1617689169');
INSERT INTO `log` VALUES (198, 'admin_shop', '登录成功', 'debug', '1617689221');
INSERT INTO `log` VALUES (199, 'admin_shop', '登录成功', 'debug', '1617689263');
INSERT INTO `log` VALUES (200, 'admin_shop', '登录成功', 'debug', '1617689298');
INSERT INTO `log` VALUES (201, 'admin_shop', '登录成功', 'debug', '1617689358');
INSERT INTO `log` VALUES (202, 'admin_shop', '登录成功', 'debug', '1617689415');
INSERT INTO `log` VALUES (203, 'admin_shop', '登录成功', 'debug', '1617689508');
INSERT INTO `log` VALUES (204, 'admin_shop', '登录成功', 'debug', '1617689543');
INSERT INTO `log` VALUES (205, 'admin_shop', '登录成功', 'debug', '1617689576');
INSERT INTO `log` VALUES (206, 'admin_shop', '登录成功', 'debug', '1617690196');
INSERT INTO `log` VALUES (207, 'admin_shop', '登录成功', 'debug', '1617690735');
INSERT INTO `log` VALUES (208, 'admin_shop', '登录成功', 'debug', '1617690759');
INSERT INTO `log` VALUES (209, 'admin_shop', '登录成功', 'debug', '1617690849');
INSERT INTO `log` VALUES (210, 'admin_shop', '登录成功', 'debug', '1617690884');
INSERT INTO `log` VALUES (211, 'admin_shop', '登录成功', 'debug', '1617690931');
INSERT INTO `log` VALUES (212, 'admin_shop', '登录成功', 'debug', '1617690982');
INSERT INTO `log` VALUES (213, 'admin_shop', '登录成功', 'debug', '1617691010');
INSERT INTO `log` VALUES (214, 'admin_shop', '登录成功', 'debug', '1617691032');
INSERT INTO `log` VALUES (215, 'admin_shop', '登录成功', 'debug', '1617691137');
INSERT INTO `log` VALUES (216, 'admin_shop', '登录成功', 'debug', '1617691317');
INSERT INTO `log` VALUES (217, '可乐', '登录成功', 'debug', '1617691869');
INSERT INTO `log` VALUES (218, '可乐', '登录成功', 'debug', '1617691926');
INSERT INTO `log` VALUES (219, '可乐', '登录成功', 'debug', '1617691992');
INSERT INTO `log` VALUES (220, '可乐', '登录成功', 'debug', '1617692014');
INSERT INTO `log` VALUES (221, '可乐', '登录成功', 'debug', '1617692051');
INSERT INTO `log` VALUES (222, '可乐', '登录成功', 'debug', '1617692175');
INSERT INTO `log` VALUES (223, '可乐', '登录成功', 'debug', '1617692199');
INSERT INTO `log` VALUES (224, '可乐', '登录成功', 'debug', '1617692383');
INSERT INTO `log` VALUES (225, '可乐', '登录成功', 'debug', '1617692477');
INSERT INTO `log` VALUES (226, 'admin', '超级管理员 添加管理员:adminjd', 'notice', '1617692495');
INSERT INTO `log` VALUES (227, '可乐', '登录成功', 'debug', '1617693039');
INSERT INTO `log` VALUES (228, '可乐', '登录成功', 'debug', '1617693107');
INSERT INTO `log` VALUES (229, '可乐', '登录成功', 'debug', '1617693402');
INSERT INTO `log` VALUES (230, '可乐', '登录成功', 'debug', '1617693489');
INSERT INTO `log` VALUES (231, '可乐', '登录成功', 'debug', '1617693660');
INSERT INTO `log` VALUES (232, '可乐', '登录成功', 'debug', '1617693771');
INSERT INTO `log` VALUES (233, '可乐', '登录成功', 'debug', '1617693901');
INSERT INTO `log` VALUES (234, '可乐', '登录成功', 'debug', '1617694006');
INSERT INTO `log` VALUES (235, '可乐', '登录成功', 'debug', '1617694076');
INSERT INTO `log` VALUES (236, '可乐', '登录成功', 'debug', '1617694113');
INSERT INTO `log` VALUES (237, '可乐', '登录成功', 'debug', '1617694169');
INSERT INTO `log` VALUES (238, '可乐', '登录成功', 'debug', '1617694198');
INSERT INTO `log` VALUES (239, 'admin_shop', '登录成功', 'debug', '1617694259');
INSERT INTO `log` VALUES (240, '可乐', '登录成功', 'debug', '1617694440');
INSERT INTO `log` VALUES (241, '可乐', '登录成功', 'debug', '1617694513');
INSERT INTO `log` VALUES (242, 'admin', '超级管理员 添加管理员:a', 'notice', '1617694597');
INSERT INTO `log` VALUES (243, 'admin_shop', '登录成功', 'debug', '1617694659');
INSERT INTO `log` VALUES (244, 'admin_shop', '登录成功', 'debug', '1617694847');
INSERT INTO `log` VALUES (245, 'admin_shop', '登录成功', 'debug', '1617694882');
INSERT INTO `log` VALUES (246, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617694915');
INSERT INTO `log` VALUES (247, 'admin_shop', '登录成功', 'debug', '1617694966');
INSERT INTO `log` VALUES (248, 'admin_shop', '登录成功', 'debug', '1617695032');
INSERT INTO `log` VALUES (249, '可乐', '登录成功', 'debug', '1617695175');
INSERT INTO `log` VALUES (250, 'admin_shop', '登录成功', 'debug', '1617695393');
INSERT INTO `log` VALUES (251, '可乐', '登录成功', 'debug', '1617695504');
INSERT INTO `log` VALUES (252, '可乐', '登录成功', 'debug', '1617696178');
INSERT INTO `log` VALUES (253, 'admin', '超级管理员 添加管理员:admin1', 'notice', '1617696196');
INSERT INTO `log` VALUES (254, 'admin_shop', '登录成功', 'debug', '1617696448');
INSERT INTO `log` VALUES (255, 'admin_shop', '登录成功', 'debug', '1617696542');
INSERT INTO `log` VALUES (256, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617696606');
INSERT INTO `log` VALUES (257, '可乐', '登录成功', 'debug', '1617696632');
INSERT INTO `log` VALUES (258, '可乐', '登录成功', 'debug', '1617696718');
INSERT INTO `log` VALUES (259, 'admin_shop', '登录成功', 'debug', '1617696773');
INSERT INTO `log` VALUES (260, 'admin_shop', '登录成功', 'debug', '1617696920');
INSERT INTO `log` VALUES (261, '可乐', '登录成功', 'debug', '1617696938');
INSERT INTO `log` VALUES (262, 'admin_shop', '登录成功', 'debug', '1617697019');
INSERT INTO `log` VALUES (263, '可乐', '登录成功', 'debug', '1617697067');
INSERT INTO `log` VALUES (264, 'admin_shop', '登录成功', 'debug', '1617697108');
INSERT INTO `log` VALUES (265, 'admin_shop', '登录成功', 'debug', '1617697708');
INSERT INTO `log` VALUES (266, 'admin_shop', '登录成功', 'debug', '1617698049');
INSERT INTO `log` VALUES (267, 'admin_shop', '登录成功', 'debug', '1617698140');
INSERT INTO `log` VALUES (268, 'admin_shop', '购物管理严删除了渠道', 'notice', '1617698147');
INSERT INTO `log` VALUES (269, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617698158');
INSERT INTO `log` VALUES (270, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617698167');
INSERT INTO `log` VALUES (271, 'admin_shop', '购物管理严删除了渠道', 'notice', '1617698172');
INSERT INTO `log` VALUES (272, 'admin_shop', '登录成功', 'debug', '1617698214');
INSERT INTO `log` VALUES (273, 'admin_shop', '登录成功', 'debug', '1617698251');
INSERT INTO `log` VALUES (274, 'admin_shop', '购物管理严添加了渠道', 'notice', '1617698301');
INSERT INTO `log` VALUES (275, 'admin_shop', '登录成功', 'debug', '1617698461');
INSERT INTO `log` VALUES (276, 'admin_shop', '购物管理严删除了渠道', 'notice', '1617698468');
INSERT INTO `log` VALUES (277, '可乐', '登录成功', 'debug', '1617698575');
INSERT INTO `log` VALUES (278, '可乐', '登录成功', 'debug', '1617698872');
INSERT INTO `log` VALUES (279, '可乐', '登录成功', 'debug', '1617699159');
INSERT INTO `log` VALUES (280, '可乐', '登录成功', 'debug', '1617700607');
INSERT INTO `log` VALUES (281, '可乐', '登录成功', 'debug', '1617700860');
INSERT INTO `log` VALUES (282, '可乐', '登录成功', 'debug', '1617700899');
INSERT INTO `log` VALUES (283, 'admin_shop', '登录成功', 'debug', '1617700914');
INSERT INTO `log` VALUES (284, 'admin', '超级管理员 添加管理员:admin_receive', 'notice', '1617701124');
INSERT INTO `log` VALUES (285, '可乐', '登录成功', 'debug', '1617701334');
INSERT INTO `log` VALUES (286, 'admin_receive', '登录成功', 'debug', '1617701654');
INSERT INTO `log` VALUES (287, '可乐', '登录成功', 'debug', '1617701686');
INSERT INTO `log` VALUES (288, '可乐', '登录成功', 'debug', '1617701686');
INSERT INTO `log` VALUES (289, '可乐', '登录成功', 'debug', '1617701687');
INSERT INTO `log` VALUES (290, 'admin_receive', '登录成功', 'debug', '1617701722');
INSERT INTO `log` VALUES (291, 'admin_shop', '登录成功', 'debug', '1617701754');
INSERT INTO `log` VALUES (292, 'admin_shop', '登录成功', 'debug', '1617702218');
INSERT INTO `log` VALUES (293, 'admin_receive', '登录成功', 'debug', '1617703272');
INSERT INTO `log` VALUES (294, 'admin_receive', '登录成功', 'debug', '1617703900');
INSERT INTO `log` VALUES (295, 'admin_receive', '登录成功', 'debug', '1617703979');
INSERT INTO `log` VALUES (296, 'admin_receive', '登录成功', 'debug', '1617704096');
INSERT INTO `log` VALUES (297, 'admin_receive', '登录成功', 'debug', '1617704207');
INSERT INTO `log` VALUES (298, 'admin_receive', '登录成功', 'debug', '1617704487');
INSERT INTO `log` VALUES (299, 'admin_receive', '登录成功', 'debug', '1617704650');
INSERT INTO `log` VALUES (300, 'admin_receive', '登录成功', 'debug', '1617704989');
INSERT INTO `log` VALUES (301, 'admin_shop', '登录成功', 'debug', '1617705023');
INSERT INTO `log` VALUES (302, 'admin_receive', '登录成功', 'debug', '1617705196');
INSERT INTO `log` VALUES (303, 'admin_receive', '登录成功', 'debug', '1617705610');
INSERT INTO `log` VALUES (304, 'admin_receive', '登录成功', 'debug', '1617705748');
INSERT INTO `log` VALUES (305, 'admin_receive', '登录成功', 'debug', '1617706001');
INSERT INTO `log` VALUES (306, 'admin_receive', '登录成功', 'debug', '1617706113');
INSERT INTO `log` VALUES (307, 'admin_receive', '登录成功', 'debug', '1617706668');
INSERT INTO `log` VALUES (308, 'admin_receive', '登录成功', 'debug', '1617706768');
INSERT INTO `log` VALUES (309, 'admin_receive', '登录成功', 'debug', '1617706829');
INSERT INTO `log` VALUES (310, 'admin_receive', '登录成功', 'debug', '1617707066');
INSERT INTO `log` VALUES (311, 'admin_receive', '登录成功', 'debug', '1617707266');
INSERT INTO `log` VALUES (312, 'admin_receive', '登录成功', 'debug', '1617707464');
INSERT INTO `log` VALUES (313, 'admin_receive', '登录成功', 'debug', '1617708345');
INSERT INTO `log` VALUES (314, 'admin_receive', '登录成功', 'debug', '1617709487');
INSERT INTO `log` VALUES (315, 'admin_receive', '超级管理员 添加管理员:sss', 'notice', '1617709492');
INSERT INTO `log` VALUES (316, 'admin_receive', '登录成功', 'debug', '1617709560');
INSERT INTO `log` VALUES (317, 'admin_receive', '登录成功', 'debug', '1617709616');
INSERT INTO `log` VALUES (318, 'admin_receive', '登录成功', 'debug', '1617709637');
INSERT INTO `log` VALUES (319, 'admin_receive', '登录成功', 'debug', '1617709737');
INSERT INTO `log` VALUES (320, 'admin_receive', '超级管理员 添加管理员:aa', 'notice', '1617709830');
INSERT INTO `log` VALUES (321, 'admin_receive', '登录成功', 'debug', '1617709861');
INSERT INTO `log` VALUES (322, 'admin_receive', '超级管理员 添加管理员:zy', 'notice', '1617709905');
INSERT INTO `log` VALUES (323, 'admin_receive', '登录成功', 'debug', '1617710028');
INSERT INTO `log` VALUES (324, '组员1', '登录成功', 'debug', '1617710112');
INSERT INTO `log` VALUES (325, '组员1', '登录成功', 'debug', '1617710223');
INSERT INTO `log` VALUES (326, 'admin_receive', '登录成功', 'debug', '1617710254');
INSERT INTO `log` VALUES (327, '可乐', '登录成功', 'debug', '1617710502');
INSERT INTO `log` VALUES (328, '组员1', '登录成功', 'debug', '1617711010');
INSERT INTO `log` VALUES (329, '组员1', '登录成功', 'debug', '1617711040');
INSERT INTO `log` VALUES (330, 'admin_shop', '登录成功', 'debug', '1617711714');
INSERT INTO `log` VALUES (331, '组员1', '登录成功', 'debug', '1617711883');
INSERT INTO `log` VALUES (332, '组员1', '登录成功', 'debug', '1617711931');
INSERT INTO `log` VALUES (333, '组员1', '登录成功', 'debug', '1617711987');
INSERT INTO `log` VALUES (334, '组员1', '登录成功', 'debug', '1617712047');
INSERT INTO `log` VALUES (335, '组员1', '登录成功', 'debug', '1617712097');
INSERT INTO `log` VALUES (336, '组员1', '登录成功', 'debug', '1617712209');
INSERT INTO `log` VALUES (337, '组员1', '登录成功', 'debug', '1617712284');
INSERT INTO `log` VALUES (338, '组员1', '登录成功', 'debug', '1617712791');
INSERT INTO `log` VALUES (339, 'admin_receive', '登录成功', 'debug', '1617712982');
INSERT INTO `log` VALUES (340, 'admin_receive', '登录成功', 'debug', '1617713226');
INSERT INTO `log` VALUES (341, 'admin_receive', '登录成功', 'debug', '1617713324');
INSERT INTO `log` VALUES (342, 'admin_receive', '登录成功', 'debug', '1617713362');
INSERT INTO `log` VALUES (343, 'admin_receive', '登录成功', 'debug', '1617713626');
INSERT INTO `log` VALUES (344, 'admin_receive', '登录成功', 'debug', '1617713689');
INSERT INTO `log` VALUES (345, '组员1', '登录成功', 'debug', '1617713798');
INSERT INTO `log` VALUES (346, 'admin_receive', '登录成功', 'debug', '1617714182');
INSERT INTO `log` VALUES (347, 'admin_receive', '登录成功', 'debug', '1617714661');
INSERT INTO `log` VALUES (348, 'admin_receive', '登录成功', 'debug', '1617714864');
INSERT INTO `log` VALUES (349, 'admin_receive', '登录成功', 'debug', '1617714904');
INSERT INTO `log` VALUES (350, 'admin_receive', '登录成功', 'debug', '1617715093');
INSERT INTO `log` VALUES (351, 'admin_receive', '登录成功', 'debug', '1617715322');
INSERT INTO `log` VALUES (352, 'admin_receive', '登录成功', 'debug', '1617715382');
INSERT INTO `log` VALUES (353, 'admin_receive', '超级管理员 添加管理员:ab', 'notice', '1617715429');
INSERT INTO `log` VALUES (354, '组员2', '登录成功', 'debug', '1617715451');
INSERT INTO `log` VALUES (355, 'admin_receive', '登录成功', 'debug', '1617715884');
INSERT INTO `log` VALUES (356, 'admin_receive', '登录成功', 'debug', '1617715997');
INSERT INTO `log` VALUES (357, 'admin_receive', '登录成功', 'debug', '1617716217');
INSERT INTO `log` VALUES (358, 'admin_receive', '登录成功', 'debug', '1617716330');
INSERT INTO `log` VALUES (359, 'admin_receive', '登录成功', 'debug', '1617716379');
INSERT INTO `log` VALUES (360, 'admin_receive', '登录成功', 'debug', '1617716518');
INSERT INTO `log` VALUES (361, 'admin_receive', '登录成功', 'debug', '1617716571');
INSERT INTO `log` VALUES (362, 'admin_receive', '登录成功', 'debug', '1617716650');
INSERT INTO `log` VALUES (363, 'admin_receive', '登录成功', 'debug', '1617716700');
INSERT INTO `log` VALUES (364, 'admin_receive', '登录成功', 'debug', '1617716872');
INSERT INTO `log` VALUES (365, 'admin_receive', '登录成功', 'debug', '1617717143');
INSERT INTO `log` VALUES (366, 'admin_receive', '登录成功', 'debug', '1617717268');
INSERT INTO `log` VALUES (367, 'admin_receive', '登录成功', 'debug', '1617717293');
INSERT INTO `log` VALUES (368, 'admin_receive', '登录成功', 'debug', '1617717332');
INSERT INTO `log` VALUES (369, 'admin_receive', '登录成功', 'debug', '1617717392');
INSERT INTO `log` VALUES (370, 'admin_receive', '登录成功', 'debug', '1617717460');
INSERT INTO `log` VALUES (371, 'admin_receive', '登录成功', 'debug', '1617717715');
INSERT INTO `log` VALUES (372, 'admin_receive', '登录成功', 'debug', '1617717991');
INSERT INTO `log` VALUES (373, 'admin_receive', '登录成功', 'debug', '1617718028');
INSERT INTO `log` VALUES (374, 'admin_receive', '登录成功', 'debug', '1617718227');
INSERT INTO `log` VALUES (375, 'admin_receive', '登录成功', 'debug', '1617718276');
INSERT INTO `log` VALUES (376, 'admin_receive', '登录成功', 'debug', '1617718353');
INSERT INTO `log` VALUES (377, 'admin_receive', '登录成功', 'debug', '1617718387');
INSERT INTO `log` VALUES (378, 'admin_receive', '登录成功', 'debug', '1617718522');
INSERT INTO `log` VALUES (379, 'admin_receive', '登录成功', 'debug', '1617718560');
INSERT INTO `log` VALUES (380, 'admin_receive', '登录成功', 'debug', '1617718593');
INSERT INTO `log` VALUES (381, 'admin_receive', '登录成功', 'debug', '1617718664');
INSERT INTO `log` VALUES (382, 'admin_receive', '登录成功', 'debug', '1617718692');
INSERT INTO `log` VALUES (383, 'admin_receive', '登录成功', 'debug', '1617718867');
INSERT INTO `log` VALUES (384, 'admin_receive', '登录成功', 'debug', '1617718970');
INSERT INTO `log` VALUES (385, 'admin_receive', '登录成功', 'debug', '1617720757');
INSERT INTO `log` VALUES (386, 'admin_receive', '登录成功', 'debug', '1617720783');
INSERT INTO `log` VALUES (387, 'admin_receive', '登录成功', 'debug', '1617720976');
INSERT INTO `log` VALUES (388, 'admin_receive', '登录成功', 'debug', '1617721001');
INSERT INTO `log` VALUES (389, 'admin_receive', '登录成功', 'debug', '1617721111');
INSERT INTO `log` VALUES (390, 'admin_receive', '登录成功', 'debug', '1617721277');
INSERT INTO `log` VALUES (391, 'admin_receive', '登录成功', 'debug', '1617721396');
INSERT INTO `log` VALUES (392, '组员1', '登录成功', 'debug', '1617721531');
INSERT INTO `log` VALUES (393, 'admin_receive', '登录成功', 'debug', '1617721623');
INSERT INTO `log` VALUES (394, 'admin_receive', '登录成功', 'debug', '1617721681');
INSERT INTO `log` VALUES (395, '可乐', '登录成功', 'debug', '1617721835');
INSERT INTO `log` VALUES (396, 'admin_receive', '登录成功', 'debug', '1617722129');
INSERT INTO `log` VALUES (397, 'admin_receive', '登录成功', 'debug', '1617722368');
INSERT INTO `log` VALUES (398, 'admin_receive', '登录成功', 'debug', '1617722584');
INSERT INTO `log` VALUES (399, 'admin_receive', '登录成功', 'debug', '1617722684');
INSERT INTO `log` VALUES (400, 'admin_receive', '登录成功', 'debug', '1617722922');
INSERT INTO `log` VALUES (401, 'admin_receive', '登录成功', 'debug', '1617723473');
INSERT INTO `log` VALUES (402, 'admin_receive', '登录成功', 'debug', '1617723530');
INSERT INTO `log` VALUES (403, 'admin_receive', '登录成功', 'debug', '1617723602');
INSERT INTO `log` VALUES (404, 'admin_receive', '登录成功', 'debug', '1617723824');
INSERT INTO `log` VALUES (405, 'admin_receive', '登录成功', 'debug', '1617723862');
INSERT INTO `log` VALUES (406, 'admin_receive', '登录成功', 'debug', '1617723892');
INSERT INTO `log` VALUES (407, 'admin_receive', '登录成功', 'debug', '1617723942');
INSERT INTO `log` VALUES (408, 'admin_receive', '登录成功', 'debug', '1617723984');
INSERT INTO `log` VALUES (409, 'admin_receive', '登录成功', 'debug', '1617724221');
INSERT INTO `log` VALUES (410, 'admin_receive', '登录成功', 'debug', '1617724419');
INSERT INTO `log` VALUES (411, 'admin_receive', '登录成功', 'debug', '1617724462');
INSERT INTO `log` VALUES (412, 'admin_receive', '登录成功', 'debug', '1617724532');
INSERT INTO `log` VALUES (413, 'admin_receive', '登录成功', 'debug', '1617724604');
INSERT INTO `log` VALUES (414, 'admin_receive', '登录成功', 'debug', '1617724705');
INSERT INTO `log` VALUES (415, 'admin_receive', '登录成功', 'debug', '1617724773');
INSERT INTO `log` VALUES (416, 'admin_receive', '登录成功', 'debug', '1617724979');
INSERT INTO `log` VALUES (417, 'admin_receive', '登录成功', 'debug', '1617725023');
INSERT INTO `log` VALUES (418, 'admin_receive', '登录成功', 'debug', '1617725279');
INSERT INTO `log` VALUES (419, 'admin_receive', '登录成功', 'debug', '1617725500');
INSERT INTO `log` VALUES (420, 'admin_receive', '登录成功', 'debug', '1617725706');
INSERT INTO `log` VALUES (421, 'admin_receive', '登录成功', 'debug', '1617725877');
INSERT INTO `log` VALUES (422, 'admin_receive', '登录成功', 'debug', '1617725958');
INSERT INTO `log` VALUES (423, 'admin_receive', '登录成功', 'debug', '1617726078');
INSERT INTO `log` VALUES (424, 'admin_receive', '登录成功', 'debug', '1617726358');
INSERT INTO `log` VALUES (425, 'admin_receive', '登录成功', 'debug', '1617726465');
INSERT INTO `log` VALUES (426, 'admin_receive', '登录成功', 'debug', '1617726532');
INSERT INTO `log` VALUES (427, 'admin_receive', '登录成功', 'debug', '1617728200');
INSERT INTO `log` VALUES (428, 'admin_receive', '登录成功', 'debug', '1617728320');
INSERT INTO `log` VALUES (429, 'admin_receive', '登录成功', 'debug', '1617728385');
INSERT INTO `log` VALUES (430, 'admin_receive', '登录成功', 'debug', '1617728443');
INSERT INTO `log` VALUES (431, 'admin_receive', '登录成功', 'debug', '1617728551');
INSERT INTO `log` VALUES (432, 'admin_receive', '登录成功', 'debug', '1617728587');
INSERT INTO `log` VALUES (433, 'admin_receive', '登录成功', 'debug', '1617728816');
INSERT INTO `log` VALUES (434, 'admin_receive', '登录成功', 'debug', '1617728924');
INSERT INTO `log` VALUES (435, 'admin_receive', '登录成功', 'debug', '1617728988');
INSERT INTO `log` VALUES (436, 'admin_receive', '登录成功', 'debug', '1617729045');
INSERT INTO `log` VALUES (437, 'admin_receive', '登录成功', 'debug', '1617729093');
INSERT INTO `log` VALUES (438, 'admin_receive', '登录成功', 'debug', '1617729249');
INSERT INTO `log` VALUES (439, 'admin_receive', '登录成功', 'debug', '1617729313');
INSERT INTO `log` VALUES (440, 'admin_receive', '登录成功', 'debug', '1617729497');
INSERT INTO `log` VALUES (441, 'admin_receive', '登录成功', 'debug', '1617729704');
INSERT INTO `log` VALUES (442, 'admin_receive', '登录成功', 'debug', '1617729798');
INSERT INTO `log` VALUES (443, '组员1', '登录成功', 'debug', '1617729885');
INSERT INTO `log` VALUES (444, 'admin_receive', '登录成功', 'debug', '1617729907');
INSERT INTO `log` VALUES (445, 'admin_receive', '登录成功', 'debug', '1617772430');
INSERT INTO `log` VALUES (446, 'admin_receive', '登录成功', 'debug', '1617773428');
INSERT INTO `log` VALUES (447, 'admin_receive', '超级管理员 添加管理员:xiaoming', 'notice', '1617773894');
INSERT INTO `log` VALUES (448, 'admin_receive', '超级管理员 添加管理员:xiaohong', 'notice', '1617773909');
INSERT INTO `log` VALUES (449, '小红', '登录成功', 'debug', '1617773921');
INSERT INTO `log` VALUES (450, 'xiaoming', '登录成功', 'debug', '1617774018');
INSERT INTO `log` VALUES (451, 'admin_receive', '登录成功', 'debug', '1617774057');
INSERT INTO `log` VALUES (452, 'admin_receive', '登录成功', 'debug', '1617775701');
INSERT INTO `log` VALUES (453, '组员1', '登录成功', 'debug', '1617775919');
INSERT INTO `log` VALUES (454, '小红', '登录成功', 'debug', '1617776046');
INSERT INTO `log` VALUES (455, '组员1', '登录成功', 'debug', '1617776165');
INSERT INTO `log` VALUES (456, '组员1', '登录成功', 'debug', '1617776243');
INSERT INTO `log` VALUES (457, '组员1', '登录成功', 'debug', '1617776279');
INSERT INTO `log` VALUES (458, '组员1', '登录成功', 'debug', '1617776347');
INSERT INTO `log` VALUES (459, '小红', '登录成功', 'debug', '1617776359');
INSERT INTO `log` VALUES (460, '组员1', '登录成功', 'debug', '1617776366');
INSERT INTO `log` VALUES (461, 'admin_receive', '登录成功', 'debug', '1617776464');
INSERT INTO `log` VALUES (462, 'admin_receive', '登录成功', 'debug', '1617776530');
INSERT INTO `log` VALUES (463, 'admin_receive', '登录成功', 'debug', '1617776569');
INSERT INTO `log` VALUES (464, 'admin_receive', '登录成功', 'debug', '1617776641');
INSERT INTO `log` VALUES (465, '组员1', '登录成功', 'debug', '1617776732');
INSERT INTO `log` VALUES (466, 'admin_receive', '登录成功', 'debug', '1617777084');
INSERT INTO `log` VALUES (467, 'admin_receive', '登录成功', 'debug', '1617777118');
INSERT INTO `log` VALUES (468, 'admin_receive', '登录成功', 'debug', '1617777119');
INSERT INTO `log` VALUES (469, 'admin_receive', '登录成功', 'debug', '1617777345');
INSERT INTO `log` VALUES (470, 'admin_receive', '登录成功', 'debug', '1617777608');
INSERT INTO `log` VALUES (471, '可乐', '登录成功', 'debug', '1617777686');
INSERT INTO `log` VALUES (472, 'admin_receive', '登录成功', 'debug', '1617778528');
INSERT INTO `log` VALUES (473, 'admin_receive', '登录成功', 'debug', '1617778563');
INSERT INTO `log` VALUES (474, 'admin_receive', '登录成功', 'debug', '1617778674');
INSERT INTO `log` VALUES (475, 'admin_receive', '登录成功', 'debug', '1617778768');
INSERT INTO `log` VALUES (476, 'admin_receive', '登录成功', 'debug', '1617778898');
INSERT INTO `log` VALUES (477, '组员1', '登录成功', 'debug', '1617779044');
INSERT INTO `log` VALUES (478, 'admin_receive', '登录成功', 'debug', '1617779478');
INSERT INTO `log` VALUES (479, '组员1', '登录成功', 'debug', '1617779553');
INSERT INTO `log` VALUES (480, '可乐', '登录成功', 'debug', '1617779873');
INSERT INTO `log` VALUES (481, 'admin_receive', '登录成功', 'debug', '1617779913');
INSERT INTO `log` VALUES (482, 'admin_receive', '登录成功', 'debug', '1617780100');
INSERT INTO `log` VALUES (483, 'admin_receive', '登录成功', 'debug', '1617780199');
INSERT INTO `log` VALUES (484, 'admin_receive', '登录成功', 'debug', '1617780662');
INSERT INTO `log` VALUES (485, 'admin_receive', '登录成功', 'debug', '1617780747');
INSERT INTO `log` VALUES (486, 'admin_receive', '登录成功', 'debug', '1617780779');
INSERT INTO `log` VALUES (487, 'admin_receive', '登录成功', 'debug', '1617780824');
INSERT INTO `log` VALUES (488, 'admin_receive', '登录成功', 'debug', '1617781157');
INSERT INTO `log` VALUES (489, 'admin_receive', '登录成功', 'debug', '1617781482');
INSERT INTO `log` VALUES (490, 'admin_receive', '登录成功', 'debug', '1617781919');
INSERT INTO `log` VALUES (491, 'admin_receive', '登录成功', 'debug', '1617782292');
INSERT INTO `log` VALUES (492, 'admin_receive', '登录成功', 'debug', '1617782332');
INSERT INTO `log` VALUES (493, '组员1', '登录成功', 'debug', '1617782484');
INSERT INTO `log` VALUES (494, '组员1', '登录成功', 'debug', '1617782700');
INSERT INTO `log` VALUES (495, '组员1', '登录成功', 'debug', '1617782733');
INSERT INTO `log` VALUES (496, '组员1', '登录成功', 'debug', '1617782796');
INSERT INTO `log` VALUES (497, '组员1', '登录成功', 'debug', '1617782852');
INSERT INTO `log` VALUES (498, 'admin_receive', '登录成功', 'debug', '1617782860');
INSERT INTO `log` VALUES (499, 'admin_receive', '登录成功', 'debug', '1617782943');
INSERT INTO `log` VALUES (500, 'admin_receive', '登录成功', 'debug', '1617782986');
INSERT INTO `log` VALUES (501, 'admin_receive', '登录成功', 'debug', '1617783008');
INSERT INTO `log` VALUES (502, 'admin_receive', '登录成功', 'debug', '1617783076');
INSERT INTO `log` VALUES (503, 'admin_receive', '登录成功', 'debug', '1617783163');
INSERT INTO `log` VALUES (504, '组员1', '登录成功', 'debug', '1617783260');
INSERT INTO `log` VALUES (505, 'admin_receive', '登录成功', 'debug', '1617783776');
INSERT INTO `log` VALUES (506, '组员1', '登录成功', 'debug', '1617783905');
INSERT INTO `log` VALUES (507, 'admin_receive', '登录成功', 'debug', '1617784027');
INSERT INTO `log` VALUES (508, '可乐', '登录成功', 'debug', '1617784160');
INSERT INTO `log` VALUES (509, 'admin_receive', '登录成功', 'debug', '1617784339');
INSERT INTO `log` VALUES (510, 'admin_receive', '登录成功', 'debug', '1617784434');
INSERT INTO `log` VALUES (511, 'admin_receive', '登录成功', 'debug', '1617784462');
INSERT INTO `log` VALUES (512, 'admin_receive', '登录成功', 'debug', '1617784640');
INSERT INTO `log` VALUES (513, 'admin_receive', '登录成功', 'debug', '1617784930');
INSERT INTO `log` VALUES (514, '组员1', '登录成功', 'debug', '1617785211');
INSERT INTO `log` VALUES (515, '可乐', '登录成功', 'debug', '1617785264');
INSERT INTO `log` VALUES (516, 'admin_shop', '登录成功', 'debug', '1617785283');
INSERT INTO `log` VALUES (517, 'admin', '超级管理员 添加管理员:admin_reception', 'notice', '1617785502');
INSERT INTO `log` VALUES (518, 'admin_reception', '登录成功', 'debug', '1617785822');
INSERT INTO `log` VALUES (519, '可乐', '登录成功', 'debug', '1617785945');
INSERT INTO `log` VALUES (520, '组员1', '登录成功', 'debug', '1617786003');
INSERT INTO `log` VALUES (521, 'admin_reception', '登录成功', 'debug', '1617787545');
INSERT INTO `log` VALUES (522, 'admin_reception', '登录成功', 'debug', '1617787728');
INSERT INTO `log` VALUES (523, 'admin_reception', '登录成功', 'debug', '1617788339');
INSERT INTO `log` VALUES (524, 'admin_reception', '登录成功', 'debug', '1617788353');
INSERT INTO `log` VALUES (525, 'admin_receive', '登录成功', 'debug', '1617788439');
INSERT INTO `log` VALUES (526, 'admin_reception', '登录成功', 'debug', '1617788473');
INSERT INTO `log` VALUES (527, 'admin_reception', '登录成功', 'debug', '1617788791');
INSERT INTO `log` VALUES (528, 'admin_reception', '登录成功', 'debug', '1617788861');
INSERT INTO `log` VALUES (529, 'admin_reception', '登录成功', 'debug', '1617788980');
INSERT INTO `log` VALUES (530, 'admin_reception', '登录成功', 'debug', '1617789082');
INSERT INTO `log` VALUES (531, '组员1', '登录成功', 'debug', '1617789130');
INSERT INTO `log` VALUES (532, '可乐', '登录成功', 'debug', '1617789197');
INSERT INTO `log` VALUES (533, '可乐', '登录成功', 'debug', '1617789341');
INSERT INTO `log` VALUES (534, 'admin_receive', '登录成功', 'debug', '1617789851');
INSERT INTO `log` VALUES (535, '组员1', '登录成功', 'debug', '1617789881');
INSERT INTO `log` VALUES (536, 'admin_shop', '登录成功', 'debug', '1617790071');
INSERT INTO `log` VALUES (537, 'admin_reception', '登录成功', 'debug', '1617790728');
INSERT INTO `log` VALUES (538, 'admin_receive', '登录成功', 'debug', '1617791135');
INSERT INTO `log` VALUES (539, '可乐', '登录成功', 'debug', '1617791267');
INSERT INTO `log` VALUES (540, '可乐', '登录成功', 'debug', '1617791572');
INSERT INTO `log` VALUES (541, '可乐', '登录成功', 'debug', '1617791654');
INSERT INTO `log` VALUES (542, '可乐', '登录成功', 'debug', '1617791752');
INSERT INTO `log` VALUES (543, '可乐', '登录成功', 'debug', '1617791902');
INSERT INTO `log` VALUES (544, '可乐', '登录成功', 'debug', '1617791957');
INSERT INTO `log` VALUES (545, '可乐', '登录成功', 'debug', '1617792050');
INSERT INTO `log` VALUES (546, '可乐', '登录成功', 'debug', '1617792207');
INSERT INTO `log` VALUES (547, 'admin_shop', '登录成功', 'debug', '1617792256');
INSERT INTO `log` VALUES (548, '可乐', '登录成功', 'debug', '1617792735');
INSERT INTO `log` VALUES (549, 'admin_shop', '登录成功', 'debug', '1617792743');
INSERT INTO `log` VALUES (550, 'admin_shop', '登录成功', 'debug', '1617792863');
INSERT INTO `log` VALUES (551, 'admin_shop', '登录成功', 'debug', '1617793117');
INSERT INTO `log` VALUES (552, 'admin_shop', '登录成功', 'debug', '1617793177');
INSERT INTO `log` VALUES (553, 'admin_receive', '登录成功', 'debug', '1617793203');
INSERT INTO `log` VALUES (554, 'admin_reception', '登录成功', 'debug', '1617793293');
INSERT INTO `log` VALUES (555, '组员1', '登录成功', 'debug', '1617793426');
INSERT INTO `log` VALUES (556, '组员1', '登录成功', 'debug', '1617793526');
INSERT INTO `log` VALUES (557, '组员1', '登录成功', 'debug', '1617793562');
INSERT INTO `log` VALUES (558, '组员1', '登录成功', 'debug', '1617793595');
INSERT INTO `log` VALUES (559, '组员1', '登录成功', 'debug', '1617793672');
INSERT INTO `log` VALUES (560, 'admin_shop', '登录成功', 'debug', '1617793882');
INSERT INTO `log` VALUES (561, 'admin_shop', '登录成功', 'debug', '1617794381');
INSERT INTO `log` VALUES (562, 'admin_shop', '登录成功', 'debug', '1617794439');
INSERT INTO `log` VALUES (563, 'admin_shop', '登录成功', 'debug', '1617794546');
INSERT INTO `log` VALUES (564, '组员1', '登录成功', 'debug', '1617794672');
INSERT INTO `log` VALUES (565, '组员1', '登录成功', 'debug', '1617794713');
INSERT INTO `log` VALUES (566, 'admin_receive', '登录成功', 'debug', '1617794836');
INSERT INTO `log` VALUES (567, 'admin_shop', '登录成功', 'debug', '1617794841');
INSERT INTO `log` VALUES (568, 'admin_reception', '登录成功', 'debug', '1617794929');
INSERT INTO `log` VALUES (569, '组员1', '登录成功', 'debug', '1617794941');
INSERT INTO `log` VALUES (570, '组员1', '登录成功', 'debug', '1617795013');
INSERT INTO `log` VALUES (571, 'admin_receive', '登录成功', 'debug', '1617795098');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(1) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, '熊猫App', '测试', 1, 0, 0);
INSERT INTO `project` VALUES (2, '蚂蚁', '测试', 1, 0, 0);
INSERT INTO `project` VALUES (3, '熊猫真', '测试', 1, 1617788481, 1617788481);
INSERT INTO `project` VALUES (5, '熊猫假', '123', 1, 1617788805, 1617789087);

-- ----------------------------
-- Table structure for realization_task
-- ----------------------------
DROP TABLE IF EXISTS `realization_task`;
CREATE TABLE `realization_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nums` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of realization_task
-- ----------------------------

-- ----------------------------
-- Table structure for reception_list
-- ----------------------------
DROP TABLE IF EXISTS `reception_list`;
CREATE TABLE `reception_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nums` int(11) NOT NULL,
  `devices_type_id` int(11) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reception_list
-- ----------------------------

-- ----------------------------
-- Table structure for reception_orders
-- ----------------------------
DROP TABLE IF EXISTS `reception_orders`;
CREATE TABLE `reception_orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `devices_id` int(11) NOT NULL,
  `doing_nums` int(11) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `reception_list_id` int(11) NULL DEFAULT 0,
  `devices_type_id` int(11) NOT NULL COMMENT '设备类型',
  `project_id` int(11) NOT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of reception_orders
-- ----------------------------

-- ----------------------------
-- Table structure for shop_orders
-- ----------------------------
DROP TABLE IF EXISTS `shop_orders`;
CREATE TABLE `shop_orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `money` decimal(11, 2) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` int(11) NOT NULL COMMENT '//设备类型',
  `device_id` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `num` int(11) NOT NULL COMMENT '购买数量',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `channel_id`(`channel_id`) USING BTREE,
  INDEX `device_id`(`device_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shop_orders
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` int(1) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT 1 COMMENT '状态 1 正常  2禁用',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated_at` int(11) NULL DEFAULT NULL,
  `created_at` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 0, 1, 'R42jjp6dbA8O7AUyDkitbArZmayCD47hS5by', '可乐', 1617273950, 1617273950);
INSERT INTO `user` VALUES (13, 'admin_shop', '123456789', 1, 1, 'apzDUqjYXB4XULq1TIAiYM7I6G4QV81viz7a', '购粉', 1617789249, 1617627270);
INSERT INTO `user` VALUES (19, 'admin_receive', '123456', 2, 1, 'AevRKgv1deJ9u8rMoU3mS4Sx2y6PyUDVVSWh', '接待', 1617789243, 1617701124);
INSERT INTO `user` VALUES (22, 'zy', '123456', 4, 1, 'X1D5ylnhRv528oJ5c7c0do6uiWEUKvg63ku5', '组员1', 1617709905, 1617709905);
INSERT INTO `user` VALUES (23, 'ab', 'ab', 4, 1, 'XLh4qt0Yp8BH4nShFfdFvthOv1ibf8wGmxtQ', '组员2', 1617715429, 1617715429);
INSERT INTO `user` VALUES (24, 'xiaoming', 'xiaoming', 4, 1, '3x6km1fOWNDjtEyjMOfcdqIc5bIs8VlOz5Jp', '小明', 1617789871, 1617773894);
INSERT INTO `user` VALUES (25, 'xiaohong', 'xiaohong', 4, 1, 'iieAcsGH6H8sVWfXOY2UwRytiFb9KvsVYJZV', '小红', 1617773909, 1617773909);
INSERT INTO `user` VALUES (26, 'admin_reception', 'admin_reception', 3, 1, '4MyaUPOGsWw1yUXbWtAaqtBFjzMmAAh1XPub', '变现', 1617789231, 1617785502);

SET FOREIGN_KEY_CHECKS = 1;

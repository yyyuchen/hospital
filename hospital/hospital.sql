/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : hospital

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 13/11/2021 11:59:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area`  (
  `areaId` int NOT NULL AUTO_INCREMENT,
  `areaName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`areaId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES (4, '河南省a有限公司 ');
INSERT INTO `area` VALUES (5, '南阳市药品有限公司');
INSERT INTO `area` VALUES (6, '西安市药品有限公司');
INSERT INTO `area` VALUES (7, '河南省药品批发中心');

-- ----------------------------
-- Table structure for ban
-- ----------------------------
DROP TABLE IF EXISTS `ban`;
CREATE TABLE `ban`  (
  `bid` int NOT NULL AUTO_INCREMENT,
  `bname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ban
-- ----------------------------
INSERT INTO `ban` VALUES (1, '有班');
INSERT INTO `ban` VALUES (2, '无班');

-- ----------------------------
-- Table structure for baoque
-- ----------------------------
DROP TABLE IF EXISTS `baoque`;
CREATE TABLE `baoque`  (
  `baoqueid` int NOT NULL AUTO_INCREMENT,
  `baoqueName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `baoqueNum` int NULL DEFAULT NULL,
  PRIMARY KEY (`baoqueid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of baoque
-- ----------------------------
INSERT INTO `baoque` VALUES (33, '阿莫西林', 20);
INSERT INTO `baoque` VALUES (34, '板蓝根', 100);

-- ----------------------------
-- Table structure for bed
-- ----------------------------
DROP TABLE IF EXISTS `bed`;
CREATE TABLE `bed`  (
  `bedId` int NOT NULL AUTO_INCREMENT,
  `bedname` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `departmentId` int NOT NULL,
  `state` int NULL DEFAULT NULL,
  `Price` double NULL DEFAULT NULL,
  PRIMARY KEY (`bedId`) USING BTREE,
  INDEX `fk_bedDepartmentid`(`departmentId`) USING BTREE,
  CONSTRAINT `fk_bedDepartmentid` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bed
-- ----------------------------
INSERT INTO `bed` VALUES (8, '外科1', 8, 0, 10);
INSERT INTO `bed` VALUES (9, '内科一', 7, 1, 10);
INSERT INTO `bed` VALUES (10, '外科2', 8, 0, 10);
INSERT INTO `bed` VALUES (11, '外科3', 8, 0, 10);
INSERT INTO `bed` VALUES (12, '外科4', 8, 0, 10);
INSERT INTO `bed` VALUES (13, '内科二', 7, 1, 10);
INSERT INTO `bed` VALUES (14, '内科三', 7, 1, 10);
INSERT INTO `bed` VALUES (15, '内科四', 7, 1, 10);

-- ----------------------------
-- Table structure for caigou
-- ----------------------------
DROP TABLE IF EXISTS `caigou`;
CREATE TABLE `caigou`  (
  `caigouid` int NOT NULL AUTO_INCREMENT,
  `caigouname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gonghuoshang` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `danwei` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `candi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `leixing` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shuliang` int NULL DEFAULT NULL,
  PRIMARY KEY (`caigouid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of caigou
-- ----------------------------
INSERT INTO `caigou` VALUES (16, '阿莫西林', '春天大药房 ', '盒', '河南省a有限公司 ', '西药', 20);
INSERT INTO `caigou` VALUES (17, '千年人参', '康复大药店', '袋', '西安市药品有限公司', '中药', 14);

-- ----------------------------
-- Table structure for cashier
-- ----------------------------
DROP TABLE IF EXISTS `cashier`;
CREATE TABLE `cashier`  (
  `cashier` int NOT NULL AUTO_INCREMENT,
  `reportId` int NOT NULL,
  `durgname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `durgnum` int NOT NULL,
  `repiceprice` double NOT NULL,
  `repicetotal` double NOT NULL,
  `state` int NULL DEFAULT NULL,
  `ctime` date NULL DEFAULT NULL,
  `ostate` int NULL DEFAULT NULL,
  `jie` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mstate` int NULL DEFAULT NULL,
  PRIMARY KEY (`cashier`) USING BTREE,
  INDEX `fk_reportId`(`reportId`) USING BTREE,
  CONSTRAINT `fk_reportId` FOREIGN KEY (`reportId`) REFERENCES `report` (`reportid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cashier
-- ----------------------------
INSERT INTO `cashier` VALUES (34, 28, '板蓝根', 1, 30, 30, 0, '2019-11-21', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (35, 28, '阿莫西林', 1, 30, 30, 0, '2019-11-21', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (36, 28, '挂号费', 1, 30, 30, 2, '2019-11-21', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (37, 29, 'ct', 1, 100, 100, 1, '2019-11-21', 1, '脑部肿瘤', 1);
INSERT INTO `cashier` VALUES (38, 29, '打针', 1, 20, 20, 1, '2019-11-21', 0, NULL, 1);
INSERT INTO `cashier` VALUES (39, 30, '阿莫西林', 1, 30, 30, 0, '2019-11-21', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (40, 30, 'ct', 1, 100, 100, 1, '2019-11-21', 1, '良好', 1);
INSERT INTO `cashier` VALUES (41, 30, '挂号费', 1, 30, 30, 2, '2019-11-21', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (43, 31, 'ct', 1, 100, 100, 1, '2019-11-26', 1, '良好', 1);
INSERT INTO `cashier` VALUES (44, 31, '打针', 1, 20, 20, 1, '2019-11-26', 0, NULL, 1);
INSERT INTO `cashier` VALUES (45, 32, '板蓝根', 2, 30, 60, 0, '2021-04-05', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (46, 32, '阿莫西林', 1, 30, 30, 0, '2021-04-05', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (47, 32, 'ct', 1, 100, 100, 1, '2021-04-05', 1, NULL, 0);
INSERT INTO `cashier` VALUES (48, 32, '打针', 1, 20, 20, 1, '2021-04-05', 0, NULL, 0);
INSERT INTO `cashier` VALUES (49, 34, '阿莫西林', 1, 30, 30, 0, '2021-04-06', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (50, 34, '打针', 1, 20, 20, 1, '2021-04-06', 0, NULL, 1);
INSERT INTO `cashier` VALUES (51, 34, 'ct', 1, 100, 100, 1, '2021-04-06', 1, '没事儿', 1);
INSERT INTO `cashier` VALUES (52, 34, '板蓝根', 1, 30, 30, 0, '2021-04-06', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (53, 34, '挂号费', 1, 20, 20, 2, '2021-04-06', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (54, 36, '板蓝根', 5, 30, 150, 0, '2021-04-08', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (55, 36, '挂号费', 1, 30, 30, 2, '2021-04-08', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (56, 37, '阿莫西林', 1, 30, 30, 0, '2021-04-08', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (57, 37, '打针', 1, 20, 20, 1, '2021-04-08', 0, NULL, 1);
INSERT INTO `cashier` VALUES (58, 37, '挂号费', 1, 20, 20, 2, '2021-04-08', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (59, 38, 'ct', 1, 100, 100, 1, '2021-04-08', 1, '已检查', 1);
INSERT INTO `cashier` VALUES (60, 39, '血常规', 1, 18, 18, 1, '2021-04-08', 1, NULL, 0);
INSERT INTO `cashier` VALUES (61, 41, '百年枸杞', 2, 580, 1160, 0, '2021-04-09', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (62, 41, '挂号费', 1, 20, 20, 2, '2021-04-09', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (63, 45, '板蓝根', 3, 30, 90, 0, '2021-04-12', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (64, 45, '挂号费', 1, 20, 20, 2, '2021-04-12', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (65, 49, '盘尼西林', 1, 25, 25, 0, '2021-05-08', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (67, 51, '阿莫西林', 1, 30, 30, 0, '2021-05-14', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (69, 51, '打针', 1, 20, 20, 1, '2021-05-14', 0, NULL, 1);
INSERT INTO `cashier` VALUES (70, 51, '挂号费', 1, 20, 20, 2, '2021-05-14', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (71, 53, '阿莫西林', 1, 30, 30, 0, '2021-05-15', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (72, 53, '彩色B超', 1, 35, 35, 1, '2021-05-15', 1, NULL, 0);
INSERT INTO `cashier` VALUES (73, 55, '阿莫西林', 2, 30, 60, 0, '2021-05-22', NULL, NULL, NULL);
INSERT INTO `cashier` VALUES (74, 55, '盘尼西林', 2, 25, 50, 0, '2021-05-22', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for checkup
-- ----------------------------
DROP TABLE IF EXISTS `checkup`;
CREATE TABLE `checkup`  (
  `cid` int NOT NULL AUTO_INCREMENT,
  `registerid` int NULL DEFAULT NULL,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ctime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `fk_rid`(`registerid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of checkup
-- ----------------------------

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `departmentId` int NOT NULL AUTO_INCREMENT,
  `department` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`departmentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (7, '内科');
INSERT INTO `departments` VALUES (8, '外科');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor`  (
  `doctorId` int NOT NULL AUTO_INCREMENT,
  `doctorName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `departmentId` int NOT NULL,
  `registeredId` int NOT NULL,
  `dstate` int NULL DEFAULT NULL,
  `amStartTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '8:00',
  `amEndTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '12:00',
  `pmStartTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '14:00',
  `pmEndTime` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '18:00',
  PRIMARY KEY (`doctorId`) USING BTREE,
  INDEX `fk_department`(`departmentId`) USING BTREE,
  INDEX `fk_registeredtype`(`registeredId`) USING BTREE,
  CONSTRAINT `fk_department` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`departmentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_registeredtype` FOREIGN KEY (`registeredId`) REFERENCES `registeredtype` (`registeredid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES (13, '华佗', 7, 5, 0, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (14, '扁鹊', 7, 6, 0, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (15, '张春明', 7, 5, 1, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (16, '王二', 8, 5, 1, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (17, '王忠祥', 8, 5, 0, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (18, '赵晓峰', 8, 6, 0, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (19, '宋佳欣', 8, 5, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (20, '李春燕', 7, 5, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (21, '章小慧', 7, 5, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (22, '齐旭阳', 7, 6, 1, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (23, '陈韵', 8, 6, 1, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (24, '苏龙', 7, 5, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (25, '赵强', 7, 5, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (26, '陈晓飞', 7, 5, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (27, '王亚瑟', 8, 5, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (28, '张迪迪', 8, 5, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (29, '张明玉', 8, 5, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (30, '王磊', 7, 6, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (31, '赵娜娜', 7, 6, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (32, '苏小宝', 7, 6, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (33, '张晓娜', 8, 6, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (34, '李佳恒', 8, 6, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (35, '苏金桥', 7, 5, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (36, '雷佳鑫', 7, 5, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (37, '常小七', 7, 6, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (38, '毛木东', 7, 6, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (39, '吕思成', 8, 5, 3, '8:00', '12:00', '14:00', '18:00');
INSERT INTO `doctor` VALUES (40, '白美赛', 7, 6, 3, '8:00', '12:00', '14:00', '18:00');

-- ----------------------------
-- Table structure for drugdictionary
-- ----------------------------
DROP TABLE IF EXISTS `drugdictionary`;
CREATE TABLE `drugdictionary`  (
  `drugId` int NOT NULL AUTO_INCREMENT,
  `drugName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unitId` int NOT NULL,
  `sellingPrice` double NOT NULL,
  `areaId` int NOT NULL,
  `typeId` int NOT NULL,
  PRIMARY KEY (`drugId`) USING BTREE,
  INDEX `fk_unitid`(`unitId`) USING BTREE,
  INDEX `fk_areaId`(`areaId`) USING BTREE,
  INDEX `fk_typeId`(`typeId`) USING BTREE,
  CONSTRAINT `fk_areaId` FOREIGN KEY (`areaId`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_typeId` FOREIGN KEY (`typeId`) REFERENCES `type` (`typeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_unitid` FOREIGN KEY (`unitId`) REFERENCES `unit` (`unitid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of drugdictionary
-- ----------------------------
INSERT INTO `drugdictionary` VALUES (9, '阿莫西林', 7, 30, 4, 5);
INSERT INTO `drugdictionary` VALUES (10, '板蓝根', 9, 30, 4, 5);
INSERT INTO `drugdictionary` VALUES (11, '999感冒灵', 7, 18, 5, 5);
INSERT INTO `drugdictionary` VALUES (12, '千年人参', 9, 1000, 6, 6);
INSERT INTO `drugdictionary` VALUES (13, '盘尼西林', 7, 25, 7, 5);
INSERT INTO `drugdictionary` VALUES (14, '百年枸杞', 9, 580, 6, 6);

-- ----------------------------
-- Table structure for drugstore
-- ----------------------------
DROP TABLE IF EXISTS `drugstore`;
CREATE TABLE `drugstore`  (
  `rugstoreId` int NOT NULL AUTO_INCREMENT,
  `drugstoreName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplierId` int NULL DEFAULT NULL,
  `skullId` int NULL DEFAULT NULL,
  `warehouseId` int NULL DEFAULT NULL,
  `unit` int NOT NULL,
  `tradePrice` double NOT NULL,
  `sellingPrice` double NOT NULL,
  `area` int NOT NULL,
  `type` int NOT NULL,
  `produceDate` date NOT NULL,
  `validDate` date NOT NULL,
  `drugstorenum` int NOT NULL,
  `batch` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`rugstoreId`) USING BTREE,
  INDEX `fk_supplierId`(`supplierId`) USING BTREE,
  INDEX `fk_skullId`(`skullId`) USING BTREE,
  INDEX `fk_warehouseId`(`warehouseId`) USING BTREE,
  INDEX `fk_dgarea`(`area`) USING BTREE,
  INDEX `fk_dgunit`(`unit`) USING BTREE,
  INDEX `fk_dtype`(`type`) USING BTREE,
  CONSTRAINT `fk_dgarea` FOREIGN KEY (`area`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_dgunit` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_dtype` FOREIGN KEY (`type`) REFERENCES `type` (`typeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_skullId` FOREIGN KEY (`skullId`) REFERENCES `skull` (`skullid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_supplierId` FOREIGN KEY (`supplierId`) REFERENCES `upplier` (`supplierid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_warehouseId` FOREIGN KEY (`warehouseId`) REFERENCES `warehuose` (`warehouseid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of drugstore
-- ----------------------------
INSERT INTO `drugstore` VALUES (15, '盘尼西林', 7, 5, 2, 7, 12, 25, 7, 5, '2021-04-01', '2022-11-10', 50, '202148');
INSERT INTO `drugstore` VALUES (16, '阿莫西林', 7, 7, 2, 7, 12, 30, 4, 5, '2021-04-01', '2023-11-26', 90, '202148');
INSERT INTO `drugstore` VALUES (17, '阿莫西林', 7, 7, 2, 7, 12, 30, 4, 5, '2021-04-01', '2023-11-26', 100, '202148');
INSERT INTO `drugstore` VALUES (18, '阿莫西林', 7, 7, 2, 7, 12, 30, 4, 5, '2021-04-01', '2023-11-26', 100, '202148');
INSERT INTO `drugstore` VALUES (19, '板蓝根', 7, 5, 2, 7, 15, 30, 4, 5, '2021-04-01', '2021-04-07', 25, '202148');
INSERT INTO `drugstore` VALUES (21, '999感冒灵', 5, 5, 2, 7, 12, 18, 5, 5, '2021-04-01', '2022-01-01', 1000, '2021412');
INSERT INTO `drugstore` VALUES (22, '999感冒灵', 5, 5, 2, 7, 12, 18, 5, 5, '2021-04-01', '2022-01-01', 1000, '2021412');
INSERT INTO `drugstore` VALUES (23, '999感冒灵', 5, 5, 2, 7, 12, 18, 5, 5, '2021-04-01', '2022-01-01', 1000, '2021412');
INSERT INTO `drugstore` VALUES (24, '999感冒灵', 5, 5, 2, 7, 12, 18, 5, 5, '2021-04-01', '2022-01-01', 1000, '2021412');
INSERT INTO `drugstore` VALUES (25, '999感冒灵', 5, 5, 2, 7, 12, 18, 5, 5, '2021-04-01', '2022-01-01', 500, '2021412');
INSERT INTO `drugstore` VALUES (27, '999感冒灵', 5, 4, 2, 7, 12, 18, 5, 5, '2021-05-16', '2023-11-15', 1000, '2021514');
INSERT INTO `drugstore` VALUES (28, '999感冒灵', 5, 4, 2, 7, 12, 18, 5, 5, '2021-05-16', '2023-11-15', 1000, '2021514');

-- ----------------------------
-- Table structure for home
-- ----------------------------
DROP TABLE IF EXISTS `home`;
CREATE TABLE `home`  (
  `homeId` int NOT NULL AUTO_INCREMENT,
  `homeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `carId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`homeId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of home
-- ----------------------------
INSERT INTO `home` VALUES (73, '敲门', '男', 19, NULL, NULL);
INSERT INTO `home` VALUES (74, '魏坚', '男', 19, '412823199912242414', '17634525258');

-- ----------------------------
-- Table structure for hospitalprice
-- ----------------------------
DROP TABLE IF EXISTS `hospitalprice`;
CREATE TABLE `hospitalprice`  (
  `hospitalpriceid` int NOT NULL AUTO_INCREMENT,
  `registerId` int NOT NULL,
  `durgname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `durgnum` int NOT NULL,
  `repiceprice` double NOT NULL,
  `repicetotal` double NOT NULL,
  `htime` datetime NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  PRIMARY KEY (`hospitalpriceid`) USING BTREE,
  INDEX `fk_registerId`(`registerId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hospitalprice
-- ----------------------------
INSERT INTO `hospitalprice` VALUES (104, 12, '开颅手术', 1, 500, 500, '2019-11-21 15:12:26', 1);
INSERT INTO `hospitalprice` VALUES (105, 12, '阿莫西林', 2, 30, 60, '2019-11-21 15:13:47', 2);
INSERT INTO `hospitalprice` VALUES (106, 13, '板蓝根', 1, 30, 30, '2019-11-26 19:11:44', 0);
INSERT INTO `hospitalprice` VALUES (112, 14, '开颅手术', 1, 500, 500, '2021-04-06 22:52:09', 1);
INSERT INTO `hospitalprice` VALUES (109, 14, '开颅手术', 1, 500, 500, '2021-04-06 22:42:12', 1);
INSERT INTO `hospitalprice` VALUES (113, 14, '阿莫西林', 1, 30, 30, '2021-04-08 14:51:38', 2);
INSERT INTO `hospitalprice` VALUES (114, 15, '百年枸杞', 1, 580, 580, '2021-04-08 22:05:28', 2);
INSERT INTO `hospitalprice` VALUES (115, 15, '近视眼手术', 1, 500, 500, '2021-04-08 21:52:50', 1);
INSERT INTO `hospitalprice` VALUES (116, 16, '韧带连接手术', 1, 180, 180, '2021-04-12 17:10:01', 1);
INSERT INTO `hospitalprice` VALUES (118, 18, '板蓝根', 2, 30, 60, '2021-05-14 21:50:16', 2);
INSERT INTO `hospitalprice` VALUES (119, 18, '白内障切除', 1, 300, 300, '2021-05-14 21:49:57', 1);

-- ----------------------------
-- Table structure for huishou
-- ----------------------------
DROP TABLE IF EXISTS `huishou`;
CREATE TABLE `huishou`  (
  `huishouid` int NOT NULL AUTO_INCREMENT,
  `huishouname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `huishounumber` int NOT NULL,
  `huishoupihao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jbr` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `beizhu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`huishouid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of huishou
-- ----------------------------
INSERT INTO `huishou` VALUES (6, '板蓝根', 70, '20191121', '超级管理员', '药品出现质量问题');

-- ----------------------------
-- Table structure for inhospitaltype
-- ----------------------------
DROP TABLE IF EXISTS `inhospitaltype`;
CREATE TABLE `inhospitaltype`  (
  `inhospitalId` int NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit` int NOT NULL,
  `price` double NOT NULL,
  `bigprojectId` int NOT NULL,
  PRIMARY KEY (`inhospitalId`) USING BTREE,
  INDEX `fk_inhospitaltype`(`bigprojectId`) USING BTREE,
  INDEX `fk_inhunit`(`unit`) USING BTREE,
  CONSTRAINT `fk_inhospitaltype` FOREIGN KEY (`bigprojectId`) REFERENCES `projecttype` (`projectid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_inhunit` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inhospitaltype
-- ----------------------------

-- ----------------------------
-- Table structure for inoutpatienttype
-- ----------------------------
DROP TABLE IF EXISTS `inoutpatienttype`;
CREATE TABLE `inoutpatienttype`  (
  `inoutpatientId` int NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit` int NOT NULL,
  `bigproJectId` int NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`inoutpatientId`) USING BTREE,
  INDEX `fk_inoutpatienttype`(`bigproJectId`) USING BTREE,
  INDEX `fk_intunit`(`unit`) USING BTREE,
  CONSTRAINT `fk_inoutpatienttype` FOREIGN KEY (`bigproJectId`) REFERENCES `projecttype` (`projectid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_intunit` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inoutpatienttype
-- ----------------------------
INSERT INTO `inoutpatienttype` VALUES (5, '近视眼手术', 8, 1, 500);
INSERT INTO `inoutpatienttype` VALUES (6, '白内障切除', 8, 1, 300);
INSERT INTO `inoutpatienttype` VALUES (7, '韧带连接手术', 8, 1, 180);
INSERT INTO `inoutpatienttype` VALUES (8, '伤口缝合手术', 8, 1, 370);

-- ----------------------------
-- Table structure for jilu
-- ----------------------------
DROP TABLE IF EXISTS `jilu`;
CREATE TABLE `jilu`  (
  `jiluid` int NOT NULL AUTO_INCREMENT,
  `jiluname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jilutime` datetime NOT NULL,
  `jilutype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jilupeople` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jilunumber` int NULL DEFAULT NULL,
  `jilupihao` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`jiluid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 220 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of jilu
-- ----------------------------
INSERT INTO `jilu` VALUES (187, '板蓝根', '2019-11-21 14:58:00', '常规入库', '门诊', 100, '20191121');
INSERT INTO `jilu` VALUES (188, '阿莫西林', '2019-11-21 14:58:46', '常规入库', '门诊', 30, '20191121');
INSERT INTO `jilu` VALUES (189, '阿莫西林', '2019-11-21 14:59:42', '正常出库', '门诊', 20, '20191121');
INSERT INTO `jilu` VALUES (190, '板蓝根', '2019-11-21 14:59:49', '正常出库', '门诊', 50, '20191121');
INSERT INTO `jilu` VALUES (191, '板蓝根', '2019-11-21 15:17:48', '紧急补给药房', '门诊', 10, '20191121');
INSERT INTO `jilu` VALUES (192, '阿莫西林', '2019-11-21 15:24:55', '正常出库', '门诊', 10, '20191121');
INSERT INTO `jilu` VALUES (193, '百年枸杞', '2021-04-08 14:17:26', '常规入库', '超级管理员', 20, '202148');
INSERT INTO `jilu` VALUES (194, '板蓝根', '2021-04-08 14:18:51', '正常出库', '超级管理员', 10, '20191121');
INSERT INTO `jilu` VALUES (195, '板蓝根', '2021-04-08 14:19:55', '销毁过期药品', '超级管理员', 30, '20191121');
INSERT INTO `jilu` VALUES (196, '板蓝根', '2021-04-08 14:20:07', '正常出库', '超级管理员', 10, '20191121');
INSERT INTO `jilu` VALUES (197, '百年枸杞', '2021-04-08 14:23:08', '正常出库', '超级管理员', 20, '202148');
INSERT INTO `jilu` VALUES (198, '盘尼西林', '2021-04-08 14:25:05', '常规入库', '超级管理员', 100, '202148');
INSERT INTO `jilu` VALUES (199, '阿莫西林', '2021-04-08 14:25:51', '常规入库', '超级管理员', 100, '202148');
INSERT INTO `jilu` VALUES (200, '阿莫西林', '2021-04-08 14:25:51', '常规入库', '超级管理员', 100, '202148');
INSERT INTO `jilu` VALUES (201, '阿莫西林', '2021-04-08 14:25:51', '常规入库', '超级管理员', 100, '202148');
INSERT INTO `jilu` VALUES (202, '阿莫西林', '2021-04-08 14:26:30', '紧急补给药房', '超级管理员', 10, '202148');
INSERT INTO `jilu` VALUES (203, '千年人参', '2021-04-08 14:40:00', '常规入库', '超级管理员', 20, '202148');
INSERT INTO `jilu` VALUES (204, '阿莫西林', '2021-04-08 15:01:10', '处理回收药品', '超级管理员', 17, '20191121');
INSERT INTO `jilu` VALUES (205, '盘尼西林', '2021-04-08 21:50:22', '正常出库', '超级管理员', 50, '202148');
INSERT INTO `jilu` VALUES (206, '板蓝根', '2021-04-08 21:50:56', '正常出库', '超级管理员', 25, '202148');
INSERT INTO `jilu` VALUES (207, '千年人参', '2021-04-12 12:56:08', '正常出库', '超级管理员', 10, '202148');
INSERT INTO `jilu` VALUES (208, '999感冒灵', '2021-04-12 17:51:02', '常规入库', '超级管理员', 1000, '2021412');
INSERT INTO `jilu` VALUES (209, '999感冒灵', '2021-04-12 17:51:02', '常规入库', '超级管理员', 1000, '2021412');
INSERT INTO `jilu` VALUES (210, '999感冒灵', '2021-04-12 17:51:02', '常规入库', '超级管理员', 1000, '2021412');
INSERT INTO `jilu` VALUES (211, '999感冒灵', '2021-04-12 17:51:02', '常规入库', '超级管理员', 1000, '2021412');
INSERT INTO `jilu` VALUES (212, '999感冒灵', '2021-04-12 17:51:02', '常规入库', '超级管理员', 1000, '2021412');
INSERT INTO `jilu` VALUES (213, '千年人参', '2021-04-30 09:50:49', '常规入库', '超级管理员', 30, '2021430');
INSERT INTO `jilu` VALUES (214, '千年人参', '2021-05-09 10:05:57', '正常出库', '超级管理员', 20, '2021430');
INSERT INTO `jilu` VALUES (215, '999感冒灵', '2021-05-09 10:08:35', '正常出库', '超级管理员', 500, '2021412');
INSERT INTO `jilu` VALUES (216, '千年人参', '2021-05-09 10:09:33', '正常出库', '超级管理员', 10, '2021430');
INSERT INTO `jilu` VALUES (217, '999感冒灵', '2021-05-14 14:48:42', '常规入库', '超级管理员', 1000, '2021514');
INSERT INTO `jilu` VALUES (218, '999感冒灵', '2021-05-14 14:48:42', '常规入库', '超级管理员', 1000, '2021514');
INSERT INTO `jilu` VALUES (219, '千年人参', '2021-05-14 21:52:10', '正常出库', '超级管理员', 10, '202148');

-- ----------------------------
-- Table structure for moneytype
-- ----------------------------
DROP TABLE IF EXISTS `moneytype`;
CREATE TABLE `moneytype`  (
  `MoneyId` int NOT NULL AUTO_INCREMENT,
  `Moneytype` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Percent` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`MoneyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of moneytype
-- ----------------------------
INSERT INTO `moneytype` VALUES (10, '无', '0%');
INSERT INTO `moneytype` VALUES (11, '城镇社保', '30%');
INSERT INTO `moneytype` VALUES (12, '农村医疗合作社', '35%');

-- ----------------------------
-- Table structure for outpatienttype
-- ----------------------------
DROP TABLE IF EXISTS `outpatienttype`;
CREATE TABLE `outpatienttype`  (
  `outpatientId` int NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit` int NOT NULL,
  `bigprojectId` int NOT NULL,
  `price` double NOT NULL,
  `ostate` int NULL DEFAULT NULL,
  PRIMARY KEY (`outpatientId`) USING BTREE,
  INDEX `fk_outpatienttype`(`bigprojectId`) USING BTREE,
  INDEX `fk_outunit`(`unit`) USING BTREE,
  CONSTRAINT `fk_outpatienttype` FOREIGN KEY (`bigprojectId`) REFERENCES `projecttype` (`projectid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_outunit` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of outpatienttype
-- ----------------------------
INSERT INTO `outpatienttype` VALUES (7, '核磁共振', 8, 2, 100, 1);
INSERT INTO `outpatienttype` VALUES (8, '打针', 8, 2, 20, 0);
INSERT INTO `outpatienttype` VALUES (9, '彩色B超', 8, 2, 35, 1);
INSERT INTO `outpatienttype` VALUES (10, '血常规', 8, 2, 18, 1);
INSERT INTO `outpatienttype` VALUES (11, '肝功十项', 8, 2, 70, 1);

-- ----------------------------
-- Table structure for paiban
-- ----------------------------
DROP TABLE IF EXISTS `paiban`;
CREATE TABLE `paiban`  (
  `paiId` int NOT NULL AUTO_INCREMENT,
  `one` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `two` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `three` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `four` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `five` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `six` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `seven` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '无班',
  `doctorId` int NULL DEFAULT NULL,
  PRIMARY KEY (`paiId`) USING BTREE,
  INDEX `fk_paiId`(`doctorId`) USING BTREE,
  CONSTRAINT `fk_paiId` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of paiban
-- ----------------------------
INSERT INTO `paiban` VALUES (12, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 16);
INSERT INTO `paiban` VALUES (13, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 15);
INSERT INTO `paiban` VALUES (14, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 14);
INSERT INTO `paiban` VALUES (15, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 13);
INSERT INTO `paiban` VALUES (16, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 23);
INSERT INTO `paiban` VALUES (17, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 22);
INSERT INTO `paiban` VALUES (18, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 21);
INSERT INTO `paiban` VALUES (19, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 20);
INSERT INTO `paiban` VALUES (20, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 19);
INSERT INTO `paiban` VALUES (21, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 18);
INSERT INTO `paiban` VALUES (22, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 17);
INSERT INTO `paiban` VALUES (23, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 40);
INSERT INTO `paiban` VALUES (24, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 39);
INSERT INTO `paiban` VALUES (25, '有班', '有班', '有班', '有班', '有班', '有班', '有班', 38);
INSERT INTO `paiban` VALUES (26, '无班', '无班', '无班', '无班', '无班', '无班', '无班', 37);

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay`  (
  `payid` int NOT NULL AUTO_INCREMENT,
  `registerid` int NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL,
  `payDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`payid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES (9, 12, 10, '2019-11-21 15:13:09');
INSERT INTO `pay` VALUES (10, 13, 10, '2019-11-26 09:44:56');
INSERT INTO `pay` VALUES (11, 14, 100, '2021-04-06 22:40:05');
INSERT INTO `pay` VALUES (12, 14, 100, '2021-04-08 14:50:47');
INSERT INTO `pay` VALUES (13, 13, 3000, '2021-04-08 22:06:15');
INSERT INTO `pay` VALUES (14, 18, 100, '2021-05-14 21:49:33');

-- ----------------------------
-- Table structure for pharmacy
-- ----------------------------
DROP TABLE IF EXISTS `pharmacy`;
CREATE TABLE `pharmacy`  (
  `pharmacyId` int NOT NULL AUTO_INCREMENT,
  `pharmacyName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `drugstoreId` int NULL DEFAULT NULL,
  `skullId` int NULL DEFAULT NULL,
  `warehouseId` int NULL DEFAULT NULL,
  `unit` int NOT NULL,
  `sellingPrice` double NOT NULL,
  `area` int NOT NULL,
  `type` int NOT NULL,
  `produceDate` date NOT NULL,
  `validDate` date NOT NULL,
  `drugstorenum` int NOT NULL,
  `skullbatch` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`pharmacyId`) USING BTREE,
  INDEX `fk_drugstoreIdp`(`drugstoreId`) USING BTREE,
  INDEX `fk_skullIdp`(`skullId`) USING BTREE,
  INDEX `fk_warehouseIdp`(`warehouseId`) USING BTREE,
  INDEX `fk_dgareap`(`area`) USING BTREE,
  INDEX `fk_unitp`(`unit`) USING BTREE,
  INDEX `fk_typep`(`type`) USING BTREE,
  CONSTRAINT `fk_dgareap` FOREIGN KEY (`area`) REFERENCES `area` (`areaId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_drugstoreIdp` FOREIGN KEY (`drugstoreId`) REFERENCES `drugstore` (`rugstoreId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_skullIdp` FOREIGN KEY (`skullId`) REFERENCES `skull` (`skullid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_typep` FOREIGN KEY (`type`) REFERENCES `type` (`typeid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_unitp` FOREIGN KEY (`unit`) REFERENCES `unit` (`unitid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_warehouseIdp` FOREIGN KEY (`warehouseId`) REFERENCES `warehuose` (`warehouseid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pharmacy
-- ----------------------------
INSERT INTO `pharmacy` VALUES (12, '阿莫西林', NULL, 4, 2, 7, 30, 4, 5, '2019-10-25', '2020-02-01', 11, '20191121');
INSERT INTO `pharmacy` VALUES (13, '百年枸杞', NULL, 5, 2, 9, 580, 6, 6, '2021-04-01', '2023-12-16', 17, '202148');
INSERT INTO `pharmacy` VALUES (14, '盘尼西林', NULL, 5, 2, 7, 25, 7, 5, '2021-04-01', '2022-11-10', 47, '202148');
INSERT INTO `pharmacy` VALUES (15, '板蓝根', NULL, 5, 2, 7, 30, 4, 5, '2021-04-01', '2021-04-07', 20, '202148');
INSERT INTO `pharmacy` VALUES (16, '千年人参', NULL, 6, 2, 9, 1000, 6, 6, '2021-04-01', '2025-12-20', 50, '202148');
INSERT INTO `pharmacy` VALUES (17, '999感冒灵', NULL, 5, 2, 7, 18, 5, 5, '2021-04-01', '2022-01-01', 500, '2021412');

-- ----------------------------
-- Table structure for projecttype
-- ----------------------------
DROP TABLE IF EXISTS `projecttype`;
CREATE TABLE `projecttype`  (
  `projectId` int NOT NULL AUTO_INCREMENT,
  `projectName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`projectId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of projecttype
-- ----------------------------
INSERT INTO `projecttype` VALUES (1, '住院医疗综合服务类');
INSERT INTO `projecttype` VALUES (2, '门诊医疗综合服务类');

-- ----------------------------
-- Table structure for register
-- ----------------------------
DROP TABLE IF EXISTS `register`;
CREATE TABLE `register`  (
  `registerid` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `age` int NOT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `department` int NOT NULL,
  `doctor` int NOT NULL,
  `diagnose` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Idcard` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `registerDate` datetime NULL DEFAULT NULL,
  `bedNum` int NULL DEFAULT NULL,
  `Operator` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` double NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `endDate` datetime NULL DEFAULT NULL,
  `price` double UNSIGNED NULL DEFAULT NULL,
  `discount` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zhuan` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`registerid`) USING BTREE,
  INDEX `fk_regdepartment`(`department`) USING BTREE,
  INDEX `fk_regdoctor`(`doctor`) USING BTREE,
  CONSTRAINT `fk_regdepartment` FOREIGN KEY (`department`) REFERENCES `departments` (`departmentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_regdoctor` FOREIGN KEY (`doctor`) REFERENCES `doctor` (`doctorId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of register
-- ----------------------------
INSERT INTO `register` VALUES (12, '李福州', 20, '男', 7, 15, '脑部肿瘤', '河南', '15565792390', '412827199605062586', '2019-11-21 15:11:17', 9, '门诊', 10010, 1, '2019-11-21 15:14:05', 392, '30%', NULL);
INSERT INTO `register` VALUES (14, '小石', 27, '女', 8, 16, '需住院', '西安市', '18859648746', '469572644185492641', '2021-04-06 22:39:41', 8, '超级管理员', 700, 1, '2021-04-08 16:53:44', 682.5, '35%', NULL);
INSERT INTO `register` VALUES (15, '赵小磊', 27, '男', 8, 23, '需要住院', '西安市', '18495613451', '564614524156412410', '2021-04-08 18:03:09', 8, '超级管理员', 1000, 1, '2021-04-08 22:05:36', 702, '35%', NULL);
INSERT INTO `register` VALUES (16, '聂小倩', 27, '女', 8, 23, '韧带断', '西安市', '19962421541', '652528244965281541', '2021-04-12 17:09:39', 8, '超级管理员', 5000, 1, '2021-04-12 17:47:37', 117, '35%', NULL);
INSERT INTO `register` VALUES (17, '掌门人', 22, '男', 7, 15, '住院测试', '陕西省西安市', '15593864251', '520602199906081452', '2021-05-09 09:38:32', 13, '超级管理员', 1000, 0, NULL, NULL, '0%', NULL);
INSERT INTO `register` VALUES (18, '测试1', 11, '男', 8, 23, '住院测试', '南阳市', '17682963251', '415580199506040807', '2021-05-14 21:49:00', 10, '超级管理员', 1100, 1, '2021-05-14 21:50:22', 360, '0%', NULL);
INSERT INTO `register` VALUES (19, '张晓琪', 18, '女', 7, 15, '伤口需要缝合', '南阳市', '19562421652', '564125166842036314', '2021-05-14 21:49:17', 14, '超级管理员', 1000, 0, NULL, NULL, '30%', NULL);
INSERT INTO `register` VALUES (20, '1111', 22, '男', 7, 22, '111', '南阳市', '17695857485', '620502199906060606', '2021-05-15 16:35:43', 15, '超级管理员', 1000, 0, NULL, NULL, '30%', NULL);

-- ----------------------------
-- Table structure for registeredtype
-- ----------------------------
DROP TABLE IF EXISTS `registeredtype`;
CREATE TABLE `registeredtype`  (
  `registeredId` int NOT NULL AUTO_INCREMENT,
  `type` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`registeredId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of registeredtype
-- ----------------------------
INSERT INTO `registeredtype` VALUES (5, '普通挂号', 20);
INSERT INTO `registeredtype` VALUES (6, '专家号', 30);

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `reportId` int NOT NULL AUTO_INCREMENT,
  `reportName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `department` int NULL DEFAULT NULL,
  `doctor` int NULL DEFAULT NULL,
  `reportType` int NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `users` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `carid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zhuan` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reportId`) USING BTREE,
  INDEX `fk_departmentr`(`department`) USING BTREE,
  INDEX `fk_doctor`(`doctor`) USING BTREE,
  INDEX `fk_reportType`(`reportType`) USING BTREE,
  CONSTRAINT `fk_departmentr` FOREIGN KEY (`department`) REFERENCES `departments` (`departmentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_doctor` FOREIGN KEY (`doctor`) REFERENCES `doctor` (`doctorId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_reportType` FOREIGN KEY (`reportType`) REFERENCES `registeredtype` (`registeredId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES (28, '送高帅', '男', 20, 7, 14, 6, 30, '2019-11-21 14:00:00', NULL, 3, '13183380740', '412827199807156595', '头痛，发烧');
INSERT INTO `report` VALUES (29, '李福州', '男', 20, 7, 14, 6, 30, '2019-11-21 15:04:50', '门诊', 5, '15565792390', '412827199605062586', '脑部肿瘤');
INSERT INTO `report` VALUES (30, '杨帅', '男', 20, 7, 14, 6, 30, '2019-11-21 14:00:00', NULL, 3, '13183380740', '412369199512023695', '头痛');
INSERT INTO `report` VALUES (31, 'song', '男', 12, 7, 13, 5, 20, '2019-11-26 09:16:47', '超级管理员', 5, '13271678052', '412702199902080557', '良好');
INSERT INTO `report` VALUES (32, '王雨辰', '男', 23, 7, 13, 5, 20, '2021-04-05 22:07:46', '超级管理员', 0, '17865966535', '419302199802136310', '有病');
INSERT INTO `report` VALUES (33, '小七', '女', 18, 7, 14, 6, 30, '2021-04-06 17:15:35', '超级管理员', 0, '17309383819', '485961233718192641', NULL);
INSERT INTO `report` VALUES (34, '小九', '男', 43, 7, 13, 5, 20, '2021-04-06 17:18:47', '超级管理员', 2, '19595957584', '642806719842671684', '有病了');
INSERT INTO `report` VALUES (35, '小石', '女', 27, 7, 13, 5, 20, '2021-04-06 22:35:05', '超级管理员', 5, '18859648746', '469572644185492641', '需住院');
INSERT INTO `report` VALUES (36, '小二', '男', 26, 7, 14, 6, 30, '2021-04-08 13:49:08', '超级管理员', 3, '18599635415', '650502199805063514', '感冒');
INSERT INTO `report` VALUES (37, '苏大强', '男', 23, 7, 13, 5, 20, '2021-04-08 17:29:06', '超级管理员', 2, '18596461524', '625040166235063140', '发高烧持续一小时');
INSERT INTO `report` VALUES (38, '赵小磊', '男', 27, 7, 14, 6, 30, '2021-04-08 17:29:33', '超级管理员', 5, '18495613451', '564614524156412410', '需要住院');
INSERT INTO `report` VALUES (39, '宋晓峰', '男', 33, 8, 17, 5, 20, '2021-04-08 17:30:12', '超级管理员', 0, '17656244156', '652405115235215246', '需要做检查');
INSERT INTO `report` VALUES (40, '张晓琪', '女', 18, 8, 18, 6, 30, '2021-04-08 17:30:56', '超级管理员', 5, '19562421652', '564125166842036314', '伤口需要缝合');
INSERT INTO `report` VALUES (41, '赵强', '男', 33, 7, 13, 5, 20, '2021-04-09 09:03:35', '超级管理员', 3, '17562541526', '620502199705063415', '身体不好，需要开药疗养');
INSERT INTO `report` VALUES (42, '郭小慧', '女', 19, 7, 14, 6, 30, '2021-04-09 09:04:16', '超级管理员', 0, '18566448524', '620502188541524152', NULL);
INSERT INTO `report` VALUES (43, '齐宇阳', '男', 27, 8, 17, 5, 20, '2021-04-09 09:05:11', '超级管理员', 0, '19688541524', '620502199525263514', NULL);
INSERT INTO `report` VALUES (44, '赵小磊', '男', 26, 8, 18, 6, 30, '2021-04-09 09:05:58', '超级管理员', 0, '18566478512', '620502199526341521', NULL);
INSERT INTO `report` VALUES (45, '宋小宝', '男', 35, 7, 13, 5, 20, '2021-04-12 16:11:36', '超级管理员', 3, '18846524154', '652524255845142631', '感冒一天，开三盒板蓝根');
INSERT INTO `report` VALUES (46, '聂小倩', '女', 27, 8, 18, 6, 30, '2021-04-12 16:54:38', '超级管理员', 5, '19962421541', '652528244965281541', '韧带断');
INSERT INTO `report` VALUES (47, '测试1号', '男', 20, 7, 13, 5, 20, '2021-04-12 17:33:03', '超级管理员', 0, '18456254151', '425142051516162514', NULL);
INSERT INTO `report` VALUES (48, '测试2号', '女', 33, 7, 14, 6, 30, '2021-04-12 17:35:37', '超级管理员', 0, '18956241541', '562524166852415241', NULL);
INSERT INTO `report` VALUES (49, '牛啊牛', '女', 18, 7, 14, 6, 30, '2021-05-08 15:11:11', '超级管理员', 0, '18695244152', '625005199505060906', '痛风，需要开药');
INSERT INTO `report` VALUES (50, '掌门人', '男', 22, 7, 13, 5, 20, '2021-05-09 09:26:08', '超级管理员', 5, '15593864251', '520602199906081452', '住院测试');
INSERT INTO `report` VALUES (51, '测试', '男', 11, 7, 13, 5, 20, '2021-05-14 21:46:07', '超级管理员', 3, '17685295241', '625050199505060905', '测试');
INSERT INTO `report` VALUES (52, '测试1', '男', 11, 8, 18, 6, 30, '2021-05-14 21:48:18', '超级管理员', 5, '17682963251', '415580199506040807', '住院测试');
INSERT INTO `report` VALUES (53, '挂号测试', '男', 19, 7, 14, 6, 30, '2021-05-15 14:41:00', '超级管理员', 0, '17596524152', '620502200305069641', '挂号病因测试');
INSERT INTO `report` VALUES (54, '1111', '男', 22, 7, 13, 5, 20, '2021-05-15 16:34:30', '超级管理员', 5, '17695857485', '620502199906060606', '111');
INSERT INTO `report` VALUES (55, '赵四海', '男', 22, 7, 13, 5, 20, '2021-05-22 00:30:38', '超级管理员', 1, '18929615616', '620502199905060606', '一个小测试');

-- ----------------------------
-- Table structure for skull
-- ----------------------------
DROP TABLE IF EXISTS `skull`;
CREATE TABLE `skull`  (
  `skullId` int NOT NULL AUTO_INCREMENT,
  `skullName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`skullId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of skull
-- ----------------------------
INSERT INTO `skull` VALUES (4, '张山');
INSERT INTO `skull` VALUES (5, '小七');
INSERT INTO `skull` VALUES (6, '萧炎');
INSERT INTO `skull` VALUES (7, '薰儿');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spread` int NULL DEFAULT NULL COMMENT '0不展开1展开',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int NULL DEFAULT NULL COMMENT '0不可用1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '医院管理系统', '', 1, NULL, '&#xe68e;', 1);
INSERT INTO `sys_menu` VALUES (2, 1, '门诊管理', '', 0, NULL, '&#xe653;', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '住院管理', '', 0, NULL, '&#xe663;', 1);
INSERT INTO `sys_menu` VALUES (4, 1, '系统管理', '', 0, '', '&#xe716;', 1);
INSERT INTO `sys_menu` VALUES (5, 1, '统计管理', '', 0, NULL, '&#xe629;', 0);
INSERT INTO `sys_menu` VALUES (6, 2, '用户挂号', '../cao/index', 0, NULL, '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (7, 2, '处方划价', '../caocc/cc', 0, NULL, '&#xe657;', 1);
INSERT INTO `sys_menu` VALUES (8, 3, '入院登记', '../liao/admin', 0, NULL, '&#xe65b;', 1);
INSERT INTO `sys_menu` VALUES (9, 3, '缴费管理', '../liao/pay', 0, NULL, '&#xe6b2;', 1);
INSERT INTO `sys_menu` VALUES (11, 3, '药品记账', '../liao/drug', 0, NULL, '&#xe705;', 1);
INSERT INTO `sys_menu` VALUES (12, 4, '菜单管理', '../toMenuManager', 0, NULL, '&#xe60f;', 1);
INSERT INTO `sys_menu` VALUES (13, 4, '角色管理', '../toLoadAllRole', 0, '', '&#xe66f;', 1);
INSERT INTO `sys_menu` VALUES (14, 4, '用户管理', '../toLoadAllUser', 0, NULL, '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (15, 4, '图标管理', '../icon', 0, NULL, '&#xe655;', 1);
INSERT INTO `sys_menu` VALUES (18, 5, '门诊月度统计', '../toReportFinance', 0, NULL, '&#xe63c;', 1);
INSERT INTO `sys_menu` VALUES (19, 5, '住院月度统计', '../toZhuYaunManage', 0, NULL, '&#xe62c;', 1);
INSERT INTO `sys_menu` VALUES (20, 5, '门诊年度统计', '../toBingYear', 0, NULL, '&#xe62d;', 1);
INSERT INTO `sys_menu` VALUES (27, 2, '项目划价', '../caoout/xiang', 0, NULL, '&#xe60a;', 1);
INSERT INTO `sys_menu` VALUES (28, 2, '项目缴费', '../xpay/xiangpay', 0, NULL, '&#xe65e;', 1);
INSERT INTO `sys_menu` VALUES (30, 1, '数据中心', '', 0, NULL, '&#xe60a;', 1);
INSERT INTO `sys_menu` VALUES (31, 30, '科室中心', '../toDepartments', 0, NULL, '&#xe68e;', 1);
INSERT INTO `sys_menu` VALUES (32, 30, '医生列表', '../toDoctor', 0, NULL, '&#xe66f;', 1);
INSERT INTO `sys_menu` VALUES (33, 30, '药品产地', '../toArea', 0, NULL, '&#xe630;', 1);
INSERT INTO `sys_menu` VALUES (36, 30, '项目大类', '../toProjectTypeManage', 0, NULL, '&#xe620;', 1);
INSERT INTO `sys_menu` VALUES (37, 30, '挂号类型', '../toRegisteredType', 0, NULL, '&#xe672;', 1);
INSERT INTO `sys_menu` VALUES (40, 30, '仓库', '../toWarehuose', 0, NULL, '&#xe60a;', 1);
INSERT INTO `sys_menu` VALUES (41, 30, '经办人', '../toSkull', 0, NULL, '&#xe612;', 1);
INSERT INTO `sys_menu` VALUES (42, 30, '计量单位', '../toUnit', 0, NULL, '&#xe62a;', 1);
INSERT INTO `sys_menu` VALUES (43, 30, '供货商', '../toSupply', 0, NULL, '&#xe613;', 1);
INSERT INTO `sys_menu` VALUES (44, 30, '药品分类', '../toType', 0, NULL, '&#xe656;', 1);
INSERT INTO `sys_menu` VALUES (46, 1, '排班管理', '1', 0, NULL, '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (47, 46, '医生排班', '../toPaiban', 0, NULL, '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (48, 30, '药品字典', '../toDrugdictionary', 0, NULL, '&#xe64d;', 1);
INSERT INTO `sys_menu` VALUES (49, 3, '项目记账', '../liao/item', 0, NULL, '&#xe705;', 1);
INSERT INTO `sys_menu` VALUES (52, 5, '住院年度统计', '../toBing2', 0, NULL, '&#xe630;', 1);
INSERT INTO `sys_menu` VALUES (53, 2, '项目检查', '../xpay/seljian', 0, NULL, '&#xe674;', 1);
INSERT INTO `sys_menu` VALUES (54, 1, '仓库管理', '', 0, NULL, '&#xe61c;', 1);
INSERT INTO `sys_menu` VALUES (55, 54, '入库单', '../dsnavigation/beputinstorage', 0, NULL, '&#xe657;', 1);
INSERT INTO `sys_menu` VALUES (56, 5, '医生统计对比', '../toDoctorDuibi', 0, NULL, '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (57, 54, '库存查询', '../dsnavigation/selectdurg', 0, NULL, '&#xe62a;', 1);
INSERT INTO `sys_menu` VALUES (58, 54, '出库单', '../dsnavigation/selectchuku', 0, NULL, '&#xe621;', 1);
INSERT INTO `sys_menu` VALUES (59, 54, '库存不足', '../dsnavigation/selectless', 0, NULL, '&#xe6b2;', 1);
INSERT INTO `sys_menu` VALUES (60, 54, '过期提醒', '../dsnavigation/seldrugDate', 0, NULL, '&#xe702;', 1);
INSERT INTO `sys_menu` VALUES (61, 1, '药房管理', '', 0, NULL, '&#xe705;', 1);
INSERT INTO `sys_menu` VALUES (62, 61, '药品详情', '../dsnavigation/pharymacyhtml', 0, NULL, '&#xe632;', 1);
INSERT INTO `sys_menu` VALUES (64, 2, '药品缴费', '../caoout/out', 0, NULL, '&#xe65e;', 1);
INSERT INTO `sys_menu` VALUES (65, 5, '门诊当天统计', '../toCurrent', 0, NULL, '&#xe60e;', 1);
INSERT INTO `sys_menu` VALUES (69, 2, '门诊患者库', '../caotake/haun', 0, NULL, '&#xe66f;', 1);
INSERT INTO `sys_menu` VALUES (70, 54, '操作记录', '../dsnavigation/record', 0, NULL, '&#xe6b2;', 1);
INSERT INTO `sys_menu` VALUES (71, 54, '药品回收', '../dsnavigation/recycle', 0, NULL, '&#xe669;', 1);
INSERT INTO `sys_menu` VALUES (72, 61, '门诊取药', '../caotake/seltake', 0, NULL, '&#xe857;', 1);
INSERT INTO `sys_menu` VALUES (73, 61, '住院取药', '../liao/pharmacy', 0, NULL, '&#xe63c;', 1);
INSERT INTO `sys_menu` VALUES (86, 3, '出院结算', '../liao/leave', 0, NULL, '&#xe65a;', 1);
INSERT INTO `sys_menu` VALUES (90, 2, 'test', '', 0, NULL, '&#xe678;', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleid` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roledesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int NULL DEFAULT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '拥有所有菜单权限', 1);
INSERT INTO `sys_role` VALUES (5, '门诊管理员', '拥有门诊管理的权限', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `rid` int NOT NULL,
  `mid` int NOT NULL,
  PRIMARY KEY (`rid`, `mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (1, 30);
INSERT INTO `sys_role_menu` VALUES (1, 31);
INSERT INTO `sys_role_menu` VALUES (1, 32);
INSERT INTO `sys_role_menu` VALUES (1, 33);
INSERT INTO `sys_role_menu` VALUES (1, 36);
INSERT INTO `sys_role_menu` VALUES (1, 37);
INSERT INTO `sys_role_menu` VALUES (1, 40);
INSERT INTO `sys_role_menu` VALUES (1, 41);
INSERT INTO `sys_role_menu` VALUES (1, 42);
INSERT INTO `sys_role_menu` VALUES (1, 43);
INSERT INTO `sys_role_menu` VALUES (1, 44);
INSERT INTO `sys_role_menu` VALUES (1, 46);
INSERT INTO `sys_role_menu` VALUES (1, 47);
INSERT INTO `sys_role_menu` VALUES (1, 48);
INSERT INTO `sys_role_menu` VALUES (1, 49);
INSERT INTO `sys_role_menu` VALUES (1, 52);
INSERT INTO `sys_role_menu` VALUES (1, 53);
INSERT INTO `sys_role_menu` VALUES (1, 54);
INSERT INTO `sys_role_menu` VALUES (1, 55);
INSERT INTO `sys_role_menu` VALUES (1, 56);
INSERT INTO `sys_role_menu` VALUES (1, 57);
INSERT INTO `sys_role_menu` VALUES (1, 58);
INSERT INTO `sys_role_menu` VALUES (1, 59);
INSERT INTO `sys_role_menu` VALUES (1, 60);
INSERT INTO `sys_role_menu` VALUES (1, 61);
INSERT INTO `sys_role_menu` VALUES (1, 62);
INSERT INTO `sys_role_menu` VALUES (1, 64);
INSERT INTO `sys_role_menu` VALUES (1, 65);
INSERT INTO `sys_role_menu` VALUES (1, 69);
INSERT INTO `sys_role_menu` VALUES (1, 70);
INSERT INTO `sys_role_menu` VALUES (1, 71);
INSERT INTO `sys_role_menu` VALUES (1, 72);
INSERT INTO `sys_role_menu` VALUES (1, 73);
INSERT INTO `sys_role_menu` VALUES (1, 86);
INSERT INTO `sys_role_menu` VALUES (1, 88);
INSERT INTO `sys_role_menu` VALUES (5, 1);
INSERT INTO `sys_role_menu` VALUES (5, 2);
INSERT INTO `sys_role_menu` VALUES (5, 6);
INSERT INTO `sys_role_menu` VALUES (5, 7);
INSERT INTO `sys_role_menu` VALUES (5, 27);
INSERT INTO `sys_role_menu` VALUES (5, 28);
INSERT INTO `sys_role_menu` VALUES (5, 53);
INSERT INTO `sys_role_menu` VALUES (5, 64);
INSERT INTO `sys_role_menu` VALUES (5, 69);
INSERT INTO `sys_role_menu` VALUES (5, 90);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `uid` int NOT NULL,
  `rid` int NOT NULL,
  PRIMARY KEY (`uid`, `rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 1);
INSERT INTO `sys_role_user` VALUES (9, 1);
INSERT INTO `sys_role_user` VALUES (10, 1);
INSERT INTO `sys_role_user` VALUES (11, 1);
INSERT INTO `sys_role_user` VALUES (12, 1);
INSERT INTO `sys_role_user` VALUES (13, 1);
INSERT INTO `sys_role_user` VALUES (29, 5);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userid` int NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int NULL DEFAULT NULL COMMENT '0女1男',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT 2 COMMENT '1，超级管理员,2，系统用户',
  `available` int NULL DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '412365199601236544', '超级管理员', 1, '武汉', '13183380740', '6af4d08340b548cbcce38353d9bcaab4', 'CEO', 1, 1, 'd21fd4');
INSERT INTO `sys_user` VALUES (29, 'wzsdsg', '420608199806070607', '王雨辰', 1, '西安', '17895468467', '8929b083b0cfe8054b9ee081288b5057', '门诊管理员', 2, 1, 'b21622');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `typeId` int NOT NULL AUTO_INCREMENT,
  `typeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`typeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (5, '西药');
INSERT INTO `type` VALUES (6, '中药');

-- ----------------------------
-- Table structure for unit
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit`  (
  `unitId` int NOT NULL AUTO_INCREMENT,
  `unitName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`unitId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES (7, '盒');
INSERT INTO `unit` VALUES (8, '次');
INSERT INTO `unit` VALUES (9, '袋');

-- ----------------------------
-- Table structure for upplier
-- ----------------------------
DROP TABLE IF EXISTS `upplier`;
CREATE TABLE `upplier`  (
  `supplierId` int NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `supplierPhone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `supplierAddress` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int NULL DEFAULT NULL,
  PRIMARY KEY (`supplierId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of upplier
-- ----------------------------
INSERT INTO `upplier` VALUES (5, '春天大药房 ', NULL, NULL, 0);
INSERT INTO `upplier` VALUES (6, '辅仁堂大药房', NULL, NULL, 0);
INSERT INTO `upplier` VALUES (7, '康复大药店', NULL, NULL, 0);
INSERT INTO `upplier` VALUES (8, '健康大药房', NULL, NULL, 0);

-- ----------------------------
-- Table structure for warehuose
-- ----------------------------
DROP TABLE IF EXISTS `warehuose`;
CREATE TABLE `warehuose`  (
  `warehouseId` int NOT NULL AUTO_INCREMENT,
  `supplierName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`warehouseId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of warehuose
-- ----------------------------
INSERT INTO `warehuose` VALUES (2, '仓库');
INSERT INTO `warehuose` VALUES (3, '备用仓库');

SET FOREIGN_KEY_CHECKS = 1;

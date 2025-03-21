/*
 Navicat Premium Data Transfer

 Source Server         : mysqldb
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : rbac2

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 21/01/2020 17:23:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(11) NOT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rule` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, 'role', '6|7', '角色互斥');
INSERT INTO `config` VALUES (2, 'role', '5', '用户可拥有的角色数量限制');
INSERT INTO `config` VALUES (3, 'permit', '5', '角色可拥有的权限数量限制');
INSERT INTO `config` VALUES (4, 'user', '5', '角色可被分配的用户数量限制');

-- ----------------------------
-- Table structure for permit
-- ----------------------------
DROP TABLE IF EXISTS `permit`;
CREATE TABLE `permit`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL COMMENT '上级编码',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permit
-- ----------------------------
INSERT INTO `permit` VALUES (1, '用户', 0, '/user');
INSERT INTO `permit` VALUES (2, '商品', 0, '/good');
INSERT INTO `permit` VALUES (3, '订单', 0, '/order');
INSERT INTO `permit` VALUES (4, '财务', 0, '/finance');
INSERT INTO `permit` VALUES (5, '浏览用户', 1, '/user/list');
INSERT INTO `permit` VALUES (6, '查询用户', 1, '/user/query');
INSERT INTO `permit` VALUES (7, '指定优惠用户', 1, '/user/create');
INSERT INTO `permit` VALUES (8, '冻结/解冻用户', 1, '/user/update');
INSERT INTO `permit` VALUES (9, '推送用户消息', 1, '/user/remove');
INSERT INTO `permit` VALUES (10, '浏览商品', 2, '/good/list');
INSERT INTO `permit` VALUES (11, '查询商品', 2, '/good/query');
INSERT INTO `permit` VALUES (12, '创建商品', 2, '/good/create');
INSERT INTO `permit` VALUES (13, '修改商品', 2, '/good/update');
INSERT INTO `permit` VALUES (14, '删除商品', 2, '/good/remove');
INSERT INTO `permit` VALUES (15, '浏览订单', 3, '/order/list');
INSERT INTO `permit` VALUES (16, '查询订单', 3, '/order/query');
INSERT INTO `permit` VALUES (17, '合并订单', 3, '/order/combine');
INSERT INTO `permit` VALUES (18, '提交订单', 3, '/order/submit');
INSERT INTO `permit` VALUES (19, '登帐', 4, '/finance/record');
INSERT INTO `permit` VALUES (20, '出报表', 4, '/finance/sheet');
INSERT INTO `permit` VALUES (21, '审核报销单', 4, '/finance/expense');
INSERT INTO `permit` VALUES (22, '收款凭证', 4, '/finance/collection');
INSERT INTO `permit` VALUES (23, '付款凭证', 4, '/finance/pay');
INSERT INTO `permit` VALUES (24, '登记现金', 4, '/finance/cash');
INSERT INTO `permit` VALUES (25, '报税', 4, '/finance/tax');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '父角色编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '0');
INSERT INTO `role` VALUES (2, '负责人', '0');
INSERT INTO `role` VALUES (3, '商品上架员', '0');
INSERT INTO `role` VALUES (4, '订单操作员', '0');
INSERT INTO `role` VALUES (5, '客服', '0');
INSERT INTO `role` VALUES (6, '会计', '0');
INSERT INTO `role` VALUES (7, '出纳', '0');

-- ----------------------------
-- Table structure for role_permit
-- ----------------------------
DROP TABLE IF EXISTS `role_permit`;
CREATE TABLE `role_permit`  (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`rid`, `pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permit
-- ----------------------------
INSERT INTO `role_permit` VALUES (1, 1);
INSERT INTO `role_permit` VALUES (1, 2);
INSERT INTO `role_permit` VALUES (1, 3);
INSERT INTO `role_permit` VALUES (1, 4);
INSERT INTO `role_permit` VALUES (1, 5);
INSERT INTO `role_permit` VALUES (1, 6);
INSERT INTO `role_permit` VALUES (1, 7);
INSERT INTO `role_permit` VALUES (1, 8);
INSERT INTO `role_permit` VALUES (1, 9);
INSERT INTO `role_permit` VALUES (1, 10);
INSERT INTO `role_permit` VALUES (1, 11);
INSERT INTO `role_permit` VALUES (1, 12);
INSERT INTO `role_permit` VALUES (1, 13);
INSERT INTO `role_permit` VALUES (1, 14);
INSERT INTO `role_permit` VALUES (1, 15);
INSERT INTO `role_permit` VALUES (1, 16);
INSERT INTO `role_permit` VALUES (1, 17);
INSERT INTO `role_permit` VALUES (1, 18);
INSERT INTO `role_permit` VALUES (1, 19);
INSERT INTO `role_permit` VALUES (1, 20);
INSERT INTO `role_permit` VALUES (1, 21);
INSERT INTO `role_permit` VALUES (1, 22);
INSERT INTO `role_permit` VALUES (1, 23);
INSERT INTO `role_permit` VALUES (1, 24);
INSERT INTO `role_permit` VALUES (1, 25);
INSERT INTO `role_permit` VALUES (2, 2);
INSERT INTO `role_permit` VALUES (2, 3);
INSERT INTO `role_permit` VALUES (2, 4);
INSERT INTO `role_permit` VALUES (2, 10);
INSERT INTO `role_permit` VALUES (2, 11);
INSERT INTO `role_permit` VALUES (2, 12);
INSERT INTO `role_permit` VALUES (2, 13);
INSERT INTO `role_permit` VALUES (2, 14);
INSERT INTO `role_permit` VALUES (2, 15);
INSERT INTO `role_permit` VALUES (2, 16);
INSERT INTO `role_permit` VALUES (2, 17);
INSERT INTO `role_permit` VALUES (2, 18);
INSERT INTO `role_permit` VALUES (2, 19);
INSERT INTO `role_permit` VALUES (2, 20);
INSERT INTO `role_permit` VALUES (2, 21);
INSERT INTO `role_permit` VALUES (2, 22);
INSERT INTO `role_permit` VALUES (2, 23);
INSERT INTO `role_permit` VALUES (2, 24);
INSERT INTO `role_permit` VALUES (2, 25);
INSERT INTO `role_permit` VALUES (3, 2);
INSERT INTO `role_permit` VALUES (3, 10);
INSERT INTO `role_permit` VALUES (3, 11);
INSERT INTO `role_permit` VALUES (3, 12);
INSERT INTO `role_permit` VALUES (3, 13);
INSERT INTO `role_permit` VALUES (3, 14);
INSERT INTO `role_permit` VALUES (4, 3);
INSERT INTO `role_permit` VALUES (4, 15);
INSERT INTO `role_permit` VALUES (4, 16);
INSERT INTO `role_permit` VALUES (4, 17);
INSERT INTO `role_permit` VALUES (4, 18);
INSERT INTO `role_permit` VALUES (5, 1);
INSERT INTO `role_permit` VALUES (5, 5);
INSERT INTO `role_permit` VALUES (5, 6);
INSERT INTO `role_permit` VALUES (5, 7);
INSERT INTO `role_permit` VALUES (5, 8);
INSERT INTO `role_permit` VALUES (5, 9);
INSERT INTO `role_permit` VALUES (6, 4);
INSERT INTO `role_permit` VALUES (6, 19);
INSERT INTO `role_permit` VALUES (6, 20);
INSERT INTO `role_permit` VALUES (6, 21);
INSERT INTO `role_permit` VALUES (7, 4);
INSERT INTO `role_permit` VALUES (7, 22);
INSERT INTO `role_permit` VALUES (7, 23);
INSERT INTO `role_permit` VALUES (7, 24);
INSERT INTO `role_permit` VALUES (7, 25);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin');
INSERT INTO `user` VALUES (2, '张经理');
INSERT INTO `user` VALUES (3, '李勇');
INSERT INTO `user` VALUES (4, '王虎');
INSERT INTO `user` VALUES (5, '赵刚');
INSERT INTO `user` VALUES (6, '钱进');
INSERT INTO `user` VALUES (7, '周平');
INSERT INTO `user` VALUES (8, '吴用');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`uid`, `rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1);
INSERT INTO `user_role` VALUES (2, 2);
INSERT INTO `user_role` VALUES (2, 5);
INSERT INTO `user_role` VALUES (3, 3);
INSERT INTO `user_role` VALUES (4, 4);
INSERT INTO `user_role` VALUES (5, 5);
INSERT INTO `user_role` VALUES (6, 6);
INSERT INTO `user_role` VALUES (7, 7);
INSERT INTO `user_role` VALUES (8, 6);

SET FOREIGN_KEY_CHECKS = 1;

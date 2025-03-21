/*
 Navicat Premium Data Transfer

 Source Server         : mysqldb
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : rbac3

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 22/01/2020 19:56:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_branch
-- ----------------------------
DROP TABLE IF EXISTS sys_branch;
CREATE TABLE sys_branch (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '机构编码',
  parentid int(11) NOT NULL DEFAULT '0' COMMENT '父级编码',
  parentids varchar(256) NOT NULL DEFAULT '' COMMENT '所有父级编码',
  name varchar(64) NOT NULL DEFAULT '' COMMENT '机构名称',
  type tinyint(1) NOT NULL DEFAULT '0' COMMENT '机构类型，0：集团；1：公司；2：分支机构；3：部门；4：小组',
  createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (id) USING BTREE
) ENGINE=MyISAM CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=Dynamic COMMENT '分支机构表';

-- ----------------------------
-- Records of sys_branch
-- ----------------------------
INSERT INTO sys_branch VALUES (1, 0, '0,', '集团', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_branch VALUES (2, 1, '0,1,', '子公司1', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_branch VALUES (3, 1, '0,1,', '子公司2', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_branch VALUES (4, 2, '0,1,2,', '北京办公室', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_branch VALUES (5, 3, '0,1,3,', '杭州办公室', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_branch VALUES (6, 4, '0,1,2,4,', '技术部', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_branch VALUES (7, 4, '0,1,2,4,', '市场部', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_branch VALUES (8, 5, '0,1,3,5,', '运营部', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_branch VALUES (9, 5, '0,1,3,5,', '财务部', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_branch VALUES (10, 5, '0,1,3,5,', '仓储部', 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_branch VALUES (11, 6, '0,1,2,4,6,', '运维组', 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS sys_authorize_config;
CREATE TABLE sys_authorize_config (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '配置编码',
  clazz varchar(64) NOT NULL DEFAULT '' COMMENT '配置类别',
  rule varchar(64) NOT NULL DEFAULT '' COMMENT '配置规则',
  remark varchar(64) NOT NULL DEFAULT '' COMMENT '配置说明',
  createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (id) USING BTREE
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=Dynamic COMMENT '规则配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO sys_authorize_config VALUES (1, 'role', '7|8#9|10', '角色互斥', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_authorize_config VALUES (2, 'user has role number', '5', '用户可拥有的角色数量限制', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_authorize_config VALUES (3, 'role was assigned number', '5', '角色可被分配的用户数量限制', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS sys_group;
CREATE TABLE sys_group (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '组编码',
  parentid int(11) NOT NULL DEFAULT '0' COMMENT '父级编码',
  parentids varchar(256) NOT NULL DEFAULT '' COMMENT '所有父级编码',
  name varchar(64) NOT NULL DEFAULT '' COMMENT '组名称',
  createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (id) USING BTREE
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=Dynamic COMMENT '组表';

-- ----------------------------
-- Records of sys_group
-- ----------------------------
INSERT INTO sys_group VALUES (10001, 0, '0,', '运营组', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_group VALUES (10002, 0, '0,', '后勤组', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ----------------------------
-- Table structure for sys_group_permission
-- ----------------------------
DROP TABLE IF EXISTS sys_group_permission;
CREATE TABLE sys_group_permission (
  gid int(11) NOT NULL COMMENT '组编码',
  pid int(11) NOT NULL COMMENT '权限编码',
  createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (gid, pid) USING BTREE
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=Dynamic COMMENT '组权限表';

-- ----------------------------
-- Table structure for sys_group_role
-- ----------------------------
DROP TABLE IF EXISTS sys_group_role;
CREATE TABLE sys_group_role (
  gid int(11) NOT NULL COMMENT '组编码',
  rid int(11) NOT NULL COMMENT '角色编码',
  createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (gid, rid) USING BTREE
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=Dynamic COMMENT '组角色表';

-- ----------------------------
-- Records of sys_group_role
-- ----------------------------
INSERT INTO sys_group_role VALUES (10001, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_group_role VALUES (10001, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_group_role VALUES (10001, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_group_role VALUES (10002, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_group_role VALUES (10002, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_group_role VALUES (10002, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_group_role VALUES (10002, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ----------------------------
-- Table structure for sys_permission_auto
-- ----------------------------
DROP TABLE IF EXISTS sys_permission_auto;
CREATE TABLE sys_permission_auto (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '权限编码',
  parentid int(11) NOT NULL DEFAULT '0' COMMENT '父级编码',
  parentids varchar(256) NOT NULL DEFAULT '' COMMENT '所有父级编码',
  name varchar(32) NOT NULL DEFAULT '' COMMENT '权限名称',
  level int(11) NOT NULL DEFAULT '0' COMMENT '权限层级',
  path varchar(256) DEFAULT '' COMMENT '链接路径',
  createtime datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (id) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission_auto
-- ----------------------------
INSERT INTO sys_permission_auto VALUES (1, 0, '0,', '系统管理', 1, '/api/v1.0.0/system', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (2, 0, '0,', '用户管理', 1, '/api/v1.0.0/user', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (3, 0, '0,', '商品管理', 1, '/api/v1.0.0/good', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (4, 0, '0,', '订单管理', 1, '/api/v1.0.0/order', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (5, 0, '0,', '财务管理', 1, '/api/v1.0.0/finance', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (6, 0, '0,', '库存管理', 1, '/api/v1.0.0/stock', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 系统管理
INSERT INTO sys_permission_auto VALUES (7, 1, '0,1,', '应用设置', 2, '/api/v1.0.0/system/setting', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (8, 7, '0,1,7,', '修改密码', 3, '/api/v1.0.0/system/setting/password', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (9, 7, '0,1,7,', '更改头像', 3, '/api/v1.0.0/system/setting/avatar', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (10, 7, '0,1,7,', '安全设置', 3, '/api/v1.0.0/system/setting/safe', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (11, 7, '0,1,7,', '通用设置', 3, '/api/v1.0.0/system/setting/normal', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (12, 1, '0,1,', '角色管理', 2, '/api/v1.0.0/system/role', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (13, 12, '0,1,12,', '创建角色', 3, '/api/v1.0.0/system/role/create', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (14, 12, '0,1,12,', '更新角色', 3, '/api/v1.0.0/system/role/update', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (15, 12, '0,1,12,', '删除角色', 3, '/api/v1.0.0/system/role/remove', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (16, 12, '0,1,12,', '分配角色', 3, '/api/v1.0.0/system/role/assign', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (17, 1, '0,1,', '用户配置', 2, '/api/v1.0.0/system/user', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (18, 1, '0,1,', '商品配置', 2, '/api/v1.0.0/system/good', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (19, 1, '0,1,', '订单配置', 2, '/api/v1.0.0/system/order', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (20, 1, '0,1', '财务配置', 2, '/api/v1.0.0/system/finance', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (21, 1, '0,1,', '库存配置', 2, '/api/v1.0.0/system/stock', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 用户管理
INSERT INTO sys_permission_auto VALUES (22, 2, '0,2,', '用户列表', 2, '/api/v1.0.0/user/list', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (23, 2, '0,2,', '用户检索', 2, '/api/v1.0.0/user/search', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (24, 2, '0,2,', '用户详情', 2, '/api/v1.0.0/user/details', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (25, 2, '0,2,', '用户统计', 2, '/api/v1.0.0/user/count', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (26, 2, '0,2,', '冻结解冻', 2, '/api/v1.0.0/user/endis', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (27, 2, '0,2,', '贴打标签', 2, '/api/v1.0.0/user/tags', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 商品管理
INSERT INTO sys_permission_auto VALUES (28, 3, '0,3,', '商品列表', 2, '/api/v1.0.0/good/list', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (29, 3, '0,3,', '商品检索', 2, '/api/v1.0.0/good/search', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (30, 3, '0,3,', '商品详情', 2, '/api/v1.0.0/good/details', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (31, 3, '0,3,', '商品编排', 2, '/api/v1.0.0/good/layout', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (32, 3, '0,3,', '商品统计', 2, '/api/v1.0.0/good/count', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (33, 3, '0,3,', '上架下架', 2, '/api/v1.0.0/good/endis', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 订单管理
INSERT INTO sys_permission_auto VALUES (34, 4, '0,4,', '订单列表', 2, '/api/v1.0.0/order/list', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (35, 4, '0,4,', '订单检索', 2, '/api/v1.0.0/order/search', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (36, 4, '0,4,', '订单详情', 2, '/api/v1.0.0/order/details', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (37, 4, '0,4,', '订单统计', 2, '/api/v1.0.0/order/count', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (38, 4, '0,4,', '订单合并', 2, '/api/v1.0.0/order/merge', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (39, 4, '0,4,', '冻结解冻', 2, '/api/v1.0.0/order/endis', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (40, 4, '0,4,', '取消订单', 2, '/api/v1.0.0/order/cancel', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 财务管理
INSERT INTO sys_permission_auto VALUES (41, 5, '0,5,', '登账', 2, '/api/v1.0.0/finance/account', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (42, 5, '0,5,', '出报表', 2, '/api/v1.0.0/finance/report', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (43, 5, '0,5,', '审核报销单', 2, '/api/v1.0.0/finance/reimburse', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (44, 5, '0,5,', '报税', 2, '/api/v1.0.0/finance/collect', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (45, 5, '0,5,', '往来结算', 2, '/api/v1.0.0/finance/pay', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (46, 5, '0,5,', '现金收付', 2, '/api/v1.0.0/finance/cash', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (47, 5, '0,5,', '现金盘存', 2, '/api/v1.0.0/finance/tax', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 库存管理
INSERT INTO sys_permission_auto VALUES (48, 6, '0,6,', '库存入库', 2, '/api/v1.0.0/stock/input', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (49, 6, '0,6,', '库存出库', 2, '/api/v1.0.0/stock/output', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (50, 6, '0,6,', '库内盘点', 2, '/api/v1.0.0/stock/check', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (51, 6, '0,6,', '库存统计', 2, '/api/v1.0.0/stock/cost', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (52, 6, '0,6,', '计费管理', 2, '/api/v1.0.0/stock/count', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission_auto VALUES (53, 6, '0,6,', '区域配送', 2, '/api/v1.0.0/stock/dispatch', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS sys_permission;
CREATE TABLE sys_permission (
  id int(11) NOT NULL COMMENT '权限编码',
  parentid int(11) NOT NULL DEFAULT '0' COMMENT '父级编码',
  parentids varchar(256) NOT NULL DEFAULT '' COMMENT '所有父级编码',
  name varchar(32) NOT NULL DEFAULT '' COMMENT '权限名称',
  level int(11) NOT NULL DEFAULT '0' COMMENT '权限层级',
  path varchar(256) DEFAULT '' COMMENT '链接路径',
  createtime datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (id) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='权限表';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO sys_permission VALUES (1, 0, '0,', '系统管理', 1, '/api/v1.0.0/system', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (2, 0, '0,', '用户管理', 1, '/api/v1.0.0/user', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (3, 0, '0,', '商品管理', 1, '/api/v1.0.0/good', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (4, 0, '0,', '订单管理', 1, '/api/v1.0.0/order', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (5, 0, '0,', '财务管理', 1, '/api/v1.0.0/finance', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (6, 0, '0,', '库存管理', 1, '/api/v1.0.0/stock', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 系统管理
INSERT INTO sys_permission VALUES (1010000, 1, '0,1,', '应用设置', 2, '/api/v1.0.0/system/setting', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1010100, 1010000, '0,1,1010000,', '修改密码', 3, '/api/v1.0.0/system/setting/password', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1010200, 1010000, '0,1,1010000,', '更改头像', 3, '/api/v1.0.0/system/setting/avatar', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1010300, 1010000, '0,1,1010000,', '安全设置', 3, '/api/v1.0.0/system/setting/safe', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1010400, 1010000, '0,1,1010000,', '通用设置', 3, '/api/v1.0.0/system/setting/normal', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1020000, 1, '0,1,', '角色管理', 2, '/api/v1.0.0/system/role', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1020100, 1020000, '0,1,1020000,', '创建角色', 3, '/api/v1.0.0/system/role/create', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1020200, 1020000, '0,1,1020000,', '更新角色', 3, '/api/v1.0.0/system/role/update', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1020300, 1020000, '0,1,1020000,', '删除角色', 3, '/api/v1.0.0/system/role/remove', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1020400, 1020000, '0,1,1020000,', '分配角色', 3, '/api/v1.0.0/system/role/assign', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1030000, 1, '0,1,', '用户配置', 2, '/api/v1.0.0/system/user', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1040000, 1, '0,1,', '商品配置', 2, '/api/v1.0.0/system/good', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1050000, 1, '0,1,', '订单配置', 2, '/api/v1.0.0/system/order', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1060000, 1, '0,1', '财务配置', 2, '/api/v1.0.0/system/finance', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (1070000, 1, '0,1,', '库存配置', 2, '/api/v1.0.0/system/stock', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 用户管理
INSERT INTO sys_permission VALUES (2010000, 2, '0,2,', '用户列表', 2, '/api/v1.0.0/user/list', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (2020000, 2, '0,2,', '用户检索', 2, '/api/v1.0.0/user/search', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (2030000, 2, '0,2,', '用户详情', 2, '/api/v1.0.0/user/details', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (2040000, 2, '0,2,', '用户统计', 2, '/api/v1.0.0/user/count', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (2050000, 2, '0,2,', '冻结解冻', 2, '/api/v1.0.0/user/endis', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (2060000, 2, '0,2,', '贴打标签', 2, '/api/v1.0.0/user/tags', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 商品管理
INSERT INTO sys_permission VALUES (3010000, 3, '0,3,', '商品列表', 2, '/api/v1.0.0/good/list', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (3020000, 3, '0,3,', '商品检索', 2, '/api/v1.0.0/good/search', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (3030000, 3, '0,3,', '商品详情', 2, '/api/v1.0.0/good/details', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (3040000, 3, '0,3,', '商品编排', 2, '/api/v1.0.0/good/layout', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (3050000, 3, '0,3,', '商品统计', 2, '/api/v1.0.0/good/count', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (3060000, 3, '0,3,', '上架下架', 2, '/api/v1.0.0/good/endis', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 订单管理
INSERT INTO sys_permission VALUES (4010000, 4, '0,4,', '订单列表', 2, '/api/v1.0.0/order/list', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (4020000, 4, '0,4,', '订单检索', 2, '/api/v1.0.0/order/search', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (4030000, 4, '0,4,', '订单详情', 2, '/api/v1.0.0/order/details', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (4040000, 4, '0,4,', '订单统计', 2, '/api/v1.0.0/order/count', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (4050000, 4, '0,4,', '订单合并', 2, '/api/v1.0.0/order/merge', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (4060000, 4, '0,4,', '冻结解冻', 2, '/api/v1.0.0/order/endis', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (4070000, 4, '0,4,', '取消订单', 2, '/api/v1.0.0/order/cancel', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 财务管理
INSERT INTO sys_permission VALUES (5010000, 5, '0,5,', '登账', 2, '/api/v1.0.0/finance/account', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (5020000, 5, '0,5,', '出报表', 2, '/api/v1.0.0/finance/report', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (5030000, 5, '0,5,', '审核报销单', 2, '/api/v1.0.0/finance/reimburse', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (5040000, 5, '0,5,', '报税', 2, '/api/v1.0.0/finance/collect', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (5050000, 5, '0,5,', '往来结算', 2, '/api/v1.0.0/finance/pay', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (5060000, 5, '0,5,', '现金收付', 2, '/api/v1.0.0/finance/cash', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (5070000, 5, '0,5,', '现金盘存', 2, '/api/v1.0.0/finance/tax', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 库存管理
INSERT INTO sys_permission VALUES (6010000, 6, '0,6,', '库存入库', 2, '/api/v1.0.0/stock/input', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (6020000, 6, '0,6,', '库存出库', 2, '/api/v1.0.0/stock/output', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (6030000, 6, '0,6,', '库内盘点', 2, '/api/v1.0.0/stock/check', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (6040000, 6, '0,6,', '库存统计', 2, '/api/v1.0.0/stock/cost', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (6050000, 6, '0,6,', '计费管理', 2, '/api/v1.0.0/stock/count', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_permission VALUES (6060000, 6, '0,6,', '区域配送', 2, '/api/v1.0.0/stock/dispatch', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
  id int(11) NOT NULL COMMENT '角色编码',
  parentid int(11) NOT NULL DEFAULT '0' COMMENT '父级编码',
  parentids varchar(256) NOT NULL DEFAULT '' COMMENT '所有父级编码',
  name varchar(64) NOT NULL DEFAULT '' COMMENT '角色名称',
  createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (id) USING BTREE
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=Dynamic COMMENT '角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO sys_role VALUES (1, 0, '0,', '公共角色', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (2, 0, '0,', '超级管理员', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (3, 1, '0,', '系统管理员', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (4, 1, '0,1,', '客服', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (5, 1, '0,1,', '产品', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (6, 1, '0,1,', '运营', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (7, 1, '0,1,', '会计', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (8, 1, '0,1,', '出纳', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (9, 1, '0,1,', '库管', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (10, 1, '0,1,', '配送', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (11, 1, '0,1,', '用户管理员', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (12, 1, '0,1,', '商品管理员', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (13, 1, '0,1,', '订单管理员', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (14, 1, '0,1,7,8,', '财务经理', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role VALUES (15, 1, '0,1,9,10,', '仓储负责人', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS sys_role_permission;
CREATE TABLE sys_role_permission (
  rid int(11) NOT NULL COMMENT '角色编码',
  pid int(11) NOT NULL COMMENT '权限编码',
  createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (rid, pid) USING BTREE
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=Dynamic COMMENT '角色权限表';

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
-- 核公基角色
INSERT INTO sys_role_permission VALUES (1, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (1, 1010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (1, 1010100, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (1, 1010200, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (1, 1010300, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (1, 1010400, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 超级管理员
INSERT INTO sys_role_permission VALUES (2, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1000000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1010100, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1010200, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1010300, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1010400, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1020100, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1020200, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1020300, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1020400, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 1070000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 2010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 2020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 2030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 2040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 2050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 2060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 3010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 3020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 3030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 3040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 3050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 3060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 4010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 4020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 4030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 4040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 4050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 4060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 4070000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 5010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 5020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 5030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 5040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 5050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 5060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 5070000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 6010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 6020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 6030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 6040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 6050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (2, 6060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 系统管理员
INSERT INTO sys_role_permission VALUES (3, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (3, 1020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (3, 1020100, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (3, 1020200, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (3, 1020300, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (3, 1020400, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (3, 1030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (3, 1040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (3, 1050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (3, 1060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (3, 1070000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 客服
INSERT INTO sys_role_permission VALUES (4, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (4, 2020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (4, 2030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (4, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (4, 3020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (4, 3030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (4, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (4, 4020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (4, 4030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (4, 4050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 产品
INSERT INTO sys_role_permission VALUES (5, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (5, 2010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (5, 2040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (5, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (5, 3010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (5, 3050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (5, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (5, 4010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (5, 4040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 运营
INSERT INTO sys_role_permission VALUES (6, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 2020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 2040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 2050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 2060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 3020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 3040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 3050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 3060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 4020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 4040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 4060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 4070000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (6, 6040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 会计
INSERT INTO sys_role_permission VALUES (7, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (7, 5010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (7, 5020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (7, 5030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (7, 5040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 出纳
INSERT INTO sys_role_permission VALUES (8, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (8, 5050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (8, 5060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (8, 5070000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 库管
INSERT INTO sys_role_permission VALUES (9, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (9, 6010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (9, 6020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (9, 6030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (9, 6040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 配送
INSERT INTO sys_role_permission VALUES (10, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (10, 6050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (10, 6060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 用户管理员
INSERT INTO sys_role_permission VALUES (11, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (11, 2010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (11, 2020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (11, 2030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (11, 2040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (11, 2050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (11, 2060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 商品管理员
INSERT INTO sys_role_permission VALUES (12, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (12, 3010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (12, 3020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (12, 3030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (12, 3040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (12, 3050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (12, 3060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- 订单管理员
INSERT INTO sys_role_permission VALUES (13, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (13, 4010000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (13, 4020000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (13, 4030000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (13, 4040000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (13, 4050000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (13, 4060000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_role_permission VALUES (13, 4070000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编码',
  bid int(11) NOT NULL DEFAULT '1' COMMENT '机构编码',
  username varchar(32) NOT NULL COMMENT '用户名',
  password varchar(32) NOT NULL COMMENT '密码',
  scope tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：全部，1：部门及以下，2：仅个人' COMMENT '角色范围',
  createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (id) USING BTREE
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=Dynamic COMMENT '用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO sys_user VALUES (1, 1, '超级管理员', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (2, 1, '董事长', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (3, 2, '石昊', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (4, 3, '柳神', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (5, 4, '萧炎', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (6, 6, '林动', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (7, 7, '清漪', '123456', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (8, 7, '彩鳞', '123456', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (9, 8, '姜立', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (10, 8, '清竹', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (11, 9, '薰儿', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (12, 9, '灵儿', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (13, 10, '紫妍', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (14, 10, '云韵', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (15, 11, '秦羽', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user VALUES (16, 11, '罗峰', '123456', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ----------------------------
-- Table structure for sys_user_group
-- ----------------------------
DROP TABLE IF EXISTS sys_user_group;
CREATE TABLE sys_user_group  (
  uid int(11) NOT NULL COMMENT '用户编码',
  gid int(11) NOT NULL COMMENT '组编码',
  createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (uid, gid) USING BTREE
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=Dynamic COMMENT '用户组表';

-- ----------------------------
-- Records of sys_user_group
-- ----------------------------
INSERT INTO sys_user_group VALUES (3, 10001, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user_group VALUES (4, 10002, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ----------------------------
-- Table structure for sys_user_permission
-- ----------------------------
DROP TABLE IF EXISTS sys_user_permission;
CREATE TABLE sys_user_permission  (
  uid int(11) NOT NULL COMMENT '用户编码',
  pid int(11) NOT NULL COMMENT '权限编码',
  createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (uid, pid) USING BTREE
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=Dynamic COMMENT '用户权限表';

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role  (
  uid int(11) NOT NULL COMMENT '用户编码',
  rid int(11) NOT NULL COMMENT '角色编码',
  createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (uid, rid) USING BTREE
) ENGINE=InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=Dynamic COMMENT '角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO sys_user_role VALUES (1, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user_role VALUES (2, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user_role VALUES (7, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user_role VALUES (8, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user_role VALUES (9, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user_role VALUES (10, 6, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user_role VALUES (11, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user_role VALUES (12, 8, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user_role VALUES (13, 9, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user_role VALUES (14, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO sys_user_role VALUES (15, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ----------------------------
-- Function structure for getChildList
-- ----------------------------
DROP FUNCTION IF EXISTS getChildList;
delimiter ;;
CREATE DEFINER=root@localhost FUNCTION getChildList(nodeid INT) RETURNS varchar(1000) CHARSET utf8
BEGIN
    DECLARE childList VARCHAR(1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);      # 返回叶子节点结果集
    DECLARE tempChild VARCHAR(1000, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);      # 临时存放子节点

    SET childList='';
    SET tempChild=CAST(nodeid AS CHAR, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP); # 将int类型转换为String

    WHILE tempChild IS NOT NULL DO        # 循环，用于查询节点下所有的子节点
        SET childList=CONCAT(childList, ',', tempChild, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);   # 存入到返回结果中
        SELECT sys_group_CONCAT(id) INTO tempChild FROM sys_branch WHERE FIND_IN_SET(pid, tempChild) > 0;   # 查询节点下所有子节点
    END WHILE;
    RETURN SUBSTRING(childList, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);       # 将返回结果处理，截取掉结果集前面的逗号
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS=1;

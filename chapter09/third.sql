DROP TABLE IF EXISTS user_info;
DROP TABLE IF EXISTS user_auth;
DROP TABLE IF EXISTS apply_info;
DROP TABLE IF EXISTS apply_auth;

-- 创建user_info表
DROP TABLE IF EXISTS user_info;
CREATE TABLE user_info (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT '用户编码',
  realname VARCHAR(32) NOT NULL COMMENT '真实姓名',
  nickname VARCHAR(32) NOT NULL DEFAUlT '佚名' COMMENT '昵称',
  avatar VARCHAR(256) NOT NULL DEFAUlT '' COMMENT '头像',
  cover VARCHAR(256) NOT NULL DEFAUlT '' COMMENT '封面地址',
  createtime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '用户信息表';

-- 创建user_auth表
DROP TABLE IF EXISTS user_auth;
CREATE TABLE user_auth (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT '授权编码',
  userid INT(11) NOT NULL DEFAUlT 0 COMMENT '用户编码',
  type TINYINT(1) NOT NULL DEFAUlT 0 COMMENT '登录类型，0：用户名，1：手机号，2：邮箱，10：QQ，11：微信，12：微博，100：github',
  identifier VARCHAR(64) NOT NULL COMMENT '用户名/手机号/邮箱或第三方应用的唯一标识，这个字段全局唯一',
  credential VARCHAR(64) NOT NULL COMMENT '站内的为密码，站外的为token，如果是密码则为MD5方式',
  expire INT(11) NOT NULL DEFAULT -1 COMMENT 'credential过期时间（单位秒），默认值为-1，表示永不过期',
  createtime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '用户授权表';

-- 创建唯一索引
CREATE UNIQUE INDEX auth_identifier ON user_auth (identifier);

-- 创建apply_info表
DROP TABLE IF EXISTS apply_info;
CREATE TABLE apply_info (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增编码',
  userid INT(11) NOT NULL DEFAUlT 0 COMMENT '用户编码',
  appid VARCHAR(32) NOT NULL COMMENT '应用编码',
  appsecret VARCHAR(32) NOT NULL COMMENT '应用secret',
  appname VARCHAR(256) NOT NULL COMMENT '应用名称',
  description VARCHAR(256) NOT NULL COMMENT '应用描述',
  homepage VARCHAR(256) NOT NULL COMMENT '应用主页地址',
  redirect VARCHAR(256) NOT NULL COMMENT '应用回调地址',
  createtime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '应用申请信息表';

-- 创建apply_auth表
DROP TABLE IF EXISTS apply_auth;
CREATE TABLE apply_auth (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增编码',
  userid INT(11) NOT NULL DEFAUlT 0 COMMENT '用户编码',
  appid VARCHAR(32) NOT NULL COMMENT '应用编码',
  code VARCHAR(32) NOT NULL COMMENT '应用授权码',
  token VARCHAR(32) NOT NULL COMMENT '应用令牌',
  createtime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  updatetime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '应用申请授权表';

-- ----------------------------
-- 插入测试数据
-- ----------------------------
BEGIN;
INSERT INTO `user_info` VALUES (1, 'javabook', 'javabook佚名', '', '', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO `user_auth` VALUES (1, 1, 0, 'test', '123456', -1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO `apply_info` VALUES (1, 1, '8e5f7cc5cb85427cbcd0c632548afaf4', 'c5023ccf1f2a4d33876a66d7af8c469c', '测试应用', '实现第三方平台授权', 'http://localhost:9527', '', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
COMMIT;

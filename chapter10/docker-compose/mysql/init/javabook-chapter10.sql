SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `javabook` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for sys_accounting_voucher
-- ----------------------------
DROP TABLE IF EXISTS `sys_accounting_voucher`;
CREATE TABLE `sys_accounting_voucher` (
  `guid` bigint(20) unsigned NOT NULL COMMENT '凭证编码',
  `voucherno` varchar(64) NOT NULL COMMENT '原始凭证号，用商家支付订单号表示',
  `requestno` bigint(20) unsigned NOT NULL COMMENT '请求号',
  `entrytype` varchar(16) NOT NULL DEFAULT '' COMMENT '会计分录类型',
  `origin` varchar(16) NOT NULL DEFAULT 'APP' COMMENT '来源系统 APP；WEB；SCAN；FACE；PACKAGE；POINT',
  `payamount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '付款方支付金额',
  `changeamount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收款方变动金额',
  `payeraccountno` varchar(32) NOT NULL COMMENT '付款方账号',
  `receiveraccountno` varchar(32) NOT NULL COMMENT '收款方账号',
  `income` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收入',
  `cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本',
  `profit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '利润',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(128) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `sys_accounting_voucher_voucherno` (`voucherno`) USING HASH,
  UNIQUE KEY `sys_accounting_voucher_requestno` (`requestno`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='会计原始凭证表';

-- ----------------------------
-- Records of sys_accounting_voucher
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_payment_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_payment_order`;
CREATE TABLE `sys_payment_order` (
  `guid` bigint(20) unsigned NOT NULL COMMENT '支付订单唯一编码',
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户编码',
  `taskid` bigint(20) unsigned NOT NULL COMMENT '订单（订单）编码',
  `transno` varchar(64) NOT NULL DEFAULT '' COMMENT '支付交易流水号',
  `outerno` varchar(64) NOT NULL DEFAULT '' COMMENT '支付交易订单号',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '支付标题',
  `paytype` varchar(16) NOT NULL DEFAULT 'BALANCE' COMMENT '支付类别 0：余额；1：支付宝；2：微信；3：银行卡',
  `payclass` varchar(16) NOT NULL DEFAULT '' COMMENT '支付类型 0：消费；1：充值；2：提现',
  `paychannel` varchar(64) NOT NULL DEFAULT 'APP' COMMENT '支付渠道 0：APP；1：WEB；2：SCAN；3：FACE；4：PACKAGE；5：POINT',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `period` int(4) NOT NULL DEFAULT '0' COMMENT '订单有效期(单位秒)，默认0',
  `reason` varchar(64) NOT NULL DEFAULT '' COMMENT '订单失败原因',
  `status` varchar(16) NOT NULL DEFAULT 'SUCCESS' COMMENT '支付状态 CREATED；WAITING_PAYMENT；SUCCESS；TRADE_SUCCESS；FAILED；CANCELED；TIMEOUTED',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` text COMMENT '成功时保存用于调起移动支付的JSON字符串',
  PRIMARY KEY (`guid`),
  UNIQUE KEY `sys_user_payment_order_outerno` (`outerno`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='支付订单表';

-- ----------------------------
-- Records of sys_payment_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_amount
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_amount`;
CREATE TABLE `sys_user_amount` (
  `guid` bigint(20) unsigned NOT NULL COMMENT '用户编码',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '账户余额',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户余额账户表';

-- ----------------------------
-- Records of sys_user_amount
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_amount` VALUES (1, 10000, '2022-11-05 17:02:15', '2023-02-12 21:48:55');
INSERT INTO `sys_user_amount` VALUES (2, 10000, '2022-11-05 17:02:56', '2023-02-12 21:48:57');
INSERT INTO `sys_user_amount` VALUES (3, 10000, '2022-11-05 17:03:06', '2023-02-12 21:48:59');
INSERT INTO `sys_user_amount` VALUES (4, 10000, '2022-11-05 17:03:10', '2023-02-12 21:49:01');
INSERT INTO `sys_user_amount` VALUES (5, 10000, '2022-11-05 17:03:15', '2023-02-12 21:49:03');
INSERT INTO `sys_user_amount` VALUES (6, 10000, '2022-11-05 17:03:19', '2023-02-12 21:49:05');
INSERT INTO `sys_user_amount` VALUES (7, 10000, '2022-11-05 17:03:23', '2023-02-12 21:49:08');
INSERT INTO `sys_user_amount` VALUES (8, 10000, '2022-11-05 17:03:27', '2023-02-12 21:49:09');
INSERT INTO `sys_user_amount` VALUES (9, 10000, '2022-11-05 17:03:31', '2023-02-12 21:49:11');
INSERT INTO `sys_user_amount` VALUES (10, 10000, '2022-11-05 17:03:36', '2023-02-12 21:49:13');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_bill
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_bill`;
CREATE TABLE `sys_user_bill` (
  `guid` bigint(20) unsigned NOT NULL COMMENT '账单编码',
  `taskid` bigint(20) unsigned NOT NULL COMMENT '订单编码',
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户编码',
  `outerno` varchar(64) NOT NULL DEFAULT '' COMMENT '提现的商户订单号',
  `billobject` tinyint(1) NOT NULL DEFAULT '0' COMMENT '账单对象 0：用户；1：商家；2：平台；3：第三方',
  `objectid` bigint(20) unsigned NOT NULL COMMENT '账单对象编码',
  `billtype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '账单类别 0：发单；1：接单；2：充值；3：提现；4：退款',
  `paytype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式 0：余额；1：支付宝；2：微信支付；3：银行卡',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '账单金额',
  `subject` varchar(128) NOT NULL DEFAULT '' COMMENT '备注',
  `benefitclass` tinyint(1) NOT NULL DEFAULT '0' COMMENT '优惠类型，0：无；1：积分；2：会员折扣；3：优惠券；4：红包；5：其他',
  `benefitid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '优惠实物编码',
  `benefitmoney` int(11) NOT NULL DEFAULT '0' COMMENT '优惠额度',
  `realitymoney` int(11) NOT NULL DEFAULT '0' COMMENT '实际支付金额',
  `billtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '账单时间',
  PRIMARY KEY (`guid`),
  KEY `sys_user_bill_union_key01` (`taskid`,`userid`,`billtype`) USING HASH,
  KEY `sys_user_bill_billtime` (`userid`,`billtime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户账单表';

-- ----------------------------
-- Records of sys_user_bill
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_task`;
CREATE TABLE `sys_user_task` (
  `guid` bigint(20) unsigned NOT NULL COMMENT '订单编码',
  `userobject` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发单用户类型 0：用户；1：商家；2：平台；3：第三方',
  `userid` bigint(20) unsigned NOT NULL COMMENT '发单用户编码',
  `acceptobject` tinyint(1) NOT NULL DEFAULT '0' COMMENT '接单用户类型 0：用户；1：商家；2：平台；3：第三方',
  `accepterid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '接单用户编码',
  `province` varchar(64) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(64) NOT NULL DEFAULT '' COMMENT '城市',
  `citycode` varchar(16) NOT NULL DEFAULT '' COMMENT '城市编码',
  `district` varchar(32) NOT NULL DEFAULT '' COMMENT '地区名称',
  `zipcode` varchar(16) NOT NULL DEFAULT '' COMMENT '邮编',
  `images` varchar(1024) NOT NULL DEFAULT '' COMMENT '订单图片',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '酬金',
  `descript` varchar(128) NOT NULL DEFAULT '' COMMENT '订单描述',
  `closetime` int(11) NOT NULL DEFAULT '0' COMMENT '秒数，希望从发布订单开始到后多少秒完成',
  `publishtime` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `accepttime` timestamp NULL DEFAULT NULL COMMENT '接单时间',
  `finishtime` timestamp NULL DEFAULT NULL COMMENT '接单者完成时间',
  `modifiedtime` timestamp NULL DEFAULT NULL COMMENT '发单人修改时间',
  `canceltime` timestamp NULL DEFAULT NULL COMMENT '取消时间',
  `confirmtime` timestamp NULL DEFAULT NULL COMMENT '发单人确认完成时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单类别 0：普通订单；1：活动订单',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态 0：未发布；1：等待接单；2：执行中；3：已完成待付款；4：已完成待评论；5：用户已取消；6：接单人已取消；7：订单超时；8：已删除',
  `paystatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单支付状态 0：未支付；1：已支付',
  `tradetype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '交易类型 0：发单；1：接单；2：充值；3：提现；4：退款',
  `paytype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式 0：余额；1：支付宝；2：微信支付；3：银行卡',
  PRIMARY KEY (`guid`) USING BTREE,
  KEY `sys_user_task_confirmtime` (`confirmtime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户订单表';

-- ----------------------------
-- Records of sys_user_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user_trade
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_trade`;
CREATE TABLE `sys_user_trade` (
  `guid` bigint(20) unsigned NOT NULL COMMENT '交易编码',
  `taskid` bigint(20) unsigned NOT NULL COMMENT '订单编码',
  `userid` bigint(20) unsigned NOT NULL COMMENT '用户编码',
  `tradeobject` tinyint(1) NOT NULL DEFAULT '0' COMMENT '交易对象，0：用户；1：商家；2：平台；3：第三方',
  `objectid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '交易对象编码',
  `tradetype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '交易类型 0：发单；1：接单；2：充值；3：提现；4：退款',
  `paytype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式 0：余额；1：支付宝；2：微信支付；3：银行卡',
  `money` int(11) NOT NULL DEFAULT '0' COMMENT '交易金额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '交易状态，0：未完成；1：已完成',
  `remark` varchar(64) NOT NULL DEFAULT '' COMMENT '备注，保存商户提现订单号',
  `publishtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `accepttime` timestamp NULL DEFAULT NULL COMMENT '接单时间',
  `canceltime` timestamp NULL DEFAULT NULL COMMENT '取消时间',
  `tradetime` timestamp NULL DEFAULT NULL COMMENT '交易完成时间',
  PRIMARY KEY (`guid`),
  KEY `sys_user_trade_union_key01` (`taskid`,`userid`,`objectid`,`tradetype`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='交易记录表';

-- ----------------------------
-- Records of sys_user_trade
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

-- 查看测试结果
-- 未付款任务
SELECT COUNT(guid) AS 未付款任务数 FROM sys_user_task WHERE paystatus = 0;
-- 已付款任务
SELECT COUNT(guid) AS 已付款任务数 FROM sys_user_task WHERE paystatus = 1;
-- 已支付数
SELECT COUNT(guid) AS 已支付数 FROM sys_payment_order;
-- 账单数
SELECT COUNT(guid) AS 账单数 FROM sys_user_bill;
-- 交易数
SELECT COUNT(guid) AS 交易数 FROM sys_user_trade;
-- 会计分录数
SELECT COUNT(guid) AS 会计分录数 FROM sys_accounting_voucher;

-- 恢复数据脚本
DELETE FROM sys_payment_order;
DELETE FROM sys_user_task;
DELETE FROM sys_user_bill;
DELETE FROM sys_user_trade;
DELETE FROM sys_accounting_voucher;
UPDATE sys_user_amount SET balance = 10000;

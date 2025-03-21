DROP TABLE IF EXISTS rc_inventory;
CREATE TABLE rc_inventory (
  id int(11) NOT NULL AUTO_INCREMENT COMMENT '编码',
  dimension varchar(32) NOT NULL DEFAULT '' COMMENT '维度，USERNAME, MOBILE, IP, DEVICEID',
  type varchar(16) NOT NULL DEFAULT '' COMMENT '类型，BLACK, WHITE, SUSPECTED',
  datavalue varchar(128) NOT NULL DEFAULT '' COMMENT '值',
  detail varchar(512) DEFAULT NULL COMMENT '详情',
  time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '黑名单表';

INSERT INTO rc_inventory VALUES (1, 'USERNAME', 'BLACK', 'lixingyun', '', CURRENT_TIMESTAMP);

DROP TABLE IF EXISTS rc_user;
CREATE TABLE rc_user (
  id int(11) NOT NULL COMMENT '用户编码',
  username varchar(32) NOT NULL COMMENT '用户名',
  password varchar(32) NOT NULL COMMENT '密码',
  enabled tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用或禁用：0:禁用，1:启用',
  createtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

INSERT INTO rc_user VALUES (1, 'admin', '123456', 1, CURRENT_TIMESTAMP);
INSERT INTO rc_user VALUES (2, 'shihao', '123456', 1, CURRENT_TIMESTAMP);



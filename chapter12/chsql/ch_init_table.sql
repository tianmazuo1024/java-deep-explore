DROP TABLE IF EXISTS default.event_data_from_eventbus;
DROP TABLE IF EXISTS default.event_sequence_from_script;

CREATE TABLE IF NOT EXISTS default.event_data_from_eventbus
(
    `user_id` UInt64,
    `event_name` String,
    `event_time` DateTime
)
ENGINE = MergeTree()
order by event_time;

CREATE TABLE IF NOT EXISTS default.event_sequence_from_script
(
    `user_id` UInt64,
    `event_sequence` Array(Tuple(UInt64, Tuple(String, DateTime, UInt32))),
    `window_time` DateTime
)
ENGINE = MergeTree()
ORDER BY user_id
SETTINGS index_granularity = 8192;

INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (3, '登录', '2024-01-01 04:12:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (2, '登录', '2024-01-01 04:20:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (2, '收藏商品', '2024-01-01 04:25:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (2, '查看详情页', '2024-01-01 04:30:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (2, '领券', '2024-01-01 04:45:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (3, '领券', '2024-01-01 04:42:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (1, '登录', '2024-01-01 05:12:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (1, '登录', '2024-01-01 05:13:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (3, '收藏商品', '2024-01-01 05:15:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (1, '领券', '2024-01-01 05:15:08');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (2, '查看详情页', '2024-01-01 05:16:08');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (1, '查看详情页', '2024-01-01 05:17:08');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (1, '查看详情页', '2024-01-01 05:20:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (1, '浏览商品', '2024-01-01 05:25:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (3, '加入购物车', '2024-01-01 05:25:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (2, '加入购物车', '2024-01-01 05:25:30');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (1, '浏览商品', '2024-01-01 05:30:30');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (1, '浏览商品', '2024-01-01 05:30:31');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (3, '用券', '2024-01-01 05:40:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (1, '用券', '2024-01-01 05:40:30');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (2, '查看详情页', '2024-01-01 05:45:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (2, '查看详情页', '2024-01-01 06:15:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (2, '查看详情页', '2024-01-01 06:25:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (2, '查看详情页', '2024-01-01 06:27:38');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (2, '查看详情页', '2024-01-01 06:35:00');
INSERT INTO default.event_data_from_eventbus (user_id, event_name, event_time) VALUES (2, '用券', '2024-01-01 06:40:00');

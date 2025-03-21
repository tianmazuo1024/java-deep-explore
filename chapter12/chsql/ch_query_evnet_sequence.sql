-- 按用户分组查询每个用户的行为序列
SELECT events
FROM default.event_sequence_from_script
Array Join event_sequence AS events

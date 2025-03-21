-- 将数据分组、过滤和排序后插入到了表default.event_sequence_from_script中
INSERT INTO `default`.event_sequence_from_script
(`user_id`, `event_sequence`, `window_time`)
SELECT
*
FROM
  (
    WITH
    	arraySort(
    		x->x.2.2,
    		arrayFilter(
    			x->x.2.2 >= '2024-01-01 00:00:00' AND x.2.2 <= '2024-01-01 23:59:59',
    			groupArray(
    				--数组元素的数据类型是Tuple(UInt64, Tuple(String, Datetime, UInt32))
    							(
    								user_id,
    								(
    									event_name,
    									event_time,
    									toInt32(event_time)
    								)
    							)
    			)
    		)
    	) AS sorted_events
    SELECT
    	user_id,
    	sorted_events,
       '2024-01-01'
    FROM `default`.event_data_from_eventbus
    GROUP BY user_id
  )

-- 查询用户在领取优惠券之后，但在使用优惠券之前的行为序列
WITH
    arrayMap(x -> if(x.2.1 == '领券', 1, 0), event_sequence) AS masks_start,
    arraySplit((x, y) -> y, event_sequence, masks_start) AS split_events_start_arr,
    split_events_start_arr[2] AS split_events_start,
    arrayMap(x -> if(x.2.1 == '用券', 1, 0), split_events_start) AS masks_end,
    arrayReverseSplit((x, y) -> y, split_events_start, masks_end) AS split_events_end,
    split_events_end[1] AS split_events
SELECT arrayJoin(split_events)
FROM default.event_sequence_from_script

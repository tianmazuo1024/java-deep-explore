#!/bin/bash

docker-compose cp ./chsql/ch_find_obtain_coupon_after.sql clickhouse:/
docker-compose exec clickhouse /bin/bash -c "clickhouse-client --multiquery < ch_find_obtain_coupon_after.sql"

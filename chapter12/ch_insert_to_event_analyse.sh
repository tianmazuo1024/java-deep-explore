#!/bin/bash

docker-compose cp ./chsql/ch_insert_to_event_analyse.sql clickhouse:/
docker-compose exec clickhouse /bin/bash -c "clickhouse-client --multiquery < ch_insert_to_event_analyse.sql"

#!/bin/bash

docker-compose cp ./chsql/ch_init_table.sql clickhouse:/
docker-compose exec clickhouse /bin/bash -c "clickhouse-client --multiquery < ch_init_table.sql"

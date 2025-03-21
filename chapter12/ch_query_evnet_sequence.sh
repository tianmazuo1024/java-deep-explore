#!/bin/bash

docker-compose cp ./chsql/ch_query_evnet_sequence.sql clickhouse:/
docker-compose exec clickhouse /bin/bash -c "clickhouse-client --multiquery < ch_query_evnet_sequence.sql"

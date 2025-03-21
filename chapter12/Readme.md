### 将

`docker-compose.yml`
`ch_init_table.sh`
`ch_insert_to_event_analyse.sh`
`ch_find_obtain_coupon_after.sh`
`ch_query_evnet_sequence.sh`
`clickhouse-shell.sh`
这六个文件和
`chsql`
`volumes`
这两个文件夹拷贝到Linux虚拟机的某个目录下，例如`/home/work`
安装好`docker`后就在当前目录下，例如`/home/work`中执行：
`docker-compose up -d`

### 等待一段时间，待镜像下载完并成功启动容器之后，再依次执行下面两条命令：
`sh ./ch_init_table.sh`
`sh ./ch_insert_to_event_analyse.sh`
之后就可以在clickhouse中看到数据了

### 执行下面的命令：
`sh ./clickhouse-shell.sh`
之后就可以在clickhouse的命令行模式下输入并执行查询语句

### 用dbeaver连接clickhouse参考如下三张图即可：
`clickhouse-dbeaver-01.png`
`clickhouse-dbeaver-02.png`
`clickhouse-dbeaver-03.png`

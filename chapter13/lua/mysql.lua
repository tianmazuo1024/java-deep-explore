-- 引入mysql模块
local mysql = require("resty.mysql")
-- 创建实例
local db, err = mysql:new()
if not db then
    ngx.say("new  mysql error:", err)
    return
end
-- 超时时间
db:set_timeout(5000)
-- 建立连接
local props = {
    host = "127.0.0.1",
    port = 3306,
    database = "sys",
    user = "root",
    password = "123456"
}
local res, err, errno, state = db:connect(props)
if not res then
    ngx.say("connect to mysql error: ", err, ", errno: ", errno, ", state: ", state)
    return db:close()
end

-- 删除表
local drop_table_sql = "drop table if exists test"
res, err, errno, state = db:query(drop_table_sql)
if not res then
    ngx.say("drop table error: ", err, ", errno: ", errno, ", state: ", state)
    return db:close()
end

-- 创建表
local create_table_sql = "create table test(id int primary key auto_increment, name varchar(100))"
res, err, errno, state = db:query(create_table_sql)
if not res then
    ngx.say("create table error: ", err, ", errno: ", errno, ", state: ", state)
    return db:close()
end

-- 插入
local insert_sql = "insert into test (name) values('xiangwang')"
res, err, errno, state = db:query(insert_sql)
if not res then
    ngx.say("insert error: ", err, ", errno: ", errno, ", state: ", state)
    return db:close()
end
ngx.say("insert rows: ", res.affected_rows, ", id: ", res.insert_id)

-- 更新
local update_sql = "update test set name = 'xiangwang2' where id = " .. res.insert_id
res, err, errno, sqlstate = db:query(update_sql)
if not res then
    ngx.say("update error: ", err, ", errno: ", errno, ", state: ", state)
    return db:close()
end
ngx.say("update rows : ", res.affected_rows) 

-- 查询
local select_sql = "select id, name from test"
res, err, errno, sqlstate = db:query(select_sql)
if not res then
    ngx.say("select error: ", err, ", errno: ", errno, ", state: ", state)
    return db:close()
end
for i, row in ipairs(res) do
    for name, value in pairs(row) do
        ngx.say("select row ", i, " : ", name, " = ", value)
    end
end

-- 删除
local delete_sql = "delete from test"
res, err, errno, state = db:query(delete_sql)
if not res then
    ngx.say("delete error: ", err, ", errno: ", errno, ", state: ", state)
    return db:close()
end
ngx.say("delete rows: ", res.affected_rows)


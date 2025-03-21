-- 创建实例
local redis = require("resty.redis")
local red = redis:new()

-- 设置超时(毫秒)
red:set_timeout(1000)
-- 建立连接
local ok, err = red:connect("127.0.0.1", 6379)
if not ok then
    return
end

-- 通过密码访问
-- local res, err = red:auth("123456")
-- if not res then
--     ngx.say("connect to redis error: ", err)
--     return
-- end

-- 调用API进行处理
res, err = red:set("hello", "hello world")
if not res then
    ngx.say("set hello key error: ", err)
    local ok, err = red:close()
    if not ok then
        ngx.say("close redis error: ", err)
    end
end

-- 调用API获取数据
local resp, err = red:get("hello")
if not resp then
    ngx.say("get hello key error: ", err)
    local ok, err = red:close()
    if not ok then
        ngx.say("close redis error: ", err)
    end
end
-- 判空处理
if resp == ngx.null then
    resp = '' -- 比如默认值
end
ngx.say("hello: ", resp)

-- 初始化管道
red:init_pipeline()
red:set("test1", "hello")
red:set("test2", "world")
red:get("test1")
red:get("test2")
local respTable, err = red:commit_pipeline()

-- 判空处理
if respTable == ngx.null then
    respTable = {}
end

-- 结果是按照执行顺序返回的一个table
for i, v in ipairs(respTable) do
    ngx.say("result : ", v)
end


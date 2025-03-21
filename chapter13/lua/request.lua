-- nginx变量
local var = ngx.var
ngx.say("ngx.var.a : ", var.a)
var.a = 2;

-- 请求头
local headers = ngx.req.get_headers()
ngx.say("=== headers begin ===")
ngx.say("Host : ", headers["Host"])
ngx.say("user-agent : ", headers["user-agent"])
ngx.say("user-agent : ", headers.user_agent)
for k, v in pairs(headers) do
  ngx.say(k, " : ", v)
end
ngx.say("=== headers end ===")

-- get请求uri参数
ngx.say("=== get args begin ===")
local uri_args = ngx.req.get_uri_args()
for k, v in pairs(uri_args) do
  ngx.say(k, ": ", v)
end
ngx.say("=== get args end ===")

-- post请求参数
ngx.req.read_body()
ngx.say("=== post args begin ===")
local post_args = ngx.req.get_post_args()
for k, v in pairs(post_args) do
  ngx.say(k, ": ", v)
end
ngx.say("=== post args end ===")

-- 请求的http协议版本
ngx.say("ngx.req.http_version:", ngx.req.http_version())
-- 请求方法
ngx.say("ngx.req.get_method:", ngx.req.get_method())
-- 原始的请求头内容
ngx.say("ngx.req.raw_header:", ngx.req.raw_header())
-- 请求的body内容体
ngx.say("ngx.req.get_body_data():", ngx.req.get_body_data())


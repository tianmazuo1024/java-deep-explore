-- 写响应头
ngx.header.a = "1"
-- 多个响应头可用table
ngx.header.b = {"2", "3"}
-- 输出响应
ngx.say("a", "b")
ngx.print("c", "d")
ngx.flush()

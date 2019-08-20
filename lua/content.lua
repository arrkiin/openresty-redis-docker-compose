-- Handle get/post/delete etc
local redis = require "resty.redis"
local red = redis:new()

red:set_timeouts(1000, 1000, 1000) -- 1 sec

local ok, err = red:connect("cache", 6379)
if not ok then
    ngx.say("failed to connect: ", err)
    return
end

ok, err = red:set("dog", "an animal")
if not ok then
    ngx.say("failed to set dog: ", err)
    return
end

local res, err = red:get("dog")
if not res then
    ngx.say("failed to get dog: ", err)
    return
end

if res == ngx.null then
    ngx.say("dog not found.")
    return
end

local cjson = require "cjson"


local json = cjson.encode({
    foo = res,
    some_object = {},
    some_array = cjson.empty_array
})

ngx.status = ngx.HTTP_OK  
ngx.header.content_type = "application/json; charset=utf-8"  
ngx.say(json)  
return ngx.exit(ngx.HTTP_OK)  
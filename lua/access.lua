-- Handle response afther authentication
local res = ngx.location.capture("/auth")

if res.status == ngx.HTTP_OK then
    return
end

if res.status == ngx.HTTP_FORBIDDEN then
    ngx.exit(res.status)
end

ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
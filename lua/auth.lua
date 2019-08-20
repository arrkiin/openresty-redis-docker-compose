-- Check via redis / mysql
if ngx.var.http_x_api_key == "123abc" then
  ngx.exit(ngx.OK)
else
  ngx.exit(ngx.HTTP_FORBIDDEN)
end
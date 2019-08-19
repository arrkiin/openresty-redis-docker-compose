# Start containers

```
docker-compose up -d
```

# Reload nginx config

```
docker-compose exec openresty nginx -s reload
```

# Connect to redis

```
docker-compose exec redis sh
# redis-cli
127.0.0.1:6379> ...
```

Lua JSON-Example from : http://blog.zot24.com/return-json-responses-when-using-openresty-lua/
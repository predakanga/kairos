local list_exists = redis.call("exists", KEYS[1])
if list_exists == 0 then
    redis.call("lpush", KEYS[1], 0)
    redis.call("lpush", KEYS[1], 0)
end
local CMAi = tonumber(redis.call("lindex", KEYS[1], 0) or 0)
local ip1 = tonumber(redis.call("lindex", KEYS[1], 1) or 0) + 1
local CMAip1 = CMAi+((ARGV[1]-CMAi)/ip1)
redis.call("lset", KEYS[1], 0, CMAip1)
redis.call("lset", KEYS[1], 1, ip1)
return redis.status_reply("Average updated")
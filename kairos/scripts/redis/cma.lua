local cma_key = KEYS[1] .. "_cma"
local i_key = KEYS[1] .. "_i"
local CMAi = tonumber(redis.call("get", cma_key) or 0)
local ip1 = tonumber(redis.call("get", i_key) or 0) + 1
local CMAip1 = CMAi+((ARGV[1]-CMAi)/ip1)
redis.call("mset", cma_key, CMAip1, i_key, ip1)

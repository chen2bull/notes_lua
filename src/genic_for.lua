#!/usr/bin/lua

t={"one", "two", "three", el="something"}

-- ipairs只会遍历1到n,其他key的不会遍历
for i,v in ipairs(t) do
print(v)
print(i)
end

-- pairs会遍历所有的key和value
for i,v in pairs(t) do
print(v)
print(i)
end

#!/usr/bin/lua

function add(...)
local s = 0
  for i,v in ipairs(...) do
    s = s + v
  end
return s
end

function add_version2(...)
local s = 0
  for i = 1,select('#', ...) do
    s = s + select(i, ...)
  end
return s
end

print(add_version2(10,20,30,40,50))

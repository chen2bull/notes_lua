#!/usr/bin/lua


local function iter(a, i)
  i = i + 1
  local v = a[i]
  if v then
    return i,v
  end
end

-- 
function my_ipairs(a)
  return iter,a,0 -- 这样的话每次返回的迭代器函数都是同一个
end

ab = {"one", "two", "three"}

for i,v in my_ipairs(ab) do
  print(i, v)
end

-- 为了理解上面的迭代器为什么这样设计,补充for语句的语义
-- for var1,...varn in <explist> do <block> end 等价于以下代码
--[[
local _f, _s, _var = <explist>
while true do
  local var1,...varn = _f(_s, _var)
  _var = var1
  if _var == nil then
    <block>
  end
]]



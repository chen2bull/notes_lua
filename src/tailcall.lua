#!/usr/bin/lua

function g(x)
  print(x)
  return x
end

-- 这是一个尾调用
function f(x)
  return g(x)
end
a = f(10)
print(a)

-- 这不是一个尾调用,调用完g(x)以后,需要丢弃g(x)的返回值
function f2(x)
  g(x)
end
print("=====")
a = f2(10)
print(a)
--[[ 类似地,以下这些也不是尾调用
return 1 + g(x)     -- 必须再做一次加法
return x or g(x)    -- 必须调整为一个返回值
return (g(x))       -- 必须调整为一个返回值

-- lua中只有 "return <func>(<args>)"这样的调用才算是一条尾调用
return x[i].foo(x[j] + a*b, i + j)  就是一条尾调用
]]





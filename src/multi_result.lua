#!/usr/bin/lua

function maximum(a)
  local mi = 1    --最大值的索引
  local m = a[mi] --最大值

  for i,val in ipairs(a) do
    if val > m then
      mi = i; m = val
    end
  end

  return mi,m
end

print(maximum({8,10,23,12,5,7,6}))


function foo2()
  return "a","b"
end

-- 如果函数调用时在表达式的最后, 这样赋值也是合法的
x,y,z=10,foo2()
print(z)

-- 如果返回值不够多,将会用nil来补足缺失的值
x,y,z=foo2()
print(z)

-- 如果函数调用不是在表达式的最后, 则只会产生一个返回值
x,y,z=foo2(),20
print(x)    -- x= "a"
print(y)    -- y= 20
print(z)    -- z= nil


-- 以数组为参数,从下标1开始返回该数组所有的元素
print(unpack({10, 20, 30}))
print(unpack({x=10, 20, 30}))


-- lua版本的unpack
function unpack(t, i)
  i = i or 1
  if t[i] then
    return t[i], unpack(t, i+1)
  end
end

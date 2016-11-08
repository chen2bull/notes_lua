#!/usr/bin/lua

function newCounter()
  local i = 0
  return function ()
    i = i + 1
    return i
  end
end

c1 = newCounter()
print(c1())
print(c1())

c2 = newCounter()
print(c2())
print(c1())
print(c2())

-- 闭包：通过调用含有一个内部函数加上该外部函数持有的外部局部变量（upvalue）
-- 的外部函数（就是工厂）产生的一个实例函数

-- 闭包组成：外部函数+外部函数创建的upvalue+内部函数（闭包函数）



-- 闭包可以轻易批量定义函数,比如创建1~9数字键的按钮(对应的函数)
--[[
function digitButton (digit)
return Button{lable = tostring(digit),
              action = function ()
                add_to_display(digit) 
              end}
]]

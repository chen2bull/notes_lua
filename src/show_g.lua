#!/usr/bin/lua

varb = 12345
bname = "varb"

_G["a"] = _G[bname]	-- 其实就是赋值给全局变量,a

func1 = loadstring("return ".. bname)	-- 这两行也是赋值给全局变量,c
c = func1()
-- c == loadstring("return ".. bname)()	-- 可用一行

print(a)
print(c)
print(a == c)
--------------------------------------------------------------------------


print(assert(_G == _G._G))		-- 是同一个变量

print(io.read)	-- 是一个函数
-- 然而,用这种方式无法索引到如下的变量
print(_G["io.read"] == nil)	


-- 能获取到_G里面a.b.c.d这种形式的变量
function getfield(f)
    local v = _G
    for w in string.gmatch(f, "[%w_]+") do -- 循环匹配变量名
        v = v[w]
    end
    return v
end

 print(getfield("io.read")==io.read)    -- 可以用getfield("io.read")索引到io.read这个方法

function setfield(f, v)
    local temp = _G
    for w, d in string.gmatch(f, "([%w_]+)(%.?)") do
        if d == "." then        -- 如果非贪婪模式还能匹配到点号,就不是最后一个字段
            temp[w] = temp[w] or {}   -- 如果不存在该table,则创建这个table
            temp = temp[w]            -- 迭代地获取后面的字段
        else
            temp[w] = v            -- 如果到了最后面,获取到这个变量
        end
    end
end
 
setfield("x1.x2.x3", 100)
print( x1.x2.x3 )

--------------------------------------------------------------------------
print("-----------------------------------------------------------------")

function declare(name, initval) -- 注意这个函数要在_G的元表设置以前声明
    rawset(_G, name, initval)
end

local mt = {
__newindex = function (_, n)
    error("attempt to write to undeclared global value ".. n, 2)
end,
__index = function (_, n)
    error("attempt to write to undeclared global value ".. n, 2)
end}

setmetatable(_G, mt)

--------------------------------------------------------------------------
print("-----------------------------------------------------------------")
-- 用以下的元表,防止在C或者非全局中修改某个全局变量的值
local declaredName = {}
local mt2 = {}

function mt2.__newindex(t, n, v)
    if not declaredName[n] then
        local w = debug.getinfo(2, "S").what
        if w ~= "main" and w ~= "C" then
            error("attempt to write to undeclared variable " .. n, 2)
        else
            print("变量".. n .. "赋值")
        end
        declaredName[n] = true
    end
    rawset(t, n, v) -- 这里不要直接用等号
end
    
function mt2.__index(_, n)
    if not declaredName[n] then
        error("attempt to read undeclared variable ".. n, 2)
    else
        return nil
    end
end
setmetatable(_G, mt2)
a = {}
b = 1
a.b = 1
print( a.b )

local test = {}
function test.err_func()
    a.c = {}
    _G["b"] = 3                 -- 在局部中访问已经定义的全局变量,没有问题
    setfield("x1.x2.x3", 200)   -- x1.x2.x3在上面已经定义过了,没有问题
    -- setfield("x.y.z", 100)   -- x这个全局变量不存在,这里会抛错
    -- _G["newvalue"] = 3       -- newvalue这个全局变量也不存在,如果执行这一行也会直接抛错
    -- return newvalue2         -- 访问未定义的全局变量也是不允许的
    return a.e                  -- OK,a是全局变量,这样访问a中不存在的成员没有问题
end

print(test.err_func())


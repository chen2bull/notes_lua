#!/usr/bin/lua

a = 1
_ENV["a"] = 233
print(a)
print(_ENV["_G"] == _G)     
print(_ENV["_G"] == _ENV)   -- 所以在全局环境中,_G就是_ENV(为了让lua5.3保持和lua5.2兼容)
print(_ENV == _G)

------------------------------------------------------------------------------

mstring = [===[
local f = ...                              
local m = {}                               

function m.test()                          
    local i =1                             
    while true do                          
        local n, v = debug.getupvalue(f, i)
        if not n then                      
            break                          
        elseif n == "_ENV" then            
            print ("_ENV = "..tostring(v)) 
            break                          
        end                                
        i = i+1                            
    end                                    
end                                        
return m
]===]
print(mstring)

local _env = {tostring = tostring, print = print, debug = debug}

print("_ENV:" ..  tostring(_ENV))
print("_env:" ..  tostring(_env))
-- 编译过后的变量都放到自己指定的环境_env这边
local f, err = load(mstring, "bt", _env)
-- 编译得到的返回值f可以认为是整个文件的字符串组成的一个匿名函数
assert(f, err)      
local m = f(f)
m.test()


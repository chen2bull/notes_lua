#!/usr/bin/lua

a={}
for i=1,5 do
a[#a+1] = io.read()
end

print("====")
print(#a)
print("====")
-- 注意应该避免对中间有元素是nil的数组使用#a长度操作符
for i=1,#a do 
  print(a[i])
end


print("====")
--talbe.maxn, 这种用法适用性更广一些,可以用于有空隙的数组(中间某个元素是nil)
for i=1,table.maxn(a) do   
  print(a[i])
end

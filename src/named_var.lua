#!/usr/bin/lua

function print_old_new(arg) 
  print(arg.old)
  print(arg.new)
end

print_old_new({new="haha_new", old="haha_old"})


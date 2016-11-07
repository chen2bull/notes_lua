#!/usr/bin/lua

function derivative(f, delta)
  delta = delta or 1e-4
  return function(x)
    return (f(x + delta) - f(x))/ delta
  end
end

-- 两个函数返回结果应该是类似的
c = derivative(math.sin)
print(math.cos(15))   
print(c(15))

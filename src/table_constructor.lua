#!/usr/bin/lua

polyline = {color="bule", tickness=2, npoints=4,
{x=0, y=0},
{x=-10, y=0},
{x=-10, y=1},
{x=0, y=1},
}

print(polyline[1].x)
print(polyline[1].y)

print(polyline[2].x)
print(polyline[2].y)



-- 中括号中的值作为key,可以是负数或者运算符
days={[-1] = "Sunday","Monday","Tuesday", "Wednesday",
"Thursday", "Friday", "Saturday"}
print(days[-1])
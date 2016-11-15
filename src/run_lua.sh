#!/usr/bin/env bash

#-e直接执行命令
lua -e "print(math.sin(12))"

#-l 加载库文件
lua -l a 

#-i 执行完文件以后进入交互模式
lua -i -e "_PROMPT='lua>'"

#命令行参数中,脚本名称位于索引0上,脚本之前的选项参数位于负数索引上
#arg[-3]		"lua"
#arg[-2]		"-e"
#arg[-1]		"sin=math.sin"
#arg[0]			"comments.lua"
#arg[1]			"a"
#arg[2]			"b"
lua -e "sin=math.sin" comments.lua a b


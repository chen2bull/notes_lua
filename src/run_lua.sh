#!/usr/bin/env bash

#-eֱ��ִ������
lua -e "print(math.sin(12))"

#-l ���ؿ��ļ�
lua -l a 

#-i ִ�����ļ��Ժ���뽻��ģʽ
lua -i -e "_PROMPT='lua>'"

#�����в�����,�ű�����λ������0��,�ű�֮ǰ��ѡ�����λ�ڸ���������
#arg[-3]		"lua"
#arg[-2]		"-e"
#arg[-1]		"sin=math.sin"
#arg[0]			"comments.lua"
#arg[1]			"a"
#arg[2]			"b"
lua -e "sin=math.sin" comments.lua a b


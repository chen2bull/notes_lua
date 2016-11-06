#!/usr/bin/lua

page = [[
<!DOCTYPE html>
<html lang="en" class=" is-copy-enabled is-u2f-enabled">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta content="origin-when-cross-origin" name="referrer" />

    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/frameworks-119461b8a22c3dc631a815795aa9d7f436fe38386cd99a1ca106fd2798f159aa.css" integrity="sha256-EZRhuKIsPcYxqBV5WqnX9Db+ODhs2ZocoQb9J5jxWao=" media="all" rel="stylesheet" />
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-fb3f5ff93b051ac1e6146d6a27dc2f57e11f1b9b36a7f15bbd84aacdb65ec3a8.css" integrity="sha256-+z9f+TsFGsHmFG1qJ9wvV+EfG5s2p/FbvYSqzbZew6g=" media="all" rel="stylesheet" />
    
]]

print(page)

-- 以[==[开头的多行字符,只能以]==]结束,注意等号可以有任意多个
page2 = [==[
a[b[i]]中的]]也可以出现在多行字符串中啦

]==]

print(page2)

-- 在多行注释中也是可以的

--[====[
注释里也能有]]哦
还是多行的
]====]

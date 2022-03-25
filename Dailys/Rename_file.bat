@echo off
setlocal enabledelayedexpansion
for /f "delims=" %%1 in ('dir /a /b') do (
  set wind=%%1
  ren "%%~1" "!wind:xiaowen-=!"
:: "!wind:=!" , 这里跟要删除的字符串名称，支持删除特殊符号
)
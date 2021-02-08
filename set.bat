@echo off
@REM set /P var=youwillsun
@REM echo %var%
@REM pause

@REM set /P var=请输入一个变量值
@REM echo %var% ~_~
@REM pause

@REM set /P input=请输入计算表达式
@REM set /a var=%input%
@REM echo %input%=%var% ~_~
@REM pause

@REM set /a var=4">>"2
@REM echo %var%
@REM pause

@REM set /a a=1+1,b=2+1,c=3+1
@REM echo %a% %b% %c%
@REM pause

@REM set /p n=请输入2的几次方:
@REM set /a num=1^<^<n
@REM echo %num%
@REM pause

@REM set a=www.youwillsun.com .net .cn
@REM echo 替换前的字符串: "%a%"
@REM set var=%a: =%
@REM echo 替换后的字符串: "%var%"
@REM pause

@REM set a=www.youwillsun.com.net.cn
@REM echo 替换前的字符串: "%a%"
@REM set var=%a:.cn=.xyz%
@REM echo 替换后的字符串: "%var%"
@REM pause

@REM set a=www.youwillsun.com
@REM echo 截取前的字符串: "%a%"
@REM set var=%a:~1,4%
@REM echo 截取后的字符串: "%var%"
@REM pause

@REM set a=www.youwillsun.com
@REM echo 截取前的字符串: "%a%"
@REM set var=%a:~-10%
@REM echo 截取后的字符串: "%var%"
@REM pause

set a=www.youwillsun.com
echo 截取前的字符串: "%a%"
set var=%a:~0,-3%
echo 截取后的字符串: "%var%"
pause
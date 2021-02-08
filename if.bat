@echo off
@REM net user
@REM if %errorlevel%  == 0 echo net user 命令执行成功
@REM pause

@REM set /p var=请输入一个命令：
@REM %var%
@REM if %errorlevel%==0 goto yes
@REM goto no
@REM :yes
@REM echo %var%命令执行成功
@REM pause
@REM exit
@REM :no
@REM echo %var%命令执行失败
@REM pause

@REM set /p var=请输入一个命令：
@REM %var%
@REM if %errorlevel%==0 (
@REM     echo %var%执行成功
@REM ) else (
@REM     echo %var%执行失败
@REM )
@REM pause

@REM set /p var1=请输入第一个比较字符：
@REM set /p var2=请输入第二个比较字符：
@REM if %var1% == %var2% (
@REM     echo %var1% 等于 %var2%
@REM ) else (
@REM     echo %var1% 不等于 %var2%
@REM )
@REM pause

@REM set /p var1=请输入第一个比较字符：
@REM set /p var2=请输入第二个比较字符：
@REM if not %var1% == %var2% (
@REM     echo %var1% 等于 %var2%
@REM ) else (
@REM     echo %var1% 不等于 %var2%
@REM )
@REM pause

@REM if exist "E:\BAT\set.bat" (
@REM     echo 存在文件
@REM ) else (
@REM     echo 不存在文件
@REM )

@REM if /i a == A (
@REM     echo 相等
@REM ) else (
@REM     echo 不相等
@REM )

set /p var=请输入一个数字：
if %var% LEQ 4 (
    echo %var% 小于等于 4
) else (
    echo %var% 大于 4
)
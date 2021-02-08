@echo off
cls
title 多功能修复
:menu
cls
color 0A
echo.
echo ==============================
echo 请选择要进行的操作，然后按回车。
echo ==============================
echo.
echo 1.显示C盘目录文件。
echo.
echo 2.启动计算机小程序。
echo.
echo Q.退出。
echo.
:cho
set /p choice=请选择：
if "%choice%" == "1" goto showFile
if "%choice%" == "2" goto caculate
if /i "%choice%" == "Q" goto endd
echo 选择无效，请重新输入。
echo.
goto cho
:showFile
dir c:\
echo 按任意键返回菜单
pause
goto menu
:caculate
set /p input=请输入计算表达式:
set /a var=%input%
echo %input%=%var% ~_~
echo 按任意键返回菜单
pause
goto menu
:endd exit
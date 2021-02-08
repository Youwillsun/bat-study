@echo off
@REM for /f %%i in (temp-variable.txt) do echo %%i
@REM pause

@REM for /f %%i in (temp-variable.txt) do echo %%~i
@REM pause

@REM for /f %%i in ('dir /b') do echo %%~zi
@REM pause

for /f %%i in ("notepad132465465") do echo %%~$PATH:i
pause
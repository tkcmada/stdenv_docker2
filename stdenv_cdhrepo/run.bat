@echo off
cd %~dp0
call %~dp0..\bin\getdirname.bat .
echo starting HTTP server for 80 port...
docker run -p 80:80 %DIRNAME%
pause

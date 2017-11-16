@echo off
cd %~dp0
call %~dp0..\bin\getdirname.bat .
echo starting HTTP server for 80 port in docker and 8080 port for outside docker...
docker run -p 8080:80 %DIRNAME%
pause

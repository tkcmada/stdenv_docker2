@echo off
cd %~dp0
call %~dp0..\bin\getdirname.bat .
docker push stdenv/%DIRNAME%
pause

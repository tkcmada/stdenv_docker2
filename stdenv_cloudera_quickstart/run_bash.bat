@echo off
cd %~dp0
call %~dp0..\bin\getdirname.bat .
docker run --hostname=quickstart.cloudera --privileged=true -t -i stdenv/%DIRNAME% bash
pause

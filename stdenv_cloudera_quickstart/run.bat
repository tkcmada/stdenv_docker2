@echo off
cd %~dp0
call %~dp0..\bin\getdirname.bat .
echo after entering console, sudo /home/cloudera/cloudera-manager --force --express
docker run --hostname=quickstart.cloudera --privileged=true -p 8080:80 -p 7180:7180 -p 3306:3306 -it stdenv/%DIRNAME% /usr/bin/docker-quickstart
pause

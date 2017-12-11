@echo off
cd %~dp0
call %~dp0..\bin\getdirname.bat .
echo docker run -e RHEL_USER=%RHEL_USER% -e RHEL_PASSWORD=%RHEL_PASSWORD% stdenv/%DIRNAME% bash
docker run -it -e RHEL_USER=%RHEL_USER% -e RHEL_PASSWORD=%RHEL_PASSWORD% stdenv/%DIRNAME% bash
pause

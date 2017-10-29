@echo off
IF "%1" == "" (
  echo usage : build.bat dir_Dockerfile
  pause
  exit 1
)
echo ---------------------------
echo building Docker image %~n1
echo ---------------------------
cd %~dp0
set name=%~n1
docker build -t %name% %name%
pause

@echo off
cd %~dp0
call %~dp0..\setenv.bat
call %~dp0..\bin\getdirname.bat .
docker tag %DIRNAME% %DOCKER_REGISTRY%/%DIRNAME%
docker push %DOCKER_REGISTRY%/%DIRNAME%
pause

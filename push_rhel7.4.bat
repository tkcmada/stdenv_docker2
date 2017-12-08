call %~dp0setenv.bat
set pullname=rhel7.4
set pushname=%DOCKER_REGISTRY%/rhel7.4
docker tag %pullname% %pushname%
docker push %pushname%
pause

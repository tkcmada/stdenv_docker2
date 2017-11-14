call %~dp0setenv.bat
set pullname=eclipse/che
set pushname=%DOCKER_REGISTRY%/che
docker pull %pullname%
docker tag %pullname% %pushname%
docker push %pushname%
pause

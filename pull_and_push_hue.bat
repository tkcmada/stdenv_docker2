call %~dp0setenv.bat
set pullname=gethue/hue
set pushname=%DOCKER_REGISTRY%/hue
docker pull %pullname%
docker tag %pullname% %pushname%
docker push %pushname%
pause

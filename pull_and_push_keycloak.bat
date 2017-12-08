call %~dp0setenv.bat
set pullname=jboss/keycloak
set pushname=%DOCKER_REGISTRY%/keycloak
docker pull %pullname%
docker tag %pullname% %pushname%
docker push %pushname%
pause

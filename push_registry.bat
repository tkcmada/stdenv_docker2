@echo off
IF "%1" == "" (
  echo usage : push_registry.bat dir_name_of_Dockerfile
  pause
  exit 1
)
set name=%~n1
echo ---------------------------
echo tagging and pushing localhost:5000/%name%
echo ---------------------------
docker tag %name% localhost:5000/%name%
docker push localhost:5000/%name%

echo ---------------------------
echo done. press enter to exit
echo ---------------------------
pause

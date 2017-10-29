cd %~dp0
@echo "kick_servcice.bat should run before."
docker exec ^
  -it --privileged hadoop_service /bin/bash
pause

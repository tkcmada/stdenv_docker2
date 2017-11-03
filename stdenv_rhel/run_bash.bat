cd %~dp0
@echo "If you see aws error, you should try to run reset_date.bat before"
docker run ^
  -e AWS_SECRET_ACCESS_KEY=%AWS_SECRET_ACCESS_KEY% ^
  -e AWS_ACCESS_KEY_ID=%AWS_ACCESS_KEY_ID% ^
  -e AWS_DEFAULT_REGION=ap-northeast-1 ^
  -e AWS_DEFAULT_OUTPUT=json ^
  -e TZ=Asia/Tokyo ^
  -it --privileged rhel7.4:latest /bin/bash
pause

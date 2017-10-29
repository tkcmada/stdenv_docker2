@echo -----------------------------------------
@echo If you see AuthError in aws-cli command, it may be caused by date time inaccurancy.
@echo run this command to set date time correctly.
@echo -----------------------------------------
cd %~dp0
docker run ^
  -e TZ=Asia/Tokyo ^
  -it --privileged stdenv_tools:latest ntpdate ntp.nict.jp
pause

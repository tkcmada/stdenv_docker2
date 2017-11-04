@echo off
cd %~dp0
call %~dp0..\bin\getdirname.bat .
if "%RHEL_USER%" == "" (
  set /p RHEL_USER=RHEL subscription username:
)
if "%RHEL_PASSWORD%" == "" (
  set /p RHEL_PASSWORD=RHEL subscription password:
)
echo username=%RHEL_USER%
echo password=%RHEL_PASSWORD%
docker build --build-arg RHEL_USER=%RHEL_USER% --build-arg RHEL_PASSWORD=%RHEL_PASSWORD% -t %DIRNAME% .
pause

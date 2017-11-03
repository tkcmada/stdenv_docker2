@echo off
IF "%1" == "" (
  echo please drag and drop docker image file on this bat
  pause
  exit 1
)
cd %~dp0
echo dividing %~nx1 into %~nx1.zip.XXX...
del /Q %~nx1.zip.*
"%~dp0..\7-zip\7z.exe" a -tzip -v49m %~nx1.zip %~nx1
IF ERRORLEVEL 1 (
  echo error occured
  pause
  exit 1
)

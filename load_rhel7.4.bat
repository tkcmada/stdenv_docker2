set PATH=%~dp07-zip;%PATH%
cd /d %~dp0images
copy /b rhel7.4.tar.zip.* rhel7.4.tar.zip
7z.exe x rhel7.4.tar.zip
docker load < rhel7.4.tar
docker tag registry.access.redhat.com/rhel7.4:latest rhel7.4
del /q rhel7.4.tar rhel7.4.tar.zip
pause

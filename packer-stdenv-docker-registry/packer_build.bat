cd %~dp0
set PATH=%~dp0..\bin;%PATH%
packer.exe validate stdenv-docker-registry.json
packer.exe build    -on-error=cleanup stdenv-docker-registry.json
pause

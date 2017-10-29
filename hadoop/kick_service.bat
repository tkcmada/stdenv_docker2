cd %~dp0
docker rm -f hadoop_service
docker run -it --privileged --name hadoop_service hadoop /sbin/init
pause

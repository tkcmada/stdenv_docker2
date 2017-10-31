cd %~dp0
docker rm -f hadoop_service
docker run -it --privileged --name hadoop_service -p 8080:8080 hadoop /sbin/init
pause

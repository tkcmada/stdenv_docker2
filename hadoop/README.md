How to run Hadoop example(word count)
-------------------------------------
1. kick_service.bat and keep it running
2. run_bash_on_service.bat
```
#check sshd works
$ ssh localhost
$ hadoop namenode -format
$ start-dfs.sh
#Are you sure you want to continue connecting (yes/no)? yes

$ jps
739 Jps
583 SecondaryNameNode
426 DataNode
303 NameNode

$ hadoop fs -ls /
$ hadoop fs -mkdir /input
$ echo "a b c a" > /root/test.txt
$ hadoop fs -put /root/test.txt /input/
$ hadop fs -ls -R /
drwxr-xr-x   - root supergroup          0 2017-10-29 08:11 /input
-rw-r--r--   1 root supergroup          8 2017-10-29 08:11 /input/test.txt
$ hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-2.8.2.jar wordcount /input /output
$ hadoop fs -ls -R /
drwxr-xr-x   - root supergroup          0 2017-10-29 08:11 /input
-rw-r--r--   1 root supergroup          8 2017-10-29 08:11 /input/test.txt
drwxr-xr-x   - root supergroup          0 2017-10-29 08:13 /output
-rw-r--r--   1 root supergroup          0 2017-10-29 08:13 /output/_SUCCESS
-rw-r--r--   1 root supergroup         12 2017-10-29 08:13 /output/part-r-00000
$ hadoop fs -cat /output/part-r-00000
```

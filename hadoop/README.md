How to run Hadoop example(word count)
-------------------------------------
1. kick_service.bat and keep it running
2. run_bash_on_service.bat
```
#check sshd works
$ ssh localhost
# exit new ssh session and come back to the original session
$ exit
$ hadoop namenode -format
$ start-dfs.sh
#type "yes" if the following question is asked.
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

How to run Hive example ?
-------------------------
```
$ hive --version

#下記のエラーが出るが無視する
which: no hbase in (/usr/apache-hive/bin:/usr/hadoop-2.8.2/bin:/usr/hadoop-2.8.2/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin)

#バージョンが出ればよい
Hive 2.1.1

#テストデータ作成
$ cd /root
$ vi orders.csv
ord1,10
ord2,20
ord3,30

#Hiveを起動
$ schematool -dbType derby -initSchema
#もし上記でエラーが出る場合は、mv metastore_db metastore_db.bak を実行してから、再実行。

$ vi orders
$ hive
# もしMetaException(message:Version information not found in metastore. )例外が発生したら、上記のschematoolの実行が必要。

hive> show databases;
OK
default

hive> create database testdb;
OK
hive> use testdb;
OK
hive> create table orders(order_id string, qty int) row format delimited fields terminated by ',';
OK
hive> desc orders;
OK
order_id                string
qty                     int
hive> load data local inpath "/root/orders.csv" into table orders;
Loading data to table default.orders
OK
hive> select * from orders;
OK
ord1    10
ord2    20
ord3    30
hive> select sum(qty) from orders;
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
Query ID = root_20171030001050_4c4ff18a-56ba-482b-ab08-7c42a83c23fd
Total jobs = 1
Launching Job 1 out of 1
Number of reduce tasks determined at compile time: 1
In order to change the average load for a reducer (in bytes):
  set hive.exec.reducers.bytes.per.reducer=<number>
In order to limit the maximum number of reducers:
  set hive.exec.reducers.max=<number>
In order to set a constant number of reducers:
  set mapreduce.job.reduces=<number>
Job running in-process (local Hadoop)
2017-10-30 00:10:52,806 Stage-1 map = 100%,  reduce = 100%
Ended Job = job_local527196085_0001
MapReduce Jobs Launched:
Stage-Stage-1:  HDFS Read: 96 HDFS Write: 48 SUCCESS
Total MapReduce CPU Time Spent: 0 msec
OK
60

hive> insert overwrite directory '/output/' select * from orders;
WARNING: Hive-on-MR is deprecated in Hive 2 and may not be available in the future versions. Consider using a different execution engine (i.e. spark, tez) or using Hive 1.X releases.
Query ID = root_20171030001152_d17bda6b-6c68-4571-bd40-3991b8261f47
Total jobs = 3
Launching Job 1 out of 3
Number of reduce tasks is set to 0 since there's no reduce operator
Job running in-process (local Hadoop)
2017-10-30 00:11:53,922 Stage-1 map = 0%,  reduce = 0%
2017-10-30 00:11:54,924 Stage-1 map = 100%,  reduce = 0%
Ended Job = job_local1417567900_0002
Stage-3 is selected by condition resolver.
Stage-2 is filtered out by condition resolver.
Stage-4 is filtered out by condition resolver.
Moving data to directory hdfs://localhost:9000/output/.hive-staging_hive_2017-10-30_00-11-52_379_4906385378579374696-1/-ext-10000
Moving data to directory /output
MapReduce Jobs Launched:
Stage-Stage-1:  HDFS Read: 72 HDFS Write: 48 SUCCESS
Total MapReduce CPU Time Spent: 0 msec
OK

hive> exit;

$ hadoop fs -ls /output
Found 1 items
-rwxr-xr-x   1 root supergroup         24 2017-10-30 00:11 /output/000000_0

$ hadoop fs -cat /output/000000_0
ord110
ord220
ord330
```

How to run Spark example ?
--------------------------

- count local file

```
$ cd /root
$ spark-shell

Spark context available as 'sc' (master = local[*], app id = local-1509323981901).
Spark session available as 'spark'.

scala> val f = sc.textFile("orders.csv")
f: org.apache.spark.rdd.RDD[String] = orders.csv MapPartitionsRDD[1] at textFile at <console>:24

scala> f.count()
res0: Long = 3
```

- count file on HDFS
```
$ hadoop fs -ls -R /
drwxr-xr-x   - root supergroup          0 2017-10-30 00:11 /output
-rwxr-xr-x   1 root supergroup         24 2017-10-30 00:11 /output/000000_0
drwxrwxr-x   - root supergroup          0 2017-10-30 00:03 /tmp
drwx-wx-wx   - root supergroup          0 2017-10-30 00:03 /tmp/hive
drwx------   - root supergroup          0 2017-10-30 00:12 /tmp/hive/root
drwxr-xr-x   - root supergroup          0 2017-10-29 23:59 /user
drwxr-xr-x   - root supergroup          0 2017-10-29 23:59 /user/hive
drwxrwxr-x   - root supergroup          0 2017-10-30 00:06 /user/hive/warehouse
drwxrwxr-x   - root supergroup          0 2017-10-30 00:10 /user/hive/warehouse/orders
-rwxrwxr-x   1 root supergroup         24 2017-10-30 00:10 /user/hive/warehouse/orders/orders.csv
drwxrwxr-x   - root supergroup          0 2017-10-30 00:05 /user/hive/warehouse/testdb.db

$ spark-shell

scala> val hf = sc.textFile("hdfs://127.0.0.1:9000/output/000000_0")
hf: org.apache.spark.rdd.RDD[String] = hdfs://127.0.0.1:9000/output/000000_0 MapPartitionsRDD[3] at textFile at <console>:24

scala> hf.count()
res1: Long = 3
```


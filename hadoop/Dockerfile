#ビルドファイルが固まるまではキャッシュを利かせるため新規項目は最後に追加すること
FROM stdenv_tools_java

#install for hadoop
RUN yum groupinstall -y \
    'Development tools' \
&&  yum clean all

#installing hadoop
RUN cd /usr \
 && wget http://ftp.jaist.ac.jp/pub/apache/hadoop/common/hadoop-2.8.2/hadoop-2.8.2.tar.gz \
 && tar xvzf hadoop*.tar.gz \
 && rm -f hadoop*.tar.gz \
 && echo "export HADOOP_HOME=/usr/hadoop-2.8.2" >> /root/.bashrc \
 && echo 'export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH' >> /root/.bashrc

COPY hadoop/etc/hadoop/ /usr/hadoop-2.8.2/etc/hadoop/

#allowing "ssh localhost"
RUN ssh-keygen -t rsa -q -P "" -f /root/.ssh/id_rsa
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN systemctl enable sshd.service

#installing hive
RUN cd /usr \
 && wget http://ftp.jaist.ac.jp/pub/apache/hive/stable-2/apache-hive-2.1.1-bin.tar.gz \
 && tar zxvf apache-hive*.tar.gz \
 && rm -f apache-hive*.tar.gz \
 && ln -s apache-hive-2.1.1-bin apache-hive \
 && echo "export HIVE_HOME=/usr/apache-hive" >> /root/.bashrc \
 && echo 'export PATH=$HIVE_HOME/bin:$PATH' >> /root/.bashrc

#installing scala
RUN cd /usr \
 && wget http://www.scala-lang.org/files/archive/scala-2.12.4.tgz \
 && tar zxvf scala*.tgz \
 && rm -f scala*.tgz \
 && ln -s scala-* scala \
 && echo "export SCALA_HOME=/usr/scala" >> /root/.bashrc \
 && echo 'export PATH=$SCALA_HOME/bin:$PATH' >> /root/.bashrc

#installing spark
RUN cd /usr \
 && wget http://ftp.jaist.ac.jp/pub/apache/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz \
 && tar zxvf spark*.tgz \
 && rm -f spark*.tgz \
 && ln -s spark* spark \
 && echo "export SPARK_HOME=/usr/spark" >> /root/.bashrc \
 && echo 'export PATH=$SPARK_HOME/bin:$PATH' >> /root/.bashrc

CMD ["bash"]


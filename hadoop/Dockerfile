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

EXPOSE 22
CMD ["bash"]


#ビルドファイルが固まるまではキャッシュを利かせるため新規項目は最後に追加すること
FROM stdenv_tools

#installing java
COPY tmp/jdk-8u152-linux-x64.rpm.* /tmp/
RUN cd /tmp \
 && cat jdk*.rpm.* > jdk.rpm-8u152-linux-x64.rpm \
 && yum localinstall -y *.rpm \
 && rm -f *.rpm \
 && echo "export JAVA_HOME=/usr/java/jdk1.8.0_152" >> /root/.bashrc

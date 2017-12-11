FROM centos:7

#disable SELINUX
RUN echo SELINUX=permissive > /etc/selinux/config
#RUN setenforce 0

#echo installing pip
#wget https://bootstrap.pypa.io/get-pip.py
#sudo python get-pip.py
#sudo pip install awscli

COPY kubernetes.repo    /etc/yum.repos.d/
COPY cloudera-cdh5.repo /etc/yum.repos.d/ 
COPY cloudera-kudu.repo /etc/yum.repos.d/
COPY cloudera-manager.repo /etc/yum.repos.d/
COPY nginx.repo            /etc/yum.repos.d/

RUN yum install -y createrepo epel-release yum-plugin-downloadonly yum-utils
RUN yum update -y openssl
RUN mkdir -p /opt/repo

RUN yum install --downloadonly --downloaddir=/opt/repo ansible
RUN rpm -ivh http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
RUN yum install --downloadonly --downloaddir=/opt/repo mysql-server mysql-community-server mysql

RUN yum install --downloadonly --downloaddir=/opt/repo oracle-j2sdk1.7 cloudera-manager-daemons cloudera-manager-server cloudera-manager-agent  cloudera-manager-server-db-2
RUN yum install --downloadonly --downloaddir=/opt/repo chrony
RUN yum install --downloadonly --downloaddir=/opt/repo gcc gcc-c++
RUN yum install --downloadonly --downloaddir=/opt/repo nodejs npm 
RUN yum install --downloadonly --downloaddir=/opt/repo nginx
RUN yum install --downloadonly --downloaddir=/opt/repo net-tools
RUN yum install --downloadonly --downloaddir=/opt/repo git
RUN yum install --downloadonly --downloaddir=/opt/repo squid
RUN yum install --downloadonly --downloaddir=/opt/repo docker
RUN yum install --downloadonly --downloaddir=/opt/repo kubelet kubeadm kubectl
RUN yum install --downloadonly --downloaddir=/opt/repo kubernetes-ansible
RUN yum install --downloadonly --downloaddir=/opt/repo zeromq
RUN yum install --downloadonly --downloaddir=/opt/repo bind-chroot bind-utils
RUN yum install --downloadonly --downloaddir=/opt/repo zabbix22
RUN yum install --downloadonly --downloaddir=/opt/repo yamllint
RUN yum install --downloadonly --downloaddir=/opt/repo sqlite
RUN yum install --downloadonly --downloaddir=/opt/repo R R-java R-java-devel
RUN yum install --downloadonly --downloaddir=/opt/repo rabbitmq-server rabbitmq-java-client
RUN yum install --downloadonly --downloaddir=/opt/repo rust
RUN yum install --downloadonly --downloaddir=/opt/repo nagios nagios-plugins-all
RUN yum install --downloadonly --downloaddir=/opt/repo nkf
RUN yum install --downloadonly --downloaddir=/opt/repo jq
RUN yum install --downloadonly --downloaddir=/opt/repo json_simple
RUN yum install --downloadonly --downloaddir=/opt/repo json-parser json-parser-devel
RUN yum install --downloadonly --downloaddir=/opt/repo httpd
RUN yum install --downloadonly --downloaddir=/opt/repo binutils
RUN yum install --downloadonly --downloaddir=/opt/repo hadoop-yarn-resourcemanager hadoop-hdfs-namenode hadoop-hdfs-secondarynamenode hadoop-yarn-nodemanager hadoop-hdfs-datanode hadoop-mapreduce hadoop-mapreduce-historyserver hadoop-yarn-proxyserver hadoop-client
RUN yum install --downloadonly --downloaddir=/opt/repo noip
RUN yum install --downloadonly --downloaddir=/opt/repo krb5-server krb5-workstation krb5-libs krb5-auth-dialog krb5-pkinit-openssl
RUN yum install --downloadonly --downloaddir=/opt/repo sssd sssd-tools sssd-client sssd-ldap openldap-clients oddjob oddjob-mkhomedir
RUN yum install --downloadonly --downloaddir=/opt/repo dnsmasq
RUN yum install --downloadonly --downloaddir=/opt/repo impala impala-server impala-state-store impala-catalog impala-shell
RUN yum install --downloadonly --downloaddir=/opt/repo kudu kudu-master kudu-tserver kudu-client0 kudu-client-devel
RUN yum install --downloadonly --downloaddir=/opt/repo postgresql postgresql-libs postgresql-server

RUN yum install --downloadonly --downloaddir=/opt/repo nfs-utils

#sh download_and_createrepo.sh cloudera-cdh5    /var/html/www/cdh5/redhat/7/x86_64/cdh/5
#sh download_and_createrepo.sh cloudera-manager /var/html/www/cm5/redhat/7/x86_64/cm/5.13.0
#sh download_and_createrepo.sh cloudera-kudu    /var/html/www/kudu/redhat/7/x86_64/kudu/5
     
EXPOSE 80

CMD ["python", "-m", "SimpleHTTPServer", "80"]


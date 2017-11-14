FROM cloudera/quickstart

#update cloudera manager
RUN yum clean all \
 && yum upgrade -y cloudera-manager-server cloudera-manager-daemons cloudera-manager-server-db-2 cloudera-manager-agent \
 && yum clean all

CMD ["/usr/bin/docker-quickstart"]

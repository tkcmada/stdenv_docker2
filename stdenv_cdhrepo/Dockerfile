FROM stdenv_tools

RUN yum install -y net-tools \
 && yum clean all

RUN mkdir -p cdh5/parcels/latest \
 && wget -P  cdh5/parcels/latest https://archive.cloudera.com/cdh5/parcels/latest/CDH-5.13.0-1.cdh5.13.0.p0.29-el7.parcel \
 && wget -P  cdh5/parcels/latest https://archive.cloudera.com/cdh5/parcels/latest/CDH-5.13.0-1.cdh5.13.0.p0.29-el7.parcel.sha1 \
 && wget -P  cdh5/parcels/latest https://archive.cloudera.com/cdh5/parcels/latest/manifest.json

#this is old 2014 you can skip
#RUN mkdir -p impala/parcels/latest \
# && wget -P  impala/parcels/latest https://archive.cloudera.com/impala/parcels/latest/IMPALA-2.1.0-1.impala2.0.0.p0.1995-el6.parcel \
# && wget -P  impala/parcels/latest https://archive.cloudera.com/impala/parcels/latest/manifest.json

RUN mkdir -p search/parcels/latest \
 && wget -P  search/parcels/latest https://archive.cloudera.com/search/parcels/latest/SOLR-1.3.0-1.cdh4.5.0.p0.9-el6.parcel \
 && wget -P  search/parcels/latest https://archive.cloudera.com/search/parcels/latest/SOLR-1.3.0-1.cdh4.5.0.p0.9-el6.parcel.sha1 \
 && wget -P  search/parcels/latest https://archive.cloudera.com/search/parcels/latest/manifest.json

RUN mkdir -p accumulo/parcels/1.4 \
 && wget -P  accumulo/parcels/1.4 https://archive.cloudera.com/accumulo/parcels/1.4/ACCUMULO-1.4.4-1.cdh4.5.0.p0.65-el6.parcel \
 && wget -P  accumulo/parcels/1.4 https://archive.cloudera.com/accumulo/parcels/1.4/ACCUMULO-1.4.4-1.cdh4.5.0.p0.65-el6.parcel.sha1 \
 && wget -P  accumulo/parcels/1.4 https://archive.cloudera.com/accumulo/parcels/1.4/manifest.json

RUN mkdir -p kafka/parcels/latest \
 && wget -P  kafka/parcels/latest https://archive.cloudera.com/kafka/parcels/latest/KAFKA-3.0.0-1.3.0.0.p0.40-el7.parcel \
 && wget -P  kafka/parcels/latest https://archive.cloudera.com/kafka/parcels/latest/KAFKA-3.0.0-1.3.0.0.p0.40-el7.parcel.sha1 \
 && wget -P  kafka/parcels/latest https://archive.cloudera.com/kafka/parcels/latest/manifest.json

RUN mkdir -p accumulo-c5/parcels/latest \
 && wget -P  accumulo-c5/parcels/latest https://archive.cloudera.com/accumulo-c5/parcels/latest/ACCUMULO-1.7.2-5.5.0.ACCUMULO5.5.0.p0.8-el7.parcel \
 && wget -P  accumulo-c5/parcels/latest https://archive.cloudera.com/accumulo-c5/parcels/latest/ACCUMULO-1.7.2-5.5.0.ACCUMULO5.5.0.p0.8-el7.parcel.sha1 \
 && wget -P  accumulo-c5/parcels/latest https://archive.cloudera.com/accumulo-c5/parcels/latest/manifest.json

COPY download_and_createrepo.sh /root/download_and_createrepo.sh
      
#      ,"echo downloading cloudera manager"
#      ,"sudo yum install --downloadonly --downloaddir=/opt/repo oracle-j2sdk1.7"
#      ,"sudo yum install --downloadonly --downloaddir=/opt/repo cloudera-manager-daemons cloudera-manager-server cloudera-manager-server-db-2 cloudera-manager-agent"

#downloading cloudera repo
RUN yum install -y createrepo \
 && yum clean all

COPY cloudera-cdh5.repo    /etc/yum.repos.d/
COPY cloudera-kudu.repo    /etc/yum.repos.d/
COPY cloudera-manager.repo /etc/yum.repos.d/

RUN sh /root/download_and_createrepo.sh cloudera-cdh5    cdh5/redhat/7/x86_64/cdh/5
RUN sh /root/download_and_createrepo.sh cloudera-manager cm5/redhat/7/x86_64/cm/5.13.0
RUN sh /root/download_and_createrepo.sh cloudera-kudu    kudu/redhat/7/x86_64/kudu/5

EXPOSE 80

CMD ["python", "-m", "SimpleHTTPServer", "80"]

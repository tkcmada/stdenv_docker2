FROM stdenv_tools

RUN yum install -y net-tools createrepo

#COPY download_and_createrepo.sh /root/download_and_createrepo.sh
      
#downloading cloudera repo
#COPY cloudera-cdh5.repo    /etc/yum.repos.d/
#COPY cloudera-kudu.repo    /etc/yum.repos.d/
#COPY cloudera-manager.repo /etc/yum.repos.d/

#RUN sh /root/download_and_createrepo.sh cloudera-cdh5    cdh5/redhat/7/x86_64/cdh/5
#RUN sh /root/download_and_createrepo.sh cloudera-manager cm5/redhat/7/x86_64/cm/5.13.0
#RUN sh /root/download_and_createrepo.sh cloudera-kudu    kudu/redhat/7/x86_64/kudu/5

RUN mkdir -p cdsw/1/parcels/latest 
RUN wget -P  cdsw/1/parcels/latest https://archive.cloudera.com/cdsw/1/parcels/latest/CDSW-1.2.1.p1.192306-el7.parcel.sha1
RUN wget -P  cdsw/1/parcels/latest https://archive.cloudera.com/cdsw/1/parcels/latest/manifest.json
RUN wget -P  cdsw/1/parcels/latest https://archive.cloudera.com/cdsw/1/parcels/latest/CDSW-1.2.1.p1.192306-el7.parcel

RUN mkdir -p cdh5/parcels/latest 
RUN wget -P  cdh5/parcels/latest https://archive.cloudera.com/cdh5/parcels/latest/CDH-5.13.0-1.cdh5.13.0.p0.29-el7.parcel.sha1 
RUN wget -P  cdh5/parcels/latest https://archive.cloudera.com/cdh5/parcels/latest/manifest.json
RUN wget -P  cdh5/parcels/latest https://archive.cloudera.com/cdh5/parcels/latest/CDH-5.13.0-1.cdh5.13.0.p0.29-el7.parcel 


RUN mkdir -p cdsw/1/csd
RUN wget -P  cdsw/1/csd https://archive.cloudera.com/cdsw/1/csd/CLOUDERA_DATA_SCIENCE_WORKBENCH-1.2.0.jar
RUN wget -P  cdsw/1/csd https://archive.cloudera.com/cdsw/1/csd/CLOUDERA_DATA_SCIENCE_WORKBENCH-1.2.1.jar
 

RUN mkdir -p spark2/parcels/latest
RUN wget -P  spark2/parcels/latest https://archive.cloudera.com/spark2/parcels/latest/SPARK2-2.2.0.cloudera1-1.cdh5.12.0.p0.142354-el7.parcel
RUN wget -P  spark2/parcels/latest https://archive.cloudera.com/spark2/parcels/latest/SPARK2-2.2.0.cloudera1-1.cdh5.12.0.p0.142354-el7.parcel.sha1
RUN wget -P  spark2/parcels/latest https://archive.cloudera.com/spark2/parcels/latest/manifest.json

RUN mkdir -p spark2/csd
RUN wget -P  spark2/csd https://archive.cloudera.com/spark2/csd/SPARK2_ON_YARN-2.0.0.cloudera1.jar
RUN wget -P  spark2/csd https://archive.cloudera.com/spark2/csd/SPARK2_ON_YARN-2.0.0.cloudera1.jar.sha1
RUN wget -P  spark2/csd https://archive.cloudera.com/spark2/csd/SPARK2_ON_YARN-2.0.0.cloudera2.jar
RUN wget -P  spark2/csd https://archive.cloudera.com/spark2/csd/SPARK2_ON_YARN-2.1.0.cloudera1.jar
RUN wget -P  spark2/csd https://archive.cloudera.com/spark2/csd/SPARK2_ON_YARN-2.1.0.cloudera2.jar
RUN wget -P  spark2/csd https://archive.cloudera.com/spark2/csd/SPARK2_ON_YARN-2.2.0.cloudera1.jar






EXPOSE 80

CMD ["python", "-m", "SimpleHTTPServer", "80"]

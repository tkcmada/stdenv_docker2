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


EXPOSE 80

CMD ["python", "-m", "SimpleHTTPServer", "80"]

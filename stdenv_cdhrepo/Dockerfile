FROM stdenv_tools

RUN mkdir -p cdh5/percels/5.13 \
 && wget -P  cdh5/percels/5.13 http://archive.cloudera.com/cdh5/parcels/5.13/CDH-5.13.0-1.cdh5.13.0.p0.29-el6.parcel \
 && wget -P  cdh5/percels/5.13 http://archive.cloudera.com/cdh5/parcels/5.13/CDH-5.13.0-1.cdh5.13.0.p0.29-el7.parcel \
 && wget -P  cdh5/percels/5.13 http://archive.cloudera.com/cdh5/parcels/5.13/manifest.json

RUN yum install -y net-tools \
 && yum clean all


EXPOSE 80

CMD ["python", "-m", "SimpleHTTPServer", "80"]

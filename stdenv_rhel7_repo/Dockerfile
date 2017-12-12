FROM rhel7.4

#this docker container should be built under RHEL subscription

RUN echo SELINUX=disabled > /etc/selinux/config

#enabling epel repo
RUN curl -o epel-release-7-11.noarch.rpm http://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
RUN yum localinstall -y epel-release-7-11.noarch.rpm

RUN yum install -y \
      wget \
      net-tools \
      bind-utils \
      createrepo \
      yum-utils \
      less \
 && yum clean all

RUN wget https://bootstrap.pypa.io/get-pip.py \
 && python get-pip.py \
 && pip install awscli

COPY download_and_createrepo.sh /root/
WORKDIR /opt/repo
RUN /root/download_and_createrepo.sh rhel-7-server-rpms
RUN /root/download_and_createrepo.sh rhel-7-server-extras-rpms

EXPOSE 80

WORKDIR /opt/repo
CMD ["python", "-m", "SimpleHTTPServer", "80"]

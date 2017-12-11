FROM rhel7.4

#以下の変数はdocker build --build-argで外部から渡すこと
ARG RHEL_USER=${RHEL_USER}
ARG RHEL_PASSWORD=${RHEL_PASSWORD}

RUN echo SELINUX=disabled > /etc/selinux/config

COPY subscription-find-pool.py /root/

RUN cd /root \
 && subscription-manager register --force --username=$RHEL_USER --password=$RHEL_PASSWORD \
 && subscription-manager list --available > subscription-available.txt \
 && python subscription-find-pool.py < subscription-available.txt > pool.txt \
 && cat pool.txt \
 && subscription-manager subscribe --pool=`cat pool.txt` \
 && subscription-manager repos --enable=rhel-7-server-extras-rpms \
 && subscription-manager repos --enable=rhel-7-server-optional-rpms

#サブスクリプションの適用されたoverlayレイヤーを有効にするために、これ以前にはDockerfileコマンド追加しないこと。

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
RUN sh /root/download_and_createrepo.sh rhel-7-server-rpms
RUN sh /root/download_and_createrepo.sh rhel-7-server-extras-rpms

EXPOSE 80

WORKDIR /opt/repo
CMD ["python", "-m", "SimpleHTTPServer", "80"]

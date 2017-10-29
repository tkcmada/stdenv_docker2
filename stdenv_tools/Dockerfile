#ビルドファイルが固まるまではキャッシュを利かせるため新規項目は最後に追加すること
FROM centos:7

RUN yum install -y \
    epel-release \
    ansible \
    groff \
    less \
    ntpdate \
    openssh-clients \
    openssh-server \
    jq \
    wget \
    which \
&&  yum clean all 

#install pip
RUN curl "https://bootstrap.pypa.io/get-pip.py" --insecure -o /tmp/get-pip.py && \
    python /tmp/get-pip.py
RUN pip install awscli boto
COPY bin/ /usr/bin/
RUN chmod +x /usr/bin/*.sh
COPY root/ /root
COPY etc/ /etc

#disable SELINUX
RUN echo SELINUX=permissive > /etc/selinux/config

CMD ["bash"]

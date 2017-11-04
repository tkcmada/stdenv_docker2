#ビルドファイルが固まるまではキャッシュを利かせるため新規項目は最後に追加すること
FROM rhel7.4

#以下の変数はdocker build --build-argで外部から渡すこと
ARG RHEL_USER=${RHEL_USER}
ARG RHEL_PASSWORD=${RHEL_PASSWORD}

COPY subscription-enable-repo.sh /root/
COPY subscription-find-pool.py /root/

RUN cd /root && sh subscription-enable-repo.sh rhel-7-server-extras-rpms rhel-7-server-optional-rpms
 
RUN yum install -y \
     git \
     ansible \
 && yum clean all 

CMD ["bash"]

#ビルドファイルが固まるまではキャッシュを利かせるため新規項目は最後に追加すること
FROM rhel7.4

ARG RHEL_USER=${RHEL_USER}
ARG RHEL_PASSWORD=${RHEL_PASSWORD}

COPY subscription-find-pool.py /root/
RUN cd /root \
 && echo "RHEL_USER:$RHEL_USER" \
 && echo "RHEL_PASSWORD:$RHEL_PASSWORD" \
 && subscription-manager register --username=$RHEL_USER --password=$RHEL_PASSWORD
RUN cd /root && subscription-manager list --available > subscription-available.txt
RUN cd /root && python subscription-find-pool.py < subscription-available.txt > pool.txt
RUN subscription-manager subscribe --pool=`cat /root/pool.txt`
RUN subscription-manager repos --enable=rhel-7-server-extras-rpms
RUN subscription-manager repos --enable=rhel-7-server-optional-rpms

RUN yum install -y git && yum clean all 

CMD ["bash"]

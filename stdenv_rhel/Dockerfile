#ビルドファイルが固まるまではキャッシュを利かせるため新規項目は最後に追加すること
FROM rhel7.4

#以下の変数はdocker build --build-argで外部から渡すこと
ARG RHEL_USER=${RHEL_USER}
ARG RHEL_PASSWORD=${RHEL_PASSWORD}

COPY subscription-enable-repo.sh /root/
COPY subscription-find-pool.py /root/
COPY subscription-unregist.sh /root/

RUN echo "Please note that --no-cache option is required to let subscription-manager subscribes new subscription every build."
RUN cd /root && sh subscription-enable-repo.sh rhel-7-server-extras-rpms rhel-7-server-optional-rpms
#subscriptionのキャッシュを有効にするためにこれ以前に追加しないこと

#epelを使用する
RUN rpm -ivh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm

#必要なrpmをインストール(or downloadonly)する
RUN yum install -y \
     git \
#     ansible \
 && yum clean all 



#[cleanup phase]
#最後にregisterしたsubscriptionを解除する。
#さもないとsubscriptionの上限に達してしまう。
#よって下記の行は常に最後に実行すること。
#また、Dockerfile途中で処理に失敗し、下記の処理が実行されなかったときは、
#run_bash.shでコンテナに入ってもhostnameが変わってしまうため手動でsubscriptionを解除できない。
#よってRedHat Customer Portalにログインし、手動でsubscriptionに紐づくシステムを削除すること。
RUN sh /root/subscription-unregist.sh

CMD ["bash"]

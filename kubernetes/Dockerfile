#ビルドファイルが固まるまではキャッシュを利かせるため新規項目は最後に追加すること
FROM stdenv_tools

#docker and kubernetes modules should create another layer so run yum install separetely
RUN yum --enablerepo=kubernetes install -y \
    docker \
    docker-registry \
    etcd \
    kubeadm \
&&  yum clean all
RUN for s in docker docker-registry etcd kubelet.service; do systemctl enable $s; done

CMD ["bash"]

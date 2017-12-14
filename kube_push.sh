#!/bin/sh

function p2()
{
  name=$1
  pullname=$name
  pushname=localhost:8000/$name
  sudo docker pull $pullname || exit 1
  sudo docker tag $pullname $pushname || exit 1
  sudo docker push $pushname || exit 1
}

p2 gcr.io/google_containers/k8s-dns-kube-dns-amd64:1.14.1
p2 gcr.io/google_containers/k8s-dns-dnsmasq-nanny-amd64:1.14.1
p2 gcr.io/google_containers/k8s-dns-sidecar-amd64:1.14.1
p2 quay.io/coreos/flannel:v0.7.1-amd64
p2 gcr.io/kubernetes-helm/tiller:v2.3.0
p2 gcr.io/google-containers/kube-addon-manager:v6.1
p2 gcr.io/google_containers/exechealthz-amd64:1.2
p2 gcr.io/google_containers/kube-discovery-amd64:1.0
p2 gcr.io/google_containers/kubernetes-dashboard-amd64:v1.7.1

function push() {
  name=$1
  echo processing...$name
  sudo docker tag  $name localhost:8000/$name
  sudo docker push       localhost:8000/$name
}

push gcr.io/google_containers/kube-apiserver-amd64:v1.8.5
push gcr.io/google_containers/kube-controller-manager-amd64:v1.8.5
push gcr.io/google_containers/kube-scheduler-amd64:v1.8.5
push gcr.io/google_containers/kube-proxy-amd64:v1.8.5
push gcr.io/google_containers/etcd-amd64:3.0.17
push gcr.io/google_containers/pause-amd64:3.0


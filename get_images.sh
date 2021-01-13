#! /bin/bash

version=v1.20.0

images=(
    kube-apiserver:${version}
    kube-controller-manager:${version}
    kube-scheduler:${version}
    kube-proxy:${version}
    etcd:3.4.13-0
    pause:3.2
    coredns:1.7.0
)

mirror=bubblegreen
google_repo=k8s.gcr.io

for image in ${images[@]};
do
    docker pull ${mirror}/${image}
    docker tag ${mirror}/${image} ${google_repo}/${image}
done


for image in ${images[@]};
do
    docker rmi ${mirror}/${image}
done

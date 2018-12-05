#! /bin/bash

version=v1.13.0

images=(
    kube-apiserver:${version}
    kube-controller-manager:${version}
    kube-scheduler:${version}
    kube-proxy:${version}
    etcd:3.2.24
    pause:3.1
    coredns:1.2.6
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

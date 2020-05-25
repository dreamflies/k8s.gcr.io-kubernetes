#!/bin/bash
images=( \ 
    kube-proxy:v1.18.3 \
    kube-scheduler:v1.18.3 \
    kube-controller-manager:v1.18.3 \
    kube-apiserver:v1.18.3 \
    etcd:3.4.3-0 \
    pause:3.2 \
    coredns:1.6.7 )
namespace=networkfox
for image in ${images[@]} ; do
    image_name_tag=(${image//:/ })
    echo "==> docker pull $namespace/${image_name_tag[0]}"
    docker pull $namespace/${image_name_tag[0]}
    echo "==> docker tag $namespace/${image_name_tag[0]} k8s.gcr.io/$image"
    docker tag  $namespace/${image_name_tag[0]} k8s.gcr.io/$image
    echo "==> docker rmi $namespace/${image_name_tag[0]}"
    docker rmi  $namespace/${image_name_tag[0]}
done
docker images

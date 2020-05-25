#!/bin/bash
#要下载的images镜像
images=( \ 
    kube-proxy:v1.15.2 \
    kube-scheduler:v1.15.2 \
    kube-controller-manager:v1.15.2 \
    kube-apiserver:v1.15.2 \
    etcd:3.3.10 \
    pause:3.1 \
    coredns:1.3.1 )
#统一的命名空间
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

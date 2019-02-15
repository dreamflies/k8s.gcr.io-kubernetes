#!/bin/bash
#要下载的images镜像
images=( \ 
	kube-proxy \
	kube-scheduler \
	kube-controller-manager \
	kube-apiserver \
    etcd \
    pause \
    coredns )
#统一的命名空间
namespace=networkfox
for image in ${images[@]} ; do
  docker $namespace /$image
  docker tag $namespace/$image gcr.io/$image
  docker rmi $namespace/$image
done
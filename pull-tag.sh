#!/bin/bash
images=(kube-proxy-amd64:v1.9.0 kube-scheduler-amd64:v1.9.0 kube-controller-manager-amd64:v1.9.0 kube-apiserver-amd64:v1.9.0
etcd-amd64:3.1.10 pause-amd64:3.0 kubernetes-dashboard-amd64:v1.8.3 k8s-dns-sidecar-amd64:1.14.7 k8s-dns-kube-dns-amd64:1.14.7
k8s-dns-dnsmasq-nanny-amd64:1.14.7)
namespace=networkfox
for image in ${images[@]} ; do
  docker $namespace /$image
  docker tag $namespace/$image gcr.io/$image
  docker rmi $namespace/$image
done
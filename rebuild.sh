#!/bin/bash
oc delete all --all -n $(oc project -q)
cd /home/mike/git/intra-pod-startup-sync/nginx-from-git
docker build . -t nginx-from-git --no-cache
docker tag nginx-from-git docker.io/eformat/nginx-from-git
docker push docker.io/eformat/nginx-from-git
cd /home/mike/git/intra-pod-startup-sync/
oc create -f pod.yaml
oc expose po/intra-pod-startup --port=8080 --generator=service/v1
oc expose svc intra-pod-startup


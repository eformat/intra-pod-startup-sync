# intra-pod-startup-sync

OpenShift example using a sidecar container for git syncing a repo - https://github.com/kubernetes/git-sync

creates an nginx container with content from GIT_SYNC_REPO

an alternate approach is to mount a github repo to a volume (no sync, credentials harder)

```
oc volume rc --all --add --name=v1 \
  --source='{"gitRepo": {
                "repository": "https://github.com/namespace1/project1",
                "revision": "5125c45f9f563"
            }}'
```

git-sync support credentials and incremental sync based on delay GIT_SYNC_WAIT

## build nginx docker image

```
cd nginx-from-git
docker build . -t nginx-from-git --no-cache
docker tag nginx-from-git docker.io/eformat/nginx-from-git
docker push docker.io/eformat/nginx-from-git
```

## run pod

```
oc create -f pod.yaml
oc expose po/intra-pod-startup --port=8080 --generator=service/v1
oc expose svc intra-pod-startup
```

## template

```
oc process -f template.yaml | oc create -f -
```

## todo
add health checks
shared pv ? how does sync work. perhaps not.
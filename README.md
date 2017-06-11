# intra-pod-startup-sync

uses sidecar container for git sync - https://github.com/kubernetes/git-sync

creates an nginx container with content from GIT_SYNC_REPO

better approach than mounting a github repo to a volume

```
oc volume rc --all --add --name=v1 \
  --source='{"gitRepo": {
                "repository": "https://github.com/namespace1/project1",
                "revision": "5125c45f9f563"
            }}'
```

git-sync support credentials and incremental sync based on delay GIT_SYNC_WAIT

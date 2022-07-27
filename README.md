# s3-mounter

Mount s3 buckets into pods in k8s.

[Here](https://blog.meain.io/2020/mounting-s3-bucket-kube/) is a blog post which explains it in detail.

# Upload to ghcr

```sh
export CR_PAT=
export GITHUB_USER=
export IMAGE_NAME=s3-mounter

echo $CR_PAT | docker login ghcr.io -u $GITHUB_USER --password-stdin

docker push ghcr.io/$GITHUB_USER/$IMAGE_NAME:0.1.0
```

# References

https://kubernetes.io/docs/concepts/storage/volumes/#mount-propagation
https://github.com/freegroup/kube-s3
https://blog.meain.io/2020/mounting-s3-bucket-kube/
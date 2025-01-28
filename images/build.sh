docker build \
--no-cache \
--build-arg ETCD_VERSION=v3.5.18 \
-t prgs/etcd:3.5.18 \
-f Dockerfile .

#!/usr/bin/env bash

cat > /root/etcdctl.env <<EOF
export ETCDCTL_API=3
export ETCDCTL_ENDPOINTS=https://etcd1:2379,https://etcd2:2379,https://etcd3:2379
export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/etcd.crt
export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/etcd.key
EOF

source /root/etcdctl.env

etcdctl member add etcd4 --peer-urls=https://etcd4:2380 

#!/usr/bin/env bash

cat > /root/etcdctl.env <<EOF
export ETCDCTL_API=3
export ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt
export ETCDCTL_CERT=/etc/kubernetes/pki/etcd/etcd.crt
export ETCDCTL_KEY=/etc/kubernetes/pki/etcd/etcd.key
EOF

source /root/etcdctl.env

etcdctl --endpoints=https://localhost:2379 put "chave1" "value1"
etcdctl --endpoints=https://localhost:2379 put "chave2" "value2"
etcdctl --endpoints=https://localhost:2379 put "chave3" "value3"

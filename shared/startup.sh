#!/usr/bin/env bash

cd $(dirname $0)

NAME=$(hostname -s)
NODE=$(hostname -i)

mkdir -p /etc/kubernetes/pki/etcd
mkdir -p /var/lib/etcd
chmod 700 /var/lib/etcd

cp certificates/certs/ca.pem /etc/kubernetes/pki/etcd/ca.crt
cp certificates/certs/etcd.pem /etc/kubernetes/pki/etcd/etcd.crt
cp certificates/certs/etcd-key.pem /etc/kubernetes/pki/etcd/etcd.key

/usr/local/bin/etcd \
  --name ${NAME} \
  --client-cert-auth \
  --peer-client-cert-auth \
  --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt \
  --cert-file=/etc/kubernetes/pki/etcd/etcd.crt \
  --key-file=/etc/kubernetes/pki/etcd/etcd.key \
  --peer-cert-file=/etc/kubernetes/pki/etcd/etcd.crt \
  --peer-key-file=/etc/kubernetes/pki/etcd/etcd.key \
  --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt \
  --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt \
  --data-dir=/var/lib/etcd \
  --initial-advertise-peer-urls https://${NODE}:2380 \
  --listen-peer-urls https://${NODE}:2380 \
  --advertise-client-urls https://${NODE}:2379 \
  --listen-client-urls https://${NODE}:2379,https://127.0.0.1:2379 \
  --initial-cluster-token estudos-etcd \
  --initial-cluster etcd1=https://etcd1:2380,etcd2=https://etcd2:2380,etcd3=https://etcd3:2380 \
  --initial-cluster-state new

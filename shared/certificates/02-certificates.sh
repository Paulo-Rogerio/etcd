#!/usr/bin/env bash

cd $(dirname $0)

cat > certs/etcd-csr.json <<EOF
{
  "CN": "etcd",
  "hosts": [
    "localhost",
    "127.0.0.1",
    "etcd1",
    "etcd2",
    "etcd3",
    "etcd4"
  ],
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "BR",
      "L": "Brasil",
      "O": "Kubernetes",
      "OU": "Etcd",
      "ST": "Goiania"
    }
  ]
}
EOF

cd certs
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=ca-config.json -profile=etcd etcd-csr.json | cfssljson -bare etcd
cd -
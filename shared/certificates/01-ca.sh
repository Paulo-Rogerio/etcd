#!/usr/bin/env bash

cd $(dirname $0)

mkdir certs
rm -f certs/*

cat > certs/ca-config.json <<EOF
{
    "signing": {
        "default": {
            "expiry": "8760h"
        },
        "profiles": {
            "etcd": {
                "expiry": "8760h",
                "usages": ["signing","key encipherment","server auth","client auth"]
            }
        }
    }
}
EOF

cat > certs/ca-csr.json <<EOF
{
  "CN": "etcd",
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
cfssl gencert -initca ca-csr.json | cfssljson -bare ca
cd -
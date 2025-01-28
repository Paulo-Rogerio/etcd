FROM alpine

MAINTAINER psilva.gomes.rogerio@gmail.com

ARG ETCD_VERSION
ENV TZ=America/Sao_Paulo

RUN apk update && apk add --no-cache tzdata curl bash openssl jq

RUN ln -svf /bin/bash /bin/sh

RUN rm -f /tmp/etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
    && rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test

RUN GITHUB_URL=https://github.com/etcd-io/etcd/releases/download \
    && DOWNLOAD_URL=${GITHUB_URL} \
    && curl -sSL ${DOWNLOAD_URL}/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
    && tar xzvf /tmp/etcd-${ETCD_VERSION}-linux-amd64.tar.gz -C /tmp/etcd-download-test --strip-components=1 \
    && rm -f /tmp/etcd-${ETCD_VERSION}-linux-amd64.tar.gz

RUN mv /tmp/etcd-download-test/etcd* /usr/local/bin

RUN curl -sSL -o /usr/local/bin/cfssl https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 \
    && curl -sSL -o /usr/local/bin/cfssljson https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64 \
    && chmod +x /usr/local/bin/cfssl \
    && chmod +x /usr/local/bin/cfssljson

RUN echo "alias rm='rm -i'" > /root/.bashrc \
    && echo "alias cp='cp -i'" >> /root/.bashrc \
    && echo "alias mv='mv -i'" >> /root/.bashrc \
    && echo "alias ll='ls -la --color'" >> /root/.bashrc \
    && echo "alias l='ls -la --color'" >> /root/.bashrc \
    && echo "alias ls='ls --color '" >> /root/.bashrc 


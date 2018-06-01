FROM clux/muslrust:stable as builder

ENV MYSQL_VER=6.1.11

RUN set -eux \
    && apt-get install cmake \
    && curl -SsL "https://cdn.mysql.com//Downloads/Connector-C/mysql-connector-c-${MYSQL_VER}-src.tar.gz" | tar xz \
    && cd "mysql-connector-c-${MYSQL_VER}-src/"


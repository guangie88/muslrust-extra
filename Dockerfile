FROM alpine:3.7 as provider

# add in the missing symbols, which is super hackish and less flexible
# but more convenient for linking
RUN apk add --no-cache binutils mariadb-dev \
    && ar -rc /root/libmysqlclient.a /usr/lib/libssl.a /usr/lib/libcrypto.a /lib/libz.a /usr/lib/libmysqlclient.a

FROM clux/muslrust:stable as builder
COPY --from=provider /root/libmysqlclient.a /musl/lib/

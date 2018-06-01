FROM alpine:3.7 as provider

# add in the missing symbols, which is super hackish and less flexible
# but more convenient for linking
RUN apk add --no-cache binutils mariadb-dev \
    && ar x /usr/lib/libmysqlclient.a \
    && ar x /usr/lib/libssl.a \
    && ar x /usr/lib/libcrypto.a \
    && ar x /lib/libz.a \
    && ar rcs /root/libmysqlclient.a *.o \
    && rm -rf *.o

FROM clux/muslrust:stable as builder
COPY --from=provider /root/libmysqlclient.a /musl/lib/

ARG TOOLCHAIN=stable

FROM alpine:3.7 as provider

# The original libmysqlclient.a has a lot of missing symbols
# This is to make a super fat libmysqlclient.a for mysql linking later
RUN apk add --no-cache binutils libbsd-dev mariadb-dev musl-dev && \
    ar x /usr/lib/libmysqlclient.a && \
    ar x /usr/lib/libssl.a && \
    ar x /usr/lib/libcrypto.a && \
    ar x /lib/libz.a && \
    ar x /usr/lib/libc.a && \
    ar rcs /root/libmysqlclient.a *.o *.lo && \
    rm -rf *.o *.lo && \
    :

FROM clux/muslrust:${TOOLCHAIN} as builder
COPY --from=provider /root/libmysqlclient.a /musl/lib/

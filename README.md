# `muslrust-extra`

[![Build Status](https://travis-ci.org/guangie88/muslrust-extra.svg?branch=master)](https://travis-ci.org/guangie88/muslrust-extra)

[`clux/muslrust`](https://hub.docker.com/r/clux/muslrust/) with extra libraries
installed. All the libraries included are statically linked.

Docker Hub link: <https://hub.docker.com/r/guangie88/muslrust-extra/>

## Extra libraries

* `libmysqlclient.a`

  Specially `ar`-reassembled to include missing symbols from:

  * `libssl.a`
  * `libcrypto.a`
  * `libz.a`

  This is particularly useful when compiling [`diesel`](http://diesel.rs/)
  related libraries.

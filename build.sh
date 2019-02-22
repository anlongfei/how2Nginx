#!/bin/bash
# ====================================================
#   Copyright (C)2019 All rights reserved.
#
#   Author        : anlongfei
#   Email         : anlongfei@meituan.com
#   File Name     : build.sh
#   Last Modified : 2019-02-22 16:02
#   Describe      :
#
# ====================================================

CUR_DIR=`pwd`
SRC=${CUR_DIR}/nginx-1.15.8

cd ${SRC}
${CUR_DIR}/nginx-1.15.8/configure \
    --prefix=${CUR_DIR}/output \
    --without-http_rewrite_module \
    --without-http_gzip_module \
    --add-module=${SRC}/src/hello_module \
    && make -j4 \
    && make install

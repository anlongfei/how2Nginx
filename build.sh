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

cur_dir=`pwd`

${cur_dir}/nginx-1.15.8/configure --prefix=${cur_dir}/output
    && make -j4
    && make install

#!/usr/bin/scl enable llvm-toolset-7.0 -- scl enable devtoolset-10 -- bash

mkdir ./summatra_like/build && cd /usr/src/summatra_like/build
qmake ../summatra.pro
make 
make clean 

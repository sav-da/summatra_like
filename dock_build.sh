#!/bin/bash

mkdir ./summatra_like/build && cd /usr/src/summatra_like/build
qmake ../summatra.pro
make 
make clean 

#!/bin/bash

mkdir build && cd build
qmake ../summatra.pro
make 
make clean 
cp * /mnt/dir

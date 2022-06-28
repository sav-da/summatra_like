#!/bin/bash

docker build -t summatra .
mkdir build
cd build
docker run --name sum \
		 --rm -it \
		 -v $PWD:/usr/src/summatra_like/build summatra:latest

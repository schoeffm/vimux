#!/bin/bash

docker build -t schoeffm/vimux .
docker build -t schoeffm/vimux:powerline -f Dockerfile.powerline .
docker build -t schoeffm/vimux:docker -f Dockerfile.withDocker .

echo "Done building new docker images for vimux"

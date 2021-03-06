#!/bin/bash

set +x

function stopExisting() {
    ID=$(docker ps -a | awk '/vimux/ {print $1}')
    if [ -n "$ID" ];then
        docker rm "$ID"
    fi
}

function vimux() {
    docker run --name vimux -ti -v $HOME:/data schoeffm/vimux
}

function powerline() {
    docker run --name vimux -ti -v $HOME:/data schoeffm/vimux:powerline
}

function withDocker() {
    docker run --name vimux -ti -v $HOME:/data -v /var/run/docker.sock:/var/run/docker.sock schoeffm/vimux:docker
}

echo "Select one of the follin' versions: "
select cmd in vimux powerline withDocker
do
    if [ -n "$cmd" ]
    then
        stopExisting
        eval $cmd 
        break
    else
        echo "Invalid choice"
    fi
done


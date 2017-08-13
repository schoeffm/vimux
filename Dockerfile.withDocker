FROM schoeffm/vimux:powerline
MAINTAINER Stefan Schoeffmann, <stefan.schoeffmann@posteo.de>

ENV DOCKER_COMPOSE_VERSION 1.14.0

USER root

RUN apt-get update && \
    apt-get install -y docker.io && \
    gpasswd -a vimux docker && \
    curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    echo "alias d='sudo docker'" >> /home/vimux/.zsh/aliases.zsh && \
    echo "alias dc='sudo docker-compose'" >> /home/vimux/.zsh/aliases.zsh

USER vimux

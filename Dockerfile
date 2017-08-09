FROM ubuntu
MAINTAINER Stefan Schoeffmann, <stefan.schoeffmann@posteo.de>

ARG PASSWORD=vimux

ENV LANG=C.UTF-8

# install a bunch of tools (especially vim && tmux)
RUN apt-get update && \
    apt-get install -y sudo git zsh tmux vim tree curl && \
    useradd -u 1000 -r -U -m -s /bin/zsh vimux && \
    mkdir /home/vimux/.zsh && \
    echo vimux:${PASSWORD} | chpasswd && \
    adduser vimux sudo

# change to a non-privileged user
USER vimux

# add a bunch of settings so all tools work as expected
COPY ./assets/vimrc /home/vimux/.vimrc
COPY ./assets/tmux.conf /home/vimux/.tmux.conf
COPY ./assets/zshrc /home/vimux/.zshrc
COPY ./assets/zsh /home/vimux/.zsh

# define a workspace directory (convention demands 'data')
VOLUME /data
WORKDIR /data

ENTRYPOINT /bin/zsh

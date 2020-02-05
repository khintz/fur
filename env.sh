#!/bin/bash
export FURHOME=$PWD
export SOURCE_DIR=$FURHOME/src
export PID=$(id -u $USER)
export GID=$(id -g $USER)

alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias brute_force_clean='docker rmi $(docker images -a)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

#!/bin/bash

xhost +local:docker > /dev/null
sudo systemctl start docker

build() {
    sudo docker build -t cyberpunk:latest .
}

run() {
    sudo docker run -it --rm --name cyberpunk -e DISPLAY=$DISPLAY --net=host cyberpunk:latest
}

delete() {
    sudo docker rm -f cyberpunk 2>/dev/null
    sudo docker rmi cyberpunk:latest 2>/dev/null
}

help() {
    echo "Commands:"
    echo "'--build' -> build the Docker image"
    echo "'--run' -> run the game"
    echo "'--delete' -> delete container and image"
    echo "'--help' -> display this menu"
}

case "$1" in
    --build) build ;;
    --run) run ;;
    --delete) delete ;;
    --help) help ;;
    *) echo "Invalid command!"; help ;;
esac

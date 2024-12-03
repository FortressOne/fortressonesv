#!/bin/bash

IMAGE="fortressonesv:latest"
PORT="27500"
IP="localhost"
HOSTNAME="Local FortressOne Server"
RCON_PASSWORD="rc0n"
ADMIN_PASSWORD="4dm1n"
CONFIG_MODE="fo_pubmode.cfg"
MAP="2fort5r.bsp"
SV_PUBLIC=1

build() {
  docker build . -t $IMAGE
}

run_local() {
	SV_PUBLIC=0

  docker run --interactive --tty --init --rm \
    --publish $PORT:$PORT/udp \
    --mount type=bind,source="$(pwd)/fortress/",target=/fortressonesv/fortress/assets/ \
    --mount type=bind,source="$(pwd)",target=/fortressonesv/fortress/demos/ \
    $IMAGE \
    -ip $IP \
    +set hostname "$HOSTNAME" \
    +set rcon_password $RCON_PASSWORD \
    +localinfo adminpwd $ADMIN_PASSWORD \
    +exec $CONFIG_MODE \
    +map $MAP \
    +set sv_public $SV_PUBLIC
}

run_public() {
  docker run --interactive --tty --init --rm \
    --publish $PORT:$PORT/udp \
    --mount type=bind,source="$(pwd)/fortress/",target=/fortressonesv/fortress/assets/ \
    --mount type=bind,source="$(pwd)",target=/fortressonesv/fortress/demos/ \
    $IMAGE \
    -ip $IP \
    +set hostname "$HOSTNAME" \
    +set rcon_password $RCON_PASSWORD \
    +localinfo adminpwd $ADMIN_PASSWORD \
    +exec $CONFIG_MODE \
    +map $MAP \
    +set sv_public $SV_PUBLIC
}

"$@"

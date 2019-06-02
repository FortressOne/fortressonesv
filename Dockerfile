FROM ubuntu:18.04
WORKDIR /fortressonesv
COPY . /fortressonesv
EXPOSE 27500/udp
CMD ./fteqw-sv64 +set rcon_password ${FO_RCON_PASSWORD}

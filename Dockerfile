FROM ubuntu:18.04
WORKDIR /fortressonesv
COPY . /fortressonesv
EXPOSE 27500/udp
CMD ./fteqw-sv64 \
  +set hostname ${FO_HOSTNAME} \
  +set rcon_password ${FO_RCON_PASSWORD} \
  +localinfo adminpwd ${FO_ADMINPWD} \
  +exec fo_${FO_MODE}.cfg \
  +map 2fort5r

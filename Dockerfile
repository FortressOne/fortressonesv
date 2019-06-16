FROM ubuntu:18.04
WORKDIR /fortressonesv
COPY . /fortressonesv
EXPOSE 27500/udp
RUN apt-get update && apt-get install -y \
    curl \
    unzip
RUN curl -L \
    -o fortress/qwprogs.dat \
    https://github.com/FortressOne/server-qwprogs/releases/latest/download/qwprogs.dat \
  && curl -L \
    -o map-repo.zip \
    https://github.com/FortressOne/map-repo/releases/latest/download/map-repo.zip \
  && unzip map-repo.zip \
  && rm map-repo.zip
CMD ./fteqw-sv64 \
  -ip ${FO_IP} \
  -port ${FO_PORT} \
  +set hostname ${FO_HOSTNAME} \
  +set rcon_password ${FO_RCON_PASSWORD} \
  +localinfo adminpwd ${FO_ADMINPWD} \
  +exec fo_${FO_MODE}mode.cfg \
  +map 2fort5r

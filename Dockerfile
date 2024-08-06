FROM ubuntu:22.04
WORKDIR /fortressonesv
EXPOSE 27500/udp
ARG FTE_CONFIG=fortressone
RUN apt-get update \
 && apt-get install -y \
    curl \
    gcc \
    libgnutls28-dev \
    libpng-dev \
    make \
    mesa-common-dev \
    subversion \
    zip \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*
COPY base/ .
COPY fo_skins/ /tmp/fo_skins/
RUN cd /tmp/fo_skins/ \
 && zip -r /fortressonesv/fortress/fo_skins.pk3 . \
  && rm -rf /tmp/fo_skins/
RUN cd /fortressonesv/fortress/dats/ \
 && curl \
    --location \
    --remote-name-all \
    http://github.com/FortressOne/server-qwprogs/releases/latest/download/{qwprogs,csprogs,menu}.dat \
 && cd /fortressonesv/
ENTRYPOINT ["/fortressonesv/fortressone-sv"]
CMD ["-ip", "localhost", \
     "+set", "hostname", "FortressOne", \
     "+exec", "fo_pubmode.cfg", \
     "+map", "2fort5r"]

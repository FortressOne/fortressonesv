FROM ubuntu:22.04
WORKDIR /fortressonesv
EXPOSE 27500/udp
#ARG FTE_CONFIG=fortressone
RUN apt-get update \
 && apt-get install -y \
    curl \
    gcc \
    git \
    libgnutls28-dev \
    libpng-dev \
    make \
    mesa-common-dev \
    subversion \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*
COPY . /fortressonesv/
RUN cd /fortressonesv/fortress/dats/ \
 && curl \
    --location \
    --remote-name-all \
    http://github.com/FortressOne/server-qwprogs/releases/latest/download/{qwprogs,csprogs,menu}.dat \
 && cd /fortressonesv/
RUN git clone https://github.com/fte-team/fteqw.git
WORKDIR fteqw/engine
RUN make sv-rel -j$(nproc)
RUN mv release/fteqw-sv /fortressonesv/fortressone-sv
WORKDIR /fortressonesv
ENTRYPOINT ["/fortressonesv/fortressone-sv"]
CMD ["-ip", "localhost", \
     "+set", "hostname", "FortressOne", \
     "+exec", "fo_pubmode.cfg", \
     "+map", "2fort5r"]

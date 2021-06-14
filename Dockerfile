FROM ubuntu:18.04
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
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*
COPY . /fortressonesv/
RUN cd /tmp/ \
 && curl -L https://api.github.com/repos/FortressOne/fteqw-code/tarball > fteqw-code.tar.gz \
 && tar -xvf ./fteqw-code.tar.gz \
 && cd /tmp/FortressOne-fteqw-code-4974cf2/engine/ \
 && make sv-rel -j`nproc` \
 && cd /fortressonesv/ \
 && mv /tmp/FortressOne-fteqw-code-4974cf2/engine/release/fortressone-sv /fortressonesv/ \
 && rm -rf /tmp/FortressOne-fteqw-code-4974cf2/
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

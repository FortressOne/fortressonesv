FROM ubuntu:18.04
WORKDIR /fortressonesv
EXPOSE 27500/udp
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
 && mkdir -p fteqw-code \
 && cd /tmp/fteqw-code \
 && curl --location --remote-name-all http://github.com/FortressOne/fteqw/releases/latest/download/source.tar.gz \
 && tar -xvf ./source.tar.gz \
 && cd /tmp/fteqw-code/trunk/engine/ \
 && make sv-rel -j`nproc` \
 && cd /fortressonesv/ \
 && mv /tmp/fteqw-code/engine/release/fteqw-sv /fortressonesv/ \
 && rm -rf /tmp/fteqw-code/
RUN cd /fortressonesv/fortress/dats/ \
 && curl \
    --location \
    --remote-name-all \
    http://github.com/FortressOne/server-qwprogs/releases/latest/download/{qwprogs,csprogs,menu}.dat \
 && cd /fortressonesv/
ENTRYPOINT ["/fortressonesv/fteqw-sv"]
CMD ["-ip", "localhost", \
     "+set", "hostname", "FortressOne", \
     "+exec", "fo_pubmode.cfg", \
     "+map", "2fort5r"]

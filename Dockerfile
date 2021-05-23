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
    stow \
    subversion \
    zlib1g-dev \
 && rm -rf /var/lib/apt/lists/*
COPY . /fortressonesv/
<<<<<<< HEAD
# RUN cd /tmp/ \
#  && mkdir -p fteqw-code \
#  && cd /tmp/fteqw-code \
#  && curl --location --remote-name-all http://github.com/FortressOne/fteqw/releases/latest/download/source.tar.gz \
#  && tar -xvf ./source.tar.gz \
#  && cd /tmp/fteqw-code/trunk/engine/ \
#  && make sv-rel -j`nproc` \
#  && cd /fortressonesv/ \
#  && mv /tmp/fteqw-code/trunk/engine/release/fteqw-sv /fortressonesv/ \
#  && rm -rf /tmp/fteqw-code/
=======
RUN cd /tmp/ \
 && curl -L https://api.github.com/repos/FortressOne/fteqw-code/tarball > fteqw-code.tar.gz \
 && tar -xvf ./fteqw-code.tar.gz \
 && cd /tmp/FortressOne-fteqw-code-dc50693/engine/ \
 && make sv-rel -j`nproc` \
 && cd /fortressonesv/ \
 && mv /tmp/FortressOne-fteqw-code-dc50693/engine/release/fortressone-sv /fortressonesv/ \
 && rm -rf /tmp/FortressOne-fteqw-code-dc50693/
>>>>>>> 798c457b21a19ebf11ec6a395ec96295d5c487c7
RUN cd /fortressonesv/fortress/dats/ \
 && curl \
    --location \
    --remote-name-all \
    http://github.com/FortressOne/server-qwprogs/releases/latest/download/{qwprogs,csprogs,menu}.dat \
 && cd /fortressonesv/
<<<<<<< HEAD
ENTRYPOINT ["/fortressonesv/start.sh"]
=======
ENTRYPOINT ["/fortressonesv/fortressone-sv"]
>>>>>>> 798c457b21a19ebf11ec6a395ec96295d5c487c7
CMD ["-ip", "localhost", \
     "+set", "hostname", "FortressOne", \
     "+exec", "fo_pubmode.cfg", \
     "+map", "2fort5r"]

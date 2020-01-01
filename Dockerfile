FROM ubuntu:18.04
WORKDIR /fortressonesv
EXPOSE 27500/udp
RUN apt-get update \
 && apt-get install -y curl \
 && rm -rf /var/lib/apt/lists/*
COPY . /fortressonesv
RUN cd fortress/ \
 && curl --location \
    --remote-name-all \
    http://github.com/FortressOne/server-qwprogs/releases/latest/download/{qwprogs,csprogs,menu}.dat \
 && cd -
ENTRYPOINT ["/fortressonesv/fteqw-sv64", "+set sv_public 1"]
CMD ["-ip", "localhost", \
     "+set", "hostname", "FortressOne", \
     "+exec", "fo_pubmode.cfg", \
     "+map", "2fort5r"]

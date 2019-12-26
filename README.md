# Fortress One Server

## Run fortressonesv:

### Manually (only on Linux x86-64)

This package includes only one map, for a complete set of maps, download/clone
from [map-repo](https://github.com/FortressOne/map-repo) and extract into
server directory

```sh
./fteqw-sv64 +set hostname <description> +exec fo_<mode>mode.cfg +map <map>
```

e.g. To run in pub mode with 2fort5r as the initial map

```sh
./fteqw-sv64 +set hostname 'My FortressOne Server' +exec fo_pumode.cfg +map 2fort5r
```


### With docker (recommended)

Default (pub mode with no passwords and 2fort5r as initial map):

```sh
docker run -i -t --init --rm -p 27500:27500/udp fortressonesv
```

With arguments (you must provide all):

```sh
docker run -i -t --init --rm \
  -p 27500:<local_port>/udp \
  -e FO_IP=<local_ip_address> \
  -e FO_PORT=27500 \
  -e FO_HOSTNAME="<server description>" \
  -e FO_RCON_PASSWORD=<rcon_password> \
  -e FO_ADMINPWD=<admin_password> \
  -e FO_PASSWORD=<server_password> \ # use "none" for no password
  -e FO_MODE=<mode> \
  -e FO_MAP=<mapname> \
  fortressonesv
```

Note:
- `FO_HOSTNAME` is just the string name of the server.
- Valid `FO_MODE`s are `pub`, `duel`, `quad`, `pub`, `staging`

e.g. To run in quad mode, with passwords and mbasesr as the initial map:

```sh
docker run --init \
  -p 27500:27500/udp \
  -e FO_IP=localhost \
  -e FO_PORT=27500 \
  -e FO_HOSTNAME="FortressOne Sydney" \
  -e FO_RCON_PASSWORD=rc0n \
  -e FO_ADMINPWD=4dm1n \
  -e FO_PASSWORD=p4ssw0rd \
  -e FO_MODE=quad \
  -e FO_MAP=mbasesr \
  fortressonesv
```



## Build fortressonesv:

```
docker build --tag=fortressonesv .
```


## Deploy fortressonesv:

```sh
docker tag fortressonesv fortressone/fortressonesv:latest
docker push fortressone/fortressonesv:latest
```

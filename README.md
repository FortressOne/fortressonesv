# FortressOne Server

All in one package to run a FortressOne server. Powered by FTE server.


## With Docker

Requires [docker](https://docs.docker.com/install/)


### Run

```
docker run --interactive --tty --init --rm \
  --publish <port>:27500/udp \
  --mount type=bind,source=<path_to_assets>,target=/fortressonesv/fortress/assets/ \
  --mount type=bind,source=<path_to_demos>,target=/fortressonesv/fortress/demos/ \
  fortressonesv \
  -ip <ip> \
  +set hostname <name> \
  +set rcon_password <rcon_password> \
  +localinfo adminpwd <admin_password> \
  +exec fo_<mode>mode.cfg \
  +map <map>
```

Note:
- `ip` should be set to your public IP / DNS for public servers
- `hostname` is the string name of the server
- You should `exec` one of `fo_pubmode.cfg`, `fo_duelmode.cfg`,
  `fo_quadmode.cfg`, `fo_clanmode.cfg`

E.G. To run a server on port 27500, with full set of assets, in quad mode on mbasesr:

- Download and extract FortressOne [map-repo](https://github.com/FortressOne/map-repo/releases/latest/download/map-repo.zip)
- Run the server from map-repo root directory.
    ```
    docker run --interactive --tty --init --rm \
      --publish 27500:27500/udp \
      --mount type=bind,source="$(pwd)/fortress/",target=/fortressonesv/fortress/assets/ \
      --mount type=bind,source="$(pwd)",target=/fortressonesv/fortress/demos/ \
      fortressonesv \
      -ip localhost \
      +set hostname "My Local FortressOne Server" \
      +set rcon_password rc0n \
      +localinfo adminpwd 4dm1n \
      +exec fo_quadmode.cfg \
      +map mbasesr
    ```
- Demos automatically record in quad and clan mode and are accessible in the present working directory.


### Build fortressonesv

```
docker build --tag=fortressonesv .
```


### Deploy fortressonesv

```
docker tag fortressonesv fortressone/fortressonesv:latest
docker push fortressone/fortressonesv:latest
```


## Without Docker

Download the latest [ftesv](http://fte.triptohell.info) server binary for your OS from  and the [map-repo](https://github.com/FortressOne/map-repo). Copy these into your fortressonesv path.


### Run

#### Linux

```
./fteqw-sv64 +set hostname <name> +exec fo_<mode>mode.cfg +map <map>
```

E.G. To run in pub mode with 2fort5r as the initial map:

```
./fteqw-sv64 +set hostname 'My FortressOne Server' +exec fo_pubmode.cfg +map 2fort5r
```

#### Windows

```
fteqwsv64.exe +set hostname <name> +exec fo_<mode>mode.cfg +map <map>
```

E.G. To run in pub mode with 2fort5r as the initial map:

```
fteqwsv64.exe +set hostname 'My FortressOne Server' +exec fo_pubmode.cfg +map 2fort5r
```

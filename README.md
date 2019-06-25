Build fortressonesv:

```
docker build --tag=fortressonesv .
```


Run fortressonesv:

```sh
docker run \
  -p 27500:27500/udp \
  -e FO_SERVERIP=location.fortressone.org \
  -e FO_PORT=27500 \
  -e FO_HOSTNAME="FortressOne Location" \
  -e FO_RCON_PASSWORD=rc0np4ssw0rd \
  -e FO_ADMINPWD=adm1np4ssw0rd \
  -e FO_MODE=quad
  fortressonesv
```

Note:
- `FO_HOSTNAME` is just the string name of the server.
- Valid `FO_MODE`s are `pub`, `duel`, `quad`, `pub`, `staging`


Stop fortressonesv:

```sh
docker container ls
docker container stop <hash>
```


Deploy fortressonesv:

```sh
docker tag fortressonesv fortressone/fortressonesv:latest
docker push fortressone/fortressonesv:latest
```

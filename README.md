Build fortressonesv:

```
docker build --tag=fortressonesv .
```


Run fortressonesv:

```sh
docker run -p 27500:27500/udp fortressonesv
docker run \
  -p 27500:27500/udp \
  -e FO_HOSTNAME="FortressOne Location" \
  -e FO_RCON_PASSWORD=rc0np4ssw0rd \
  -e FO_ADMINPWD=adm1np4ssw0rd \
  -e FO_MODE=quad
  fortressonesv
```

Valid `FO_MODE`s are `pub`, `duel`, `quad`, `pub`


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

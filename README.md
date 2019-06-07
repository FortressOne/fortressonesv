Build fortressonesv:

```
docker build --tag=fortressonesv .
```


Run fortressonesv:

```sh
docker run -p 27500:27500/udp fortressonesv
```


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

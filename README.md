Build fortressonesv:

```
$ docker build --tag=fortressonesv .
```

Run fortressonesv:

```sh
$ docker run -p 27500:27500/udp fortressonesv
```

Deploy fortressonesv:

```sh
$ docker push username/repository:tag
```

Stop fortressonesv:

```sh
$ docker container ls
$ docker container stop <hash>
```

# Docker Ubuntu Toolbox

  Ubuntu 14.04 image with lots of tools installed

## Edit and Build from local

These instructions are for building on OSx

```
eval "$(docker-machine env default)"
docker build --rm=true -t jnyryan/ubuntu-toolbox .
docker run -t -i jnyryan/ubuntu-toolbox
```

## Cleanup

``` bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q)
```

## Publish

```
sudo docker push jnyryan/ubuntu-toolbox
```

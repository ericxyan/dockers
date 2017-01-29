# CentOS 7 SSH Server Docker 
## Shared Folder 
`./share`

## Build
````
# docker build --rm -t ericxyan/centos7
````

## Run
````
# docker run -d -p 22:22 -v $PWD/share:/share --name c7 ericxyan/centos7
````

## Docker command
````
# check container status
$ docker ps -a
# stop container
$ docker stop <container_name>
# remove all stoped container
$ docker container prune
# check image list
$ docker image ls
# remove image
$ docker imgae rm <image_name>
````
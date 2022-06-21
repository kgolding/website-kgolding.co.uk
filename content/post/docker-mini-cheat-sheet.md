---
title: "Docker mini cheat sheet"
date: "2022-06-06T14:53:30Z"
description: ""
tags: ["docker"]
---

A simple docker cheat sheet, put together for an RedSprite evening. For more information and examples see https://github.com/kgolding/docker-intro
<!--more-->

## Containers
* `docker run [options] <image name> [command]`
  * `-d` run in the background, use `docker container ls` to see running containers
  * `-p <external port>:<container port>` to allow access/open/map a containers port
  * `-v <local file/directory>:<container file/directory>` to bind a local file/directory into the container. Paths must be absolute and you can use $PWD for the current directory
  * `--rm` removes the container when it stops
  * `--restart unless-stopped` to restart the container automatically (options are `no`/`on-failure`/`always`/`unless-stopped`)
  * `-it` to interact with the container often used when providing a [command]
* `docker container ls` view running containers, add `-a` to see all containers
* `docker container logs -f <id/name>` to stream a given containers logs
* `docker container stop <id/name>` to stop containers
* `docker exec -it <id/name> <command>` run a command in an existing container
* `docker container prune` to delete unused (not running) containers

## Images
* `docker image ls` to list local images (add `-a` to see intermediate images)
* `docker image prune` to delete dangling (unused) images
* `docker build -t <name> .` to build an image from a `Dockerfile` in the same directory

## Volumes
* `docker inspect -f '{{ json .Mounts }}' <id/name> | jq` view a containers volumes

## Docker-compose
* `docker-compose up` runs the docker-compose.yml file in the same directory, add `-d` to run in the background
* `docker-compose down` runs the docker-compose.yml file in the same directory
* `docker-compose logs` displays the logs, add `-f` to stream the logs


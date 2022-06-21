---
title: "Node JS development using docker"
date: "2022-06-16T17:53:30Z"
description: ""
tags: ["docker", "node", "js", "vuejs"]
---

Here's how to run nodejs/npm/yarn etc without entering the world of pain installing them and maintaining them.
<!--more-->

For this example I'll create a default VueJS application using the vue-cli tool, which is not included in the standard node docker image, and thus we'll extend the node image by install vue-cli using a simple Dockerfile.

These instructions are for Linux, and you will need to have docker installed.

1. Create a project directory:
    > `mkdir mynodeapp`
1. Move into the new directory:
    > `cd mynodeapp`
1. Create the Dockerfile (yes it's just two lines):
    > `echo -e "FROM node:12\nRUN yarn global add @vue/cli" > Dockerfile`
1. Use the vue command from inside a container to create a new VueJS application (this will download the node docker image, and build our new image with vue-cli installed):
    > `docker run --rm -it -u $UID -v "$PWD":/app --workdir /app $(docker build -q .) vue create .`
    * Enter Y to create a new project in the current directory
    * Accept the defaults
1. Run the new created project using  from inside the a container
    > `docker run -it --rm -u $UID -p 8080:8080 -v "$PWD":/app --workdir /app $(docker build -q .) yarn serve`
1. Open [http://localhost:8080/](http://localhost:8080/)

## Explanation

Lets break down the last command from above:

* `docker run` Use docker to run an image as a container
* `-it` Interactive terminal
* `--rm` Tidy up the container after it's finished running
* `-u $UID` Run as the current user
* `-p 8080:8080` Forward port 8080 from the host machine to the container
* `-v "$PWD":/app` Mount the current directory as /app in the container
* `--workdir /app` Set the working directory as /app in the container
* `$(docker build -q .)` Run the image as built by the Dockerfile
* `yarn serve` This is the command we are running


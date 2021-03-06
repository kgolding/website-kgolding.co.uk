---
title: "Docker Server & Web Proxy"
date: 2020-02-19T21:33:55Z
tags: ["docker", "go"]
---

Setup a docker server with nginx proxy, with automated letsencrypt certs! Simple 4 step process for adding new apps - great for running golang apps!

<!--more-->

## Setting up the server

1. Install Ubuntu server (tested on a DigitalOcean Ubuntu 18.04.3 (LTS) x64 droplet)
1. Create a wildcard DNS to point to the servers public IP.
1. `apt update`
1. `apt install docker.io docker-compose`
1. `mkdir proxy`
1. `cd proxy`
1. `nano docker-compose.yaml`
```yaml
    version: '2'
    services:
        nginx-proxy:
            image: jwilder/nginx-proxy
            container_name: nginx-proxy
            ports:
                - '80:80'
                - '443:443'
            volumes:
                - 'conf:/etc/nginx/conf.d'
                - 'vhost:/etc/nginx/vhost.d'
                - 'dhparam:/etc/nginx/dhparam'
                - 'certs:/etc/nginx/certs:ro'
                - 'html:/usr/share/nginx/html'
                - '/var/run/docker.sock:/tmp/docker.sock:ro'
            networks:
                - proxy
            restart: always
        letsencrypt:
            image: jrcs/letsencrypt-nginx-proxy-companion
            container_name: nginx-proxy-le
            volumes_from:
                - nginx-proxy
            volumes:
                - 'certs:/etc/nginx/certs:rw'
                - 'html:/usr/share/nginx/html'
                - '/var/run/docker.sock:/var/run/docker.sock:ro'
            restart: always
    volumes:
        conf:
        vhost:
        dhparam:
        certs:
        html:

    networks:
        proxy:
            external:
                name: nginx-proxy

```
1. `ufw enable` Enable the firewall
1. `ufw allow 22,80,443/tcp` Allow SSH, HTTP & HTTP 
1. `sudo docker network create nginx-proxy` Create docker network
1. `docker-compose up -d` Start up Nginx and the letsencrypt containers

## Adding an application

After following the instructions below, your `myapp` application will be accessible via https://my-app.my-domain.com :)

1. `mkdir ~/my-app`
1. `cd ~/my-app`
1. Copy the application to the server into the `~/my-app` directory, which is `myapp`in this example, and configurr it to run it's http server on port 8080.
1. `nano docker-compose.yml`:
```yaml
    version: '3'
    services:
        myapp:
            image: iron/go
            expose:
                - '8080'
            environment:
                - VIRTUAL_HOST=my-app.my-domain.com
                - VIRTUAL_PORT=8080
                - LETSENCRYPT_HOST=my-app.my-domain.com
                - LETSENCRYPT_EMAIL=my-email@domain.com
            volumes:
                - '.:/app'
            entrypoint:
                - /app/myapp
            working_dir: /app
            networks:
                - proxy
            restart: unless-stopped
    networks:
        proxy:
            external:
                name: nginx-proxy
```
1. `docker-compose up -d` and `docker-compose down` to stop

**Notes**

* The VIRTUAL_HOST and VIRTUAL_PORT environment vars configure the ngnix web proxy, the the port must match the exposed port
* The LETSENCRYPT_HOST and LETSENCRYPT_EMAIL environment vars configure the atomated letsencrypt HTTPS certificate generation

## Directory structure

Whilst not enforced, here's the directory structure after following the above instructions.

```
~
├── proxy
│   └── docker-compose.yaml
└── my-app
    ├── myapp
    └── docker-compose.yaml
```

## Adding custom nginx configuration

You can load a custom nginx conf by mounting a local file inside the image like so:

```
    volumes:
    ... existing volumes ...
      - ./nginx_d.conf:/etc/nginx/conf.d/nginx_d.conf:ro
    networks:
```

And having the custom conf file in the same directoy as the docker-compose.yaml or use an absolute path.

e.g. this file increases the maximum upload size to 10MB

`nginx_d.conf`
```
client_max_body_size 10m;
```

## References

* https://olex.biz/2019/09/hosting-with-docker-nginx-reverse-proxy-letsencrypt/
* http://jasonwilder.com/blog/2014/03/25/automated-nginx-reverse-proxy-for-docker/
* https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion#step-3---proxyed-containers
* https://github.com/jwilder/nginx-proxy



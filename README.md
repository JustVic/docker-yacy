docker-yacy
===========

[![Docker Hub](https://img.shields.io/badge/docker-mkaag%2Fyacy-008bb8.svg)](https://registry.hub.docker.com/u/mkaag/yacy/)

This repository contains the **Dockerfile** to build [YaCy](http://www.yacy.net/) for [Docker](https://www.docker.com/).

### Base Docker Image

* [phusion/baseimage](https://github.com/phusion/baseimage-docker), the *minimal Ubuntu base image modified for Docker-friendliness*...
* ...[including image's enhancement](https://github.com/racker/docker-ubuntu-with-updates) from [Paul Querna](https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/)

### Installation

```bash
docker build -t mkaag/yacy github.com/mkaag/docker-yacy
```

### Usage

#### Basic usage

```bash
docker run -d -p 8090:8090 mkaag/yacy
```

#### Using persistent volume

```bash
docker run -d -p 8090:8090 \
-v /opt/apps/yacy/lib:/var/lib/yacy \
-v /opt/apps/yacy/etc:/etc/yacy \
mkaag/yacy
```

#### Security

Use the env variable `ADMIN_PASS` to setup the password used by the `admin` account such as:

```bash
docker run -d -p 8090:8090 \
-v /opt/apps/yacy/lib:/var/lib/yacy \
-v /opt/apps/yacy/etc:/etc/yacy \
-e ADMIN_PASS=admin \
mkaag/yacy
```
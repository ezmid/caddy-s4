# Caddy Symfony 4

[![Build Status](https://travis-ci.org/ezmid/caddy-s4.svg?branch=master)](https://travis-ci.org/ezmid/caddy-s4)
![Docker Hub Status](https://img.shields.io/docker/cloud/build/ezmid/caddy-s4.svg)
![Image Pulls](https://img.shields.io/docker/pulls/ezmid/caddy-s4.svg)
![Image Stars](https://img.shields.io/docker/stars/ezmid/caddy-s4.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

This repo contains a fresh [Symfony 4](https://symfony.com/) Flex installation
with the bare minumum runtime requirements served by [Caddy](https://caddyserver.com/).
You can use it for classic PHP monolithical application development.

You can also use it for micro projects and APIs, although we recommend you try
our ezmid/rr-symfony image for those use cases. It contains the Road Runner
application server optimized for PSR-7 request/response communication.


## Requirements

- [GIT](https://git-scm.com/) >= 2.15
- [Docker CE](https://www.docker.com/) >= 17.12.0
- [Goss](https://github.com/aelsabbahy/goss) >= 0.3 [optional]
- [Make](https://www.gnu.org/software/make/) >= 4.2 [optional]

**Currently Goss is not available for Windows. Build everything else works on all platforms.*


## Tags and branches

This simple branching model is used to build specific tags.

tag 1.0.2 -> ezmid/caddy-s4:1.0.2

tag 1.0.1 -> ezmid/caddy-s4:1.0.1

branch master -> ezmid/caddy-s4:latest

branch develop -> ezmid/caddy-s4:edge


## Contributing

Just create a PR or contact me via email.


## Basic howto
```sh
# Build the image, TAG=latest is the default value
$ make build

# Build the image with a specific tag
$ make build TAG=1.1.0

# Test the latest image
$ make test

# Test a specific tag
$ make test TAG=1.1.0

# Push the latest tag to the registry
$ make push

# Push a specific tag
$ make push TAG=1.1.0

```


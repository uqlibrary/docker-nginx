docker-nginx
============

This repository contains a Dockerfile of Nginx for Docker's automated build published to the public [Docker Hub Registry](https://registry.hub.docker.com/).

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download the [automated build](https://registry.hub.docker.com/u/uqlibrary/docker-nginx/) from the public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull uqlibrary/docker-nginx`

   (or, you can build an image from Dockerfile: `docker build -t uqlibrary/docker-nginx .)

### Usage

1. Start the container:

    ```sh
    docker run uqlibrary/docker-nginx
    ```

After few seconds, open `http://<host>` to see the result.

The following environment variables can be used to configure the container:

    APP_ENVIRONMENT           The application environment (e.g. production, development..).
    NEWRELIC_INSTALL_KEY      The New Relic installation key
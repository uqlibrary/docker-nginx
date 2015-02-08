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

    AWS_S3_OBJECT             If set, should be an S3 location of a zip file named app.zip
                              containing the code to deploy to this instance.
    AWS_DEFAULT_REGION        The region of the S3 bucket.
    AWS_ACCESS_KEY_ID         The AWS access key ID for accessing the S3 bucket.
    AWS_SECRET_ACCESS_KEY     The AWS secret access key for accessing the S3 bucket.

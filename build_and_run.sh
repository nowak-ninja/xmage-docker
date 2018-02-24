#!/bin/bash

# build image without cache to fetch always fresh server
docker build -t xmage:latest --no-cache .

# run
docker-compose up -d

#!/bin/bash

# just in case stop running service
docker-compose down

# build image without cache to fetch always fresh server
docker build -t xmage:latest --no-cache .

# run
docker-compose up -d

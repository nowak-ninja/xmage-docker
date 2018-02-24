#!/bin/bash

docker build -t xmage:latest --no-cache .
docker-compose up -d

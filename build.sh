#!/bin/bash 
docker build --build-arg USERNAME=$USER \
--build-arg UID_AND_GID=$(id -u $USER) \
-t sentry:latest .

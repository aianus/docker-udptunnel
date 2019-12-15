#!/usr/bin/env bash

docker context create aianus_udptunnel
docker buildx create --driver docker-container --use aianus_udptunnel
docker buildx inspect --bootstrap
docker buildx build --platform linux/amd64,linux/arm64,linux/386,linux/arm/v7,linux/arm/v6 -t aianus/udptunnel:latest --push .

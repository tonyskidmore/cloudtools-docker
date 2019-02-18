#!/bin/bash
docker build . -t cloud-tools:latest
docker image prune -f

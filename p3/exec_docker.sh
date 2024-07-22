#!/bin/bash

docker build -f Dockerfile.achansel-1 -t achansel-1 .
docker build -f Dockerfile.achansel-2 -t achansel-2 .
docker build -f Dockerfile.achansel-3 -t achansel-3 .
docker build -f Dockerfile.achansel-4 -t achansel-4 .

docker build -f Dockerfile.host_achansel-1 -t host_achansel-1 .
docker build -f Dockerfile.host_achansel-2 -t host_achansel-2 .
docker build -f Dockerfile.host_achansel-3 -t host_achansel-3 .
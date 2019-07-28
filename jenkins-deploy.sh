#!/bin/bash

set -e 

docker-compose -f jenkins-prod.yml rm -f &&\
docker-compose -f jenkins-prod.yml up --build

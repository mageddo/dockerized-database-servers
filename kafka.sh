#!/bin/bash

docker-compose -f kafka.yml up -d zookeeper

echo "Waiting zookeeper startup before start kafka"
sleep 5;

docker-compose -f kafka.yml up kafka

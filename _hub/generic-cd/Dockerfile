FROM ubuntu:22.04

RUN apt-get update && apt-get install -y zip build-essential zlib1g-dev jq git curl wget && apt-get clean

ENV TERM=xterm
ENV DOCKER_VERSION=20.10.14
ENV DOCKER_BUILDKIT=1
ENV DOCKER_COMPOSE_VERSION=v2.15.1
ENV GITHUB_CLI_URL='https://github.com/mageddo-projects/github-cli/releases/download/v1.8/github-cli.sh'

RUN curl -L https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz > /tmp/docker.tgz && \
  tar -xf /tmp/docker.tgz --strip 1 -C /usr/local/bin && \
  curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose && \
  chmod +x /usr/bin/docker-compose &&\
  groupadd docker && usermod -a -G docker root && id &&\
  curl -s -L ${GITHUB_CLI_URL} > /usr/bin/github-cli &&\
  chmod +x /usr/bin/github-cli &&\
  rm -rf /tmp/*

VOLUME ["/var/run/docker.sock", "/var/run/docker.sock"]
VOLUME ["/var/lib/docker", "/var/lib/docker"]
LABEL GITHUB="https://github.com/mageddo/dockerized-database-servers/tree/newtools/_hub/generic-cd"
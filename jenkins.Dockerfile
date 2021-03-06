FROM jenkins/jenkins:2.179
USER root

ENV TERM=xterm
ENV DOCKER_COMPOSE_VERSION=1.24.1
ENV DOCKER_VERSION=19.03.1
ENV DOCKER_BUILDKIT=1

RUN mkdir -p /tmp && curl -L https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz > /tmp/docker.tgz && \
	tar -xf /tmp/docker.tgz --strip 1 -C /usr/local/bin && \
	curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose && \
	chmod +x /usr/bin/docker-compose &&\
	rm -rf /tmp/*

# Installing portainer deployer
ENV PORTAINER_CLI_VERSION=0.6.0
RUN curl -L https://github.com/mageddo-projects/portainer-cli/releases/download/${PORTAINER_CLI_VERSION}/portainer-cli-${PORTAINER_CLI_VERSION}.zip > /tmp/portainer-cli.zip &&\
	unzip /tmp/portainer-cli.zip -d / &&\
	ln -s /portainer-cli-*/bin/portainer-cli /bin/portainer-cli &&\
	rm -rf /tmp/*


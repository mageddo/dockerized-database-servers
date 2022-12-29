FROM jenkins/jenkins:2.235.2
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

COPY ./jenkins/jdk-switcher.sh /usr/bin

RUN apt-get update && apt-get install -y zip && curl -s "https://get.sdkman.io" | bash && bash -c "source /root/.sdkman/bin/sdkman-init.sh; source /usr/bin/jdk-switcher.sh; jdk-install '15.+amzn$';"
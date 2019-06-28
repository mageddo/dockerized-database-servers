FROM jenkins/jenkins:2.179
USER root

ENV TERM=xterm
ENV DOCKER_COMPOSE_VERSION=1.21.2
ENV DOCKER_VERSION=18.03.1-ce
ENV TMP_DIR=/tmp/mageddotemp

# Install Docker from Docker Inc. repositories.
RUN mkdir -p $TMP_DIR && curl -L https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz > $TMP_DIR/docker.tgz && \
	tar -xf $TMP_DIR/docker.tgz --strip 1 -C /usr/local/bin && \
	curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-`uname -s`-`uname -m` > /usr/bin/docker-compose && \
	chmod +x /usr/bin/docker-compose

# Installing portainer deployer
RUN curl -L https://github.com/mageddo-projects/portainer-cli/releases/download/0.3.1/portainer-cli.zip > $TMP_DIR/portainer-cli.zip &&\
	unzip $TMP_DIR/portainer-cli.zip -d / &&\
	ln -s /portainer-cli/bin/portainer-cli /bin/portainer-cli &&\
	rm -rf $TMP_DIR/

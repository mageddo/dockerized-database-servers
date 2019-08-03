FROM adoptopenjdk:11-jre-hotspot

ENV KAFKA_VERSION=2.3.0

RUN curl -L "https://www.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_2.12-${KAFKA_VERSION}.tgz" > /tmp/kafka.tgz &&\
	tar -xf /tmp/kafka.tgz -C /opt && ln -s /opt/kafka* /opt/kafka &&\
	apt-get update && apt-get install -y supervisor &&\
	mkdir -p /var/log/supervisord && apt-get clean && rm -rf /tmp/*

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config /opt/kafka/

WORKDIR "/opt/kafka"
CMD ["/usr/bin/supervisord"]

FROM openjdk:8u131

RUN curl -L http://ftp.unicamp.br/pub/apache/kafka/1.0.0/kafka_2.12-1.0.0.tgz > /tmp/kafka.tgz && \
	tar -xf /tmp/kafka.tgz -C /opt && ln -s /opt/kafka* /opt/kafka && rm -rf /tmp/kafka*

WORKDIR "/opt/kafka"
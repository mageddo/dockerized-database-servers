FROM openjdk:8u131

RUN curl -L http://ftp.unicamp.br/pub/apache/kafka/1.0.0/kafka_2.12-1.0.0.tgz > /tmp/kafka.tgz && \
	tar -xf /tmp/kafka.tgz -C /opt && ln -s /opt/kafka* /opt/kafka && rm -rf /tmp/kafka*

RUN apt-get update && apt-get install -y supervisor &&\
	mkdir -p /var/log/supervisord && apt-get clean

COPY kafka/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR "/opt/kafka"

CMD ["/usr/bin/supervisord"]
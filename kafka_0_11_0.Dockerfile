FROM openjdk:8-jre

RUN curl -L https://archive.apache.org/dist/kafka/0.11.0.0/kafka_2.12-0.11.0.0.tgz  > /tmp/kafka.tgz && \
	tar -xf /tmp/kafka.tgz -C /opt && ln -s /opt/kafka* /opt/kafka && rm -rf /tmp/kafka*

RUN apt-get update && apt-get install -y supervisor &&\
	mkdir -p /var/log/supervisord && apt-get clean

COPY kafka/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

WORKDIR "/opt/kafka"

CMD ["/usr/bin/supervisord"]
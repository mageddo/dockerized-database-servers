FROM openjdk:8-jre
RUN wget https://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz -O /tmp/spark.tgz && \
    mkdir -p /opt && tar -xvf /tmp/spark.tgz -C /opt && \
    ln -s /opt/spark* /opt/spark && \
    echo 'export PATH="$PATH:/opt/spark/bin:/opt/spark/sbin"' >> /root/.bashrc && \
    mkdir /tmp/spark-events &&
    rm -rf /tmp/*.tgz

WORKDIR /opt/spark
CMD /opt/spark/sbin/start-history-server.sh
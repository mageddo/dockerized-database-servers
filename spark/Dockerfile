FROM registry.pagseguro.intranet/jre:8u112
RUN apk update && apk add ca-certificates wget && update-ca-certificates && \
    wget https://d3kbcqa49mib13.cloudfront.net/spark-2.1.0-bin-hadoop2.7.tgz -O /tmp/spark.tgz && \
    mkdir -p /opt && tar -xvf /tmp/spark.tgz -C /opt && \
    ln -s /opt/spark* /opt/spark && \
    echo 'export PATH="$PATH:/opt/spark/bin:/opt/spark/sbin"' >> /etc/profile && \
    rm -rf /tmp/*.tgz

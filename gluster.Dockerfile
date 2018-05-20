FROM debian:9

RUN apt-get update && apt-get install -y glusterfs-server && apt-get clean
COPY gluster/* /app/

ENTRYPOINT /app/entrypoint.sh
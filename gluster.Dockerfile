FROM debian:9

RUN apt-get update && apt-get install -y glusterfs-server && apt-get clean

CMD tail -f /var/log/glusterfs/nfs.log
FROM alpine:3.21

WORKDIR /etc/burrow

ARG URL=https://github.com/linkedin/Burrow/releases/download/v1.9.2/Burrow_1.9.2_linux_amd64.tar.gz
ADD ${URL} /etc/burrow

RUN tar -xvf Burrow_1.9.2_linux_amd64.tar.gz &&\
 rm -r Burrow_1.9.2_linux_amd64.tar.gz &&\
 ls -lha

COPY burrow/burrow.toml /etc/burrow/config/

CMD [ \
  "/etc/burrow/burrow",\
  "--config-dir", "/etc/burrow/config" \
]
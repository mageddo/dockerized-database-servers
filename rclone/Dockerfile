FROM debian:10-slim
ADD https://github.com/rclone/rclone/releases/download/v1.51.0/rclone-v1.51.0-linux-amd64.deb /tmp/
RUN dpkg -i /tmp/rclone-v1.51.0-linux-amd64.deb && rm -r /tmp/*
FROM debian:9

MAINTAINER edigitalb@gmail.com

RUN apt-get update && apt-get -y install cron
ADD crontab/cron/* /etc/cron.d/
RUN chmod 0644 /etc/cron.d/*

CMD cron && tail -f /dev/null
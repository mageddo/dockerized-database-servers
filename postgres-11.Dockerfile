FROM postgres:11.1

RUN echo deb http://ftp.us.debian.org/debian sid main > /etc/apt/sources.list.d/sid.list && \
	apt-get update && \
	apt-cache -t stretch policy postgresql-11-orafce && \
	apt-get -t stretch install -y postgresql-11-orafce && \
	apt-get clean

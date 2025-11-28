FROM postgres:17.6

COPY debian.sources /etc/apt/sources.list.d/debian.sources

RUN apt-get -o Acquire::Check-Valid-Until=false update \
  && apt-get install -y \
       postgresql-17-cron \
       postgresql-17-partman \
  && rm -rf /var/lib/apt/lists/*

CMD [ \
  "postgres", \
  "-c", "wal_level=logical", \
  "-c", "max_wal_senders=10", \
  "-c", "max_replication_slots=10", \
  "-c", "wal_keep_size=64MB", \
  "-c", "shared_preload_libraries=pg_partman_bgw,pg_cron", \
  "-c", "cron.database_name=db" \
]
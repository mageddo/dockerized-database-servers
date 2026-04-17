FROM postgres:17.6 AS build

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
       git \
       build-essential \
       postgresql-server-dev-17 \
       ca-certificates \
       make \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 --branch v4.7.4 https://github.com/pgpartman/pg_partman.git /tmp/pg_partman \
  && make -C /tmp/pg_partman \
  && make -C /tmp/pg_partman install


FROM postgres:17.6

COPY debian.sources /etc/apt/sources.list.d/debian.sources

RUN apt-get -o Acquire::Check-Valid-Until=false update \
  && apt-get install -y --no-install-recommends \
       postgresql-17-cron \
  && rm -rf /var/lib/apt/lists/*

# copia a lib do bgworker + arquivos da extensão (SQL/control)
COPY --from=build /usr/lib/postgresql/17/lib/pg_partman_bgw.so /usr/lib/postgresql/17/lib/pg_partman_bgw.so
COPY --from=build /usr/lib/postgresql/17/lib/pg_partman*.so /usr/lib/postgresql/17/lib/
COPY --from=build /usr/share/postgresql/17/extension/pg_partman* /usr/share/postgresql/17/extension/

CMD [ \
  "postgres", \
  "-c", "wal_level=logical", \
  "-c", "max_wal_senders=10", \
  "-c", "max_replication_slots=10", \
  "-c", "wal_keep_size=64MB", \
  "-c", "shared_preload_libraries=pg_partman_bgw,pg_cron", \
  "-c", "cron.database_name=db" \
]
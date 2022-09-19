#!/bin/bash

set -e

if [ -v PG_VERSION ]; then
  ls -1 /docker-entrypoint-initdb.d/*/init.postgres.sql | xargs -I{} psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -f {}
elif [ -v MYSQL_VERSION ]; then
  ls -1 /docker-entrypoint-initdb.d/*/init.mysql.sql | xargs -I{} mysql -u "${MYSQL_USER}" -D "${MYSQL_DATABASE}" -p "${MYSQL_PASSWORD}" -f {}
else
  echo 'どれでもありません'
fi

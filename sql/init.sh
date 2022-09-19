#!/bin/bash

set -e

if [ -v PG_VERSION ]; then
  echo 'PostgreSQLの初期化を行います'
  find /docker-entrypoint-initdb.d/ -name '*.postgres.sql' | xargs -I{} psql -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" -f {}
elif [ -v MYSQL_VERSION ]; then
  echo 'MySQLの初期化を行います'
  find /docker-entrypoint-initdb.d/sakila-db/ -name '*.mysql.sql' | xargs -I{} bash -c 'mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" < {}'
else
  echo 'どれでもありません'
fi

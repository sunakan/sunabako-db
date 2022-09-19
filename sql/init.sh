#!/bin/bash

set -e


ls -1 /docker-entrypoint-initdb.d/*/init.sql | xargs -I{} psql -U ${POSTGRES_USER} -d ${POSTGRES_DB} -f {}

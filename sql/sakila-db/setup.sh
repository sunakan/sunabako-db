#!/bin/bash

set -e

rm -rf sakila-db/

ls sakila-db.tar.gz || curl -osakila-db.tar.gz https://downloads.mysql.com/docs/sakila-db.tar.gz

tar -zxvf sakila-db.tar.gz
mv sakila-db/sakila-schema.sql sakila-db/00-sakila-schema.mysql.sql
mv sakila-db/sakila-data.sql sakila-db/01-sakila-data.mysql.sql

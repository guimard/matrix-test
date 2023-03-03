#!/bin/sh

set -e

mkdir -p backup

DBID=`docker container ls --filter ancestor=postgres:13-bullseye --format '{{.ID}}'`
echo $DBID
docker exec -it $DBID pg_dumpall -h localhost -U postgres --clean --if-exists >backup/all.sql

tar cJf backup/synapse-files.tar.xz synapse-data

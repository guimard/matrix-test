#!/bin/sh

set -ex

# New install
. ./clean.sh
mkdir synapse-db
mkdir -p synapse-data
tar xJf backup/synapse-files.tar.xz

# Restore database
PGARGS="-e POSTGRES_PASSWORD='synapse!!' -v `pwd`/synapse-db:/var/lib/postgresql/data -v `pwd`/backup:/backup postgres:13-bullseye"

ID=`docker run -d --name=tmpdb $PGARGS`
sleep 30
docker exec $ID psql -U postgres -h localhost -f /backup/all.sql
docker stop $ID
docker rm $ID

# Restore synapse files

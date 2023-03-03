#!/bin/sh

set -xe

MYUID=`perl -e 'print $<'`
DBCONTNAME=temp-db

# Configure synapse database

docker stop $DBCONTNAME || true
docker rm $DBCONTNAME || true

ARGS="-e POSTGRES_PASSWORD='synapse!!' -v `pwd`/synapse-db:/var/lib/postgresql/data postgres:13-bullseye"

docker run --entrypoint="" $ARGS chown -R $MYUID /var/lib/postgresql/data

rm -rf synapse-db
mkdir synapse-db

# Configure synapse

mkdir -p synapse-data

ARGS="--rm -it -v `pwd`/synapse-data:/data -e SYNAPSE_SERVER_NAME=matrix.example.com -e SYNAPSE_REPORT_STATS=no matrixdotorg/synapse:latest"

docker run --entrypoint="" $ARGS find /data/ ! -type d -delete
docker run --entrypoint="" $ARGS chown -R $MYUID /data/

#docker run --rm -it -v `pwd`/synapse-data:/data     -e SYNAPSE_SERVER_NAME=matrix.example.com     -e SYNAPSE_REPORT_STATS=no     --entrypoint="" matrixdotorg/synapse:latest find /data/ ! -type d -delete

rm -rf synapse-data
mkdir synapse-data
cp -f synapse-ref/homeserver.yaml synapse-data/

docker run $ARGS generate

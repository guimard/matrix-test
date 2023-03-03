#!/bin/sh

docker-compose down

MYUID=`perl -e 'print $<'`

PGARGS="-e POSTGRES_PASSWORD='synapse!!' -v `pwd`/synapse-db:/var/lib/postgresql/data postgres:13-bullseye"

docker run --rm --entrypoint="" $PGARGS chown -R $MYUID /var/lib/postgresql/data

rm -rf synapse-db

SYNAPSEARGS="--rm -it -v `pwd`/synapse-data:/data -e SYNAPSE_SERVER_NAME=matrix.example.com -e SYNAPSE_REPORT_STATS=no matrixdotorg/synapse:latest"

docker run --rm --entrypoint="" $SYNAPSEARGS find /data/ ! -type d -delete
docker run --rm --entrypoint="" $SYNAPSEARGS chown -R $MYUID /data/

#docker run --rm -it -v `pwd`/synapse-data:/data     -e SYNAPSE_SERVER_NAME=matrix.example.com     -e SYNAPSE_REPORT_STATS=no     --entrypoint="" matrixdotorg/synapse:latest find /data/ ! -type d -delete

rm -rf synapse-data

export SYNAPSEARGS

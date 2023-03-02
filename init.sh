#!/bin/sh

set -x

mkdir -p synapse-data

MYUID=`perl -e 'print $<'`

ARGS="--rm -it -v `pwd`/synapse-data:/data -e SYNAPSE_SERVER_NAME=matrix.example.com -e SYNAPSE_REPORT_STATS=no matrixdotorg/synapse:latest"

docker run --entrypoint="" $ARGS find /data/ ! -type d -delete
docker run --entrypoint="" $ARGS chown -R $MYUID /data/

#docker run --rm -it -v `pwd`/synapse-data:/data     -e SYNAPSE_SERVER_NAME=matrix.example.com     -e SYNAPSE_REPORT_STATS=no     --entrypoint="" matrixdotorg/synapse:latest find /data/ ! -type d -delete

rm -rf synapse-data
mkdir synapse-data
cp -f synapse-ref/homeserver.yaml synapse-data/

docker run $ARGS generate

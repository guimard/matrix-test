#!/bin/sh

set -xe

. ./clean.sh

mkdir synapse-db

# Configure synapse

mkdir -p synapse-data

cp -f synapse-ref/homeserver.yaml synapse-data/

docker run --rm $SYNAPSEARGS generate

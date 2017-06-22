#!/bin/bash

if [ "$REPLICA_ID" -eq 3 ]
then
    mongo --eval 'rs.initiate()'
    mongo --eval 'rs.add("mongo-rep1")'
    mongo --eval 'rs.add("mongo-rep2")'
fi

if [ "$REPLICA_ID" == "" ] || [ "$REPLICA_ID" -eq 3 ]
then
    mongoimport --db dummy --collection restaurants --file /docker-entrypoint-initdb.d/restaurants.json
fi

#!/bin/bash

sleep 10

mongo --eval 'rs.initiate()'
mongo --eval 'rs.add("mongo-rep1")'
mongo --eval 'rs.add("mongo-rep2")'

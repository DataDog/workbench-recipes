#!/bin/bash

mongoimport --db dummy --collection restaurants --file /docker-entrypoint-initdb.d/restaurants.json

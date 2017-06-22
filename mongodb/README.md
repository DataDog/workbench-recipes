# mongodb
This workbench creates dummy data that are inserted in `dummy` database in `restaurants` collection.

## Running
* Launching mongodb standalone instance
```bash
COMPOSE_FILE=standalone.yaml version=3.5 docker-compose up
```
* Launching mongodb replicated set
```bash
COMPOSE_FILE=replicas3.yaml version=3.5 docker-compose up
```

## Useful commands
* Get a bash on mongo
```bash
docker exec -it <IMAGE> bash
```

* Request data:
```bash
mongo localhost:27017/dummy --eval 'db.restaurants.find()'
```

* Insert data:
```bash
mongoimport --db dummy --collection restaurants --file /docker-entrypoint-initdb.d/restaurants.json
```

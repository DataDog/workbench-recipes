# mongodb
This workbench creates dummy data that are inserted in `dummy` database in `restaurants` collection.

## Useful commands
* Request data:
```bash
mongo localhost:27017/dummy --eval 'db.restaurants.find()'
```

* Insert data:
```bash
mongoimport --db dummy --collection restaurants --file /docker-entrypoint-initdb.d/restaurants.json
```

# Redis
This workbench creates a redis server.

## Running
* Launching a standalone redis
```bash
COMPOSE_FILE=standalone.compose version=3.2 docker-compose up
```

* Launching a 1 redis master with 2 slaves
```bash
COMPOSE_FILE=1m-2s.compose version=3.2 docker-compose up
```

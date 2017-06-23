# Zookeeper
This workbench creates a Zookeeper master/cluster

## Running
* Launching Zookeeper standalone instance
```bash
COMPOSE_FILE=standalone.yaml version=3.4 docker-compose up
```
* Launching Zookeeper replicated set
```bash
COMPOSE_FILE=replicas3.yaml version=3.4 docker-compose up
```

## Useful commands
* Get a bash on Zookeeper
```bash
docker run -it --rm --link some-zookeeper:zookeeper zookeeper zkCli.sh -server zookeeper
```

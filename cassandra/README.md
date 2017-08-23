# Cassandra
Starts a standard cassandra node.

In cluster or standalone mode JMX is configured to be access outside from the
local host. The default user is `cassandra` and the password is `cassandra`.

## Running
* Launching cassandra standalone instance
```bash
COMPOSE_FILE=standalone.compose version=latest docker-compose up
```
* Launching a cassandra cluster with 3 nodes
```bash
COMPOSE_FILE=cluster.compose version=latest docker-compose up
```

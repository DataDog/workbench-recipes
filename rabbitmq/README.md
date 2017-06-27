# rabbitmq
This workbench creates a rabbitmq with a default queues (default "test1",
"test2" and "test3") and a message in each of them.

## Running
* Launching rabbitmq with the management module
```bash
COMPOSE_FILE=management.compose version=3.6 docker-compose up
```

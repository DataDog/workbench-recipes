# haproxy
This workbench creates a haproxy server.

## Running
* Launching haproxy without a password
```bash
COMPOSE_FILE=haproxy.compose docker-compose up
```

* Launching haproxy with a password
```bash
COMPOSE_FILE=haproxy-password.compose docker-compose up
```

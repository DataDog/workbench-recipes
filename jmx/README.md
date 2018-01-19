# JMX
This workbench creates a simple Java app with JMX.

## Running
* Launching the helloworld flavor
```bash
COMPOSE_FILE=helloworld.compose docker-compose up
```

* Launching a JMX app with autoconf template in the container labels (5.17+ only)
```bash
COMPOSE_FILE=template_in_labels.compose docker-compose up
```

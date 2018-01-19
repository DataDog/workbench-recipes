# Agent 5
This workbench run any version of agent 5.

## Running
* Launching `dev` flavor (using `datadog/dev-dd-agent` docker image.
```bash
COMPOSE_FILE=dev.compose docker-compose up
```

* Launching `release` flavor (using `datadog/docker-dd-agent` docker image.
```bash
COMPOSE_FILE=release.compose docker-compose up
```

See the `manifest.yaml` for more option

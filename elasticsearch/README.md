# elasticsearch
Starts a standard insance with 2 nodes using [official](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-prod-cluster-composefile) elasticsearch docker-compose yaml

## Prerequisite
Elasticsearch won't start if the following parameter hasn't that minimal value:
```bash
sysctl -w vm.max_map_count=262144
```

## fs.io_stats metrics

Elasticsearch won't collect `fs.io_stats.total` metrics when running in docker
with overlay. To test those metrics witht the agent you need to mount a folder
from the host to the elasticsearch `data` folder.

The `standalone_fs_stats` flavor do this for you (you need to create the
`/tmp/elastic/` directory first).

## Running
* Launching elasticsearch standalone instance
```bash
COMPOSE_FILE=standalone.compose version=5.6 docker-compose up
```

* Launching a elasticsearch cluster
```bash
COMPOSE_FILE=standard.compose version=5.6 docker-compose up
```

## Useful Commands
* Check elasticsearch health
  * Hint: default password is `changeme`
```bash
curl -u elastic http://127.0.0.1:9200/_cat/health
```

# elasticsearch
Starts a standard insance with 2 nodes using [official](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-prod-cluster-composefile) elasticsearch docker-compose yaml

## Prerequisite
Elasticsearch won't start if the following parameter hasn't that minimal value:
```bash
sysctl -w vm.max_map_count=262144
```

## Commands
* Check elasticsearch health
  * Hint: default password is `changeme`
```bash
curl -u elastic http://127.0.0.1:9200/_cat/health
```

# Datadog Integration Workbench recipes

This repository holds the recipes for the [Integration Workbench](https://github.com/DataDog/workbench-tooling/) project. Please refer to this repository's documentation to learn about the scope of the project and the usage of the `workbench` tool.

As these are generic [docker-compose](https://docs.docker.com/compose/compose-file/compose-file-v2/) files that can be reused for other uses (eg. continuous integration), we are hosting them in a separate repository.


# Repository structure

- For every target software, a **recipe** is created in a dedicated folder, with a `manifest.yaml` file describing it
- Each recipe provides one or several docker-compose files, called **flavors**
- Each flavor can accept one or several **options**, passed as environment variables to `docker-compose`
- When relevant, flavors include a provision stage that injects test data in the data stores

Flavors can either use public docker images, or provide their own Dockerfiles that will be built on demand by `docker-compose`. For better readability, flavors can be moved into separate sub-folders.

Recipes can provide auto_conf templates to be used by the agent for autodiscovery. They are to be in the `auto_conf` folder, and will be automatically copied by `workbench update` command


| Filename | Format | Contents    | Required? |
|----------|--------|-------------|-----------|
| README.md | Markdown | usage instructions / tips for the recipe | Optional |
| manifest.yaml | See below | recipe metadata, to be used by `workbench` | Required |
| *.compose | [docker-compose](https://docs.docker.com/compose/compose-file/compose-file-v2/) | flavor description as a valid docker-compose v2 or v2.1 file | Required |
| auto_conf/*.yaml | yaml | [autodiscovery templates](http://docs.datadoghq.com/guides/autodiscovery/) for dd-agent. Required if not provided by the defaul dd-agent distribution | Required |

# Manifest format

Recipe manifest files are **yaml** files with the following structure:

### Toplevel elements

| Name | Type | Description | Required? |
|------|------|-------------|-----------|
| name | string | recipe name to display | Required |
| flavors | dict | available flavors | Required not empty

### Flavor properties

| Name | Type | Description | Required? |
|------|------|-------------|-----------|
| description | string | flavor description to display | Required |
| compose_file | string | relative path to the `docker-compose` file | Required |
| options | dict | options to pass as environment variables to `docker-compose` | Optional |

### Option properties

| Name | Type | Description | Required? |
|------|------|-------------|-----------|
| description | string | option description to display | Required |
| values | array of strings | possible values an option can take | Optional |
| default | string | default value to use if not specified | Optional |

# Tips and tricks

### Manifests

- You can use [YAML anchors](http://www.yaml.org/spec/1.2/spec.html#id2785586) to share common properties between flavors. See the [redis manifest](redis/manifest.yaml) for example.

### Compose files

- To allow dd-agent to monitor the containers, they must be connected into the **workbench** network. Please look at existing flavors
- To run provisionning scripts (inserting test data, setting up clusters), flavors can run an additional container that will start after the server containers and run a script. You can have a look at the [mongodb](mongodb/3replicas.compose) and [rabbitmq](rabbitmq/management.compose) recipes for examples.
- To allow for finer-grained matching of auto_conf templates, you can use the `com.datadoghq.sd.check.id` container label, and set that in the `docker_images` field of the auto_conf template

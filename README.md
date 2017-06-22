# INTERNAL DATADOG PROJECT

# Datadog workbench recipes

This repo holds the docker-compose recipes for use with the `workbench` tool.

# Repository structure

- Every folder is a separate target software, called an **integration**
- Each integration will provide one or several docker-compose yaml files, called **flavors**
- Each flavor can accept one or several **options**, as environment variables

Recipes can either use public docker images, or provide their own Dockerfiles that will be built on demand
by docker-compose.

Recipes can provide auto_conf templates to be used by the agent for autodiscovery. They are to be in the `auto_conf` folder, and will be automatically copied by `workbench update`

# Manifest format

To be defined (yaml-based)


# Agent autodiscovery templates

To be defined

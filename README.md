# SD-Skosmos Setup for ODISSEI

This repository contains a simple Skosmos setup tailored for the ODISSEI project. It leverages the [sd-skosmos](https://github.com/knaw-huc/sd-skosmos) Dockerized Skosmos setup.

## Features

- **Vocabularies**: The `data` directory contains Turtle files (`.ttl`) for four vocabularies:
    - CBS Begrippen
    - CBS Taxonomie
    - CBS Thesaurus
    - ELSST

- **Configuration**:
    - The `config` directory includes configuration files for Varnish.
    - The `docker-compose.yml` file defines the setup for four containers:
        1. **Skosmos**: The main Skosmos application.
        2. **Skosmos Loader**: Handles loading the vocabularies and setting up Skosmos.
        3. **Fuseki Triple Store**: Stores the RDF data.
        4. **Varnish Cache**: Provides caching for the triple store.

This setup ensures a streamlined deployment of Skosmos for managing and exploring vocabularies. 

## Accessing the Services

- **Fuseki** is available at [http://localhost:9030](http://localhost:9030)
- **Skosmos** can be accessed at [http://localhost:9090/en/](http://localhost:9090/en/)

## Setting Up the Environment

To create your environment configuration:

```bash
cp dot_env_example .env
```

Then, edit the `.env` file and set your desired values (for example, change the password to `admin1`). 

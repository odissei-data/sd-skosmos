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
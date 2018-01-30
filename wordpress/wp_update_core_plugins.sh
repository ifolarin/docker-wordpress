#!/bin/bash

docker-compose run --rm wp core update
docker-compose run --rm wp plugin update --all

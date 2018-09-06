#!/bin/bash
docker-compose run --rm wp db export
docker-compose exec wordpress bash -lc 'tar -vczf "/home/wp/wp_`date +%Y-%m-%d_%H_%M_%S`.tar.gz" .'
docker-compose exec wordpress bash -lc 'rm *.sql'

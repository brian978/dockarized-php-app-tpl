#!/bin/bash

# Ensure the Laravel app directory is empty
rm -rfv ./app && mkdir ./app
rm -rfv ./logs/nginx
rm -rfv ./logs/php

docker-compose build --no-cache

# Ensure we have the required configuration files for the docker services
sh scripts/set_configs.sh

# Run the Laravel installer
docker compose run --rm app /bin/bash -c "composer create-project laravel/laravel ."

echo "Laravel installation completed."

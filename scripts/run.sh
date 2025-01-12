#!/bin/bash

# Get parent directory
parent_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"

sh scripts/set_configs.sh

# Base config
compose_config="-f ${parent_dir}/docker-compose.yml"

# Extra config files
for fileKey in "$@"; do
    case "$fileKey" in
        rabbit)
            compose_config+=" -f ${parent_dir}/docker-compose.mq.yml"
            ;;
        msql)
            compose_config+=" -f ${parent_dir}/docker-compose.mssql.yml"
            ;;
        *)
            echo "Unknown option: $fileKey"
            ;;
    esac
done

# Run the UP command
command="docker-compose $compose_config up -d"
echo "$command"
eval "$command"

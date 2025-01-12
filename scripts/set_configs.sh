#!/bin/bash

# Get parent directory
parent_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"

# Ensure we have the required configuration files for the docker services
# FPM
fpm_file="${parent_dir}/services/fpm/www.conf"
[[ ! -f $fpm_file ]] && cp "${fpm_file}.dist" "$fpm_file"

# Xdebug
xdebug_file="${parent_dir}/services/php/conf.d/xdebug.ini"
[[ ! -f $xdebug_file ]] && cp "${xdebug_file}.dist" "$xdebug_file"

# Nginx
nginx_file="${parent_dir}/services/nginx/conf.d/default.conf"
[[ ! -f $nginx_file ]] && cp "${nginx_file}.dist" "$nginx_file"
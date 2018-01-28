#!/bin/bash

sed -i "s/\(^ .*_api.conf.inc.*\)/#\1/g" /etc/nginx/conf.d/$domain.conf

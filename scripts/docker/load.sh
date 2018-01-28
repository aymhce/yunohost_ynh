#!/bin/bash

LAST_BACKUP=$(docker exec $app ls -r /home/yunohost.backup/archives/ | awk -F'.' '{print $1}' | head -1)
docker exec $app yunohost backup restore $LAST_BACKUP --force

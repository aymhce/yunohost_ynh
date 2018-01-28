#!/bin/bash

image=domainelibre/yunohost2:2.7.7-1
[ "$architecture" == "i386" ]  && image=domainelibre/yunohost2-i386:2.7.7-1
[ "$architecture" == "armhf" ] && image=domainelibre/yunohost2-arm:2.7.7-1

options="-p $port:443 -v $data_path/data:/home/yunohost.backup"

docker run -d -h yunohost.DOMAIN --name=$app \
 --privileged \
 --restart always \
 -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
 $options $image /bin/systemd >/dev/null 2>&1
echo $?

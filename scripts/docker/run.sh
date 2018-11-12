#!/bin/bash

[ "$architecture" == "amd64" ] && image=domainelibre/yunohost3:3.2.2-1
[ "$architecture" == "i386" ]  && image=domainelibre/yunohost3-i386:3.2.2-1
[ "$architecture" == "armhf" ] && image=domainelibre/yunohost3-arm:3.2.2-1
[ -z $image ] && ynh_die "Sorry, your $architecture architecture is not supported ..."

options="-p $port:443 -v $data_path/data:/home/yunohost.backup -v /var/run/docker.sock:/var/run/docker.sock"

docker run -d -h yunohost.DOMAIN --name=$app \
 --privileged \
 --restart always \
 -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
 $options $image /bin/systemd 1>&2
echo $?

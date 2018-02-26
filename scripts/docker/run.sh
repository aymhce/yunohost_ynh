#!/bin/bash

[ "$architecture" == "amd64" ] && image=domainelibre/yunohost2:2.7.9-1
[ "$architecture" == "i386" ]  && image=domainelibre/yunohost2-i386:2.7.9-1
[ "$architecture" == "armhf" ] && image=domainelibre/yunohost2-arm:2.7.9-1
[ -z $image ] && ynh_die "Sorry, your $architecture architecture is not supported ..."

options="-p $port:443 -v $data_path/data:/home/yunohost.backup -v /var/run/docker.sock:/var/run/docker.sock"

docker run -d -h yunohost.DOMAIN --name=$app \
 --privileged \
 --restart always \
 -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
 $options $image /bin/systemd 1>&2
echo $?

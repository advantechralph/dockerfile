#!/bin/bash

. config

volumes_cmd=
for i in $(seq 0 1 9); do 
  volumes_cmd=${volumes_cmd}${volumes[${i},path]:+-v ${volumes[${i},path]}:${volumes[${i},docker]} }
done 

ports_cmd=
for ((i=0;i<${#ports[@]};i++)) ; do 
  ports_cmd=${ports_cmd}${ports[${i}]:+-p ${ports[${i}]} }
done

envs_cmd=
for ((i=0;i<${#envs[@]};i++)) ; do 
  envs_cmd=${envs_cmd}${envs[${i}]:+-e ${envs[${i}]} }
done

docker run --name ${name} \
  --restart always \
  -v $(dirname $(realpath ${BASH_SOURCE[0]}))/share:/share \
  -v /media/sf_share:/media/sf_share \
  $volumes_cmd \
  $ports_cmd \
  $envs_cmd \
  -h ${name} \
  -d \
  --privileged \
  -it ${repo}

#  --add-host ${name}:127.0.1.1 \
#  --network=host \
#  --restart always \
#  --entrypoint /work/entrypoint.sh \

# official gitlab run script
# docker run --detach \
#  --hostname gitlab.example.com \
#  --publish 443:443 --publish 80:80 --publish 22:22 \
#  --name gitlab \
#  --restart always \
#  --volume /srv/gitlab/config:/etc/gitlab \
#  --volume /srv/gitlab/logs:/var/log/gitlab \
#  --volume /srv/gitlab/data:/var/opt/gitlab \
#  gitlab/gitlab-ce:latest


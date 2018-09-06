#!/bin/bash

cd ~

mkdir /srv

chown -R :docker /srv
chmod g+rwx :docker /srv

git clone https://github.com/ifolarin/docker-wordpress.git frontend

docker network create --driver bridge proxy-net || true
docker network create --internal --driver bridge db-net || true

cp frontend/proxy /srv/proxy
cd /srv/proxy 

docker-compose up -d

cd -

cp frontend/db /srv/db
cd /srv/db
mkdir backup

cd -
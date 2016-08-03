#!/bin/bash

os=alpine

version=$1
version=${version:-"latest"}

app_component=web-nginx
app_database=pgsql

if [[ ! $version =~ ^[0-9]*\.[0-9]*\.[0-9]*$ ]] && [ "$version" != "latest" ]; then
    echo "Incorrect syntax of the version"
    exit 1
fi

docker build -t zabbix-$app_component-$app_database:$os-$version -f Dockerfile .

#docker rm -f zabbix-$app_component-$app_database

#docker run --name zabbix-$app_component-$app_database -t -d --link mysql-server:mysql --link zabbix-server:zabbix-server zabbix-$app_component-$app_database:$os-$version

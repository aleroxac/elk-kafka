#!/usr/bin/env bash
INDEXES="{$1}*"

curl -s -XDELETE "localhost:9200/${INDEXES}" --user elastic:changeme; echo
docker rm -f fb01 ls01 kafka zookeeper
rm -fv assets/logs/apache.log

docker-compose up -d zookeeper
docker-compose up -d kafka
docker-compose up -d ls01  && docker-compose logs -f --tail 500 ls01  | gawk -F " " "/ started Logstash API/{print;exit}"
docker-compose up -d fb01  && docker-compose logs -f --tail 500 fb01  | gawk -F " " "/ Inputs completed/{print;exit}"
docker-compose restart flog
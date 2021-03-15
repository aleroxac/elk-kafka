# elk-kafka
![Elastic Stack](assets/img/elk-kafka.png)

ELK Stack with Apache Kafka as buffer.


## Resources available
- [elk-sample](https://github.com/aleroxac/elk-sample) files(with some changes)
- filebeat
- apache kafka
- apache zookeeper


## Setup
``` shell
## Installing Docker
curl -fsSL https://get.docker.com | bash

### Installing docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```


## Use mode
``` sh
## Running the docker-compose
docker-compose up -d

### Viewing messages inside kafka 
docker-compose exec kafka bash -c 'watch -n1 kafka-consumer-groups --bootstrap-server localhost:9092 --group logstash --describe'

### Restarting index process
assets/scripts/restart apache
```

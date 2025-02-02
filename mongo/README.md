# Mongo

* [Replica Set](docker-compose.yml)

```shell
$ sudo tee -a /etc/hosts > /dev/null <<EOT
127.0.0.1    mongo-primary
127.0.0.1    mongo-secondary-1
127.0.0.1    mongo-secondary-2
EOT
```

```shell
$ docker-compose up -d --wait
$ mongosh mongodb://localhost:27017,localhost:27018,localhost:27019/ -u program -p test
```

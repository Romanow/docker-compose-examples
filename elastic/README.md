# ElasticSearch

* [Single Node](docker-compose.yml)
* [Cluster](docker-compose.cluster.yml)

```shell
$ docker-compose up -d --wait
$ curl 'http://localhost:9200/_cluster/health?pretty' --user elastic:qwerty
```

# HA Postgres cluster with Patroni

* [Patroni](docker-compose.yml)

## Описание

Patroni — это шаблон для построения Postgres HA cluster из коробки. Он устанавливается на каждом сервере с базой
данных и является своего рода init-системой для Postgres: запускает, останавливает, перезапускает, меняет конфигурацию и
топологию кластера.

Patroni хранит состояние кластера в DCS (Distributed Configuration Store), это может быть один из вариантов: Etcd,
Consul, ZooKeeper либо Etcd Kubernetes.

## Запуск

```shell
$ docker exec -it patroni1 /bin/bash

$ patronictl --config-file /etc/patroni.yml topology cluster

+ Cluster: cluster -------+---------+---------+----+-----------+
| Member     | Host       | Role    | State   | TL | Lag in MB |
+------------+------------+---------+---------+----+-----------+
| patroni2   | 172.22.0.6 | Leader  | running |  1 |           |
| + patroni1 | 172.22.0.7 | Replica | running |  1 |         0 |
| + patroni3 | 172.22.0.5 | Replica | running |  1 |         0 |
+------------+------------+---------+---------+----+-----------+

# внутри контейнера
$ psql -h patroni1 -p 5432 -U program -d services

# снаружи
$ psql -h localhost -p 5001 -U program -d services

# если упал master и не подключается в роли slave
$ patronictl --config-file /etc/patroni.yml reinit cluster patroni1
```

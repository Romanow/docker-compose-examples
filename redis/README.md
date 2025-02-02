# Redis

* [Sentinel](docker-compose.yml)

```shell
$ sudo tee -a /etc/hosts > /dev/null <<EOT
127.0.0.1    redis-master
127.0.0.1    redis-slave-1
127.0.0.1    redis-slave-2
EOT
```

```shell
$ docker compose up -d --wait --scale sentinel=3
$ redis-cli -h localhost -p 26379 --askpass
> SENTINEL get-master-addr-by-name mymaster
```

Для того чтобы Redis поднять в Sentinel внутри Docker нужно чтобы в `sentinel.conf` было прописано:

```text
# Normally Sentinel uses only IP addresses and requires SENTINEL MONITOR
# to specify an IP address. Also, it requires the Redis replica-announce-ip
# keyword to specify only IP addresses.
#
# You may enable hostnames support by enabling resolve-hostnames. Note
# that you must make sure your DNS is configured properly and that DNS
# resolution does not introduce very long delays.
#
sentinel resolve-hostnames yes

# When resolve-hostnames is enabled, Sentinel still uses IP addresses
# when exposing instances to users, configuration files, etc. If you want
# to retain the hostnames when announced, enable announce-hostnames below.
#
sentinel announce-hostnames yes
```

При запуске будет строка:

```text
slave slave 192.168.224.3:6379 192.168.224.3 6379 @ mymaster redis-master 6379
```

![picture alt](https://cdn.rawgit.com/fabric8io/fabric8-devops/93ca9bc/prometheus/src/main/fabric8/icon.png "Prometheus")
# Prometheus Demo

* [Prometheus](http://{{book.prometheus_demo_hostname}}:{{book.prometheus_demo_port}}/)
* [node_exporter](http://{{book.prometheus_demo_hostname}}:{{book.prometheus_ne_port}}/)
* [Alertmanager](http://{{book.prometheus_demo_hostname}}:{{book.prometheus_am_port}}/)
* [Grafana](http://{{book.prometheus_demo_hostname}}:{{book.grafana_port}}/)
* [Mailhog](http://{{book.prometheus_demo_hostname}}:{{book.mailhog_port}}/)

## Whats included ?
* All components are running as a docker containers
* prometheus listening on default port {{book.prometheus_demo_port}}.
* node exporter listening on default port {{book.prometheus_ne_port}}.
* alertmanager listening on default port {{book.prometheus_am_port}}.
* grafana listening on default port {{book.grafana_port}}.
* mailhog - for email capture and templating purposes listening on default port {{book.mailhog_port}} for web and {{book.mailhog_smtp_port}} for smtp.

## getting up and running !

get the latest from the repo & run `docker-compose up -d`:
```
git clone git@github.com:shelleg/prometheus-stack.git
cd prometheus-stack
docker-compose up -d
```

Then a docker ps should yield something like:

```
CONTAINER ID        IMAGE                            COMMAND                  CREATED              STATUS              PORTS                                            NAMES
3ebcc10498ff        prometheusstack_prom-demo-docs   "nginx -g 'daemon of"   About a minute ago   Up About a minute   0.0.0.0:80->80/tcp                               prometheusstac
k_prom-demo-docs_1
d43e61be3bc4        grafana/grafana:4.3.2            "/run.sh"                About a minute ago   Up About a minute   0.0.0.0:3000->3000/tcp                           prometheussta
ck_grafana_1
9996787e47ce        prom/prometheus:v2.0.0           "/bin/prometheus --c"   About a minute ago   Up About a minute   0.0.0.0:9090->9090/tcp                           prometheusstac
k_prometheus_1
887f94b483a2        prom/alertmanager:v0.11.0        "/bin/alertmanager -"   About a minute ago   Up About a minute   0.0.0.0:9093->9093/tcp                           prometheusstac
k_alertmanager_1
67f0804d18ea        google/cadvisor:v0.28.2          "/usr/bin/cadvisor -"   About a minute ago   Up About a minute   8082/tcp, 0.0.0.0:8082->8080/tcp                 prometheusstac
k_cadvisor_1
fb2e6d23bf1b        prom/node-exporter:v0.15.1       "/bin/node_exporter "   About a minute ago   Up About a minute   0.0.0.0:9100->9100/tcp                           prometheusstac
k_node-exporter_1
7dab91f50a4c        blueimp/mailhog:latest           "mailhog"                About a minute ago   Up About a minute   0.0.0.0:1025->1025/tcp, 0.0.0.0:8025->8025/tcp   prometheussta
ck_mailhog_1
9b85d2939f76        prom/mysqld-exporter:v0.10.0     "/bin/mysqld_exporte"   About a minute ago   Up About a minute   0.0.0.0:9104->9104/tcp                           prometheusstac
k_mysql-exporter_1
```

## explore the stack ...
[Prometheus](http://{{book.prometheus_demo_hostname}}:{{book.prometheus_demo_port}}/)

[node_exporter](http://{{book.prometheus_demo_hostname}}:{{book.prometheus_ne_port}}/)

[Alertmanager](http://{{book.prometheus_demo_hostname}}:{{book.prometheus_am_port}}/)

[Grafana](http://{{book.prometheus_demo_hostname}}:{{book.grafana_port}}/)

[Mailhog](http://{{book.prometheus_demo_hostname}}:{{book.mailhog_port}}/)

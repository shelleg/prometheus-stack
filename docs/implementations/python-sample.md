# example how to expose metrics in `python`

Here you can find full documentation:

[https://github.com/prometheus/client\_python](https://github.com/prometheus/client_python)

Before writing exporter you should strict define name convention of metrics and labels, also in some cases metric and label names could come from some source of data in this case you may add header to those metric names for following convention.

After that good idea to choose metric type:

* Counters go up, and reset when the process restarts.

* Gauges can go up and down.

* Summaries track the size and number of events.

* Histograms track the size and number of events in buckets. This allows for aggregatable calculation of quantiles.

Each exposing process consist from following 3 parts:

1. Define or collect metrics names and labels names, collect metrics values and labels values
2. Exspoe metrics values with labels values
3. Repeat above steps with some period of time \(scrape interval\)

Following simple example how to export uptime on linux machine:

```
import socket
import time
from prometheus_client import start_http_server, Gauge

# Start exposing metrics on port 1111
start_http_server(1111)

#Initilization Gauge object and assignment to variable g
g = Gauge('uptime_seconds', 'system uptime in seconds', ['hostname'])

# Getting metric and label value
def get_metric_label_values():
    with open('/proc/uptime', 'r') as f:
        uptime_seconds = int(float(f.readline().split()[0]))
        metric_value = uptime_seconds

    hostname = socket.gethostname()
    label_values = [hostname]
    return metric_value, label_values

# Run infinity loop with time interval 5 seconds
while True:
    metric_value, label_values = get_metric_label_values()
    # Setting metric and label values
    g.labels(*label_values).set(metric_value)
    time.sleep(5)
```

After running this code we can check in browser that metric is exposing on localhost on port 1111

![](/assets/Exposing_metric_example.png)


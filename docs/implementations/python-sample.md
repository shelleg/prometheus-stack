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




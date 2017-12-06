# [https://github.com/beylistan/prometheus\_libvirt\_exporter.git](https://github.com/beylistan/prometheus_libvirt_exporter.git)

1st Follow README.md for running exporter 

2nd in order to scrape metrics by prometheus from exporter add following section to prometheus.yml configuration file

```
- job_name: libvirt-exporter  
  scrape_interval: 5s
  scrape_timeout: 5s
  metrics_path: /metrics
  scheme: http
  static_configs:
  - targets:
    - 0.0.0.0:9177 
    
```

3rd add dashboard to grafana \(Grafana dashboard id: 3928\)

**Chapter of dashbord:**![](/assets/Screenshot from 2017-12-06 23-53-39.png)


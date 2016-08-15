grafana:
  http_addr: 127.0.0.1
  http_port: 3000

prometheus:
  server:
    source: https://github.com/prometheus/prometheus/releases/download/v1.0.1/prometheus-1.0.1.linux-amd64.tar.gz
    source_hash: md5=415cd0c8dd64f711748db4ee6fcaa80d
    directory: prometheus-1.0.1.linux-amd64
    storage:
      retention: 720h
      path: /var/lib/prometheus/data
    config:
      global:
        scrape_interval:     15s
        evaluation_interval: 15s
      rule_files:
        - /opt/prometheus/rules/alerting.rules
      scrape_configs:

        - job_name: prometheus
          target_groups:
            - targets:
              - localhost:9090

        - job_name: 'overwritten-default'
          file_sd_configs:
            - names:
              - /opt/prometheus/targets.yaml
          relabel_configs:
            - source_labels: ['__address__']
              regex: '(.*):([0-9]+)'
              target_label: 'instance'
              replacement: '$1'

    alerts:
      - name: InstanceDown
        expression: up == 0
        duration: 2m
        labels:
            - severity: page
        annotations:
            - summary: "Instance {{ '{{' }} $labels.instance {{ '}}' }} down"

      - name: DiskFullIn4Hours
        expression: predict_linear(node_filesystem_free{job='node', device!='sunrpc'}[1h], 4*3600) < 0
        duration: 5m
        labels:
            - severity: page
            - team: devops

      - name: HighLoad
        expression: node_load1 > on (instance) 2 * count by (instance)(node_cpu{mode="idle"})
        duration: 5m
        labels:
            - severity: page

      - name: HighCPU
        expression: rate(os_cpu[5m]) > 50
        duration: 5m

  targets: |
    - targets:
      - kvm01.sethmiller.me:9100
      - salt.sethmiller.me:9100
      - docker01.sethmiller.me:9100
      - docker02.sethmiller.me:9100
      - docker03.sethmiller.me:9100
      - docker04.sethmiller.me:9100
      labels:
          job: 'node'
          kernel: linux

    - targets:
      - DESKTOP-9HKGO0M:9107

      labels:
          job: 'scollector'
          kernel: windows

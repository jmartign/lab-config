{% from "prometheus/map.jinja" import prometheus %}

include:
  - prometheus

prometheus.node_exporter:
  archive.extracted:
    - name: {{ prometheus.node_exporter.install_directory }}
    - source: {{ prometheus.node_exporter.source }}
    - source_hash: {{ prometheus.node_exporter.source_hash }}
    - user: {{ prometheus.user }}
    - group: {{ prometheus.group }}
    - archive_format: tar
    - keep: True
    - if_missing: {{ prometheus.homedir }}/bin/node_exporter

prometheus.node_exporter.textfiles:
    file.directory:
      - name: {{ prometheus.node_exporter.textfile_directory }}
      - user: {{ prometheus.user }}
      - group: {{ prometheus.group }}
      - makrdirs: True

prometheus.node_exporter.service_script:
  file.managed:
    - name: /etc/systemd/system/{{ prometheus.node_exporter.service }}.service
    - user: root
    - group: root
    - contents: |
        [Unit]
        Description=prometheus
        After=syslog.target network.target

        [Service]
        Type=simple
        RemainAfterExit=no
        WorkingDirectory={{ prometheus.homedir }}
        User={{ prometheus.user }}
        Group={{ prometheus.group }}
        ExecStart={{ prometheus.homedir }}/bin/node_exporter -log.level {{ prometheus.node_exporter.log_level }}

        [Install]
        WantedBy=multi-user.target

prometheus.node_exporter.service:
  service.running:
    - name: {{ prometheus.node_exporter.service }}
    - enable: True

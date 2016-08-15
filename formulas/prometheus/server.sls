{% from "prometheus/map.jinja" import prometheus %}

include:
  - prometheus

prometheus.server:
  archive.extracted:
    - name: {{ prometheus.server.install_directory }}
    - source: {{ prometheus.server.source }}
    - source_hash: {{ prometheus.server.source_hash }}
    - user: {{ prometheus.user }}
    - group: {{ prometheus.group }}
    - archive_format: tar
    - if_missing: {{ prometheus.server.install_directory }}/{{ prometheus.server.directory }}
    - keep: True

prometheus.server.config:
  file.serialize:
    - name: {{ prometheus.server.config_file }}
    - user: {{ prometheus.user }}
    - group: {{ prometheus.group }}
    - mode: '0644'
    - dataset: {{ prometheus.server.config }}
    - formatter: yaml
    - watch_in:
      - service: {{ prometheus.server.service }}

prometheus.server.service_script:
  file.managed:
    - name: /etc/systemd/system/{{ prometheus.server.service }}.service
    - user: root
    - group: root
    - contents: |
        [Unit]
        Description=prometheus
        After=syslog.target network.target

        [Service]
        Type=simple
        RemainAfterExit=no
        WorkingDirectory={{ prometheus.server.install_directory }}/{{ prometheus.server.directory }}
        User={{ prometheus.user }}
        Group={{ prometheus.group }}
        ExecStart={{ prometheus.server.install_directory }}/{{ prometheus.server.directory }}/prometheus -config.file={{ prometheus.server.config_file }} -log.level {{ prometheus.server.log_level }} -storage.local.retention {{ prometheus.server.storage.retention }} -storage.local.path {{ prometheus.server.storage.path }}

        [Install]
        WantedBy=multi-user.target

prometheus.server.service:
  service.running:
    - name: {{ prometheus.server.service }}
    - enable: True

/opt/prometheus/rules/alerting.rules:
  file.managed:
    - user: {{ prometheus.user }}
    - group: {{ prometheus.group }}
    - mode: '0644'
    - makedirs: True
    - template: jinja
    - source: salt://prometheus/templates/alerting.rules.jinja
    - defaults:
      alerts: {{ salt['pillar.get']('prometheus:server:alerts', []) }}

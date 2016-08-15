{% from "grafana/map.jinja" import grafana %}

grafana-repo:
  pkgrepo.managed:
    - name: {{ grafana.package }}
    - humanname: {{ grafana.package }}
    - baseurl: https://packagecloud.io/grafana/stable/el/6/$basearch
    - gpgkey: https://packagecloud.io/gpg.key https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana
    - gpgcheck: 1

grafana-package:
  pkg.installed:
    - name: {{ grafana.package }}

grafana-service:
  service.running:
    - name: {{ grafana.service }}
    - enable: True
    - require:
      - pkg: {{ grafana.package }}

grafana-restart:
  module.wait:
    - name: service.restart
    - m_name: {{ grafana.service }}

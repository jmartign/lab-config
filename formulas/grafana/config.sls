{% from "grafana/map.jinja" import grafana %}

include:
  - grafana

grafana-config:
  file.managed:
    - name: {{ grafana.config_file }}
    - source: salt://grafana/templates/grafana.ini.jinja
    - user: {{ grafana.user }}
    - group: {{ grafana.group }}
    - mode: 644
    - template: jinja
    - watch_in:
      - module: grafana-restart

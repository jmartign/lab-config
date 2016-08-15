{% from "grafana/map.jinja" import grafana %}

include:
  - grafana

grafana-ldap:
  file.managed:
    - name: {{ grafana.ldap_file }}
    - source: salt://grafana/templates/ldap.toml.jinja
    - user: root
    - group: {{ grafana.group }}
    - mode: 640
    - template: jinja
    - watch_in:
      - module: grafana-restart

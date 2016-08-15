{% from "prometheus/map.jinja" import prometheus %}

prometheus.group:
  group.present:
    - name: {{ prometheus.group }}
    - system: True

prometheus.user:
  user.present:
    - name: {{ prometheus.user }}
    - groups:
      - {{ prometheus.group }}
    - home: {{ prometheus.homedir }}
    - createhome: True
    - shell: /bin/false
    - system: True

prometheus.homedir:
  file.directory:
    - name: {{ prometheus.homedir }}
    - user: {{ prometheus.user }}
    - group: {{ prometheus.group }}
    - dir_mode: 755

{% from "grafana/map.jinja" import grafana %}

include:
  - grafana

grafana-apache:
  file.managed:
    - name: /etc/httpd/conf.d/grafana.conf
    - user: root
    - group: root
    - mode: 644
#TODO - make the port a variable
    - contents: |
        ProxyPreserveHost On
        ProxyPass / http://127.0.0.1:3000/
        ProxyPassReverse / http://127.0.0.1:3000/


{% from "jenkins/map.jinja" import jenkins with context %}

apache_config:
  file.managed:
    - name: {{ jenkins.apache_config }}
    - source: salt://jenkins/files/vhost.tmpl
    - template: jinja
    - require:
      - pkg: {{ jenkins.apache_package }}

mod_ssl:
  pkg.installed:
    - name: mod_ssl

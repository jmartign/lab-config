{% from "jenkins/map.jinja" import jenkins with context %}

jenkins:
  pkgrepo.managed:
    - humanname: Jenkins upstream package repository
    - baseurl: http://pkg.jenkins-ci.org/redhat
    - gpgkey: http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
    - require_in:
      - pkg: {{ jenkins.package }}
  pkg.installed:
    - name: {{ jenkins.package }}
    - refresh: True
  pip.installed:
    - name: python-gnupg
  service.running:
    - name: {{ jenkins.service }}
    - enable: True
    - watch:
      - pkg: {{ jenkins.package }}

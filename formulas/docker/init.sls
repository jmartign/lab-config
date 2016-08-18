docker.repo:
  pkgrepo.managed:
    - name: docker
    - humanname: Docker Repository
    - baseurl: https://yum.dockerproject.org/repo/main/centos/7/
    - gpgcheck: 1
    - gpgkey: https://yum.dockerproject.org/gpg
    - require_in:
      - pkg: docker-engine

docker.service:
  file.managed:
    - name: /usr/lib/systemd/system/docker.service
    - mode: '0600'
    - user: root
    - source: salt://docker/files/docker.service
  cmd.wait:
    - name: systemctl daemon-reload
    - watch:
      - file: /usr/lib/systemd/system/docker.service
  service.running:
    - name: docker
    - enable: True

docker.installed:
  pkg.installed:
    - name: docker-engine

docker.disable_firewalld:
  service.dead:
    - name: firewalld
    - enable: False

{% set registry_cert = salt['pillar.get']('docker:registry:certificate', None) %}
{% if registry_cert %}
docker.registry_cert:
  file.managed:
     - name: /etc/docker/certs.d/{{ registry_cert.name }}/ca.crt
     - makedirs: True
     - user: root
     - mode: '0600'
     - contents: {{ registry_cert.certificate }}
{% endif %}

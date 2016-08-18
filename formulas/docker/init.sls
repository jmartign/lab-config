docker.repo:
  pkgrepo.managed:
    - name: docker
    - humanname: Docker Repository
    - baseurl: https://yum.dockerproject.org/repo/main/centos/7/
    - gpgcheck: 1
    - gpgkey: https://yum.dockerproject.org/gpg
    - require_in:
      - pkg: docker-engine

docker.installed:
  pkg.installed:
    - name: docker-engine

docker.disable_firewalld:
  service.dead:
    - name: firewalld
    - enable: False

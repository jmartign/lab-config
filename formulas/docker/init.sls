docker.repo:
  pkgrepo.managed:
    - humanname: Docker Repository
    - name: dockerrepo
    - baseurl: https://yum.dockerproject.org/repo/main/centos/$releasever/
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: https://yum.dockerproject.org/gpg

docker.engine:
  pkg.installed:
    - name: docker-engine
  
docker-engine:
  service.running:
    - name: docker
    - enable: True

/etc/systemd/system/docker.service.d/local.conf:
  file.managed:
    - contents: |
        [Service]
        ExecStart=
        ExecStart=/usr/bin/docker daemon -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock
    - makedirs: True
  

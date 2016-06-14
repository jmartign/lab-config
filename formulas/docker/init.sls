docker.repo:
  pkgrepo.managed:
    - humanname: Docker Repository
    - name: dockerrepo
    - baseurl: https://yum.dockerproject.org/repo/main/centos/$releasever/
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: https://yum.dockerproject.org/gpg

docker.machine:
  pkg.installed:
    - name: docker-machine

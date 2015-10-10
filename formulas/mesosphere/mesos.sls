include:
  - mesosphere

mesosphere.mesos:
  pkg.installed:
    - name: mesos

/etc/mesos/zk:
  file.managed:
    - source: salt://mesosphere/templates/zk.jinja
    - template: jinja
    - defaults:
      servers: {{ salt['pillar.get']('mesosphere:zookeeper:servers', {}) }}

/etc/mesos-master/quorum:
  file.managed:
    - contents: 2

/etc/mesos-slave/containerizers:
  file.managed:
    - contents: 'docker,mesos'

/etc/mesos-slave/executor_registration_timeout:
  file.managed:
    - contents: '5mins'

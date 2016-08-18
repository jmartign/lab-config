base:
  '*':
    - roles.base

  'salt*':
    - roles.salt_master

  'mon*':
    - roles.monitoring_server

  'docker03*':
    - roles.docker_engine

  'docker02*':
    - roles.docker_engine

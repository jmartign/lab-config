base:
  '*':
    - roles.base

  'salt*':
    - roles.salt_master

  'mon*':
    - roles.monitoring_server

# testing

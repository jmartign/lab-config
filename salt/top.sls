base:
  '*':
    - roles

  'gluster*':
    - roles.storage

  'docker*':
    - docker

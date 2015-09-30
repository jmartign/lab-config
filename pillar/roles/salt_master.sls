salt:
  master:
    fileserver_backend:
      - git
      - roots
    gitfs_remotes:
      - https://github.com/saltstack-formulas/salt-formula
      - https://github.com/saltstack-formulas/hostsfile-formula
      - https://github.com/saltstack-formulas/sudoers-formula
      - https://github.com/saltstack-formulas/openssh-formula
      - https://github.com/saltstack-formulas/users-formula
      - https://github.com/saltstack-formulas/docker-formula
    file_roots:
      base:
        - /srv/salt
        - /srv/salt/roles
    pillar_roots:
      base:
        - /srv/pillar
      dev:
        - /srv/pillar/dev
      staging:
        - /srv/pillar/staging
    auto_accept: True

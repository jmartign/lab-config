salt:
  master:
    fileserver_backend:
      - roots
    file_roots:
      base:
        - /srv/salt
        - /srv/formulas
        - /srv/salt/roles
    pillar_roots:
      base:
        - /srv/pillar
    auto_accept: True

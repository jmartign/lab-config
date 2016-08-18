docker_engine:
  grains.present:
    - name: role
    - value: docker_engine
    - force: True

include:
  - docker

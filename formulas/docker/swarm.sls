{% set swarm = salt['pillar.get']('docker:swarm', None) %}

{% if swarm %}
docker.swarm.join:
  cmd.script:
    - name: salt://docker/files/join_swarm.sh
    - args: "{{ swarm.token }} {{ swarm.manager}}" 
    - user: root
    - shell: /bin/bash
    - unless: ls /var/lib/docker/swarm/state.json
{% endif %}

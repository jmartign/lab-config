{% set servers = salt['pillar.get']('mesosphere:zookeeper:servers', {}) %}
{% set hostname = grains['host'] %}
{% set server_id = servers[hostname].id %}


include:
    - mesosphere

mesosphere.zookeeper:
  pkg.installed:
    - name: mesosphere-zookeeper

mesosphere.zookeeper.config:
  file.managed:
    - name: /etc/zookeeper/conf/zoo.cfg
    - source: salt://mesosphere/templates/zoo.cfg.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: '0644'
    - defaults:
      servers: {{ servers }}


mesosphere.zookeeper.id:
  file.managed:
    - name: /var/lib/zookeeper/myid
    - contents: {{ server_id }}


mesosphere.zookeeper.service:
  service.running:
    - name: zookeeper

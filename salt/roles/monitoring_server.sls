monitoring_server.role:
  grains.present:
    - name: role
    - value: monitoring_server
    - force: True

include:
  - prometheus.server
  - grafana
  - grafana.config
  - grafana.apache
  - apache
  - apache.mod_ssl
  - apache.certificates

/var/lib/prometheus:
  file.directory:
    - user: prometheus
    - group: prometheus
    - dir_mode: '0755'

/opt/prometheus/targets.yaml:
  file.managed:
    - user: prometheus
    - group: prometheus
    - mode: '0644'
    - contents_pillar: prometheus:targets
    - allow_empty: True




public:
  firewalld.present:
    - name: public
    - ports:
      - 443/tcp


firewalld:
  service.running:
    - reload: True
    - watch:
      - firewalld: public


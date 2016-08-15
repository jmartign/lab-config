base_packages:
  pkg.installed:
    - pkgs: {{ salt['pillar.get']('base_packages', {}) }}

{{ salt['pillar.get']('selinux:mode', 'enforcing') }}:
  selinux.mode

include:
  - users
  - openssh
  - openssh.config
  - sudoers
  - salt.minion
  - hostsfile
  - prometheus.node_exporter

base.bash_profile:
  file.managed:
    - name: /etc/profile.d/zzcustom.sh
    - user: root
    - group: root
    - mode: '0644'
    - contents_pillar: bash:profile

{{ salt['pillar.get']('timezone', 'US/Central') }}:
  timezone.system:
    - utc: True

{% if salt['pillar.get']('system:root_password') %}
base.root_password:
  user.present:
    - name: root
    - password: {{ salt['pillar.get']('system:root_password') }}
{% endif %}

disable_wpa_supplicant:
  service.dead:
    - name: wpa_supplicant
    - enable: False



public:
  firewalld.present:
    - name: public
    - ports:
      - 9100/tcp

firewalld:
  service.running:
    - enable: True
    - watch:
      - firewalld: public


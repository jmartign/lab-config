base_packages:
  pkg.installed:
    - pkgs: {{ base_packages }}

{{ salt['pillar.get']('selinux:mode', 'enforcing') }}:
  selinux.mode

include:
  - users
  - openssh
  - openssh.config
  - sudoers
  - salt.minion
  - hostsfile

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

include:
  - users
  - openssh
  - openssh.config
  - sudoers
  - salt.minion
  - hostsfile

base.packages:
  pkg.installed:
    - pkgs:
      - vim-enhanced
      - git
      - tree
      - bind-utils
      - nmap-ncat

base.bash_profile:
  file.managed:
    - name: /etc/profile.d/zzcustom.sh
    - user: root
    - group: root
    - mode: 0644
    - contents_pillar: bash:profile

{{ salt['pillar.get']('timezone', 'US/Central') }}:
  timezone.system:
    - utc: True

base.root_password:
  user.present:
    - name: root
    - password: {{ salt['pillar.get']('system:root_password') }}

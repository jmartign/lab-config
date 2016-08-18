nfs-utils:
  pkg.installed: []

{%- for mount in salt['pillar.get']('nfs:mounts', []) %}
{{ mount.path }}:
  mount.mounted:
    - device: {{ mount.device }}
    - fstype: nfs
    - mkmnt: True
    - opts:
      - defaults
{%- endfor %}

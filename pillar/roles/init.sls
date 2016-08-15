{% set role = salt['grains.get']('role', 'UNK') %}

include:
  - roles.base
{%- if salt['file.file_exists']('/srv/pillar/roles/{0}.sls'.format(role)) %}
  - roles.{{ role }}
{%- endif %}

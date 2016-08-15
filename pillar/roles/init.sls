include:
  - roles.base
{% for role in salt['grains.get']('role', []) %}
{%- if salt['file.file_exists']('/srv/pillar/roles/{0}.sls'.format(role)) %}
  - roles.{{ role }}
{%- endif %}
{% endfor %}

{% for cert in salt['pillar.get']('apache:certificates', []) %}
apache.certificates.{{ cert.name }}:
  file.managed:
    - name: {{ cert.path }}
    - mode: '0600'
    - contents: |
        {{ cert.content | indent(8) }}
    - watch_in:
      - module: apache-restart
{% endfor %}

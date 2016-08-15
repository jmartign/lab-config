{% from "apache/map.jinja" import apache with context %}

apache.mod_speling:
  file.managed:
    - name: {{ apache.config_dir }}/mod_speling.conf
    - mode: '0644'
    - user: root
    - group: root
    - contents: |
        LoadModule speling_module modules/mod_speling.so
        CheckSpelling On

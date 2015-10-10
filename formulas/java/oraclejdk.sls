# Salt state to download and configure Oracle's version of JDK.

# Some sane defaults that can be overridden in Pillar.
{% set version_name = salt['pillar.get']('java:oraclejdk:version_name', 'jdk1.7.0_51') %}
{% set source = salt['pillar.get']('java:oraclejdk:source', 'http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.tar.gz') %}
{% set prefix = salt['pillar.get']('java:oraclejdk:prefix', '/usr/share/java') %}

{{ prefix }}:
  file.directory:
    - user: root
    - group: root
    - mode: '0755'
    - makedirs: True

java.oraclejdk:
  cmd.run:
    - name: curl -b oraclelicense=accept-securebackup-cookie -L '{{ source }}' | tar xz --no-same-owner
    - cwd: {{ prefix }}
    # If the directory exists, don't re-download the tarball
    - unless: test -d {{ prefix}}/{{ version_name }}
  file.symlink:
    - name: /usr/bin/java
    - target: {{ prefix }}/{{ version_name }}/bin/java
    - user: root
    - group: root
    - require:
      - file: {{ prefix }}

java.remove_openjdk:
  # Ensure OpenJDK is not installed and conflicting
  cmd.run:
    - name: rpm -qa |grep openjdk | xargs rpm -e --nodeps
    - onlyif: rpm -qa | grep openjdk

java.oraclejdk.env:
  file.managed:
    - name: /etc/profile.d/java.sh
    - user: root
    - group: root
    - mode: '0644'
    - contents: |
        export JAVA_HOME={{ prefix }}/{{ version_name }}
        export PATH=$JAVA_HOME/bin:$PATH

{% for extension, keys in salt['pillar.get']('java:extensions', {}).items() %}
{{ prefix }}/{{ version_name }}/jre/lib/ext/{{ extension }}:
  file.managed:
    - source: {{ keys['source'] }}
    {% if keys['source_hash'] is defined -%}
    - source_hash: {{ keys['source_hash'] }}
    {% endif %}
{% endfor %}

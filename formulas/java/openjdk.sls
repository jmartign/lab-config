{% set default_package = 'java-1.8.0-openjdk' %}

java:
  pkg.installed:
    - name: {{ salt['pillar.get']('java:openjdk:package', default_package) }}

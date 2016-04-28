include:
  - java.openjdk
  - apache
  - apache.mod_ssl
  - apache.certificates
  - jenkins
  - jenkins.apache


httpd_can_network_connect:
    selinux.boolean:
      - value: True
      - persist: True

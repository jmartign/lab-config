mesosphere_repo:
  pkg.installed:
    - sources:
      - mesosphere-el-repo: http://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm

mesosphere.firewalld:
  firewalld.present:
    - name: public
    - ports:
      - 1-65535/tcp
      - 5050/tcp
      - 5051/tcp
      - 8080/tcp
      - 2181/tcp
      - 2888/tcp
      - 3888/tcp

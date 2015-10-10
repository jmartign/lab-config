include:
  - java.openjdk
  - mesosphere.mesos
  - mesosphere.marathon
  - mesosphere.zookeeper

mesos-slave:
  service.dead:
    - enable: False

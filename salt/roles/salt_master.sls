salt_master.role:
  grains.present:
    - name: role
    - value: salt_master
    - force: True

include:
  - salt.master

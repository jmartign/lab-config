share:
  zpool.present:
    - config:
      import: True
      force: False
    - properties:
      comment: Gluster share pool
    - layout:
      mirror-0:
        /disk1
        /disk2
      mirror-1:
        /disk3
        /disk4

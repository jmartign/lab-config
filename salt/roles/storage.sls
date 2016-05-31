

zfs.repo:
   pkgrepo.managed:
    - name: zfs
    - humanname: ZFS on Linux for EL7
    - baseurl: http://archive.zfsonlinux.org/epel/7/kmod/$basearch/
    - gpgcheck: 0






include:
  - zfs

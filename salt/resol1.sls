resolver:
  ng:
    resolvconf:
      enabled: False
  nameservers:
    - 8.8.8.8
    - 8.8.4.4
  searchpaths:
    - internal
  options:
    - rotate
    - timeout:1
    - attempts:5

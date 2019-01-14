/etc/sysconfig/network-scripts/route-enp0s3:
  file.managed:
    - source: salt://routes/files/route-enp0s3
    - user: root
    - group: root
    - mode: 644
    - append_if_not_found: True
    - template: jinja
#    - watch:
#      - file: /etc/sysconfig/network-scripts/ifcfg-enp0s3

network_service:
  service.running:
    - name: network
    - enable: True
    - watch:
#      - file: /etc/sysconfig/network-scripts/ifcfg-enp0s3
      - file: /etc/sysconfig/network-scripts/route-enp0s3




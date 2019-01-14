sshd:
  service.running:
#    - name: sshd
#    -enable: True
    - reload: True
    - watch:
      - file: /etc/ssh/sshd_config
      - file: /etc/ssh/banner

banner_file:
  file.managed:
#   - source: salt://files/banner
   - source: /srv/salt/ssh/files/banner
   - name: /etc/ssh/banner
   - user: root
   - group: root
   - mode: 660

sshd_file:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: /srv/salt/ssh/files/sshd-config
    - user: root
    - group: root
    - mode: 644

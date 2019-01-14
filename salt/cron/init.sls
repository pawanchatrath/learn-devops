cron:
  file.managed:
    - source: salt://cron/files/root
    - name: /var/spool/cron/root
    - user: root
    - group: root
    - mode: 644
    - template: jinja

service:
  service.running:
    - name: crond
    - enable: True
    - watch: 
      - file: /var/spool/cron/root

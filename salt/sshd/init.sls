sshd_config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://sshd/templates/sshd_config
    - user: root
    - mode: 644
    - group: root

stop_sshd:
  service.dead:
    - name: sshd
    
start_sshd:
  service.running:
    - name: sshd
    - require:
      - service: stop_sshd 

install_nagios:
  pkg.installed:
    - pkgs:
      - nagios
    - service: enabled

resource_cfg:
  file.replace:
    - name: /usr/local/nagios/etc/resource.cfg
    - pattern: $$USER30$=.*
    - repl: $USER30$=10.244.24.65
    - append_if_not_found: True
    - watch_in:
      - service: nagios_service

check_nfs_mount:
  file.managed:
    - source: /srv/salt/nagios/files/check_nfs_mounts.pl
    - name: /usr/local/nagios/libexec/check_nfs_mounts.pl
    - user: nagios
    - group: nagios
    - mode: 755
#    - require: 
#      - pkg: nagios
#    - name: /usr/local/nagios/libexec/check_nfs_mounts.pl
#      - text: |
#        - "define command{"
#        - "command_name    check_nfs_mounts"
#        - "command_line    $USER1$/check_nfs_mounts.pl"
#        - "}"

nagios_service:
  service.running:
    - name: nagios

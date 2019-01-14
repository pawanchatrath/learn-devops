beacons:
  inotify:
    disable_during_state_run: True
    /etc/ssh/sshd_conf:
      mask: 
        - modify
        - open
        - close_write
#      recurse: True
#      auto_add: True

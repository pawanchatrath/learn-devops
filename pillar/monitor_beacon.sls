beacons:
  inotify:
  disable_during_state_run: True
  /etc/rsyslog.conf:
    mask:
      - close_write
      - open
      - modify

ssh_auth.present:
      - user: pin
      - source: salt://authorize/files/authorized_keys
      - config: '%h/.ssh/authorized_keys'

users_add:
  user.present:
    - name: pin1
    - home: /home/pin1
    - shell: /bin/bash
    - groups:
      - sudo

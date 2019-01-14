user_paw:
  user.present:
    - name: pawan
    - fullname: pawan singh
    - shell: /bin/csh
    - home: /home/pawan
    - uid: 10000
    - gid_from_name: True
    - groups:
      - test

pawan_key:
  ssh_auth.present:
    - name: pawan
    - user: pawan
    - source: salt://online_ali/users/keys/pawan_key.pub
      

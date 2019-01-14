/etc/resolv.conf:
  file.append:
#    - filename: /etc/resolv.conf
    - text: 
      - "domain qa.shared-bo.mtv1.vrsn.com"
      - "nameserver 10.198.138.20"
      - "nameserver 10.198.138.21"

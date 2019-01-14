{% set hostname = grains.id.split('.')[0] %}
set_hostname:
  cmd.run:
    - name: "hostnamectl set-hostname {{ hostname }}.{{ grains.domain }}"

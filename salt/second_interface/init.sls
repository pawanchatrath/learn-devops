replace:
  cmd.run:
    - name: cp -pr /var/tmp/test/ifcfg-enp0s3 /var/tmp/test/ifcfg-enp0s8 


hw:
  file.replace:
    - name: /var/tmp/test/ifcfg-enp0s8
    - pattern: HWADDR=
    - repl: HWADDR= {{ grains['hwaddr_interfaces']['enp0s8'] }}
    - append_if_not_found: True

{% if grains.zone == 'stage' %}
hw1:
  file.replace:
    - name: /var/tmp/test/ifcfg-enp0s8
    - pattern: '194' 
    - repl: '197'
#    - append_if_not_found: True
#    - template: jinja
{% endif %}

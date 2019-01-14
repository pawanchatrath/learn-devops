/etc/sysconfig/network-scripts/ifcfg-enp0s8:
  file.replace:
    - name: /etc/sysconfig/network-scripts/ifcfg-ifcfg-enp0s8
    - pattern: DOMAIN=.*
    - append_if_not_found: True
    {% if grains.ip4_interfaces.ifcfg-enp0s8 == "192.168.99"  %}
    - repl: DOMAIN="qa.shared-bo.mtv1.vrsn.com"
    {% elif grains.ip4_interfaces.ifcfg-enp0s8 == "10.198.138"  %}
    - repl: DOMAIN="shared-bo.mtv1.vrsn.com"
    {% endif %}

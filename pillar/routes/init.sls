{% if ('dev' in grains['zone'] or 'qa' in grains['zone']) %}
   route: 10.0.0.0 via 192.168.99.2
{% else %}
  route: 10.0.0.0 via 192.168.99.3
{% endif %}

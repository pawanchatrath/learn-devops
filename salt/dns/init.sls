{% from salt.cp.cache_file('salt://dns/map.jinja') import excluded_ifaces, base_domain, dns_servers %}
{% for iface, addrs in grains.ip4_interfaces.iteritems() %}
  {% if iface not in excluded_ifaces %}
    {% if addrs[0] is defined %}
add_dns_search_{{ iface }}:
  file.replace:
    - name: /etc/sysconfig/network-scripts/ifcfg-{{ iface }}
    - pattern: DOMAIN=.*
    - append_if_not_found: True
#    - repl: DOMAIN="{{ grains.zone }}.{{ base_domain}}"
    - repl: DOMAIN="{{ base_domain }}"
#    - repl: DOMAIN="{{ grains.zone }}.{{ base_domain }} {{ base_domain }}"
#    - repl: DOMAIN="{{ grains.zone }}.{{ base_domain }}"


      {% for server, addr in dns_servers.items() %}
change_dns_servers_{{ iface }}_{{ server }}:
# Add to network config for permanent use
  file.replace:
    - name: /etc/sysconfig/network-scripts/ifcfg-{{ iface }}
    - pattern: {{ server }}=.*
    - append_if_not_found: True
    - repl: {{ server }}="{{ addr}}"

#  cmd.run:
#    - name: sed -i -- 's/nameserver.*/nameserver {{ addr}}/g' /etc/resolv.conf


# Apply to resolve.conf for immediate use
#add_dns_search_resolvconf:
#  cmd.run:
#    - name: sed -i -- 's/search.*/search {{ base_domain }} /g' /etc/resolv.conf
#    - unless: grep "search {{ base_domain }}" /etc/resolv.conf

      {% endfor %}
    {% endif %}
  {% endif %}
{% endfor %}

#add_dns_search_resolvconf:
#  cmd.run:
#    - name: sed -i -- 's/search.*/search {{ base_domain }} /g' /etc/resolv.conf
#    - unless: grep "search {{ base_domain }}" /etc/resolv.conf
#    - name: sed -i -- 's/nameserver.*/nameserver {{ addr }} /g' /etc/resolv.conf
#    - unless: grep "nameserver{{ addr }}" /etc/resolv.conf

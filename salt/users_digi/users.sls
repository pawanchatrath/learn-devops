{% for user, args in pillar['users'].iteritems() %}
{{ user }}:
#  group.present:
#    - gid: {{ args['gid'] }}#
  user.present:
    - fullname: {{ args['fullname'] }}`
    - home: {{ args['home'] }}
    - shell: {{ args['shell'] }}
    - uid: {{ args['uid'] }}
    - gid: {{ args['gid'] }}
{% if 'password' in args %}
    - password: {{ args['password'] }}
{% if 'enforce_password' in args %}
    - enforce_password: {{ args['enforce_password'] }}
  ssh_auth.present:
      - user: {{ user }}
      - source: salt://users_digi/files/authorized_keys
      - config: '%h/.ssh/authorized_keys'
{% endif %}
{% endif %}

#{{ user }}_clean_keys:
#  file.absent:
#    - name: /home/{{ user }}/.ssh/authorized_keys
#
#  {% if args.ssh_keys %}
#{{ user }}_create_keys:
#  ssh_auth.present:
#    - user: {{ user }}
#    - names:
#      - {{ ssh_keys }}
#{% endif %}

#    - require:
#      - group: {{ user }}

{% endfor %}

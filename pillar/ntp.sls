ntp:
  # If This Is shared-bo #
  {% if grains['zone'] == 'stage' %}
  10.198.135.1
  # If Not, Must Be qa-bo #
  {% elif grains['zone'] == 'qa' %}
  localnetworks: ["10.1.4.0","10.1.5.0","10.1.6.0"]
  {% else %}
  10.204.24.1
  {% endif %}

{% if ('stage' in grains['zone'] or 'qa' in grains['zone']) %}
   mails: mailhub
{% else %}
  mails: mx.qa.shared-bo.mtv1.vrsn.com
{% endif %}

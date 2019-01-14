{% if ('dev' in grains['zone']) %}
   crons: |
     #16 23 * * mon /usr/local/bin/edc_notify.sh > /tmp/edc_np.err 2>&1 
     #05 22 * * mon /usr/local/bin/capacity.sh > /tmp/edc_dd 2>&1
{% elif ('qa' in grains['zone']) %}
   crons: "#16 22 * * mon /usr/local/bin/notify_cap.sh > /tmp/edc_dd.err 2>&1"
{% else %}
   crons: "#05 22 * * mon /usr/local/bin/capacity.sh > /tmp/edc_dd 2>&1"
{% endif %}

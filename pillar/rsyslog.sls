rsyslog:
  {% if grains['zone'] == 'stage' %}
  target: 10.198.138.1                   # omit if you do not want to forward logs
  {% elif grains['zone'] == 'qa' %}
  target: 10.204.24.1
  {% else %}
  target: 10.204.152.1
  {% endif %}
                                        # NOTE: be careful using target and listen on
                                          # the same server, you can cause a loop
  protocol: udp                           # protocol to use to send to target
  listentcp: true                         # omit to disable listening on tcp port
  listentcpprt: 10514                     # specify tcp listen port ($InputTCPServerRun)
  listenudp: true                         # omit to disable listening on udp port
  imkllog: true                           # omit to log kernel messages
  imjournal: false                        # omit to log journal messages
  immark: false                           # enable/disable mark messages support
  markmessageperiod: 1200                 # Specifies when mark messages are written (seconds)
  logbasepath: /mnt/logs                  # base path for logs to be saved to
                                          # also enables logging per host, per day
  fileowner: root                         # set the owner of the logfiles
  filegroup: root                         # set the group of the logfiles
  filemode: '0640'                        # mode for created log files
  dirmode: '0755'                         # mode for dirs created in log file paths
  template: 'RSYSLOG_FileFormat'          # file default template

#  custom:                                 # Put custom config files in /etc/rsyslog.d/.
#    - 001_custom1.conf                    # Files must be reachable from path `salt://rsyslog/`
#    - salt://some_other/002_custom2.conf  # Or with an absolute path.
                                          # The default is to include `salt://rsyslog/files/50-default.conf`.
                                          # If you change the custom conf dict, make sure to
                                          # include the 50-default.conf as well if needed.

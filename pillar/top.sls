base:
  '*':
    - mails
    - headers
    - ntp
    - rsyslog
    - monitor_beacon
    - beacons.beacons
    - routes
    - cron
    - users_digi.groups
    - users_digi.users
    - users_digi

  'centos7_clt_min':
    - users
    - cltmin

  'centos7_mstr_min':
    - cltmas

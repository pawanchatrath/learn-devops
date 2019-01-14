{% if 'dev' in grains.zone or 'a' in grains.zone %}
sendmail:
  pkg.removed:
    - names:
       - mailx
       - postfix
       - ssmtp
{% endif %}

mail1:
  pkg.installed:
    - names:
       - sendmail

sendmail.cf:
  file.managed:
    - source: salt://sendmail/files/sendmail.cf
    - name: /etc/mail/sendmail.cf
    - user: root
    - group: root
    - mode: 644
    - template: jinja

submit.cf:
  file.managed:
    - source: salt://sendmail/files/submit.cf
    - name: /etc/mail/submit.cf
    - user: root
    - group: root
    - mode: 644
    - template: jinja

service:
  service.running:
    - name: sendmail
    - enable: True
    - watch:
      - file: /etc/mail/sendmail.cf
      - file: /etc/mail/submit.cf


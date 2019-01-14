enforce_salt_config:
  local.state.apply:
    - tgt: {{ data['data']['id'] }}
    - arg:
      - sshd

# -*- coding: utf-8 -*-
# vim: ft=yaml
---

configure_sudoers_defaults:
  file.managed:
    - name: /etc/sudoers.d/00-defaults
    - contents:
      - '# This file is managed by Salt. Do not edit.'
      - Defaults use_pty
      - Defaults logfile=/var/log/sudo.log
      - Defaults timestamp_timeout=15
    - check_cmd: 'visudo -c -f'
# -*- coding: utf-8 -*-
# vim: ft=yaml
# ensure the desginated account exists and has sudo rights
---
admin_user:
  user.present:
    - name: {{ pillar['user']['username'] }}
    - optional_groups:
      - sudo
      - wheel
    - remove_groups: false
    - password: {{ pillar['user']['passwd_hash'] }}
    - require:
      - pkg: sudo

admin_user_ssh:
  ssh_auth.present:
    - user: {{ pillar['user']['username'] }}
    - names:
      - {{ pillar['user']['ssh_key'] }}
    - require:
      - user: admin_user


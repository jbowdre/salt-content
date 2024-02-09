# -*- coding: utf-8 -*-
# vim: ft=yaml
---
session_timeout:
  file.managed:
    - name: /etc/profile.d/tmout.sh
    - user: root
    - group: root
    - mode: 644
    - contents:
      {% if grains['os_family'] == 'RedHat' %}
        - 'declare -xr TMOUT=900'
      {% elif grains['os_family'] == 'Debian' %}
        - 'TMOUT=900'
        - 'readonly TMOUT'
        - 'export TMOUT'
      {% endif %}

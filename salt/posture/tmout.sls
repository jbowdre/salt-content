# -*- coding: utf-8 -*-
# vim: ft=yaml
---

{% from "./map.jinja" import session_timeout %}

session_timeout:
  file.managed:
    - name: /etc/profile.d/tmout.sh
    - user: root
    - group: root
    - mode: 644
    - contents:
      {% if grains['os_family'] == 'RedHat' %}
        - declare -xr TMOUT={{ session_timeout }}
      {% elif grains['os_family'] == 'Debian' %}
        - TMOUT={{ session_timeout }}
        - readonly TMOUT
        - export TMOUT
      {% endif %}

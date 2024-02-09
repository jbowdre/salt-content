# -*- coding: utf-8 -*-
# vim: ft=yaml
---
{% from "./map.jinja" import sysctl %}

sysctl_parameters:
  file.managed:
    - name: /etc/sysctl.d/99-hardening.conf
    - user: root
    - group: root
    - mode: 644
    - contents:
      - '# This file is managed by Salt. Do not edit.'
      {% for param in sysctl.params %}
      - '{{ param }}'
      {% endfor %}

sysctl_reload:
  cmd.run:
    - name: sysctl -p /etc/sysctl.d/99-hardening.conf
    - onchanges:
      - file: /etc/sysctl.d/99-hardening.conf
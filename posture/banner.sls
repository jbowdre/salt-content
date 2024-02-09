# -*- coding: utf-8 -*-
# vim: ft=yaml
---
{% from "./map.jinja" import banner %}

logon_banner_text:
  file.managed:
    - name: /etc/issue
    - user: root
    - group: root
    - mode: 644
    - contents:
      - '\S'
      - 'Kernel \r on an \m'
      - ' '
      - {{ banner | yaml_encode }}
      - ' '

remote_banner_text:
  file.managed:
    - name: /etc/issue.net
    - user: root
    - group: root
    - mode: 644
    - contents:
      - {{ banner | yaml_encode }}
      - ' '


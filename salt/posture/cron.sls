# -*- coding: utf-8 -*-
# vim: ft=yaml
---

{% from "./map.jinja" import cron %}

{% for dir in cron.dirs %}
{{ dir }}_permissions:
  file.directory:
    - name: /etc/{{ dir}}
    - user: root
    - group: root
    - dir_mode: 700
    - file_mode: 0600
    - recurse:
      - user
      - group
      - mode
{% endfor %}

crontab_permissions:
  file.managed:
    - name: /etc/crontab
    - user: root
    - group: root
    - mode: 0600
# -*- coding: utf-8 -*-
# vim: ft=yaml
---

{% from "./map.jinja" import umask %}

default_umask:
  file.replace:
    - name: /etc/login.defs
    - pattern: '^\s*UMASK\s+\d{3}'
    - repl: UMASK {{ umask.value }}
    - append_if_not_found: True

{% for file in umask.files %}
{{ file }}_umask:
  file.replace:
    - name: {{ file }}
    - pattern: '^\s*umask\s+\d{3}'
    - repl: umask {{ umask.value }}
    - append_if_not_found: True
    - ignore_if_missing: True
{% endfor %}

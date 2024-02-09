# -*- coding: utf-8 -*-
# vim: ft=yaml
---

{% from "./map.jinja" import sshd %}

sshd_include_dir:
  file.directory:
    - name: /etc/ssh/sshd_config.d
    - user: root
    - group: root
    - mode: 755

sshd_config_include:
  file.append:
    - name: /etc/ssh/sshd_config
    - text: 'Include /etc/ssh/sshd_config.d/*.conf'
    - require:
      - file: sshd_include_dir

sshd_config_perms:
  file.managed:
    - name: /etc/ssh/sshd_config
    - user: root
    - group: root
    - mode: 600

sshd_posture:
  file.managed:
    - name: /etc/ssh/sshd_config.d/99-posture.conf
    - user: root
    - group: root
    - mode: 600
    - contents:
      - '# This file is managed by Salt. Do not edit.'
      {% for config in sshd.configs %}
      - '{{ config }}'
      {% endfor %}



sshd_service_running:
  service.running:
    - name: sshd
    - enable: True
    - watch:
      - file: sshd_posture
      - file: sshd_config_perms

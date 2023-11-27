# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "onedir/map.jinja" import salt_settings with context %}

{% if grains['saltversion'] < '3006' %}

{% if grains['os_family']|lower == 'debian' %}
Upgrade Debian minion:
  file.managed:
    - name: /root/upgrade-minion.sh
    - source: salt://onedir/scripts/debian.sh
    - user: root
    - group: root
    - mode: 700
  cmd.run:
    - name: /root/upgrade-minion.sh
    - bg: True
    - reload_modules: True
    - require:
      - file: /root/upgrade-minion.sh
{% elif grains['os_family']|lower == 'redhat' %}
Upgrade RedHat minion:
  file.managed:
    - name: /root/upgrade-minion.sh
    - source: salt://onedir/scripts/redhat.sh
    - user: root
    - group: root
    - mode: 700
  cmd.run:
    - name: /root/upgrade-minion.sh
    - bg: True
    - reload_modules: True
    - require:
      - file: /root/upgrade-minion.sh
{%- endif %}
{%- endif %}



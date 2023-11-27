# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "minion-upgrade/map.jinja" import salt_settings with context %}

{%- if salt_settings.pkgrepo %}
include:
  - .{{ grains['os_family']|lower }}
{%- endif %}
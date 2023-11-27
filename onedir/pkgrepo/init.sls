# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "onedir/map.jinja" import salt_settings with context %}

{%- if salt_settings.pkgrepo %}
include:
  - .{{ grains['os_family']|lower }}
{%- endif %}
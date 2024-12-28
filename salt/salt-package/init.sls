# -*- coding: utf-8 -*-
# vim: ft=sls
---

include:
  - .{{ grains['os_family']|lower }}-repo.sls
{%- endif %}

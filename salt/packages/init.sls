# -*- coding: utf-8 -*-
# vim: ft=yaml
# install packages defined in pillar
---

{% set packages = salt['pillar.get']('global_packages', []) %}

install_packages:
  pkg.installed:
    - pkgs: {{ packages }}

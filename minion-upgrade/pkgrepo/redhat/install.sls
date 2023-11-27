# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "minion-upgrade/map.jinja" import salt_settings with context %}

salt-pkgrepo-install-saltstack-redhat:
  pkgrepo.managed:
    - name: {{ salt_settings.pkgrepo_name }}
    - humanname: {{ salt_settings.pkgrepo_humanname }}
    - baseurl: {{ salt_settings.pkgrepo }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: {{ salt_settings.key_url }}

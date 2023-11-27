# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "onedir/map.jinja" import salt_settings with context %}

{% if grains['saltversion'] < '3006' %}
salt-pkgrepo-install-saltstack-debian-keyring:
  file.managed:
    - name: /usr/share/keyrings/salt-archive-keyring-2023.gpg
    - source: {{ salt_settings.pkgrepo_keyring }}
    - source_hash: {{ salt_settings.pkgrepo_keyring_hash }}
    - require_in:
      - pkgrepo: salt-pkgrepo-install-saltstack-debian

salt-pkgrepo-install-saltstack-debian-remove-old-repo-file:
  file.absent:
    - name: /etc/apt/sources.list.d/salt.list
    - require_in:
      - pkgrepo: salt-pkgrepo-install-saltstack-debian

salt-pkgrepo-install-saltstack-debian:
  pkgrepo.managed:
    - humanname: SaltStack Debian Repository
    - name: {{ salt_settings.pkgrepo }}
    - file: /etc/apt/sources.list.d/salt.list
    {% if salt_settings.get('key_url') is not none %}
    - key_url: {{ salt_settings.key_url }}
    {% endif %}
    - clean_file: True
    - order: 3
{% endif %}
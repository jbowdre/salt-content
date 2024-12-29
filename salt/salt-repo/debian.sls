# -*- coding: utf-8 -*-
# vim: ft=sls
---

salt-pkgrepo-keyring-dir
  file.directory:
    - name: /etc/apt/keyrings
    - user: root
    - group: root
    - mode: 755

salt-pkgrepo-install-keyring:
  file.managed:
    - name: /etc/apt/keyrings/salt-archive-keyring.pgp
    - source: salt://salt-repo/files/salt-archive-keyring.pgp
    - mode: 644
    - require_in:
      - file: salt-pkgrepo-install-saltstack-debian

salt-pkgrepo-remove-old-repo-file:
  file.absent:
    - name: /etc/apt/sources.list.d/salt.list
    - require_in:
      - file: salt-pkgrepo-install-saltstack-debian

salt-pkgrepo-pin-versions:
  file.managed:
    - name: /etc/apt/preferences.d/salt-pin-1001
    - source: salt://salt-repo/files/salt-pin-1001
    - mode: 644
    - require_in:
      - file: salt-pkgrepo-install-saltstack-debian

salt-pkgrepo-install-saltstack-debian:
  file.managed:
    - name: /etc/apt/sources.list.d/salt.sources
    - source: salt://salt-repo/files/salt.sources
    - mode: 644


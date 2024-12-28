# -*- coding: utf-8 -*-
# vim: ft=sls
---

salt-pkgrepo-install-keyring:
  file.managed:
    - name: /etc/apt/keyrings/salt-archive-keyring.pgp
    - source: salt://dev/salt-package/files/salt-archive-keyring.pgp
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
    - source: salt://dev/salt-package/files/salt-pin-1001
    - mode: 644
    - require_in:
      - file: salt-pkgrepo-install-saltstack-debian

salt-pkgrepo-install-saltstack-debian:
  file.managed:
    - name: /etc/apt/sources.list.d/salt.sources
    - source: salt://dev/salt-package/files/salt.sources
    - mode: 644


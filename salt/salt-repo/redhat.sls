# -*- coding: utf-8 -*-
# vim: ft=sls
---

salt-pkgrepo-install-saltstack-redhat:
  file.managed:
    - name: /etc/yum.repos.d/salt.repo
    - source: salt://salt-repo/files/salt.repo
    - mode: 644


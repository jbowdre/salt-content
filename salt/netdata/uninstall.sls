# -*- coding: utf-8 -*-
# vim: ft=sls
---

curl:
  pkg.installed

netdata-uninstall:
  cmd.run:
    - name: curl -Ss https://get.netdata.cloud/kickstart.sh | sh -s -- --uninstall
    - require:
      - pkg: curl

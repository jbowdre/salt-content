# -*- coding: utf-8 -*-
# vim: ft=sls
# State to upgrade salt minions to the latest onedir version
---

include:
  - minion-upgrade.pkgrepo
  - minion-upgrade.minion
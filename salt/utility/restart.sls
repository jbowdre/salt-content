# -*- coding: utf-8 -*-
# vim: ft=sls
# bounce the targeted salt-minion
---
test:
  test.succeed_with_changes

salt-minion:
  cmd.run:
    - name: 'sleep 10; salt-call service.restart salt-minion'
    - bg: True
    - reload_modules: True
    - onchanges:
      - test: test

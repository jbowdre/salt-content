# -*- coding: utf-8 -*-
# vim: ft=yaml
# States to apply *extremely basic* security posture.
---
include:
  - .banner
  - .cron
  - .sshd
  - .sudoers
  - .sysctl
  - .tmout
  - .umask
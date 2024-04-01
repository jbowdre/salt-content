# -*- coding: utf-8 -*-
# vim: ft=yaml
# State to use ntfy.sh to send notifications when a salt minion has finished booting
---

ntfy_push:
  file.managed:
    - name: /usr/local/bin/ntfy_push.sh
    - source: salt://ntfy/files/ntfy_push.sh
    - template: jinja
    - user: root
    - group: root
    - mode: 755
    - context:
        ntfy_url: {{ pillar['ntfy']['url'] }}
        ntfy_token: {{ pillar['ntfy']['token'] }}

ntfy_boot_complete:
  file.managed:
    - name: /usr/local/bin/ntfy_boot_complete.sh
    - source: salt://ntfy/files/ntfy_boot_complete.sh
    - user: root
    - group: root
    - mode: 755

ntfy_boot_complete_service_definition:
  file.managed:
    - name: /etc/systemd/system/ntfy_boot_complete.service
    - source: salt://ntfy/files/ntfy_boot_complete.service
    - user: root
    - group: root
    - mode: 644

ntfy_boot_complete_service:
  service.enabled:
    - name: ntfy_boot_complete
    - enable: True
    - unmask: True


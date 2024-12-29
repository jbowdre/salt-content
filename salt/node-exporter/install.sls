# -*- coding: utf-8 -*-
# vim: ft=sls
---

node-exporter-package:
  pkg.installed:
    - name: prometheus-node-exporter

node-exporter-service:
  service.running:
    - name: prometheus-node-exporter
    - enable: True
    require:
      - pkg: node-exporter-package



# -*-  coding: utf-8 -*-
# vim: ft=sls
---
{% if grains['os_family'] == 'Debian' %}
apt_clean:
  cmd.run:
    - name: apt-get clean -y

apt_oldpkgs:
  cmd.run:
    - name: apt-get autoremove -y
{% endif %}



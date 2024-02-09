# -*- coding: utf-8 -*-
# vim: ft=sls
# Hasty Salt config to install Netdata and make it available within a Tailscale tailnet
# at https://[hostname].[tailnet-name].ts.net:8443/netdata
# NOTE: Tailscale must already be installed and logged in
---

curl:
  pkg.installed

tailscale:
  pkg.installed:
    - version: latest

netdata-kickstart:
  cmd.run:
    - name: curl -Ss https://get.netdata.cloud/kickstart.sh | sh -s -- --dont-wait
    - require:
      - pkg: curl
    - unless: pgrep netdata

tailscale-serve:
  cmd.run:
    - name: tailscale serve --bg --https 8443 --set-path /netdata 19999
    - require:
      - pkg: tailscale
      - cmd: netdata-kickstart
    - unless: tailscale serve status | grep -q '/netdata proxy http://127.0.0.1:19999'

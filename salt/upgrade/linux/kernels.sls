---
install-latest-kernel:
  kernelpkg.latest_installed: []

boot-latest-kernel:
  kernelpkg.latest_active:
    - at_time: 1
    - onchanges:
      - kernelpkg: install-latest-kernel


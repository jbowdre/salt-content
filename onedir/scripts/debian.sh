#!/usr/bin/env bash
set -eu

# This script is used to upgrade the salt-minion on a minion node.

# Prevent the salt-minion from (re)starting during the upgrade process.
# cat << EOF > /usr/sbin/policy-rc.d
# #!/bin/sh
# exit 101
# EOF
# chmod 0755 /usr/sbin/policy-rc.d

# Upgrade the salt-minion package.
salt-call --local pkg.install only_upgrade=True salt-minion

# Wait a bit
sleep 15

# Remove the policy-rc.d file.
# rm -f /usr/sbin/policy-rc.d

# Restart the salt-minion service
systemctl restart salt-minion

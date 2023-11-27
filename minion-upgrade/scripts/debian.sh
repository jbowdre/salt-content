#!/usr/bin/env bash
set -eu

# This script is used to upgrade the salt-minion on a minion node.

# Upgrade the salt-minion package.
salt-call --local pkg.install only_upgrade=True salt-minion

# Wait a bit
sleep 15

# Restart the salt-minion service
systemctl restart salt-minion

# Clean up
rm -- "$0"

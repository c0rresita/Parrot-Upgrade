#!/bin/bash
set -e
DEBIAN_FRONTEND="noninteractive"
DEBIAN_PRIORITY="critical"
DEBCONF_NOWARNINGS="yes"
export DEBIAN_FRONTEND DEBIAN_PRIORITY DEBCONF_NOWARNINGS
apt update || echo failed to update index lists
dpkg --configure -a || echo failed to fix interrupted upgrades
apt --fix-broken --fix-missing install || echo failed to fix conflicts
apt -y --allow-downgrades --fix-broken --fix-missing dist-upgrade
apt -y autoremove
apt -y clean autoclean
d
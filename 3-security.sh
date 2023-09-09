#!/usr/bin/env bash

# This is supposed to help secure the system.
# Run this when logged in as root; not via chroot.

echo "-------------------------------------------------"
echo "Secure Linux                                     "
echo "-------------------------------------------------"

# --- Setup UFW rules
ufw allow 80/tcp
ufw allow 443/tcp
ufw default deny incoming
ufw default allow outgoing
ufw enable

# --- Harden /etc/sysctl.conf -- We have no clue what this does so it's disabled for now.
#sysctl kernel.modules_disabled=1
#sysctl -a
#sysctl -A
#sysctl mib
#sysctl net.ipv4.conf.all.rp_filter
#sysctl -a --pattern 'net.ipv4.conf.(eth|wlan)0.arp'

# --- PREVENT IP SPOOFS
cat <<EOF > /etc/host.conf
order bind,hosts
multi on
EOF

# --- Enable ufw
systemctl enable ufw
systemctl start ufw

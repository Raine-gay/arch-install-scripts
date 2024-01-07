#!/usr/bin/env bash

# Disable all Power Saving Stuff
xset -dpms
xset s off

# Larger font for the login shell
cat <<EOF > /etc/vconsole.conf
KEYMAP=us
FONT=ter-v16b
EOF

# Networking services
#ntpd -qg
systemctl enable --now ntpd.service
systemctl disable --now dhcpcd.service
systemctl disable --now ssh.service
systemctl enable --now NetworkManager.service
timedatectl --no-ask-password set-ntp 1 # This seems broken.

# Enable nix-daemon
systemctl --now enable nix-daemon.service
echo "max-jobs = auto" >> /etc/nix/nix.conf # Allows nixjobs to use full cpu.

# Enable pacman cache cleaning
systemctl enable --now paccache.timer

# Setup the system-update usergroup and add it to sudoers.
groupadd system-update
echo "%system-update ALL = /usr/sbin/pacman -Syu" >> /etc/sudoers
echo "Defaults        env_reset,timestamp_timeout=60" >> /etc/sudoers

# Enable bluetooth.
systemctl enable --now bluetooth.service

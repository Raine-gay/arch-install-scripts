#!/usr/bin/env bash

# Disable all Power Saving Stuff
xset -dpms
xset s off

# Larger font for the login shell
cat <<EOF > /etc/vconsole.conf
KEYMAP=us
FONT=ter-v32b
EOF

# Networking services
ntpd -qg
systemctl enable ntpd.service
systemctl disable dhcpcd.service
systemctl disable ssh.service
systemctl enable NetworkManager.service
timedatectl --no-ask-password set-ntp 1

# Enable nix-daemon
systemctl enable nix-daemon.service
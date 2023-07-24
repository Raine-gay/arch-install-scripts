#!/usr/bin/env bash

# This sets the base system up for package installs.

echo "Enter hostname:"
read hostname
echo $hostname >> /etc/hostname

# Some CPU shit, Fuck if we know what it does. (We kinda do.)
nc=$(grep -c ^processor /proc/cpuinfo)
echo "You have " $nc" cores."
echo "-------------------------------------------------"
echo "Changing the makeflags for "$nc" cores."
sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j16"/g' /etc/makepkg.conf
echo "Changing the compression settings for "$nc" cores."
sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T 16 -z -)/g' /etc/makepkg.conf

# Set locales:
sed -i 's/^#en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_GB.UTF-8" >> /etc/locale.conf

# Timezone crap.
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc

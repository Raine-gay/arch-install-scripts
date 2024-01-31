#!/usr/bin/env bash

# This installs much needed software onto the base system.

echo
echo "Installing Base System"
echo

PKGS=(
    # --- XORG Display Rendering. We are still xorg sluts at heart.
        'xorg'                      # Base Package
        'xorg-drivers'              # Display Drivers 
        'xterm'                     # Terminal for TTY
        'xorg-server'               # XOrg server
        'xorg-apps'                 # XOrg apps group
        'xorg-xinit'                # XOrg init
        'xorg-xinput'               # XOrg xinput

    # --- Setup Desktop
        'xfce4'                     # xfce4 desktop
        'xfce4-goodies'             # xfce4 goodies E.G whiskermenu
        'xfce4-power-manager'       # Power Manager
        'polkit'                    # Elevate Applications
        'xarchiver'                 # linux winrar.
        'gnome-disk-utility'        # disk management.
        'xfburn'                    # cd burning utility.
        'seahorse'                  # Gnome keyring gui
        'gnome-font-viewer'         # Gnome font crap
        'webp-pixbuf-loader'        # Display webp image thumbnails
        'xdg-desktop-portal-gtk'    # A requirement of discover & flatpak.
        'vlc'                       # VLC media player.
        
    # --- System Crap
        'nix'                       # nix addict moment
        'gvfs'                      # recycle bin n crap
        'gvfs-mtp'                  # phone support
        'android-file-transfer'     # mount android file systems
        'ntfs-3g'                   # linux support for ntfs
        'btrfs-progs'               # for some reason this sometimes dosen't get installed
        'compsize'                  # calculate btrfs compression ratios
        'zip'                       # zip file crap
        'p7zip'                     # more zip file crap
        'ntp'                       # Network Time Protocol to set time via network.
        'numlockx'                  # Turns on numlock in X11
        'unrar'                     # RAR compression program
        'unzip'                     # Zip compression program
        'zsh'                       # Interactive shell
        'gst-libav'                 # for parole media player
        'gst-plugins-bad'           # for parole media player
        'gst-plugins-ugly'          # for parole media player
        'pacman-contrib'            # provides paccache cleaning crap
        'cups'                      # Printer moment
        'ffmpegthumbnailer'         # Video thumbnails
        'grub'                      # Boot manager
        'efibootmgr'                # Grub stuff
        'sqlite'                    # One file relational SQL database
        'arch-install-scripts'      # arch install tools like pacstrap, & arch-chroot.

    # --- Networking Setup
        'dialog'                    # Enables shell scripts to trigger dialog boxex
        'networkmanager'            # Network connection manager
        'openvpn'                   # Open VPN support
        'networkmanager-openvpn'    # Open VPN plugin for NM
        'network-manager-applet'    # System tray icon/utility for network connectivity
        'dhclient'                  # DHCP client
        'libsecret'                 # Library for storing passwords
        'ufw'                       # Uncomplicated firewall
        'gufw'                      # Firewall GUI manager
        'wireguard-tools'           # wireguard vpn
        'fail2ban'                  # Prevent brute force attacks over SSH
    
    # --- Audio
        'pipewire'                  # pipewire audio crap
        'wireplumber'               # more pipewire audio crap
        'pipewire-pulse'            # pulseaudio integration.
        'pipewire-alsa'             # alsa support
        'pipewire-jack'             # some jack shit, no clue.
        'pavucontrol'               # audio control gui thingy

    # --- Bluetooth
        'bluez'                     # Daemons for the bluetooth protocol stack
        'bluez-utils'               # Bluetooth development and debugging utilities
        'bluez-libs'                # Bluetooth libraries
        'bluez-firmware'            # Firmware for Broadcom BCM203x and STLC2300 Bluetooth chips
        'blueman'                   # Bluetooth configuration tool
    
    # --- Fonts
        'noto-fonts'                # 730mb of fonts. Ouch.
        'noto-fonts-cjk' 
        'noto-fonts-emoji' 
        'noto-fonts-extra'
        'cantarell-fonts'
        'terminus-font'             # Needed to avoid systemd-vconsole startup errors with missing font files
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    pacman -S "$PKG" --noconfirm --needed
done

echo
echo "Done!"
echo "Remember to install graphics drivers if needed! (You can find them in the arch wiki xorg page.)"
echo "Fuck you nvidia."
echo "DO NOT USE LINUX-ZEN on nvidia machines. Please for the love of sin, do not fucking do it."
echo

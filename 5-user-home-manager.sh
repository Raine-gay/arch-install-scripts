#!/usr/bin/env bash

# This is the user install of home-manager and needed gui components.
# Remember to add the user to the nix-users group via 'usermod -aG nix-users <username>'
# Run this ONLY in the user account that wants home-manager.

nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

# add nixGL
nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl && nix-channel --update
nix-env -iA nixgl.auto.nixGLDefault

# setup home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# allow nonfree nix software
mkdir $HOME/.config/nixpkgs/
echo "{ allowUnfree = true; }" >> $HOME/.config/nixpkgs/config.nix

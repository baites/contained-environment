# Arch ienv dockerfile template

# Base image
from archlinux

# Install package dependencies
run pacman --noconfirm -Syyu
run pacman --noconfirm -S git openssh sudo vim

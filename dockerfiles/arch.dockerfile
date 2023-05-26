# Arch ienv dockerfile template

# Base image
FROM archlinux

# Install package dependencies
RUN pacman --noconfirm -Syyu
RUN pacman --noconfirm -S git openssh sudo vim

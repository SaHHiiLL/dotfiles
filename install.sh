#!/bin/bash
pacman -S --needed base-devel

echo "installing Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "Installing Paru"
git clone https://aur.archlinux.org/paru.git ~/paru
cd ~/paru
makepkg -si

echo "Using Paru to install System Packages"
paru -Syu $(cat ./packages.txt)

echo "Installed All the packages -- to link the dot files run the command `stow .`"

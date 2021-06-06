#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

yay -S --noconfirm lightdm-settings
yay -S --noconfirm polybar
yay -S --noconfirm nerd-fonts-iosevka
yay -S --noconfirm ttf-icomoon-feather

echo "MAIN PACKAGES"

sleep 5

sudo pacman -S --noconfirm xorg \
    light-locker \
    lightdm \
    lightdm-webkit2-greeter \
    bspwm \
    sxhkd \
    firefox \
    alacritty \
    picom \
    nitrogen \
    lxappearance \
    dmenu \
    nautilus \
    arandr \
    alsa-utils \
    pulseaudio \
    pavucontrol \
    arc-gtk-theme \
    arc-icon-theme \
    vlc \
    dina-font tamsyn-font bdf-unifont ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid gnu-free-fonts ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts font-bh-ttf ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-code ttf-inconsolata ttf-jetbrains-mono ttf-monofur adobe-source-code-pro-fonts cantarell-fonts inter-font ttf-opensans gentium-plus-font ttf-junicode adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk noto-fonts-emoji ttf-font-awesome awesome-terminal-fonts \
    archlinux-wallpaper \
    rofi \
    playerctl \
    scrot \
    dunst \
    pacman-contrib

#sudo flatpak install -y spotify
#sudo flatpak install -y kdenlive

sudo systemctl enable lightdm

mkdir -p .config/{bspwm,sxhkd,dunst}

install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

printf "\e[1;32mCHANGE NECESSARY FILES BEFORE REBOOT\e[0m"

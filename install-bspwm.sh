#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

# sudo reflector -c Brazil -a 6 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -S --noconfirm --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

yay -S --noconfirm lightdm-settings
yay -S --noconfirm polybar
yay -S --noconfirm nerd-fonts-iosevka
yay -S --noconfirm ttf-icomoon-feather
yay -S --noconfirm spotify
yay -S --noconfirm neovim-nightly-bin xclip python-pynvim-git

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
    archlinux-wallpaper \
    rofi \
    playerctl \
    scrot \
    dunst \
    pacman-contrib

sudo pacman -S --noconfirm dina-font tamsyn-font bdf-unifont ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid gnu-free-fonts ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts ttf-roboto tex-gyre-fonts ttf-ubuntu-font-family ttf-anonymous-pro ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-mono ttf-hack ttf-fira-code ttf-inconsolata ttf-jetbrains-mono ttf-monofur adobe-source-code-pro-fonts cantarell-fonts inter-font ttf-opensans gentium-plus-font ttf-junicode adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk noto-fonts-emoji ttf-font-awesome awesome-terminal-fonts \

yay -S --noconfirm lightdm-webkit-theme-aether

# Set default lightdm greeter to lightdm-webkit2-greeter
# sudo sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf

sudo systemctl enable lightdm

mkdir -p ~/.config/{bspwm,sxhkd,dunst}

install -Dm755 /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
install -Dm644 /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc

git clone https://github.com/Aleosada/.dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
stow -vt ~ git
stow -vt ~ tmux
stow -vt ~ bspwm
stow -vt ~ sxhkd
stow -vt ~ polybar

printf "\e[1;32mCHANGE NECESSARY FILES BEFORE REBOOT\e[0m"

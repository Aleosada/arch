#!/bin/bash

ln -sf /usr/share/zoneinfo/Brazil/East /etc/localtime
timedatectl set-ntp true
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
sed -i '393s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd

sudo reflector -c Brazil -a 12 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

pacman -S --noconfirm grub \
    efibootmgr \
    networkmanager \
    network-manager-applet \
    dialog \
    wpa_supplicant \
    mtools \
    dosfstools \
    reflector \
    base-devel \
    linux-headers \
    avahi \
    xdg-user-dirs \
    xdg-utils \
    nfs-utils \
    inetutils \
    dnsutils \
    inetutils \
    alsa-utils \
    bash-completion \
    openssh \
    rsync \
    acpi \
    acpi_call \
    virt-manager \
    qemu \
    qemu-arch-extra \
    dnsmasq \
    edk2-ovmf \
    bridge-utils \
    vde2 \
    openbsd-netcat \
    ipset \
    firewalld \
    os-prober \
    ntfs-3g \
    terminus-font \
    gnupg \
    broadcom-wl \
    zsh \
    tmux \
    stow \
    tree \
    pass

pacman -S ebtables

# pacman -S --noconfirm xf86-video-amdgpu
pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld

useradd -m aleosada
echo aleosada:password | chpasswd
usermod -aG libvirt aleosada

echo "aleosada ALL=(ALL) ALL" >> /etc/sudoers.d/aleosada

sed -i '7s/()/(nvidia)/' /etc/mkinitcpio.conf
mkinitcpio -p linux

printf "\e[1;32mchange password for root and aleosada\n"
printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"

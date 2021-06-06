#!/bin/bash

git clone https://github.com/Aleosada/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
stow -vt ~ git
stow -vt ~ tmux
stow -vt ~ bspwm
stow -vt ~ polybar
stow -vt ~ nvim
stow -vt ~ sxhkd

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

yay -S --noconfirm nvm
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
source /usr/share/nvm/init-nvm.sh
nvm install --lts

yay -S --noconfirm docker
sudo systemctl enable docker

#!/bin/bash

git clone https://github.com/Aleosada/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
stow -vt ~ git
stow -vt ~ tmux
stow -vt ~ bspwm
stow -vt ~ sxhkd
stow -vt ~ polybar
stow -vt ~ nvim

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install Deno
curl -fsSL https://deno.land/x/install/install.sh | sh

# Install GoLang
yay -S --noconfirm go
go get github.com/mattn/efm-langserver

# Install NodeJS
yay -S --noconfirm nvm
source /usr/share/nvm/init-nvm.sh
nvm install --lts

npm install -g @angular/language-server
npm i -g bash-language-server
npm install -g vscode-css-languageserver-bin
npm install -g dockerfile-language-server-nodejs
npm install -g graphql-language-service-cli
npm install -g vscode-html-languageserver-bin
npm install -g vscode-json-languageserver
npm install -g pyright
npm i -g sql-language-server
npm install -g typescript typescript-language-server
npm install -g vim-language-server
npm install -g yaml-language-server

# Install lua-language-server
sudo pacman -S ninja
git clone https://github.com/sumneko/lua-language-server ~/Downloads/lua-language-server
cd ~/Download/lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

# Install dotnet and OmniSharp
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --install-dir /opt/dotnet -channel Current -version latest
yay -S --noconfirm omnisharp-roslyn-bin

# Install docker
yay -S --noconfirm docker
sudo systemctl enable docker
sudo usermod -a -G docker aleosada

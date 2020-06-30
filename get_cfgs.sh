#!/bin/zsh

ZSH_CUSTOM=/usr/share/oh-my-zsh/custom

cd /home/kuity/dotfiles 
if [ $? -ne 0 ]; then
  exit
fi

echo "Copying dotfiles"
# neovim
rm .config/nvim/*
cp ../.config/nvim/* .config/nvim/

# tmux
cp ../.tmux.conf .

# zsh
cp ../.zshrc .
cp $ZSH_CUSTOM/zsh_aliases.zsh .

# X
cp ../.Xresources .
cp ../.xinitrc .

# ranger
cp ../.config/ranger/rc.conf .config/ranger/

echo "Done copying dotfiles"

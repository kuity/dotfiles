#!/bin/zsh

source custom_cfg.zsh

cd $HOME/dotfiles 
if [ $? -ne 0 ]; then
  exit
fi

echo "Copying dotfiles"
# neovim
rm .config/nvim/*
cp $HOME/.config/nvim/*.vim $HOME/.config/nvim/*.json .config/nvim/

# tmux
cp $HOME/.tmux.conf .

# zsh custom scripts
cp $HOME/.zshrc .
cp $ZSH_CUSTOM/*.zsh ./zsh_custom/

# X
cp $HOME/.Xresources .
cp $HOME/.xinitrc .

# ranger
cp $HOME/.config/ranger/rc.conf .config/ranger/

echo "Done copying dotfiles"

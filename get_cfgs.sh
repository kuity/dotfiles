#!/bin/zsh

source ~/.zshrc
cd $HOME/dotfiles 
if [ $? -ne 0 ]; then
  exit
fi

echo "Copying dotfiles"
# neovim
echo "Copying neovim files"
rm .config/nvim/*
cp $HOME/.config/nvim/*.vim $HOME/.config/nvim/*.json .config/nvim/

# tmux
echo "Copying tmux config"
cp $HOME/.tmux.conf .

# zsh custom scripts
echo "zsh custom is $ZSH_CUSTOM"
echo "Copying zsh custom files"
cp $ZSH_CUSTOM/*.zsh ./zsh_custom/

# X
echo "Copying X files"
cp $HOME/.Xresources .
cp $HOME/.xinitrc .

# ranger
echo "Copying ranger config"
cp $HOME/.config/ranger/rc.conf .config/ranger/

echo "Done copying dotfiles"

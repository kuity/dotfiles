#!/bin/zsh

source ~/.zshrc
cd $HOME/dotfiles 
if [ $? -ne 0 ]; then
  exit
fi

echo "Copying dotfiles"

# neovim
echo "Copying vim files"
rm .config/nvim/*
cp $HOME/.config/nvim/* .config/nvim/
cp $HOME/.vimrc .

echo "Copying zsh files"
rm oh_my_zsh/*
cp $ZSH_CUSTOM/*.zsh oh_my_zsh/

# tmux
echo "Copying tmux config"
cp $HOME/.tmux.conf .

# X
echo "Copying X files"
cp $HOME/.Xresources .
cp $HOME/.xinitrc .

echo "Done copying dotfiles"

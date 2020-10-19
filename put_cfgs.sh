#!/bin/zsh

source ~/.zshrc

cd $HOME/dotfiles 
if [ $? -ne 0 ]; then
  exit
fi

echo "Putting dotfiles in dirs"

# neovim
echo "Putting neovim files"
mkdir -p $HOME/.config/nvim
cp .config/nvim/* $HOME/.config/nvim/
cp .vimrc $HOME/.vimrc

# tmux
echo "Putting tmux config"
cp .tmux.conf $HOME/

# zsh
echo "Putting zsh files"
sudo cp oh_my_zsh/* $ZSH_CUSTOM/

# X 
echo "Putting X config"
cp .Xresources $HOME/
cp .xinitrc $HOME/

echo "Done putting dotfiles in dirs"

#!/bin/zsh

source ~/.zshrc

cd $HOME/dotfiles 
if [ $? -ne 0 ]; then
  exit
fi

echo "Putting dotfiles in dirs"

#neovim
echo "Putting neovim files"
mkdir -p $HOME/.config/nvim
cp -R .config/nvim $HOME/.config/

# tmux
echo "Putting tmux config"
cp .tmux.conf $HOME/

# zsh
echo "Putting zshrc"
./touchup.sh
cp .zshrc $HOME/

# X 
echo "Putting X config"
cp .Xresources $HOME/
cp .xinitrc $HOME/

# ranger
echo "Putting ranger config"
mkdir -p $HOME/.config/ranger
cp -R .config/ranger/ $HOME/.config/ranger/


echo "Done putting dotfiles in dirs"
